import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Dio.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/models/login.dart';
import 'package:flutter_app/widgets/HYSizeFit.dart';
import 'package:flutter_app/widgets/ModifyUserResultCard.dart';
import 'package:flutter_app/widgets/UserInfoCard.dart';

class UserInfoRoute extends StatefulWidget {
  UserInfoRoute({Key key}) : super(key: key);
  @override
  UserInfoRouteState createState() => UserInfoRouteState();
}

class UserInfoRouteState extends State<UserInfoRoute> {
  int _selectedIndex = 1;
  Login tempLogin = Global.login;
  List bsCheckbox = List();
  String usrbs = '';
  //List tempUsrbs;
  @override
  void initState() {
    usrbs = '';
    Global.business.forEach((item) {
      if (Global.usrBusiness.business.contains(item['bsId'])) {
        usrbs = usrbs.toString() + '【' + item['bsName'] + '】';
        //tempUsrbs.add(item['bsName']);
      }
    });
    Global.tempCheckbox.forEach((item) {
      if (Global.usrBusiness.business.contains(item['ID'])) {
        item['value'] = true;
      }
    });
    //赋值
    bsCheckbox = List<Map<String, dynamic>>.generate(
      Global.tempCheckbox.length,
          (index) => Map<String, dynamic>.from(Global.tempCheckbox[index]),
      growable: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('我的资料',
              textAlign: TextAlign.center,
              style: TextStyle(
                //color: Colors.grey[700],
                fontSize: 19.0,
                height: 1.2,
                //fontFamily: "Microsoft YaHei UI",
                //decorationThickness: 1.0,
                //fontWeight: FontWeight.w900,
              )),
          elevation: 0, //去掉Appbar底部阴影
          brightness: Brightness.light, //状态栏颜色
          leading: Builder(builder: (context) {
            return new IconButton(
                icon: new Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
                tooltip: '退出',
                onPressed: () => {
                  _onSaveUserInfo()
                });
          })),
      body: Column(
        //mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: [
              //用户头像
              Material(
                shape: BorderDirectional(
                  bottom: BorderSide(color: Colors.black12, width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(left: 10, top: 10),
                  height: 80,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('头像',
                          //textScaleFactor: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.0,
                            height: 1.0,
                            //fontFamily: "Microsoft YaHei UI",
                            //decorationThickness: 1.0,
                            //fontWeight: FontWeight.w800,
                          )),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ClipRect(
                              child: Image.asset(
                                "imgs/企业头像.jpeg",
                                width: 60,
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.arrow_forward_ios,
                                    color: Colors.black26, size: 20),
                                onPressed: () => {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) {
                                          //return new Personal_information();
                                        }),
                                      )
                                    })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              //ID
              Material(
                shape: BorderDirectional(
                  bottom: BorderSide(color: Colors.black38, width: 0.5),
                ),
                child: Container(
                  //alignment: Alignment.topCenter,
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 45),
                  height: 55,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('ID',
                          //textScaleFactor: 3,
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.0,
                            //fontFamily: "Microsoft YaHei UI",
                            //decorationThickness: 1.0,
                            //fontWeight: FontWeight.w800,
                          )),
                      Text(
                          tempLogin.user['usrId'].toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 19,
                            //fontWeight: FontWeight.w500
                          )),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              //企业名称
              Material(
                shape: BorderDirectional(
                  bottom: BorderSide(color: Colors.black12, width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  height: 55,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('企业名称',
                          //textScaleFactor: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.0,
                            //fontFamily: "Microsoft YaHei UI",
                            //decorationThickness: 1.0,
                            //fontWeight: FontWeight.w800,
                          )),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                tempLogin.user['usrName'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 19,
                                  //fontWeight: FontWeight.w500
                                )),
                            IconButton(
                                icon: Icon(Icons.arrow_forward_ios,
                                    color: Colors.black26, size: 20),
                                onPressed: () async {
                                  var value = await showDialog<String>(
                                      context: context, //BuildContext对象
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return new Modified_card_name(
                                          usrName:tempLogin.user['usrName']
                                        );
                                      });
                                  setState(() {
                                    if(value != null){
                                      tempLogin.user['usrName'] = value;
                                    }
                                  });
                                }
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //联系方式
              Material(
                shape: BorderDirectional(
                  bottom: BorderSide(color: Colors.black12, width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  height: 55,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('联系方式',
                          //textScaleFactor: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.0,
                            //fontFamily: "Microsoft YaHei UI",
                            //decorationThickness: 1.0,
                            //fontWeight: FontWeight.w800,
                          )),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                tempLogin.user['usrTel'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 19,
                                  //fontWeight: FontWeight.w500
                                )),
                            IconButton(
                                icon: Icon(Icons.arrow_forward_ios,
                                    color: Colors.black26, size: 20),
                                onPressed: () async {
                                  var value = await showDialog<String>(
                                  context: context, //BuildContext对象
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                  return new Modified_card_tel(
                                  usrTel:tempLogin.user['usrTel']
                                  );
                                  });
                                  setState(() {
                                  if(value != null){
                                  tempLogin.user['usrTel'] = value;
                                  }
                                  });
                                  })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //企业地址
              Material(
                shape: BorderDirectional(
                  bottom: BorderSide(color: Colors.black12, width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  height: 55,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('企业地址',
                          //textScaleFactor: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.0,
                            //fontFamily: "Microsoft YaHei UI",
                            //decorationThickness: 1.0,
                            //fontWeight: FontWeight.w800,
                          )),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                tempLogin.user['usrAd'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 19,
                                  //fontWeight: FontWeight.w500
                                )),
                            IconButton(
                                icon: Icon(Icons.arrow_forward_ios,
                                    color: Colors.black26, size: 20),
                                onPressed: () async {
                                  var value = await showDialog<String>(
                                      context: context, //BuildContext对象
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return new Modified_card_ad(
                                            usrAd:tempLogin.user['usrAd']
                                        );
                                      });
                                  setState(() {
                                    if(value != null){
                                      tempLogin.user['usrAd'] = value;
                                    }
                                  });
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              //业务范围
              Material(
                shape: BorderDirectional(
                  bottom: BorderSide(color: Colors.black12, width: 0.5),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  height: 55,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('业务范围',
                          //textScaleFactor: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.0,
                          )),
                      Padding(padding: EdgeInsets.only(left:40)),
                      Expanded(
                          child: Container(
                            width: 30,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: Text('$usrbs',
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 19,
                                          //fontWeight: FontWeight.w500
                                        )),
                                ),
                                IconButton(
                                    icon: Icon(Icons.arrow_forward_ios,
                                        color: Colors.black26, size: 20),
                                    onPressed: () async {
                                      await showDialog<List>(
                                          context: context, //BuildContext对象
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return new Modified_card_bs(bsCheckbox: bsCheckbox,);
                                          });
                                      setState(() {
                                        List templist = List();
                                        Global.tempCheckbox.forEach((item) {
                                          if (item['value']) {
                                            templist.add(item['ID']);
                                          }
                                        });
                                        print(templist);
                                        Global.usrBusiness.business = templist;
                                        initState();
                                      });
                                    })
                              ],
                            ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _onSaveUserInfo() async{
    var status = await EA(context).modifyUser();
    print(status);
    if(status == 200){
      await ModifySuccessedCard(context);
      Navigator.of(context).pop();
    }
    else await ModifyFailedCard(context);
  }
}


