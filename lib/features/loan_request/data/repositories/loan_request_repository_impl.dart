import 'package:injectable/injectable.dart';
import '../models/response/personal_loan_master_info_response_model.dart';
import '../models/response/personal_loan_reason_response_model.dart';

import '../../../../core/network/base_handling.dart';
import '../../../loan_request/data/data_sources/remote/loan_request_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/loan_request_repository.dart';

@Injectable(as: LoanRequestRepository)
class LoanRequestRepositoryImp implements LoanRequestRepository {
  LoanRequestRepositoryImp({
    required this.loanRequestRemoteDataSource,
  });

  final LoanRequestRemoteDataSource loanRequestRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<PersonalLoanReasonModel>>>>
      getLoanReasons() async {
    return await loanRequestRemoteDataSource.getLoanReasons();
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> createLoanRequest(
      loanRequestModel) async {
    return await loanRequestRemoteDataSource
        .createLoanRequest(loanRequestModel);
  }

  @override
  Future<CustomResponseType<BaseEntity<PersonalLoanMasterInfoModel>>>
      getPersonalLoanMasterInfo() async {
    return await loanRequestRemoteDataSource.getPersonalLoanMasterInfo();
  }
}
