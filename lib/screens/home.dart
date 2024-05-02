import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../widgets/navDrawer.dart';
//API chia se du lieu so luong nho
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Du lieu Default khi tat ung dung van khong lam thay doi du lieu
  List<Todo> _todoList = [
    // Todo(id: 'w1', todoWorks: 'Học flutter mỗi ngày'),
    Todo(id: 'w2', todoWorks: 'Chở Trúc đi dạy buổi chiều lúc 16:45 PM'),
    Todo(id: 'w3', todoWorks: 'Đi ngủ trước 11:30 AM'),
  ];


  //Tao controller text input
  final todo_controller = TextEditingController();

  //Khai bao mot danh sach cac todoItem
  List<Todo> _foundTodo = [];

  @override
  void initState() {
    _foundTodo = _todoList;
    //khoi tao Share data
    super.initState();
    //_loadTodoList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawSideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // space
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/129463228_1044323955974046_7436598048619044227_n.jpg',),
              ),
            ),
          ],
        ),
      ),
      //---------------------------------BODY--------------------
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Container(
                  //Widget seach box
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (value) => _runFillter(value),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(Icons.search, color: tdBlack, size: 20,),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 25,
                      ),
                      border: InputBorder.none,
                      hintText: 'Seach',
                      hintStyle: TextStyle(color: tdGray)
                    ),
                  ),
                ),
                //-----------------Label------------------
                Expanded(
                  child:
                   ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text('Tất cả công việc', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                      ),
                      //----------------Danh sach cac Item cong viec-----

                      for(Todo todos in _foundTodo.reversed)
                      // Goi class todoitem de lay data tu nhung widget duoc gan gia tri tu class object_todo
                      TodoItem(
                        //Goi bo khoi tao cua 3 thuoc tinh trong lop todoItem
                        todo:  todos,
                        onTodoChange: _handTodoChange,
                        onTodoDeleteItem: _deleteTodoItem,
                      ),

                      Container(
                       
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //------------------Thanh input mot cong viec
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                      right: 20,
                      left: 20
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0
                      ),],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //Textfied input cong viec
                    child: TextField(
                      controller: todo_controller,
                      decoration: InputDecoration(
                        hintText: 'Thêm một công việc mới',
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                //-----------------Tao button them va su kien them mot cong viec
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                    right: 20,
                  ),
                  child: FloatingActionButton(
                    child: Text('+', style: TextStyle(fontSize: 40,),),
                    onPressed: () {
                      _addTodoItem(todo_controller.text);
                    },
                    backgroundColor: tdGreenAccent,
                    // style: ElevatedButton.styleFrom(
                    //   primary: tdGreenAccent,
                    //   minimumSize: Size(60, 60),
                    //   elevation: 10,
                    // ),
                  ),
                )
              ], // children []
            ),
          )
        ],
      ),
    );
  }

  //---------------------Function check box cac cong viec da hoan thanh
  void _handTodoChange(Todo todo) {
    //Thay doi gia tri hien tai tu  True thanh false
    //set  state khi ung dung chay len se duoc setup function nay 
    setState(() {
       todo.isDone = !todo.isDone;
    });
  }
  //--------------------Function delete item cong viec
  void _deleteTodoItem(String id) {
    setState(() {
      _todoList.removeWhere((item) => item.id == id);
    });
  }
  //---------------------Function them mot cong viec moi 
  void _addTodoItem(String todoWork) {
    setState(() {
       if(!todoWork.trim().isEmpty){
        _todoList.add(Todo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoWorks: todoWork));
       }
       else{
        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text('Thông báo'),
              content: Text('Công việc không được để trống bạn nhé'),
              icon: Icon(Icons.notifications_active, color: Colors.red,),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Đã hiểu')
                ),
              ],
            );
          }
        );
       }
    });
    todo_controller.clear();
  }
  //--------------------
  void _runFillter(String enterKeyWord){
    List<Todo> results = [];
    if(enterKeyWord.isEmpty){
      results = _todoList;
    }
    else{
      results = _todoList.
      where((item) => item.todoWorks!.toLowerCase()
      .contains(enterKeyWord.toLowerCase()))
      .toList();
    }

    setState(() {
      _foundTodo = results;
    });
  }
}