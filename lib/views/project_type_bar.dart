import 'package:flutter/material.dart';
import 'package:portfolio/app_theme/style_manager.dart';

class ProjectBar extends StatefulWidget {
  const ProjectBar({super.key});

  @override
  State<ProjectBar> createState() => _ProjectBarState();
}

class _ProjectBarState extends State<ProjectBar> {
  @override
  Widget build(BuildContext context) {
    var barContent = [
      {
        "name": "Production",
        "color": Colors.red[300],
      },
      {
        "name": "In-Progress",
        "color": Colors.yellow[200],
      },
      {
        "name": "Practice",
        "color": Colors.green[300],
      },
      {
        "name": "Demos",
        "color": Colors.orange[300],
      },
    ];
    return Wrap(
      children: [
        ...barContent.map((item) {
          Color? color = item['color'] as Color?;
          String name = item['name'] as String;
          return Container(
              height: 30,
              width: 100,
              margin: viewsMargin,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black26,
                  width: 0.5,
                ),
              ),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ));
        })
      ],
    );
  }
}
