import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/bloc/theme.dart';
import 'package:learn_bloc/pages/app.dart';
import 'package:learn_bloc/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeBloc themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CounterBloc(),
      ),
      BlocProvider(
        create: (context) => ThemeBloc(),
      )
    ], child: App());

    // Ide awal nya begini tapi kurang rapih, bisa pake multi bloc provider
    // return BlocProvider(
    //   create: (context) => themeBloc,
    //   child: BlocBuilder<ThemeBloc, bool>(
    //     bloc: themeBloc,
    //     builder: (context, state) {
    //       return MaterialApp(
    //         theme: state == true ? ThemeData.light() : ThemeData.dark(),
    //         home: BlocProvider(
    //           create: (context) => CounterBloc(),
    //           child: HomePage(),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
