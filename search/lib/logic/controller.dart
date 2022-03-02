import 'dart:async';

import 'package:base/base.dart';
import 'package:get/get.dart';
import 'package:search/logic/logic_events.dart';
import 'package:search/logic/repository.dart';
import 'package:search/logic/usecase.dart';
import 'package:search/logic/viewstate.dart';

import 'filter/filter_selections.dart';

class SearchController extends GetxController {
  late final SearchUseCase _useCase;
  final Rx<ViewState> viewState = ViewState.init().obs;
  final StreamController<LogicEvents> _logicEventController = StreamController();
  StreamSubscription<LogicEvents>? _logicEventsListener;
  bool _isEventsListenedTo = false;
  String searchQuery = "";
  List<FilterSelections> _filters = [];

  SearchController(SearchRepository repository){
    _useCase = SearchUseCase(repository);
  }

  listenToLogicEvents({
    required Function(String) showErrorDialog
  }){
    if (_isEventsListenedTo){
      return;
    }
    _isEventsListenedTo = true;
    _logicEventsListener = _logicEventController.stream.listen((event) {
      if (event is ShowErrorDialog){
        showErrorDialog(event.error);
      }
    });
  }

  loadData() async {
    viewState.value = viewState.value.copy(loading: true);
    await Future.wait([
      _getTopSearches(),
      _getCategories()
    ]);
    viewState.value = viewState.value.copy(loading: false);
  }

  Future _getTopSearches() async {
    var result = await _useCase.getTopSearches();
    viewState.value = viewState.value.copy(topSearches: result[0]);
    if (result[1] != null){
      _logicEventController.add(ShowErrorDialog((result[1] as DataException).message));
    }
  }

  Future _getCategories() async {
    var result = await _useCase.getCategories();
    viewState.value = viewState.value.copy(categories: result[0]);
    if (result[1] != null){
      _logicEventController.add(ShowErrorDialog((result[1] as DataException).message));
    }
  }
  
  Future search(String query) async {
    if (query.isNotEmpty){
      searchQuery = query;
    }
    if (searchQuery.isEmpty){
      return;
    }
    viewState.value = viewState.value.copy(showSearchedCoursesSection: true , loading: true);
    var results = await _useCase.searchForCourses(searchQuery , _filters);

    viewState.value = viewState.value.copy(searchResults: results[0] , loading: false);
    if (results[1] != null){
      _logicEventController.add(ShowErrorDialog((results[1] as DataException).message));
    }
  }

  setFilters(List<FilterSelections> filters){
    _filters = filters;
  }

  Future cancelSearch() async {
    searchQuery = "";
    _filters = [];
    viewState.value = viewState.value.copy(searchResults: [] , showSearchedCoursesSection: false);
  }

  @override
  void onClose() {
    _logicEventsListener?.cancel();
    super.onClose();
  }

}