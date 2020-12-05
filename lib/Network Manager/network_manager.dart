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
      throw decodedData;
  }

}