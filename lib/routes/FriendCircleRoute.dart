import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/widgets/HYSizeFit.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'ReleasePjRoute.dart';


class FriendCircleRoute extends StatefulWidget {
  FriendCircleRoute({Key key}) : super(key: key);
  @override
  FriendCircleRouteState createState() => FriendCircleRouteState();
}

class FriendCircleRouteState extends State<FriendCircleRoute> {
  //int _selectedIndex = 1;
  Widget _item_CardBuilder(BuildContext context, int position) {
    return Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: OutlineButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            borderSide: BorderSide(width: 0.5, color: Colors.black38),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 4,
                    //top: HYSizeFit.setRpx(20),
                    //left: HYSizeFit.setPx(1),
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRect(
                            child: Image.asset(
                              "imgs/激光打印机.jpg",
                              width: 50,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10, left: 15.0),
                                child: Text(
                                  "开门红机械生产企业",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500
                                    //background: new Paint()..color = Colors.yellow,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 20.0, left: 15),
                                  child: Container(
                                    width: HYSizeFit.setPx(260),
                                    child: Text(
                                      "最近有搞机加工的朋友吗，本公司急需，价格可以面谈！！",
                                      softWrap: true,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500
                                        //background: new Paint()..color = Colors.yellow,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "发布日期：2020-10-01",
                          softWrap: true,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w300
                            //background: new Paint()..color = Colors.yellow,
                          ),
                        ),
                        Text(
                          "         发布日期：2020-10-01",
                          softWrap: true,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w300
                            //background: new Paint()..color = Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                        padding: EdgeInsets.only(top: 5),
                            child: OverflowBox(
                              maxWidth: HYSizeFit.setPx(355),
                              child: Container(
                                decoration: new BoxDecoration(
                                  //border: new Border.all(color: Colors.black12, width: 0.5), // 边色与边宽度
                                  color: Colors.black12, // 底色
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)), // 也可控件一边圆角大小
                                  //borderRadius: new BorderRadius.vertical(top: Radius.elliptical(20, 60)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "该订单中您可能对这些业务感兴趣：",
                                        softWrap: true,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w300
                                          //background: new Paint()..color = Colors.yellow,
                                        ),
                                      ),
                                      Wrap(
                                        //alignment: WrapAlignment.spaceAround,
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          spacing: 5.0, // 主轴(水平)方向间距
                                          runSpacing: 2.0, // 纵轴（垂直）方向间距
                                          //alignment:  WrapAlignment.spaceBetween,
                                          //动态创建一个List<Widget>
                                          children: Global.business
                                              .map((item) => Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5.0)),
                                            elevation: 0,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(2),
                                                  child: Text(
                                                    '',
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12.0,
                                                        fontWeight: FontWeight.w300
                                                      //background: new Paint()..color = Colors.yellow,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            color: Colors.white,
                                            //onPressed: (){},
                                          ))
                                              .toList()),
                                    ],
                                  ),
                                )
                              )

                            )
                          )
                        ),
              ],
            ),
            onPressed: () {
            },
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize(context);
    return Scaffold(
      //backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        title: Text(''),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () => {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) {
                  return new ProjectEdit();
                }),
              )
            },
          )
        ],
        leading: Builder(builder: (context) {
          return IconButton(
              icon:
              Icon(Icons.chat_bubble_outline, color: Colors.black), //自定义图标
              onPressed: () {});
        }),
      ),
      body: Column(
        //direction: Axis.vertical,
        children: [
          Expanded(
            child: Container(
              width: HYSizeFit.setPx(400),
              //height: HYSizeFit.setRpx(1000),
              child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  itemCount: 1,
                  itemExtent: 200,
                  shrinkWrap: true,
                  //列表项构造器
                  itemBuilder: _item_CardBuilder),
            ),
          )
        ],
      ),
    );
  }
}
