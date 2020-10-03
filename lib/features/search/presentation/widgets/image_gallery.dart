import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ImageGallery extends StatefulWidget {
  @override
  _MyImageGallery createState() => _MyImageGallery();
}

class _MyImageGallery extends State<ImageGallery> {
  var imgList = [
    "https://88designbox.com/upload/2016/10/10/small-one-bedroom-apartment-02.jpg",
    "https://q-xx.bstatic.com/xdata/images/hotel/840x460/141805669.jpg?k=588709820e526d66e30deab1bfe51741f48cb6becff5413c89cac726ad9bf6f0&o=",
    "https://cdn.home-designing.com/wp-content/uploads/2017/11/natural-wood-flooring.jpg"
  ];

  SwiperController controller;
  List<bool> autoplayes;
  List<SwiperController> controllers;
  List<String> widgetList = [];

  @override
  void initState() {
    controller = new SwiperController();
    autoplayes = new List()
      ..length = imgList.length
      ..fillRange(0, 3, false);
    controllers = new List()
      ..length = imgList.length
      ..fillRange(0, 3, new SwiperController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Swiper(
            loop: true,
            itemCount: imgList.length,
            controller: controller,
            pagination: SwiperPagination(
              margin: const EdgeInsets.only(bottom: 45.0),
              builder: DotSwiperPaginationBuilder(
                activeColor: Color(0xff38547C),
                size: 8.0,
                activeSize: 10.0,
              ),
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imgList[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
