import "package:equatable/equatable.dart";

/// Entity that contains the data of the Profile.
class SpouseEntity extends Equatable {
  final String? id;
  final String? name;
  final String? civilID;
  final String? birthDate;
  final String? status;
  final String? statusLabel;
  final String? statusDate;
  final String? attachmentInfo;

  /// Entity that contains the data of the Profile.
  const SpouseEntity(
      {this.id,
      this.name,
      this.civilID,
      this.birthDate,
      this.status,
      this.statusLabel,
      this.statusDate,
      this.attachmentInfo});

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
