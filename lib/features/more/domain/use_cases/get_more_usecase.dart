import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/more_request_model.dart";
import "../entities/more_entity.dart";
import "../repositories/more_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetMoreUseCase implements UseCaseNoParam<BaseEntity<List<MoreEntity>>> {
    GetMoreUseCase ({required this.moreRepository});

  final MoreRepository moreRepository;


  @override
  Future<CustomResponseType<BaseEntity<List<MoreEntity>>>> call(
  
  ) {
    
    
    return moreRepository.getMore( );
    
  }
}
