import 'package:flutter/material.dart';

class MediaLogin extends StatelessWidget {

  final String icon;
  final String text;
  final Function() action;


  const MediaLogin({
    Key? key ,
    required this.icon,
    required this.text ,
    required this.action
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        action();
      },
      child: Container(
        padding: const EdgeInsets.only(left: 30 , top: 9.5 , bottom: 9.5),
        margin: const EdgeInsets.only(left: 20 , right: 20),
        decoration: const BoxDecoration(
            color: Color(0xffC1C2B8),
            borderRadius: BorderRadius.all(Radius.circular(6.0))
        ),
        child: Row(
          children: [
            Image.asset(icon , width: 28.0, height: 28.0,),
            const SizedBox(width: 10,),
            Text(text , style: const TextStyle(
                fontFamily: "jakarta",
                fontSize: 16
            ),)
          ],
        ),
      ),
    );
  }
}
