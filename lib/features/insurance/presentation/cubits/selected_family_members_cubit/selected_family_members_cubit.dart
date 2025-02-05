import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/response/insurance_family_member_response_model.dart';

part 'selected_family_members_state.dart';

@injectable
class SelectedFamilyMembersCubit extends Cubit<SelectedFamilyMembersState> {
  SelectedFamilyMembersCubit() : super(SelectedFamilyMembersInitialState());

  List<InsuranceFamilyMemberModel> selectedFamilyMembers = [];

  void toggleFamilyMember(InsuranceFamilyMemberModel familyMember) {
    if (selectedFamilyMembers.contains(familyMember)) {
      selectedFamilyMembers.remove(familyMember);
    } else {
      selectedFamilyMembers.add(familyMember);
    }
    emit(SelectedFamilyMembersUpdatedState(selectedFamilyMembers));
  }
}
