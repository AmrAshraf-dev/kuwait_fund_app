import "package:equatable/equatable.dart";

/// Entity that contains the data of the Insurance.
class InsuranceProgramsEntity extends Equatable {
  final String? id;
  final String? name;

  /// Entity that contains the data of the Insurance.
  const InsuranceProgramsEntity({
    this.id,
    this.name,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        name,
      ];
}
