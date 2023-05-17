import 'package:flutter/material.dart';
import '../logic/client.dart';
import 'model.dart';

class Posts extends ChangeNotifier {
  String? title;
  String? body;
  bool loading = false;
  int currentData = 1;

  void getdata() async {
    loading = true;
    notifyListeners();
    DataModel? get = await getpost(currentData);
    title = get?.title;
    body = get?.body;
    loading = false;
    notifyListeners();
  }

  void nextdata() async {
    currentData++;
    getdata();
  }

  void prevdata() {
    currentData--;
    if (currentData <= 0) {
      currentData = 1;
    }
    getdata();
  }
}
