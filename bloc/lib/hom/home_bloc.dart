import 'dart:async';

import 'package:blocSample/hom/home_model.dart';

class HomeBloc {
  List<HomeModel> myList = [
    HomeModel("1", "One", "Model_1"),
    HomeModel("2", "Two", "Model_2"),
    HomeModel("3", "Three", "Model_3"),
    HomeModel("4", "Four", "Model_4"),
  ];

  final _myListController = StreamController<List<HomeModel>>();
  final _myListAddController = StreamController<HomeModel>();
  final _myListDeleteController = StreamController<HomeModel>();

  Stream<List<HomeModel>> get myListStream => _myListController.stream;

  StreamSink<List<HomeModel>> get _myListSink => _myListController.sink;

  StreamSink<HomeModel> get myListAdd => _myListAddController.sink;

  StreamSink<HomeModel> get myListDelete => _myListDeleteController.sink;

  HomeBloc() {
    _myListController.add(myList);

    _myListAddController.stream.listen((homeModel) {
      myList.add(homeModel);
      _myListSink.add(myList);
    });

    _myListDeleteController.stream.listen((homeModel) {
      myList.remove(homeModel);
      _myListSink.add(myList);
    });
  }

  void dispose() {
    _myListController.close();
    _myListAddController.close();
    _myListDeleteController.close();
  }
}
