import 'package:flutter/material.dart';
import 'pages/about_page.dart';
import 'pages/infrastructure_page.dart';
import 'pages/image_view_page.dart';
import 'pages/instructors_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/courses_page.dart';

class Routes {
  static const String about = '/about';
  static const String instructors = '/instructors';
  static const String infrastructure = '/infrastructure';
  static const String imageView = '/image-view';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String courses = '/courses';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case about:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case instructors:
        return MaterialPageRoute(builder: (_) => const InstructorsPage());
      case infrastructure:
        return MaterialPageRoute(builder: (_) => const InfrastructurePage());
      case imageView:
        final args = settings.arguments as Map?;
        return MaterialPageRoute(
          builder: (_) => ImageViewPage(
            imagePath: args?['imagePath'],
            title: args?['title'],
            heroTag: args?['heroTag'],
          ),
        );
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case courses:
        return MaterialPageRoute(builder: (_) => const CoursesPage());
      default:
        return MaterialPageRoute(builder: (_) => const AboutPage());
    }
  }
}
