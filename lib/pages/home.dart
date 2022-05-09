import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/api/urls.dart';
import 'package:todo_app/model/list_request_model.dart';
import 'package:todo_app/model/todo_item.dart';

import '../api/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController activityController = TextEditingController();
  List items = [];
  Session session = Session();
  ListRequestModel request = ListRequestModel(id: null, activity: null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Todo List App')),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      child: Text('Get'),
                      onPressed: () async {
                        var data = await session.get(getLists);
                        setState(() {
                          items = data;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .3,
                    child: Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .7,
                        child: TextField(
                          controller: activityController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          child: Text('Post'),
                          onPressed: () {
                            request.activity = activityController.text;
                            session.post(getLists, request);
                          },
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .5,
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data =
                              Map<String, dynamic>.from(items[index]);
                          TodoItem item = TodoItem.fromJson(data);
                          return Dismissible(
                            child: ListTile(
                              leading: Text('${item.id}'),
                              title: Text('${item.activity}'),
                              tileColor: Colors.amber[100],
                            ),
                            background: Container(
                              color: Colors.blue,
                            ),
                            key: UniqueKey(),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
