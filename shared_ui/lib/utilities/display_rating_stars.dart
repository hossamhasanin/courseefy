import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_ui/star_active.dart';
import 'package:shared_ui/star_not_active.dart';

List<Widget> displayRatingStars(int rating){
  List<Widget> stars = [];
  var activeStars = rating.toInt();

  for(var i = 0;i <= 5;i++){
    if (activeStars > 0){
      stars.add(
        const StarActive(),
      );
      activeStars -= 1;
    } else {
      stars.add(
          const StarNotActive()
      );
    }
  }
  return stars;
}