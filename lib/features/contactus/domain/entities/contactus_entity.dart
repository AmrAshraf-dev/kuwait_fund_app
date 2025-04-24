import "package:equatable/equatable.dart";
 import "package:kf_ess_mobile_app/features/contactus/data/models/response/contact_info_response_model.dart";
import "package:kf_ess_mobile_app/features/contactus/data/models/response/map_coordinates_response_model.dart";
import "package:kf_ess_mobile_app/features/contactus/data/models/response/telephone_and_fax_repsonse_model.dart";
 
/// Entity that contains the data of the Contactus.
class ContactusEntity extends Equatable {
final ContactInfoModel? contactInfo;
final MapCoordinatesModel? mapCoordinates;
 final TelephoneAndFaxModel? telephoneAndFax;


  /// Entity that contains the data of the Contactus.
  const ContactusEntity({
    required this.mapCoordinates,
 required this.contactInfo,
 required this.telephoneAndFax,
     
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

 
}
