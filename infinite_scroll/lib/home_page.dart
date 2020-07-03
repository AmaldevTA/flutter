import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List items = <String>[];
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        setState(() {
          items.addAll(getListValue());
        });
      }
    });
    items.addAll(getListValue());
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: items.length,
        padding: EdgeInsets.symmetric(vertical: 5),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            child: Text(items[index]),
            padding: EdgeInsets.all(10),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<String> getListValue(){
    List<String> list = [];
    for( var i = 0 ; i < 30; i++ ) {
      list.add('--- $i ---');
    }

    return list;
  }
}