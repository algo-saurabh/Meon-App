import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Entry {
  final String entryId;
  final String date;
  final String explanation;
  final String title;

  Entry({this.title, this.date, this.explanation, @required this.entryId});

  //json to dart when reading

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      title: json['title'],
      date: json['date'],
      explanation: json['explanation'],
      entryId: json['entryId'],
    );
  }
  //dart to Json when writing

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'explanation': explanation,
      'entryId': entryId,
    };
  }
}
