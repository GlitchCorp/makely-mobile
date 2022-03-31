import 'package:task_repository/task_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required TaskRepository taskRepository,
  })  : _taskRepository = taskRepository,
        super(const HomeState([], NewTask(topic: "", id: ""), NewTask(topic: "", id: ""))) {
    on<HomeGetTask>(_onGetTask);
    on<HomeCreateTask>(_onCreateTask);
    on<HomeUpdateTask>(_onUpdateTask);
    on<FinishTask>(_onFinishTask);
    on<TaskDecriptionChanged>(_onTaskDecriptionChanged);
    on<TaskDecriptionUpdated>(_onTaskDecriptionUpdated);
    on<DeleteTask>(_onDeleteTask);
    add(HomeGetTask());
  }

  final TaskRepository _taskRepository;

  void _onFinishTask(
    FinishTask event,
    Emitter<HomeState> emit,
  ) async {
    await _taskRepository.finishTask(event.id);
    add(HomeGetTask());
  }

  void _onDeleteTask(
      DeleteTask event,
      Emitter<HomeState> emit,
      ) async {
    await _taskRepository.deleteTask(event.id);
    add(HomeGetTask());
  }

  void _onGetTask(
    HomeGetTask event,
    Emitter<HomeState> emit,
  ) async {
    List<dynamic> tasks = await _taskRepository.getTask();
    print(tasks.length.toString());
    emit(state.copyWith(tasks: tasks));
  }

  void _onTaskDecriptionChanged(
      TaskDecriptionChanged event,
      Emitter<HomeState> emit,
      ) async {

    emit(state.copyWith(topic: NewTask(topic: event.topic)));
  }

  void _onTaskDecriptionUpdated(
      TaskDecriptionUpdated event,
      Emitter<HomeState> emit,
      ) async {

    emit(state.copyWith(task_updated: NewTask(topic: event.topic, id: event.id)));
  }

  void _onCreateTask(
    HomeCreateTask event,
    Emitter<HomeState> emit,
  ) async {
    await _taskRepository.addTask(state.topic.topic);
    add(HomeGetTask());
  }

  void _onUpdateTask(
      HomeUpdateTask event,
      Emitter<HomeState> emit,
      ) async {
    await _taskRepository.updateTask(state.task_updated.topic, state.task_updated.id);
    add(HomeGetTask());
  }
}
