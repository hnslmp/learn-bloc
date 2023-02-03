import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/bloc/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc blocCounter = context.read<CounterBloc>();
    ThemeBloc blocTheme = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          blocTheme.changeTheme();
        },
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<CounterBloc, int>(
            bloc: blocCounter,
            builder: (context, state) {
              return Text(
                "$state",
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  blocCounter.remove();
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  blocCounter.add();
                },
                icon: Icon(Icons.add),
              )
            ],
          )
        ],
      )),
    );
  }
}
