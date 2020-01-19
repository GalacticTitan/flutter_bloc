
import 'dart:convert';

import 'package:bloctest/models/search_podo.dart';


SearchPodo parseSearch(String responseBody) {
  var data = SearchPodo.fromJson(json.decode(responseBody));
  return data;
}