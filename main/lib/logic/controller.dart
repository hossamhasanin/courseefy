import 'dart:async';

import 'package:base/base.dart';
import 'package:get/get.dart';
import 'package:main/logic/cache_datasource.dart';
import 'package:main/logic/logic_events.dart';
import 'package:main/logic/network_datasource.dart';
import 'package:main/logic/repository.dart';
import 'package:main/logic/usecase.dart';
import 'package:main/logic/viewstate.dart';

class MainController extends GetxController{

  late final MainUseCase _useCase;
  final StreamController<LogicEvents> _logicEventsController = StreamController();
  StreamSubscription<LogicEvents>? _listenToLogicEvent;
  final Rx<ViewState> viewState = ViewState.init().obs;
  bool _isListenedTo = false;

  MainController(MainRepository repository){
    _useCase = MainUseCase(repository);
  }

  listenToLogicEvents({
    required Function(String) showErrorDialog
  }){
    if (_isListenedTo){
      return;
    }
    _isListenedTo = true;
    _listenToLogicEvent = _logicEventsController.stream.listen((event) {
      if (event is ShowErrorDialog){
        showErrorDialog(event.error);
      }
    });
  }

  loadData() async {
    viewState.value = viewState.value.copy(loading: true);
    await Future.wait([
      _getCategories(),
      _getCurrentUser(),
      _getCourses()
    ]);
    viewState.value = viewState.value.copy(loading: false);
  }

  Future _getCategories() async {
    var result = await _useCase.getCategories(viewState.value);

    var cats = result[0];
    var errorDialog = result[1];

    if (errorDialog != null){
      _logicEventsController.add(errorDialog);
    }

    viewState.value = viewState.value.copy(categories: cats);
  }

  Future _getCourses() async {
    var result = await _useCase.getCourses(viewState.value);

    var courses = result[0];
    var errorDialog = result[1];

    if (errorDialog != null){
      _logicEventsController.add(errorDialog);
    }

    viewState.value = viewState.value.copy(courses: courses);
  }

  Future _getCurrentUser() async {
    var user = await _useCase.getUsers(viewState.value);
    viewState.value = viewState.value.copy(user: user ?? User.empty());
  }

  @override
  void onClose() {
    viewState.close();
    _logicEventsController.close();
    _listenToLogicEvent?.cancel();
    super.onClose();
  }

}