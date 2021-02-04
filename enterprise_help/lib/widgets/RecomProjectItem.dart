
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget RecomProjectItem(BuildContext context, int position) {
  return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: OutlineButton(
          borderSide: BorderSide(
            width: 0.2,
            color: Colors.black26,
          ),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                //top: HYSizeFit.setRpx(20),
                //left: HYSizeFit.setPx(1),

                child: ClipRect(
                  child: Image.asset(
                    "imgs/激光打印机.jpg",
                    width: 70,
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("刘总"),
                        Text(
                          "激光打印机",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  //bottom: 5,
                  //left: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text("三天前"),
                      )
                    ],
                  )),
            ],
          ),
          onPressed: () {
            },
        ),
      ));
}