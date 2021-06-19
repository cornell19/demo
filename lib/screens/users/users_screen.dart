import 'package:demo/blocs/user_bloc.dart';
import 'package:demo/models/user.dart';
import 'package:demo/utils/language_support.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = retrieveLocale();
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.users),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder<List<User>>(
        stream: context.read<UserBloc>().users,
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(locale.errorRetrieveUsers),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final users = snapshot.data!;
          if (users.length == 0) {
            return Center(
              child: Text(locale.noRecords),
            );
          }
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (ctx, index) {
                final user = users[index];
                return ListTile(
                  title: Text('${user.lastName}, ${user.firstName}'),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              });
        },
      ),
    );
  }
}
