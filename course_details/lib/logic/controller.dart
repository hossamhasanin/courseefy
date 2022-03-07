import 'package:base/base.dart';
import 'package:course_details/logic/datasource.dart';
import 'package:course_details/logic/usecase.dart';
import 'package:course_details/logic/viewstate.dart';
import 'package:get/get.dart';

class CourseDetailsController extends GetxController {
  ViewState viewState = ViewState.init();
  late CourseDetailsUseCase _useCase;
  final RxBool displayOverViewSection = true.obs;
  int currentReviewsPage = 1;

  CourseDetailsController(CourseDetailsDataSource dataSource){
    _useCase = CourseDetailsUseCase(dataSource);
  }

  init(Course course) async {
    setCourseData(course);
    await loadReviews();
    await loadLessons();
  }

  setCourseData(Course course){
    _updateViewState(
        viewState.copy(
            course: course
        )
    );
  }

  loadReviews() async {
    _updateViewState(
        viewState.copy(reviewsLoading: true)
    );
    currentReviewsPage = 1;
    var results = await _useCase.getReviews(viewState.course.id , 1);
    if (results is DataException){
      _updateViewState(viewState.copy(
          reviewsLoading: false,
          errorReviews: results.code));
      return;
    }
    _updateViewState(viewState.copy(
        reviewsLoading: false,
        courseReviews: results,
        stopLoadingMoreReviews: (results as  List<CourseReview>).isEmpty
    ));
  }

  loadMoreReviews(Function(int) animateItemToList) async {
    _updateViewState(viewState.copy(
      loadMoreReviews: true
    ));
    currentReviewsPage += 1;
    var results = await _useCase.getReviews(viewState.course.id , currentReviewsPage);
    if (results is DataException){
      _updateViewState(viewState.copy(
          loadMoreReviews: false,
          errorReviews: results.code));
      return;
    }
    List<CourseReview> reviews = viewState.courseReviews;
    reviews.addAll(results);
    viewState = viewState.copy(
        courseReviews: reviews,
    );
    animateItemToList(results.length);
    _updateViewState(
      viewState.copy(
          stopLoadingMoreReviews: (results as  List<CourseReview>).isEmpty,
          loadMoreReviews: false,
      )
    );
  }

  loadLessons() async {
    _updateViewState(viewState.copy(loadingLessons: true));
    var results = await _useCase.getLessons(viewState.course.id);
    if (results is DataException){
      _updateViewState(viewState.copy(
          loadingLessons: false,
          errorLessons: results.code));
      return;
    }
    _updateViewState(viewState.copy(
        loadingLessons: false,
        lessons: results
    ));
  }

  _updateViewState(ViewState viewState){
    this.viewState = viewState;
    update();
  }

  swipeBetweenLessonsOverview(bool isOverView){
    displayOverViewSection.value = isOverView;
  }

}