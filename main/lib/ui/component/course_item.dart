import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/utilities/display_rating_stars.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  const CourseItem({Key? key , required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140.0,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(course.image ,)
                      )
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                      color: const Color(0xffC4C4C4).withOpacity(0.15)
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 4.0 , bottom: 4.0 , left: 15.0 , right: 15.0),
                  margin: const EdgeInsets.only(top: 10.0 , left: 10.0),
                  decoration: const BoxDecoration(
                      color: Color(0xffFD853A),
                      borderRadius: BorderRadius.all(Radius.circular(4.0))
                  ),
                  child: const Text("Hot" , style: TextStyle(
                      color: Colors.white,
                      fontFamily: "jakarta",
                      fontWeight: FontWeight.w700,
                      fontSize: 12.0
                  ),),
                )
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Text(course.title , style: const TextStyle(
              fontFamily: "jakarta",
              fontWeight: FontWeight.w700,
              fontSize: 15.0
          ),),
          const SizedBox(height: 8.0,),
          Text(course.tutor.name , style: const TextStyle(
              fontFamily: "jakarta",
              fontWeight: FontWeight.w100,
              fontSize: 12.0,
              color: Color(0xff585D69)
          ),),
          const SizedBox(height: 8.0,),
          Row(
            children: [
              Text(course.rating.toString() , style: const TextStyle(
                  fontFamily: "jakarta",
                  fontWeight: FontWeight.w100,
                  fontSize: 11.0,
                  color: Color(0xff888C94)
              ),),
              const SizedBox(width: 6.0,),
              Row(
                children: displayRatingStars(course.rating),
              ),
              const SizedBox(width: 29.0,),
              const Text("(1000)" , style: TextStyle(
                  fontFamily: "jakarta",
                  fontWeight: FontWeight.w100,
                  fontSize: 11.0,
                  color: Color(0xff888C94)
              ),),
            ],
          )
        ],
      ),
    );
  }
}
