

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> ModifySuccessedCard(BuildContext context) async{
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("用户信息修改成功！"),
      );
    },
  );
}

Future<void> ModifyFailedCard(BuildContext context) async{
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("用户信息修改失败！"),
      );
    },
  );
}