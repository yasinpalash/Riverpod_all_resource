import 'dart:convert';

import 'package:http/http.dart';

import '../model/user_model.dart';

class ApiService {
  String endpoint = 'https://reqres.in/api/users?page=1';

  Future<UserModel> getUser() async {
    Response response = await get(Uri.parse(endpoint));

    // Print the response body
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return UserModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

}

