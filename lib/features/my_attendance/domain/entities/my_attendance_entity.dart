 import "package:equatable/equatable.dart";





/// Entity that contains the data of the MyAttendance.
class MyAttendanceEntity extends Equatable{

 final String? var1;

 final  String? var2;
  /// Entity that contains the data of the MyAttendance.
   MyAttendanceEntity(
    {required this.var1, required this.var2}
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