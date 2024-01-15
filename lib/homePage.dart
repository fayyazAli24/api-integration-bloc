
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cubit/postCubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
        if (state is InitialState || state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          final todo = state.list;
          return ListView.builder(itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text(todo[index].id.toString()),
                subtitle: Text(todo[index].body),
              ),
            );
          });
        } else {
          return Container();
        }
      }),

    );
  }
}
