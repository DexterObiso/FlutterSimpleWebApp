import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import '../Model/WellSummaryModel.dart';
import '../globalConfig.dart';

Future<List<WellSummaryModel>> fetchWellSummaries(
    List<int> padIds, DateTime date) async {
  String url =
      apiURL + 'WellSummaries/Pads?Date=' + date.toString().split(' ')[0];

  final response = await http.post(
    Uri.parse(url),
    headers: {
      "content-type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
      "Authorization": "Bearer " + authToken
    },
    body: json.encode(padIds),
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
