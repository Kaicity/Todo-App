import 'package:todo_apps/widgets/todo_item.dart';

class Todo {
  String? id;
  String? todoWorks;
  bool isDone;

  Todo({
    required this.id,
    required this.todoWorks,
    this.isDone = false,
  });

  // static Todo fromJson(Map<String, dynamic> json){
  //   return Todo(
  //     id: json['id'],
  //     todoWorks: json['work'],
  //     isDone: json['isdone'] == null ? false : json['isdone'] as bool,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'work': todoWorks,
  //     'isdone': isDone,
  //   };
  // }
  
  // static List<Todo> todo_List(){
  //   return [
  //     Todo(id: '01', todoWorks: 'Học flutter mỗi ngày', isDone: true),
  //     Todo(id: '02', todoWorks: 'Đá banh buổi chiều lúc 17:30', isDone: true),
  //     Todo(id: '03', todoWorks: 'Đi rước trúc lúc 20:15 buối tối',),
  //     //Todo(id: '04', todoWorks: 'Ôn tập môn CSDL phân tán',),
  //     //Todo(id: '05', todoWorks: 'Đi ngủ trước 11:30 AM',),
  //     // Todo(id: '06', todoWorks: 'Dạy học tình yêu 18+ mỗi đêm',),
  //     // Todo(id: '07', todoWorks: 'Ăn uống đúng bũa 3 cử/ngày',),
  //   ];
  // }

}