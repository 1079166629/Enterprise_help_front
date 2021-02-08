import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Global.dart';

Future<bool> LoginFailedCard(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("账号或密码错误，请重新输入"),
      );
    },
  );
}