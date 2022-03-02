import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search/ui/filter_screen/components/body.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios , color: Color(0xff292D32),),
          onPressed: (){
            Get.back();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}
