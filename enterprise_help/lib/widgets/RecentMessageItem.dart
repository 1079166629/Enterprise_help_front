
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget FriendAplItem(BuildContext context, int position) {
  return Container(
    color: Colors.white,
    margin: EdgeInsets.all(5.0),
    child: Slidable(
      actionPane: SlidableScrollActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        height: 40,
        width: double.infinity,
        color: Colors.white10,
        alignment: Alignment.centerLeft,
        child: Text(
          //"消息${datas[position]}",
          "${Global.findFriendApl.applyFriends[position]['aplUser']['usrName'].toString()}请求添加您为好友",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
      secondaryActions: <Widget>[
        Text("同意",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87, fontSize: 15)),
        Text("拒绝",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87, fontSize: 15)),
      ],
    ),
  );
}