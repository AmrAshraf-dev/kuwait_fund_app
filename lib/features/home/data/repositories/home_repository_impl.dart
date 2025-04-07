


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/home_repository.dart';
 import '../models/response/home_response_model.dart';
import '../../../home/data/data_sources/remote/home_remote_data_source.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  HomeRepositoryImp({
    required this.homeRemoteDataSource,
  });

  final HomeRemoteDataSource homeRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<HomeModel>>> getHome(
     ) async {
    return await homeRemoteDataSource.getHome();
  }
}


