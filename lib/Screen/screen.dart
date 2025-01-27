import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/mapping.dart';
import '../Widgets/Customlogos/categoryLogo.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(ListRepo().dataLogo.length, (index) {
                  return CustomLogoCategory(
                    title: ListRepo().dataLogo[index]['name'].toString(),
                    image: ListRepo().dataLogo[index]['image'],
                    index: index,
                  );
                }),
              )),
        ),
      ),
    );
  }
}
