import 'package:base/base.dart';

class ViewState {
  final List<String> topSearches;
  final List<Category> categories;
  final bool loading;
  final List<Course> searchResults;
  final bool showSearchedCoursesSection;


  ViewState({
    required this.topSearches,
    required this.categories,
    required this.loading,
    required this.searchResults,
    required this.showSearchedCoursesSection
  });

  factory ViewState.init(){
    return ViewState(
        topSearches: [],
        categories: [],
        loading: false,
        searchResults: [],
        showSearchedCoursesSection: false
    );
  }

  ViewState copy({
    List<String>? topSearches,
    List<Category>? categories,
    bool? loading,
    List<Course>? searchResults,
    bool? showSearchedCoursesSection
  }){
    return ViewState(
        topSearches: topSearches ?? this.topSearches,
        categories: categories ?? this.categories,
        loading: loading ?? this.loading,
        searchResults: searchResults ?? this.searchResults,
        showSearchedCoursesSection: showSearchedCoursesSection ?? this.showSearchedCoursesSection
    );
  }
}