import "package:equatable/equatable.dart";
import "../../../../core/enums/request_type_enum.dart";





/// Entity that contains the data of the Notifications.
class NotificationsEntity extends Equatable{

 final String date;
 final String title;
 final String description;
 final NotificationTypeEnum type;

 /// Entity that contains the data of the Requests.
 const NotificationsEntity({
  required this.type,
  required this.date,
  required this.title,
  required this.description,
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