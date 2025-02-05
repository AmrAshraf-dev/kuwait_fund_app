import 'package:equatable/equatable.dart';

class SubscriberEntity extends Equatable {
  final String? name;
  final String? relation;
  final String? dateOfBirth;

  const SubscriberEntity({
    required this.name,
    required this.relation,
    required this.dateOfBirth,
  });

  @override
  List<Object?> get props => [name, relation, dateOfBirth];
}
