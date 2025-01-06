import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:providercrud/model/crudmodel.dart';

class Noteprovider extends ChangeNotifier {
  List<Notess> notestlist = [];

  void addNotes(Notess values) async {
    final noteDb = await Hive.openBox<Notess>('notebox');
    noteDb.add(values);
    notestlist.add(values);
    getnotes();
    notifyListeners();
  }

  void getnotes() async {
    final noteDb = await Hive.openBox<Notess>('notebox');
    notestlist.clear();
    notestlist.addAll(noteDb.values);
    notifyListeners();
  }

  void deletenotes(int index) async {
    final noteDb = await Hive.openBox<Notess>('notebox');
    noteDb.deleteAt(index);
    getnotes();
    notifyListeners();
  }
}
