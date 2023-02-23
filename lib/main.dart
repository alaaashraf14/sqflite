import 'package:database/addnotes.dart';
import 'package:flutter/material.dart';

import 'Home.dart';






void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',

      home: const Home(),
      routes:{"addnotes":(context)=>const AddNotes()} ,
    );
  }
}