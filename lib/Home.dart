import 'package:flutter/material.dart';
import 'SqlDb.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SqlDb sqlDb = SqlDb();
  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData("SELECT* FROM 'NOTES'");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pushNamed("addnotes");
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          child: ListView(
            children: [
              FutureBuilder(
                  future: readData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map>> snapshot){
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return  Card(
                                child: ListTile(
                              title:Text("${snapshot.data![i]['title']}"),
                                 subtitle:Text("${snapshot.data![i]['note']}"),
                                  trailing:Text("${snapshot.data![i]['color']}"),
                            ));
                          });
                    }
                    return  const Center(
                        child: CircularProgressIndicator());
                  })
            ],
          ),
        ));
  }
}
