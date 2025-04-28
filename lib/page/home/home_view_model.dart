import 'package:get/get.dart';
import 'package:project_test_flutter/page/home/home_api.dart';

class HomeViewModel extends GetxController{
  HomeApi api;
  HomeViewModel ({required this.api});

  var listData = [].obs;

  @override
  void onInit() {
    super.onInit();
    getBerita();
  }

  getBerita()async{
    try{
      var r = await api.getBerita();
      var data = r['data'];

      print(data);

      listData.value = (data as List<dynamic>).map((e) => e).toList();
    }catch(e){
      print(e);
    }
  }
}