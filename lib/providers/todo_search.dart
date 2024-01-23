import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class TodoSearchState extends Equatable {
  final String searchTern;
  TodoSearchState({required this.searchTern});

  factory TodoSearchState.initail() {
    return TodoSearchState(searchTern: '');
  }

  @override
  // TODO: implement props
  List<Object?> get props => [searchTern];

  @override
  bool  get stringify => true;

  TodoSearchState copyWith({
    String? searchTern,
}){
    return TodoSearchState(searchTern: searchTern ?? this.searchTern);
  }

}

class TodoSearch with ChangeNotifier {
  TodoSearchState _state = TodoSearchState.initail();
  TodoSearchState get state => _state;
}