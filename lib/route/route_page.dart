import 'package:get/get.dart';
import 'package:project_test_flutter/page/home/home_binding.dart';
import 'package:project_test_flutter/page/home/home_page.dart';
import 'package:project_test_flutter/route/route_name.dart';

class RoutePage{
  static final pages = [
    GetPage(
        name: RouteName.INITIAL,
        page: () => HomePage(),
        binding: HomeBinding()
    ),
  ];
}