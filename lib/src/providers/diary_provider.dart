import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meno_app/src/models/diary.dart';
import 'package:meno_app/src/services/diary_fire_services.dart';
import 'package:uuid/uuid.dart';

class DiaryProvider with ChangeNotifier {
  final firestoreService = DiaryFirestoreService();
  DateTime _date;
  String _content;
  String _title;
  String _entryId;
  var uuid = Uuid();

  //Getters
  DateTime get date => _date;
  Stream<List<Diary>> get entries => firestoreService.getEntries();

  //Setters
  set changeDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  set changeTitle(String title) {
    _title = title;
    notifyListeners();
  }

  set changeContent(String content) {
    _content = content;
    notifyListeners();
  }

  //function
  loadAll(Diary entry) {
    if (entry != null) {
      _date = DateTime.parse(entry.date);
      _title = entry.title;
      _content = entry.content;
      _entryId = entry.entryId;
    } else {
      _date = DateTime.now();
      _title = null;
      _content = null;
      _entryId = null;
    }
  }

  saveEntry() {
    if (_entryId == null) {
      //Add
      var newEntry = Diary(
        date: _date.toIso8601String(),
        title: _title,
        content: _content,
        entryId: uuid.v1(),
      );
      firestoreService.setEntry(newEntry);
    } else {
      //Edit
      var updateEntry = Diary(
        date: _date.toIso8601String(),
        title: _title,
        content: _content,
        entryId: _entryId,
      );
      firestoreService.setEntry(updateEntry);
    }
  }

  removeEntry(String entryId) {
    firestoreService.removeEntry(entryId);
  }
}
