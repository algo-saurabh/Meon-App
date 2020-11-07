import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meno_app/src/providers/diary_provider.dart';
import 'package:meno_app/src/providers/entry_provider.dart';
import 'package:meno_app/src/screens/chooseGenger.dart';
import 'package:meno_app/src/screens/helloMale.dart';
import 'package:meno_app/src/screens/homescreen.dart';
import 'package:meno_app/src/screens/splashScreen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EntryProvider>(
            create: (context) => EntryProvider()),
        ChangeNotifierProvider<DiaryProvider>(
            create: (context) => DiaryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(body: SplashScreen()),
        ),
        theme: ThemeData(
          accentColor: Colors.pinkAccent,
          primaryColor: Colors.black,
        ),
      ),
    );
  }
}
