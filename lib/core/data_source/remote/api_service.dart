import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:today_news/core/data_source/remote/api_config.dart';

class ApiService {
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params}) async {
    Uri url = Uri.https(ApiConfig.baseUrl, "$endpoint", {
      "apiKey": ApiConfig.apiKey,
      ...?params,
    });

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
