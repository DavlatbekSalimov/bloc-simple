import 'package:blocappf/data/todomodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkService {
  static Dio dio = Dio();
  static const baseUrl = 'https://65a3de1aa54d8e805ed41c6d.mockapi.io';
  static const apigetdata = '/contact/usersm';
  static const apipostdata = '';
  static const apidelete = '';

   Future<List<TodoModel>> getData() async {
    try {
      var response = await dio.get('$baseUrl$apigetdata');
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('${response.statusCode}');
        debugPrint('${response.data}');
        
        List<TodoModel> todoList = (response.data as List)
            .map((json) => TodoModel.fromJson(json))
            .toList();

        return todoList;
      } else {
        debugPrint('${response.statusMessage}');
        return [];
      }
    } catch (e) {
      debugPrint('$e');
      return [];
    }
  }
}
