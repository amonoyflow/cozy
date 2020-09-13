import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        "What are you looking for?",
        style: TextStyle(
          fontSize: 46.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
