import "package:equatable/equatable.dart";

/// Entity that contains the data of the Requests.
class LeaveBalanceEntity extends Equatable {
  final String? data;

//
  /// Entity that contains the data of the Requests.
  const LeaveBalanceEntity({
    required this.data,
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
