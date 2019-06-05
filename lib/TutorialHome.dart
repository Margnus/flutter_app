import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "flutter tutorial",
    home: new TutorialHome(),
  ));
}

// ignore: must_be_immutable
class TutorialHome extends StatelessWidget {
//  List<Widget> _list;

  Widget buildGrid() {
    return new GridView.extent(maxCrossAxisExtent: 150.0,
    padding: EdgeInsets.all(4.0),
    mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: buildGridItem(30),
    );
  }

  buildGridItem(int count) {
    return new List<Container>.generate(count,
        (int index) =>  new Container(child: new Image.asset('image/ic_wechat.png')));
  }

  @override
  Widget build(BuildContext context) {
//    _list = new List();
//    _list.add(new Text(
//      "ttttt",
//      style: new TextStyle(fontSize: 14, color: Colors.red),
//    ));
//    _list.add(new Text(
//      "ttttt",
//      style: new TextStyle(fontSize: 14, color: Colors.blue),
//    ));
//    _list.add(new Text(
//      "ttttt",
//      style: new TextStyle(fontSize: 14, color: Colors.black),
//    ));
//    _list.add(new Text(
//      "ttttt",
//      style: new TextStyle(fontSize: 14, color: Colors.blueAccent),
//    ));
//    _list.add(new Text(
//      "ttttt",
//      style: new TextStyle(fontSize: 14, color: Colors.blueGrey),
//    ));

    return new Scaffold(
//      drawer: new Drawer(
//        child: new Sem,
//      ),
//      bottomNavigationBar: new N,
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
//        bottom: new TabBar(tabs: _list, controller: TabController(length: 5),),
      ),
      //body占屏幕的大部分
      body: buildGrid(),
//          new Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              new Image.asset('image/ic_wechat.png', fit: BoxFit.cover),
//              new Image.network("https://flutterchina.club/tutorials/layout/images/row-spaceevenly-visual.png", fit: BoxFit.cover,)
//            ],
//          ),

//            ListView.builder(
//              itemBuilder: (context, index) {
//                return new BottomItem();
//              },
//              itemCount: 20,
//            ),
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
          child: new Column(
            //主轴居中，横向居中
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            //纵向居中
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(
                icon,
                size: 16,
                color: Colors.blue,
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
                  mainAxisSize: MainAxisSize.min,
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
                    ),
                    new Padding(padding: new EdgeInsets.only(top: 5)),
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
