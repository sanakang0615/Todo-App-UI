import 'dart:collection';

class Post {
  final int statusCode;
  final String responseMessage;
  final String data;

  Post({this.statusCode, this.responseMessage, this.data});

  // factory 생성자. Post 타입의 인스턴스를 반환
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        statusCode: json['statusCode'],
        responseMessage: json['responseMessage'],
        data: json['data']);
  }
}

class newMember {
  final int statusCode;
  final String responseMessage;
  final String data;

  newMember({this.statusCode, this.responseMessage, this.data});

  factory newMember.fromJson(Map<String, dynamic> json) {
    return newMember(
        statusCode: json['statusCode'],
        responseMessage: json['responseMessage'],
        data: json['data']
    );
  }
}

class UserInfo {
  final int statusCode;
  final String responseMessage;
  final Map<String, dynamic> data;

  UserInfo({this.statusCode, this.responseMessage, this.data});
  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
        statusCode: json['statusCode'],
        responseMessage: json['responseMessage'],
        data: json['data']
    );
  }
}

class UserInfoData {
  final String email;
  final String name;
  final List<dynamic> organizations;
  final List<dynamic> followers;
  final List<dynamic> follows;


  UserInfoData({this.email, this.name, this.organizations, this.followers, this.follows});
  factory UserInfoData.fromJson(Map<String, dynamic> json) {
    return UserInfoData(
        email: json['email'],
        name: json['name'],
        organizations: json['organizations'],
        followers: json['followers'],
        follows: json['follows']
    );
  }
}

class Auth {
  final int statusCode;
  final String responseMessage;
  final Map<String, dynamic> data;

  Auth({this.statusCode, this.responseMessage, this.data});

  // factory 생성자. Post 타입의 인스턴스를 반환
  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
        statusCode: json['statusCode'],
        responseMessage: json['responseMessage'],
        data: json['data']);
  }
}

class AuthData {
  final String grantType;
  final String accessToken;
  final String refreshToken;
  final int refreshTokenExpirationTime;

  AuthData({this.grantType, this.accessToken, this.refreshToken, this.refreshTokenExpirationTime});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
        grantType: json['grantType'],
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
        refreshTokenExpirationTime: json['refreshTokenExpirationTime']
    );
  }
}