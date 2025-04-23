 import "package:equatable/equatable.dart";





/// Entity that contains the data of the AnnualLeaveRequest.
class AnnualLeaveRequestEntity extends Equatable{

 final String? availableBalance;

 final  bool ? displayExitDate;
  /// Entity that contains the data of the AnnualLeaveRequest.
   AnnualLeaveRequestEntity(
    {required this.availableBalance, required this.displayExitDate}
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