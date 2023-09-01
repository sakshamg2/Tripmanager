// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  Token token;
  User user;
  String msg;

  LoginResponse({
    required this.token,
    required this.user,
    required this.msg,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: Token.fromJson(json["token"]),
        user: User.fromJson(json["user"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "token": token.toJson(),
        "user": user.toJson(),
        "msg": msg,
      };
}

class Token {
  String refresh;
  String access;

  Token({
    required this.refresh,
    required this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}

class User {
  int id;
  String username;
  String email;

  User({
    required this.id,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
      };
}
