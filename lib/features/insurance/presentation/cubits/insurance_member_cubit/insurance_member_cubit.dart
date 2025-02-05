import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import '../../../domain/entities/family_member_entity.dart';
import '../../../domain/entities/subscriber_entity.dart';
import '../../../domain/use_cases/get_family_members_usecase.dart';
import '../../../domain/use_cases/get_subscribers_usecase.dart';

part 'insurance_member_state.dart';

@injectable
class InsuranceMemberCubit extends Cubit<InsuranceMemberState> {
  final GetFamilyMembersUseCase getFamilyMembersUseCase;
  final GetSubscribersUseCase getSubscribersUseCase;
  List<int> selectedIndexes = [];

  InsuranceMemberCubit({
    required this.getFamilyMembersUseCase,
    required this.getSubscribersUseCase,
  }) : super(InsuranceMemberInitialState());

  Future<void> getFamilyMembers() async {
    emit(InsuranceMemberLoadingState());

    final CustomResponseType<BaseEntity<List<FamilyMemberEntity>>>
        eitherFamilyMembersOrFailure = await getFamilyMembersUseCase();

    eitherFamilyMembersOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(InsuranceMemberErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<FamilyMemberEntity>> response) {
      emit(InsuranceMemberReadyState(response.data!));
    });
  }

  Future<void> getSubscribers() async {
    emit(InsuranceMemberLoadingState());

    final CustomResponseType<BaseEntity<List<SubscriberEntity>>>
        eitherSubscribersOrFailure = await getSubscribersUseCase();

    eitherSubscribersOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(InsuranceMemberErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<SubscriberEntity>> response) {
      emit(SubscriberReadyState(response.data!));
    });
  }

  void selectFamilyMember(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      selectedIndexes.add(index);
    }
    emit(InsuranceMemberSelectedState(selectedIndexes));
  }
}
