

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commom/Global.dart';

class BusinessScope extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BusinessScopeState();
  }
}

class BusinessScopeState extends State<BusinessScope> {

  @override
  void initState(){
   //data = widget.newBs;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
        spacing: 20.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        alignment:  WrapAlignment.spaceBetween,

        //动态创建一个List<Widget>
        children: Global.tempCheckbox.map((item) =>
            OutlineButton(
                child: Text(item['text']),
                textColor:item['value']?Colors.black:Colors.grey,
                onPressed: (){
                  setState(() {
                    //print(item['value']);
                    item['value'] = !item['value'];
                    //if(item['value']) Global.tempCheckbox.add(item['ID']);
                    //else Global.tempCheckbox.remove(item['ID']);
                    //print(finlist);
                  });
                }
            )
        ).toList()
    );
  }
}