part of 'peraonal_info_cubit.dart';

class PeraonalInfoErrorState extends PeraonalInfoState {
  final String? message;

  PeraonalInfoErrorState({this.message});
}

final class PeraonalInfoInitialState extends PeraonalInfoState {}

final class PeraonalInfoLoadingState extends PeraonalInfoState {}

final class PeraonalInfoReadyState extends PeraonalInfoState {
  PeraonalInfoReadyState(this.response);
    BaseEntity<PeraonalInfoEntity> response;

}

abstract class PeraonalInfoState {}
