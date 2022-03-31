import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makely/home/home.dart';
import 'package:formz/formz.dart';

class HomeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                  icon: new Icon(Icons.backpack, color: Colors.white),
                  onPressed: () => {}),
              title: Text("Inbox",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'TTCommons')),
              backgroundColor: Colors.lightBlueAccent,
            ),
            floatingActionButton: _CreateTaskButton(),
            body: Column(children: <Widget>[
              _ShowTasks(),
            ])));
  }
}

class _ShowTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.tasks.length,
              itemBuilder: (BuildContext context, int index) {
                print(state.tasks[index]);
                bool s = false;
                return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                            title: Text("Update task"),
                            content: TextFormField(
                                initialValue: state.tasks[index]['topic'],
                                decoration: InputDecoration(),
                                onChanged: (task) => context
                                          .read<HomeBloc>()
                                          .add(TaskDecriptionUpdated(task, state.tasks[index]['id']))
                            ),

                            actions: [
                              TextButton(
                                child: Text('Update'),
                                onPressed: () {
                                  context.read<HomeBloc>().add(const HomeUpdateTask());
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ]),
                      );
                    },
                    child: Container(
                        color: Colors.white70,
                        child: Row(children: [
                          Checkbox(
                              value: s,
                              activeColor: Colors.lightBlueAccent,
                              onChanged: (_) => {
                                context.read<HomeBloc>().add(FinishTask(state.tasks[index]['id']))
                              }),
                          Text(state.tasks[index]['topic']),
                          Spacer(),
                          IconButton(
                              icon: new Icon(Icons.delete, color: Colors.black),
                              onPressed: ()  {
                                print("here");
                                context.read<HomeBloc>().add(DeleteTask(state.tasks[index]['id']));
                              })

                        ])));
                // return ElevatedButton(
                //     key: const Key('loginForm_continue_raisedButton'),
                //     child: Text(state.tasks[index]['topic']),
                //     onPressed: () {
                //       context
                //           .read<HomeBloc>()
                //           .add(FinishTask(state.tasks[index]['id']));
                //     });
              }),
        );

        //return Text(state.tasks.length.toString());
      },
    );
  }
}

class _CreateTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ElevatedButton(
            key: const Key('loginForm_continue_raisedButton'),
            child: const Text('Add Task'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                    title: Text("New Task"),
                    content: TextField(
                        decoration: InputDecoration(),
                        onChanged: (task) => context
                            .read<HomeBloc>()
                            .add(TaskDecriptionChanged(task))),
                    actions: [
                      TextButton(
                        child: Text('Create'),
                        onPressed: () {
                          context.read<HomeBloc>().add(const HomeCreateTask());
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ]),
              );
              //;
            });
      },
    );
  }
}
