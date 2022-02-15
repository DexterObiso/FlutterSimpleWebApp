import 'package:flutter/material.dart';
import '../Model/PadSummaryModel.dart';
import '../Services/PadSummaryAPI.dart';

class PadSummaries extends StatefulWidget {
  const PadSummaries({required Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PadSummariesState();
}

class PadSummariesState extends State<PadSummaries> {
  List<int> selectedPadIds = [];
  List<PadSummaryModel> padSummaries = [];
  List<Card> padSummaryCards = [];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchPadSummaryAsync(selectedPadIds, selectedDate);
  }

  String convertNullToZero(String val) {
    if (val == 'null') {
      return '0';
    } else {
      return val;
    }
  }

  void setSelectedFilterParams(List<int> ids, DateTime date) {
    setState(() {
      selectedPadIds = ids;
      selectedDate = date;
    });

    fetchPadSummaryAsync(ids, date);
  }

  void fetchPadSummaryAsync(List<int> ids, DateTime date) async {
    fetchPadSummaries(ids, date).then((value) => setState(
          () {
            padSummaries = value;

            padSummaryCards = value
                .map(
                  (item) => new Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Table(
                        defaultColumnWidth: FixedColumnWidth(150.0),
                        border: TableBorder.all(color: Colors.white),
                        children: [
                          TableRow(children: [
                            Container(
                              child: Text(item.pad_Name.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Container(),
                            Container()
                          ]),
                          TableRow(children: [
                            Text('Group Line ',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                            Text(
                              'Average Pressure ' +
                                  convertNullToZero(item
                                      .group_Line_Average_Pressure_Rounded
                                      .toString()),
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              'Avg. (24 h) Temp. ' +
                                  convertNullToZero(item
                                      .group_Line_Average_Temperature_Rounded
                                      .toString()),
                              style: TextStyle(fontSize: 11),
                            ),
                          ]),
                          TableRow(children: [
                            Text('Utility Steam ',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                            Text(
                              'Average Pressure ' +
                                  convertNullToZero(item
                                      .utility_Steam_Average_Pressure_Rounded
                                      .toString()),
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              'Volume. ' +
                                  convertNullToZero(item
                                      .utility_Steam_Volume_Rounded
                                      .toString()),
                              style: TextStyle(fontSize: 11),
                            ),
                          ]),
                          TableRow(children: [
                            Text('Chemical Injection ',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                            Text(
                              'Ratio ' +
                                  convertNullToZero(
                                      item.chemical_Injection_Ratio.toString()),
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              'Volume. ' +
                                  convertNullToZero(item
                                      .chemical_Injection_Volume_Rounded
                                      .toString()),
                              style: TextStyle(fontSize: 11),
                            ),
                          ]),
                          TableRow(children: [
                            Text('Compressors ',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                            Text(
                              'Gas Comp. (FQ505) ' +
                                  convertNullToZero(
                                      item.gasCompressor_Rounded.toString()),
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              'K001 Run Hours. ' +
                                  convertNullToZero(
                                      item.k002_Run_Hours_Rounded.toString()),
                              style: TextStyle(fontSize: 11),
                            ),
                          ]),
                          TableRow(children: [
                            Text(''),
                            Text(
                              'K002 Run Hours ' +
                                  convertNullToZero(
                                      item.k002_Run_Hours_Rounded.toString()),
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              'Pad Run Hours ' +
                                  convertNullToZero(
                                      item.p030_Run_Hours_Rounded.toString()),
                              style: TextStyle(fontSize: 11),
                            ),
                          ]),
                          TableRow(children: [
                            Text('Total Production ',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                            Text('Oil ',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                            Text('H2O ',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                          ]),
                          TableRow(children: [
                            Text(
                                'Expected Volume ' +
                                    convertNullToZero(
                                        item.p030_Run_Hours_Rounded.toString()),
                                style: TextStyle(fontSize: 11)),
                            Text(
                                convertNullToZero(item
                                    .theoretical_Oil_Volume_Rounded
                                    .toString()),
                                style: TextStyle(fontSize: 11)),
                            Text(
                                convertNullToZero(item
                                    .theoretical_Water_Volume_Rounded
                                    .toString()),
                                style: TextStyle(fontSize: 11)),
                          ]),
                          TableRow(children: [
                            Text(
                                'Actual Volume ' +
                                    convertNullToZero(
                                        item.p030_Run_Hours_Rounded.toString()),
                                style: TextStyle(fontSize: 11)),
                            Text(
                                convertNullToZero(
                                    item.actual_Oil_Volume_Rounded.toString()),
                                style: TextStyle(fontSize: 11)),
                            Text(
                                convertNullToZero(item
                                    .actual_Water_Volume_Rounded
                                    .toString()),
                                style: TextStyle(fontSize: 11)),
                          ]),
                          TableRow(children: [
                            Text('AutPODS Volume ',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                            Text('no total', style: TextStyle(fontSize: 11)),
                            Text('')
                          ]),
                          TableRow(children: [
                            Text('Actual WOR ',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                            Text(item.actual_WOR_Rounded.toString(),
                                style: TextStyle(fontSize: 11)),
                            Text('')
                          ]),
                        ]),
                  ),
                )
                .toList();
          },
        ));
  }

  Widget build(BuildContext context) {
    return padSummaries.length != 0
        ? ListView(children: padSummaryCards)
        : Text('No data available.', style: TextStyle(color: Colors.red));
  }
}
