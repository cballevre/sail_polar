import 'package:flutter/material.dart';
import 'dart:io';

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
      });
    });
  }
}
