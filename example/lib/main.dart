import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:wisetracker_sdk/wisetracker_sdk.dart';

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
    Wisetracker.initialization(
        "JQMAAB+LCAAAAAAAAACFk9tu4jAQhu/3KZAfgJzIUq1CerEgLdvGakt2peSmMmYIhjiOxk4Lefo6NFKhFfRqPP6/Gf8+Rbd7WQ5eALVQ1YR4Q5fcxj8iBK0a5KDtWBsUVTGomIQJMbj7o7Qh8caY+pfj2Hz4KjQYZHwHOORquMPIea/5XMzq+g4OJKbto09T3tp4yNN8R2XmJ9sspDKx839L2to4zUUi/wW0tfNdnnKXtnM/SbOWynmXH6zuJ20uu5htj3mQtJnb6yO6nfn5lL8e+z5OJpd8bZjeHI2Nxt465MvRsxeGwfjnOLwJA290qUxwWaeHGkg8//3gusEJJyoDBWAP8kZTRWLPdSOnV74w9mwWgC+CwzvqX0dLZTru5jKFYBqs/gstzJQZa7LbyGV4DYiAs30tEL7njZCAJA5PiaVSZS+vYNkUiS5IvGalhsjptHOk0fAEBipj3x2JDTYf1PlSK2bYAqpVolbW1JVjkWxvjbN7sYbU2rPslQ30cNf4HqrCbCx+djvOyRd4A7wTPZ8lAwAA");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      navigatorObservers: [MyRouteObserver()],
      home: Screen1(),
      routes: {
        'screen2': (context) => Screen2(),
        'screen3': (context) => Screen3(),
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wisetracker.startPage("screen1");
    print("screen1");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Screen 1'),
            SizedBox(height: 30.0),
            RaisedButton(
              child: Text('Screen 2'),
              onPressed: () => Navigator.of(context).pushNamed('screen2'),
            ),
            RaisedButton(
              child: Text('Screen 3'),
              onPressed: () => Navigator.of(context).pushNamed('screen3'),
            )
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Wisetracker.startPage("screen2");
    return Scaffold(appBar: AppBar(), body: Center(child: Text('Screen 2')));
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Wisetracker.startPage("screen2");
    return Scaffold(appBar: AppBar(), body: Center(child: Text('Screen 3')));
  }
}

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  var screenName = '';
  void _sendScreenView(PageRoute<dynamic> route) {
    var currentScreenName = route.settings.name;
    if (screenName != currentScreenName) {
      print('screenName  $screenName --> $currentScreenName ');
      if (screenName == '') {
        Wisetracker.startPage(currentScreenName);
      } else {
        Wisetracker.endPage(this.screenName);
        Wisetracker.startPage(currentScreenName);
      }
      this.screenName = currentScreenName;
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
  }
}
