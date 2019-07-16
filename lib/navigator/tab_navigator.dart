import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/my_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';



class TabNavigator extends StatefulWidget{

  @override
  _TabNavigator createState() => _TabNavigator();

}


class _TabNavigator extends State<TabNavigator>{

  final PageController _controller = PageController(
    initialPage: 0,//默认现实第0个位子的tab
  );

  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: PageView(//根结点
        controller: _controller,
        children: <Widget>[//添加tab四个页面

          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,//无论是否点击tab都显示icon和文字
          items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _defaultColor,
          ),
          activeIcon: Icon(
            Icons.home,
            color: _activeColor,
          ),
          title: Text(
              '首页',
              style : TextStyle(
                color: _currentIndex != 0 ? _defaultColor : _activeColor,
              )),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: _defaultColor,
          ),
          activeIcon: Icon(
            Icons.search,
            color: _activeColor,
          ),
          title: Text(
              '搜索',
              style : TextStyle(
                color: _currentIndex != 1 ? _defaultColor : _activeColor,
              )),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera_alt,
            color: _defaultColor,
          ),
          activeIcon: Icon(
            Icons.camera_alt,
            color: _activeColor,
          ),
          title: Text(
              '旅拍',
              style : TextStyle(
                color: _currentIndex != 2 ? _defaultColor : _activeColor,
              )),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: _defaultColor,
          ),
          activeIcon: Icon(
            Icons.account_circle,
            color: _activeColor,
          ),
          title: Text(
              '我的',
              style : TextStyle(
                color: _currentIndex != 3 ? _defaultColor : _activeColor,
              )),
        ),
      ]),
    );
  }

}