// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:neon_app_case/screens/artifact_info_screen/view/artifact_info_screen.dart'
    as _i1;
import 'package:neon_app_case/screens/category_detail_screen/view/category_detail_screen.dart'
    as _i2;
import 'package:neon_app_case/screens/departments_screen/view/departments_screen.dart'
    as _i3;
import 'package:neon_app_case/screens/home_screen/view/home_screen.dart' as _i4;
import 'package:neon_app_case/screens/info_screen/view/info_screen.dart' as _i5;
import 'package:neon_app_case/screens/search_screen/view/search_screen.dart'
    as _i6;

/// generated route for
/// [_i1.ArtifactInfoScreen]
class ArtifactInfoRoute extends _i7.PageRouteInfo<ArtifactInfoRouteArgs> {
  ArtifactInfoRoute({
    _i8.Key? key,
    required int artifactId,
    required String title,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         ArtifactInfoRoute.name,
         args: ArtifactInfoRouteArgs(
           key: key,
           artifactId: artifactId,
           title: title,
         ),
         rawPathParams: {'artifactId': artifactId, 'title': title},
         initialChildren: children,
       );

  static const String name = 'ArtifactInfoRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ArtifactInfoRouteArgs>(
        orElse:
            () => ArtifactInfoRouteArgs(
              artifactId: pathParams.getInt('artifactId'),
              title: pathParams.getString('title'),
            ),
      );
      return _i1.ArtifactInfoScreen(
        key: args.key,
        artifactId: args.artifactId,
        title: args.title,
      );
    },
  );
}

class ArtifactInfoRouteArgs {
  const ArtifactInfoRouteArgs({
    this.key,
    required this.artifactId,
    required this.title,
  });

  final _i8.Key? key;

  final int artifactId;

  final String title;

  @override
  String toString() {
    return 'ArtifactInfoRouteArgs{key: $key, artifactId: $artifactId, title: $title}';
  }
}

/// generated route for
/// [_i2.CategoryDetailScreen]
class CategoryDetailRoute extends _i7.PageRouteInfo<CategoryDetailRouteArgs> {
  CategoryDetailRoute({
    _i8.Key? key,
    required int categoryId,
    required String categoryName,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         CategoryDetailRoute.name,
         args: CategoryDetailRouteArgs(
           key: key,
           categoryId: categoryId,
           categoryName: categoryName,
         ),
         rawPathParams: {
           'categoryId': categoryId,
           'categoryName': categoryName,
         },
         initialChildren: children,
       );

  static const String name = 'CategoryDetailRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CategoryDetailRouteArgs>(
        orElse:
            () => CategoryDetailRouteArgs(
              categoryId: pathParams.getInt('categoryId'),
              categoryName: pathParams.getString('categoryName'),
            ),
      );
      return _i2.CategoryDetailScreen(
        key: args.key,
        categoryId: args.categoryId,
        categoryName: args.categoryName,
      );
    },
  );
}

class CategoryDetailRouteArgs {
  const CategoryDetailRouteArgs({
    this.key,
    required this.categoryId,
    required this.categoryName,
  });

  final _i8.Key? key;

  final int categoryId;

  final String categoryName;

  @override
  String toString() {
    return 'CategoryDetailRouteArgs{key: $key, categoryId: $categoryId, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i3.DepartmentsScreen]
class DepartmentsRoute extends _i7.PageRouteInfo<DepartmentsRouteArgs> {
  DepartmentsRoute({_i8.Key? key, List<_i7.PageRouteInfo>? children})
    : super(
        DepartmentsRoute.name,
        args: DepartmentsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'DepartmentsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DepartmentsRouteArgs>(
        orElse: () => const DepartmentsRouteArgs(),
      );
      return _i3.DepartmentsScreen(key: args.key);
    },
  );
}

class DepartmentsRouteArgs {
  const DepartmentsRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'DepartmentsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i8.Key? key, List<_i7.PageRouteInfo>? children})
    : super(
        HomeRoute.name,
        args: HomeRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return _i4.HomeScreen(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.InfoScreen]
class InfoRoute extends _i7.PageRouteInfo<InfoRouteArgs> {
  InfoRoute({_i8.Key? key, List<_i7.PageRouteInfo>? children})
    : super(
        InfoRoute.name,
        args: InfoRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'InfoRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InfoRouteArgs>(
        orElse: () => const InfoRouteArgs(),
      );
      return _i5.InfoScreen(key: args.key);
    },
  );
}

class InfoRouteArgs {
  const InfoRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'InfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SearchScreen]
class SearchRoute extends _i7.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i8.Key? key,
    required String query,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         SearchRoute.name,
         args: SearchRouteArgs(key: key, query: query),
         rawPathParams: {'query': query},
         initialChildren: children,
       );

  static const String name = 'SearchRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<SearchRouteArgs>(
        orElse: () => SearchRouteArgs(query: pathParams.getString('query')),
      );
      return _i6.SearchScreen(key: args.key, query: args.query);
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key, required this.query});

  final _i8.Key? key;

  final String query;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, query: $query}';
  }
}
