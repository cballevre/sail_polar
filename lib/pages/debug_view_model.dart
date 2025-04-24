import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:nmea/nmea.dart' as nmea;
import 'package:sail_polar/nmea_sentence/temperature_sentence.dart';
import 'package:sail_polar/nmea_sentence/apparent_wind_sentence.dart';

class DebugModel extends ChangeNotifier {
  final List<String> _lines = [
    'Debug Page',
    'This page is used for debugging purposes.',
    'It will show the NMEA sentences received from the socket.'
  ];

  List<String> get lines => List.unmodifiable(_lines);

  void addLine(String line) {
    _lines.add(line);
    if (_lines.length > 100) {
      _lines.removeAt(0);
    }
    notifyListeners();
  }

  void connectToNmea() {
    final decoder = nmea.NmeaDecoder();

    decoder.registerCustomChecksumSentence(
      ApparentWindSentence.id,
      (line) => ApparentWindSentence(raw: line),
    );
    decoder.registerCustomChecksumSentence(
      TemperatureSentence.id,
      (line) => TemperatureSentence(raw: line),
    );

    RawDatagramSocket.bind(InternetAddress.anyIPv4, 2000).then((socket) {
      addLine('Datagram socket ready to receive');
      addLine('${socket.address.address}:${socket.port}');

      socket.listen((RawSocketEvent e) {
        Datagram? d = socket.receive();
        if (d == null) return;

        String message = String.fromCharCodes(d.data).trim();
        addLine(message);

        final sentence = decoder.decode(message);

        if (sentence is TemperatureSentence) {
          addLine('Current temperature ${sentence.temperature} °C');
        } else if (sentence is ApparentWindSentence) {
          addLine('Current apparent wind angle ${sentence.angle}°');
          addLine('Current tack direction ${sentence.tack}');
          addLine('Current apparent wind speed ${sentence.speed} knots');
        } else {
          addLine('Unknown sentence: $sentence');
        }
      });
    });
  }
}
