import 'package:flutter/material.dart';
import 'package:mobitech_task/core/app_color/app_color.dart';
import 'package:mobitech_task/core/app_util/app_util.dart';

class ExpandTextWidget extends StatefulWidget {
  const ExpandTextWidget({super.key, required this.text});

  final String text;

  @override
  State<ExpandTextWidget> createState() => _ExpandTextWidgetState();
}

class _ExpandTextWidgetState extends State<ExpandTextWidget> {
  bool isExpanted = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: AppUtil.getWidth(context) * 0.90,
          child: Text(
            widget.text.trim(),
            maxLines: isExpanted ? null : 2,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(fontSize: 14,),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanted = !isExpanted;
            });
          },
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColor.shadowColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text("More"),
            ),
          ),
        ),
      ],
    );
  }
}
