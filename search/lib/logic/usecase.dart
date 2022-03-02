import 'package:base/base.dart';
import 'package:search/logic/repository.dart';

import 'filter/filter_selections.dart';

class SearchUseCase {
  final SearchRepository _repository;

  SearchUseCase(this._repository);

  Future<dynamic> getCategories() async {
    var result = await _repository.getCategories();

    return [
      result.data,
      result.error != null ? result.error as DataException : null
    ];
  }

  Future<dynamic> getTopSearches() async {
    var result = await _repository.getTopSearches();

    return [
      result.data,
      result.error != null ? result.error as DataException : null
    ];
  }

  Future<dynamic> searchForCourses(String searchQuery , List<FilterSelections> filters) async{
    var result = await _repository.getSearchedCourses(searchQuery , filters);

    return [
      result.data,
      result.error != null ? result.error as DataException : null
    ];
  }


}