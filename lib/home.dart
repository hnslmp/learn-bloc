// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener(
            bloc: myCounter,
            listener: (context, state) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Dijalankan")));
            },
            listenWhen: (previous, current) {
              return true;
            },
            child: BlocBuilder(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.decrement();
                  },
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.increment();
                  },
                  icon: Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}
