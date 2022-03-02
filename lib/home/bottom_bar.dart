import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget{

  final RxInt currentPage;
  final Function(int) moveTo;

  const BottomBar({Key? key, required this.currentPage , required this.moveTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10.0),
      height: 60.0,
      child: Obx((){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  curve: Curves.linearToEaseOut,
                  child: currentPage.value != 0 ? GestureDetector(
                    onTap: (){
                      moveTo(0);
                    },
                    child: Image.asset("assets/icons/home.png" , width: 24.0 , height: 24.0,),
                  ) : Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Color(0xff265AE8),
                          borderRadius: BorderRadius.all(Radius.circular(36))
                        ),
                        child: Image.asset("assets/icons/home_active.png" , width: 24.0 , height: 24.0),
                      ),
                      const SizedBox(width: 15.0,),
                      const Text("Home" , style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: "jakarta"
                      ),)
                    ],
                  )
              ),
              AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  curve: Curves.linearToEaseOut,
                  child: currentPage.value != 1 ? GestureDetector(
                    onTap: (){
                      moveTo(1);
                    },
                    child: Image.asset("assets/icons/search.png" , width: 24.0 , height: 24.0,),
                  ) : Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Color(0xff265AE8),
                            borderRadius: BorderRadius.all(Radius.circular(36))
                        ),
                        child: Image.asset("assets/icons/search_active.png" ,width: 24.0 , height: 24.0,),
                      ),
                      const SizedBox(width: 15.0,),
                      const Text("Search" , style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: "jakarta"
                      ))
                    ],
                  )
              ),
              AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  curve: Curves.linearToEaseOut,
                  child: currentPage.value != 2 ? GestureDetector(
                    onTap: (){
                      moveTo(2);
                    },
                    child: Image.asset("assets/icons/book_mark.png" , width: 24.0 , height: 24.0,),
                  ) : Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Color(0xff265AE8),
                            borderRadius: BorderRadius.all(Radius.circular(36))
                        ),
                        child: Image.asset("assets/icons/book_mark_active.png" , width: 24.0 , height: 24.0,),
                      ),
                      const SizedBox(width: 15.0,),
                      const Text("Saved" , style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: "jakarta"
                      ))
                    ],
                  )
              ),

              AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  curve: Curves.linearToEaseOut,
                  child: currentPage.value != 3 ? GestureDetector(
                    onTap: (){
                    },
                    child: Image.asset("assets/icons/person.png" , width: 24.0 , height: 24.0,),
                  ) : Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Color(0xff265AE8),
                            borderRadius: BorderRadius.all(Radius.circular(36))
                        ),
                        child: Image.asset("assets/icons/person_active.png" , width: 24.0 , height: 24.0,),
                      ),
                      const SizedBox(width: 15.0,),
                      const Text("Person" , style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: "jakarta"
                      ))
                    ],
                  )
              ),
            ],
          );
        }
      ),
    );
  }
}
