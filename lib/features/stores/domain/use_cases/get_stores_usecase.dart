import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/stores_request_model.dart";
import "../entities/stores_entity.dart";
import "../repositories/stores_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetStoresUseCase implements UseCase<BaseEntity<StoresEntity>, StoresRequestModel> {
    GetStoresUseCase ({required this.storesRepository});

  final StoresRepository storesRepository;


  @override
  Future<CustomResponseType<BaseEntity<StoresEntity>>> call(
    StoresRequestModel params,
  ) {
    
    
    return storesRepository.getStores(storesParams: params);
    
  }
}
