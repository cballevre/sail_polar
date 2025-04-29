import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:sail_polar/core/task/udp_foreground_task.dart';

class SessionRecordingScreen extends StatefulWidget {
  const SessionRecordingScreen({Key? key}) : super(key: key);

  @override
  _SessionRecordingScreenState createState() => _SessionRecordingScreenState();
}

class _SessionRecordingScreenState extends State<SessionRecordingScreen> {
  bool isRecording = false;
  final ValueNotifier<Object?> _taskDataListenable = ValueNotifier(null);

  Future<void> _requestPermissions() async {
    // Android 13+, you need to allow notification permission to display foreground service notification.
    //
    // iOS: If you need notification, ask for permission.
    final NotificationPermission notificationPermission =
        await FlutterForegroundTask.checkNotificationPermission();
    if (notificationPermission != NotificationPermission.granted) {
      await FlutterForegroundTask.requestNotificationPermission();
    }

    if (Platform.isAndroid) {
      // Android 12+, there are restrictions on starting a foreground service.
      //
      // To restart the service on device reboot or unexpected problem, you need to allow below permission.
      if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
        // This function requires `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` permission.
        await FlutterForegroundTask.requestIgnoreBatteryOptimization();
      }
    }
  }

  void _initService() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'foreground_service',
        channelName: 'Foreground Service Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        onlyAlertOnce: true,
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: false,
        playSound: false,
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.repeat(5000),
        autoRunOnBoot: true,
        autoRunOnMyPackageReplaced: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  void _onReceiveTaskData(Object data) {
    print('onReceiveTaskData: $data');
    _taskDataListenable.value = data;
  }

  void _incrementCount() {
    FlutterForegroundTask.sendDataToTask(
      UDPForegroundTask.incrementCountCommand,
    );
  }

  @override
  void initState() {
    super.initState();
    // Add a callback to receive data sent from the TaskHandler.
    FlutterForegroundTask.addTaskDataCallback(_onReceiveTaskData);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Request permissions and initialize the service.
      _requestPermissions();
      _initService();
    });
  }

  Future<ServiceRequestResult> onStartRecording() async {
    // Logic to start recording
    // This could involve starting a timer, initializing a recording session, etc.
    print('Recording started');
    setState(() {
      isRecording = true;
    });
    if (await FlutterForegroundTask.isRunningService) {
      return FlutterForegroundTask.restartService();
    } else {
      print('Starting foreground service');
      return FlutterForegroundTask.startService(
        serviceId: 256,
        notificationTitle: 'Foreground Service is running',
        notificationText: 'Tap to return to the app',
        notificationIcon: null,
        notificationButtons: [
          const NotificationButton(id: 'btn_hello', text: 'hello'),
        ],
        callback: startCallback,
      );
    }
  }

  Future<ServiceRequestResult> onStopRecording() {
    // Logic to stop recording
    // This could involve stopping a timer, saving the recording, etc.
    setState(() {
      isRecording = false;
    });
    print('Recording stopped');
    // Navigator.of(context).pop();
    return FlutterForegroundTask.stopService();
  }

  @override
  Widget build(BuildContext context) {
    return WithForegroundTask(
      child: Scaffold(
        appBar: AppBar(title: const Text('Recording Session')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isRecording
                    ? 'Recording in progress...'
                    : 'Press the button to start recording.',
                style: TextStyle(fontSize: 18),
              ),
              if (isRecording)
                ElevatedButton(
                  onPressed: _incrementCount,
                  child: Text('Increment Count'),
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: isRecording ? onStopRecording : onStartRecording,
          label: Text(isRecording ? 'Stop Recording' : 'Start Recording'),
          icon: Icon(isRecording ? Icons.stop : Icons.play_arrow),
        ),
      ),
    );
  }
}
