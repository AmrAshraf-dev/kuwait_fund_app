 import "package:equatable/equatable.dart";





/// Entity that contains the data of the Survey.
class SurveyEntity extends Equatable{

 final int? id;

 final  String? title;

 final String? expiresOn;

 final String? createdOn;

 final int? sortOrder;
  /// Entity that contains the data of the Survey.
  const SurveyEntity(
    {required this.
      id,
      required this.title,
      required this.expiresOn,
      required this.createdOn,
      required this.sortOrder,}
   );

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