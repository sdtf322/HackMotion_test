// home_swing_list_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

import 'home_swing_list_event.dart';
import 'home_swing_list_state.dart';
import '../../../data/model/swing.dart';

class HomeSwingListBloc extends Bloc<HomeSwingListEvent, HomeSwingListState> {
  HomeSwingListBloc() : super(HomeSwingListInitial()) {
    on<LoadSwings>(_onLoadSwings);
    on<DeleteSwing>(_onDeleteSwing);
  }

  Future<void> _onLoadSwings(
      LoadSwings event, Emitter<HomeSwingListState> emit) async {
    emit(HomeSwingListLoading());

    try {
      List<String> paths = [
        'assets/json/1.json',
        'assets/json/2.json',
        'assets/json/3.json',
        'assets/json/4.json',
        'assets/json/5.json',
      ];

      List<Swing> swings = [];
      for (String path in paths) {
        String jsonString = await rootBundle.loadString(path);
        Swing swing = swingFromJson(jsonString);
        swings.add(swing);
      }

      emit(HomeSwingListLoaded(swings));
    } catch (e) {
      emit(HomeSwingListError(e.toString()));
    }
  }

  Future<void> _onDeleteSwing(
      DeleteSwing event, Emitter<HomeSwingListState> emit) async {
    if (state is HomeSwingListLoaded) {
      final currentState = state as HomeSwingListLoaded;
      final List<Swing> updatedSwings = List.from(currentState.swings);
      updatedSwings.removeAt(event.index);

      emit(HomeSwingListLoaded(updatedSwings));
    }
  }
}
