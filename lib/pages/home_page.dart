import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc.dart';
import 'package:learn_bloc/bloc/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Extension Method

    // 1, context.read() read doang, biasanya pake di dalam sebuah function
    // 2, context.watch() nge build ulang semua yang tergabung di context tersebut
    // 3, context.select( bisa pilih salah satu aja, alternatif dari pake bloc selector

    // CounterBloc blocCounter = context.watch<CounterBloc>();
    String nameUser = context.select<UserBloc, String>(
      (value) => value.state['name'],
    );
    int ageUser = context.select<UserBloc, int>(
      (value) => value.state['age'],
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("NAMA: $nameUser"),
            Text("UMUR: $ageUser"),
            // Builder(builder: (context) {
            //   CounterBloc blocCounter = context.watch<CounterBloc>();
            //   return Text(
            //     "${blocCounter.state}",
            //     style: TextStyle(fontSize: 100),
            //   );
            // }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => context
                        .read<UserBloc>()
                        .changeAge(context.read<UserBloc>().state["age"] - 1),
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () => context
                        .read<UserBloc>()
                        .changeAge(context.read<UserBloc>().state["age"] + 1),
                    icon: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
