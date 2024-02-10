import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentTab = 0;
  int _currentMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Text('Now on tab $_currentTab, menu $_currentMenu'),
      ),
      drawer: NavigationDrawer(
        selectedIndex: _currentMenu,
        onDestinationSelected: (index) {
          setState(() {
            _currentMenu = index;
          });
          Navigator.pop(context);
        },
        children: const [
          DrawerHeader(
            child: Text('Header'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.calendar_month),
            label: Text('Calendar'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.apps),
            label: Text('Apps'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.account_circle),
            label: Text('Profile'),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTab,
        onDestinationSelected: (index) {
          setState(() {
            _currentTab = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.calendar_month)),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.apps),
            label: 'Apps',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
