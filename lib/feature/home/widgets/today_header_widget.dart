import 'package:flutter/material.dart';
import 'package:taskati/core/funcations/navigation.dart';
import 'package:taskati/core/utils/appcolors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgest/custom_Button.dart';
import 'package:intl/intl.dart';
import 'package:taskati/feature/add_task/add_task.dart';

class TodayHeaderWidget extends StatelessWidget {
  const TodayHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: getTiitleTextStyle(colorFree: Appcolors.Primary),
              ),
              Text(
                'Today',
                style: getTiitleTextStyle(
                    fontSize: 20, fontwiegt: FontWeight.w700),
              )
            ],
          ),
        ),
        CustomButton(
          text: '+ add Task',
          onPressed: () {
            PushWithReplacment(context, const AddTask());
          },
          width: 130,
        )
      ],
    );
  }
}
