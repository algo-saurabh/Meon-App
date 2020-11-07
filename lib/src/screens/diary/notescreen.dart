import 'package:flutter/material.dart';
import 'package:meno_app/src/models/diary.dart';
import 'package:meno_app/src/providers/diary_provider.dart';
import 'package:meno_app/src/screens/app_color.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  final Diary note;

  NoteScreen({this.note});

  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  Color backgroundclr = Color(0xFFA2B58E);
  final TextEditingController _titleTextEditingController =
      TextEditingController();
  final TextEditingController _contentsTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _contentsTextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final entryProvider = Provider.of<DiaryProvider>(context, listen: false);
    if (widget.note != null) {
      //Edit
      _contentsTextEditingController.text = widget.note.content;
      _titleTextEditingController.text = widget.note.title;
      entryProvider.loadAll(widget.note);
    } else {
      //Add
      entryProvider.loadAll(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<DiaryProvider>(context);
    return Scaffold(
      backgroundColor: backgroundclr,
      appBar: AppBar(
        backgroundColor: Color(0xff829b67),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            final title = _titleTextEditingController.text;
            final contents = _contentsTextEditingController.text;
            //if the note is empty delete it, else update
            if (title.isEmpty && contents.isEmpty) {
              entryProvider.removeEntry(widget.note.entryId);
            } else {
              entryProvider.saveEntry();
            }
            // pop screen
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // delete note
              entryProvider.removeEntry(widget.note.entryId);
              // pop screen
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              //title
              TextField(
                onChanged: (String value) => entryProvider.changeTitle = value,
                controller: _titleTextEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                maxLines: 1,
              ),
              SizedBox(
                height: 30,
              ),
              // contents
              TextField(
                onChanged: (String value) => entryProvider.changeContent = value,
                controller: _contentsTextEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Content',
                  hintStyle: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
                autofocus: true,
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
