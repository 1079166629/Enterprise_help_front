
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Dio.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/widgets/ReleasePjResultCard.dart';

import 'ReleasePdRoute.dart';

class ProjectEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProjectEditState();
  }
}

class ProjectEditState extends State<ProjectEdit> {
  TextEditingController newName = TextEditingController();
  TextEditingController newExp = TextEditingController();
  void initState() {
    Global.creatProject.pd = List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('发布需求',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                height: 1.2,
              )),
          actions: <Widget>[
            Padding(
                padding: new EdgeInsets.only(),
                child: new FlatButton(
                  child: Text(
                    "提交",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () => ({
                      _onUploadPj()
                  }),
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
              onPressed: () => ({
                Navigator.of(context).pop()
              }),
            );
          })),
      floatingActionButton: FloatingActionButton(
        child: Icon(
        Icons.add,
        color: Colors.black54,
        ),
        backgroundColor: Colors.white,

        onPressed: () => {
          setState(() {
            Global.creatProject.pd.add(
              {
                "pdName": " ",
                "pdDemand": " ",
                "pdDeltime": "",
                "bsIds": []
              },
            );
          }),
        },
      ),
      body: Theme(
        data: new ThemeData(
          primaryColor: Colors.black45,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //注：
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20),
              child: Text(
                "在发布需求之前请先确认您已完善个人信息",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  //background: new Paint()..color = Colors.yellow,
                ),
              ),
            ),
            //项目名称
            Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "请输入项目名称",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                        //background: new Paint()..color = Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0, top: 10),
                      child: TextField(
                        autofocus: false,
                        controller: newName,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0),
                          hintText: Global.creatProject.pjName,
                          hintStyle: new TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide()),
                        ),
                        onSubmitted:(val){
                          Global.creatProject.pjName = val;
                        },
                      ),
                    )
                  ],
                )),
            //截止日期
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
                          hintText: Global.creatProject.pjDeltime,
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
                                Global.creatProject.pjDeltime = formatDate(result, [yyyy, '-', mm, '-', d, ' ', HH, ':', nn, ':', ss]);
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
            //备注
            Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "请输入项目说明",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                        //background: new Paint()..color = Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0, top: 10),
                      child: TextField(
                        autofocus: false,
                        controller: newExp,
                        maxLines: 10,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        //controller: name,
                        //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//只允许输入数字
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0, top: 20),
                          hintText: " 输入项目说明",
                          hintStyle: new TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide()),
                        ),
                        onSubmitted:(val){
                          Global.creatProject.pjNote = val;
                        },
                      ),
                    )
                  ],
                )),
            //编辑工序
            Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "请编辑项目工序信息（点击‘+’以增加工序并编辑）",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                        //background: new Paint()..color = Colors.yellow,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Wrap(
                          children: [
                            Wrap(
                              spacing: 1.0,
                              children: List.generate(Global.creatProject.pd.length, (index) {
                                return Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 70,
                                    maxHeight: 70,
                                  ),
                                  child: RaisedButton(
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(builder: (context) {
                                          return new ReleasePdRoute(
                                              pd_Index: index
                                          );
                                        }),
                                      )
                                    },
                                    color: Colors.white,
                                    child: Text((index + 1).toString()),
                                    shape: CircleBorder(),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
  void _onUploadPj()async{

    Global.releaseProject = await EA(context).releaseProject();
    if(Global.releaseProject.status == 200){
      await ReleaseSuccessedCard(context);
      Navigator.of(context).pop();
    }
    else await ReleaseFailedCard(context);

  }

}