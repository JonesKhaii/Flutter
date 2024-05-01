import 'package:flutter/material.dart';
import 'package:contact/page/home.dart';
import 'package:contact/page/details.dart';
import 'package:contact/page/addnew.dart';
import 'package:contact/models/contact.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add_new': (context) => AddNewScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final args = settings.arguments;
          if (args is ContactModel) {
            return MaterialPageRoute(
              builder: (context) => DetailsScreen(args),
            );
          }
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
