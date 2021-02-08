//登录
import 'dart:convert';
import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:flutter_app/models/business.dart';
import 'package:flutter_app/models/getFriendList.dart';
import 'package:flutter_app/models/index.dart';
import 'package:flutter_app/models/register.dart';
//flutter packages pub run json_model
import 'Global.dart';
import '../models/login.dart';
import '../models/findFriendApl.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';

class EA {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  EA([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext context;
  Options _options;
  static Dio dio = new Dio();

  static String str = "http://47.104.209.207:9999";
  String url;

  static void init() {
    // 添加缓存插件
    //dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.login.token;

  }

  // 登录接口，登录成功后返回用户信息
  Future<Login> login(int login, String pwd) async {
    String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    Map<String,dynamic> formData = Map<String,dynamic>.from({
      "usrId":login,
      "usrPwd":pwd
    });
    url = str + '/login';
    Response r = await dio.post(url, data:formData);
    //print(r.data);
    //print(r.data.runtimeType.toString());
    return Login.fromJson(r.data);
  }

  // 注册接口
  Future<Register> register(int tel, String pwd) async {

    String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    Map<String,dynamic> formData = Map<String,dynamic>.from({
      "usrTel":tel,
      "usrPwd":pwd
    });
    url = str + '/register';
    Response r = await dio.post(url, data:formData);
    //print(r.data);
    //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    //dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    return Register.fromJson(r.data);
  }

  // 获取好友请求、好友列表
  Future<FindFriendApl> findFriendApl() async {
    List formData = [{
      "token": Global.login.token
    }];
    url = str + '/findApplyFriend';
    Response r = await dio.post(url, data:formData);
    //print(r.data);
    return FindFriendApl.fromJson(r.data);
  }
  Future<GetFriendList> getFriendList() async {
    List formData = [{
      "token": Global.login.token
    }];
    url = str + '/allFriend';
    Response r = await dio.post(url, data:formData);
    //print(r.data);
    return GetFriendList.fromJson(r.data);
  }

  // 获取当前业务总范围及用户业务范围
  Future<List> business() async {
    url = str + '/business/all';
    Response r = await dio.post(url);
    //print(r.data);
    //print(r.data.runtimeType.toString());
    //return Business.fromJson(r.data);
    return r.data;
  }
  Future<UsrBusiness> usrBusiness() async {
    List formData = [{
      "token": Global.login.token
    }];
    url = str + '/business/UserAll';
    Response r = await dio.post(url, data:formData);
    //print(r.data);

    return UsrBusiness.fromJson(r.data);
    //return json.decode(r.data);
  }
  //修改用户资料
  Future<int> modifyUser() async {
    List formData = [
      {
      "token": Global.login.token
      },
      {
        "usrName":Global.login.user['usrName'],
        "usrPwd":Global.login.user['usrPwd'],
        "usrTel":Global.login.user['usrTel'],
        "usrAd":Global.login.user['usrAd']
      },
      {
        "business":Global.usrBusiness.business
      }
    ];
    url = str + '/modifyUser';
    Response r = await dio.post(url, data:formData);
    //print(r.data);

    return r.data['status'];
    //return UsrBusiness.fromJson(r.data);
    //return json.decode(r.data);
  }
  //查找好友
  Future<FindUser> findUser(int usrId) async {
    Map<String,dynamic> formData = Map<String,dynamic>.from(
        {
          "token": Global.login.token,
          "usrId":usrId,
        }
    );
    url = str + '/findUser';
    Response r = await dio.post(url, data:formData);
    //print(r.data);
    return FindUser.fromJson(r.data);
  }
  //发送好友申请
  Future<int> applyFriend(int usrId) async {
    List formData = (
        [
          {
            "token": Global.login.token,
          },
          {
            "usrId":usrId,
          }
        ]
    );
    url = str + '/applyFriend';
    Response r = await dio.post(url, data:formData);
    //print(r.data);
    return r.data['status'];
  }
  //发布需求订单
  Future<ReleaseProject> releaseProject() async {
    List formData = [
      {
        "token": Global.login.token
      },
      {
        "pjName":Global.creatProject.pjName,
        "pjDeltime":Global.creatProject.pjDeltime,
      },
    ];
    Global.creatProject.pd.forEach((item) {
      formData.add(
          {
            'pdName':item['pdName'],
            'pdDemand':item['pdDemand'],
            //'pdDeltime':formatDate(item['pdDeltime'], [yyyy, '-', mm, '-', d, ' ', HH, ':', nn, ':', ss]),
            'pdDeltime':item['pdDeltime'],
            'bsIds':item['bsIds'],
          });
    });
    print(formData);
    url = str + '/requirement/create';
    Response r = await dio.post(url, data:formData);
    print(r.data);

    //return r.data['status'];
    return ReleaseProject.fromJson(r.data);
    //return json.decode(r.data);
  }
}