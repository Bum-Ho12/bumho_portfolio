import 'package:portfolio/app_theme/style_manager.dart';
import 'package:portfolio/utils/logger_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class PortFolioFooter extends StatelessWidget {
  final double width;
  const PortFolioFooter({required this.width, super.key});

  Future<void> _launchUrl(url) async {
    Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width <= 800 ? 235 : 200,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: SizedBox(
        width: width,
        child: width > 700
            ? // Layout for footer if width of web is greater than 700
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // column for email and phone contacts
                      Column(
                        children: [
                          // email address
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Reach Me through ',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              width > 300
                                  ? TextButton(
                                      onPressed: () async {
                                        String email = Uri.encodeComponent(
                                            'bumhonisu@gmail.com');
                                        String subject =
                                            Uri.encodeComponent('');
                                        String body = Uri.encodeComponent("");
                                        Uri mail = Uri.parse(
                                            "mailto:$email?subject=$subject&body=$body");
                                        if (await launchUrl(mail)) {
                                          //email app opened
                                        } else {
                                          appLogger(
                                              'failed to invoke email...');
                                        }
                                      },
                                      child: Text(
                                        'bumhonisu@gmail.com',
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          width <= 300
                              ? TextButton(
                                  onPressed: () async {
                                    String email = Uri.encodeComponent(
                                        'bumhonisu@gmail.com');
                                    String subject = Uri.encodeComponent('');
                                    String body = Uri.encodeComponent("");
                                    Uri mail = Uri.parse(
                                        "mailto:$email?subject=$subject&body=$body");
                                    if (await launchUrl(mail)) {
                                      //email app opened
                                    } else {
                                      appLogger('failed to invoke email...');
                                    }
                                  },
                                  child: Text(
                                    'bumhonisu@gmail.com',
                                    maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                )
                              : const SizedBox(),
                          columnSizeSpace,
                          Text(
                            'Or',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            ' +254 795 421 016',
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width <= 800 ? 30 : 60,
                      ),
                      // Column for social media and other profile info
                      Column(
                        children: [
                          // title
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: Text(
                              'Social Media Handles and other profiles:',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          columnSizeSpace,
                          // social media contacts
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              columnSizeSpace,
                              // LinkedIn contact
                              TextButton(
                                onPressed: () {
                                  _launchUrl(
                                      'https://www.linkedin.com/in/bumho-nisubire-773a181a0/ ');
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/linkedin.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    Text(
                                      'LinkedIn',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  ],
                                ),
                              ),
                              columnSizeSpace,
                              // GitHub URL
                              TextButton(
                                onPressed: () {
                                  _launchUrl('https://github.com/Bum-Ho12');
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/github.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    Text(
                                      'GitHub',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  ],
                                ),
                              ),
                              columnSizeSpace,
                              // twitter contact
                              TextButton(
                                onPressed: () {
                                  _launchUrl(
                                      'https://www.twitter.com/BumhoNisubire?t=5GPZXPTnBoNh3bHzZA&s=09');
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/twitter.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    Text(
                                      'Twitter',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _launchUrl('https://pin.it/2YbP3WU');
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/pinterest.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    Text(
                                      'Pinterest',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  columnSizeSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copyright_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                      Text(
                        'Bumho Nisubire',
                        style: Theme.of(context).textTheme.displayMedium,
                      )
                    ],
                  ),
                ],
              )
            :
            // Layout arrangement if width is less than 700 px
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  // email address
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reach Me through ',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      width > 300
                          ? TextButton(
                              onPressed: () async {
                                String email =
                                    Uri.encodeComponent('bumhonisu@gmail.com');
                                String subject = Uri.encodeComponent('');
                                String body = Uri.encodeComponent("");
                                Uri mail = Uri.parse(
                                    "mailto:$email?subject=$subject&body=$body");
                                if (await launchUrl(mail)) {
                                  //email app opened
                                } else {
                                  appLogger('failed to invoke email...');
                                }
                              },
                              child: SizedBox(
                                width: width <= 400 ? 120 : 180,
                                child: Text(
                                  'bumhonisu@gmail.com',
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  width <= 300
                      ? TextButton(
                          onPressed: () async {
                            String email =
                                Uri.encodeComponent('bumhonisu@gmail.com');
                            String subject = Uri.encodeComponent('');
                            String body = Uri.encodeComponent("");
                            Uri mail = Uri.parse(
                                "mailto:$email?subject=$subject&body=$body");
                            if (await launchUrl(mail)) {
                              //email app opened
                            } else {
                              appLogger('failed to invoke email...');
                            }
                          },
                          child: Text(
                            'bumhonisu@gmail.com',
                            maxLines: 2,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        )
                      : const SizedBox(),
                  columnSizeSpace,
                  Text(
                    'Or',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    ' +254 795 421 016',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  columnSizeSpace,
                  // title
                  Text(
                    'Social Media and other profiles:',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  columnSizeSpace,
                  // social media contacts
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      columnSizeSpace,
                      // LinkedIn contact
                      TextButton(
                        onPressed: () {
                          _launchUrl(
                              'https://www.linkedin.com/in/bumho-nisubire-773a181a0/ ');
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/linkedin.svg',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                      columnSizeSpace,
                      // GitHub URL
                      TextButton(
                        onPressed: () {
                          _launchUrl('https://github.com/Bum-Ho12');
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/github.svg',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                      //Twitter account
                      TextButton(
                        onPressed: () {
                          _launchUrl(
                              'https://www.twitter.com/BumhoNisubire?t=5GPZXPTnBoNh3bHzZA&s=09');
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/twitter.svg',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                      //pinterest account link
                      TextButton(
                        onPressed: () {
                          _launchUrl('https://pin.it/2YbP3WU');
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/pinterest.svg',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copyright_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                      Text(
                        'Bumho Nisubire',
                        style: Theme.of(context).textTheme.displayMedium,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
      ),
    );
  }
}
