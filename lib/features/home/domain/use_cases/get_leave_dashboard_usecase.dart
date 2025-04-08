import "../../../../core/domain/usecase/base_usecase.dart";
 import "../entities/home_entity.dart";
import "../repositories/home_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetLeaveDashboardUseCase implements UseCaseNoParam<BaseEntity<HomeEntity>> {
    GetLeaveDashboardUseCase ({required this.homeRepository});

  final HomeRepository homeRepository;


  @override
  Future<CustomResponseType<BaseEntity<HomeEntity>>> call(
   
  ) {
    
    
    return homeRepository.getHome();
    
  }
}
