part of 'home_bloc.dart';

class NewTask {
  const NewTask({
        this.topic = '',
        this.id = ''
      });

  final String topic;
  final String id;
}

class HomeState extends Equatable {
  const HomeState(
    this.tasks, this.topic, this.task_updated);

  final List<dynamic> tasks;
  final NewTask topic;
  final NewTask task_updated;
  @override
  List<Object> get props => [tasks, topic, task_updated];

  HomeState copyWith({
    List<dynamic>? tasks,
    NewTask? topic,
    NewTask? task_updated,
  }) {
    return HomeState(tasks ?? this.tasks, topic ?? this.topic, task_updated ?? this.task_updated);
  }
}
