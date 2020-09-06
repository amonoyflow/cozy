import 'package:flutter/material.dart';

class PropertyInfo extends StatelessWidget {
  final String image;
  final String title;
  final String value;

  const PropertyInfo({
    this.image,
    this.title,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              this.image,
              height: 22.0,
            ),
            SizedBox(width: 5.0),
            Text(
              this.value,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          this.title,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[600],
          ),
        )
      ],
    );
  }
}
