import 'package:flutter/material.dart';
import 'package:timedim/horizontal_list.dart';

class Dashboard extends StatefulWidget {
  final Widget child;

  Dashboard({Key key, this.child}) : super(key: key);

  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Weedon'),
          centerTitle: true,
        ),
        drawer: new Drawer(
          child: onDrawer(),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Top Plants",
                style: TextStyle(fontSize: 24.0, color: Colors.redAccent),
              ),
              SizedBox(
                height: 20.0,
              ),
              HorizontalList()
            ],
          ),
        ),
      ),
    );
  }

  //----------------
  //drawer layout
  //-----------------
  Widget onDrawer() {
    return new ListView(
      children: <Widget>[
        //to show the details of the users
        new UserAccountsDrawerHeader(
          accountName: new Text('Harsh Chaurasiya'),
          accountEmail: new Text('harshchaurasiya6768@gmail.com'),
          currentAccountPicture: new GestureDetector(
            child: new CircleAvatar(
              backgroundColor: Colors.cyan,
              child: new Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          decoration: new BoxDecoration(
            color: Colors.redAccent,
          ),
        ),
        //
        //to show the all the icons or option in the drawerS
        //
        new InkWell(
          onTap: () {},
          child: new ListTile(
            title: new Text('Home', style: new TextStyle(color: Colors.cyan)),
            leading: new Icon(
              Icons.home,
              color: Colors.redAccent,
            ),
          ),
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            title:
                new Text('Account', style: new TextStyle(color: Colors.cyan)),
            leading: new Icon(
              Icons.account_circle,
              color: Colors.redAccent,
            ),
          ),
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            title:
                new Text('My Orders', style: new TextStyle(color: Colors.cyan)),
            leading: new Icon(
              Icons.shopping_basket,
              color: Colors.redAccent,
            ),
          ),
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => null,
                  ));
            },
            title: new Text('Cart', style: new TextStyle(color: Colors.cyan)),
            leading: new Icon(
              Icons.shopping_cart,
              color: Colors.redAccent,
            ),
          ),
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            title: new Text('Favourites',
                style: new TextStyle(color: Colors.cyan)),
            leading: new Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
          ),
        ),
        new Divider(
          color: Colors.redAccent,
          height: 4.0,
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            title:
                new Text('Settings', style: new TextStyle(color: Colors.blue)),
            leading: new Icon(
              Icons.settings,
              color: Colors.blue,
            ),
          ),
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            title: new Text(
              'Help',
              style: new TextStyle(color: Colors.green),
            ),
            leading: new Icon(
              Icons.help,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
