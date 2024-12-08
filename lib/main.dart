import 'package:eigital_assessment/app_bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/brand_guideline/brand_guideline.dart';
import 'responsive_pan.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    statusBarColor: AppColors.mainPrimaryBlack,
  ));


  runApp( BlocProvider(
      create: (context) => AppBloc()..add(LoadUsersData()),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Cool App',
     // debugShowMaterialGrid: true,
      theme: AppTheme.currentTheme(context: context,textScaler: 1),
      home: const ResponsivePan(),
    );
  }
}
