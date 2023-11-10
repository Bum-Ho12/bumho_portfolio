import 'package:portfolio/app_theme/style_manager.dart';
import 'package:portfolio/data/project_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/downloader.dart';
import '../utils/empty_downloader.dart';

class ListOfSoftwareProjects extends StatefulWidget {
  final double width;
  final ScrollController projectController;
  const ListOfSoftwareProjects({
    required this.width,
    required this.projectController,
    super.key,
  });

  @override
  State<ListOfSoftwareProjects> createState() => _ListOfSoftwareProjectsState();
}

class _ListOfSoftwareProjectsState extends State<ListOfSoftwareProjects> {
  // application downloader
  void fileDownloader(targetFile) async {
    final byteData = await rootBundle.load('$targetFile');
    Uint8List byteDataUint8List = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    List<int> byteDataListInt = byteDataUint8List.cast<int>();
    targetFile.toString().split('/')[1].isNotEmpty
        ? download(
            byteDataListInt,
            url: targetFile,
            downloadName: targetFile.toString().split('/')[1],
          )
        : emptyDownload();
  }

  Future<void> _launchUrl(url) async {
    Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: viewsPadding,
        itemCount: projectData.length,
        controller: widget.projectController,
        itemBuilder: (context, index) {
          return Container(
            margin: viewsMargin,
            padding: const EdgeInsets.all(5.0),
            width: widget.width <= 500
                ? widget.width * 0.5
                : widget.width <= 800
                    ? MediaQuery.of(context).size.width * 0.4
                    : widget.width <= 900
                        ? MediaQuery.of(context).size.width * 0.3
                        : MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: widget.width <= 800 ? 100 : 120,
                      width: widget.width <= 500
                          ? widget.width * 0.25
                          : widget.width <= 800
                              ? MediaQuery.of(context).size.width * 0.175
                              : widget.width <= 900
                                  ? MediaQuery.of(context).size.width * 0.15
                                  : MediaQuery.of(context).size.width * 0.1,
                      decoration: const BoxDecoration(
                        // color: Theme.of(context).hintColor.withOpacity(0.2),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(5),
                          bottom: Radius.circular(5),
                        ),
                        child: Image.asset(
                          projectData[index]['image'],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            projectData[index]['title'],
                            textAlign: TextAlign.start,
                            softWrap: true,
                            maxLines: widget.width <= 800 ? 4 : 6,
                            style: widget.width <= 800
                                ? Theme.of(context).textTheme.bodySmall
                                : Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Container(
                    height: 1,
                    color: Theme.of(context).hintColor.withOpacity(0.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        projectData[index]['readMe'],
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.7),
                          ),
                          BoxShadow(
                            blurRadius: 20,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.7),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: viewsEndAlignment,
                        children: [
                          projectData[index]['application'] == true
                              ? Column(
                                  mainAxisAlignment: viewsEvenAlignment,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            fileDownloader(
                                                projectData[index]['file']);
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.cloud_download_rounded,
                                        color: Theme.of(context)
                                            .floatingActionButtonTheme
                                            .splashColor,
                                      ),
                                      tooltip: 'Download application',
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(
                            width: 10,
                          ),
                          projectData[index]['github_url'].toString().isNotEmpty
                              ? Column(
                                  mainAxisAlignment: viewsEvenAlignment,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        _launchUrl(
                                            projectData[index]['github_url']);
                                      },
                                      icon: Icon(
                                        projectData[index]['web'] == false
                                            ? Icons.read_more_rounded
                                            : Icons.launch,
                                        color: Theme.of(context)
                                            .floatingActionButtonTheme
                                            .splashColor,
                                      ),
                                      tooltip:
                                          projectData[index]['web'] == false
                                              ? 'Read source material on GitHub'
                                              : 'Access the website',
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
