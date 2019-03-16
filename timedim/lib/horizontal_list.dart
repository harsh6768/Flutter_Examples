import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 300,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Category(
            image_location: 'images/plants/in_plants1.jpg',
            image_caption: 'Aloe vera',
          ),
          new Category(
            image_location: 'images/plants/in_plants7.png',
            image_caption: 'Black alder',
          ),
          new Category(
            image_location: 'images/plants/in_plants3.jpg',
            image_caption: 'European ash',
          ),
          new Category(
            image_location: 'images/plants/spices.png',
            image_caption: 'Mahogany birch',
          ),
          new Category(
            image_location: 'images/plants/in_plants4.jpg',
            image_caption: 'Bow-wood',
          ),
          new Category(
            image_location: 'images/plants/in_plants6.png',
            image_caption: 'Cabinet cherry',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  //Making
  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding:
          const EdgeInsets.only(top: 10.0, bottom: 4.0, left: 4.0, right: 4.0),
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 10.0,
          child: Container(
            width: 300.0,
            child: ListTile(
              title: Image.asset(
                image_location,
                width: 200.0,
                height: 200.0,
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 10.0, left: 70.0),
                child: Container(
                    // alignment: Alignment.center,
                    child: Text(
                  image_caption,
                  style: new TextStyle(color: Colors.redAccent, fontSize: 20.0),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
