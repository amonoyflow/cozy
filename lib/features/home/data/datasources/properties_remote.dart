import 'dart:convert';
import 'dart:io';
import 'package:cozy/core/errors/exceptions.dart';
import 'package:cozy/core/service/service_base.dart';
import 'package:cozy/features/home/data/models/property_model.dart';

abstract class PropertiesRemote {
  Future<List<PropertyModel>> getAllProperties();
}

class PropertiesRemoteImpl extends ServiceBase implements PropertiesRemote {
  @override
  Future<List<PropertyModel>> getAllProperties() async {
    final response = await http.get(
        "https://run.mocky.io/v3/efdf7d2a-ba0d-4d53-80da-9f96e9661509",
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == HttpStatus.ok) {
      return List<PropertyModel>.from(
          json.decode(response.body).map((e) => PropertyModel.fromJson(e)));
    } else {
      throw ServerException();
    }
  }
}
