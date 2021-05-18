import 'package:flutter/material.dart';
import 'package:reddit_clone/core/extensions/app_extensions.dart';

class LimitedText extends StatefulWidget {
  final String text;
  LimitedText(this.text, {Key? key}) : super(key: key);

  @override
  _LimitedTextState createState() => _LimitedTextState();
}

class _LimitedTextState extends State<LimitedText> {
  bool selfTextShort = true;
  @override
  Widget build(BuildContext context) {
    if (widget.text.length >= 200) {
      return InkWell(
        onTap: () {
          setState(() {
            selfTextShort = !selfTextShort;
          });
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Text(
              selfTextShort ? widget.text.substring(0, 200).trim() : widget.text,
            ),
            if (selfTextShort) ...[
              Align(
                child: Container(
                  height: context.dynamicHeight(0.05),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white10,
                        Colors.white12,
                        Colors.white24,
                        Colors.white30,
                        Colors.white38,
                        Colors.white54,
                        Colors.white60,
                        Colors.white70,
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
      );
    }
    return Text(widget.text);
  }
}
