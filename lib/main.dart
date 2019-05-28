import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new HelloWorldApp());

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Hello world App",
        theme: new ThemeData(
          primaryColor: Colors.deepPurpleAccent
        ),
        home: new RandomWordWidget()
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Welcome to flutter world!"),
//        ),
//        body: new Center(
//          child: new RandomWordWidget(),
//        ),
//      ),
        );
  }
}

class RandomWordWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordState();
}

class RandomWordState extends State<RandomWordWidget> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome to flutter!"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: ()=> _pushSaved(),
          ),
        ],
      ),
      body: buildSuggestion(),
    );
  }

  _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Save suggestion"),
        ),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }

  _buildRow(WordPair w) {
    final isSaved = _saved.contains(w);
    return new ListTile(
      title: new Text(
        w.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : Colors.grey,
      ),
      onTap: () {
        setState(() {
          if (isSaved) {
            _saved.remove(w);
          } else {
            _saved.add(w);
          }
        });
      },
    );
  }

  Widget buildSuggestion() {
    return new ListView.builder(
        padding: const EdgeInsets.all(1.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该行书湖添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }
}
