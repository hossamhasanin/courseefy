import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  final String name;
  final String image;

  const Header({Key? key , required this.name , required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello , $name!" , style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  fontFamily: "jakarta"
              ),),
              const SizedBox(height: 5.0,),
              const Text("What do you wanna learn today?" , style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: "jakarta",
                  color: Color(0xff70747E)
              ))
            ],
          ),
          image.isNotEmpty ?  CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 25,
          ) :  const CircleAvatar(
            backgroundImage: AssetImage("assets/images/person.png"),
            radius: 25,
          )
        ],
      ),
    );
  }
}
