import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/widget/local_nav.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
  ];
  double appBarAlpha = 0;

  String resultString = '';

  List<CommonModel> localNavList;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
        body: Stack(
      //Stack类似framelayout 下面的布局代码显示在上面
      children: <Widget>[
        MediaQuery.removePadding(
            //移除banner和sysui之间的间隔
            removeTop: true,
            context: context,
            child: NotificationListener(
                //滚动监听
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination:
                            SwiperPagination(), //指示器 android中的page indicator
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.fromLTRB(7, 4, 7, 4),
                      child: LocalNav(localNavList: localNavList),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(
                        title: Text(resultString),
                      ),
                    )
                  ],
                )
            )
        ),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('home'),
              ),
            ),
          ),
        )
      ],
    ));
  }

  void _onScroll(double pixels) {

    double alpha = pixels/100;
    if(alpha < 0){
      alpha = 0;
    }else if(alpha > 1){
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });

    print(appBarAlpha);
  }

  void loadData() {

    HomeDao.fetch().then((result){
      setState(() {
        localNavList = result.localNavList;
      });
    }).catchError((e){
      print(e);
    });

  }
}
