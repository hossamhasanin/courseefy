import 'package:base/base.dart';
import 'package:class_room/logic/courses/courses_viewstate.dart';
import 'package:class_room/logic/repository.dart';
import 'package:class_room/logic/usecase.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController{
  late final ClassRoomUseCase _useCase;

  late Function(String error) showErrorDialog;

  int currentLessonsPage = 1;

  final Rx<CoursesViewState> viewState = CoursesViewState.init().obs;


  CoursesController(ClassRoomRepository repository){
    _useCase = ClassRoomUseCase(repository);
  }

  loadCourses() async {
    viewState.value = viewState.value.copy(loading: true);
    currentLessonsPage = 1;
    var results = await _useCase.getCourses();
    if (results[1] is DataException){
      viewState.value = viewState.value.copy(loading: false
          , error: (results[1] as DataException).code);
      return;
    }
    viewState.value = viewState.value.copy(
        courses: results[0]
    );
  }

  loadMoreCourses() async {
    viewState.value = viewState.value.copy(loadingMore: true);
    currentLessonsPage += 1;
    var results = await _useCase.getMoreCourses(currentLessonsPage);
    if (results[1] is DataException){
      viewState.value = viewState.value.copy(loadingMore: false);
      showErrorDialog((results[1] as DataException).message);
      return;
    }
    var allCourses = viewState.value.courses;
    List<Course> courses = results[0];
    allCourses += courses;
    viewState.value = viewState.value.copy(
        courses: allCourses ,
        stopLoadingMore: courses.isEmpty,
        loadingMore: false
    );
  }

}