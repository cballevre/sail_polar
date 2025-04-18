import 'package:flutter/material.dart';
import 'dart:io';

import 'package:nmea/nmea.dart' as nmea;
import 'package:sail_polar/nmea_sentence/temperature_sentence.dart';
import 'package:sail_polar/nmea_sentence/apparent_wind_sentence.dart';

class DebugPage extends StatefulWidget {
  DebugPage({super.key});

  final List<String> lines = [
    'Debug Page',
    'This page is used for debugging purposes.',
    'It will show the NMEA sentences received from the socket.'
  ];

  @override
  _DebugPageState createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {

    @override
  void initState() {
    super.initState();
    _connectedToNmea();
  }

  void _connectedToNmea() {
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
        setState(() {
          widget.lines.add('Datagram socket ready to receive');
          widget.lines.add('${socket.address.address}:${socket.port}');
        });

      socket.listen((RawSocketEvent e) {
        Datagram? d = socket.receive();
        if (d == null) return;

        String message = new String.fromCharCodes(d.data).trim();
        setState(() {
          widget.lines.add(message);
        });

        final sentence = decoder.decode(message);

        if (sentence is TemperatureSentence) {
          setState(() {
            widget.lines.add('Current temperature ${sentence.temperature} °C');
          });
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

        if (widget.lines.length > 100) {
          setState(() {
            widget.lines.removeAt(0);
          });
        }
        print(widget.lines.length);
        print('----------------------------------');
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Widget'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widget.lines.map((line) => Expanded(child: Text(line))).toList(),
        ),
      ),
        );
  }
}