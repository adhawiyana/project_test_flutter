import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_flutter/page/home/home_view_model.dart';

class HomePage extends GetView<HomeViewModel> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Panel berita"),
    ),
    body: Obx(() => ListView.builder(
      itemCount: controller.listData.length,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Judul',
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400
                ),
              ),
              Text(
                  controller.listData[index]['judul'],
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w200
                  ),
              )
            ],
          ),
        ),
      ),
    )),
  );

}