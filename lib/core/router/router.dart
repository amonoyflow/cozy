import 'package:cozy/features/navigation.dart';
import 'package:cozy/features/search/domain/entities/search_result.dart';
import 'package:cozy/features/search/presentation/screens/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Navigation());
      case "/result":
        var data = settings.arguments as List<SearchResult>;
        return MaterialPageRoute(builder: (_) => Result(searchResult: data));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
