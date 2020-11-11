import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetServer with ChangeNotifier{
  Todo currentTodo = new Todo();

  void getFromServer(int number) async{
    var myUrl = 'https://jsonplaceholder.typicode.com/todos/'+number.toString();
    var response = await http.get(myUrl);
    //  it help wait for Loading...
    var json = jsonDecode(response.body);
    currentTodo = Todo.fromJson(json);
    notifyListeners();
  }
}

//this time, just put in the one file for simple :)
class Todo{
  int id;
  int userId;
  String title;
  bool completed;

  Todo({this.title,this.id,this.userId,this.completed});

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
