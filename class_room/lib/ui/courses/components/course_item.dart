import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {

  final String image;
  final String title;
  final String description;

  const CourseItem({Key? key , required this.image , required this.description, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 135.0,
          child: Image.network(image , fit: BoxFit.fill,),
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title , style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 6.0,),
            Text(description , style: const TextStyle(
                color: Color(0xff585D69),
                fontFamily: "jakarta",
                fontSize: 14.0,
                fontWeight: FontWeight.w600
            ),)
          ],
        )
      ],
    );
  }
}
