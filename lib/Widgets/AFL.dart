import 'package:flutter/material.dart';
import 'package:flutter_aad_oauth/flutter_aad_oauth.dart';
import 'package:flutter_aad_oauth/model/config.dart';
import 'package:flutter_simple_web_app/Services/PadAPI.dart';
import 'package:flutter_simple_web_app/Services/SiteAPI.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../Model/PadModel.dart';
import '../Model/SiteModel.dart';
import '../globalConfig.dart';
import 'WellSummaries.dart';
import 'PadSummaries.dart';

class AFL extends StatefulWidget {
  const AFL() : super();

  @override
  State<AFL> createState() => AFLState();
}

class AFLState extends State<AFL> {
  GlobalKey<WellSummariesState> _myWellSummaryKey = GlobalKey();
  GlobalKey<PadSummariesState> _myPadSummaryKey = GlobalKey();
  int selectedIndex = 0;
  late List<Widget> navigationOptions;
  List<SiteModel> allSites = [];
  List<PadModel> allPads = [];
  List<String> siteOptions = ['select a site'];
  List<PadModel?> selectedPads = [];
  String selectedSite = 'select a site';
  DateTime selectedDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  // late Config config;
  // late FlutterAadOauth oauth;

  @override
  void initState() {
    // config = new Config(
    //     azureTennantId: tenant,
    //     clientId: clientId,
    //     scope: "openid profile email offline_access user.read",
    //     redirectUri: "http://localhost:3000",
    //     responseType: "id_token+token");

    // oauth = FlutterAadOauth(config);
    // oauth.setContext(context);
    // login();

    super.initState();
    fetchSiteAsync();

    navigationOptions = <Widget>[
      WellSummaries(key: _myWellSummaryKey),
      PadSummaries(key: _myPadSummaryKey),
    ];
  }

  // void login() async {
  //   try {
  //     await oauth.login();
  //     String? accessToken = await oauth.getAccessToken();
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2019),
        lastDate: currentDate);
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }

  void fetchSiteAsync() async {
    fetchSites().then((value) => setState(() {
          allSites = value;

          value.forEach((element) {
            siteOptions.add(element.name);
          });
        }));
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onSiteChange(String selected) {
    setState(() {
      selectedSite = selected;
    });

    if (selected != 'select a site') {
      List<SiteModel> site =
          allSites.where((element) => element.name == selected).toList();

      if (site.length > 0) {
        fetchPads(site[0].id).then((value) => setState(() {
              allPads = value;
            }));
      }
    }
  }

  void onSearch() {
    if (selectedPads.isNotEmpty) {
      List<PadModel> pads = allPads
          .where((element) =>
              selectedPads.where((x) => x?.name == element.name).length > 0)
          .toList();

      if (pads.length > 0) {
        List<int> padIds = pads.map((x) => x.id).toList();

        _myWellSummaryKey.currentState
            ?.setSelectedFilterParams(padIds, selectedDate);
        _myPadSummaryKey.currentState
            ?.setSelectedFilterParams(padIds, selectedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AFL - Flutter Demo App'),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Container(
                      width: 160,
                      height: 60,
                      child: DropdownButton(
                        value: selectedSite,
                        onChanged: (newSiteValue) {
                          onSiteChange(newSiteValue.toString());
                        },
                        items: siteOptions.map((site) {
                          return DropdownMenuItem(
                            child: new Text(site),
                            value: site,
                          );
                        }).toList(),
                      )),
                  Container(
                      width: 200,
                      child: IgnorePointer(
                          ignoring: selectedSite.isEmpty ||
                              selectedSite == 'select a site',
                          child: MultiSelectDialogField(
                            buttonText: Text('select a pad'),
                            buttonIcon: Icon(Icons.arrow_drop_down),
                            items: allPads
                                .map((e) => MultiSelectItem(e, e.name))
                                .toList(),
                            listType: MultiSelectListType.CHIP,
                            initialValue: selectedPads,
                            onConfirm: (values) {
                              setState(() {
                                selectedPads = values.toList().cast();
                              });
                            },
                          ))),
                  TextButton(
                      onPressed: () => selectDate(context),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: selectedDate.toString().split(' ')[0],
                                style: TextStyle(color: Colors.black)),
                            WidgetSpan(
                              child: Icon(Icons.arrow_drop_down,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      )),
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue)),
                    onPressed: selectedSite.isEmpty
                        ? null
                        : () {
                            onSearch();
                          },
                    child: Text('Search'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: navigationOptions.elementAt(selectedIndex))
            ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_stream),
            label: 'Well Summary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_module_sharp),
            label: 'Pad Summary',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
      ),
    );
  }
}
