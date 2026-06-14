import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskNotifier extends Notifier<TaskState> {
  @override
  TaskState build() {
    return TaskState(task: [Task()]);
  }
}

final taskNotifier = NotifierProvider<TaskNotifier, TaskState>(
  TaskNotifier.new,
);

class TaskState {
  final List<Task> task;

  TaskState({this.task = const []});

  TaskState copyWith({List<Task>? task}) => TaskState(task: task ?? this.task);
}

class Task {}
