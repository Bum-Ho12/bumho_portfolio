// import 'package:portfolio/app_theme/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/education_history.dart';
import 'package:portfolio/views/card_item.dart';

class AboutMe extends StatelessWidget {
  final double width;
  const AboutMe({required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width <= 700 ? 600 : 200,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection:
              width <= 700 ? Axis.vertical : Axis.horizontal,
          itemCount: educationHistory.length,
          itemBuilder: (context, index) {
            return ContentCard(
              width: width,
              index: index,
            );
          }),
    );
  }
}
