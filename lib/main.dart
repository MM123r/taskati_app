import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/constants/app_fonts.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

import 'package:taskati/core/utils/theme.dart';
import 'package:taskati/feature/intro/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('user');
  await Hive.openBox<TaskModel>('task');
  await AppLocalStorage.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppLocalStorage.userbox.listenable(),
      builder: (context, value, child) {
        bool isDarkmode =
            AppLocalStorage.getcachData(AppLocalStorage.isDarkModekey) ?? false;
        return MaterialApp(
          
          themeMode: isDarkmode? ThemeMode.dark: ThemeMode.light,
          //light
          //theme: AppTheme.LightTheme,
          theme: ThemeData(
              scaffoldBackgroundColor: AppColors.whiteColor,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.primaruColor,
                  onSurface: AppColors.darkblueColor),
              appBarTheme: AppBarTheme(
                color: AppColors.primaruColor,
                centerTitle: true,
                titleTextStyle:TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                color: AppColors.darkblueColor,),
                
                foregroundColor: AppColors.whiteColor,
              ),
              datePickerTheme: DatePickerThemeData(
                backgroundColor: AppColors.darkblueColor,
                headerForegroundColor: AppColors.primaruColor
              ),
              timePickerTheme: TimePickerThemeData(
                backgroundColor: AppColors.whiteColor,
                //hourMinuteColor: AppColors.
               dialBackgroundColor: AppColors.whiteColor
              ),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: getSmallTextStyle(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaruColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaruColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaruColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaruColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              )),

          

          //dark
          //darkTheme: AppTheme.LightTheme,
          darkTheme: ThemeData(
            scaffoldBackgroundColor: AppColors.darkblueColor,
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaruColor,
                onSurface: AppColors.whiteColor),
            appBarTheme: AppBarTheme(
              color: AppColors.primaruColor,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,),
              foregroundColor: AppColors.whiteColor,
            ),
              datePickerTheme: DatePickerThemeData(
                backgroundColor: AppColors.darkblueColor,
                headerForegroundColor: AppColors.primaruColor,
              ),
              timePickerTheme: TimePickerThemeData(
                backgroundColor: AppColors.darkblueColor,
                //hourMinuteColor: AppColors.
               dialBackgroundColor: AppColors.darkblueColor
              ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: getSmallTextStyle(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaruColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaruColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaruColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaruColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          

          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
