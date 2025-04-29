import 'package:flutter/material.dart';

import 'package:sail_polar/features/navigation/navigation_page.dart';
import 'package:sail_polar/features/sessions/sessions_page.dart';
import 'package:sail_polar/features/settings/settings_page.dart';
import 'package:sail_polar/core/database/app_database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  await database.into(database.sessions).insert(SessionsCompanion.insert(
        name: 'todo: finish drift setup',
      ));
  List<Session> allItems = await database.select(database.sessions).get();

  print('items in database: $allItems');

  runApp(const MainApp());
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
    SessionsPage(),
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
