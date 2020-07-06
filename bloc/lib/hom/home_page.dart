import 'package:blocSample/hom/home_bloc.dart';
import 'package:blocSample/hom/home_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeBloc _homeBloc = HomeBloc();

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: StreamBuilder<List<HomeModel>>(
          stream: _homeBloc.myListStream,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(snapshot.data[index].field3),
                    IconButton(
                      onPressed: () {
                        _homeBloc.myListDelete.add(snapshot.data[index]);
                      },
                      icon: Icon(Icons.delete_forever),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _homeBloc.myListAdd.add(HomeModel("5", "Four", "Model_5"));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
