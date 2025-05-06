 import "package:equatable/equatable.dart";





/// Entity that contains the data of the Poll.
class PollEntity extends Equatable{

 final int? id;

 final  String? question;

 final String? expiresOn;

 final String? createdOn;

 final int? sortOrder;
  /// Entity that contains the data of the Poll.
 const  PollEntity(
    {required this.
      id,
      required this.question,
      required this.expiresOn,
      required this.createdOn,
      required this.sortOrder,
    }
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