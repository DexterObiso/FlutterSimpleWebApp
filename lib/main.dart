import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Site>> fetchSites() async {
  final response = await http.get(
      Uri.parse('https://afl-api-dev.uda.xomsvcs.com/api/Sites/'),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ik1yNS1BVWliZkJpaTdOZDFqQmViYXhib1hXMCIsImtpZCI6Ik1yNS1BVWliZkJpaTdOZDFqQmViYXhib1hXMCJ9.eyJhdWQiOiJmY2NhN2NiNS03M2Q5LTQxMmItYmIwNS0zMWM4ZTNjZGYxYTEiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9kMWVlMWFjZC1iYzdhLTRiYzQtYTc4Ny05MzhjNDlhODM5MDYvIiwiaWF0IjoxNjQ0MzQxOTk1LCJuYmYiOjE2NDQzNDE5OTUsImV4cCI6MTY0NDM0NTg5NSwiYWlvIjoiRTJaZ1lPalczQ0J4VmN3NWEwNzB3VzYzRmExTEhuY2NkQzZkZk1IWlNTajE0Y1dsenRzQiIsImFtciI6WyJ3aWEiXSwiZmFtaWx5X25hbWUiOiJIZW1tYXRpIiwiZ2l2ZW5fbmFtZSI6IkFzaGthbiIsImluX2NvcnAiOiJ0cnVlIiwiaXBhZGRyIjoiMTM2LjIyOC4yNTEuNDEiLCJuYW1lIjoiSGVtbWF0aSwgQXNoa2FuIiwibm9uY2UiOiI0M2JjMDBlNC03MTA5LTQyMzYtODRjZC1kNjdmYzNlMmU2ZWMiLCJvaWQiOiJkMDVlMWE5MS04ZTcwLTQxYmEtODhhYS1lM2U2ZWRlMjgwMTYiLCJvbnByZW1fc2lkIjoiUy0xLTUtMjEtMTQxNzAwMTMzMy0zNDM4MTgzOTgtMTgwMTY3NDUzMS0xNDY4NTE3IiwicmgiOiIwLkFSSUF6UnJ1MFhxOHhFdW5oNU9NU2FnNUJyVjh5dnpaY3l0QnV3VXh5T1BOOGFFU0FMYy4iLCJyb2xlcyI6WyJBRkxBZG1pbiJdLCJzdWIiOiI2OWdzSmJjWUcwck1GcHRNcVVKSGdQaUMtajlXdmlidnVJYlVsempPcXlZIiwidGlkIjoiZDFlZTFhY2QtYmM3YS00YmM0LWE3ODctOTM4YzQ5YTgzOTA2IiwidW5pcXVlX25hbWUiOiJhc2hrYW4uaGVtbWF0aUBleHhvbm1vYmlsLmNvbSIsInVwbiI6ImFzaGthbi5oZW1tYXRpQGV4eG9ubW9iaWwuY29tIiwidXRpIjoiS0Ftc05LVU52RU96SVFVRGRwOENBUSIsInZlciI6IjEuMCJ9.hw2OdGdvvUSTiMqZ-fJyZgfonhplWUtRWaDIZyYwBdThoX9vDYw4fM5QheBqeFz9B8_QqyPmRhEQYQ2LOxePi2z-xNNNo7RUjgKLdrRR99Kr1v4t1GQ2h1yxlrzANWHgbhEMpEmBfRu8GxV0pYdqn_D0rBbxH9CSoA4C1NA6ezcTxPuSJfx9RqPtyXzz8xrkVPKc4qlgKdeICHFm9LOpcNfVxc41lXeXMvqXqkDm0-mg0yvygjMRUNlC83xcaTXbtVMhpcM3RXC66tio_2HNsRZkHBIh6HjHMT7YfLPM7E6SbZWlFA7BCgMaEDMZOdgn0VIconFtncxmJiJMbcAZUg"
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable list = json.decode(response.body);
    var sitesList = list.map((model) => Site.fromJson(model)).toList();

    return sitesList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load sites');
  }
}

class Site {
  final int id;
  final String name;

  Site.fromJson(Map json)
      : id = json['id'],
        name = json['name'];

  Map toJson() {
    return {'id': id, 'name': name};
  }
}

void main() => runApp(const DemoFlutterApp());

class DemoFlutterApp extends StatefulWidget {
  const DemoFlutterApp() : super();

  @override
  _DemoFlutterAppState createState() => _DemoFlutterAppState();
}

class _DemoFlutterAppState extends State<DemoFlutterApp> {
  List<Site> sites;
  List<Widget> sitesWidget = [];

  @override
  void initState() {
    super.initState();
    fetchSitesAsync();
  }

  void fetchSitesAsync() async {
    fetchSites().then((value) => setState(
          () {
            sites = value;
            sitesWidget = sites.map((item) => new Text(item.name)).toList();
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AFL - Flutter Demo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('AFL - Flutter Demo App'),
            ),
            body: Row(children: sitesWidget)));
  }
}
