import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restfull_api_users_app/constants/color_constants.dart';
import 'package:restfull_api_users_app/constants/string_constants.dart';
import 'package:restfull_api_users_app/controller/user_data_provider.dart';
import 'package:restfull_api_users_app/models/user_model.dart';


class UserHomeView extends ConsumerWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(StringConstants.appbarTitle),
        ),
      ),
      body: _data.when(
        data: (_data) {
          List<UserModel> userList = _data.map((e) => e).toList();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (_, index) {
                      return Card(
                        color: ColorConstants.cardColor,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(userList[index].firstName.toString()),
                          subtitle: Text(userList[index].lastName.toString()),
                          trailing: CircleAvatar(
                            backgroundImage:
                                NetworkImage(userList[index].avatar.toString()),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
        error: (a, b) => Text(a.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
