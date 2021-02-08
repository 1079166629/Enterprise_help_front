

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> ReleaseSuccessedCard(BuildContext context) async{
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("项目发布成功！"),
      );
    },
  );
}

Future<void> ReleaseFailedCard(BuildContext context) async{
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("项目发布失败！"),
      );
    },
  );
}