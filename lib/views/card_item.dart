import 'package:flutter/material.dart';
import 'package:portfolio/app_theme/style_manager.dart';
import 'package:portfolio/data/education_history.dart';

class ContentCard extends StatelessWidget {
  final double width;
  final int index;
  const ContentCard({
    required this.width,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Theme.of(context).hintColor.withOpacity(0.6),
          ),
        ),
        height: width <= 700 ? 150 : 200,
        margin: viewsMargin,
        width: width <= 700
            ? width * 0.8
            : width <= 900
                ? MediaQuery.of(context).size.width * 0.3
                : MediaQuery.of(context).size.width * 0.2,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: viewsPadding,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        // height: 70,
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundImage:
                              AssetImage(educationHistory[index]['asset']),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        width: width <= 700
                            ? width * 0.5
                            : width <= 900
                                ? MediaQuery.of(context).size.width * 0.15
                                : MediaQuery.of(context).size.width * 0.1,
                        child: Text(
                          educationHistory[index]['institution'],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Container(
                      height: 2,
                      width: width <= 700
                          ? width * 0.8
                          : width <= 900
                              ? MediaQuery.of(context).size.width * 0.25
                              : MediaQuery.of(context).size.width * 0.16,
                      color: Theme.of(context).hintColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                // height: 110,
                width: width <= 700
                    ? width * 0.8
                    : width <= 900
                        ? MediaQuery.of(context).size.width * 0.27
                        : MediaQuery.of(context).size.width * 0.18,
                child: Text(
                  educationHistory[index]['about'],
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 6,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ));
  }
}
