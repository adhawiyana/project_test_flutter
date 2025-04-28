import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:project_test_flutter/service/local_service.dart';
import 'package:project_test_flutter/utils/config.dart';

class HttpService {

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

  Future<dynamic> apiJSONPostWithToken( String url, Map<String, dynamic> params) async {
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
    //   'Authorization': 'Bearer $token',
    // }
    //     : headers = {'content-Type': 'application/json'};

    log('headers = $headers');
    log('url = $baseUrl$url');

    var r = await http.post(
      Uri.parse(baseUrl + url),
      headers: headers,
      body: jsonEncode(params),
      encoding: Encoding.getByName("utf-8"),
    );
    var data = jsonDecode(r.body);
    log("status codenya ${r.statusCode}");

    return data;
  }

  Future<dynamic> apiJSONPutWithToken( String url, Map<String, dynamic> params ) async {
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
    //   'Authorization': 'Bearer $token',
    // }
    //     : headers = {'content-Type': 'application/json'};

    log('headers = $headers');
    log('url = $baseUrl$url');

    var r = await http.put(
      Uri.parse(baseUrl + url),
      headers: headers,
      body: jsonEncode(params),
      encoding: Encoding.getByName("utf-8"),
    );
    var data = jsonDecode(r.body);
    log("status codec ${r.statusCode}");

    return data;
  }
}