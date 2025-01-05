import "package:equatable/equatable.dart";

/// Entity that contains the data of the About.
class GeneralInformationEntity extends Equatable {
  final String? title;

  final String? description;

  /// Entity that contains the data of the About.
  const GeneralInformationEntity(
      {required this.title, required this.description});

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
