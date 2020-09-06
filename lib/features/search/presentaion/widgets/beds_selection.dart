import 'package:cozy/features/search/presentaion/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BedSelection extends StatefulWidget {
  @override
  _BedSelectionState createState() => _BedSelectionState();
}

class _BedSelectionState extends State<BedSelection> {
  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false, false, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ToggleButtons(
            borderColor: Color(0xFF8080C0),
            fillColor: Color(0xFF8080C0),
            borderWidth: 2.0,
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
            ),
            selectedBorderColor: Color(0xFF8080C0),
            selectedColor: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            constraints: BoxConstraints.expand(
                width: (constraints.maxWidth / 5) - 8, height: 45),
            children: [
              Text("Any"),
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
            ],
            onPressed: (index) {
              setState(
                () {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                    BlocProvider.of<SearchBloc>(context)
                      ..add(BedroomsChangedEvent(bedrooms: index.toString()));
                  }
                },
              );
            },
            isSelected: isSelected,
          );
        },
      ),
    );
  }
}
