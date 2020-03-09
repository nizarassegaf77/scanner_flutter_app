import 'package:flutter/material.dart';
import 'package:qr_flutter_app/scan.dart';
import 'bottom_action.dart';

void main() => runApp(MyApp());

var globalContext;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return Container(
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<MyHomePage> {
  String _lastSelected = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_lastSelected),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Next choice',
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(0.0),
                      topRight: const Radius.circular(0.0),
                      bottomLeft: const Radius.circular(16.0),
                      bottomRight: const Radius.circular(16.0),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                ),
                height: 140,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16.0, top: 8.0),
                    child: Text(
                      "OVO Cash",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.0, top: 0.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Rp",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: Text(
                            "500.000",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(left: 4.0, top: 15.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.0, top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "OVO Points",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "10.000",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16.0),
                          topRight: const Radius.circular(16.0),
                          bottomLeft: const Radius.circular(16.0),
                          bottomRight: const Radius.circular(16.0),
                        ),
                      ),
                      child: //Text(_lastSelected,style: TextStyle(color: Colors.white,fontSize: 14),),
                          Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 48),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(Icons.add_alarm,
                                        size: 26, color: Colors.blue[900]),
                                    Text(
                                      "Top Up",
                                      style: TextStyle(color: Colors.blue[900]),
                                      textAlign: TextAlign.center,
                                    )
                                  ]),
                            ),
                            Container(
                                margin: const EdgeInsets.all(16),
                                child: Column(children: <Widget>[
                                  Icon(Icons.repeat,
                                      size: 26, color: Colors.blue[900]),
                                  Text(
                                    "Transfer",
                                    style: TextStyle(color: Colors.blue[900]),
                                    textAlign: TextAlign.center,
                                  )
                                ])),
                            Container(
                                margin: const EdgeInsets.only(right: 48),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(Icons.history,
                                          size: 26, color: Colors.blue[900]),
                                      Text(
                                        "History",
                                        style:
                                            TextStyle(color: Colors.blue[900]),
                                        textAlign: TextAlign.center,
                                      )
                                    ])),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 24, top: 16, right: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.flash_on,
                                  color: Colors.orange,
                                  size: 32,
                                  semanticLabel: "PLN",
                                ),
                              ),
                            ),
                            Text(
                              "PLN",
                              textAlign: TextAlign.center,
                            )
                          ]),
                    ),
                    Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.tv,
                                color: Colors.purple,
                                size: 32,
                                semanticLabel: "Tv",
                              ),
                            ),
                          ),
                          Text(
                            "Tv",
                            textAlign: TextAlign.center,
                          )
                        ])),
                    Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.near_me,
                                    color: Colors.blue,
                                    size: 32,
                                    semanticLabel: "Data",
                                  ),
                                ),
                              ),
                              Text(
                                "Data",
                                textAlign: TextAlign.center,
                              )
                            ])),
                    Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.phone_android,
                                    color: Colors.lightGreen,
                                    size: 32,
                                    semanticLabel: "Pulsa",
                                  ),
                                ),
                              ),
                              Text(
                                "Pulsa",
                                textAlign: TextAlign.center,
                              )
                            ])),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 24, top: 16, right: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.tv,
                                  color: Colors.yellow[900],
                                  size: 32,
                                ),
                              ),
                            ),
                            Text(
                              "Stream",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.phone_android,
                                  color: Colors.lightGreen,
                                  size: 32,
                                  semanticLabel: "Pulsa",
                                ),
                              ),
                            ),
                            Text(
                              "Internet",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.memory,
                                    color: Colors.blue,
                                    size: 32,
                                    semanticLabel: "Machine",
                                  ),
                                )),
                            Text(
                              "Memory",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.view_stream,
                                  size: 32,
                                  semanticLabel: "Stream",
                                ),
                              ),
                            ),
                            Text(
                              "Lainya",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 16),
            child: Container(
              height: 10,
              color: Colors.grey[300],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16,top: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Kenali ovo lebih dekat",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Tutup",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32, bottom: 16,left: 16, right: 16),
            child: Text(
              "lorem ipsum dolor sit amet lorem ipsum dolor sit amet",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16,left: 16, right: 16),
            child: Text(
              "lorem ipsum dolor sit amet lorem ipsum dolor sit amet",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16,left: 16, right: 16),
            child: Text(
              "lorem ipsum dolor sit amet lorem ipsum dolor sit amet",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16,left: 16, right: 16),
            child: Text(
              "lorem ipsum dolor sit amet lorem ipsum dolor sit amet",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16,left: 16, right: 16),
            child: Text(
              "lorem ipsum dolor sit amet lorem ipsum dolor sit amet",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16,left: 16, right: 16),
            child: Text(
              "lorem ipsum dolor sit amet lorem ipsum dolor sit amet",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16,left: 16, right: 16),
            child: Text(
              "lorem ipsum dolor sit amet lorem ipsum dolor sit amet",
              style: TextStyle(fontSize: 14),
            ),
          ),

        ],
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Scan',
        color: Colors.grey,
        selectedColor: Colors.blue,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Deal'),
          FABBottomAppBarItem(iconData: Icons.monetization_on, text: 'Finance'),
          FABBottomAppBarItem(iconData: Icons.account_box, text: 'Profile'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openQr();
        },
        tooltip: 'Scan',
        elevation: 2,
        child: Image(
          width: 24,
          height: 24,
          color: Colors.white,
          image: AssetImage('images/ic_scan.png'),
        ),
      ),
    );
  }

  navigateToScanner() async {
    double size = MediaQuery.of(globalContext).size.width;
    final result = await Navigator.push(
        globalContext,
        MaterialPageRoute(
            builder: (context) => ScannerPage(size,globalContext),
            settings: RouteSettings()));

    if (result is String) {
      setState(() {
        _lastSelected = result;
      });
    }
  }

  _openQr() {
    navigateToScanner();
  }

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }
}
