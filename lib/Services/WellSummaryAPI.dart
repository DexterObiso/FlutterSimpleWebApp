import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../Model/WellSummaryModel.dart';

import 'package:http/http.dart' as http;

Future<List<WellSummaryModel>> fetchWellSummaries() async {
  List<int> padsIds = const [3069, 3073];

  final response = await http.post(
    Uri.parse(
        'https://afl-api-dev.uda.xomsvcs.com/api/WellSummaries/Pads?Date=2022-02-09'),
    headers: {
      "content-type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ik1yNS1BVWliZkJpaTdOZDFqQmViYXhib1hXMCIsImtpZCI6Ik1yNS1BVWliZkJpaTdOZDFqQmViYXhib1hXMCJ9.eyJhdWQiOiJmY2NhN2NiNS03M2Q5LTQxMmItYmIwNS0zMWM4ZTNjZGYxYTEiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9kMWVlMWFjZC1iYzdhLTRiYzQtYTc4Ny05MzhjNDlhODM5MDYvIiwiaWF0IjoxNjQ0NDUwMjU5LCJuYmYiOjE2NDQ0NTAyNTksImV4cCI6MTY0NDQ1NDE1OSwiYWlvIjoiQVNRQTIvOFRBQUFBZ252OXMrKzR0Nkh2TWVIbzhyOGdnakluNFlMTERuOEFQTnJseENXd29ibz0iLCJhbXIiOlsid2lhIl0sImZhbWlseV9uYW1lIjoiSGVtbWF0aSIsImdpdmVuX25hbWUiOiJBc2hrYW4iLCJpbl9jb3JwIjoidHJ1ZSIsImlwYWRkciI6IjEzNi4yMjguMjUxLjM4IiwibmFtZSI6IkhlbW1hdGksIEFzaGthbiIsIm5vbmNlIjoiN2VjMDBjMDItNDkzNy00MzQ4LWFmYzMtYTA0MWVhMmUxMjMyIiwib2lkIjoiZDA1ZTFhOTEtOGU3MC00MWJhLTg4YWEtZTNlNmVkZTI4MDE2Iiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MTcwMDEzMzMtMzQzODE4Mzk4LTE4MDE2NzQ1MzEtMTQ2ODUxNyIsInJoIjoiMC5BUklBelJydTBYcTh4RXVuaDVPTVNhZzVCclY4eXZ6WmN5dEJ1d1V4eU9QTjhhRVNBTGMuIiwicm9sZXMiOlsiQUZMQWRtaW4iXSwic3ViIjoiNjlnc0piY1lHMHJNRnB0TXFVSkhnUGlDLWo5V3ZpYnZ1SWJVbHpqT3F5WSIsInRpZCI6ImQxZWUxYWNkLWJjN2EtNGJjNC1hNzg3LTkzOGM0OWE4MzkwNiIsInVuaXF1ZV9uYW1lIjoiYXNoa2FuLmhlbW1hdGlAZXh4b25tb2JpbC5jb20iLCJ1cG4iOiJhc2hrYW4uaGVtbWF0aUBleHhvbm1vYmlsLmNvbSIsInV0aSI6InJ2ME4yM2tDZVVDWEdJS1U3OGdLQUEiLCJ2ZXIiOiIxLjAifQ.YqB08k0pCetbEfpChkAYVRvVRaksiCCTAL-JNH-R4OHa8nsNOxvH-1Nwx2tC_9RsGAqUwHzB0ce5PEpCPKqdRm76u5dZpWzqc7ScBK2EAW4GoycdLdCreHCLbNtxRnceZUGf924jbFYkBu-DIe2GM693bO4SEwFCv1BlDDPmyTNm9Tkqxy2jBlsSgs7q_lLr41MquMHb9AWzng63XrfE4vv6iluF5IvTY-C7KlnqBGYYZEgRqauH-WxI3MBd7jUcyfioV2H2kFaqN0MBJI2UEaswPmJvzrBnMIuwoDddYCD0re13t2rhTez163WpWkIYfMph6gBFzZqT1n8UANsPbA"
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
