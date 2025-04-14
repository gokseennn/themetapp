import 'package:flutter/material.dart';

class ResponsiveUtil {
  /// Gives screen size based value for mobile devices.
  /// [xs] < 360px (Küçük telefonlar)
  /// [s] ≥ 360px (Orta boy telefonlar)
  /// [m] ≥ 480px (Büyük telefonlar)
  /// [l] ≥ 600px (Tabletler)
  static T value<T>({
    required BuildContext context,
    T? xs,
    T? s,
    T? m,
    T? l,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final values = [xs, s, m, l];
    if (values.where((v) => v == null).length == values.length) {
      throw "At least one value must be given!";
    }
    final nonNull = values.firstWhere((v) => v != null) as T;
    if (nonNull is! num) {
      if (values.where((v) => v == null).isNotEmpty) {
        throw "All values must be given on non numeric type!";
      }
    }
    if (screenWidth >= 600) {
      if (nonNull is num) {
        return l ?? _getOptimalValue(nonNull, 4, 4) as T;
      } else {
        return l!;
      }
    } else if (screenWidth >= 480) {
      if (nonNull is num) {
        return m ?? _getOptimalValue(nonNull, 3, 4) as T;
      } else {
        return m!;
      }
    } else if (screenWidth >= 360) {
      if (nonNull is num) {
        return s ?? _getOptimalValue(nonNull, 2, 4) as T;
      } else {
        return s!;
      }
    } else {
      if (nonNull is num) {
        return xs ?? _getOptimalValue(nonNull, 1, 4) as T;
      } else {
        return xs!;
      }
    }
  }

  static num _getOptimalValue<T>(num current, int index, int lenght) {
    final diff = lenght - index;
    late num val;
    if (index > 2) {
      val = current + (diff * (current * .8));
    } else {
      val = current - (diff * (current * .8));
    }
    val = val.abs();
    return current is int
        ? val.toInt()
        : current is double
            ? val.toDouble()
            : val;
  }
}
