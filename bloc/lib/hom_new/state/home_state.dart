import 'package:blocSample/hom_new/model/home_model.dart';

class HomeState {
  List<HomeModel> dataSet;

  HomeState._();

  factory HomeState.init() {
    HomeState homeState = HomeState._();
    homeState.dataSet = [
      HomeModel("1", "One", "Model_1"),
      HomeModel("2", "Two", "Model_2"),
      HomeModel("3", "Three", "Model_3"),
      HomeModel("4", "Four", "Model_4"),
    ];
    return homeState;
  }

  factory HomeState.newState(List<HomeModel> _dataSet) {
    HomeState homeState = HomeState._();
    homeState.dataSet = _dataSet;

    return homeState;
  }
}
