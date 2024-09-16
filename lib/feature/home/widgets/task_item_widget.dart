import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/appcolors.dart';
import 'package:taskati/core/utils/text_style.dart';

class taskItemWidget extends StatelessWidget {
  const taskItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Appcolors.Primary,
      ),
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flutter Task ',
                    style: getTiitleTextStyle(colorFree: Appcolors.white),
                  ),
                  const Gap(5),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 18,
                        color: Appcolors.white,
                      ),
                      const Gap(10),
                      Text(
                        '10:00 AM - 10:00 AM ',
                        style: getBodyTextStyle(
                            fontSize: 12, colorFree: Appcolors.white),
                      ),
                    ],
                  ),
                  const Gap(5),
                  Text(
                    'I  Will Do This Task ',
                    style: getBodyTextStyle(colorFree: Appcolors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: 1,
            color: Appcolors.white,
          ),
          const Gap(5),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'Todo',
              style:
                  getTiitleTextStyle(colorFree: Appcolors.white, fontSize: 14),
            ),
          ),
          const Gap(5)
        ],
      ),
    );
  }
}
