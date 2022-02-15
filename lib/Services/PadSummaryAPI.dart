import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/PadSummaryModel.dart';
import '../globalConfig.dart';

Future<List<PadSummaryModel>> fetchPadSummaries(
    List<int> padIds, DateTime date) async {
  List<PadSummaryModel> padSummaries = [];

  for (var i = 0; i < padIds.length; i++) {
    await fetchPadSummary(padIds[i], date)
        .then((value) => padSummaries.add(value[0]));
  }

  return padSummaries;
}

Future<List<PadSummaryModel>> fetchPadSummary(int padId, DateTime date) async {
  String url = apiURL +
      'PadSummaries/Pad/' +
      padId.toString() +
      '?Date=' +
      date.toString().split(' ')[0];

  final response = await http.get(
    Uri.parse(url),
    headers: {
      "content-type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
      "Authorization": "Bearer " + authToken
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable list = json.decode(response.body);

    var padSummariesList =
        list.map((model) => PadSummaryModel.fromJson(model)).toList();

    return padSummariesList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load pad summaries');
  }
}
