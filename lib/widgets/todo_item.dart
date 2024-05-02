import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/todo.dart';

class TodoItem extends StatelessWidget {

  final Todo todo;
  //Khai bao su kien 2 button change and delete
  final onTodoChange;
  final onTodoDeleteItem;

  const TodoItem({Key? key, required this.todo, required this.onTodoChange, required this. onTodoDeleteItem}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //print('Click on todo change')
          onTodoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

        tileColor: Color.fromARGB(255, 201, 253, 255),
        leading: Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue),
        title: Text(
          todo.todoWorks!,
          style: TextStyle(fontSize: 16, color: tdBlack, decoration: todo.isDone? TextDecoration.lineThrough : null,),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
                //print("click on deleted item work")
                showDialog(
                 context: context,
                 builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('Xóa sự kiện'),
                    content: Text('Bạn chắc chắn xóa sự kiện này'),

                    actions: [
                      ElevatedButton(child: Text('Đồng ý'),
                      onPressed: () {
                        onTodoDeleteItem(todo.id);
                        Navigator.pop(context);
                      },
                      ),
                       ElevatedButton(child: Text('Hủy'),
                      onPressed: () =>  Navigator.pop(context),
                      ),
                    ],
                  );
                 },
                );
            },
          ),
        ),
      ),
    );
  }
}