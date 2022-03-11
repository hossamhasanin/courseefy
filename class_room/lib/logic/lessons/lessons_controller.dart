import 'package:base/base.dart';
import 'package:class_room/logic/lessons/lessons_viewstate.dart';
import 'package:class_room/logic/repository.dart';
import 'package:class_room/logic/usecase.dart';
import 'package:get/get.dart';

class LessonsController {
  late final ClassRoomUseCase _useCase;

  late Function(String error) showErrorDialog;

  int courseId = -1;

  int currentLessonsPage = 1;

  final Rx<LessonsViewState> viewState = LessonsViewState.init().obs;


  LessonsController(ClassRoomRepository repository){
    _useCase = ClassRoomUseCase(repository);
  }

  loadLessons(int courseId) async {
    this.courseId = courseId;
    viewState.value = viewState.value.copy(loading: true);
    currentLessonsPage = 1;
    var results = await _useCase.getLessons(courseId , currentLessonsPage);
    if (results[1] is DataException){
      viewState.value = viewState.value.copy(loading: false
          , error: (results[1] as DataException).code);
      return;
    }
    viewState.value = viewState.value.copy(
        lessons: results[0]
    );
  }

  loadMoreLessons() async {
    viewState.value = viewState.value.copy(loadingMore: true);
    currentLessonsPage += 1;
    var results = await _useCase.getMoreLessons(courseId , currentLessonsPage);
    if (results[1] is DataException){
      viewState.value = viewState.value.copy(loadingMore: false);
      showErrorDialog((results[1] as DataException).message);
      return;
    }
    var allLessons = viewState.value.lessons;
    List<Lesson> lessons = results[0];
    allLessons += lessons;
    viewState.value = viewState.value.copy(
        lessons: allLessons ,
        stopLoadingMore: lessons.isEmpty,
        loadingMore: false
    );
  }



}