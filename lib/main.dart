import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sail_polar/core/task/udp_foreground_task.dart';
import 'package:sail_polar/features/navigation/navigation_page.dart';
import 'package:sail_polar/features/session/presentation/session_list_screen.dart';
import 'package:sail_polar/features/settings/settings_page.dart';
import 'package:sail_polar/core/database/app_database.dart';
import 'package:sail_polar/features/session/data/session_dao.dart';
import 'package:sail_polar/features/session/domain/session_repository.dart';
import 'package:sail_polar/features/session/presentation/session_view_model.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';


void main() {
  final database = AppDatabase();
  final sessionRepository = SessionRepository(sessionDao: SessionDao(database));

  // Initialize port for communication between TaskHandler and UI.
  FlutterForegroundTask.initCommunicationPort();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SessionViewModel(repository: sessionRepository),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    NavigationPage(),
    SessionListScreen(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Sessions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
