import 'package:portfolio/app_theme/style_manager.dart';
import 'package:portfolio/data/project_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/downloader.dart';
import '../utils/empty_downloader.dart';

class ListOfProjects extends StatefulWidget {
  final double width;
  final ScrollController projectController;
  const ListOfProjects({
    required this.width,
    required this.projectController,
    super.key,
  });

  @override
  State<ListOfProjects> createState() => _ListOfProjectsState();
}

class _ListOfProjectsState extends State<ListOfProjects> {
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
        itemCount: projectData.length,
        controller: widget.projectController,
        itemBuilder: (context, index) {
          return Container(
            margin: viewsMargin,
            width: widget.width <= 500
                ? widget.width * 0.5
                : widget.width <= 800
                    ? MediaQuery.of(context).size.width * 0.35
                    : widget.width <= 900
                        ? MediaQuery.of(context).size.width * 0.21
                        : MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Container(
                  height: widget.width <= 800 ? 120 : 170,
                  width: widget.width <= 500
                      ? widget.width * 0.5
                      : widget.width <= 800
                          ? MediaQuery.of(context).size.width * 0.35
                          : widget.width <= 900
                              ? MediaQuery.of(context).size.width * 0.21
                              : MediaQuery.of(context).size.width * 0.2,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).hintColor.withOpacity(0.2),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(5),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(1),
                    ),
                    child: Image.asset(
                      projectData[index]['image'],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Text(
                        projectData[index]['title'],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        height: 50,
                        width: widget.width <= 500
                            ? widget.width * 0.5
                            : widget.width * 0.35,
                        child: Text(
                          projectData[index]['readMe'],
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Row(
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
                                  widget.width <= 500
                                      ? const SizedBox()
                                      : Text(
                                          'Download',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        )
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
                                      Icons.read_more_rounded,
                                      color: Theme.of(context)
                                          .floatingActionButtonTheme
                                          .splashColor,
                                    ),
                                    tooltip: 'Read source material on GitHub',
                                  ),
                                  widget.width <= 500
                                      ? const SizedBox()
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            'Read on GitHub',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        )
                                ],
                              )
                            : const SizedBox(),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}