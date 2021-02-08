import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Global.dart';

Future<void> RegisterFailedCard(BuildContext context) async{
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("改手机号已经被注册！"),
      );
    },
  );
}

Future<void> RegisterSuccessedCard(BuildContext context) async{
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("注册成功！您的ID号为：" + Global.register.user['usrId'].toString()),
      );
    },
  );
}