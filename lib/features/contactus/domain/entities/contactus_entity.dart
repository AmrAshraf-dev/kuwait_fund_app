import "package:equatable/equatable.dart";
import "package:kf_ess_mobile_app/features/contactus/data/models/response/address_response_model.dart";

/// Entity that contains the data of the Contactus.
class ContactusEntity extends Equatable {
  final String? operationsEmail;
  final String? webmasterEmail;
  final String? fax;
  final String? telephoneNumber;
  final AddressModel? address;
  final String? latitude;
  final String? longitude;

  /// Entity that contains the data of the Contactus.
  const ContactusEntity({
    required this.operationsEmail,
    required this.webmasterEmail,
    required this.fax,
    required this.telephoneNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        /*
  List your entity attributes here 
  */
      ];

  copyWith(
      {operationsEmail,
      webmasterEmail,
      fax,
      telephoneNumber,
      address,
      latitude,
      longitude}) {
    return ContactusEntity(
      operationsEmail: operationsEmail ?? this.operationsEmail,
      webmasterEmail: webmasterEmail ?? this.webmasterEmail,
      fax: fax ?? this.fax,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
