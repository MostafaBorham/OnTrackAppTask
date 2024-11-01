import 'package:equatable/equatable.dart';

class User extends Equatable {
  String? id;
  String? name;
  String? email;
  String? password;
  List<String>? devicesTokens;

  User({
    this.id,
    this.name,
    this.email,
    this.devicesTokens,
    this.password,
  });

  User copyWith({
    String? newId,
    String? newName,
    String? newEmail,
    String? newPassword,
    List<String>? newDevicesTokens,
  }) =>
      User(
        id: newId ?? id,
        name: newName ?? name,
        email: newEmail ?? email,
        password: newPassword ?? password,
        devicesTokens: newDevicesTokens ?? devicesTokens,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        devicesTokens,
      ];
}
