import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_clone/pages/home/home_screen.dart';
import 'package:netflix_clone/utils/resource.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Resource.black,
    systemNavigationBarColor: Colors.white,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .apply(color: Colors.white),
              bodyText2: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .apply(color: Colors.white),
            ),
      ),
      home: HomeScreen(),
    );
  }
}
