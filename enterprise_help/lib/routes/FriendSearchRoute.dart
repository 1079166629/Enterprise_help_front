
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Global.dart';

class FriendSearchRoute extends StatefulWidget {
  FriendSearchRoute({
    Key key,
    @required this.FListIndex, // 接收一个text参数
  }) : super(key: key);
  final int FListIndex;
  @override
  State<StatefulWidget> createState() {
    return FriendSearchRouteState(FListIndex);
  }
}

class FriendSearchRouteState extends State<FriendSearchRoute> {
  final int FListIndex;
  List Bs;
  FriendSearchRouteState(this.FListIndex);
  Future<bool> showSucceedConfirmDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("已向对方发送申请"),
        );
      },
    );
  }
  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    Bs = [];
    Global.Checkbox.forEach((item) {
      if (Global.getFriendList.Users[FListIndex]['bsId'].contains(item['ID'])) {
        Bs.add(item['text']);
      };
    });
    //Bs.add('该用户当前还没有设置业务范围哦');
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('用户资料'),
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(Icons.arrow_back_ios), //自定义图标
              onPressed: () {
                Navigator.pop(context);
              });
        }),
      ),
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
                                    TextSpan(
                                        text:
                                        Global.getFriendList.Users[FListIndex]['usrName']),
                                    WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Icon(Icons.person),
                                        ))
                                  ])),
                          Text(
                            "帮号：${Global.getFriendList.Users[FListIndex]['usrId']}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            "地区：${Global.getFriendList.Users[FListIndex]['usrAd']}",
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
                  "电话号码：${Global.getFriendList.Users[FListIndex]['usrTel']}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
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
                      await showSucceedConfirmDialog();
                    },
                    child: Card(
                        elevation: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.messenger_rounded),
                            Text(
                              "   发送消息",
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
  }
}