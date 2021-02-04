

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> FriAppSuccessedCard(BuildContext context) async{
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("好友申请发送成功！"),
      );
    },
  );
}

Future<void> FriAppFailedCard(BuildContext context) async{
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("好友申请发送失败！"),
      );
    },
  );
}