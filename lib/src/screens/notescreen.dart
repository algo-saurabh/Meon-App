import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:meno_app/src/models/entry.dart';
import 'package:meno_app/src/providers/entry_provider.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  final Entry entry;
  NoteScreen({this.entry});

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  Color backgroundclr = Color(0xFFA2B58E);

  TimeOfDay time;

  final entryControllerTitle = TextEditingController();
  final entryControllerExplanation = TextEditingController();

  @override
  void dispose() {
    entryControllerTitle.dispose();
    entryControllerExplanation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final entryProvider = Provider.of<EntryProvider>(context, listen: false);
    if (widget.entry != null) {
      //Edit
      entryControllerExplanation.text = widget.entry.explanation;
      entryControllerTitle.text = widget.entry.title;
      entryProvider.loadAll(widget.entry);
    } else {
      //Add
      entryProvider.loadAll(null);
    }
    super.initState();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      backgroundColor: backgroundclr,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xff829b67),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 32.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Task",
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        elevation: 3.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                  child: TextField(
                    minLines: 1,
                    maxLines: 1,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(fontSize: 24.0, color: Colors.white),
                      filled: true,
                      fillColor: Color(0xff829b67),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xff829b67)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xff829b67)),
                      ),
                    ),
                    onChanged: (String value) =>
                        entryProvider.changeTitle = value,
                    controller: entryControllerTitle,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Material(
                elevation: 0.0,
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xff829b67),
                child: InkWell(
                  splashColor: Colors.white60,
                  onTap: () => {
                    _pickDate(context, entryProvider).then((value) {
                      if (value != null) {
                        entryProvider.changeDate = value;
                      }
                    }),
                  },
                  child: SizedBox(
                    width: 300.0,
                    height: 50.0,
                    child: Center(
                      child: new Text(
                        formatDate(
                            entryProvider.date, [MM, ' ', d, ', ', yyyy]),
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Material(
                elevation: 0.0,
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xff829b67),
                child: InkWell(
                  splashColor: Colors.white60,
                  onTap: () => {
                    _pickTime(),
                  },
                  child: SizedBox(
                    width: 300.0,
                    height: 50.0,
                    child: Center(
                      child: new Text(
                        "${time.hour}:${time.minute}",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Material(
                elevation: 0.0,
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xff829b67),
                child: InkWell(
                  splashColor: Colors.white60,
                  onTap: () => {},
                  child: SizedBox(
                    width: 300.0,
                    height: 50.0,
                    child: Center(
                      child: new Text(
                        "Category",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Material(
                elevation: 0.0,
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xff829b67),
                child: InkWell(
                  splashColor: Colors.white60,
                  onTap: () => {},
                  child: SizedBox(
                    width: 300.0,
                    height: 50.0,
                    child: Center(
                      child: new Text(
                        "Reminder",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                  child: TextField(
                    minLines: 2,
                    maxLines: 8,
                    autocorrect: false,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Explanation',
                      hintStyle: TextStyle(fontSize: 24.0, color: Colors.white),
                      filled: true,
                      fillColor:  Color(0xff829b67),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: (String value) =>
                        entryProvider.changeExplanation = value,
                    controller: entryControllerExplanation,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: 300.0,
                child: RaisedButton(
                  color: Colors.white60,
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  onPressed: () {
                    final title = entryControllerTitle.text;
                    final explanation = entryControllerExplanation.text;
                    if (title.isEmpty && explanation.isEmpty) {
                      entryProvider.removeEntry(widget.entry.entryId);
                      Navigator.of(context).pop();
                    } else {
                      entryProvider.saveEntry();
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
              (widget.entry != null)
                  ? SizedBox(
                    width: 300,
                    child: RaisedButton(
                        color: Colors.white60,
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          entryProvider.removeEntry(widget.entry.entryId);
                          Navigator.of(context).pop();
                        },
                      ),
                  )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime> _pickDate(
      BuildContext context, EntryProvider entryProvider) async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: entryProvider.date,
      firstDate: DateTime(2019),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null) return pickedDate;
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
      });
  }
}
