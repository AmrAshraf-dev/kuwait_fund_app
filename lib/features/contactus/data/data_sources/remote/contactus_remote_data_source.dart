import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/response/contactus_response_model.dart';

abstract class ContactusRemoteDataSource {
  Future<CustomResponseType<ContactusResponseModel>> getContactus();

  Future<CustomResponseType<ContactusResponseModel>> getMapCoordinates();

  Future<CustomResponseType<ContactusResponseModel>> getTelephoneFax();
}

@Injectable(as: ContactusRemoteDataSource)
class ContactusDataSourceImpl implements ContactusRemoteDataSource {
  ContactusDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<ContactusResponseModel>> getContactus() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.contactInformation);

    if (result.success) {
      return right(ContactusResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<ContactusResponseModel>> getMapCoordinates() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.mapCoordinates);

    if (result.success) {
      return right(ContactusResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<ContactusResponseModel>> getTelephoneFax() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.telephoneFax);

    if (result.success) {
      return right(ContactusResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
