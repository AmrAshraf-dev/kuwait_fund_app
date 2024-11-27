


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/offers_repository.dart';
import '../models/request/offers_request_model.dart';
import '../models/response/offers_response_model.dart';
import '../../../offers/data/data_sources/remote/offers_remote_data_source.dart';

@Injectable(as: OffersRepository)
class OffersRepositoryImp implements OffersRepository {
  OffersRepositoryImp({
    required this.offersRemoteDataSource,
  });

  final OffersRemoteDataSource offersRemoteDataSource;

  Future<CustomResponseType<BaseEntity<OffersModel>>> getOffers(
      {required OffersRequestModel offersParams}) async {
    return await offersRemoteDataSource.getOffers(
        offersRequestModel: offersParams);
  }
}


