import 'package:blocSample/hom_new/model/home_model.dart';

abstract class HomeEvent {}

class HomeAddEvent extends HomeEvent {
  HomeModel model;

  HomeAddEvent(this.model);
}

class HomeDeleteEvent extends HomeEvent {
  HomeModel model;

  HomeDeleteEvent(this.model);
}
