
import 'package:on_track_app/domains/entities/user.dart';
import 'package:on_track_app/domains/models/user_model.dart';

extension UserModelExt on UserModel {
  User toEntity() => User(
    id: id,
    name: name,
    email: email,
    password: password,
    devicesTokens: devicesTokens,
  );
}

extension UserExt on User {
  UserModel toModel() => UserModel(
    id: id,
    name: name,
    email: email,
    password: password,
    devicesTokens: devicesTokens,
  );
}
