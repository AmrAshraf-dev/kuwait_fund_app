import "package:equatable/equatable.dart";

/// Entity that contains the data of the Requests.
class RequestsEntity extends Equatable {
  final String? status;
  final String? date;
  final String? type;
  final String? from;
  final String? to;

  /// Entity that contains the data of the Requests.
  const RequestsEntity({
    required this.status,
    required this.date,
    required this.type,
    required this.from,
    required this.to,
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
