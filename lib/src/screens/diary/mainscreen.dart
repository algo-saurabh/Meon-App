import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meno_app/src/models/diary.dart';
import 'package:meno_app/src/providers/diary_provider.dart';
import 'package:meno_app/src/screens/app_color.dart';
import 'package:meno_app/src/screens/diary/note_tile.dart';
import 'package:meno_app/src/screens/diary/notescreen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color backgroundclr = Color(0xFFA2B58E);
  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<DiaryProvider>(context);
    return Scaffold(
      backgroundColor: backgroundclr,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xff829b67),
        title: Text(
          'Diary',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0,left: 8.0,right: 8.0,bottom: 10.0),
        child: StreamBuilder<List<Diary>>(
          stream: entryProvider.entries,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                      child: NoteTile(note: snapshot.data[index]),
                      onTap: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                            NoteScreen(note: snapshot.data[index]),
                      ),
                    );
                  },
                ),
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff829b67),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NoteScreen(),
            ),
          );
        },
        tooltip: 'Add note',
        child: Icon(Icons.add),
      ),
    );
  }
}
