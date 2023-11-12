// import 'package:flutter_svg/svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/app_theme/style_manager.dart';
import 'package:flutter/material.dart';
// import 'package:portfolio/data/stack_data.dart';

class PersonalInfo extends StatefulWidget {
  final double width;
  const PersonalInfo({required this.width, super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  List myStacks = [
    '>> Software development: mobile, web and desktop applications\n'
        '>> Backend Development: web and REST APIs\n'
        '>> machine learning and data science\n'
        '>> Animation and Graphics: 2D animations,\n    character design, infographic and other designs.',
    // 'Backend Development: web and REST APIs',
    // 'machine learning and data science',
    // 'Programming',
    // 'Computer networking and cloud administration',
    // 'Database design and administration',
    // 'Animation and Graphics: 2D animations, character design, infographic and other designs.'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: viewsMargin,
      child: Row(
        mainAxisAlignment:
            widget.width <= 800 ? MainAxisAlignment.center : viewsEvenAlignment,
        children: [
          // Profile Photo on desktop width
          // comes on the side of the details
          widget.width > 600
              ? Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: Theme.of(context).hintColor.withOpacity(0.3)),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: viewsPadding,
                        height: 200,
                        width: MediaQuery.of(context).size.width <= 700
                            ? MediaQuery.of(context).size.width * 0.3
                            : MediaQuery.of(context).size.width * 0.2,
                        child: Image.asset(
                          'assets/profile.png',
                        ),
                      ),
                      // Full name
                      Text(
                        'Bumho Nisubire',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      //Title
                      Text(
                        'Software Engineer',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          SizedBox(
            width: widget.width * 0.1,
          ),
          Column(
            mainAxisAlignment: viewsEvenAlignment,
            children: [
              //when there is little space
              // the profile comes up here
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: Theme.of(context).hintColor.withOpacity(0.3)),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    widget.width <= 600
                        ? Container(
                            padding: viewsPadding,
                            height: 200,
                            width: MediaQuery.of(context).size.width <= 700
                                ? MediaQuery.of(context).size.width * 0.3
                                : MediaQuery.of(context).size.width * 0.2,
                            child: Image.asset(
                              'assets/profile.png',
                            ),
                          )
                        : const SizedBox(),
                    //Full Name
                    widget.width <= 600
                        ? Column(
                            children: [
                              Text(
                                'Bumho Nisubire',
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              //Title
                              Text(
                                'Software Engineer',
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              //stacks and proficiency column list
              widget.width > 600
                  ? Text(
                      'Stacks and Proficiencies: ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    )
                  : const SizedBox(),
              // List of stacks and expertise
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: widget.width < 400
                    ? widget.width * 0.7
                    : widget.width < 300
                        ? widget.width * 0.6
                        : widget.width * 0.5,
                padding: viewsPadding,
                //wrapper for stacks
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: Theme.of(context).hintColor.withOpacity(0.3)),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: widget.width < 400
                      ? Text(
                          myStacks[0],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      : AnimatedTextKit(
                          animatedTexts: [
                            ...myStacks.map((item) {
                              return TyperAnimatedText(
                                item,
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 6,
                                textAlign: TextAlign.start,
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                              );
                            }),
                          ],
                          repeatForever: true,
                          pause: const Duration(milliseconds: 2000),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
