import 'package:base/base.dart';
import 'package:main/logic/logic_events.dart';
import 'package:main/logic/repository.dart';
import 'package:main/logic/viewstate.dart';

class MainUseCase {
  final MainRepository _repository;

  MainUseCase(this._repository);

  Future<dynamic> getCategories(ViewState viewState) async {
    var result = await _repository.getCategories();

    return [result.data ,
      result.error != null ?
      ShowErrorDialog((result.error! as DataException).code) : null];
  }

  Future<dynamic> getCourses(ViewState viewState) async {
    var result = await _repository.getCourses();

    return [result.data ,
      result.error != null ?
      ShowErrorDialog((result.error! as DataException).code) : null];
  }


  Future<User?> getUsers(ViewState viewState) async {
    var result = await _repository.getUser();

    return result;
  }

}