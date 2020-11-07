import 'package:flutter/material.dart';
import 'package:meno_app/src/models/diary.dart';
import 'package:meno_app/src/screens/app_color.dart';

class NoteTile extends StatelessWidget {
  /// The note to display
  final Diary note;

  /// Constructs a new NoteTile
  const NoteTile({@required this.note, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff829b67),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            if (note.title.isNotEmpty)
              Text(
                note.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            if (note.title.isNotEmpty && note.content.isNotEmpty)
              Container(height: 12),
            if (note.content.isNotEmpty)
              Text(
                note.content,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
