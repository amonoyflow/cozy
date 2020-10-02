import 'package:cozy/core/router/navigation_router.dart';
import 'package:cozy/core/router/navigation_routes.dart';
import 'package:flutter/material.dart';
import 'package:cozy/core/locator.dart';

void main() {
  initializedLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cozy Rent',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRouter.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
