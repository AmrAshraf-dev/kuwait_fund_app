import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/request/requests_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/data/models/response/request_type_response_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/requests_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';
import '../entities/request_type_entity.dart';
import '../repositories/requests_repository.dart';

@injectable
class GetRequestTypesUseCase  implements UseCaseNoParam<BaseEntity<List<RequestTypeEntity>>> {
  final RequestsRepository repository;

  GetRequestTypesUseCase(this.repository);


@override
  Future<CustomResponseType<BaseEntity<List<RequestTypeEntity>>>> call() async {
    return await repository.getRequestTypes();


   
  }
}
