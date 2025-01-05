import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../contactus/data/data_sources/remote/contactus_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/contactus_repository.dart';
import '../models/response/contactus_response_model.dart';

@Injectable(as: ContactusRepository)
class ContactusRepositoryImp implements ContactusRepository {
  ContactusRepositoryImp({
    required this.contactusRemoteDataSource,
  });

  final ContactusRemoteDataSource contactusRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<ContactusModel>>> getContactus() async {
    return await contactusRemoteDataSource.getContactus();
  }

  @override
  Future<CustomResponseType<BaseEntity<ContactusModel>>>
      getMapCoordinates() async {
    return await contactusRemoteDataSource.getMapCoordinates();
  }

  @override
  Future<CustomResponseType<BaseEntity<ContactusModel>>>
      getTelephoneFax() async {
    return await contactusRemoteDataSource.getTelephoneFax();
  }
}
