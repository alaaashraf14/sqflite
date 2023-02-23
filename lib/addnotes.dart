import 'package:flutter/material.dart';

import 'Home.dart';
import 'SqlDb.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Notes"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: note,
                  decoration: const InputDecoration(hintText: "note"),
                ),
                TextFormField(
                  controller: title,
                  decoration: const InputDecoration(hintText: "title"),
                ),
                TextFormField(
                  controller: color,
                  decoration: const InputDecoration(hintText: "color"),
                ),
                Container(
                  height: 20,
                ),
                 MaterialButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: ()async{
                    int response = await sqlDb.insertData(note.text,title.text,color.text,'')
                      ( '''
                      INSERT INTO notes(note,title,color)
                      VALUES ()
                      ''');

                    if(response>0){
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context)=>const Home()),
                              (route) => false);
                    }

                  },


                  child: const Text("Add Note"),
                ),

              ],
            ))
          ],
        ),
      ),
    );
  }
}
