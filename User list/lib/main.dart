import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Todo {
  // final String title;
  // final String description;

  final String name;
  final String username;
  final String email;

  Todo(this.name, this.username, this.email);
}

void main() async{
  var url = 'https://jsonplaceholder.typicode.com/users';
  var response = await http.get(url);
  var jsonResponse = convert.jsonDecode(response.body);

  runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(
      todos: List.generate(10,
        (i) => Todo(
          jsonResponse[i]['name'].toString(),
          jsonResponse[i]['username'].toString(),
          jsonResponse[i]['email'].toString(),
        ),
      ),
    ),
  ));
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;
  TodosScreen({Key key, @required this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                  settings: RouteSettings(
                    arguments: todos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Nome: "+ todo.name + "\n"
            "Username: "+ todo.username + "\n"
            "Email: "+ todo.email + "\n",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

