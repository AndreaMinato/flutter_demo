import 'package:flutter/material.dart';

import 'DrawerItem.dart';
import 'FirstScreen.dart';

import 'electrolux_icons_icons.dart';

class NavigationDrawerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NavigationDrawerState();
  }
}

class NavigationDrawerState extends State<NavigationDrawerDemo> {
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _endScaffoldKey =
      new GlobalKey<ScaffoldState>();

  final drawerItems = [
    new DrawerItem("Aeroplane", Icons.local_airport),
    new DrawerItem("Pizza", Icons.local_pizza),
    new DrawerItem("Coffee", Icons.local_cafe)
  ];

  _getDrawerItemScreen(int pos) {
    return new FirstScreen(drawerItem: drawerItems[_selectedIndex]);
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
      _getDrawerItemScreen(_selectedIndex);
    });
    Navigator.of(context).pop(); // close the drawer
//    Navigator.push(
//      context,
//      new MaterialPageRoute(
//        builder: (context) => _getDrawerItemScreen(_selectedIndex),
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    drawerOptions.add(Container(
      decoration: BoxDecoration(color: Colors.teal),
      child: DrawerHeader(
        child: Text('Drawer Header'),
      ),
    ));
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(
          d.title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        selected: i == _selectedIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      key: _endScaffoldKey,
      appBar: AppBar(

            title: new Text("Navigation Drawer"),
            actions: <Widget>[
              // action button
              IconButton(
                  icon: Icon(ElectroluxIcons.appliances),
                  onPressed: () => _endScaffoldKey.currentState.openEndDrawer()),
              IconButton(
                  icon: Icon(ElectroluxIcons.arrow_right),
                  onPressed: () => _endScaffoldKey.currentState.openEndDrawer())
            ],
          ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: drawerOptions),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Text("WTF!"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Container(
          height: 72,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: new Text("Alert Dialog title"),
                        content: new Text("Alert Dialog body"),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: _getDrawerItemScreen(_selectedIndex),
    );
  }
}
