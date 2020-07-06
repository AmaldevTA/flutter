import 'package:blocSample/hom_new/event/home_event.dart';
import 'package:blocSample/hom_new/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeAddEvent) {
      yield HomeState.newState(state.dataSet..add(event.model));
    } else if (event is HomeDeleteEvent) {
      yield HomeState.newState(state.dataSet..remove(event.model));
    } else {
      addError(Exception('unsupported event'));
    }
  }
}
