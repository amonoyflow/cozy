import 'package:cozy/core/router/router.dart';
import 'package:cozy/core/router/routes.dart';
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
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
