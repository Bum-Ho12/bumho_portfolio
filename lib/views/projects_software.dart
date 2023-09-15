import 'package:flutter/material.dart';
import 'package:portfolio/app_theme/style_manager.dart';
import 'package:portfolio/data/project_data.dart';

class ListOfDesignProjects extends StatefulWidget {
  final double width;
  final ScrollController projectController;
  const ListOfDesignProjects(
      {required this.width, required this.projectController, super.key});

  @override
  State<ListOfDesignProjects> createState() => _ListOfDesignProjectsState();
}

class _ListOfDesignProjectsState extends State<ListOfDesignProjects> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: projectData.length,
      itemBuilder: (context, index) {
        return Container(
          margin: viewsMargin,
          width: widget.width <= 500
              ? widget.width * 0.5
              : widget.width <= 800
                  ? MediaQuery.sizeOf(context).width * 0.35
                  : widget.width <= 900
                      ? MediaQuery.sizeOf(context).width * 0.21
                      : MediaQuery.sizeOf(context).width * 0.2,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              Container(
                height: widget.width <= 800 ? 120 : 170,
                width: widget.width <= 500
                    ? widget.width * 0.5
                    : widget.width <= 800
                        ? MediaQuery.sizeOf(context).width * 0.35
                        : widget.width <= 900
                            ? MediaQuery.sizeOf(context).width * 0.21
                            : MediaQuery.sizeOf(context).width * 0.2,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor.withOpacity(0.2),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(5),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                    bottom: Radius.circular(10),
                  ),
                  child: Image.asset(
                    projectData[index]['image'],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
