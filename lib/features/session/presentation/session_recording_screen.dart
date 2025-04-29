import 'package:flutter/material.dart';

class SessionRecordingScreen extends StatelessWidget {
  const SessionRecordingScreen({Key? key}) : super(key: key);

  void onStopRecording(BuildContext context) {
    // Logic to stop recording
    // This could involve stopping a timer, saving the recording, etc.
    print('Recording stopped');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recording Session')),
      body: Center(
        child: const Text(
          'Recording in progress...',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => onStopRecording(context),
        label: const Text('Stop Recording'),
        icon: const Icon(Icons.stop),
      ),
    );
  }
}
