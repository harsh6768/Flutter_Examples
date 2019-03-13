import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => new _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: StaggeredGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            children: <Widget>[
              Items(Icons.graphic_eq, "Total Views", 0xffed622b),
              Items(Icons.bookmark, "Bookmark", 0xff26cb3c),
              Items(Icons.notifications, "Notification", 0xffff3266),
              Items(Icons.message, "Messages", 0xff3399fe),
              Items(Icons.group_work, "Group Work", 0xff7297ff),
              Items(Icons.settings, "Settings", 0xfff4c83f),
              Items(Icons.attach_money, "Balance", 0xff622f74)
            ],
            staggeredTiles: [
              new StaggeredTile.extent(2, 130.0),
              new StaggeredTile.extent(1, 150.0),
              new StaggeredTile.extent(1, 150.0),
              new StaggeredTile.extent(2, 120.0),
              new StaggeredTile.extent(2, 350.0),
              new StaggeredTile.extent(1, 150.0),
              new StaggeredTile.extent(1, 150.0),
            ],
          ),
        ),
      ),
    );
  }

  Material Items(IconData icons, String title, int colors) {
    return new Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: new Color(0x802196f3),
      borderRadius: new BorderRadius.circular(24.0),
      child: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                title,
                style: new TextStyle(
                  color: new Color(colors),
                  fontSize: 20,
                ),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Icon(
                icons,
                color: new Color(colors),
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
