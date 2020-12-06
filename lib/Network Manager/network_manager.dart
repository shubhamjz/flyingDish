import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkManager {
  String _authToken = '';

  NetworkManager._privateConstructor();

  static final NetworkManager
  _instance = NetworkManager._privateConstructor();

  factory NetworkManager() {
    return _instance;
  }

  Map<String, String> get defaultRequestHeaders =>
      {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

  Future invokeGetMethod(String method) async {
    print('Inside invokeGetMethod() method');
    print('Calling GET method $method');
    http.Response response =
    await http.get(method, headers: defaultRequestHeaders);
    int statusCode = response.statusCode;
    print('Server response status code : $statusCode');
    var decodedData = jsonDecode(response.body);
    print('Server response decoded data : $decodedData');
    if (statusCode == 200 || statusCode == 201) {
      return decodedData;
    }
    else
      return decodedData;
  }

  Future invokePostMethod(String method, var requestBody) async {
    print('Inside invokePostMethod() method');
    print('Calling POST method $method with request body $requestBody');
    http.Response response = await http.post(method,
        headers: defaultRequestHeaders,
        body: requestBody,
        encoding: Encoding.getByName("utf-8"));
    int statusCode = response.statusCode;
    var decodedData = jsonDecode(response.body);
    print('Server response decoded data : $decodedData');
    if (statusCode == 200 || statusCode == 201) {
      return decodedData;
    }
    else throw decodedData;
  }

}