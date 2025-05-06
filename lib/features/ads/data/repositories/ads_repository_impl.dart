import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/ads/data/data_sources/remote/ads_remote_data_source.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/ads_repository.dart';
import '../models/response/ads_response_model.dart';

@Injectable(as: AdsRepository)
class AdsRepositoryImp implements AdsRepository {
  AdsRepositoryImp({
    required this.adsRemoteDataSource,
  });

  final AdsRemoteDataSource adsRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<AdsModel>>>> getAds(
      int pageNumber, int? pageSize) async {
    return await adsRemoteDataSource.getAds(pageNumber, pageSize ?? 0);
  }
}
