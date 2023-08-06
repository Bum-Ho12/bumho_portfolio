import 'package:portfolio/app_theme/style_manager.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  final double width;
  const PersonalInfo({required this.width, super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  List myStacks = [
    'Software development: mobile and desktop applications',
    'machine learning and data science',
    'Programming: Python and Django, Flutter, Java, C++, Visual Basic and Javascript (react native and node.js)',
    'Computer networking and cloud administration',
    'Database design and administration',
    'Animation and Graphics, tools (Blender, Figma and Photoshop,Krita)'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: viewsMargin,
      child: Row(
        mainAxisAlignment: viewsEvenAlignment,
        children: [
          // Profile Photo on desktop width
          // comes on the side of the details
          widget.width > 600
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: viewsPadding,
                      height: 200,
                      width: MediaQuery.of(context).size.width <= 700
                          ? MediaQuery.of(context).size.width * 0.3
                          : MediaQuery.of(context).size.width * 0.2,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundImage: const AssetImage(
                          'assets/profile.png',
                        ),
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
                      'Software and Machine learning/ \n Data Science Engineer',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
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
              widget.width <= 600
                  ? Container(
                      padding: viewsPadding,
                      height: 200,
                      width: MediaQuery.of(context).size.width <= 700
                          ? MediaQuery.of(context).size.width * 0.3
                          : MediaQuery.of(context).size.width * 0.2,
                      child: const CircleAvatar(
                        foregroundImage: AssetImage(
                          'assets/profile2.jpg',
                        ),
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
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        //Title
                        Text(
                          'Software and Machine learning/ \n Data Science Engineer',
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    )
                  : const SizedBox(),
              //stacks and proficiency column list
              widget.width > 600
                  ? Text(
                      'Stacks and Proficiencies: ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  : const SizedBox(),
              // List of stacks and expertise
              SizedBox(
                width: 210,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: myStacks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widget.width <= 600 ? 150 : 200,
                            child: Text(
                              myStacks[index],
                              // textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
