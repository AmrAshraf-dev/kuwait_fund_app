import '../../data/models/response/address_response_model.dart';

class ContactInfoEntity {

    final String? operationsEmail;
  final String? webmasterEmail;
  final List<AddressModel>? address;

  const ContactInfoEntity({
    required this.operationsEmail,
    required this.webmasterEmail,
        required this.address,

  });
}
