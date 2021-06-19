import 'package:demo/blocs/user_bloc.dart';
import 'package:demo/utils/language_support.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCount extends StatelessWidget {
  const UserCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = retrieveLocale();
    return Row(
      children: [
        Spacer(
          flex: 1,
        ),
        ValueListenableBuilder<int>(
          valueListenable: context.read<UserBloc>().userCount,
          builder: (BuildContext context, int value, Widget? child) {
            return Text('${locale.userCount}: ${value.toString()}');
          },
        ),
      ],
    );
  }
}
