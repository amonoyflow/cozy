import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.8,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                        radius: 18.0,
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
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.black12,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "3",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          "Bedrooms",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.black12,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "1",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          "Bathrooms",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.black12,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "75",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          "Floor Area",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "From Owner",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Features",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
