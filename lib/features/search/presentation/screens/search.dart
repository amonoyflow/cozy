import 'package:cozy/core/locator.dart';
import 'package:cozy/features/search/presentation/bloc/search_bloc.dart';
import 'package:cozy/features/search/presentation/widgets/beds.dart';
import 'package:cozy/features/search/presentation/widgets/furnishing.dart';
import 'package:cozy/features/search/presentation/widgets/location.dart';
import 'package:cozy/features/search/presentation/widgets/price.dart';
import 'package:cozy/features/search/presentation/widgets/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
          child: Column(
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
                create: (_) => locator<SearchBloc>()
                  ..add(LocationSearchChangedEvent(location: "Any")),
                child: Location(),
              ),
              SizedBox(height: 20.0),
              BlocProvider(
                create: (_) => locator<SearchBloc>()
                  ..add(PriceRangeChangedEvent(
                      priceRange: RangeValues(0, 100000))),
                child: Price(),
              ),
              SizedBox(height: 10.0),
              BlocProvider(
                create: (_) => locator<SearchBloc>()
                  ..add(BedroomsChangedEvent(bedrooms: "Any", index: 0)),
                child: Beds(),
              ),
              SizedBox(height: 25.0),
              BlocProvider(
                create: (_) => locator<SearchBloc>()
                  ..add(PropertyChangedEvent(property: "Any", index: 0)),
                child: Property(),
              ),
              SizedBox(height: 25.0),
              BlocProvider(
                create: (_) => locator<SearchBloc>()
                  ..add(FurnishingChangedEvent(furnishing: "Any", index: 0)),
                child: Furnishing(),
              ),
              SizedBox(height: 25.0),
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
        ),
      ),
    );
  }
}
