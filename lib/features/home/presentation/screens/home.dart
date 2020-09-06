import 'package:cozy/core/locator.dart';
import 'package:cozy/features/home/presentation/bloc/home_bloc.dart';
import 'package:cozy/features/home/presentation/widgets/property_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cozy/core/extensions/number_parsing.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF6F6F6),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Expanded(
              child: BlocProvider(
            create: (_) => locator<HomeBloc>()..add(InitialProperties()),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20.0),
                    itemCount: state.properties.length,
                    itemBuilder: (context, index) {
                      return Container(
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
                          ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                      bottomRight: Radius.circular(15.0)),
                                ),
                                Positioned(
                                  bottom: 5.0,
                                  left: 5.0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 15.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.black38),
                                    child: Text(
                                      state.properties[index].price
                                          .toCurrency(),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/pin.png",
                                          height: 22.0),
                                      SizedBox(width: 5.0),
                                      Text(
                                        state.properties[index].location,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      PropertyInfo(
                                        image: "assets/images/bed.png",
                                        title: "Bedrooms",
                                        value: state.properties[index].beds
                                            .toString(),
                                      ),
                                      PropertyInfo(
                                        image: "assets/images/bath.png",
                                        title: "Bathrooms",
                                        value: state.properties[index].bathrooms
                                            .toString(),
                                      ),
                                      PropertyInfo(
                                        image: "assets/images/floor.png",
                                        title: "Floor Area",
                                        value: state.properties[index].floorArea
                                            .toString(),
                                      )
                                    ],
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
                return Container();
              },
            ),
          ))
        ],
      ),
    );
  }
}
