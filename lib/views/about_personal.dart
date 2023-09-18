// import 'package:portfolio/app_theme/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/education_history.dart';
import 'package:portfolio/views/card_item.dart';

class AboutMe extends StatefulWidget {
  final double width;
  const AboutMe({required this.width, super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.width <= 700 ? 600 : 200,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection:
              widget.width <= 700 ? Axis.vertical : Axis.horizontal,
          itemCount: educationHistory.length,
          itemBuilder: (context, index) {
            return ContentCard(
              width: widget.width,
              index: index,
            );
          }),
    );
  }
}
