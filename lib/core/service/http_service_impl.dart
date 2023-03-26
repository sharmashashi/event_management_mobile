import 'dart:developer';
import 'dart:io';

import 'package:event_management_mobile/core/service/http_service.dart';
import 'package:http/http.dart' as http;


class HttpServiceImpl implements HttpService {
  @override
  Future<String> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    final response = await http.get(
        Uri.parse(endpoint).replace(
          queryParameters: queryParameters,
        ),);
        log(queryParameters.toString());
        log(endpoint);
    return response.body;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
          ..badCertificateCallback = (X509Certificate cert, String host, int port) {
            //add your certificate verification logic here
            return true;
          };
  }
}
