abstract class HttpService {
  Future<String> get(String endpoint,
      {Map<String, dynamic>? queryParameters});
}
