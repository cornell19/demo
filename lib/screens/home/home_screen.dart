import 'package:demo/blocs/user_bloc.dart';
import 'package:demo/screens/home/widgets/user_count.dart';
import 'package:demo/utils/language_support.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const UserCount(),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () => context.read<UserBloc>().navigateToUsers(),
            child: Text(retrieveLocale().users),
          ),
        ],
      ),
    );
  }
}
