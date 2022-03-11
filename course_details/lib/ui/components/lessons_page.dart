import 'package:base/base.dart';
import 'package:course_details/logic/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonsPage extends StatelessWidget {

  final CourseDetailsController _controller = Get.find();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  LessonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseDetailsController>(
      builder: (_) {
        var viewState = _controller.viewState;

        if (viewState.loadingLessons){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (viewState.lessons.isEmpty){
          return Container(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Text("Looks like there is no lessons yet.",
                style: Theme.of(context).textTheme.headlineMedium,),
            ),
          );
        }

        return ListView.builder(
          itemCount: viewState.lessons.length+1,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          key: _listKey,
          itemBuilder: (_ , index){

            if (viewState.lessons.length == index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: OutlinedButton(
                    onPressed: _controller.viewState.stopLoadingMoreLessons
                        || _controller.viewState.loadMoreLessons
                        || _controller.viewState.loadingLessons ? null : () async {
                      var l = _controller.viewState.lessons.length -1;
                      await _controller.loadMoreLessons((addedItems) {
                        for (int offset = 0; offset < addedItems; offset++) {
                          _listKey.currentState!.insertItem(l + offset);
                        }
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 19.5),
                      child: _controller.viewState.loadMoreLessons ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Load more" , style: TextStyle(
                              color: Color(0xff265AE8),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: "jakarta"
                          ),),
                          SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator())
                        ],
                      ) : const Text("Load more" , style: TextStyle(
                          color: Color(0xff265AE8),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: "jakarta"
                      ),),
                    )
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 135.0,
                        child: Image.network(viewState.lessons[index].thumpNail , fit: BoxFit.fill,),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(viewState.lessons[index].title , style: Theme.of(context).textTheme.headlineMedium,),
                          const SizedBox(height: 6.0,),
                          Text("Lesson ${index + 1}" , style: const TextStyle(
                            color: Color(0xff585D69),
                            fontFamily: "jakarta",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600
                          ),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      }
    );
  }
}
