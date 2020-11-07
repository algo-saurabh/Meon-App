import 'package:flutter/material.dart';

class Diary {
  final String entryId;
  final String date;
  final String content;
  final String title;

  Diary({this.title, this.date, this.content, @required this.entryId});

  //json to dart when reading

  factory Diary.fromJson(Map<String, dynamic> json) {
    return Diary(
      title: json['title'],
      date: json['date'],
      content: json['content'],
      entryId: json['entryId'],
    );
  }
  //dart to Json when writing

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'content': content,
      'entryId': entryId,
    };
  }
}
