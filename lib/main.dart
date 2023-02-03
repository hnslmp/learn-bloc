import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/routes.dart';
import 'package:learn_bloc/view/other.dart';
import 'view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Counter blocCounter = Counter();

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        onGenerateRoute: router.onRoute,
      ),
    );

    // MaterialApp(
    // Alternative way to do routing
    //   initialRoute: "/",
    //   routes: {
    //     "/": (context) => BlocProvider.value(
    //           value: blocCounter,
    //           child: HomePage(),
    //         ),
    //     "/other": (context) => BlocProvider.value(
    //           value: blocCounter,
    //           child: OtherPage(),
    //         ),
    //   },

    // Another way to do it
    // onGenerateRoute: router.onRoute,
    // );
  }
}
