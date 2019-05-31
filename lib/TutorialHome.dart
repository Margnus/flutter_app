import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "flutter tutorial",
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading:
            new IconButton(icon: new Icon(Icons.add_to_queue), onPressed: null),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      //body占屏幕的大部分
      body: new Center(
        child: new BottomItem(),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  _buildBottomItem(IconData icon, String text) {
    return new Expanded(
        flex: 1,
        child: new Center(
          child: new Row(
            //主轴居中，横向居中
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            //纵向居中
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(
                icon,
                size: 16,
                color: Colors.cyanAccent,
              ),
              new Padding(padding: new EdgeInsets.only(left: 5)),
              new Text(
                text,
                style: new TextStyle(color: Colors.blue, fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Card(
        child: new FlatButton(
            onPressed: () => print("FlatButton onPressed"),
            child: new Padding(
                padding: new EdgeInsets.only(left: 10),
                child: new Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Container(
                      child: new Text(
                        "这是一点描述",
                        style: new TextStyle(fontSize: 14, color: Colors.red),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      margin: new EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                    ),
                    new Padding(padding: new EdgeInsets.only(top: 5)),
                    new Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildBottomItem(Icons.star, "1000"),
                        _buildBottomItem(Icons.school, "1000"),
                        _buildBottomItem(Icons.link, "1000"),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }
}
