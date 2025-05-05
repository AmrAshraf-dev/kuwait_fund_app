


import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/shared/data/local_data.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/more_repository.dart';
 import '../models/response/more_response_model.dart';
import '../../../more/data/data_sources/remote/more_remote_data_source.dart';

@Injectable(as: MoreRepository)
class MoreRepositoryImp implements MoreRepository {
  MoreRepositoryImp({
    required this.moreRemoteDataSource,
  });

  final MoreRemoteDataSource moreRemoteDataSource;

@override
  Future<CustomResponseType<BaseEntity<List<MoreModel>>>> getMore() async {

    Either<Failure, MoreResponseModel> result =  await moreRemoteDataSource.getMore();
 result.fold(
      (failure) {
          failure;
      },
      (response) {
       LocalData.setMoreEntityList(response.data??[]);
        response;
      },
    );

    return result;
  }
}


