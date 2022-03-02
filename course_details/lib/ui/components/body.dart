

import 'package:base/base.dart';
import 'package:chewie/chewie.dart';
import 'package:course_details/ui/components/page_selection_body.dart';
import 'package:course_details/ui/components/page_selection_header.dart';
import 'package:flutter/material.dart';
import 'package:mp4_player/ui/player.dart';
import 'package:video_player/video_player.dart';
import 'package:base/base.dart';
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BdyState createState() => _BdyState();
}

class _BdyState extends State<Body> {
  late final VideoPlayerController _videoPlayerController;
  late final ChewieController _chewieController;
  late final PageController _pageController;


  @override
  void initState() {

    _videoPlayerController = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    _videoPlayerController.initialize();

    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController
    );
    _pageController = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 200.0,
            child: Chewie(controller: _chewieController)),
        const SizedBox(height: 20.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0 , horizontal: 15.0),
            decoration: const BoxDecoration(
              color: Color(0xffFD853A),
            ),
            child: const Text("HOT" , style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: "jakarta"
            ),),
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
              SizedBox(width: 10.0,),
              Text("Hossam Hassanin" , style:  TextStyle(
                color: Color(0xff404653),
                fontSize: 16.0,
                fontFamily: "jakarta",
                fontWeight: FontWeight.w600
              ),)
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("Programming is awesome for everyone" ,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: 20.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Row(
                children: const [
                  Icon(Icons.av_timer_outlined , color: Color(0xff888C94),size: 17.0,),
                  SizedBox(width: 4.0,),
                  Text("1 Hours 30 minutes" , style: TextStyle(
                      color: Color(0xff888C94),
                      fontSize: 14.0,
                      fontFamily: "jakarta",
                      fontWeight: FontWeight.w300
                  ) )
                ],
              ),
              const SizedBox(width: 20.0,),
              Row(
                children: const [
                  Icon(Icons.missed_video_call_outlined , color: Color(0xff888C94),size: 17.0,),
                  SizedBox(width: 4.0,),
                  Text("12 lessons" , style: TextStyle(
                      color: Color(0xff888C94),
                      fontSize: 14.0,
                      fontFamily: "jakarta",
                      fontWeight: FontWeight.w300
                  ) )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Row(
                children: const [
                  Icon(Icons.star_outlined , color: Color(0xff888C94),size: 17.0,),
                  SizedBox(width: 4.0,),
                  Text("4.7" , style: TextStyle(
                      color: Color(0xff888C94),
                      fontSize: 14.0,
                      fontFamily: "jakarta",
                      fontWeight: FontWeight.w300
                  ) )
                ],
              ),
              const SizedBox(width: 20.0,),
              Row(
                children: const [
                  Icon(Icons.person_outlined , color: Color(0xff888C94),size: 17.0,),
                  SizedBox(width: 4.0,),
                  Text("2k students" , style: TextStyle(
                      color: Color(0xff888C94),
                      fontSize: 14.0,
                      fontFamily: "jakarta",
                      fontWeight: FontWeight.w300
                  ) )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("Hello multi line description"
              "Hello multi line description"
              "Hello multi line description"
              "Hello multi line description" , style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(height: 28.0,),
        PageSelectionHeader(setPage: (isOverViewPage){
          if (isOverViewPage){
            _pageController.animateToPage(0, duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
          } else {
            _pageController.animateToPage(1, duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
          }
        },),
        PageSelectionBody(pageController: _pageController)
      ],
    );
  }
}
