import 'package:cozy/core/locator.dart';
import 'package:cozy/features/search/presentaion/bloc/search_bloc.dart';
import 'package:cozy/features/search/presentaion/widgets/beds.dart';
import 'package:cozy/features/search/presentaion/widgets/price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF6F6F6),
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
      child: Column(
        children: [
          BlocProvider(
            create: (_) => locator<SearchBloc>()
              ..add(PriceRangeChangedEvent(priceRange: RangeValues(0, 100000))),
            child: Price(),
          ),
          SizedBox(height: 35.0),
          BlocProvider(
            create: (_) => locator<SearchBloc>()
              ..add(PriceRangeChangedEvent(priceRange: RangeValues(0, 100000))),
            child: Beds(),
          ),
        ],
      ),
    );
  }
}