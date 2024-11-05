import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/home/home_view.dart';
import 'package:taskati/feature/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isUploaded  = AppLocalStorage.getcachData(AppLocalStorage.isUploadKey) ?? false;
    Future.delayed(const Duration(seconds: 5), () {
      if (isUploaded) {
        pushWithReplacment(context, HomeView());
      } else {
        pushWithReplacment(context, UploadScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/logo.json'),
            Text(
              "Taskati",
              style: getTitleTextStyle(),
            ),
            const Gap(10),
            Text(
              "It\s time to get organized",
              style: getSmallTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}