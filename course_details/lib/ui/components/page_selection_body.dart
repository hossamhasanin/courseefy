import 'dart:html';

import 'package:base/base.dart';
import 'package:course_details/ui/components/lessons_page.dart';
import 'package:course_details/ui/components/overview_page.dart';
import 'package:flutter/material.dart';

class PageSelectionBody extends StatelessWidget {
  final PageController pageController;
  const PageSelectionBody({Key? key , required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OverViewPage(),
          const LessonsPage(lessons: [
            Lesson(
              id: 0,
              thumpNail: "",
              videoUrl: "",
              title: "Build the site",
              description: "This is a description , This is a description"
                  "This is a description , This is a description, This is a description",
              courseId: 0
            )
          ])
        ],
    );
  }
}
