import 'package:portfolio/app_theme/style_manager.dart';
import 'package:portfolio/data/blogs_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:url_launcher/url_launcher.dart';

class PublishedBlogs extends StatelessWidget {
  final double width;
  const PublishedBlogs({required this.width, super.key});

  Future<void> _launchUrl(url) async {
    Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }

  @override
  Widget build(BuildContext context) {
    //container for the list of blogs
    return Container(
      margin: viewsMargin,
      height: 200,
      width: width <= 400 ? width * 0.85 : width * 0.4,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: blogData.isNotEmpty
          ? CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.linear,
                pauseAutoPlayOnTouch: false,
              ),
              itemCount: blogData.length,
              itemBuilder: (context, index, pageViewIndex) {
                // aligns all information of the stack
                return Container(
                  height: 190,
                  width: width <= 400
                      ? width * 0.4
                      : width <= 600
                          ? width * 0.3
                          : width * 0.15,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).hintColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: LinkPreviewGenerator(
                      link: blogData[index],
                      linkPreviewStyle: LinkPreviewStyle.small,
                      backgroundColor: Theme.of(context).hintColor,
                      onTap: () {
                        _launchUrl(blogData[index]);
                      },
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                  ),
                );
              })
          : Container(
              padding: viewsPadding,
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.amp_stories_outlined,
                      size: 30,
                      color: Theme.of(context)
                          .floatingActionButtonTheme
                          .splashColor,
                    ),
                    Text(
                      'No blogs yet',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

//slideshow class