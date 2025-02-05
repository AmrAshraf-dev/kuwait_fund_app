import 'package:equatable/equatable.dart';

class FamilyMemberEntity extends Equatable {
  final String? id;
  final String? name;
  final String? englishName;
  final String? dateOfBirth;

  final String? gender;

  final String? relativeInd;
  final bool? isSubscribed;

  const FamilyMemberEntity({
    required this.id,
    required this.name,
    required this.englishName,
    required this.dateOfBirth,
    required this.gender,
    required this.relativeInd,
    required this.isSubscribed,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        englishName,
        dateOfBirth,
      ];
}
