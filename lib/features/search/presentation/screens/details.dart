import 'package:cozy/features/search/domain/entities/search_result.dart';
import 'package:cozy/features/search/presentation/widgets/property_details.dart';
import 'package:cozy/features/search/presentation/widgets/property_gallery.dart';
import 'package:flutter/material.dart';

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
          PropertyGallery(),
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
                  Icons.keyboard_backspace,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 45.0,
            right: 14.0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black38,
                ),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.2,
            child: PropertyDetails(searchResult: searchResult),
          ),
        ],
      ),
    );
  }
}
