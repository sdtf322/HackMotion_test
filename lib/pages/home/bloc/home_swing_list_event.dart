abstract class HomeSwingListEvent {}

class LoadSwings extends HomeSwingListEvent {}

class DeleteSwing extends HomeSwingListEvent {
  final int index;

  DeleteSwing(this.index);
}