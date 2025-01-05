part of 'kf_board_of_directors_cubit.dart';

class KFBoardOfDirectorsErrorState extends KFBoardOfDirectorsState {
  final String? message;

  KFBoardOfDirectorsErrorState({this.message});
}

final class KFBoardOfDirectorsInitialState extends KFBoardOfDirectorsState {}

final class KFBoardOfDirectorsLoadingState extends KFBoardOfDirectorsState {}

final class KFBoardOfDirectorsReadyState extends KFBoardOfDirectorsState {
  KFBoardOfDirectorsReadyState(this.response);
  BaseEntity<List<KFBoardOfDirectorsEntity>> response;
}

abstract class KFBoardOfDirectorsState {}
