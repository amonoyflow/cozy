import 'package:cozy/features/search/presentaion/bloc/search_bloc.dart';
import 'package:cozy/features/search/presentaion/widgets/beds_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Beds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is PriceRangeLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Text(
                  "Bedrooms",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              BedSelection(),
            ],
          );
        }
        return Container();
      },
    );
  }
}
