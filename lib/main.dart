import 'package:first_web/component/material.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      drawer: Drawer(
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
      ),
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                height: width / 2,
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
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return ListBody(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: (3 / 100) * width,
                                            child: Center(
                                              child: Text('1',
                                                  style: AssetMaterial()
                                                      .assetTextStyle),
                                            ),
                                          ),
                                          AssetMaterial().space(width),

                                          Container(
                                            width: (13 / 100) * width,
                                            child: Center(
                                              child: Text('Amirrul Ilham',
                                                  style: AssetMaterial()
                                                      .assetTextStyle),
                                            ),
                                          ),
                                          AssetMaterial().space(width),
                                          Container(
                                            width: (17 / 100) * width,
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'Username : amirrulilham',
                                                      style: AssetMaterial()
                                                          .assetTextStyle),
                                                  SizedBox(height: width / 400),
                                                  Text(
                                                      'Email : amirrulilham.gm@gmail.com',
                                                      style: AssetMaterial()
                                                          .assetTextStyle)
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: (10 / 100) * width,
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Kulas Light,',
                                                      style: AssetMaterial()
                                                          .assetTextStyle),
                                                  Text('Apt. 556,',
                                                      style: AssetMaterial()
                                                          .assetTextStyle),
                                                  Text('92998-3874,',
                                                      style: AssetMaterial()
                                                          .assetTextStyle),
                                                  Text('Gwenborough',
                                                      style: AssetMaterial()
                                                          .assetTextStyle)
                                                ],
                                              ),
                                            ),
                                          ),
                                          AssetMaterial().space(width),
                                          Container(
                                            width: (7 / 100) * width,
                                            child: Center(
                                              child: Text('-37.3159',
                                                  style: AssetMaterial()
                                                      .assetTextStyle),
                                            ),
                                          ), // latitude
                                          AssetMaterial().space(width),
                                          Container(
                                            width: (7 / 100) * width,
                                            child: Center(
                                              child: Text('81.1496',
                                                  style: AssetMaterial()
                                                      .assetTextStyle),
                                            ),
                                          ), // longitude
                                          AssetMaterial().space(width),
                                          Container(
                                            width: (13 / 100) * width,
                                            child: Center(
                                              child: Text(
                                                  '1-770-736-8031 x56442',
                                                  style: AssetMaterial()
                                                      .assetTextStyle),
                                            ),
                                          ),
                                          AssetMaterial().space(width),
                                          Container(
                                            width: (9 / 100) * width,
                                            child: Center(
                                              child: Text('hildegard.org',
                                                  style: AssetMaterial()
                                                      .assetTextStyle),
                                            ),
                                          ),
                                          AssetMaterial().space(width),
                                          Container(
                                            width: (12 / 100) * width,
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Romaguera-Crona',
                                                      style: AssetMaterial()
                                                          .assetTextStyle),
                                                  Text(
                                                      'Multi-layered client-server neural-net',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AssetMaterial()
                                                          .assetTextStyle),
                                                  Text(
                                                      'harness real-time e-markets',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AssetMaterial()
                                                          .assetTextStyle),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    divider(width)
                                  ],
                                );
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
        Container(
            width: (10 / 100) * width, child: Center(child: Text('ADDRESS'))),
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
