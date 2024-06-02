// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

List<TodoModel> todoModelFromJson(String str) => List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
    final int id;
    final String name;
    final int phonenumber;

    TodoModel({
        required this.id,
        required this.name,
        required this.phonenumber,
    });

    TodoModel copyWith({
        int? id,
        String? name,
        int? phonenumber,
    }) => 
        TodoModel(
            id: id ?? this.id,
            name: name ?? this.name,
            phonenumber: phonenumber ?? this.phonenumber,
        );

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        name: json["name"],
        phonenumber: json["phonenumber"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phonenumber": phonenumber,
    };
}
