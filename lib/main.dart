import 'package:flutter/material.dart';
import 'package:flutter_app/routes/FriendCircleRoute.dart';
import 'package:flutter_app/routes/HomePageRoute.dart';
import 'package:flutter_app/routes/LoginRoute.dart';
import 'package:flutter_app/routes/MyPageRoute.dart';
import 'package:flutter_app/widgets/HYSizeFit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      locale: Locale('zh'),
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          //textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
          //visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            elevation: 0,
          )),
      routes: {
        "/": (context) => LoginRoute(),
        "Home": (context) => HomePageRoute(),
        "Circle": (context) => FriendCircleRoute(),
        "My": (context) => MyPageRoute(),
      },
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({Key key}) : super(key: key);
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  List<Widget> pages = List<Widget>();

  @override
  void initState() {
    pages
      ..add(HomePageRoute())
      ..add(FriendCircleRoute())
      ..add(MyPageRoute());
  }
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize(context);
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.explore), title: Text('朋友圈')),
          BottomNavigationBarItem(icon: Icon(Icons.face), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

