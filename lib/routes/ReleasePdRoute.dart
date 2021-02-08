
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/widgets/UserInfoCard.dart';

class ReleasePdRoute extends StatefulWidget {
  ReleasePdRoute({
    Key key,
    @required this.pd_Index, // 接收一个text参数
  }) : super(key: key);
  final int pd_Index;
  @override
  State<StatefulWidget> createState() {
    return ReleasePdRouteState(pd_Index);
  }
}

class ReleasePdRouteState extends State<ReleasePdRoute> {
  final int pd_Index;
  TextEditingController newName = TextEditingController();
  TextEditingController newDemand = TextEditingController();
  TextEditingController newTime = TextEditingController();
  List bsid = List();
  List bsCheckbox = List();
  String pdbs = '';
  ReleasePdRouteState(this.pd_Index);

  @override
  void initState() {
    // TODO: implement initState
    pdbs = '';
    //Global.creatProject.pd[pd_Index]['bsIds'] = [];
    Global.tempCheckbox = List<Map<String, dynamic>>.generate(
      Global.Checkbox.length,
          (index) => Map<String, dynamic>.from(Global.Checkbox[index]),
      growable: true,
    );
    Global.business.forEach((item) {
      if (Global.creatProject.pd[pd_Index]['bsIds'].contains(item['bsId'])) {
        pdbs = pdbs.toString() + '【' + item['bsName'] + '】';
        //tempUsrbs.add(item['bsName']);
      }
    });
    Global.tempCheckbox.forEach((item) {
      if (Global.creatProject.pd[pd_Index]['bsIds'].contains(item['ID'])) {
        item['value'] = true;
      }
    });
    //赋值
    bsCheckbox = List<Map<String, dynamic>>.generate(
      Global.tempCheckbox.length,
          (index) => Map<String, dynamic>.from(Global.tempCheckbox[index]),
      growable: true,
    );
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('发布工序',
              textAlign: TextAlign.center,
              style: TextStyle(
                //color: Colors.grey[700],
                fontSize: 20.0,
                height: 1.2,
                //fontFamily: "Microsoft YaHei UI",
                //decorationThickness: 1.0,
                //fontWeight: FontWeight.w900,
              )),
          actions: <Widget>[
            Padding(
                padding: new EdgeInsets.only(),
                child: new IconButton(
                  onPressed: () => {
                    Navigator.of(context).pop()
                  },
                  icon: Icon(
                    Icons.done,
                    color: Colors.black54,
                    size: 27,
                  ),
                )
              //导航栏右侧菜单
            )
          ],
          elevation: 0, //去掉Appbar底部阴影
          brightness: Brightness.light, //状态栏颜色
          leading: Builder(builder: (context) {
            return new IconButton(
              icon: new Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              tooltip: '退出',
              onPressed: () {
                //返回
                Navigator.of(context).pop(this);
              },
            );
          })),
      body: Theme(
        data: new ThemeData(
          primaryColor: Colors.black45,
        ),
        child: Column(
          children: [
            //工序名称
            Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "请输入工序名称",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextField(
                        autofocus: false,
                        controller: newName,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          hintText: Global.creatProject.pd[pd_Index]['pdName'],
                          hintStyle: new TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide()),
                        ),
                        onChanged:(val){
                          Global.creatProject.pd[pd_Index]['pdName'] = val;
                        },
                      ),
                    )
                  ],
                )),
            //需求量
            Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "请输入需求量",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                        //background: new Paint()..color = Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextField(
                        autofocus: false,
                        controller: newDemand,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          hintText: Global.creatProject.pd[pd_Index]['pdDemand'].toString(),
                          hintStyle: new TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide()),
                        ),
                        onSubmitted:(val){
                          Global.creatProject.pd[pd_Index]['pdDemand'] = int.parse(val);
                          //print(Global.creatProject.pd[pd_Index]['pdDemand'].runtimeType);
                        },
                        inputFormatters: [
                          WhitelistingTextInputFormatter(RegExp("[0-9]"))
                        ],
                      ),
                    )
                  ],
                )),
            //交期
            Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "请设置截止日期",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                        //background: new Paint()..color = Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0, top: 10),
                      child: TextField(
                        enableInteractiveSelection: false,
                        onTap: () { FocusScope.of(context).requestFocus(new FocusNode()); },

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          hintText: Global.creatProject.pd[pd_Index]['pdDeltime'],
                          hintStyle: new TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          suffixIcon: IconButton(
                            icon: new Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            ),
                            onPressed: () async {
                              var result = await showDatePicker(
                                context: context,
                                //locale: Locale('zh'),
                                initialDate: DateTime.now(),
                                selectableDayPredicate: (DateTime day) {
                                  return day
                                      .difference(DateTime.now())
                                      .inDays < 365;
                                },
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2023),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.from(
                                        colorScheme: ColorScheme
                                            .light()),
                                    child: child,
                                  );
                                },
                              );
                              setState(() {
                                Global.creatProject.pd[pd_Index]['pdDeltime'] = formatDate(result, [yyyy, '-', mm, '-', d, ' ', HH, ':', nn, ':', ss]);
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide()),
                        ),
                      ),
                    )
                  ],
                )),
            //业务范围
            Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "请设置业务范围",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                        //background: new Paint()..color = Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0, top: 10),
                      child: TextField(
                        enableInteractiveSelection: false,
                        onTap: () { FocusScope.of(context).requestFocus(new FocusNode()); },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          hintText: '$pdbs',
                          //hintText: 'hah',
                          hintStyle: new TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          suffixIcon: IconButton(
                            icon: new Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
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
                                  Global.creatProject.pd[pd_Index]['bsIds'] = templist;
                                  initState();
                                });
                              }
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide()),
                        ),
                      ),
                    )
                  ],
                )),

          ],
        ),
      )

    );
  }
}