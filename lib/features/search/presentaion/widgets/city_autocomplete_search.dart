import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cozy/features/search/domain/entities/cities.dart';
import 'package:cozy/features/search/presentaion/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityAutoCompleteSearch extends StatefulWidget {
  @override
  _AutoCompleteSearchState createState() => _AutoCompleteSearchState();
}

class _AutoCompleteSearchState extends State<CityAutoCompleteSearch> {
  GlobalKey<AutoCompleteTextFieldState<Cities>> key = new GlobalKey();
  AutoCompleteTextField autoCompleteTextField;
  TextEditingController controller = TextEditingController();
  _AutoCompleteSearchState();

  void _loadData() async {
    await CityModels.loadCities();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: autoCompleteTextField = AutoCompleteTextField<Cities>(
        decoration: new InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 20.0,
          ),
          filled: true,
          hintText: 'City',
          fillColor: Colors.white,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.black38,
            height: 1.35,
          ),
        ),
        clearOnSubmit: false,
        key: key,
        suggestions: CityModels.cities,
        itemBuilder: (context, item) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  item.autocompleteterm,
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  item.country,
                )
              ],
            ),
          );
        },
        itemSubmitted: (item) {
          setState(() => autoCompleteTextField.textField.controller.text =
              item.autocompleteterm);
          BlocProvider.of<SearchBloc>(context)
            ..add(CitySearchChangedEvent(city: item.autocompleteterm));
        },
        itemSorter: (a, b) {
          return a.autocompleteterm.compareTo(b.autocompleteterm);
        },
        itemFilter: (item, query) {
          return item.autocompleteterm
              .toLowerCase()
              .startsWith(query.toLowerCase());
        },
        textChanged: (item) {
          BlocProvider.of<SearchBloc>(context)
            ..add(CitySearchChangedEvent(city: item));
        },
      ),
    );
  }
}
