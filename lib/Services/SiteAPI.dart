import 'dart:async';
import 'dart:convert';
import '../Model/SiteModel.dart';

import 'package:http/http.dart' as http;

import '../globalConfig.dart';

Future<List<SiteModel>> fetchSites() async {
  String url = apiURL + 'Sites/';

  final response = await http.get(Uri.parse(url), headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
    "Authorization": "Bearer " + authToken
  });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable list = json.decode(response.body);
    var sitesList = list.map((model) => SiteModel.fromJson(model)).toList();

    return sitesList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load sites');
  }
}
