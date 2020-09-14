import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "All Apartments",
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
