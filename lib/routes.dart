import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/view/home.dart';
import 'package:learn_bloc/view/not_found.dart';

class AppRouter {
  final Counter blocCounter = Counter();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: blocCounter,
            child: HomePage(),
          ),
        );

      case "/other":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: blocCounter,
            child: HomePage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: blocCounter,
            child: NotFoundPage(),
          ),
        );
    }
  }
}
