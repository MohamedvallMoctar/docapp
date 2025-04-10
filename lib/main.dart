import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Advanced',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DocApp(appRouter: AppRouter(),),
    );
  }
}
