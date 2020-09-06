import 'package:cozy/core/locator.dart';
import 'package:cozy/features/search/presentaion/bloc/search_bloc.dart';
import 'package:cozy/features/search/presentaion/widgets/beds.dart';
import 'package:cozy/features/search/presentaion/widgets/city.dart';
import 'package:cozy/features/search/presentaion/widgets/price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "What are you looking for?",
              style: TextStyle(
                fontSize: 46.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 25.0),
          BlocProvider(
            create: (_) =>
                locator<SearchBloc>()..add(CitySearchChangedEvent(city: "Any")),
            child: City(),
          ),
          SizedBox(height: 25.0),
          BlocProvider(
            create: (_) => locator<SearchBloc>()
              ..add(PriceRangeChangedEvent(priceRange: RangeValues(0, 100000))),
            child: Price(),
          ),
          SizedBox(height: 25.0),
          BlocProvider(
            create: (_) => locator<SearchBloc>()
              ..add(BedroomsChangedEvent(bedrooms: "Any")),
            child: Beds(),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Color(0xFF8080C0),
              textColor: Colors.white,
              child: SizedBox(
                height: 50.0,
                child: Center(
                  child: Text("Search"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
