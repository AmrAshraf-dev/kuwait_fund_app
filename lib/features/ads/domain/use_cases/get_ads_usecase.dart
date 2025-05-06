import 'package:kf_ess_mobile_app/features/ads/data/models/request/ads_request_model.dart';
import 'package:kf_ess_mobile_app/features/ads/domain/entities/ads_entity.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import "../repositories/ads_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';

@injectable
class GetAdsUseCase implements UseCase<BaseEntity<List<AdsEntity>>, int> {
  GetAdsUseCase({required this.adsRepository});

  final AdsRepository adsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<AdsEntity>>>> call(int pageNumber) {
    return adsRepository.getAds(pageNumber, 3);
  }
}
