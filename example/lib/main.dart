import 'package:flutter/material.dart';

import 'package:wisetracker_sdk/wisetracker_sdk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: _eventOccured2,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _eventOccured2() {
    // Wisetracker.setGoalProductArray(["aaa", "bbb", "ccc"]);
    // Wisetracker.sendTransaction;

    // Wisetracker.setOrderProductArray(["aaa", "bbb", "ccc"]);
    // Wisetracker.sendTransaction;
    // Wisetracker.setOrderQuantityArray([1]);
    // Wisetracker.setOrderAmountArray([550000]);
    // Wisetracker.setOrderNo("tr012345");
    // Wisetracker.setPageIdentity("ODR");

    Wisetracker.setOrderNo("orderno20200910");
    Wisetracker.setProduct("nike123", "nikeshoes12345");
    Wisetracker.setPageIdentity("ODR");
    Wisetracker.setOrderAmountArray([10000.0, 20000.0, 30000.0]);
    Wisetracker.setOrderQuantityArray([1, 3, 8]);
    Wisetracker.putRevenueData("pnc", "pnc11111111");
    Wisetracker.sendTransaction;
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    Wisetracker.setPageIdentity("SCR2");
    Wisetracker.setProduct("12345", "12345name");
    return Scaffold(appBar: AppBar(), body: Center(child: Text('Screen 2')));
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Wisetracker.startPage("screen2");

    Wisetracker.setPageIdentity("SCR3");

    return Scaffold(appBar: AppBar(), body: Center(child: Text('Screen 3')));
  }
}

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  // -------------------
  // ÷추가
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
  // ---------

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPush(route, previousRoute);
    // -------------------
    // ÷추가
    if (route is PageRoute) {
      _sendScreenView(route); // ÷추가
    }
    // ------
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // -------------------
    // ÷추가
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute); // ÷추가
    }
    // ------
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    // -------------------
    // ÷추가
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
    // -------------------
  }
}
