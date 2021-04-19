import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urlshortner/Providers/Url_shortner_state.dart';

import 'Screens/HomePage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: MyApp(),
      create: (context) => UrlShortnerState(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
