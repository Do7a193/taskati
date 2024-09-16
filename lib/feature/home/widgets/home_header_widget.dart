import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/core/funcations/navigation.dart';
import 'package:taskati/core/serivces/local_storage.dart';
import 'package:taskati/core/utils/appcolors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/profile/profile_view.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${AppLocalSotrage.getCachData(AppLocalSotrage.kName)}',
              style: getTiitleTextStyle(colorFree: Appcolors.Primary),
            ),
            Text(
              'Have a nice Day',
              style: getBodyTextStyle(),
            )
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            PushWithReplacment(context, ProfileView());
          },
          child: CircleAvatar(
            backgroundImage: (AppLocalSotrage.getCachData(
                        AppLocalSotrage.kImage) !=
                    null)
                ? FileImage(
                    File(AppLocalSotrage.getCachData(AppLocalSotrage.kImage)))
                : const AssetImage('assets/1077114.png'),
            radius: 40,
          ),
        )
      ],
    );
  }
}
