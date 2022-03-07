import 'package:base/base.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:search/logic/controller.dart';
import 'package:search/logic/filter/filter_selections.dart';
import 'package:search/logic/logic_events.dart';
import 'package:search/logic/repository.dart';
import 'package:search/logic/usecase.dart';


class SearchRepositoryTestImp extends Mock implements SearchRepository{}

void main(){
  late SearchController sut;
  late SearchRepository repo;
  final topSearches = [
    "Dart",
    "Flutter",
    "Mobile apps"
  ];
  final categories = [
    const Category(id: 1, title: "Cat 1", description: "Cat desc 1", cover: "Cat cover 1"),
    const Category(id: 1, title: "Cat 2", description: "Cat desc 2", cover: "Cat cover 2"),
    const Category(id: 1, title: "Cat 3", description: "Cat desc 3", cover: "Cat cover 3"),
    const Category(id: 1, title: "Cat 4", description: "Cat desc 4", cover: "Cat cover 4"),
  ];
  final courses = [
    Course(
        id: 1,
        title: "Course 1",
        image: "Course image 1",
        tutor: User.empty(),
        category: categories[0],
        description: "",
        rating: 0,
        level: "",
        cost: 0,
        duration: 0,
        studentNumber: 0,
        introduction: "",
        introVideoUrl: ""
    ),

    Course(
        id: 2,
        title: "Course 2",
        image: "Course image 2",
        tutor: User.empty(),
        category: categories[1],
        description: "",
        rating: 0,
        level: "",
        cost: 0,
        duration: 0,
        studentNumber: 0,
        introduction: "",
        introVideoUrl: ""
    ),
  ];
  final dataError = DataException("Error in server" , "Error");

  setUp((){
    repo = SearchRepositoryTestImp();
    sut = SearchController(repo);
  });

  void assignCategoriesCall(){
    when(()=> repo.getCategories())
        .thenAnswer((_) async => DataWithError<List<Category>>(categories, null));
  }

  void assignTopSearchesCall(){
    when(()=> repo.getTopSearches())
        .thenAnswer((_) async => DataWithError<List<String>>(topSearches, null));
  }

  group("Load the top searches and categories", (){

    test("Load the data", () async {
      assignTopSearchesCall();
      assignCategoriesCall();
      expect(sut.viewState.value.loading, false);
      final future =  sut.loadData();
      expect(sut.viewState.value.loading, true);
      await future;
      expect(sut.viewState.value.loading, false);
      expect(sut.viewState.value.categories, categories);
      expect(sut.viewState.value.topSearches, topSearches);
    });

    test("Error coming from getting the top searches" , () async {
      when(() => repo.getTopSearches())
          .thenAnswer((_) async => DataWithError<List<String>>([], dataError));
      assignCategoriesCall();
      sut.listenToLogicEvents(showErrorDialog: (error){
        expect(error, dataError.message);
      });
      await sut.loadData();
    });

    test("Error coming from getting the categories" , () async {
      when(() => repo.getCategories())
          .thenAnswer((_) async => DataWithError<List<Category>>([], dataError));
      assignTopSearchesCall();
      sut.listenToLogicEvents(showErrorDialog: (error){
        expect(error, dataError.message);
      });
      await sut.loadData();
    });

  });

  group("Search for some course", (){

    test("Search for something and getting the results" , () async {
      const searchQuery = "dart";
      when(() => repo.getSearchedCourses(searchQuery , []))
          .thenAnswer((_) async => DataWithError<List<Course>>(courses, null));
      expect(sut.viewState.value.loading, false);
      final future = sut.search(searchQuery);
      expect(sut.viewState.value.loading, true);
      await future;
      expect(sut.viewState.value.loading, false);
      expect(sut.viewState.value.searchResults, courses);
    });

    test("Apply a filter to a search query" , () async {
      const searchQuery = "dart";
      final freeCourse = Course(
          id: 2,
          title: "Free Course",
          image: "Free Course image",
          tutor: User.empty(),
          category: categories[1],
          description: "",
          rating: 0,
          level: "",
          cost: 0,
          duration: 0,
          studentNumber: 0,
          introduction: "",
          introVideoUrl: ""
      );
      when(() => repo.getSearchedCourses(searchQuery , []))
          .thenAnswer((_) async => DataWithError<List<Course>>(courses, null));
      when(() => repo.getSearchedCourses(searchQuery , [FilterSelections.freeCourses]))
          .thenAnswer((_) async => DataWithError<List<Course>>([
        freeCourse
      ], null));

      await sut.search(searchQuery);

      expect(sut.viewState.value.searchResults, courses);
      sut.setFilters([FilterSelections.freeCourses]);
      expect(sut.viewState.value.loading, false);
      final future = sut.search(searchQuery);
      expect(sut.viewState.value.loading, true);
      await future;
      expect(sut.viewState.value.loading, false);
      expect(sut.viewState.value.searchResults, [freeCourse]);
    });

    test("Error with searching for something", () async {
      const searchQuery = "dart";
      when(() => repo.getSearchedCourses(searchQuery , []))
          .thenAnswer((_) async => DataWithError<List<Course>>([], dataError));
      sut.listenToLogicEvents(showErrorDialog: (error){
        expect(error, dataError.message);
      });
      expect(sut.viewState.value.loading, false);
      final future = sut.search(searchQuery);
      expect(sut.viewState.value.loading, true);
      await future;
      expect(sut.viewState.value.loading, false);
      expect(sut.viewState.value.searchResults, []);
    });

  });

}