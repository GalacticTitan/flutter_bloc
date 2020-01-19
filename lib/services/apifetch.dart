import 'dart:convert';

import 'package:bloctest/models/search_podo.dart';
import 'package:bloctest/services/apiparse.dart';
import 'package:bloctest/services/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiFetch {
  var client;

  ApiFetch() {
    client = http.Client();
  }

  Future<SearchPodo> fetchSearchData(String search) async {
    final response = await client.get(AppConstants.search + search);
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch data");
    }
    final data = await compute(parseSearch, response.body.toString());
    return data;
  }
}


