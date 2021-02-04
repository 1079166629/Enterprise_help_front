

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Dio.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/widgets/FriAppResultCard.dart';

class UserSearchRoute extends StatefulWidget {
  UserSearchRoute({
    Key key,
    @required this.status, // 接收一个text参数
  }) : super(key: key);
  final int status;
  @override
  State<StatefulWidget> createState() {
    return UserSearchRouteState(status);
  }
}

class UserSearchRouteState extends State<UserSearchRoute> {
  final int status;
  UserSearchRouteState(this.status);
  List Bs = List();

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    print("初始化");
    Bs = [];
    Global.Checkbox.forEach((item) {
      if (Global.findUser.User['bsId'].contains(item['ID'])) {
        Bs.add(item['text']);
      }
      print(Bs);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (status == 200)
      return Scaffold(
        backgroundColor: Color.fromRGBO(239, 239, 239, 1),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
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
                        "imgs/avatar.png",
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
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(text: Global.findUser.User['usrName']),
                                      WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            child: Icon(Icons.person),
                                          ))
                                    ])),
                            Text(
                              "帮号："+Global.findUser.User['usrId'].toString(),
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              "地区：" + Global.findUser.User['usrAd'].toString(),
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "电话号码",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    Global.findUser.User['usrTel'],
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              //padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "近期业务范围",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Wrap(
                    //alignment: WrapAlignment.spaceAround,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: 5.0, // 主轴(水平)方向间距
                      runSpacing: 2.0, // 纵轴（垂直）方向间距
                      //alignment:  WrapAlignment.spaceBetween,
                      //动态创建一个List<Widget>
                      children: Bs
                          .map((item) => SizedBox(
                          width: 80,
                          height: 40,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(item,
                                    textAlign: TextAlign.center),
                              ],
                            ),
                            color: Colors.white,
                            //onPressed: (){},
                          )))
                          .toList())
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              padding: EdgeInsets.all(10),
              //padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  GestureDetector(
                      onTap: () async {
                        _onApplyFriend(context);
                      },
                      child: Card(
                          elevation: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_add),
                              Text(
                                "   添加到好友列表",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ),
          ],
        ),
      );
    else
      return Scaffold(
          backgroundColor: Colors.white,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black38,
                      ),
                      children: [
                        TextSpan(text: '未查询到好友     '),
                        WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(Icons.person_add_disabled,
                                  color: Colors.black38),
                            ))
                      ]),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ));
  }
  Future<void> _onApplyFriend(BuildContext context)  async {

    var status = await EA(context).applyFriend(Global.findUser.User['usrId']);
    if(status == 200){

      await FriAppSuccessedCard(context);
    }
    else await FriAppFailedCard(context);

  }
}