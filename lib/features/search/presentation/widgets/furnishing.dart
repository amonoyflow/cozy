import 'package:cozy/features/search/presentation/bloc/furnishing/furnishing_bloc.dart';
import 'package:cozy/features/search/presentation/widgets/furnishing_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Furnishing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FurnishingBloc, FurnishingState>(
      builder: (context, state) {
        if (state is FurnishingLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Furnishing",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      state.furnishing,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: FurnishingSelection(
                  titles: ["Any", "Furnished", "Unfurnished", "Semi-Furnished"],
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
