import 'package:flutter_svg/svg.dart';
import 'package:portfolio/app_theme/style_manager.dart';
import 'package:portfolio/views/about_personal.dart';
import 'package:portfolio/views/footer.dart';
// import 'package:portfolio/views/other_info.dart';
import 'package:portfolio/views/personal_display.dart';
// import 'package:portfolio/views/projects.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/views/software_projects.dart';
import 'app_theme/theme_manager.dart';
import 'data/project_data.dart';
import 'data/stack_data.dart';

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
  // controller to determine sections in the web app
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
            InkWell(
              onTap: () {
                setState(() {
                  _goToSection(0);
                });
              },
              customBorder: const CircleBorder(),
              child: Ink(
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Use a circular shape for the splash
                  gradient: RadialGradient(
                    colors: [
                      Theme.of(context).hintColor,
                      Colors.transparent,
                    ], // Define your gradient colors
                    radius:
                        60, // Adjust the radius to control the spread of the radial effect
                  ),
                ),
                child: CircleAvatar(
                  radius: width <= 700 ? 24 : 26,
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundImage: const AssetImage(
                    'assets/profile.png',
                  ),
                ),
              ),
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
              icon: Icon(
                Icons.apps,
                size: width <= 700 ? 24 : 30,
              ),
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
              icon: Icon(
                Icons.cast_for_education_outlined,
                size: width <= 700 ? 24 : 30,
              ),
              tooltip: 'Career section',
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
              icon: Icon(
                Icons.contact_page_outlined,
                size: width <= 700 ? 24 : 30,
              ),
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
            Container(
              margin: viewsMargin,
              padding: viewsPadding,
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: width > 1000
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PersonalInfo(
                          width: width,
                        ),
                        //displays icons
                        Container(
                          padding: viewsPadding,
                          // decoration: BoxDecoration(
                          //   color: Theme.of(context).scaffoldBackgroundColor,
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          width: 250,
                          child: Column(children: [
                            //displays icons for languages and frameworks
                            Wrap(
                              spacing: 5.0,
                              runSpacing: 5.0,
                              children: [
                                ...stackWorkData.map((item) {
                                  return item['category'] == 'language'
                                      ? Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: SvgPicture.asset(
                                            item['asset'],
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    700
                                                ? 24
                                                : 50,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    700
                                                ? 24
                                                : 50,
                                          ),
                                        )
                                      : const SizedBox();
                                })
                              ],
                            ),
                            columnSizeSpace,
                            //displays icons for design softwares
                            Wrap(
                              spacing: 5.0,
                              runSpacing: 5.0,
                              children: [
                                ...stackWorkData.map((item) {
                                  return item['category'] == 'design'
                                      ? Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: SvgPicture.asset(
                                            item['asset'],
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    700
                                                ? 24
                                                : 50,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    700
                                                ? 24
                                                : 50,
                                          ),
                                        )
                                      : const SizedBox();
                                })
                              ],
                            ),
                          ]),
                        )
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
                        // ProjectSlideShow(width: width)
                        Container(
                          padding: viewsPadding,
                          // decoration: BoxDecoration(
                          //   color: Theme.of(context).scaffoldBackgroundColor,
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          width: 250,
                          child: Column(children: [
                            Wrap(
                              spacing: 14.0,
                              runSpacing: 14.0,
                              children: [
                                ...stackWorkData.map((item) {
                                  return item['category'] == 'language'
                                      ? Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: SvgPicture.asset(
                                            item['asset'],
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    700
                                                ? 24
                                                : 50,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    700
                                                ? 24
                                                : 50,
                                          ),
                                        )
                                      : const SizedBox();
                                })
                              ],
                            ),
                            columnSizeSpace,
                            Wrap(
                              spacing: 5.0,
                              runSpacing: 5.0,
                              children: [
                                ...stackWorkData.map((item) {
                                  return item['category'] == 'design'
                                      ? Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: SvgPicture.asset(
                                            item['asset'],
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    700
                                                ? 24
                                                : 50,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    700
                                                ? 24
                                                : 50,
                                          ),
                                        )
                                      : const SizedBox();
                                })
                              ],
                            ),
                          ]),
                        )
                      ],
                    ),
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
            columnSizeSpace,
            Container(
              height: width <= 800 ? 230 : 260,
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: ListOfSoftwareProjects(
                width: width,
                projectController: projectController,
              ),
            ),
            columnSizeSpace,
            Container(
              padding: viewsPadding,
              child: Text(
                'My Career',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            columnSizeSpace,
            Padding(
              padding: viewsPadding,
              child: AboutMe(width: width),
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
