import 'package:cozy/features/search/presentaion/bloc/search_bloc.dart';
import 'package:cozy/features/search/presentaion/widgets/price_range_slider_thumb.dart';
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
    return SliderTheme(
      data: SliderThemeData(
          trackHeight: 2.0,
          rangeThumbShape: PriceRangeSliderThumb(),
          activeTrackColor: Color(0xFF8080C0),
          inactiveTrackColor: Colors.grey[400],
          valueIndicatorColor: Color(0xFF8080C0),
          rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
          showValueIndicator: ShowValueIndicator.always,
          minThumbSeparation: 0),
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
          setState(() {
            priceValues = values;
            BlocProvider.of<SearchBloc>(context)
              ..add(PriceRangeChangedEvent(priceRange: values));
          });
        },
      ),
    );
  }
}
