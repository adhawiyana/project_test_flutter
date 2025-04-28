import 'package:get/get.dart';
import 'package:project_test_flutter/page/home/home_api.dart';
import 'package:project_test_flutter/page/home/home_view_model.dart';

class ControllerBind extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeViewModel(api: HomeApi()));
  }
}