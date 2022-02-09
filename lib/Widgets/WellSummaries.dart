import 'package:flutter/material.dart';
import '../Model/SiteModel.dart';
import '../Services/SiteAPI.dart';

class WellSummaries extends StatefulWidget {
  const WellSummaries() : super();

  @override
  _WellSummariesState createState() => _WellSummariesState();
}

class _WellSummariesState extends State<WellSummaries> {
  List<SiteModel> sites;
  List<DataRow> siteRows = [];

  @override
  void initState() {
    super.initState();
    fetchDataAsync();
  }

  void fetchDataAsync() async {
    fetchSites().then((value) => setState(
          () {
            sites = value;
            siteRows = value
                .map(
                  (item) => new DataRow(
                    cells: <DataCell>[
                      DataCell(Text(item.id.toString())),
                      DataCell(Text(item.name)),
                    ],
                  ),
                )
                .toList();
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: const <DataColumn>[
      DataColumn(
        label: Text(
          'Id',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      DataColumn(
        label: Text(
          'Name',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    ], rows: siteRows);
  }
}
