import 'package:flutter/material.dart';
import 'package:massapp/screens/auth/login_screen.dart';
import 'package:massapp/screens/auth/register_screen.dart';
import 'package:massapp/screens/admin/dashboard_screen.dart';
import 'package:massapp/screens/lecturer/dashboard_screen.dart';
import 'package:massapp/screens/shared/dashboard_screen.dart';
import 'package:massapp/screens/shared/materials_screen.dart';
import 'package:massapp/screens/shared/projects_screen.dart';
import 'package:massapp/screens/shared/quizzes_screen.dart';

final routes = {
  '/': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/admin': (context) => AdminDashboardScreen(),
  '/lecturer': (context) => LecturerDashboardScreen(),
  '/student': (context) => StudentDashboardScreen(),
  '/materials': (context) => MaterialsScreen(),
  '/projects': (context) => ProjectsScreen(),
  '/quizzes': (context) => QuizzesScreen(),
};
