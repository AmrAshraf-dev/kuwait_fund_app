import 'package:equatable/equatable.dart';
import '../../data/models/response/token_info_model.dart';
import '../../data/models/response/user_info_model.dart';

class AuthEntity extends Equatable {
  final TokenInfoModel tokenInfo;
  final UserInfoModel userInfo;

  const AuthEntity({
    required this.tokenInfo,
    required this.userInfo,
  });

  @override
  List<Object> get props => [tokenInfo, userInfo];
}

class TokenInfo {
  final String token;
  final DateTime expireDate;

  TokenInfo({
    required this.token,
    required this.expireDate,
  });
}

class UserInfo {
  final bool isError;
  final String errorMsg;
  final bool isValidUser;
  final bool isDirector;
  final bool isSupervisor;
  final bool isTrainingSupervisor;
  final String name;
  final String designation;
  final String phoneNumber;
  final String photoURL;

  UserInfo({
    required this.isError,
    required this.errorMsg,
    required this.isValidUser,
    required this.isDirector,
    required this.isSupervisor,
    required this.isTrainingSupervisor,
    required this.name,
    required this.designation,
    required this.phoneNumber,
    required this.photoURL,
  });
}
