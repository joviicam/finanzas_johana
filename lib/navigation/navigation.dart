import 'package:finanzas_johana/modules/home/home_screen.dart';
import 'package:finanzas_johana/modules/home/profile_screen.dart';
import 'package:finanzas_johana/navigation/map_sample.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, required this.nextButton});
  final bool nextButton;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late final SharedPreferences prefs;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _checkTutorial();
  }

  Future<void> _checkTutorial() async {
    prefs = await SharedPreferences.getInstance();
    final bool? tutorial = prefs.getBool('tutorial');
    if (tutorial == null) {
      Navigator.pushReplacementNamed(context, '/tutorial');
    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MapSample(),
    ProfileScreen()
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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromRGBO(242, 148, 165, 1),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
