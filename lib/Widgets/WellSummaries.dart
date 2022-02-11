import 'package:flutter/material.dart';
import '../Model/WellSummaryModel.dart';
import '../Services/WellSummaryAPI.dart';

class WellSummaries extends StatefulWidget {
  const WellSummaries({required Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WellSummariesState();
}

class WellSummariesState extends State<WellSummaries> {
  int selectedPadId = 0;
  List<WellSummaryModel> wellSummaries = [];
  List<Card> wellSummaryCards = [];

  @override
  void initState() {
    super.initState();
    fetchWellSummaryAsync(selectedPadId);
  }

  void setSelectedPadId(int id) {
    selectedPadId = id;
    fetchWellSummaryAsync(id);
  }

  void fetchWellSummaryAsync(int id) async {
    fetchWellSummaries(id).then((value) => setState(
          () {
            wellSummaries = value;

            wellSummaryCards = value
                .map(
                  (item) => new Card(
                    color: item.well_Name.toString() == 'PAD' ||
                            item.well_Name.toString() == '00'
                        ? Colors.lightBlue.shade100
                        : Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Stack(children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0, top: 5),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          if (item.well_Name.toString() ==
                                                  'PAD' ||
                                              item.well_Name.toString() == '00')
                                            Text(item.site_Name.toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          if (item.well_Name.toString() ==
                                                  'PAD' ||
                                              item.well_Name.toString() == '00')
                                            Spacer(),
                                          if (item.well_Name.toString() ==
                                                  'PAD' ||
                                              item.well_Name.toString() == '00')
                                            Text(item.pad_Name.toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          if (item.well_Name.toString() !=
                                                  'PAD' &&
                                              item.well_Name.toString() != '00')
                                            Text(
                                                'WELL: ' +
                                                    item.well_Name.toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                        ],
                                      ),
                                      if (item.well_Name.toString() != 'PAD' &&
                                          item.well_Name.toString() != '00')
                                        Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.all(2.0),
                                          child: Table(
                                            defaultColumnWidth:
                                                FixedColumnWidth(150.0),
                                            border: TableBorder.all(
                                                color: Colors.white),
                                            children: [
                                              TableRow(children: [
                                                Text(
                                                  'CYC: ' +
                                                      item.cycle_Number_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'PROD HOUR: ' +
                                                      item.production_Hours_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'WHS: ' +
                                                      item.well_Head_Status
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Text(
                                                  'SIC: ' +
                                                      item.shut_In_Code_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'MOTOR STATUS: ' +
                                                      item.motor_Status
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'W/H TEMP: ' +
                                                      item.well_Head_Temperature_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Text(
                                                  'CASING PRESS: ' +
                                                      item.casing_Press_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'VNT STA: ' +
                                                      item.vent_Status
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'BN SZ: ' +
                                                      item.bean_Size.toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Text(
                                                  'SPM: ' +
                                                      item.strokes_Per_Minute_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'TEST OIL: ' +
                                                      item.test_Oil_Volume_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'TEST WATER: ' +
                                                      item.test_Water_Volume_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Text(
                                                  'TEST FLUID: ' +
                                                      item.test_Fluid_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'TEST DATE: ' +
                                                      item.well_Test_Date
                                                          .toString()
                                                          .split('T')
                                                          .first,
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'PMP EFF: ' +
                                                      item.pump_Efficiency_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Text(
                                                  'TEST TYPE: ' +
                                                      item.well_Test_Type
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'TQ: ' +
                                                      item.test_Quality
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'PROD DAY: ' +
                                                      item.production_Days_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Text(
                                                    'STEAM CYCLE: ' +
                                                        item.steam_Volume
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 11)),
                                                Text(
                                                  'STEAM RATE: ' +
                                                      item.steam_Injection_Flow_Rate_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Text(
                                                  'OIL UPLIFT: ' +
                                                      item.oil_Volume_Rounded
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                              ])
                                            ],
                                          ),
                                        )
                                    ],
                                  ))
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                )
                .toList();
          },
        ));
  }

  Widget build(BuildContext context) {
    return wellSummaries.length != 0
        ? ListView(children: wellSummaryCards)
        : Text('No data available.', style: TextStyle(color: Colors.red));
  }
}
