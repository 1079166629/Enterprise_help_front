import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/widgets/HYSizeFit.dart';
import 'package:flutter_app/widgets/RecentMessageItem.dart';
import 'package:flutter_app/widgets/RecomProjectItem.dart';

import 'FriendListRoute.dart';

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化HYSizeFit
    HYSizeFit.initialize(context);
    return null;
  }
}

class HomePageRoute extends StatefulWidget {
  HomePageRoute({Key key}) : super(key: key);
  @override
  HomePageRouteState createState() => HomePageRouteState();
}

class HomePageRouteState extends State<HomePageRoute> {
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize(context);
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(''),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) {
                  return new FriendListRoute();
                }),
              )
            },
          )
        ],
        leading: Builder(builder: (context) {
          return IconButton(
              icon:
              Icon(Icons.chat_bubble_outline, color: Colors.black), //自定义图标
              onPressed: () {

              });
        }
        ),
      ),
      backgroundColor:Colors.white,
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text("欢迎使用",
                      //textScaleFactor: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 30.0,
                        height: 1.2,
                        fontWeight: FontWeight.w900,
                      )),
                ),
                Padding(
                  //top: 40,
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text("企业帮!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 30.0,
                        height: 1.2,
                        fontWeight: FontWeight.w900,
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey[700]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 1.5),
                        ))),
              ],
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 10),
                      child: Text(
                        "   最近的消息",
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: HYSizeFit.setPx(400),
                        height: HYSizeFit.setRpx(420),
                        child: ListView.separated(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          itemCount: (Global.findFriendApl.applyFriends == null)? 0 : Global.findFriendApl.applyFriends.length,
                          shrinkWrap: true,
                          //列表项构造器
                          itemBuilder: FriendAplItem,
                          separatorBuilder: (BuildContext context, int index) {
                            return Container(
                              color: Colors.grey[900],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10),
                  child: Text(
                    "   为您推荐",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  //top: 330,
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: HYSizeFit.setPx(400),
                    height: HYSizeFit.setRpx(420),
                    child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        itemCount: 1,
                        itemExtent: 90,
                        shrinkWrap: true,
                        //列表项构造器
                        itemBuilder: RecomProjectItem),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}