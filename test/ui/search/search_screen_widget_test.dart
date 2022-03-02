import 'dart:io';

import 'package:base/base.dart';
import 'package:base/exceptions/data_exception.dart';
import 'package:base/models/category.dart';
import 'package:base/models/data_with_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:main/ui/component/search_box.dart';
import 'package:mock_image/mock_image.dart';
import 'package:mocktail/mocktail.dart';
import 'package:search/logic/controller.dart';
import 'package:search/logic/repository.dart';
import 'package:search/ui/search_screen.dart';
import 'package:search/ui/components/top_searches_and_categories.dart';

class SearchRepositoryTestImp extends Mock implements SearchRepository{}

void main(){
  late SearchController controller;
  late SearchRepository repository;
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
  final dataError = DataException("Error in server" , "Error");
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
        duration: 0
    ),

    Course(
        id: 2,
        title: "Course 2",
        image: "Course image 2",
        tutor: User.empty(),
        category: categories[1],
        description: "",
        rating: 0,
        cost:0,
        level: "",
        duration: 0
    ),
  ];
  const searchQuery = "Dart";

  void assignCategoriesCall(){
    when(()=> repository.getCategories())
        .thenAnswer((_) async => DataWithError<List<Category>>(categories, null));
  }

  void assignTopSearchesCall(){
    when(()=> repository.getTopSearches())
        .thenAnswer((_) async => DataWithError<List<String>>(topSearches, null));
  }
  
  Future buildTheScreen(WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SearchScreen(),
    ));
  }

  setUp((){
    repository = SearchRepositoryTestImp();
    controller = SearchController(repository);
    Get.put<SearchRepository>(repository);
    Get.put(controller);

  });

  testWidgets("Load the data", (tester) async {
    assignTopSearchesCall();
    assignCategoriesCall();

    provideMockedNetworkImages(() async {
      await buildTheScreen(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump();
      expect(find.text(topSearches[0]), findsOneWidget);
      expect(find.text(categories[0].title), findsOneWidget);
    });
  });

  testWidgets("Show error dialog when there is an error", (tester) async {
    when(() => repository.getTopSearches())
        .thenAnswer((_) async => DataWithError<List<String>>([], dataError));
    assignCategoriesCall();
    provideMockedNetworkImages(() async {
      await buildTheScreen(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text(dataError.message), findsOneWidget);
    });
  });
  
  testWidgets("Search for courses , and cancel the search by deleting search query", (tester) async {
    when(() => repository.getSearchedCourses(searchQuery , []))
        .thenAnswer((_) async => DataWithError<List<Course>>(courses, null));
    assignCategoriesCall();
    assignTopSearchesCall();
    provideMockedNetworkImages(() async {
      await buildTheScreen(tester);
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), searchQuery);
      await tester.tap(find.byKey(const ValueKey("searchButton")));
      await tester.pumpAndSettle();
      expect(find.text(courses[0].title) , findsOneWidget);
      expect(find.byType(TopSearchesAndCategories) , findsNothing);
      await tester.enterText(find.byType(TextField), "");
      await tester.pump();
      expect(find.text(courses[0].title) , findsNothing);
      expect(find.byType(TopSearchesAndCategories) , findsOneWidget);
    });
  });

}