import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/response/personal_info_response_model.dart';

abstract class PersonalInfoRemoteDataSource {
  Future<CustomResponseType<PersonalInfoResponseModel>> getPeraonalInfo();
}

@Injectable(as: PersonalInfoRemoteDataSource)
class PersonalInfoDataSourceImpl implements PersonalInfoRemoteDataSource {
  PersonalInfoDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<PersonalInfoResponseModel>>
      getPeraonalInfo() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.getProfileInfo);

    if (result.success) {
      return right(PersonalInfoResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
