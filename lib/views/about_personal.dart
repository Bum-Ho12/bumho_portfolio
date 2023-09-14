import 'package:portfolio/app_theme/style_manager.dart';
import 'package:flutter/material.dart';

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
      height: 500,
      width: widget.width <= 400 ? widget.width * 0.7 : widget.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: viewsEvenAlignment,
        children: [
          Text(
            'All About Me:',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          columnSizeSpace,
          Text(
            'EDUCATION\n'
            '\nBSC in Computer Technology | Multimedia University of Kenya\n'
            'SEPTEMBER, 2019 – 2023.\n'
            'Completed Course work, waiting for graduation.\n'
            'Google IT support specialist | Coursera\n'
            '7 FEBRUARY, 2022 – 25 APRIL, 2022.\n'
            'It is an IT support scholarship program.\n'
            'Secondary School | Kangundo High School\n'
            '2015 – 2018.\n'
            'GRADE: B+\n'
            'Developed an interest in Technology here (part of the computer group 2015-2018).\n'
            '\nWORK EXPERIENCE\n'
            '\nAPRIL 2020- APRIL 2022: IT Administrator for FFWPU-Kenya.',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            maxLines: 29,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
