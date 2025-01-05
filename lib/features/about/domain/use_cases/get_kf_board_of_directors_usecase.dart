import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/about/domain/entities/kf_board_of_directors_entity.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../repositories/about_repository.dart";

@injectable
class GetKFBoardOfDirectorsUseCase
    implements UseCaseNoParam<BaseEntity<List<KFBoardOfDirectorsEntity>>> {
  GetKFBoardOfDirectorsUseCase({required this.aboutRepository});

  final AboutRepository aboutRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<KFBoardOfDirectorsEntity>>>>
      call() {
    return aboutRepository.getKFBoardOfDirectors();
  }
}
