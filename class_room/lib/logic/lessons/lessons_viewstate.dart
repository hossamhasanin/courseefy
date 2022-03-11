import 'package:base/base.dart';

class LessonsViewState {
  final bool loading;
  final bool loadingMore;
  final bool stopLoadingMore;
  final String error;
  final List<Lesson> lessons;

  LessonsViewState({
    required this.loading,
    required this.loadingMore,
    required this.stopLoadingMore,
    required this.error,
    required this.lessons});

  factory LessonsViewState.init(){
    return LessonsViewState(
        loading: false,
        loadingMore: false,
        stopLoadingMore: false,
        error: '',
        lessons: []
    );
  }

  LessonsViewState copy({
    bool? loading,
    bool? loadingMore,
    String? error,
    bool? stopLoadingMore,
    List<Lesson>? lessons
  }){
    return LessonsViewState(
        loading: loading ?? this.loading,
        stopLoadingMore: stopLoadingMore ?? this.stopLoadingMore,
        loadingMore: loadingMore ?? this.loadingMore,
        error: error ?? this.error,
        lessons: lessons ?? this.lessons
    );
  }

}