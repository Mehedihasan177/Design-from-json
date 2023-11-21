import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/data/model/api_response.dart';
import '../models/jsonTask_model.dart';

class FetchDataServices {
  Future<Response<List<AndroidVerison>>?> fetchData(
      {required String outputType}) async {
    Response<List<AndroidVerison>>? jsonResponse;
    try {
      String jsonContent = await rootBundle.loadString(outputType == "outputOne"
          ? 'assets/json_file/output_one.json'
          : 'assets/json_file/output_two.json');
      List<dynamic> jsonData = json.decode(jsonContent);

      List<AndroidVerison> androidVersions = [];

      for (var item in jsonData) {
        if (item is Map<String, dynamic>) {
          // Handle the case when the item is a Map
          item.forEach((key, value) {
            androidVersions.add(AndroidVerison(
              id: value['id'],
              title: value['title'],
            ));
          });
        } else if (item is List) {
          // Handle the case when the item is a List
          androidVersions.addAll(item.map((e) => AndroidVerison(
                id: e['id'],
                title: e['title'],
              )));
        }
      }
      jsonResponse = Response.success(androidVersions);
    } catch (error) {
      jsonResponse = Response.error("Error loading data from file", 500);
    }
    return jsonResponse;
  }
}
