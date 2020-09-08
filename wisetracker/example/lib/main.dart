import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:wisetracker/wisetracker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static String _platformVersion = 'Unknown';
  @override
  void initState() {
    super.initState();
    Wisetracker.init(
          "JQMAAB+LCAAAAAAAAACFk9tu4jAQhu/3KZAfgJzIUq1CerEgLdvGakt2peSmMmYIhjiOxk4Lefo6NFKhFfRqPP6/Gf8+Rbd7WQ5eALVQ1YR4Q5fcxj8iBK0a5KDtWBsUVTGomIQJMbj7o7Qh8caY+pfj2Hz4KjQYZHwHOORquMPIea/5XMzq+g4OJKbto09T3tp4yNN8R2XmJ9sspDKx839L2to4zUUi/wW0tfNdnnKXtnM/SbOWynmXH6zuJ20uu5htj3mQtJnb6yO6nfn5lL8e+z5OJpd8bZjeHI2Nxt465MvRsxeGwfjnOLwJA290qUxwWaeHGkg8//3gusEJJyoDBWAP8kZTRWLPdSOnV74w9mwWgC+CwzvqX0dLZTru5jKFYBqs/gstzJQZa7LbyGV4DYiAs30tEL7njZCAJA5PiaVSZS+vYNkUiS5IvGalhsjptHOk0fAEBipj3x2JDTYf1PlSK2bYAqpVolbW1JVjkWxvjbN7sYbU2rPslQ30cNf4HqrCbCx+djvOyRd4A7wTPZ8lAwAA");
   
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Wisetracker.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>(); // NEW
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Version ' + _MyAppState._platformVersion),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair); // NEW
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        // NEW from here...
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        // NEW lines from here...
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      }, // ... to here.
    );
  }

  void _setProductArray() {
    setState(() {
      Wisetracker.setOrderProduct("orderProuctCode");
      //Wisetracker.setProduct("nike123", "nikeshoes12345");
      Wisetracker.setOrderAmount(100.50);
      Wisetracker.sendTransaction;
    });
  }

  void _pushSaved() {
    log('pushSaved');
    print("pushsaved print");
    //Wisetracker.setGoalProduct("productCode");
    Wisetracker.setGoalProductArray(['aaa', 'bbbb', 'cddd', 'dddd', 'eeee']);
    print("sendGoalData");
    Wisetracker.sendGoalData;
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
            floatingActionButton: FloatingActionButton(
              onPressed: _setProductArray,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        }, // ...to here.
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
