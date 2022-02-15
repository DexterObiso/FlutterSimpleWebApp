import 'dart:async';
import 'dart:convert';
import '../Model/PadModel.dart';
import '../globalConfig.dart';

import 'package:http/http.dart' as http;

Future<List<PadModel>> fetchPads(int siteId) async {
  String url = apiURL + 'Pads/Site/' + siteId.toString();

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
    var padsList = list.map((model) => PadModel.fromJson(model)).toList();

    return padsList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load pads');
  }
}
