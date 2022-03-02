import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search/logic/controller.dart';
import 'package:search/logic/filter/filter_controller.dart';
import 'package:search/logic/filter/filter_selections.dart';
import 'package:search/logic/viewstate.dart';
import 'package:search/ui/components/courses_list.dart';
import 'package:search/ui/components/search_box.dart';
import 'package:search/ui/components/top_searches_and_categories.dart';
import 'package:search/ui/filter_screen/filter_screen.dart';
import 'package:shared_ui/category_item.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final SearchController _controller = Get.put(SearchController(Get.find()));
  final FiltersController _filtersController = Get.put(FiltersController());
  BuildContext? dialogContext;


  @override
  void initState() {
    super.initState();

    _controller.loadData();
    _controller.listenToLogicEvents(showErrorDialog: (error){
      if (dialogContext != null){
        Navigator.pop(dialogContext!);
      } else {
        dialogContext = context;
      }
      showDialog(context: dialogContext!, builder: (_){
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: SizedBox(
            height: 200.0,
            width: 300.0,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text(error ,
                    style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 18.0)),
              ),
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 74.0,),
          SearchBox(
            cancelSearch: (){
              _controller.cancelSearch();
              _filtersController.resetFilters();
            },
            search: (search){
              _filtersController.resetFilters();
              _controller.setFilters([]);
              _controller.search(search);
            },
          ),

          Expanded(
            child: RefreshIndicator(
              onRefresh: ()async{

              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx((){
                      var viewstate = _controller.viewState.value;

                      if (viewstate.showSearchedCoursesSection){
                        return showSearchResults();
                      } else {
                        return TopSearchesAndCategories();
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 30.0,),
        ],
      ),
    );
  }


  Widget showSearchResults(){
    var viewState = _controller.viewState.value;
    if (viewState.loading){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (viewState.searchResults.isEmpty){
      return const Center(
        child: Text("No thing found"),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Your search results" , style: TextStyle(
              color: Color(0xff585D69),
              fontSize: 16,
              fontWeight: FontWeight.w300,
              fontFamily: "jakarta"
            ),),
            IconButton(
                onPressed: () async {
                  List<FilterSelections>? filters = await Get.to(const FilterScreen());
                  if (filters != null){
                    _controller.setFilters(filters);
                    _controller.search("");
                  }
                },
                icon: const Icon(Icons.filter)
            )
          ],
        ),
        Container(
          color: Colors.red,
            height: double.maxFinite,
            child: CoursesList(courses: viewState.searchResults)),
      ],
    );
  }


}
