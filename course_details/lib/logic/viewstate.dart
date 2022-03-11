import 'package:base/base.dart';

class ViewState {
  final Course course;
  final List<CourseReview> courseReviews;
  final List<Lesson> lessons;
  final bool reviewsLoading;
  final bool loadingLessons;
  final bool loadMoreReviews;
  final bool loadMoreLessons;
  final bool stopLoadingMoreReviews;
  final bool stopLoadingMoreLessons;
  final String errorReviews;
  final String errorLessons;
  final bool isEnrolledInCourse;
  final bool checkIfEnrolledInCourse;

  ViewState({
    required this.course,
    required this.courseReviews,
    required this.lessons,
    required this.reviewsLoading,
    required this.loadMoreReviews,
    required this.errorReviews,
    required this.errorLessons,
    required this.loadingLessons,
    required this.loadMoreLessons,
    required this.stopLoadingMoreReviews,
    required this.stopLoadingMoreLessons,
    required this.isEnrolledInCourse,
    required this.checkIfEnrolledInCourse
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
        stopLoadingMoreReviews: false,
        loadMoreLessons: false,
        stopLoadingMoreLessons: false,
        isEnrolledInCourse: false,
        checkIfEnrolledInCourse: false
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
    bool? loadMoreLessons,
    bool? stopLoadingMoreReviews,
    bool? stopLoadingMoreLessons,
    bool? isEnrolledInCourse,
    bool? checkIfEnrolledInCourse
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
        loadMoreLessons: loadMoreLessons ?? this.loadMoreLessons,
        stopLoadingMoreReviews: stopLoadingMoreReviews ?? this.stopLoadingMoreReviews,
        stopLoadingMoreLessons: stopLoadingMoreLessons ?? this.stopLoadingMoreLessons,
        isEnrolledInCourse: isEnrolledInCourse ?? this.isEnrolledInCourse,
        checkIfEnrolledInCourse: checkIfEnrolledInCourse ?? this.checkIfEnrolledInCourse
    );
  }
}