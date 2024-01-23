import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/models/todo_model.dart';

class TodoFiterState extends Equatable {
  final Filter filter;

  TodoFiterState({required this.filter});

  //처음에 filter 하지 않는다.
  factory TodoFiterState.initial() {
    return TodoFiterState(filter: Filter.all);
  }
  @override
  List<Object> get props => [filter];

  @override
  bool get stringify => true;

  TodoFiterState copyWith({
    Filter ? filter ,
}){
    return TodoFiterState(filter:  filter ?? this.filter,);
  }
}

class TodoFiter with ChangeNotifier {
  TodoFiterState _state = TodoFiterState.initial();
  TodoFiterState get state => _state;

}