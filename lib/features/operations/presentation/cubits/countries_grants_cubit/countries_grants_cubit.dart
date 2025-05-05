import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../domain/entities/country_grants_entity.dart';
import '../../../domain/use_cases/countries_grants_usecase/get_countries_grants_usecase.dart';
import '../../../../shared/entity/base_entity.dart';

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
