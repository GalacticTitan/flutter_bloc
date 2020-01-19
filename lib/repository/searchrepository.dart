import 'package:bloctest/models/search_podo.dart';
import 'package:bloctest/services/apifetch.dart';
import 'package:flutter/widgets.dart';

class SearchRepository {

final ApiFetch apiFetch;

SearchRepository({@required this.apiFetch})
    : assert(apiFetch != null);

Future<SearchPodo> getSearchData(String query) async {
  return apiFetch.fetchSearchData( query );
}
}