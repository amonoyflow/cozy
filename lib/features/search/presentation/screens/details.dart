import 'package:cozy/features/search/domain/entities/search_result.dart';
import 'package:cozy/features/search/presentation/widgets/image_gallery.dart';
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
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                ImageGallery(),
                Positioned(
                  top: 45.0,
                  left: 15.0,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
