import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/category_item.dart';

class Categories extends StatelessWidget {

  final List<Category> categories;

  const Categories({Key? key , required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Popular category " , style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: "jakarta"
              ),),

              Text("See more" , style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                  fontFamily: "jakarta",
                  color: Color(0xff70747E)
              ),)
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: CategoryItem(category: categories[0])),
              const SizedBox(width: 14.0,),
              categories.length > 1 ? Expanded(child: CategoryItem(category: categories[1])) : Container(),
            ],
          )
        ],
      ),
    );
  }
}
