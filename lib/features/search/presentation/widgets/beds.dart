import 'package:cozy/features/search/presentation/bloc/search_bloc.dart';
import 'package:cozy/features/search/presentation/widgets/beds_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Beds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is BedroomsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bedrooms",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      state.bedrooms,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: BedSelection(
                  titles: ["Any", "1", "2", "3", "4"],
                  color: Colors.white,
                  secondaryColor: Color(0xFF8080C0),
                  current: state.index,
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
