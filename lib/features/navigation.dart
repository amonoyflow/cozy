import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> with TickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          for (final item in NavigationItem.items) item.screen
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: [
          for (final item in NavigationItem.items)
            BottomNavigationBarItem(
              icon: item.icon,
              label: item.label,
            )
        ],
      ),
    );
  }
}

class NavigationItem {
  Widget screen;
  Icon icon;
  String label;

  NavigationItem({
    this.screen,
    this.label,
    this.icon
  });

  static List<NavigationItem> items = [
    NavigationItem(
      screen: Center(child: Text("Home")),
      icon: Icon(Icons.home),
      label: "Home",
    ),
    NavigationItem(
      screen: Center(child: Text("Search")),
      icon: Icon(Icons.search),
      label: "Search",
    ),
    NavigationItem(
      screen: Center(child: Text("Profile")),
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ];
}