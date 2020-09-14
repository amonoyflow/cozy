part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {}

class SearchLoaded extends SearchState {
  final int count;
  final List<SearchResult> result;
  final int resultCount;

  SearchLoaded({
    @required this.count,
    @required this.result,
    @required this.resultCount,
  });

  @override
  List<Object> get props => [count, result, resultCount];
}
