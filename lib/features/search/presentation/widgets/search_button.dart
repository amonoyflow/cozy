import 'package:cozy/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Color(0xFF8080C0),
              textColor: Colors.white,
              child: SizedBox(
                height: 50.0,
                child: Center(
                  child: Text("Search (${state.count})"),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
