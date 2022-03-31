import 'package:makely/home/home.dart';
import 'package:task_repository/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: BlocProvider(
        create: (context) {
          return HomeBloc(
            taskRepository: TaskRepository(),
          );
        },
        child: HomeForm(),
      ),
    );
  }
}