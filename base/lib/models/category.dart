import 'package:base/base.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable{

  final int id;
  final String title;
  final String description;
  final String cover;

  const Category({
    required this.id,
    required this.title,
    required this.description,
    required this.cover,
  });

  factory Category.empty(){
    return const Category(
        id: -1,
        title: "",
        description: "",
        cover: "");
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    cover
  ];

}