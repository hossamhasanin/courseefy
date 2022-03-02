import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:search/ui/components/course_item.dart';

class CoursesList extends StatelessWidget {

  final List<Course> courses;

  const CoursesList({Key? key , required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: courses.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_ , index){
          return CourseItem(course: courses[index]);
        }
    );
  }
}
