import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import 'package:nmea/nmea.dart' as nmea;
import 'package:sail_polar/core/parser/temperature_sentence.dart';
import 'package:sail_polar/core/parser/apparent_wind_sentence.dart';
import 'package:sail_polar/core/parser/water_speed.dart';

@pragma('vm:entry-point')
void startCallback() {
  print("Foreground service started");
  FlutterForegroundTask.setTaskHandler(UDPForegroundTask());
}

// --- Foreground Task Handler ---
class UDPForegroundTask extends TaskHandler {
  RawDatagramSocket? _udpSocket;
  static const int udpPort = 2000;

  // Called when the task is started.
  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    print('onStart(starter: ${starter.name})');
    await _startListening();
  }

  Future<void> _startListening() async {
    try {
      _udpSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, udpPort);
      print('Listening for UDP packets on port $udpPort');

      _udpSocket?.listen((RawSocketEvent event) {
        if (event == RawSocketEvent.read) {
          final datagram = _udpSocket?.receive();
          if (datagram != null) {
            final message = String.fromCharCodes(datagram.data);
            print('Received UDP message: $message');
            _decodeNMEA(message);
          }
        }
      });
    } catch (e) {
      print('Failed to bind UDP socket: $e');
    }
  }

  void _decodeNMEA(String message) {
    final decoder = nmea.NmeaDecoder();

    decoder.registerCustomChecksumSentence(
      ApparentWindSentence.id,
      (line) => ApparentWindSentence(raw: line),
    );
    decoder.registerCustomChecksumSentence(
      TemperatureSentence.id,
      (line) => TemperatureSentence(raw: line),
    );
    decoder.registerCustomChecksumSentence(
      WaterSpeedSentence.id,
      (line) => WaterSpeedSentence(raw: line),
    );

    final sentence = decoder.decode(message);

    if (sentence is TemperatureSentence) {
      print('Current temperature ${sentence.temperature} °C');
    } else if (sentence is ApparentWindSentence) {
      print('Current apparent wind angle ${sentence.angle}°');
      print('Current tack direction ${sentence.tack}');
      print('Current apparent wind speed ${sentence.speed} knots');
      print('Current apparent wind speed ${sentence.speedMs} m/s');
      print('Current apparent wind speed ${sentence.speedkph} kph');
    } else if(sentence is WaterSpeedSentence) {
      print('Current boat speed thought water is ${sentence.waterSpeed} knots');
    } else {
      print('Unknown sentence: $sentence');
    }
  }

  // Called when the task is destroyed.
  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    print('onDestroy(isTimeout: $isTimeout)');
    _udpSocket?.close();
  }

  // Called when data is sent using `FlutterForegroundTask.sendDataToTask`.
  @override
  void onReceiveData(Object data) {
    print('onReceiveData: $data');
  }

  // Called when the notification button is pressed.
  @override
  void onNotificationButtonPressed(String id) {
    print('onNotificationButtonPressed: $id');
  }

  // Called when the notification itself is pressed.
  @override
  void onNotificationPressed() {
    print('onNotificationPressed');
  }

  // Called when the notification itself is dismissed.
  @override
  void onNotificationDismissed() {
    print('onNotificationDismissed');
  }

  @override
  void onRepeatEvent(DateTime timestamp) {
     print('onRepeatEvent');
    // _udpSocket?.close();
    // _startListening();
  }
}
