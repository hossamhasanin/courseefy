import 'package:base/base.dart';

class ViewState {
  final List<Category> categories;
  final List<Course> courses;
  final User user;
  final bool loading;

  ViewState({
    required this.categories,
    required this.courses,
    required this.user,
    required this.loading
  });

  factory ViewState.init(){
    return ViewState(
        categories: [],
        courses: [],
        user: User.empty(),
        loading: false
    );
  }

  ViewState copy({
    List<Category>? categories,
    List<Course>? courses,
    User? user,
    bool? loading
  }){
    return ViewState(
        categories: categories ?? this.categories,
        courses: courses ?? this.courses,
        user: user ?? this.user,
        loading: loading ?? this.loading
    );
  }

}