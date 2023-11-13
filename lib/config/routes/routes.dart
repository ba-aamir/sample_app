import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/features/news_app/presentation/pages/home/home_screen.dart';
import 'package:test_app/features/news_app/presentation/pages/post_detail/post_details.dart';

import '../../features/news_app/domain/entities/post_entity.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const MyNews());

      case '/PostDetails':
        return _materialRoute(PostDetailsView(article: settings.arguments as PostEntity));

      default:
        return _materialRoute(const MyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}