import 'package:cozy/features/search/data/models/search_result_model.dart';
import 'package:cozy/core/service/service_base.dart';
import 'package:cozy/core/errors/exceptions.dart';
import 'dart:convert';
import 'dart:io';

abstract class SearchRemote {
  Future<List<SearchResultModel>> getSearchResult();
}

class SearchRemoteImpl extends ServiceBase implements SearchRemote {
  @override
  Future<List<SearchResultModel>> getSearchResult() async {
    final response = await http.get(
        "https://run.mocky.io/v3/efdf7d2a-ba0d-4d53-80da-9f96e9661509",
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == HttpStatus.ok) {
      return List<SearchResultModel>.from(
          json.decode(response.body).map((e) => SearchResultModel.fromJson(e)));
    } else {
      throw ServerException();
    }
  }
}
