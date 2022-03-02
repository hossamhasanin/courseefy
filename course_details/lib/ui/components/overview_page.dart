import 'package:base/base.dart';
import 'package:base/models/course_review.dart';
import 'package:base/models/user.dart';
import 'package:flutter/material.dart';

class OverViewPage extends StatelessWidget {
  OverViewPage({Key? key}) : super(key: key);

  final List<CourseReview> reviews = [
    CourseReview(const User(
        name: "hossam_hasanin",
        email: "",
        token: "",
        image: "",
        id: 0
    ), "Oh hay this is a review", DateTime.now().millisecondsSinceEpoch)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("Introduction" , style: Theme.of(context).textTheme.headline1,),
        ),
        Text("Hey I am body , Hey I am body , Hey I am body , Hey I am body ,"
            "Hey I am body , Hey I am body , Hey I am body , Hey I am body"
            "Hey I am body , Hey I am body , Hey I am body , Hey I am body"
            "Hey I am body , Hey I am body , Hey I am body , Hey I am body"
            "Hey I am body , Hey I am body , Hey I am body , Hey I am body"
            "Hey I am body , Hey I am body , Hey I am body , Hey I am body"
            "Hey I am body , Hey I am body , Hey I am body , Hey I am body"
            "Hey I am body , Hey I am body , Hey I am body , Hey I am body"
            "Hey I am body , Hey I am body , Hey I am body , Hey I am body" ,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 30.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: OutlinedButton(
              onPressed: (){},
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40.0)
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 19.5),
                child: Text("See more" , style: TextStyle(
                    color: Color(0xff265AE8),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: "jakarta"
                ),),
              )
          ),
        ),
        const SizedBox(height: 40.0,),
        Text("Feedback" ,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 23.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffFFF1F3)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0 , vertical: 24.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.star , color: Color(0xffFFA927) , size: 18.0,),
                          SizedBox(width: 6.0,),
                          Text("4.7" , style: TextStyle(
                              color: Color(0xff404653),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              fontFamily: "jakarta"
                          ))
                        ],
                      ),
                      const Text("Review" , style: TextStyle(
                          color: Color(0xff404653),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: "jakarta"
                      ))
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffFFF1F3)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0 , vertical: 24.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.person_outlined , color: Color(0xff404653) , size: 18.0,),
                          SizedBox(width: 6.0,),
                          Text("744" , style: TextStyle(
                              color: Color(0xff404653),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              fontFamily: "jakarta"
                          ))
                        ],
                      ),
                      const Text("Students" , style: TextStyle(
                          color: Color(0xff404653),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: "jakarta"
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30.0,),
        ListView.builder(
          itemCount: reviews.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_ , index){
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/person.png"),
                    radius: 44.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("@${reviews[index].user.name}" , style: Theme.of(context).textTheme.headline2,),
                      const SizedBox(height: 2.0,),
                      Text(calculateTime(reviews[index].timeStamp) , style: Theme.of(context).textTheme.caption,),
                      const SizedBox(height: 5.0,),
                      Text(reviews[index].review , style: Theme.of(context).textTheme.headline2,),
                    ],
                  )
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: OutlinedButton(
              onPressed: (){},
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40.0)
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 19.5),
                child: Text("Load more" , style: TextStyle(
                    color: Color(0xff265AE8),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: "jakarta"
                ),),
              )
          ),
        ),
      ],
    );
  }
}
