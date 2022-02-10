import 'package:flutter/material.dart';
import '../Model/WellSummaryModel.dart';
import '../Services/WellSummaryAPI.dart';

class WellSummaries extends StatefulWidget {
  const WellSummaries() : super();

  @override
  _WellSummariesState createState() => _WellSummariesState();
}

class _WellSummariesState extends State<WellSummaries> {
  List<WellSummaryModel> wellSummaries = [];
  List<DataRow> wellSummaryRows = [];

  @override
  void initState() {
    super.initState();
    fetchDataAsync();
  }

  void fetchDataAsync() async {
    fetchWellSummaries().then((value) => setState(
          () {
            wellSummaries = value;

            wellSummaryRows = value
                .map(
                  (item) => new DataRow(
                    cells: <DataCell>[
                      DataCell(Text(item.site_Name.toString())),
                      DataCell(Text(item.pad_Name.toString())),
                      DataCell(Text(item.well_Name.toString())),
                      DataCell(Text(item.cycle_Number_Rounded.toString())),
                      DataCell(Text(item.production_Hours.toString())),
                      DataCell(Text(item.well_Head_Status.toString())),
                      DataCell(Text(item.shut_In_Code_Rounded.toString())),
                      DataCell(Text(item.motor_Status_Description.toString())),
                      DataCell(
                          Text(item.well_Head_Temperature_Rounded.toString())),
                      DataCell(Text(item.casing_Press_Rounded.toString())),
                      DataCell(Text(item.vent_Status.toString())),
                      DataCell(Text(item.bean_Size.toString())),
                      DataCell(
                          Text(item.strokes_Per_Minute_Rounded.toString())),
                      DataCell(Text(item.test_Oil_Volume_Rounded.toString())),
                      DataCell(Text(item.test_Water_Volume_Rounded.toString())),
                      DataCell(Text(item.test_Fluid_Rounded.toString())),
                      DataCell(Text(item.well_Test_Date.toString())),
                      DataCell(Text(item.pump_Efficiency_Rounded.toString())),
                      DataCell(Text(item.well_Test_Type.toString())),
                      DataCell(Text(item.test_Quality.toString())),
                      DataCell(Text(item.production_Days_Rounded.toString())),
                      DataCell(Text(item.steam_Volume_Rounded.toString())),
                      DataCell(Text(
                          item.steam_Injection_Flow_Rate_Rounded.toString())),
                      DataCell(Text(item.uplift.toString())),
                      DataCell(Text(item.pressureSwitchIsChecked.toString())),
                    ],
                  ),
                )
                .toList();
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        constrained: false,
        child: DataTable(columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'SITE',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'PAD',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'WELL',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'CYC',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'PROD HOUR',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'WHS',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'SIC',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'MOTOR STATUS',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'W/H STATUS',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'CASING PRESS',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'VNT STA',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'BN ZN',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'SPM',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'TEST OIL',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'TEST WATER',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'TEST FLUID',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'TEST DATE',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'PMP EFF',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'TEST TYPE',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'TQ',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'PROD DAY',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'STEAM CYCLE',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'STEAM RATE ',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'OIL UPLIFT',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'P.S.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ], rows: wellSummaryRows));
  }
}
