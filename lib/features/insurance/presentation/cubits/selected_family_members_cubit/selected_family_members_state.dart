part of 'selected_family_members_cubit.dart';

abstract class SelectedFamilyMembersState {}

class SelectedFamilyMembersInitialState extends SelectedFamilyMembersState {}

class SelectedFamilyMembersUpdatedState extends SelectedFamilyMembersState {
  final List<InsuranceFamilyMemberModel> selectedFamilyMembers;

  SelectedFamilyMembersUpdatedState(this.selectedFamilyMembers);
}
