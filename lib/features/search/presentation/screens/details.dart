import 'package:cozy/features/search/domain/entities/search_result.dart';
import 'package:cozy/features/search/presentation/widgets/contact.dart';
import 'package:cozy/features/search/presentation/widgets/image_gallery.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  final SearchResult searchResult;

  Details({
    this.searchResult,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ImageGallery(),
          Positioned(
            top: 45.0,
            left: 14.0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black38,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            child: Positioned(
              top: MediaQuery.of(context).size.height / 2.3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child: Contact(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
