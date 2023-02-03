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
          MultiBlocListener(
            listeners: [
              BlocListener<ThemeBloc, bool>(
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("TEMA GELAP AKTIF"),
                    duration: Duration(milliseconds: 200),
                  ));
                },
                listenWhen: (previous, current) {
                  return !current;
                },
              ),
              BlocListener<CounterBloc, int>(
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Diatas 10 yaitu $state"),
                    duration: Duration(milliseconds: 200),
                  ));
                },
                listenWhen: (previous, current) {
                  return current > 10;
                },
              ),
            ],
            child: BlocBuilder<CounterBloc, int>(
              bloc: blocCounter,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),

          // Without MultiBloc Listener code
          // BlocListener<ThemeBloc, bool>(
          //   listener: (context, state) {
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       content: Text("TEMA GELAP AKTIF"),
          //       duration: Duration(milliseconds: 200),
          //     ));
          //   },
          //   listenWhen: (previous, current) {
          //     return !current;
          //   },
          //   child: BlocListener<CounterBloc, int>(
          //     listener: (context, state) {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //         content: Text("Diatas 10 yaitu $state"),
          //         duration: Duration(milliseconds: 200),
          //       ));
          //     },
          //     listenWhen: (previous, current) {
          //       return current > 10;
          //     },
          //     child: BlocBuilder<CounterBloc, int>(
          //       bloc: blocCounter,
          //       builder: (context, state) {
          //         return Text(
          //           "$state",
          //           style: TextStyle(fontSize: 50),
          //         );
          //       },
          //     ),
          //   ),
          // ),
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
