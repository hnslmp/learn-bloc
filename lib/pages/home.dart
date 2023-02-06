import 'package:flutter/material.dart';
import 'package:learn_bloc/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc blocUser = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          BlocSelector<UserBloc, Map<String, dynamic>, String>(
            selector: (state) => state['name'],
            builder: (context, state) {
              return Text("NAMA : $state");
            },
          ),
          BlocSelector<UserBloc, Map<String, dynamic>, int>(
            selector: (state) => state['age'],
            builder: (context, state) {
              return Text("NAMA : $state");
            },
          ),
          // Code tanpa bloc selector, pakai bloc selector biar ga semuanya ke build
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: blocUser,
          //   builder: (context, state) {
          //     return Text("NAMA : ${state['name']}");
          //   },
          // ),
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: blocUser,
          //   builder: (context, state) {
          //     return Text("NAMA : ${state['age']}");
          //   },
          // ),

          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) => blocUser.changeName(value),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  blocUser.changeAge(blocUser.state["age"] - 1);
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  blocUser.changeAge(blocUser.state["age"] + 1);
                },
                icon: Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}
