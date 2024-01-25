import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/providers/todo_list.dart';

import '../models/todo_model.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  ActiveTodoCountState({required this.activeTodoCount});

  factory ActiveTodoCountState.initial() {
    return ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [ActiveTodoCountState];

  @override
  bool get stringify => true;

  ActiveTodoCountState copyWith({
    int? activeTodoCoun,
}) {
    return ActiveTodoCountState(activeTodoCount: activeTodoCount ?? this.activeTodoCount);
  }
}

class ActiveTodoCount with ChangeNotifier {
  ActiveTodoCountState _state = ActiveTodoCountState.initial();
  ActiveTodoCountState get state => _state;

  void update(TodoList todoList) {
    final int newActiveTodoCount = todoList.state.todos.where((Todo todo) => !todo.completed).toString().length;

    _state = _state.copyWith(activeTodoCoun: newActiveTodoCount);
    notifyListeners();

  }
}