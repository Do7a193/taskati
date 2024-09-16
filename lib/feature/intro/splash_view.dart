import 'package:flutter/material.dart';
import 'package:taskati/core/funcations/navigation.dart';
import 'package:taskati/core/serivces/local_storage.dart';
import 'package:taskati/core/utils/appcolors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/home/home_view.dart';
import 'package:taskati/feature/upload/upload_view.dart';
import 'package:lottie/lottie.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 9),
      () {
        PushWithReplacment(
            context,
            (AppLocalSotrage.getCachData(AppLocalSotrage.kIsUpload) ?? false)
                ? const HomeView()
                : const UploadView());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/Logo.json'),
            Text(
              'Taskati',
              style: getTiitleTextStyle(
                  colorFree: Appcolors.Primary, fontwiegt: FontWeight.w600),
            ),
            const Gap(10),
            Text(
              'It\'s timeto be Organized',
              style: getSmallTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
