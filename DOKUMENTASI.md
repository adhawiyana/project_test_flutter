# Implementasi MMVVM with getx

# API consume
Future<dynamic> apiJSONGetWitToken(String url) async {
var token = await LocalService().getToken();
dynamic headers;

    headers = {
      'content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjI1ZTQ2Mzg4MzZiMTdkZTk1ODRiYmRkNWFjMWRmNjBiNWIyODU5ZDNhMTY2NmY5Y2E3YzRmOWY0YTdiNGU0ZmM5ZDJkYTMwNTliYTFiYzg4In0.eyJhdWQiOiIzIiwianRpIjoiMjVlNDYzODgzNmIxN2RlOTU4NGJiZGQ1YWMxZGY2MGI1YjI4NTlkM2ExNjY2ZjljYTdjNGY5ZjRhN2I0ZTRmYzlkMmRhMzA1OWJhMWJjODgiLCJpYXQiOjE3NDU4MjA0ODgsIm5iZiI6MTc0NTgyMDQ4OCwiZXhwIjoxNzc3MzU2NDg4LCJzdWIiOiI4MzUiLCJzY29wZXMiOlsiYmVyaXRhX3BwaWQiXX0.yO3oV4v5KiCoF5KDXx5njed1Ua3CV6uf-bIza7dcEpn76vXBEadcg_2AQyQZyhLGc_PGPNbVlwQhO-lA59ZOb3a7AnoxSnRp_nt78h1oObOXyLtCKQ0TT_c6WUlco96xbf8GCblu9eFijQVUXj41SBsu0jd2gdGluaXklVAOgU5go4x1YBghFquqQSgITNdmsdXURawuHgXyXUTq6XwxOHQ_rIP_smPs0-d7P1BBzXibKfWd5NnmgB2dwIHKwoht1OFdPVmfvHmoq1vFcpJ0orIlWn2xN_IsNa-p29wS-rg5yXM1YfnIWqmF-1036Sm8Tynmo5SirxQpQA5J-3R2CJvkbdfSHkTAiTPI3OK87boCQ7PMOVFgu59GzRpFTiOqPUhtCYUqjOzQxRu9XQW2cgpHldV9nPWpH44N5La5CDGB5uJZ2tj_F-v5VvhKylbqokfqRyNt9WVgr-jFtUHqiA2GJnF8U5DO1eomxRfdOOv-LuoOw8r4LiDHsQ9QM-Xjf9aRKq5pLGv33sPAeuvMI0zutRUlUJVtGcHmy4NE-9EcqmXibQ6o8anh3FNls2fEIqKdYVJx_d8XMDJ89VvcvQ1jhGVDYFbwANuek8IoDh-QWw3_7uv9oHquBUUf1UzmDzbKxjpsVfX2SQMSFQZQlYOyaW3xh_vAhLZV-_-7m-4',
      // 'Authorization': 'Bearer $token',
    };

    // token == null
    //     ? headers = {
    //   'content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjI1ZTQ2Mzg4MzZiMTdkZTk1ODRiYmRkNWFjMWRmNjBiNWIyODU5ZDNhMTY2NmY5Y2E3YzRmOWY0YTdiNGU0ZmM5ZDJkYTMwNTliYTFiYzg4In0.eyJhdWQiOiIzIiwianRpIjoiMjVlNDYzODgzNmIxN2RlOTU4NGJiZGQ1YWMxZGY2MGI1YjI4NTlkM2ExNjY2ZjljYTdjNGY5ZjRhN2I0ZTRmYzlkMmRhMzA1OWJhMWJjODgiLCJpYXQiOjE3NDU4MjA0ODgsIm5iZiI6MTc0NTgyMDQ4OCwiZXhwIjoxNzc3MzU2NDg4LCJzdWIiOiI4MzUiLCJzY29wZXMiOlsiYmVyaXRhX3BwaWQiXX0.yO3oV4v5KiCoF5KDXx5njed1Ua3CV6uf-bIza7dcEpn76vXBEadcg_2AQyQZyhLGc_PGPNbVlwQhO-lA59ZOb3a7AnoxSnRp_nt78h1oObOXyLtCKQ0TT_c6WUlco96xbf8GCblu9eFijQVUXj41SBsu0jd2gdGluaXklVAOgU5go4x1YBghFquqQSgITNdmsdXURawuHgXyXUTq6XwxOHQ_rIP_smPs0-d7P1BBzXibKfWd5NnmgB2dwIHKwoht1OFdPVmfvHmoq1vFcpJ0orIlWn2xN_IsNa-p29wS-rg5yXM1YfnIWqmF-1036Sm8Tynmo5SirxQpQA5J-3R2CJvkbdfSHkTAiTPI3OK87boCQ7PMOVFgu59GzRpFTiOqPUhtCYUqjOzQxRu9XQW2cgpHldV9nPWpH44N5La5CDGB5uJZ2tj_F-v5VvhKylbqokfqRyNt9WVgr-jFtUHqiA2GJnF8U5DO1eomxRfdOOv-LuoOw8r4LiDHsQ9QM-Xjf9aRKq5pLGv33sPAeuvMI0zutRUlUJVtGcHmy4NE-9EcqmXibQ6o8anh3FNls2fEIqKdYVJx_d8XMDJ89VvcvQ1jhGVDYFbwANuek8IoDh-QWw3_7uv9oHquBUUf1UzmDzbKxjpsVfX2SQMSFQZQlYOyaW3xh_vAhLZV-_-7m-4',
    // 'Authorization': 'Bearer $token',
    // }
    //     : headers = {'content-Type': 'application/json'};

    log('headers = $headers');
    log('url = $baseUrl$url');

    http.Response r = await http.get(
      Uri.parse(baseUrl + url),
      headers: headers,
    );
    log("status codenya ${r.statusCode}");

    var data = json.decode(r.body);
    return data;
}

# Calling function
class HomeApi {
getBerita () async {
var r = await HttpService().apiJSONGetWitToken('api/v2/generate/ppid-samarinda/berita_ppid/');
return r;
}
}

# Running api
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

# view
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

