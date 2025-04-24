import "package:equatable/equatable.dart";

/// Entity that contains the data of the Contactus.
class AddressEntity extends Equatable {
  final String? text;
 

  /// Entity that contains the data of the Contactus.
  const AddressEntity({
    required this.text,
    
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
