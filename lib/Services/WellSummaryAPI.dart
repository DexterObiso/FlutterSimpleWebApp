import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_web_app/globalConfig.dart';

import '../Model/WellSummaryModel.dart';

import 'package:http/http.dart' as http;

Future<List<WellSummaryModel>> fetchWellSummaries(int padId) async {
  List<int> padsIds = [];
  padsIds.add(padId);

  final response = await http.post(
    Uri.parse(
        'https://afl-api-dev.uda.xomsvcs.com/api/WellSummaries/Pads?Date=2022-02-09'),
    headers: {
      "content-type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
      "Authorization": "Bearer " + auth_token
    },
    body: json.encode(padsIds),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable list = json.decode(response.body);

    var wellSummariesList =
        list.map((model) => WellSummaryModel.fromJson(model)).toList();

    return wellSummariesList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load well summaries');
  }
}
