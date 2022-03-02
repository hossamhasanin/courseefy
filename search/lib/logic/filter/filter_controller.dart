import 'package:get/get.dart';
import 'package:search/logic/filter/filter_selections.dart';
import 'package:search/logic/filter/filter_viewstate.dart';

class FiltersController extends GetxController{
  final Rx<FilterViewState> viewState = FilterViewState.init().obs;

  selectFilter(FilterSelections filterSelection){
    List<FilterSelections> filters = List.from(viewState.value.selectedFilters);
    if (filters.contains(filterSelection)){
      filters.remove(filterSelection);
    } else {
      filters.add(filterSelection);
    }
    viewState.value = viewState.value.copy(selectedFilters: filters);
  }

  resetFilters(){
    viewState.value = viewState.value.copy(selectedFilters: []);
  }

}