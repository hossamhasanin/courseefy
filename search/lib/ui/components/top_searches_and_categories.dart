import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search/logic/controller.dart';
import 'package:shared_ui/category_item.dart';

class TopSearchesAndCategories extends StatelessWidget {
  final SearchController _controller = Get.find();
  TopSearchesAndCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          const SizedBox(height: 30.0,),
          const Text("Top Searches" , style: TextStyle(
              fontFamily: "jakarta",
              color: Color(0xff585D69),
              fontSize: 15.0
          ),),
          const SizedBox(height: 28.0,),
          Obx((){
            var viewstate = _controller.viewState.value;
            if (viewstate.loading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Wrap(
                spacing: 10.0,
                children: viewstate.topSearches.map((search) => Chip(label:
                Text(search , style: const TextStyle(
                    color: Color(0xff282F3E),
                    fontSize: 15.0,
                    fontFamily: "jakarta",
                    fontWeight: FontWeight.w500
                ),),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                ),).toList()
            );
          }),
          const SizedBox(height: 40.0,),
          const Text("Categories" , style: TextStyle(
              fontFamily: "jakarta",
              color: Color(0xff585D69),
              fontSize: 15.0
          ),),
          Obx((){
            var viewstate = _controller.viewState.value;

            if (viewstate.loading){
              return Container();
            }

            if (viewstate.categories.isEmpty){
              return const Center(
                child: Text("There is no categories"),
              );
            }

            return Flexible(
              fit: FlexFit.loose,
              child: GridView.builder(
                  itemCount: viewstate.categories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                      mainAxisExtent: 140.0
                  ),
                  itemBuilder: (_ , index){
                    return CategoryItem(category: viewstate.categories[index]);
                  }
              ),
            );
          }),
        ]);
  }
}
