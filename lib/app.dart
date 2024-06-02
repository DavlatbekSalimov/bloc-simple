import 'package:blocappf/countpage/bloc/counter_bloc.dart';
import 'package:blocappf/countpage/counter_page.dart';
import 'package:blocappf/crudpage/bloc/todo_bloc.dart';
import 'package:blocappf/crudpage/home_page.dart';
import 'package:blocappf/getit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(getIt()),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: const CounterPage(), // Change to HomePage
      ),
    );
  }
}
