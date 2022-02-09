import 'dart:async';
import 'dart:convert';
import '../Model/WellSummaryModel.dart';

import 'package:http/http.dart' as http;

Future<List<WellSummaryModel>> fetchWellSummaries() async {
  final response = await http.get(
      Uri.parse(
          'https://afl-api-dev.uda.xomsvcs.com/api/WellSummaries/Pads?Date=2022-02-09/'),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ik1yNS1BVWliZkJpaTdOZDFqQmViYXhib1hXMCIsImtpZCI6Ik1yNS1BVWliZkJpaTdOZDFqQmViYXhib1hXMCJ9.eyJhdWQiOiJmY2NhN2NiNS03M2Q5LTQxMmItYmIwNS0zMWM4ZTNjZGYxYTEiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9kMWVlMWFjZC1iYzdhLTRiYzQtYTc4Ny05MzhjNDlhODM5MDYvIiwiaWF0IjoxNjQ0NDMyNjQ3LCJuYmYiOjE2NDQ0MzI2NDcsImV4cCI6MTY0NDQzNjU0NywiYWlvIjoiRTJaZ1lCRFo3dmxLcnRSZDg1eXFUdWY5WkUwZTBiU2YrU2FQa3d6WDJCUytkcmZtM2dJQSIsImFtciI6WyJ3aWEiXSwiZmFtaWx5X25hbWUiOiJIZW1tYXRpIiwiZ2l2ZW5fbmFtZSI6IkFzaGthbiIsImluX2NvcnAiOiJ0cnVlIiwiaXBhZGRyIjoiMTM2LjIyOC4yNTEuNjIiLCJuYW1lIjoiSGVtbWF0aSwgQXNoa2FuIiwibm9uY2UiOiIyMTc4YjAzYS0wYjQ1LTRjZWMtYTFmMy0xZjA2Nzg1YTM1ZTgiLCJvaWQiOiJkMDVlMWE5MS04ZTcwLTQxYmEtODhhYS1lM2U2ZWRlMjgwMTYiLCJvbnByZW1fc2lkIjoiUy0xLTUtMjEtMTQxNzAwMTMzMy0zNDM4MTgzOTgtMTgwMTY3NDUzMS0xNDY4NTE3IiwicmgiOiIwLkFSSUF6UnJ1MFhxOHhFdW5oNU9NU2FnNUJyVjh5dnpaY3l0QnV3VXh5T1BOOGFFU0FMYy4iLCJyb2xlcyI6WyJBRkxBZG1pbiJdLCJzdWIiOiI2OWdzSmJjWUcwck1GcHRNcVVKSGdQaUMtajlXdmlidnVJYlVsempPcXlZIiwidGlkIjoiZDFlZTFhY2QtYmM3YS00YmM0LWE3ODctOTM4YzQ5YTgzOTA2IiwidW5pcXVlX25hbWUiOiJhc2hrYW4uaGVtbWF0aUBleHhvbm1vYmlsLmNvbSIsInVwbiI6ImFzaGthbi5oZW1tYXRpQGV4eG9ubW9iaWwuY29tIiwidXRpIjoiOHJuN2N6XzJWRWE2eWVUekN6c19BQSIsInZlciI6IjEuMCJ9.C9NezSDxJxsHADm9TeATWtaHEXoyVfNDFfp3E400BfPC6hWd_sJzgcp4wFgzbZ_tBV-dusNjExwaX4pADaC1CtScV1l4tWqLx32rCOq2y08UWqvJF47xgKFip1BGiZKdl22Gso7Sl8UcQqpn2QUDmHnn3-hKm3-hZnJAvDi9p5tEDxRSOdrs5kO7evMssH1CBVJFmwVoGm4ju8wNSdJ_zMWjpwgsnL5NMB5JpRbb8mr62TcwErMEAhYMAsinUkUYG50ucYCTN1DBQiJMcAwL3b2AKI_b5r9B1qeWguCdkvw_mTU6Jf-LK2qMZJ3uaeffZDQZDQ9AFmeZCrnnYSXRCg"
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable list = json.decode(response.body);
    var sitesList =
        list.map((model) => WellSummaryModel.fromJson(model)).toList();

    return sitesList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load well summaries');
  }
}
