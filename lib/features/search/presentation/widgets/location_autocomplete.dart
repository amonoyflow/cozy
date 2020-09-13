import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cozy/features/search/domain/entities/city.dart';
import 'package:cozy/features/search/presentation/bloc/bedroom/bedroom_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/furnishing/furnishing_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/location/location_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/price/price_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/property/property_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationAutoComplete extends StatefulWidget {
  final List<City> cities;

  LocationAutoComplete({this.cities});

  @override
  _LocationAutoCompleteState createState() => _LocationAutoCompleteState();
}

class _LocationAutoCompleteState extends State<LocationAutoComplete> {
  GlobalKey<AutoCompleteTextFieldState<City>> key = new GlobalKey();
  AutoCompleteTextField autoCompleteTextField;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var propertyBloc = BlocProvider.of<PropertyBloc>(context);
    var furnishingBloc = BlocProvider.of<FurnishingBloc>(context);
    var priceBloc = BlocProvider.of<PriceBloc>(context);
    var bedroomBloc = BlocProvider.of<BedroomBloc>(context);

    return Container(
      height: 50.0,
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: autoCompleteTextField = AutoCompleteTextField<City>(
        decoration: new InputDecoration(
          prefixIcon: Icon(
            Icons.location_city,
            size: 18.0,
          ),
          filled: true,
          hintText: 'Location',
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF8080C0),
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF8080C0),
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.grey,
            height: 0.9,
          ),
        ),
        clearOnSubmit: true,
        key: key,
        suggestions: widget.cities,
        itemBuilder: (context, item) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.keyword,
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
          setState(() =>
              autoCompleteTextField.textField.controller.text = item.keyword);
          BlocProvider.of<LocationBloc>(context)
            ..add(LocationSearchChangedEvent(location: item.keyword));
          BlocProvider.of<SearchBloc>(context)
            ..add(SearchTappedEvent(
              location: item.keyword,
              bedroom: bedroomBloc.bedroom,
              property: propertyBloc.property,
              furnishing: furnishingBloc.furnishing,
              price: priceBloc.price,
            ));
        },
        itemSorter: (a, b) {
          return a.autocompleteterm.compareTo(b.keyword);
        },
        itemFilter: (item, query) {
          return item.keyword.toLowerCase().startsWith(query.toLowerCase());
        },
        textChanged: (item) {
          BlocProvider.of<LocationBloc>(context)
            ..add(LocationSearchChangedEvent(location: item));
          BlocProvider.of<SearchBloc>(context)
            ..add(SearchTappedEvent(
              location: item,
              bedroom: bedroomBloc.bedroom,
              property: propertyBloc.property,
              furnishing: furnishingBloc.furnishing,
              price: priceBloc.price,
            ));
        },
      ),
    );
  }
}
