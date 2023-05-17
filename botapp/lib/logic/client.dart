import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/model.dart';

Map? data;

Future<DataModel?> getpost(int pk) async {
  DataModel? result;

  try {
    // final testData = await get(Uri.parse("http://10.0.2.2:8000/quotes/1"));
    // print(testData.body);
    final response = await get(Uri.parse('https://dummyjson.com/posts/$pk'));
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      result = DataModel.fromjson(items);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return result;
}
