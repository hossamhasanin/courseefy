import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffFFF1F3),
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search for ? ...",
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: "jakarta"
            ),
            suffixIcon: Image.asset(
              "assets/icons/search.png",
            ),
            suffixIconConstraints: BoxConstraints.tight(Size(28 , 28))
        ),
      ),
    );
  }
}
