import 'package:flutter/material.dart';
import 'package:massapp/screens/auth/login_screen.dart';
import 'package:massapp/screens/admin/dashboard_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => LoginScreen(),
  '/admin/dashboard': (context) => const AdminDashboardScreen(),
};
