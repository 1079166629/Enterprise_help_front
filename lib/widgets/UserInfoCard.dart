
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/models/usrBusiness.dart';
import 'package:flutter_app/routes/UserInfoRoute.dart';

import 'BusinessScope.dart';

class Modified_card_name extends Dialog{

  Modified_card_name({
    Key key,
    @required this.usrName
}) : super(key: key);
  TextEditingController newName = TextEditingController();

  String usrName;
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      type: MaterialType.transparency,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: new Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                  width: 350,
                  height: 150,
                  decoration: ShapeDecoration(
                    color: Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:EdgeInsets.only(top: 10),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.arrow_back_ios,color: Colors.grey,),
                                    onPressed: ()=>{Navigator.of(context).pop(usrName)}

                                ),
                                Text(
                                  "更改企业名称",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),

                            FlatButton(
                              child:Text(
                                "保存",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(newName.text);
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextField(
                          autofocus: true,
                          controller: newName,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          //controller: name,
                          //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//只允许输入数字
                          decoration: InputDecoration(
                            hintText: "输入企业名称",
                            hintStyle: new TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),

                          ),
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      )


    );
  }
}

class Modified_card_tel extends Dialog{

  Modified_card_tel({
    Key key,
    @required this.usrTel
  }) : super(key: key);
  TextEditingController newTel = TextEditingController();

  String usrTel;
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
        type: MaterialType.transparency,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: new Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                    width: 350,
                    height: 150,
                    decoration: ShapeDecoration(
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:EdgeInsets.only(top: 10),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_back_ios,color: Colors.grey,),
                                      onPressed: ()=>{Navigator.of(context).pop(usrTel)}

                                  ),
                                  Text(
                                    "更改企业联系方式",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),

                              FlatButton(
                                child:Text(
                                  "保存",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(newTel.text);
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: TextField(
                            autofocus: true,
                            controller: newTel,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            //controller: name,
                            //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//只允许输入数字
                            decoration: InputDecoration(
                              hintText: "输入企业联系方式",
                              hintStyle: new TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}

class Modified_card_ad extends Dialog{

  Modified_card_ad({
    Key key,
    @required this.usrAd
  }) : super(key: key);
  TextEditingController newAd = TextEditingController();

  String usrAd;
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
        type: MaterialType.transparency,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: new Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                    width: 350,
                    height: 150,
                    decoration: ShapeDecoration(
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:EdgeInsets.only(top: 10),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_back_ios,color: Colors.grey,),
                                      onPressed: ()=>{Navigator.of(context).pop(usrAd)}

                                  ),
                                  Text(
                                    "更改企业地址",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),

                              FlatButton(
                                child:Text(
                                  "保存",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(newAd.text);
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: TextField(
                            autofocus: true,
                            controller: newAd,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            //controller: name,
                            //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//只允许输入数字
                            decoration: InputDecoration(
                              hintText: "输入企业地址",
                              hintStyle: new TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}

class Modified_card_bs extends Dialog{
  //TextEditingController newBs = TextEditingController();
  Modified_card_bs({
    Key key,
    @required this.bsCheckbox
  }) : super(key: key);
  List bsCheckbox;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
        type: MaterialType.transparency,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: new Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                    width: 350,
                    height: 350,
                    decoration: ShapeDecoration(
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:EdgeInsets.only(top: 10),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.arrow_back_ios,color: Colors.grey,),
                                      onPressed: ()=>{
                                        //print(Global.tempCheckbox),
                                        //print(bsCheckbox),
                                        Global.tempCheckbox = List<Map<String, dynamic>>.generate(
                                          bsCheckbox.length,
                                      (index) => Map<String, dynamic>.from(bsCheckbox[index]),
                                      growable: true,
                                      ),
                                        Navigator.of(context).pop()
                                      }

                                  ),
                                  Text(
                                    "选择业务范围",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),

                              FlatButton(
                                child:Text(
                                  "保存",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: BusinessScope(),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}