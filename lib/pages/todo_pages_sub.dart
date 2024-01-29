import 'package:flutter/material.dart';

class TodoHeader extends StatelessWidget{
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Todo',
          style: TextStyle(fontSize: 40.0),
        ),
        Text(
          '0 items left',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.redAccent,
          ),
        )
      ],
    );
  }
}