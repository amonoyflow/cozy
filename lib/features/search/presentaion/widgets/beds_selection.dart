import 'package:flutter/material.dart';

class BedSelection extends StatefulWidget {
  @override
  _BedSelectionState createState() => _BedSelectionState();
}

class _BedSelectionState extends State<BedSelection> {
  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [false, false, false, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: LayoutBuilder(builder: (context, constraints) {
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
          constraints:
              BoxConstraints.expand(width: (constraints.maxWidth / 5) - 8),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Text("1"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Text("2"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Text("3"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Text("4"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Text("5+"),
            ),
          ],
          onPressed: (index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = i == index;
              }
            });
          },
          isSelected: isSelected);
    }));
  }
}
