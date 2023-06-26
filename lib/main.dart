import 'package:portfolio/app_theme/style_manager.dart';
import 'package:portfolio/views/about_personal.dart';
import 'package:portfolio/views/footer.dart';
import 'package:portfolio/views/other_info.dart';
import 'package:portfolio/views/personal_display.dart';
import 'package:portfolio/views/projects.dart';
import 'package:portfolio/views/slideshow.dart';
import 'package:flutter/material.dart';

import 'app_theme/theme_manager.dart';
import 'data/project_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bum-Ho Nisubire',
      theme: ThemeClass.lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeClass.darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller = ScrollController();
  //scroll for projects section
  final ScrollController projectController = ScrollController();
  // manages scroll to target point or section
  void _goToSection(double offset) {
    _controller.animateTo(offset,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  // manages scroll to target project
  void goToProject(int index) {
    projectController.animateTo(index * 200,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _goToSection(0);
                });
              },
              icon: const Icon(Icons.home_filled),
              tooltip: 'Go to top, Personal section',
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  _goToSection(
                    width <= 1000
                        ? 560
                        : width <= 800
                            ? 800
                            : 230,
                  );
                });
              },
              icon: const Icon(Icons.apps),
              tooltip: 'Projects and apps worked upon',
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _goToSection(
                    width <= 1000
                        ? 910
                        : width <= 800
                            ? 1100
                            : width <= 500
                                ? 1600
                                : 580,
                  );
                });
              },
              icon: const Icon(Icons.newspaper_rounded),
              tooltip: 'News and Blogs',
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _goToSection(
                    width <= 1000
                        ? 1410
                        : width <= 800
                            ? 1600
                            : width <= 500
                                ? 2160
                                : 1080,
                  );
                });
              },
              icon: const Icon(Icons.contact_page_outlined),
              tooltip: 'Contact Details',
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          controller: _controller,
          children: [
            // in wide screens profile/personal details and slideshow appear
            // in  a row
            width > 1000
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PersonalInfo(
                        width: width,
                      ),
                      ProjectSlideShow(width: width),
                    ],
                  )
                // in small screen profile/personal details and slideshow
                // appear in a column
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PersonalInfo(
                        width: width,
                      ),
                      ProjectSlideShow(width: width)
                    ],
                  ),
            columnSizeSpace,
            Container(
              padding: viewsPadding,
              child: Row(
                children: [
                  Text(
                    'Projects and Works',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    onSelected: (value) {},
                    itemBuilder: (context) {
                      return List.generate(
                        projectData.length,
                        (index) => PopupMenuItem(
                          onTap: () {
                            setState(() {
                              goToProject(index);
                            });
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            color: Theme.of(context).hintColor.withOpacity(0.5),
                            child: Text(
                              projectData[index]['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    tooltip:
                        'click to see a list of all projects,\n select from list to navigate to section',
                    child: Row(
                      children: [
                        width > 400
                            ? Text(
                                'Scroll for more',
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            : const SizedBox(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).hintColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // horizontal list of projects publicly available
            SizedBox(
              height: width <= 500
                  ? 300
                  : width <= 800
                      ? 310
                      : 360,
              child: ListOfProjects(
                width: width,
                projectController: projectController,
              ),
            ),
            columnSizeSpace,
            Padding(
              padding: viewsPadding,
              // column for the blogs and about section
              child: Column(
                children: [
                  // wide screen blog and about appear in the same row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AboutMe(width: width),
                      // width > 400
                      //     ? Divider(
                      //         thickness: 1,
                      //         color: Theme.of(context).hintColor,
                      //       )
                      //     : const SizedBox(),
                      width > 400
                          ? Column(
                              children: [
                                Container(
                                  padding: viewsPadding,
                                  child: Text(
                                    'Published Blogs',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                                PublishedBlogs(width: width),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                  // small screen blog and about appear in column form
                  width <= 400
                      ? SizedBox(
                          height: 260,
                          child: Column(
                            children: [
                              Container(
                                padding: viewsPadding,
                                child: Text(
                                  'Published Blogs',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              PublishedBlogs(width: width),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            // bottom part of website with the contact and social media
            // information
            columnSizeSpace,
            PortFolioFooter(
              width: width,
            )
          ],
        ),
      ),
    );
  }
}
