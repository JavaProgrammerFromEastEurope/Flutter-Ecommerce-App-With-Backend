import 'package:flutter/material.dart';
import 'small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool hiddenText = true;
  static const int previewLength = 150;

  @override
  Widget build(BuildContext context) {
    final hasMore = widget.text.length > previewLength;
    final first =
        hasMore ? widget.text.substring(0, previewLength) : widget.text;
    final second = hasMore ? widget.text.substring(previewLength) : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallText(
            text: hiddenText
                ? (first + (hasMore ? '...' : ''))
                : (first + second)),
        if (hasMore)
          InkWell(
            onTap: () => setState(() => hiddenText = !hiddenText),
            child: Row(
              children: [
                SmallText(
                    text: hiddenText ? "Show more" : "Show less",
                    color: const Color(0xFF89dad0)),
                Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                    color: const Color(0xFF89dad0)),
              ],
            ),
          ),
      ],
    );
  }
}
