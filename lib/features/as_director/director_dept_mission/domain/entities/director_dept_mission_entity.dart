 import "package:equatable/equatable.dart";





/// Entity that contains the data of the AdminDirectorMission.
class DeptEntity extends Equatable{

 final String? departmentCode;

 final  String? name;

  final  String? id;
 final  String? director_name;

  /// Entity that contains the data of the AdminDirectorMission.
   DeptEntity(
    {required this. departmentCode, 
    required this.name,
    required this.id,
    required this.director_name,}
   );

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
  
    id,
   
  ];


}