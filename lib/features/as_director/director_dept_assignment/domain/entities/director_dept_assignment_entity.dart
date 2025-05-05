 import "package:equatable/equatable.dart";
import "../../data/models/response/director_dept_assignment_employee_response_model.dart";
 




/// Entity that contains the data of the AdminDeptMission.
class DirectorDeptAssignmentEntity extends Equatable{

 final int? missionCount;

 final  int? employeesCount;

 final int? countriesCount;

 final List<DirectorDeptAssignmentEmployeeModel>? employeesArray;
  /// Entity that contains the data of the AdminDeptMission.
   DirectorDeptAssignmentEntity(
    {required this.missionCount, required this.employeesCount , required this.countriesCount ,  required this.employeesArray}
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