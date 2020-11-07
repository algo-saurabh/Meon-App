import 'package:flutter/material.dart';
import 'package:meno_app/src/models/entry.dart';
import 'package:meno_app/src/providers/entry_provider.dart';
import 'package:meno_app/src/screens/diary/mainscreen.dart';
import 'package:meno_app/src/screens/notescreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color backgroundclr = Color(0xFFA2B58E);

  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      backgroundColor: backgroundclr,
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: Color(0xff829b67),
        centerTitle: true,
        leading: Icon(Icons.menu, size: 32.0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.comment, size: 32.0),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            },
          ),
        ],
        title: Text(
          "DAILY TASKS",
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        elevation: 6.0,
      ),
      body: Column(
        children: [
          Divider(),
          Text(
            "Good Morning",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "30 Sep 2020",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Divider(),
          Divider(),
          Flexible(
            child: StreamBuilder<List<Entry>>(
              stream: entryProvider.entries,
              builder: (context, snapshot) {
                if (snapshot.data == null) return CircularProgressIndicator();
                return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 20.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        width: 300.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: 55.0,
                              child: Center(
                                child: Text(
                                  '10 AM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: backgroundclr,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => NoteScreen(
                                      entry: snapshot.data[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                color:backgroundclr,
                                child: Center(
                                  child: Text(
                                    snapshot.data[index].title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 50.0,
                              child: Center(
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {

                                    });
                                  },
                                  icon: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: backgroundclr,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Divider(),
          Divider(),
          Divider(),
          Material(
            elevation: 6.0,
            borderRadius: BorderRadius.circular(12.0),
            color: Color(0xff829b67),
            child: InkWell(
              splashColor: Colors.white60,
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NoteScreen(),
                  ),
                ),
              },
              child: SizedBox(
                width: 300.0,
                height: 40.0,
                child: Center(
                  child: new Text(
                    "Add Task +",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff829b67),
        child: Image.asset("assets/images/maleicon.png"),
        isExtended: false,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 6.0,
        child: BottomNavigationBar(
          backgroundColor: Color(0xff829b67),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white, size: 32.0),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white, size: 32.0),
              title: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
