import 'package:cozy/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertySelection extends StatefulWidget {
  final int current;
  final List<String> titles;
  final Color color;
  final Color secondaryColor;

  const PropertySelection({
    this.titles,
    this.current,
    this.color,
    this.secondaryColor,
  });

  @override
  _PropertySelectionState createState() => _PropertySelectionState();
}

class _PropertySelectionState extends State<PropertySelection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _buttonList(),
      ),
    );
  }

  List<Widget> _buttonList() {
    final buttons = <Widget>[];
    for (int i = 0; i < widget.titles.length; i++) {
      buttons.add(_button(widget.titles[i], i));
    }
    return buttons;
  }

  Widget _button(String title, int index) {
    if (index == widget.current)
      return _activeButton(title);
    else
      return _inActiveButton(title, index);
  }

  Widget _activeButton(String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        decoration: BoxDecoration(
            color: widget.secondaryColor,
            border: Border.all(width: 2.0, color: widget.secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          title,
          style: TextStyle(
            color: widget.color,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _inActiveButton(String title, int index) {
    return InkWell(
      onTap: () {
        BlocProvider.of<SearchBloc>(context)
          ..add(PropertyChangedEvent(property: title, index: index));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        decoration: BoxDecoration(
            color: widget.color,
            border: Border.all(
              width: 2.0,
              color: widget.secondaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
