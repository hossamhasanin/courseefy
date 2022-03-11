import 'package:base/base.dart';

class CoursesViewState {
  final List<Course> courses;
  final bool loading;
  final String error;
  final bool loadingMore;
  final bool stopLoadingMore;

  CoursesViewState({
    required this.loading,
    required this.loadingMore,
    required this.stopLoadingMore,
    required this.error,
    required this.courses});

  factory CoursesViewState.init(){
    return CoursesViewState(
        loading: false,
        loadingMore: false,
        stopLoadingMore: false,
        error: '',
        courses: []
    );
  }

  CoursesViewState copy({
    bool? loading,
    bool? loadingMore,
    String? error,
    bool? stopLoadingMore,
    List<Course>? courses
  }){
    return CoursesViewState(
        loading: loading ?? this.loading,
        stopLoadingMore: stopLoadingMore ?? this.stopLoadingMore,
        loadingMore: loadingMore ?? this.loadingMore,
        error: error ?? this.error,
        courses: courses ?? this.courses
    );
  }

}