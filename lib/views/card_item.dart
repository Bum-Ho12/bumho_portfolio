import 'package:flutter/material.dart';

class ContentCard extends StatefulWidget {
  final double width;
  const ContentCard({
    required this.width,
    super.key,
  });

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      width: widget.width <= 500
          ? widget.width * 0.5
          : widget.width <= 800
              ? MediaQuery.of(context).size.width * 0.4
              : widget.width <= 900
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.2,
      child: Stack(
        children: [
          CircleAvatar(
            child: Image.asset('')
          )
        ],
      )
    );
  }
}
