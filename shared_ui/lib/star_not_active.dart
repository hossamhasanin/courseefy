import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StarNotActive extends StatelessWidget {
  const StarNotActive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/icons/star_inactive.svg" , width: 10.0,height: 10.0);
  }
}
