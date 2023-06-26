import 'package:portfolio/data/slider_show_data.dart';
import 'package:flutter/material.dart';
import '../app_theme/style_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProjectSlideShow extends StatefulWidget {
  final double width;
  const ProjectSlideShow({required this.width, super.key});

  @override
  State<ProjectSlideShow> createState() => _ProjectSlideShowState();
}

class _ProjectSlideShowState extends State<ProjectSlideShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: viewsMargin,
      height: widget.width <= 800 ? 200 : 300,
      width: widget.width <= 1000 ? widget.width * 0.8 : widget.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CarouselSlider.builder(
        itemCount: slideShowData.length,
        itemBuilder: (context, index, pageViewIndex) {
          List slideIcon = slideShowData[index]['icons'];
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  slideShowData[index]['image'],
                ),
              ),
              Positioned(
                top: 10,
                child: Container(
                  padding: viewsPadding,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.width <= 500
                          ? Text(
                              slideShowData[index]['title'],
                              maxLines: 3,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          : Text(
                              slideShowData[index]['title'],
                              maxLines: 3,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                      widget.width <= 500
                          ? const SizedBox()
                          : Text(
                              slideShowData[index]['content'],
                              maxLines: 3,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: SizedBox(
                  height: 30,
                  width: widget.width <= 1000
                      ? widget.width * 0.4
                      : widget.width * 0.3,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: slideIcon.length,
                    itemBuilder: (context, iconIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          slideIcon[iconIndex],
                          color: Theme.of(context)
                              .floatingActionButtonTheme
                              .splashColor,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
        // other options to change carousel outlook and behavior
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.linear,
          pauseAutoPlayOnTouch: false,
        ),
      ),
    );
  }
}
