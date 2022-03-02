import 'package:base/base.dart';
import 'package:flutter/material.dart';

class LessonsPage extends StatelessWidget {
  final List<Lesson> lessons;
  const LessonsPage({Key? key , required this.lessons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (_ , index){
        return Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 30.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 135.0,
                    child: Image.asset("assets/images/course1.png" , fit: BoxFit.fill,),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(lessons[index].title , style: Theme.of(context).textTheme.headline1,),
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
}
