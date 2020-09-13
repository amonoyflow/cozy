import 'package:cozy/core/locator.dart';
import 'package:cozy/features/search/presentation/bloc/bedroom/bedroom_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/furnishing/furnishing_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/location/location_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/price/price_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/property/property_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/search_bloc.dart';
import 'package:cozy/features/search/presentation/widgets/beds.dart';
import 'package:cozy/features/search/presentation/widgets/furnishing.dart';
import 'package:cozy/features/search/presentation/widgets/location.dart';
import 'package:cozy/features/search/presentation/widgets/price.dart';
import 'package:cozy/features/search/presentation/widgets/property_type.dart';
import 'package:cozy/features/search/presentation/widgets/search_button.dart';
import 'package:cozy/features/search/presentation/widgets/search_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) => locator<LocationBloc>()
                  ..add(LocationSearchChangedEvent(location: "Any"))),
            BlocProvider(
                create: (_) => locator<PriceBloc>()
                  ..add(PriceRangeChangedEvent(
                      priceRange: RangeValues(0, 100000)))),
            BlocProvider(
                create: (_) => locator<BedroomBloc>()
                  ..add(BedroomsChangedEvent(bedrooms: "Any", index: 0))),
            BlocProvider(
                create: (_) => locator<PropertyBloc>()
                  ..add(PropertyChangedEvent(property: "Any", index: 0))),
            BlocProvider(
                create: (_) => locator<FurnishingBloc>()
                  ..add(FurnishingChangedEvent(furnishing: "Any", index: 0))),
            BlocProvider(
                create: (_) =>
                    locator<SearchBloc>()..add(SearchTappedEvent(bedroom: 0))),
          ],
          child: searchForm(),
        ),
      ),
    );
  }

  Widget searchForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
      child: Column(
        children: [
          SearchHeader(),
          SizedBox(height: 25.0),
          Location(),
          SizedBox(height: 25.0),
          Price(),
          SizedBox(height: 10.0),
          Beds(),
          SizedBox(height: 25.0),
          PropertyType(),
          SizedBox(height: 25.0),
          Furnishing(),
          SizedBox(height: 25.0),
          SearchButton(),
        ],
      ),
    );
  }
}
