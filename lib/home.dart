import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/data_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Provider")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<Counter>(context).decrement();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              DataWidget(),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<Counter>(context).increment();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
