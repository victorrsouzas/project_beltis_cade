import 'package:caed/pages/detail_page.dart';
import 'package:caed/pages/list_page.dart';
import 'package:caed/pages/login.dart';
import 'package:flutter/material.dart';

class RotasNomeadas {
  static const String login = '/';
  static const String packageList = '/List';
  static const String packageDetail = '/Detail';

  final routes = <String, WidgetBuilder>{
    login: (context) => const LoginPage(),
    packageList: (context) => const ListPage(),
    packageDetail: (context) => const DetailPage(),
  };
}
