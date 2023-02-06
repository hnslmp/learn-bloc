import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:learn_bloc/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/user_bloc.dart';
import 'package:learn_bloc/pages/home_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<UserBloc>(
        create: (context) => UserBloc(),
        child: const HomePage(),
      ),
    );
  }
}
