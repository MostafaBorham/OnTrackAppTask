import 'package:on_track_app/core/constants/app_keys.dart';
import 'package:on_track_app/core/constants/app_keys.dart';
import 'package:on_track_app/domains/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    super.name,
    super.email,
    super.password,
    super.devicesTokens,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json[AppKeys.idKey],
    name: json[AppKeys.nameKey],
    email: json[AppKeys.emailKey],
    password: json[AppKeys.passwordKey],
    devicesTokens: json[AppKeys.devicesTokensKey].map<String>((token) => token.toString(),).toList(),
  );

  Map<String,dynamic> toJson()=>{
    AppKeys.idKey : id,
    AppKeys.nameKey : name,
    AppKeys.emailKey : email,
    AppKeys.passwordKey : password,
    AppKeys.devicesTokensKey : devicesTokens,
  };
}
