import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';

import 'navigator/tab_navigator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{

  @override
  _MyAppState createState() {
    // TODO: implement createState
    return _MyAppState();
  }

}


class _MyAppState extends State<MyApp>{

  String showResult = '';
  Future<CommonModel> fetchPost() async{

    final response = await http.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(response.body);
    return CommonModel.fromJson(result);


  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TabNavigator()
//      Scaffold(
//        appBar: AppBar(
//          title: Text('http')
//        ),
//        body: Column(
//          children: <Widget>[
//            InkWell(//可点击
//              onTap: (){
//                fetchPost().then((CommonModel result){
//                  setState(() {
//                    showResult = '请求结果 \n hideAppBar:${result.hideAppBar} \n icon:${result.icon} \n url:${result.url}';
//                  });
//                });
//              },
//              child: Text(
//                'click me'
//              ),
//            ),
//            Text(showResult),
//          ],
//        ),
//      ),
    );
  }

}

class CommonModel{

  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String,dynamic>json){
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar']
    );
  }







}

