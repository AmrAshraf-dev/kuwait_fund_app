import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/offers_request_model.dart";
import "../entities/offers_entity.dart";
import "../repositories/offers_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetOffersUseCase implements UseCase<BaseEntity<OffersEntity>, OffersRequestModel> {
    GetOffersUseCase ({required this.offersRepository});

  final OffersRepository offersRepository;


  @override
  Future<CustomResponseType<BaseEntity<OffersEntity>>> call(
    OffersRequestModel params,
  ) {
    
    
    return offersRepository.getOffers(offersParams: params);
    
  }
}
