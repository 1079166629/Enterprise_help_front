import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Dio.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/models/register.dart';
import 'package:flutter_app/widgets/RegisterResultCard.dart';
import '../widgets/ColorUtils.dart';
import 'LoginRoute.dart';

class RegisterRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterRouteState();//类名后要加()
  }
}

class _RegisterRouteState extends State<RegisterRoute>{
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _pwdconfirController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  bool pwdShow = false; //密码是否显示明文
  bool _switchSelected=false; //维护单选开关状态
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0, //去掉Appbar底部阴影
            brightness: Brightness.light,//状态栏颜色
            leading: Builder(builder: (context) {
              return new IconButton(
                  icon: new Icon(Icons.arrow_back_ios,color: Colors.grey,),
                  tooltip: '退出',
                  onPressed: ()=>{Navigator.pop(context)}
              );
            })
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:32.0,left:16,bottom:1),
                child: RichText(
                  text: TextSpan(
                    text: '请输入手机号与密码',
                    style: TextStyle(color: Colors.black, fontSize: 24.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:1.0,right: 16,left: 26,bottom: 16),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: _switchSelected,
                        activeColor: Colors.grey, //选中时的颜色
                        onChanged:(value){
                          setState(() {
                            _switchSelected = value;
                          });
                        }),
                    RichText(
                      text: TextSpan(
                        text: '我已阅读并同意',
                        style: TextStyle(color:Colors.grey,fontSize: 13.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: '《用户协议》 ',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                },
                              style: TextStyle(color:ColorsUtil.hexColor(0x47C7DD))
                          ),
                          TextSpan(
                              text: '和 '
                          ),
                          TextSpan(
                              text: '《隐私条款》',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                },
                              style:
                              TextStyle(color:ColorsUtil.hexColor(0x47C7DD))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right:20, left:20),
                  child: Column(
                    children: <Widget>[
                      Theme(
                          data:new ThemeData(
                            primaryColor: Colors.black,
                          ),
                          child: Form(
                            key: _formKey,
                            autovalidate: true,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  //autofocus: _nameAutoFocus,
                                    controller: _telController,
                                    decoration: InputDecoration(
                                      labelText: '手机号',
                                      hintText: '手机号',
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    // 校验用户名（不能为空）
                                    validator: (v) {
                                      if(!_switchSelected) return '请先同意用户须知';
                                      if(v.trim().isEmpty) return '请输入您的手机号码';
                                      return null;
                                    }),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                TextFormField(
                                  controller: _pwdController,
                                  //autofocus: !_nameAutoFocus,
                                  decoration: InputDecoration(
                                      labelText: '密码',
                                      hintText: '密码',
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                            pwdShow ? Icons.visibility_off : Icons.visibility
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            pwdShow = !pwdShow;
                                          });
                                        },
                                      )),
                                  obscureText: !pwdShow,
                                  //校验密码（不能为空）
                                  validator: (v) {
                                    if(!_switchSelected) return '请先同意用户须知';
                                    if(v.trim().isEmpty) return '请输入密码';
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                TextFormField(
                                  controller: _pwdconfirController,
                                  //autofocus: !_nameAutoFocus,
                                  decoration: InputDecoration(
                                      labelText: '确认密码',
                                      hintText: '确认密码',
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                            pwdShow ? Icons.visibility_off : Icons.visibility
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            pwdShow = !pwdShow;
                                          });
                                        },
                                      )),
                                  obscureText: !pwdShow,
                                  //校验密码（不能为空）
                                  validator: (v) {
                                    if(!_switchSelected) return '请先同意用户须知';
                                    if(v.trim().isEmpty) return '请输入确认密码';
                                    if(_pwdconfirController.text != _pwdController.text) return '与密码不一致，请重新输入';
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:16.0,left: 20,right:20),
                        child:
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minWidth: double.infinity, //宽度尽可能大
                              minHeight: 50.0 //最小高度为50像素
                          ),
                          child: OutlineButton(
                              color: Colors.white70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text("注册",
                                style:TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 20.0,
                                ),
                              ),
                              onPressed: _onRegister
                          ),
                        ),
                      ),
                    ],
                  ),
              )
            ],
          ),
        ));
  }

  void _onRegister() async {
    // 提交前，先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      CircularProgressIndicator();
      //Register register;
      try {
        Global.register = await EA(context).register(int.parse(_telController.text), _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        //Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        //登录失败则提示
        print(e.response?.status);
        if (e.response?.status == 201) {
          //showToast(GmLocalizations.of(context).userNameOrPasswordWrong);
          //ShowFailedCard();
          print('该手机号已注册');
        } else {
          //showToast(e.toString());
          print('注册成功');
        }
      } finally {
        // 隐藏loading框
        //Navigator.of(context).pop();
      }
      if (Global.register != null) {
        if(Global.register.status != 201){
          print('注册成功');
          print(Global.register.user);
          // 返回
          Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context) => new LoginRoute()
              ), (route) => route == null);
          await RegisterSuccessedCard(context);
        }
        //Global.register.user['usrId'];
       else await RegisterFailedCard(context);
        //print(Global.register.user);
      }
    }
  }
}
