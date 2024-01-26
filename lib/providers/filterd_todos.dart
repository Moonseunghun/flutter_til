import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/providers/todo_filter.dart';
import 'package:todolist/providers/todo_list.dart';
import 'package:todolist/providers/todo_search.dart';

import '../models/todo_model.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filterTodos;

  FilteredTodosState({required this.filterTodos});

  factory FilteredTodosState.initial() {
    return FilteredTodosState(filterTodos: []);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [filterTodos];

  @override
  bool get stringify => true;

  FilteredTodosState copyWitn({
    List<Todo>? filterTodos,
}) {
    return FilteredTodosState(filterTodos: filterTodos ?? this.filterTodos);
  }
}

class FilteredTodos with ChangeNotifier {
  FilteredTodosState _state = FilteredTodosState.initial();
  FilteredTodosState get state => _state;

  void update(TodoFiter todoFiter,TodoSearch todoSearch , TodoList todoList ) {
    List<Todo> _filteredTodos;

    switch (todoFiter.state.filter){
      case Filter.active:
        _filteredTodos =
            todoList.state.todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos =
            todoList.state.todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.all :
      default :
        _filteredTodos = todoList.state.todos;
        break;
    }
    if(todoSearch.state.searchTern.isNotEmpty) {
      _filteredTodos = _filteredTodos.where((Todo todo) => todo.desc.toLowerCase().contains(todoSearch.state.searchTern)).toList();
    }
    _state = _state.copyWitn(filterTodos: _filteredTodos);
    notifyListeners();
  }
}