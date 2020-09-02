import 'package:cozy/features/search/presentaion/bloc/search_bloc.dart';
import 'package:cozy/features/search/presentaion/widgets/price_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cozy/core/extensions/number_parsing.dart';

class Price extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is PriceRangeLoaded) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Text(
                "Price",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            PriceSlider(
              minPrice: 0,
              maxPrice: 100000,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "from: ",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: "₱${state.priceRange.start.toCurrency()}",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ))
                    ]),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "to: ",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: "₱${state.priceRange.end.toCurrency()}",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ))
                    ]),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      return Container();
    });
  }
}
