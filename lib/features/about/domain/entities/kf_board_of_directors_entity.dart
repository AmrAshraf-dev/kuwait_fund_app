import "package:equatable/equatable.dart";

/// Entity that contains the data of the About.
class KFBoardOfDirectorsEntity extends Equatable {
  final String? name;

  final String? role;

  final String? imageUrl;

  /// Entity that contains the data of the About.
  const KFBoardOfDirectorsEntity(
      {required this.name, required this.role, required this.imageUrl});

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
