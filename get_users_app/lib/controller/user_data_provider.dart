import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restfull_api_users_app/models/user_model.dart';
import 'package:restfull_api_users_app/services/user_service.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
