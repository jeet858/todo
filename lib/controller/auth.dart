import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> register(Map<String, String> registerData) async {
  final response = await http.post(
    Uri.parse('https://reqres.in/api/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'firstName': registerData['firstName'].toString(),
        'lastName': registerData['lastName'].toString(),
        'email': registerData['email'].toString(),
        'password': registerData['password'].toString(),
      },
    ),
  );
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final token = responseData['token'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', token);
    return {'statusCode': response.statusCode, 'token': token};
  } else {
    return {'statusCode': response.statusCode, 'token': null};
  }
}

Future<Map<String, dynamic>> login(Map<String, String> loginData) async {
  final response = await http.post(
    Uri.parse('https://reqres.in/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'email': loginData['email'].toString(),
        'password': loginData['password'].toString(),
      },
    ),
  );
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final token = responseData['token'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', token);
    return {'statusCode': response.statusCode, 'token': token};
  } else {
    return {'statusCode': response.statusCode, 'token': null};
  }
}
