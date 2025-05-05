import 'package:injectable/injectable.dart';
import '../entities/kf_managment_entity.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../repositories/about_repository.dart";

@injectable
class GetKFManagmentUseCase
    implements UseCaseNoParam<BaseEntity<List<KFManagmentEntity>>> {
  GetKFManagmentUseCase({required this.aboutRepository});

  final AboutRepository aboutRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<KFManagmentEntity>>>> call() {
    return aboutRepository.getKFManagment();
  }
}
