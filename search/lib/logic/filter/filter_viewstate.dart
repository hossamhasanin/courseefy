import 'package:search/logic/filter/filter_selections.dart';

class FilterViewState {
  final List<FilterSelections> selectedFilters;

  FilterViewState({required this.selectedFilters});

  factory FilterViewState.init(){
    return FilterViewState(selectedFilters: []);
  }

  FilterViewState copy({
    List<FilterSelections>? selectedFilters
  }){
    return FilterViewState(
        selectedFilters: selectedFilters ?? this.selectedFilters
    );
  }
}