part of 'ads_cubit.dart';

class AdsErrorState extends AdsState {
  final String? message;

  AdsErrorState({this.message});
}

final class AdsInitialState extends AdsState {}

final class AdsLoadingState extends AdsState {}

final class AdsReadyState extends AdsState {
  AdsReadyState(this.response);
    BaseEntity<List<AdsEntity>> response;

}
final class FetchNextAdsPage extends AdsState {
 }
sealed class AdsState {}
