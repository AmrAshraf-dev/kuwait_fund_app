import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/country_grants_entity.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/use_cases/countries_grants_usecase/get_countries_grants_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'countries_grants_state.dart';

@injectable
class CountriesGrantsCubit extends Cubit<CountriesGrantsState> {
  final GetCountriesGrantsUseCase getCountriesGrantsUseCase;
  CountriesGrantsCubit({required this.getCountriesGrantsUseCase})
      : super(CountriesGrantsInitialState()) {
    getCountriesGrants();
  }

  Future<void> getCountriesGrants() async {
    emit(CountriesGrantsLoadingState());

    final CustomResponseType<BaseEntity<List<CountryGrantsEntity>>>
        eitherSuccessOrFailure = await getCountriesGrantsUseCase();

    eitherSuccessOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(CountriesGrantsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<CountryGrantsEntity>> response) {
      emit(CountriesGrantsReadyState(response));
    });
  }
}
