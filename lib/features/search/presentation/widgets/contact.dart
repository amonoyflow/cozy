import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                    radius: 22.0,
                  ),
                  SizedBox(width: 8.0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Florante Amonoy Jr",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Owner",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF6F6F6),
                    ),
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.phone,
                      size: 20.0,
                    ),
                  ),
                  onTap: () {
                    launch("tel:+63 9958679272");
                  },
                ),
                SizedBox(width: 5.0),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF6F6F6),
                    ),
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.message,
                      size: 20.0,
                    ),
                  ),
                  onTap: () {
                    launch("sms:+63 9958679272");
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
