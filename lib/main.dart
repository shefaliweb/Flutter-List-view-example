import 'package:flutter/material.dart';
//neelam
class Listitem {
  final String title;
  final String description;


  const Listitem(this.title, this.description);
}

void main() {
  runApp(
    MaterialApp(
      title: 'List Data',
      debugShowCheckedModeBanner: false,
      home: ListScreen(
        data: List.generate(20,(i) => Listitem('List $i','A description of what needs to be done for Todo $i',
        ),
        ),
      ),
    ),
  );
}

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key, required this.data}) : super(key: key);

  final List<Listitem> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Items'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(data[index].title),
            leading: CircleAvatar(child: Text(data[index].title[0])),
            // subtitle: Text("battery fully "),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: data[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.item}) : super(key: key);

  final Listitem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(item.description),
      ),
    );
  }
}