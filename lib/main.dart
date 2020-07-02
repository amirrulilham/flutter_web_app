import 'package:first_web/component/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int user = 0;
  @override
  void initState() {
    // _fetchUser();
    super.initState();
  }

  Future _fetchUser() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final getUser = getUserFromJson(response.body);
      return getUser;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width / 70, vertical: width / 70),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: width / 5,
                    height: width / 9,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[200],
                              spreadRadius: 0,
                              blurRadius: 3)
                        ]),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: width / 90, vertical: width / 90),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('TOTAL USER',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                                Text(user.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width / 5,
                    height: width / 9,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[200],
                              spreadRadius: 0,
                              blurRadius: 3)
                        ]),
                  ),
                  Container(
                    width: width / 5,
                    height: width / 9,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[200],
                              spreadRadius: 0,
                              blurRadius: 3)
                        ]),
                  ),
                ],
              ),
              SizedBox(height: width / 20),
              Container(
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200],
                          spreadRadius: 0,
                          blurRadius: 3)
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 70, vertical: width / 70),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text('User List',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(height: width / 35),
                      Container(
                        width: width,
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            divider(width),
                            TableHead(width: width),
                            divider(width),
                            FutureBuilder(
                              future: _fetchUser(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return ListBody(
                                        children: [
                                          TableData(
                                            width: width,
                                            id: snapshot.data[index].id,
                                            name: snapshot.data[index].name,
                                            username:
                                                snapshot.data[index].username,
                                            email: snapshot.data[index].email,
                                            street: snapshot
                                                .data[index].address.street,
                                            apt: snapshot
                                                .data[index].address.suite,
                                            pcode: snapshot
                                                .data[index].address.zipcode,
                                            city: snapshot
                                                .data[index].address.city,
                                            lat: snapshot
                                                .data[index].address.geo.lat,
                                            lng: snapshot
                                                .data[index].address.geo.lng,
                                            pnumber: snapshot.data[index].phone,
                                            website:
                                                snapshot.data[index].website,
                                            comp: snapshot
                                                .data[index].company.name,
                                            cphrase: snapshot.data[index]
                                                .company.catchPhrase,
                                            bs: snapshot.data[index].company.bs,
                                          ),
                                          divider(width)
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Container divider(double width) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: width / 200),
      height: 1,
      color: Colors.grey[200],
    );
  }
}

class Drawer extends StatelessWidget {
  const Drawer({
    Key key,
    ListView child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class CardDashboard extends StatelessWidget {
  const CardDashboard({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 5,
      height: width / 9,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.grey[200], spreadRadius: 0, blurRadius: 3)
          ]),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width / 90, vertical: width / 90),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('TOTAL USER',
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  Text('10',
                      style: TextStyle(color: Colors.white, fontSize: 40))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TableData extends StatelessWidget {
  const TableData({
    Key key,
    @required this.width,
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.email,
    @required this.street,
    @required this.apt,
    @required this.pcode,
    @required this.city,
    @required this.lat,
    @required this.lng,
    @required this.pnumber,
    @required this.website,
    @required this.comp,
    @required this.cphrase,
    @required this.bs,
  }) : super(key: key);

  final double width;
  final int id;
  final String name;
  final String username;
  final String email;
  final String street;
  final String apt;
  final String pcode;
  final String city;
  final String lat;
  final String lng;
  final String pnumber;
  final String website;
  final String comp;
  final String cphrase;
  final String bs;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: (3 / 100) * width,
            child: Center(
              child: Text('$id', style: AssetMaterial().assetTextStyle),
            ),
          ),
          AssetMaterial().space(width),
          Container(
            width: (13 / 100) * width,
            child: Center(
              child: Text(name, style: AssetMaterial().assetTextStyle),
            ),
          ),
          AssetMaterial().space(width),
          Container(
            width: (17 / 100) * width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username : $username',
                    style: AssetMaterial().assetTextStyle),
                SizedBox(height: width / 400),
                Text('Email : $email', style: AssetMaterial().assetTextStyle)
              ],
            ),
          ),
          Container(
            width: (10 / 100) * width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$street,', style: AssetMaterial().assetTextStyle),
                Text('$apt,', style: AssetMaterial().assetTextStyle),
                Text('$pcode,', style: AssetMaterial().assetTextStyle),
                Text('$city', style: AssetMaterial().assetTextStyle)
              ],
            ),
          ),
          AssetMaterial().space(width),
          Container(
            width: (7 / 100) * width,
            child: Center(
              child: Text('$lat', style: AssetMaterial().assetTextStyle),
            ),
          ), // latitude
          AssetMaterial().space(width),
          Container(
            width: (7 / 100) * width,
            child: Center(
              child: Text('$lng', style: AssetMaterial().assetTextStyle),
            ),
          ), // longitude
          AssetMaterial().space(width),
          Container(
            width: (13 / 100) * width,
            child: Center(
              child: Text('$pnumber', style: AssetMaterial().assetTextStyle),
            ),
          ),
          AssetMaterial().space(width),
          Container(
            width: (9 / 100) * width,
            child: Center(
              child: Text('$website', style: AssetMaterial().assetTextStyle),
            ),
          ),
          AssetMaterial().space(width),
          Container(
            width: (12 / 100) * width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$comp', style: AssetMaterial().assetTextStyle),
                Text('$cphrase',
                    overflow: TextOverflow.ellipsis,
                    style: AssetMaterial().assetTextStyle),
                Text('$bs',
                    overflow: TextOverflow.ellipsis,
                    style: AssetMaterial().assetTextStyle),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TableHead extends StatelessWidget {
  const TableHead({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: (3 / 100) * width, child: Center(child: Text('ID'))),
        AssetMaterial().space(width),
        Container(
            width: (13 / 100) * width, child: Center(child: Text('NAME'))),
        AssetMaterial().space(width),
        Container(width: (17 / 100) * width, child: Center(child: Text(''))),
        AssetMaterial().space(width),
        Container(width: (10 / 100) * width, child: Text('ADDRESS')),
        AssetMaterial().space(width),
        Container(
            width: (7 / 100) * width, child: Center(child: Text('LATITUDE'))),
        AssetMaterial().space(width),
        Container(
            width: (7 / 100) * width, child: Center(child: Text('LONGITUDE'))),
        AssetMaterial().space(width),
        Container(
            width: (13 / 100) * width,
            child: Center(child: Text('PHONE NUMBER'))),
        AssetMaterial().space(width),
        Container(
            width: (9 / 100) * width, child: Center(child: Text('WEBSITE'))),
        AssetMaterial().space(width),
        Container(
            width: (12 / 100) * width,
            child: Center(child: Text('COMPANY DETAILS'))),
      ],
    );
  }
}
