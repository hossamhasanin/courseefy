
import 'package:flutter/material.dart';

class PageSelectionHeader extends StatefulWidget {
  final Function(bool) setPage;
  const PageSelectionHeader({Key? key , required this.setPage}) : super(key: key);

  @override
  _PageSelectionHeaderState createState() => _PageSelectionHeaderState();
}

class _PageSelectionHeaderState extends State<PageSelectionHeader> {
  
  bool isOverView = true;
  final notSelectedColor = const Color(0xff888C94);
  final selectedColor = const Color(0xff282F3E);
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  isOverView = true;
                  widget.setPage(isOverView);
                });
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Text("Overview" , style: TextStyle(
                    color: isOverView ? selectedColor : notSelectedColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                    fontFamily: "jakarta"
                )),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  isOverView = false;
                  widget.setPage(isOverView);
                });
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Text("Lessons" , style: TextStyle(
                    color: !isOverView ? selectedColor : notSelectedColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                    fontFamily: "jakarta"
                )),
              ),
            ),
          ],
        ),
        Container(
          color: const Color(0xffE9EFFD),
          height: 2.0,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn,
                left: isOverView ? 0.0 : widthSize/2,
                right: !isOverView ? 0.0 : widthSize/2,
                child: Container(
                  height: 2.0,
                  width: widthSize/2,
                  color: const Color(0xff265AE8),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
