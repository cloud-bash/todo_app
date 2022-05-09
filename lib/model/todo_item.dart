import 'dart:convert';

TodoItem todoItemfromJson(String str) => TodoItem.fromJson(json.decode(str));

class TodoItem {
  TodoItem({required this.id, required this.activity});

  int? id;
  String? activity;

  factory TodoItem.fromJson(Map<String, dynamic> json) => TodoItem(
        id: json["id"],
        activity: json["activity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activity": activity,
      };

  @override
  String toString() {
    return "{id: $id, activity: $activity}";
  }
}
