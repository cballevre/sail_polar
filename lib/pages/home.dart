import 'package:flutter/material.dart';
import 'package:sail_polar/pages/debug.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DebugPage()),
                );
              },
              child: const Text('Go to Debug Page'),
            ),
          ],
        ),
      ),
    );
  }
}
