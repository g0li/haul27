// To parse this JSON data, do
//
//     final stravaAthleteModel = stravaAthleteModelFromMap(jsonString);

import 'dart:convert';

class StravaAthleteModel {
  StravaAthleteModel({
    this.tokenType,
    this.expiresAt,
    this.expiresIn,
    this.refreshToken,
    this.accessToken,
    this.athlete,
  });

  final String? tokenType;
  final int? expiresAt;
  final int? expiresIn;
  final String? refreshToken;
  final String? accessToken;
  final Athlete? athlete;

  factory StravaAthleteModel.fromJson(String str) =>
      StravaAthleteModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StravaAthleteModel.fromMap(Map<String, dynamic> json) =>
      StravaAthleteModel(
        tokenType: json["token_type"],
        expiresAt: json["expires_at"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
        accessToken: json["access_token"],
        athlete: Athlete.fromMap(json["athlete"]),
      );

  Map<String, dynamic> toMap() => {
        "token_type": tokenType,
        "expires_at": expiresAt,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "access_token": accessToken,
        "athlete": athlete!.toMap(),
      };
}

class Athlete {
  Athlete({
    required this.id,
    required this.username,
    required this.resourceState,
    required this.firstname,
    required this.lastname,
    required this.bio,
    required this.city,
    required this.state,
    required this.country,
    required this.sex,
    required this.premium,
    required this.summit,
    required this.createdAt,
    required this.updatedAt,
    required this.badgeTypeId,
    required this.weight,
    required this.profileMedium,
    required this.profile,
    required this.friend,
    required this.follower,
  });

  final int id;
  final String? username;
  final int resourceState;
  final String? firstname;
  final String? lastname;
  final String? bio;
  final String? city;
  final String? state;
  final String? country;
  final String? sex;
  final bool premium;
  final bool summit;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int badgeTypeId;
  final dynamic weight;
  final String profileMedium;
  final String profile;
  final dynamic friend;
  final dynamic follower;

  factory Athlete.fromJson(String str) => Athlete.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Athlete.fromMap(Map<String, dynamic> json) => Athlete(
        id: json["id"],
        username: json["username"],
        resourceState: json["resource_state"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        bio: json["bio"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        sex: json["sex"],
        premium: json["premium"],
        summit: json["summit"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        badgeTypeId: json["badge_type_id"],
        weight: json["weight"],
        profileMedium: json["profile_medium"],
        profile: json["profile"],
        friend: json["friend"],
        follower: json["follower"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "resource_state": resourceState,
        "firstname": firstname,
        "lastname": lastname,
        "bio": bio,
        "city": city,
        "state": state,
        "country": country,
        "sex": sex,
        "premium": premium,
        "summit": summit,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "badge_type_id": badgeTypeId,
        "weight": weight,
        "profile_medium": profileMedium,
        "profile": profile,
        "friend": friend,
        "follower": follower,
      };
}
