 import "package:equatable/equatable.dart";





/// Entity that contains the data of the More.
class MoreEntity  {

 final String? menuTitleEn;

 final  String? menuTitleAr;

 final String? iconUrl;

 final String? navigationKey;

 final List<String> children;
  /// Entity that contains the data of the More.
   MoreEntity(
    {required this.menuTitleEn, required this.menuTitleAr , required this.iconUrl , required this.children , required this.navigationKey}
   );

 

}