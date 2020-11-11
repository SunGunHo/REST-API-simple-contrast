import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'get_server.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetServer()),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  void initState() {
    super.initState();
    Provider.of<GetServer>(context,listen: false).getFromServer(4);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Consumer<GetServer>(
          builder: (context,todoModel,child){
            return todoModel.currentTodo.id != null ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(todoModel.currentTodo.userId.toString()),
                Text(todoModel.currentTodo.id.toString()),
                Text(todoModel.currentTodo.completed.toString()),
                Text(todoModel.currentTodo.title.toString()),
              ],
            ): Center(child: Text('Loading',style: TextStyle(fontSize: 30),));
          },
        ),
      ),
    );
  }
}
