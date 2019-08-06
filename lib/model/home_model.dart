import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/config_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';

class HomeModel{

  final ConfigModel configModel;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final GridNavModel gridNav;
  final List<CommonModel> subNavList;
  final SalesBoxModel salesBoxModel;

  HomeModel({this.configModel,this.bannerList,this.localNavList,this.gridNav,this.subNavList,this.salesBoxModel});

  factory HomeModel.fromJson(Map<String,dynamic>json){

    var bannerListJson = json['bannerList'] as List;
    List<CommonModel> bannerList = bannerListJson.map((i) => CommonModel.fromJson(i)).toList();

    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> localNavList = localNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> subNavList = subNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    return HomeModel(
      bannerList: bannerList,
      localNavList: localNavList,
      subNavList: subNavList,
      configModel: ConfigModel.fromJson(json['config']),
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBoxModel: SalesBoxModel.fromJson(json['salesBox'])
    );

  }


}