import 'package:flutter/material.dart';
import 'package:portfolio/Pages/EducationPage.dart';

import 'Pages/MainPage.dart';
import 'Pages/ProjectsPage.dart';
import 'Pages/SkillsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      routes: <String, WidgetBuilder>{
        "/education": (BuildContext context) => const EducationPage(),
        "/projects": (BuildContext context) => const ProjectsPage(),
        "/skills": (BuildContext context) => const SkillsPage(),
      },
    );
  }
}
