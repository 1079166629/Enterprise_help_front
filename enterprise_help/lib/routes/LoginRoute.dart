import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/commom/Dio.dart';
import 'package:flutter_app/commom/Global.dart';
import 'package:flutter_app/widgets/LoginResultCard.dart';
import '../main.dart';
import '../models/index.dart';
import 'HomePageRoute.dart';
import 'RegisterRoute.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var gm = GmLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:100,left: 16.0,right:16.0,bottom: 50.0),
                  child: Column(
                    children: <Widget>[
                      Text("企业帮",
                          //textScaleFactor: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 50.0,
                            height: 1.2,
                            //fontFamily: "Microsoft YaHei UI",
                            //decorationThickness: 1.0,
                            fontWeight: FontWeight.w900,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Theme(
                data:new ThemeData(
                  primaryColor: Colors.black,
                ),
                child:Form(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          autofocus: _nameAutoFocus,
                          controller: _unameController,
                          decoration: InputDecoration(
                            labelText: '手机号',
                            hintText: '手机号',
                            prefixIcon: Icon(Icons.person),
                          ),
                          // 校验用户名（不能为空）
                          validator: (v) {
                            return v.trim().isNotEmpty ? null : '请输入您的手机号';
                          }),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      TextFormField(
                        controller: _pwdController,
                        autofocus: !_nameAutoFocus,
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
                          return v.trim().isNotEmpty ? null : '请输入密码';
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
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
                            child: Text("登录",
                              style:TextStyle(
                                color: Colors.grey[700],
                                fontSize: 20.0,
                              ),
                            ),
                            onPressed: _onLogin,
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
                          child: Container(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: FlatButton(
                                child:Text('尚未注册',style: TextStyle(
                                    color: Colors.grey
                                ),
                                ),
                                onPressed: ()=>(
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context){
                                            return new RegisterRoute();
                                          }),
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            )
          ],
        )

      ),
    );
  }

  void _onLogin() async {
    // 提交前，先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      CircularProgressIndicator();
      //Login login;
      try {
        Global.login = await EA(context).login(int.parse(_unameController.text), _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        //Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        //登录失败则提示
        if (e.response?.status == 201) {
          //showToast(GmLocalizations.of(context).userNameOrPasswordWrong);
          print('登陆失败');
        } else {
          //showToast(e.toString());
          print('登陆成功');
        }
      } finally {
        // 隐藏loading框
        //Navigator.of(context).pop();
      }
      if (Global.login != null) {
        if(Global.login.status != 201){
          print('登陆成功');
          Global.findFriendApl = await EA(context).findFriendApl();
          Global.getFriendList = await EA(context).getFriendList();
          //Global.business = await EA(context).business();
          Global.business = await EA(context).business();
          Global.usrBusiness = await EA(context).usrBusiness();
          // 返回
          Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context) => new BottomNavigationWidget()
              ), (route) => route == null);
        }
        else await LoginFailedCard(context);
      }
    }
  }
}
