 import "package:equatable/equatable.dart";





/// Entity that contains the data of the More.
class AdsEntity extends Equatable{

 final  int id;
 final  String date;
 final  String? title;
 final  String? subTitle;
 final  String description;
 final  String imageUrl;
  /// Entity that contains the data of the More.
   AdsEntity(
    {
      required this.id,
      required this.date,
      this.title,
      this.subTitle,
      required this.description,
      required this.imageUrl,
}
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