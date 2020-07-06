import 'package:blocSample/hom_new/event/home_event.dart';
import 'package:blocSample/hom_new/home_bloc.dart';
import 'package:blocSample/hom_new/model/home_model.dart';
import 'package:blocSample/hom_new/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeBloc homeBloc = HomeBloc(HomeState.init());

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => homeBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          bloc: homeBloc,
          builder: (_, state) {
            return ListView.builder(
              itemCount: state.dataSet.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(state.dataSet[index].field3),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeDeleteEvent(state.dataSet[index]));
                      },
                      icon: Icon(Icons.delete_forever),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            homeBloc.add(HomeAddEvent(HomeModel("5", "Four", "Model_5")));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
