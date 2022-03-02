import 'package:base/base.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({Key? key , required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0)
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(category.cover,)
                )
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              gradient:  LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          Positioned(
            bottom: 25.0,
            left: 18.0,
            right: 14.0,
            child: Text(category.title , style: const TextStyle(
              fontFamily: "jakarta",
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ), maxLines: 2,),
          )
        ],
      ),
    );
  }
}
