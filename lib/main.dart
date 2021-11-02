import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(
        duration: 5,
        goToPage: ShopingList(),
      )));
}

class MyApp extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  MyApp({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
        body: Container(
      color: Colors.indigo,
      child: Center(
        child: Icon(
          Icons.stars,
          color: Colors.white,
          size: 100.0,
        ),
      ),
    ));
  }
}

class ShopingList extends StatefulWidget {
  @override
  State<ShopingList> createState() => _ShopingListState();
}

class _ShopingListState extends State<ShopingList> {
  final List<String> entries = [];
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    entries.sort();

    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: entries.length > 0
            ? ListView.separated(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.local_grocery_store),
                    title: Text('${entries[index]}'),
                    onLongPress: () {
                      setState(() {
                        entries.removeAt(index);
                      });
                    },
                    trailing: Icon(Icons.remove_circle_outline),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.black,
                ),
              )
            : Center(
                child: Text('There are no Items in you Shoping List'),
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            setState(() {
              entries.add(textController.text);
              textController.clear();
            });
          },
        ));
  }
}
