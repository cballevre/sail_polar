import 'package:flutter/material.dart';
import 'dart:io';

import 'package:nmea/nmea.dart' as nmea;
import 'package:sail_polar/nmea_sentence/temperature_sentence.dart';
import 'package:sail_polar/nmea_sentence/apparent_wind_sentence.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hello World!'),
              ElevatedButton(
                onPressed: _handleButtonClick,
                child: const Text('Click Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleButtonClick() {
    final decoder = nmea.NmeaDecoder();

    decoder.registerCustomChecksumSentence(
          ApparentWindSentence.id,
          (line) => ApparentWindSentence(raw: line),
        );
    decoder.
      registerCustomChecksumSentence(
          TemperatureSentence.id,
          (line) => TemperatureSentence(raw: line),
        );

    RawDatagramSocket.bind(InternetAddress.anyIPv4, 2000).then((
      RawDatagramSocket socket,
    ) {
      print('Datagram socket ready to receive');
      print('${socket.address.address}:${socket.port}');
      socket.listen((RawSocketEvent e) {
        Datagram? d = socket.receive();
        if (d == null) return;

        String message = new String.fromCharCodes(d.data).trim();
        print('Datagram from ${d.address.address}:${d.port}: ${message}');

        final sentence = decoder.decode(message);

        if (sentence is TemperatureSentence) {
          print('Current temperature ${sentence.temperature} °C');
        } else if (sentence is ApparentWindSentence) {
          print('Current apparent wind angle ${sentence.angle}°');
          print('Current tack direction ${sentence.tack}');
          print('Current apparent wind speed ${sentence.speed} knots');
          print('Current apparent wind speed ${sentence.speedMs} m/s');
          print('Current apparent wind speed ${sentence.speedkph} kph');
        } else {
          print('Unknown sentence: $sentence');
        }
        print('----------------------------------');
      });
    });
  }
}
