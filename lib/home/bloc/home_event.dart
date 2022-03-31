part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeGetTask extends HomeEvent {
  const HomeGetTask();
}

class FinishTask extends HomeEvent {
  FinishTask(this.id);

  final String id;
}

class DeleteTask extends HomeEvent {
  DeleteTask(this.id);

  final String id;
}

class HomeCreateTask extends HomeEvent {
  const HomeCreateTask();
}

class TaskDecriptionChanged extends HomeEvent {
  TaskDecriptionChanged(this.topic);

  final String topic;
}

class TaskDecriptionUpdated extends HomeEvent {
  TaskDecriptionUpdated(this.topic, this.id);

  final String topic;
  final String id;
}

class HomeUpdateTask extends HomeEvent {
  const HomeUpdateTask();
}


