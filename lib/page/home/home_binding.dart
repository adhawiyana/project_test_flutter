import 'package:get/get.dart';
import 'package:project_test_flutter/page/home/home_api.dart';
import 'package:project_test_flutter/page/home/home_view_model.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel(api: HomeApi()));
  }
}