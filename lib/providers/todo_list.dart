import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../models/todo_model.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  TodoListState ({
    required this.todos
});

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1' , desc: 'Clean the room'),
      Todo(id: '2' , desc: 'wash the dish'),
      Todo(id: '3' , desc: 'Do homework'),
    ]);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [todos];

  @override
  bool get stringify => true;

  TodoListState copyWith ({
    List<Todo>? todos,
})
  {
    return TodoListState(todos: todos ?? this.todos, );
  }
}

class TodoList with ChangeNotifier {
  TodoListState _state = TodoListState.initial();
  TodoListState get state => _state;

  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [...state.todos , newTodo];

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }
//나가기 상태관리
  void editTodo(String id , String todoDesc) {
    final newTodos = _state.todos.map((Todo todo) {
      if(todo.id == id) {
        return Todo(
            id: id,
            desc: todoDesc,
            completed: todo.completed,
        );
      }
      return todo;
    }).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }
// true&&false toggle
  void toggleTodo(String id ) {
    final newTodos = _state.todos.map((Todo todo){
      if(todo.id == id) {
        return Todo(
            id: id ,
            desc: todo.desc ,
            completed: !todo.completed
        );
      }
      return todo;
    }).toList();
   _state = _state.copyWith(todos: newTodos);
   notifyListeners();
  }
//지우는 함수
  void removeTodo (Todo todo) {
    final newTodos = _state.todos.where((Todo t) => t.id != todo.id).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }
}

//Todo 정의):
//
// id, desc (설명), completed와 같은 속성을 가진 할 일 항목을 나타냅니다.
// TodoListState 클래스:
//
// Equatable을 확장하여 동등성 비교를 간소화합니다.
// 할 일 목록의 상태를 나타내며 Todo 항목의 목록을 가지고 있습니다.
// TodoListState.initial() 팩토리 메서드를 제공하여 몇 가지 미리 정의된 할 일 항목을 포함한 초기 상태를 만듭니다.
// 상태 비교와 디버깅을 용이하게하기 위해 props와 stringify를 오버라이드합니다.
// 선택적 수정 사항을 포함하는 새 상태를 생성하기 위한 copyWith 메서드를 포함합니다.
// TodoList 클래스:
//
// ChangeNotifier를 확장하여 상태가 변경될 때 리스너에게 알리도록 합니다.
// 할 일 목록의 상태 (_state)를 관리하고 state 게터를 통해 노출합니다.
// 할 일 목록과 상호 작용하기 위한 메서드를 제공합니다:
// addTodo: 목록에 새 할 일 항목을 추가합니다.
// editTodo: 기존 할 일 항목의 설명을 편집합니다.
// toggleTodo: 할 일 항목의 완료 상태를 토글합니다.
// removeTodo: 목록에서 할 일 항목을 제거합니다.