import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meno_app/src/models/entry.dart';
import 'package:meno_app/src/services/firebase_services.dart';
import 'package:uuid/uuid.dart';

class EntryProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  DateTime _date;
  String _explanation;
  String _title;
  String _entryId;
  var uuid = Uuid();

  //Getters
  DateTime get date => _date;
  Stream<List<Entry>> get entries => firestoreService.getEntries();

  //Setters
  set changeDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  set changeTitle(String title) {
    _title = title;
    notifyListeners();
  }

  set changeExplanation(String explanation) {
    _explanation = explanation;
    notifyListeners();
  }

  //function
  loadAll(Entry entry) {
    if (entry != null) {
      _date = DateTime.parse(entry.date);
      _title = entry.title;
      _explanation = entry.explanation;
      _entryId = entry.entryId;
    } else {
      _date = DateTime.now();
      _title = null;
      _explanation = null;
      _entryId = null;
    }
  }

  saveEntry() {
    if (_entryId == null) {
      //Add
      var newEntry = Entry(
        date: _date.toIso8601String(),
        title: _title,
        explanation: _explanation,
        entryId: uuid.v1(),
      );
      firestoreService.setEntry(newEntry);
    } else {
      //Edit
      var updateEntry = Entry(
        date: _date.toIso8601String(),
        title: _title,
        explanation: _explanation,
        entryId: _entryId,
      );
      firestoreService.setEntry(updateEntry);
    }
  }

  removeEntry(String entryId) {
    firestoreService.removeEntry(entryId);
  }
}
