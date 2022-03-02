import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final Function(String) search;
  final Function() cancelSearch;
  final TextEditingController _searchController = TextEditingController();
  final Key searchButton = const ValueKey("searchButton");
  SearchBox({Key? key , required this.search , required this.cancelSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffFFF1F3),
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: _searchController,
        onChanged: (text){
          if (text.isEmpty){
            cancelSearch();
          }
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search for ? ...",
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: "jakarta"
            ),
            suffixIcon: GestureDetector(
              key: searchButton,
              onTap: (){
                search(_searchController.value.text);
              },
              child: Image.asset(
                "assets/icons/search.png",
              ),
              // child: const Icon(Icons.search),
            ),
            suffixIconConstraints: BoxConstraints.tight(const Size(28 , 28))
        ),
      ),
    );
  }
}
