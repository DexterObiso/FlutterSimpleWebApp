import 'dart:async';
import 'dart:convert';
import 'package:flutter_simple_web_app/globalConfig.dart';

import '../Model/PadModel.dart';

import 'package:http/http.dart' as http;

Future<List<PadModel>> fetchPads(int siteId) async {
  final response = await http.get(
      Uri.parse('https://afl-api-dev.uda.xomsvcs.com/api/Pads/Site/' +
          siteId.toString()),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
        "Authorization": "Bearer " + auth_token
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
