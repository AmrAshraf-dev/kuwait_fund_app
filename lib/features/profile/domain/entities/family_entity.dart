// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:equatable/equatable.dart";

/// Entity that contains the data of the Family.
class FamilyEntity extends Equatable {
  final String? id;
  final String? name;
  final String? relation;

  /// Entity that contains the data of the Family.
  const FamilyEntity({
    this.id,
    this.name,
    this.relation,
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
