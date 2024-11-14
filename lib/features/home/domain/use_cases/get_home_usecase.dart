import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/home_request_model.dart";
import "../entities/home_entity.dart";
import "../repositories/home_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetHomeUseCase implements UseCase<BaseEntity<HomeEntity>, HomeRequestModel> {
    GetHomeUseCase ({required this.homeRepository});

  final HomeRepository homeRepository;


  @override
  Future<CustomResponseType<BaseEntity<HomeEntity>>> call(
    HomeRequestModel params,
  ) {
    
    
    return homeRepository.getHome(homeParams: params);
    
  }
}
