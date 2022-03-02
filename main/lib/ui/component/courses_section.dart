import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:main/ui/component/course_item.dart';

class CoursesSection extends StatelessWidget {
  
  final String title;
  final List<Course> courses;
  final Function() seeMoreAction;
  
  const CoursesSection({Key? key ,
    required this.title ,
    required this.courses,
    required this.seeMoreAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title , style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: "jakarta",
              ), maxLines: 2,),

              GestureDetector(
                onTap: (){
                  seeMoreAction();
                },
                child: const Text("See more" , style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    fontFamily: "jakarta",
                    color: Color(0xff70747E)
                ),),
              )
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CourseItem(
                  course: courses[0],
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: CourseItem(
                  course: courses[1],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
