import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_ui/star_active.dart';
import 'package:shared_ui/utilities/display_rating_stars.dart';

class CourseItem extends StatelessWidget {

  final Course course;

  const CourseItem({Key? key , required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(COURSE_DETAILS , arguments: course);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        height: 120.0,
        child: Row(
          children: [
            Container(
              width: 120.0,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(course.image ,)
                  )
              ),
            ),
            const SizedBox(width: 12.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.title , style: const TextStyle(
                  fontFamily: "jakarta",
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
                  color: Color(0xff282F3E)
                ),),
                const SizedBox(height: 6.0,),
                Text(course.tutor.name , style: const TextStyle(
                    fontFamily: "jakarta",
                    fontWeight: FontWeight.w100,
                    fontSize: 13.0,
                    color: Color(0xff282F3E)
                ),),
                const SizedBox(height: 6.0,),
                Row(
                  children: [
                    const StarActive(),
                    const SizedBox(width: 5.0,),
                    Text(course.rating.toString() , style: const TextStyle(
                        fontFamily: "jakarta",
                        fontWeight: FontWeight.w100,
                        fontSize: 11.0,
                        color: Color(0xff888C94)
                    ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
