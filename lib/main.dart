
import 'package:api_integration_bloc/services.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

import 'bloc/cubit/cubit.dart';
import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
