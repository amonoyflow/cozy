import 'package:cozy/core/router/navigation_routes.dart';
import 'package:cozy/features/search/domain/entities/search_result.dart';
import 'package:cozy/features/search/presentation/widgets/property_info.dart';
import 'package:flutter/material.dart';
import 'package:cozy/core/extensions/number_parsing.dart';

class Result extends StatelessWidget {
  final List<SearchResult> searchResult;

  Result({
    this.searchResult,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "${searchResult.length} properties found",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            child: Icon(
              Icons.arrow_back,
              size: 34.0,
              color: Color(0xFF8080C0),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF6F6F6),
      body: result(),
    );
  }

  Widget result() {
    return ListView.builder(
      itemCount: searchResult.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              searchDetailsRoute,
              arguments: searchResult[index],
            );
          },
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          child: Image.network(
                            "https://techcrunch.com/wp-content/uploads/2018/09/zumper-apt.jpeg?w=730&crop=1",
                            fit: BoxFit.fill,
                            height: 230.0,
                            width: MediaQuery.of(context).size.width,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                        Positioned(
                          bottom: 5.0,
                          left: 5.0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 15.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.black38,
                            ),
                            child: Text(
                              searchResult[index].price.toCurrency(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/pin.png",
                                height: 22.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                searchResult[index].location,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PropertyInfo(
                                image: "assets/images/bed.png",
                                title: "Bedrooms",
                                value: searchResult[index].beds,
                              ),
                              PropertyInfo(
                                image: "assets/images/bath.png",
                                title: "Bathrooms",
                                value: searchResult[index].bathrooms,
                              ),
                              PropertyInfo(
                                image: "assets/images/floor.png",
                                title: "Floor Area",
                                value: searchResult[index].floorArea,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
