import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/widgets/HYSizeFit.dart';

import 'FriendListRoute.dart';
import 'UserInfoRoute.dart';

class MyPageRoute extends StatefulWidget {
  MyPageRoute({Key key}) : super(key: key);
  @override
  MyPageRouteState createState() => MyPageRouteState();
}

class MyPageRouteState extends State<MyPageRoute> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        title: Text(''),
        leading: Text(''),
      ),
      body: Column(
        //mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: [
              //用户头像
              Material(
                shape: BorderDirectional(
                  //bottom: BorderSide(color: Colors.grey[400], width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(right: 10, left: 10, top:10),
                  height: 120,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRect(
                              child: Image.asset(
                                "imgs/企业头像.jpeg",
                                width: 60,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left:20),
                                child:Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(Global.login.user['usrName'],
                                        //textScaleFactor: 3,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          height: 1.0,
                                          //fontFamily: "Microsoft YaHei UI",
                                          //decorationThickness: 1.0,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(top:10),
                                      child: Text(Global.login.user['usrAd'],
                                          //textScaleFactor: 3,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            height: 1.2,
                                            //fontFamily: "Microsoft YaHei UI",
                                            //decorationThickness: 1.0,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                //没有传值
                                  builder: (context)=>UserInfoRoute()
                              )
                          )
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              //支付
              Material(
                shape: BorderDirectional(
                  //bottom: BorderSide(color: Colors.grey[400], width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(right: 10, left: 10),
                  height: 45,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Icon(Icons.account_balance_wallet),
                                      )),
                                  TextSpan(text: '    支付'),
                                ])),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () => {}),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              //我发布的
              Material(
                shape: BorderDirectional(
                  //bottom: BorderSide(color: Colors.grey[400], width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(right: 10, left: 10),
                  height: 45,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Icon(Icons.group_add),
                                      )),
                                  TextSpan(text: '    我发布的'),
                                ])),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () => {}),
                    ],
                  ),
                ),
              ),
              //我包揽的
              Material(
                shape: BorderDirectional(
                  //bottom: BorderSide(color: Colors.grey[400], width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(right: 10, left: 10),
                  height: 45,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Icon(Icons.content_paste),
                                      )),
                                  TextSpan(text: '    我包揽的'),
                                ])),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () => {}),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              //消息列表
              Material(
                shape: BorderDirectional(
                  //bottom: BorderSide(color: Colors.grey[400], width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(right: 10, left: 10),
                  height: 45,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Icon(Icons.chat_bubble_outline),
                                      )),
                                  TextSpan(text: '    消息列表'),
                                ])),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () => {}),
                    ],
                  ),
                ),
              ),
              //好友列表
              Material(
                shape: BorderDirectional(
                  //bottom: BorderSide(color: Colors.grey[400], width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(right: 10, left: 10),
                  height: 45,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                                children: [
                                  WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Icon(Icons.account_circle),
                                      )),
                                  TextSpan(text: '    好友列表'),
                                ])),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () => {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(builder: (context) {
                                return new FriendListRoute();
                              }),
                            )
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //Spacer(),
          Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context){
                      //return new LoginPage();
                    }),
              );
            },
            child: Material(
              shape: BorderDirectional(
                //bottom: BorderSide(color: Colors.grey[400], width: 0.5),
              ),
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(right: 10, left: 10, top:10, bottom:10),
                height: 55,
                color: Colors.white,
                child: Text("退出登录",
                    //textScaleFactor: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      //height: 1.0,
                      //fontFamily: "Microsoft YaHei UI",
                      //decorationThickness: 1.0,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
          )


        ],
      ),

    );
  }
}