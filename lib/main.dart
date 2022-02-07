import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<SiteList> fetchSites() async {
  final response = await http.get(
      Uri.parse('https://afl-api-dev.uda.xomsvcs.com/api/Sites/'),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ik1yNS1BVWliZkJpaTdOZDFqQmViYXhib1hXMCIsImtpZCI6Ik1yNS1BVWliZkJpaTdOZDFqQmViYXhib1hXMCJ9.eyJhdWQiOiJmY2NhN2NiNS03M2Q5LTQxMmItYmIwNS0zMWM4ZTNjZGYxYTEiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9kMWVlMWFjZC1iYzdhLTRiYzQtYTc4Ny05MzhjNDlhODM5MDYvIiwiaWF0IjoxNjQ0Mjc0MDI0LCJuYmYiOjE2NDQyNzQwMjQsImV4cCI6MTY0NDI3NzkyNCwiYWlvIjoiQVNRQTIvOFRBQUFBZlluY0FQUW8wWnljekJzQWxsMEZadDlycStkdm5Rc1NKS1JzczhHajdZYz0iLCJhbXIiOlsid2lhIl0sImZhbWlseV9uYW1lIjoiSGVtbWF0aSIsImdpdmVuX25hbWUiOiJBc2hrYW4iLCJpbl9jb3JwIjoidHJ1ZSIsImlwYWRkciI6IjEzNi4yMjguMjUxLjUwIiwibmFtZSI6IkhlbW1hdGksIEFzaGthbiIsIm5vbmNlIjoiNGExZmM0N2UtMzJhMS00NTViLWJiMTMtM2QxMjNkMGFiMmM2Iiwib2lkIjoiZDA1ZTFhOTEtOGU3MC00MWJhLTg4YWEtZTNlNmVkZTI4MDE2Iiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE0MTcwMDEzMzMtMzQzODE4Mzk4LTE4MDE2NzQ1MzEtMTQ2ODUxNyIsInJoIjoiMC5BUklBelJydTBYcTh4RXVuaDVPTVNhZzVCclY4eXZ6WmN5dEJ1d1V4eU9QTjhhRVNBTGMuIiwicm9sZXMiOlsiQUZMQWRtaW4iXSwic3ViIjoiNjlnc0piY1lHMHJNRnB0TXFVSkhnUGlDLWo5V3ZpYnZ1SWJVbHpqT3F5WSIsInRpZCI6ImQxZWUxYWNkLWJjN2EtNGJjNC1hNzg3LTkzOGM0OWE4MzkwNiIsInVuaXF1ZV9uYW1lIjoiYXNoa2FuLmhlbW1hdGlAZXh4b25tb2JpbC5jb20iLCJ1cG4iOiJhc2hrYW4uaGVtbWF0aUBleHhvbm1vYmlsLmNvbSIsInV0aSI6Ik40ZUhyeTdwUTAtVTZJYjdaQ3NlQVEiLCJ2ZXIiOiIxLjAifQ.fQL8wGQherm4GQQyh2N84rAGwvQwgDw84BpH4omxKVPG8XfxAOmaMQy1xSkY2Ms4OvaPv4ADbZ8rxjlEVzjQqMZZE1nMRAZVtAXC9ZwBuxi71mcQvvZRfoBv50iFQ8FeYNu3CbsjM6FHqGXMoyY6wbgBs8ssTKvegF0nWjRtBXCXD0LKsPNL0syYOKtWnrOIovg7BRQ6j_juMkjrGZzC18DVJTnMBv6OQXbeQfju88lFh9D-ipCIR_7cXfLEgcyNSoUyuex53bPwa4-V13HZ43Ep1qE24v6Xdx7svxQ8Zdb-FchQf6OGC1hxn027oxhuEMXRE2xX8hMHJadmG8JHfQ"
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return SiteList.fromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load sites');
  }
}

class SiteList {
  List<Site> sites;

  SiteList() {
    sites = [];
  }

  factory SiteList.fromJson(String json) {
    final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
    SiteList results = new SiteList();

    parsed.forEach((element) {
      results.sites.add(element);
    });

    return results;
  }
}

class Site {
  final int id;
  final String name;

  const Site({
    this.id,
    this.name,
  });
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp() : super();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<SiteList> sites;

  @override
  void initState() {
    super.initState();
    sites = fetchSites();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<SiteList>(
            future: sites,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                snapshot.data.sites.forEach((element) {
                  return Text(element.name);
                });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
