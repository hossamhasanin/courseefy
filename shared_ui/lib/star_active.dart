import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StarActive extends StatelessWidget {
  const StarActive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/icons/star_active.svg" , width: 10.0,height: 10.0);
  }
}
