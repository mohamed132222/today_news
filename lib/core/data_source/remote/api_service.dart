abstract class ApiService {
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params});
}
