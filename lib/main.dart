import 'package:enduro_diagnostics_map/features/diagnostics/widgets/diagnostics_tab.dart';
import 'package:enduro_diagnostics_map/features/settings/widgets/settings_tab.dart';
import 'package:enduro_diagnostics_map/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: extract theme settings to a separate file
      theme: ThemeData.dark().copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primaryColor: mainColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DiagnosticsTab(),
    SettingsTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: mainColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_checkmark),
            label: 'Диагностика',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Настройки',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
