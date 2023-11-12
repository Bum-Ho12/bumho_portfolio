import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/app_theme/style_manager.dart';
import 'package:portfolio/utils/downloader.dart';
import 'package:portfolio/utils/empty_downloader.dart';
import 'package:portfolio/views/about_personal.dart';
import 'package:portfolio/views/footer.dart';
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

  // application downloader
  void fileDownloader(targetFile) async {
    final byteData = await rootBundle.load('$targetFile');
    Uint8List byteDataUint8List = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    List<int> byteDataListInt = byteDataUint8List.cast<int>();
    targetFile.toString().isNotEmpty
        ? download(
            byteDataListInt,
            url: targetFile,
            downloadName: targetFile.toString(),
          )
        : emptyDownload();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
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
              child: Text(
                'Projects',
                style: width < 400
                    ? Theme.of(context).textTheme.displaySmall
                    : width < 600
                        ? Theme.of(context).textTheme.displayMedium
                        : Theme.of(context).textTheme.displayLarge,
              ),
            ),
            TextButton(
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
              child: Text(
                'My Career',
                style: width < 400
                    ? Theme.of(context).textTheme.displaySmall
                    : width < 600
                        ? Theme.of(context).textTheme.displayMedium
                        : Theme.of(context).textTheme.displayLarge,
              ),
            ),
            TextButton(
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
              child: Text(
                'Contact Me',
                style: width < 400
                    ? Theme.of(context).textTheme.displaySmall
                    : width < 600
                        ? Theme.of(context).textTheme.displayMedium
                        : Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const Spacer(),
            TextButton(
                autofocus: true,
                onPressed: () {
                  fileDownloader('Bumho-nisubire.pdf');
                },
                child: Row(
                  children: [
                    Text(
                      'Resume',
                      style: width < 400
                          ? Theme.of(context).textTheme.displaySmall
                          : width < 600
                              ? Theme.of(context).textTheme.displayMedium
                              : Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Icon(
                      Icons.file_download_outlined,
                      size: 30,
                    ),
                  ],
                ))
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
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PersonalInfo(
                          width: width,
                        ),
                        //displays icons
                        Container(
                          padding: viewsPadding,
                          width: width,
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
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 20,
                                                  color: Theme.of(context)
                                                      .hintColor
                                                      .withOpacity(0.3)),
                                            ],
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
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 20,
                                                  color: Theme.of(context)
                                                      .hintColor
                                                      .withOpacity(0.3)),
                                            ],
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
                        Container(
                          padding: viewsPadding,
                          width: width,
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
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 20,
                                                  color: Theme.of(context)
                                                      .hintColor
                                                      .withOpacity(0.3)),
                                            ],
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
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 20,
                                                  color: Theme.of(context)
                                                      .hintColor
                                                      .withOpacity(0.3)),
                                            ],
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
                    style: Theme.of(context).textTheme.displayLarge,
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
                color: Theme.of(context).scaffoldBackgroundColor,
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
            // Padding(
            //   padding: viewsPadding,
            //   child: PublishedBlogs(width: width),
            // ),
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
