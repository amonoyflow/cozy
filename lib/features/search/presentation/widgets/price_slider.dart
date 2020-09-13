import 'package:cozy/features/search/presentation/bloc/bedroom/bedroom_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/furnishing/furnishing_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/location/location_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/price/price_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/property/property_bloc.dart';
import 'package:cozy/features/search/presentation/bloc/search_bloc.dart';
import 'package:cozy/features/search/presentation/widgets/price_range_slider_thumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cozy/core/extensions/number_parsing.dart';

class PriceSlider extends StatefulWidget {
  final double minPrice;
  final double maxPrice;

  const PriceSlider({@required this.minPrice, @required this.maxPrice});

  @override
  _PriceSliderState createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  RangeValues priceValues;

  @override
  void initState() {
    priceValues = RangeValues(widget.minPrice, widget.maxPrice);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bedroomBloc = BlocProvider.of<BedroomBloc>(context);
    var furnishingBloc = BlocProvider.of<FurnishingBloc>(context);
    var propertyBloc = BlocProvider.of<PropertyBloc>(context);
    var locationBloc = BlocProvider.of<LocationBloc>(context);

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 2.0,
        rangeThumbShape: PriceRangeSliderThumb(),
        activeTrackColor: Color(0xFF8080C0),
        inactiveTrackColor: Colors.grey[400],
        valueIndicatorColor: Color(0xFF8080C0),
        rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.always,
        minThumbSeparation: 0,
      ),
      child: RangeSlider(
        values: priceValues,
        min: widget.minPrice,
        max: widget.maxPrice,
        divisions: 20,
        labels: RangeLabels(
          "${priceValues.start.toCurrency()}",
          "${priceValues.end.toCurrency()}",
        ),
        onChanged: (values) {
          setState(
            () {
              priceValues = values;
              BlocProvider.of<PriceBloc>(context)
                ..add(PriceRangeChangedEvent(priceRange: values));
              BlocProvider.of<SearchBloc>(context)
                ..add(SearchTappedEvent(
                  price: values,
                  property: propertyBloc.property,
                  bedroom: bedroomBloc.bedroom,
                  furnishing: furnishingBloc.furnishing,
                  location: locationBloc.location,
                ));
            },
          );
        },
      ),
    );
  }
}
