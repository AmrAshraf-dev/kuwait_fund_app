import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/child_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/use_cases/get_child_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";

part 'child_state.dart';

@injectable
class ChildCubit extends Cubit<ChildState> {
  final GetChildUseCase getChildUseCase;
  ChildCubit({required this.getChildUseCase}) : super(ChildInitialState());

  Future<void> getChild({ChildRequestModel? childModel}) async {
    emit(ChildLoadingState());

    final CustomResponseType<BaseEntity<ChildModel>> eitherPackagesOrFailure =
        await getChildUseCase(childModel!);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ChildErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<ChildModel> response) {
      emit(ChildReadyState(response));
    });
  }
}
