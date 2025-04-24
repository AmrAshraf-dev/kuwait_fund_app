 import "package:equatable/equatable.dart";





/// Entity that contains the data of the AdminDirectorMission.
class DeptEntity extends Equatable{

 final String? departmentCode;

 final  String? name;

 
  /// Entity that contains the data of the AdminDirectorMission.
   DeptEntity(
    {required this. departmentCode, 
    required this.name,
    
   }
   );

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
  
    departmentCode,
   
  ];


}