import 'package:project_test_flutter/service/http_service.dart';

class HomeApi {
  getBerita () async {
    var r = await HttpService().apiJSONGetWitToken('api/v2/generate/ppid-samarinda/berita_ppid/');
    return r;
  }
}