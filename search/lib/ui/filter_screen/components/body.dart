
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search/logic/filter/filter_controller.dart';
import 'package:search/logic/filter/filter_selections.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final FiltersController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx((){
          var viewState = _controller.viewState.value;
            return Column(
              children: [
                const Text("Filter by" , style: TextStyle(
                  color: Color(0xff282F3E),
                  fontFamily: "jakarta",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 20.0,),
                CheckboxListTile(
                    value: viewState.selectedFilters.contains(FilterSelections.freeCourses),
                    title: const Text("Free classes" , style: TextStyle(
                      color:Color(0xff404653),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      fontFamily: "jakarta"
                    ),),
                    onChanged: (value){
                      if (value != null){
                        _controller.selectFilter(FilterSelections.freeCourses);
                      }
                    }
                ),
                CheckboxListTile(
                    value: viewState.selectedFilters.contains(FilterSelections.premiumCourses),
                    title: const Text("Premium classes" , style: TextStyle(
                        color:Color(0xff404653),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: "jakarta"
                    ),),
                    onChanged: (value){
                      if (value != null){
                        _controller.selectFilter(FilterSelections.premiumCourses);
                      }
                    }
                ),
                const SizedBox(height: 30.0,),
                const Text("Level" , style: TextStyle(
                    color: Color(0xff282F3E),
                    fontFamily: "jakarta",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 20.0,),
                CheckboxListTile(
                    value: viewState.selectedFilters.contains(FilterSelections.beginner),
                    title: const Text("Beginner" , style: TextStyle(
                        color:Color(0xff404653),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: "jakarta"
                    ),),
                    onChanged: (value){
                      if (value != null){
                        _controller.selectFilter(FilterSelections.beginner);
                      }
                    }
                ),
                CheckboxListTile(
                    value: viewState.selectedFilters.contains(FilterSelections.intermediate),
                    title: const Text("Intermediate" , style: TextStyle(
                        color:Color(0xff404653),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: "jakarta"
                    ),),
                    onChanged: (value){
                      if (value != null){
                        _controller.selectFilter(FilterSelections.intermediate);
                      }
                    }
                ),
                CheckboxListTile(
                    value: viewState.selectedFilters.contains(FilterSelections.advanced),
                    title: const Text("Advanced" , style: TextStyle(
                        color:Color(0xff404653),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: "jakarta"
                    ),),
                    onChanged: (value){
                      if (value != null){
                        _controller.selectFilter(FilterSelections.advanced);
                      }
                    }
                ),
                const SizedBox(height: 30.0,),
                const Text("Duration" , style: TextStyle(
                    color: Color(0xff282F3E),
                    fontFamily: "jakarta",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 20.0,),
                CheckboxListTile(
                    value: viewState.selectedFilters.contains(FilterSelections.zeroToOneHours),
                    title: const Text("0-1 Hours" , style: TextStyle(
                        color:Color(0xff404653),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: "jakarta"
                    ),),
                    onChanged: (value){
                      if (value != null){
                        _controller.selectFilter(FilterSelections.zeroToOneHours);
                      }
                    }
                ),
                CheckboxListTile(
                    value: viewState.selectedFilters.contains(FilterSelections.oneToThreeHours),
                    title: const Text("1-3 Hours" , style: TextStyle(
                        color:Color(0xff404653),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: "jakarta"
                    ),),
                    onChanged: (value){
                      if (value != null){
                        _controller.selectFilter(FilterSelections.oneToThreeHours);
                      }
                    }
                ),
                CheckboxListTile(
                    value: viewState.selectedFilters.contains(FilterSelections.moreThanThreeHours),
                    title: const Text("3+ Hours" , style: TextStyle(
                        color:Color(0xff404653),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: "jakarta"
                    ),),
                    onChanged: (value){
                      if (value != null){
                        _controller.selectFilter(FilterSelections.moreThanThreeHours);
                      }
                    }
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          _controller.resetFilters();
                          Get.back(result: _controller.viewState.value.selectedFilters);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          )
                        ),
                        child: const Text("Reset" , style: TextStyle(
                            color: Color(0xffF04438),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "jakarta"
                        ),)
                    ),

                    ElevatedButton(
                        onPressed: (){
                          Get.back(result: _controller.viewState.value.selectedFilters);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff265AE8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          )
                        ),
                        child: const Text("Apply" , style: TextStyle(
                            color:Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "jakarta"
                        ),)
                    ),
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
