import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/ReleaseProject.dart';
import 'package:flutter_app/models/business.dart';
import 'package:flutter_app/models/creatProject.dart';
import 'package:flutter_app/models/findFriendApl.dart';
import 'package:flutter_app/models/findUser.dart';
import 'package:flutter_app/models/getFriendList.dart';
import 'package:flutter_app/models/login.dart';
import 'package:flutter_app/models/register.dart';
import 'package:flutter_app/models/usrBusiness.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'Dio.dart';

class Global {
  //static SharedPreferences _prefs;
  static Login login = Login();
  static Register register = Register();
  // 网络缓存对象
  //static Business bussiness = Business();
  static List business = List();
  static UsrBusiness usrBusiness = UsrBusiness();
  static List Checkbox = [
    {'text': '机加工', 'value': false, 'ID': 1},
    {'text': '车削', 'value': false, 'ID': 2},
    {'text': '螺纹', 'value': false, 'ID': 3},
    {'text': '精密', 'value': false, 'ID': 4},
    {'text': '铣洗', 'value': false, 'ID': 5},
    {'text': '钻削', 'value': false, 'ID': 6},
    {'text': '机械装配', 'value': false, 'ID': 7},
  ];
  static List tempCheckbox = List<Map<String, dynamic>>.generate(
    Checkbox.length,
        (index) => Map<String, dynamic>.from(Checkbox[index]),
    growable: true,
  );
  static FindFriendApl findFriendApl = FindFriendApl();
  static GetFriendList getFriendList = GetFriendList();
  static FindUser findUser = FindUser();

  static CreatProject creatProject = CreatProject();

  static ReleaseProject releaseProject = ReleaseProject();
  //初始化全局信息，会在APP启动时执行
  static Future init() async {

    //初始化网络请求相关配置
    EA.init();
  }

}