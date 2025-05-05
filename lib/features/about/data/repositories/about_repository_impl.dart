import 'package:injectable/injectable.dart';
import '../models/response/kf_board_of_directors_response_model.dart';
import '../models/response/kf_managment_response_model.dart';

import '../../../../core/network/base_handling.dart';
import '../../../about/data/data_sources/remote/about_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/about_repository.dart';
import '../models/response/general_information_response_model.dart';

@Injectable(as: AboutRepository)
class AboutRepositoryImp implements AboutRepository {
  AboutRepositoryImp({
    required this.aboutRemoteDataSource,
  });

  final AboutRemoteDataSource aboutRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<GeneralInformationModel>>>>
      getAbout() async {
    return await aboutRemoteDataSource.getAbout();
  }

  @override
  Future<CustomResponseType<BaseEntity<List<KFManagmentModel>>>>
      getKFManagment() async {
    return await aboutRemoteDataSource.getKFManagment();
  }

  @override
  Future<CustomResponseType<BaseEntity<List<KFBoardOfDirectorsModel>>>>
      getKFBoardOfDirectors() async {
    return await aboutRemoteDataSource.getKFBoardOfDirectors();
  }
}
