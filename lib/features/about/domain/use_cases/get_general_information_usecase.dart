import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../entities/general_information_entity.dart";
import "../repositories/about_repository.dart";

@injectable
class GetGeneralInformationUseCase
    implements UseCaseNoParam<BaseEntity<List<GeneralInformationEntity>>> {
  GetGeneralInformationUseCase({required this.aboutRepository});

  final AboutRepository aboutRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<GeneralInformationEntity>>>>
      call() {
    return aboutRepository.getAbout();
  }
}
