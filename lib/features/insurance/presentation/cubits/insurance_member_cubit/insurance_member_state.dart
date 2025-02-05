part of 'insurance_member_cubit.dart';

abstract class InsuranceMemberState {
  const InsuranceMemberState();
}

class InsuranceMemberInitialState extends InsuranceMemberState {}

class InsuranceMemberLoadingState extends InsuranceMemberState {}

class InsuranceMemberReadyState extends InsuranceMemberState {
  final List<FamilyMemberEntity> familyMemberList;

  const InsuranceMemberReadyState(this.familyMemberList);
}

class InsuranceMemberSelectedState extends InsuranceMemberState {
  final List<int> selectedIndexes;

  const InsuranceMemberSelectedState(this.selectedIndexes);
}

class SubscriberReadyState extends InsuranceMemberState {
  final List<SubscriberEntity> subscriberList;

  const SubscriberReadyState(this.subscriberList);
}

class InsuranceMemberErrorState extends InsuranceMemberState {
  final String? message;

  const InsuranceMemberErrorState({this.message});
}
