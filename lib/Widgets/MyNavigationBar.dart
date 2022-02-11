import 'package:flutter/material.dart';
import 'package:flutter_simple_web_app/Services/PadAPI.dart';
import 'package:flutter_simple_web_app/Services/SiteAPI.dart';
import '../Model/PadModel.dart';
import '../Model/SiteModel.dart';
import 'WellSummaries.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar() : super();

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int selectedIndex = 0;
  List<SiteModel> allSites = [];
  List<PadModel> allPads = [];
  List<String> padOptions = ['select a pad'];
  List<String> siteOptions = ['select a site'];
  String selectedPad = 'select a pad';
  String selectedSite = 'select a site';
  GlobalKey<WellSummariesState> _myKey = GlobalKey();
  late List<Widget> navigationOptions;

  @override
  void initState() {
    super.initState();
    fetchSiteAsync();

    navigationOptions = <Widget>[
      WellSummaries(key: _myKey),
      Text(
        'Pad Summary',
        style: optionStyle,
      ),
    ];
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
        padOptions = ['select a pad'];

        fetchPads(site[0].id).then((value) => setState(() {
              allPads = value;

              value.forEach((element) {
                padOptions.add(element.name);
              });
            }));
      }
    }
  }

  void onPadChange(String selected) {
    setState(() {
      selectedPad = selected;
    });
  }

  void onSearch() {
    if (selectedPad != 'select a pad') {
      List<PadModel> pad =
          allPads.where((element) => element.name == selectedPad).toList();

      if (pad.length > 0) {
        _myKey.currentState?.setSelectedPadId(pad[0].id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' AFL - Flutter Demo App'),
      ),
      body: Container(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
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
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton(
                value: selectedPad,
                onChanged:
                    selectedSite.isEmpty || selectedSite == 'select a site'
                        ? null
                        : (newPadValue) {
                            onPadChange(newPadValue.toString());
                          },
                items: padOptions.map((pad) {
                  return DropdownMenuItem(
                    child: new Text(pad),
                    value: pad,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: selectedSite.isEmpty || selectedPad == 'select a pad'
                    ? null
                    : () {
                        onSearch();
                      },
                child: Text('Search'),
              )
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
            icon: Icon(Icons.view_sidebar_rounded),
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
