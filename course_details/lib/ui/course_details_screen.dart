
import 'package:course_details/ui/components/body.dart';
import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Details" , style: TextStyle(
          color: Color(0xff0B121F),
          fontFamily: "jakarta",
          fontSize: 22.0,
          fontWeight: FontWeight.w600
        ),),
        leading: IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.arrow_back_ios , color: Color(0xff0B121F),),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.favorite_border , color: Color(0xff0B121F),))
        ],
      ),
      body: const Body(),
    );
  }
}
