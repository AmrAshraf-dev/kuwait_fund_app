import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/peraonal_info_request_model.dart";
import "../entities/peraonal_info_entity.dart";
import "../repositories/peraonal_info_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetPeraonalInfoUseCase implements UseCase<BaseEntity<PeraonalInfoEntity>, PeraonalInfoRequestModel> {
    GetPeraonalInfoUseCase ({required this.peraonalInfoRepository});

  final PeraonalInfoRepository peraonalInfoRepository;


  @override
  Future<CustomResponseType<BaseEntity<PeraonalInfoEntity>>> call(
    PeraonalInfoRequestModel params,
  ) {
    
    
    return peraonalInfoRepository.getPeraonalInfo(peraonalInfoParams: params);
    
  }
}
