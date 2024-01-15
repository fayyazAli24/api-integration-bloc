import 'package:api_integration_bloc/cubit.dart';
import 'package:api_integration_bloc/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Services services;
    final todoCubit = context.read<TodoCubit>();
    todoCubit.getPost();

    super.initState();
  }

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
