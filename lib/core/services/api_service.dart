import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> getRequest(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Something went wrong");
    }
  }

  Future<dynamic> postRequest(String url, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Something went wrong");
    }
  }
}
