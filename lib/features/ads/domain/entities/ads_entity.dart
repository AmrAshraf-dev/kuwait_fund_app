import "package:equatable/equatable.dart";

/// Entity that contains the data of the More.
class AdsEntity extends Equatable {
  final int? id;
  final int? sortOrder;
  final String? title;
  final String? body;
  final String? moreLink;
  final String? externalImage;
  final String? templateImageUrl;
  final String? expiresOn;
  final String? createdOn;

  /// Entity that contains the data of the More.
  const AdsEntity({
    required this.id,
    required this.sortOrder,
    required this.title,
    required this.body,
    required this.moreLink,
    required this.externalImage,
    required this.templateImageUrl,
    required this.expiresOn,
    required this.createdOn,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        /*
  List your entity attributes here 
  */
        id,
      ];
}
