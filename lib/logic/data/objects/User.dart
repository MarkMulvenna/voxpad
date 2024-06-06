import 'TaskExtenders/Task.dart';

class User {
  final String email;
  final String password;
  final String username;
  final List<Profile>? profiles;

  User({required this.email, required this.password, required this.username, this.profiles});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      username: json['username'],
      profiles: (json['profiles'] as List).map((profileJson) => Profile.fromJson(profileJson)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'profiles': profiles != null ? profiles!.map((profile) => profile.toJson()).toList() : null,
    };
  }
}

class Profile {
  final String name;
  List<Task>? taskList;

  Profile({required this.name});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
