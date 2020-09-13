import 'package:cozy/features/search/presentation/bloc/property/property_bloc.dart';
import 'package:cozy/features/search/presentation/widgets/property_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyBloc, PropertyState>(
      builder: (context, state) {
        if (state is PropertyLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Property Type",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      state.property,
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
                child: PropertySelection(
                  titles: ["Any", "Apartment", "Condo", "Townhouse", "Villa"],
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
