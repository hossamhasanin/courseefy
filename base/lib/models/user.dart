import 'package:equatable/equatable.dart';

class User extends Equatable{

  final String name;
  final String email;
  final String token;
  final String image;
  final int id;

  const User({
    required this.name,
    required this.email,
    required this.token,
    required this.image,
    required this.id
  });

  factory User.empty(){
    return const User(
        name: "",
        email: "",
        token: "",
        image: "",
        id: 0
    );
  }

  @override
  List<Object?> get props => [
    name,
    email,
    id,
    image,
    token
  ];


}