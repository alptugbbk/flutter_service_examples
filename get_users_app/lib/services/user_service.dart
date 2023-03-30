import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import 'package:restfull_api_users_app/models/user_model.dart';

class UserService {
  String uri = 'https://reqres.in/api/users?page=2';
  Future<List<UserModel>> getUsers() async {
    final response = await get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<UserService>((ref) => UserService());
