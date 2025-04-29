import 'package:equatable/equatable.dart';

class VisitorsLogsHostsEntity  extends Equatable{

  
  final String? id;
  final String? name;

  VisitorsLogsHostsEntity({
    required this.id,
    required this.name,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props =>  [
    id,
    name,
  ];
}
