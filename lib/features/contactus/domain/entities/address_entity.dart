import "package:equatable/equatable.dart";

/// Entity that contains the data of the Contactus.
class AddressEntity extends Equatable {
  final String? line1;
  final String? line2;
  final String? line3;
  final String? line4;
  final String? line5;
  final String? line6;

  /// Entity that contains the data of the Contactus.
  const AddressEntity({
    required this.line1,
    required this.line2,
    required this.line3,
    required this.line4,
    required this.line5,
    required this.line6,
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
