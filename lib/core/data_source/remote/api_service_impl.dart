import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:today_news/core/data_source/remote/api_config.dart';
import 'package:today_news/core/data_source/remote/api_service.dart';

class ApiServiceImpl extends ApiService {
  // static final _instance = ApiServiceImpl._();
  //
  // factory ApiServiceImpl() => _instance;
  //
  // ApiServiceImpl._();

  @override
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params}) async {
    Uri url = Uri.https(ApiConfig.baseUrl, endpoint, {
      "apiKey": ApiConfig.apiKey,
      ...?params,
    });
    print(url);

    try {
      final http.Response response = await http.get(url);
      final Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      return json;
    } catch (e) {
      throw Exception("failed to load data ${e.toString()}");
    }
  }
}
