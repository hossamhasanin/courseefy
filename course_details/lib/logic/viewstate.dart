import 'package:base/base.dart';

class ViewState {
  final Course course;
  final List<CourseReview> courseReviews;
  final List<Lesson> lessons;
  final bool reviewsLoading;
  final bool loadingLessons;
  final bool loadMoreReviews;
  final bool stopLoadingMoreReviews;
  final String errorReviews;
  final String errorLessons;

  ViewState({
    required this.course,
    required this.courseReviews,
    required this.lessons,
    required this.reviewsLoading,
    required this.loadMoreReviews,
    required this.errorReviews,
    required this.errorLessons,
    required this.loadingLessons,
    required this.stopLoadingMoreReviews
  });

  factory ViewState.init(){
    return ViewState(
        course: Course.empty(),
        courseReviews: [],
        lessons: [],
        reviewsLoading: false,
        loadingLessons: false,
        loadMoreReviews: false,
        errorLessons: "",
        errorReviews: "",
        stopLoadingMoreReviews: false
    );
  }

  ViewState copy({
    Course? course,
    List<CourseReview>? courseReviews,
    List<Lesson>? lessons,
    bool? reviewsLoading,
    bool? loadingLessons,
    String? errorReviews,
    String? errorLessons,
    bool? loadMoreReviews,
    bool? stopLoadingMoreReviews
  }){
    return ViewState(
        course: course ?? this.course,
        courseReviews: courseReviews ?? this.courseReviews,
        lessons: lessons ?? this.lessons,
        reviewsLoading: reviewsLoading ?? this.reviewsLoading,
        loadingLessons: loadingLessons ?? this.loadingLessons,
        loadMoreReviews: loadMoreReviews ?? this.loadMoreReviews,
        errorLessons: errorLessons ?? this.errorLessons,
        errorReviews: errorReviews ?? this.errorReviews,
        stopLoadingMoreReviews: stopLoadingMoreReviews ?? this.stopLoadingMoreReviews
    );
  }
}