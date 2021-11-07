import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final List<String> _todoList = <String>[];
  TextEditingController txt = TextEditingController();
  var gettext = "";
  var lst = [];

  submit() {
    setState(() {
      lst.add(gettext);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 10,
          ),
        ),
        title: const Text("To Do List",
            style: TextStyle(
                fontSize: 40, color: Colors.red, fontWeight: FontWeight.bold)),
        actions: const [Icon(Icons.calendar_view_day_outlined)],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 1,
            // margin: const EdgeInsets.symmetric(
            //   horizontal: 24,
            //   vertical: 32,
            // ),
            color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                DateFormat("dd-MM-yyyy").format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          FloatingActionButton.extended(
              onPressed: () {
                txt.clear();
                submit();
              },
              label: const Text("ADD TASK")),

          const SizedBox(height: 30),

          TextField(
              controller: txt,
              onChanged: (value) {
                gettext = value;
              }),

          const SizedBox(height: 30),

          ListView.builder(
              shrinkWrap: true,
              itemCount: lst.length,
              itemBuilder: (context, index) {
                //return Center(child: Text(lst[index]));
                return ListTile(title: Text(lst[index]));
              })

          // ListView(children: _getItems()),
          // // add items to the to-do list
          // FloatingActionButton(
          //   onPressed: () => _displayDialog(context),
          //   tooltip: 'Add Item',
          //   child: Icon(Icons.add),
          // ),
          //Container()
        ],
      ),
    );
  }

  // void _addTodoItem(String title) {
  //   //  a set state will notify the app that the state has changed
  //   setState(() {
  //     _todoList.add(title);
  //   });
  //   _textFieldController.clear();
  // }

  // Widget _buildTodoItem(String title) {
  //   return ListTile(title: Text(title));
  // }

  // void _displayDialog(BuildContext context) async {
  //   // alter the app state to show a dialog
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('Add a task to your list'),
  //           content: TextField(
  //             controller: _textFieldController,
  //             decoration: const InputDecoration(hintText: 'Enter task here'),
  //           ),
  //           actions: <Widget>[
  //             // add button
  //             TextButton(
  //               child: const Text('ADD'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //                 _addTodoItem(_textFieldController.text);
  //               },
  //             ),
  //             // cancel button
  //             TextButton(
  //               child: const Text('CANCEL'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  // // iterates through our todo list titles.
  // List<Widget> _getItems() {
  //   final List<Widget> _todoWidgets = <Widget>[];
  //   for (String title in _todoList) {
  //     _todoWidgets.add(_buildTodoItem(title));
  //   }
  //   return _todoWidgets;
  // }
}
