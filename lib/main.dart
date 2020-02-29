import 'package:flutter/material.dart';
import 'package:formvalidation/src/pages/bloc/provider.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      // key: key,
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home' : (context) => HomePage(),
          'login' : (conext)  => LoginPage(),

        },
        theme: ThemeData( 
          primaryColor: Colors.deepPurple
        ),
      ),

    );
  }
}
