import '../../../data/model/swing.dart';

abstract class HomeSwingListState {}

class HomeSwingListInitial extends HomeSwingListState {}

class HomeSwingListLoading extends HomeSwingListState {}

class HomeSwingListLoaded extends HomeSwingListState {
  final List<Swing> swings;

  HomeSwingListLoaded(this.swings);
}

class HomeSwingListError extends HomeSwingListState {
  final String message;

  HomeSwingListError(this.message);
}