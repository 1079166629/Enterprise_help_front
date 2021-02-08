
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/routes/FriendSearchRoute.dart';
import 'package:flutter_app/widgets/HYSizeFit.dart';
import 'package:flutter_app/widgets/SearchDelegate.dart';

class FriendListRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FriendListRouteState();
  }
}

class FriendListRouteState extends State<FriendListRoute> {

  Widget _item_CardBuilder(BuildContext context, int position) {
    return Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: OutlineButton(
            borderSide: BorderSide(
                width: 0.1,
                color: Colors.white
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  //top: HYSizeFit.setRpx(20),
                  //left: HYSizeFit.setPx(1),

                  child: ClipRect(
                    child: Image.asset(
                      "imgs/企业头像.jpeg",
                      width: 50,
                    ),
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RichText(text: TextSpan(
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  //var name = FriendList[position]['usrName'];
                                  text:'${Global.getFriendList.Users[position]['usrName']}',
                                ),
                                WidgetSpan(child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Icon(Icons.person),
                                ))

                              ]
                          )
                          ),
                          Text(
                            "帮号：${Global.getFriendList.Users[position]['usrId']}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            "地区：${Global.getFriendList.Users[position]['usrAd']}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    )),

              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) {
                  return new FriendSearchRoute(FListIndex: position);
                }),
              );

            },
          ),
        ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () => {
              showSearch(context: context, delegate: CustomSearchDelegate(hintText: '请输入对方ID号'))
            },
          )
        ],
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(Icons.arrow_back_ios), //自定义图标
              onPressed: () {
                Navigator.pop(context);
              });
        }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Padding(
                  //top: 50,
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text("欢迎使用",
                      //textScaleFactor: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 30.0,
                        height: 1.2,
                        //fontFamily: "Microsoft YaHei UI",
                        //decorationThickness: 1.0,
                        fontWeight: FontWeight.w900,
                      )),
                ),
                Padding(
                  //top: 40,
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text("企业帮!",
                      //textScaleFactor: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 30.0,
                        height: 1.2,
                        //fontFamily: "Microsoft YaHei UI",
                        //decorationThickness: 1.0,
                        fontWeight: FontWeight.w900,
                      )),
                ),
                Padding(
                  //top: 80,
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
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  //top: 300,
                  //left: 10,
                  padding: const EdgeInsets.only(top: 5.0, left: 10, bottom:10),
                  child: Text(
                    "   好友列表",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 17.0,
                      //background: new Paint()..color = Colors.yellow,
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    width: HYSizeFit.setPx(400),
                    //height: HYSizeFit.setRpx(1000),

                    child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        itemCount: (Global.getFriendList == null)? 0 : Global.getFriendList.Users.length,
                        itemExtent: 100,
                        shrinkWrap: true,
                        //列表项构造器
                        itemBuilder: _item_CardBuilder),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}