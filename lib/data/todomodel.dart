// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

List<TodoModel> todoModelFromJson(String str) => List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
    final String name;
    final String phonenumber;
    final String id;

    TodoModel({
        required this.name,
        required this.phonenumber,
        required this.id,
    });

    TodoModel copyWith({
        String? name,
        String? phonenumber,
        String? id,
    }) => 
        TodoModel(
            name: name ?? this.name,
            phonenumber: phonenumber ?? this.phonenumber,
            id: id ?? this.id,
        );

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        name: json["name"],
        phonenumber: json["phonenumber"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "phonenumber": phonenumber,
        "id": id,
    };
}
