import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:neon_app_case/router/app_router.dart';
import 'package:neon_app_case/services/api_service/components/api_error_dialog.dart';

enum HttpMethod { get, post, put, delete, patch }

extension ResponseExtension on Response {
  bool get isOk => (statusCode ?? 0) >= 200 && (statusCode ?? 0) < 300;
}

class ApiService extends GetxService {
  final Dio _client = Dio();
  late final Widget? _loadingWidget;
  final _loadingCount = 0.obs;
  bool _loadingShowing = false;
  final AppRouter _appRouter;

  ApiService(
      {required Duration requestTimeout,
      Duration? responseTimeout,
      Widget? loadingWidget,
      required AppRouter appRouter})
      : _appRouter = appRouter {
    _client.options.connectTimeout = requestTimeout;
    _client.options.receiveTimeout = responseTimeout;
    _loadingWidget = loadingWidget;
    _loadingCount.addListener(() {
      if (_loadingCount.value > 0 && !_loadingShowing) {
        _loadingShowing = true;
        final context = _appRouter.navigatorKey.currentContext;
        if (context != null && context.mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
                child: _loadingWidget ?? const CircularProgressIndicator()),
          );
        }
      }
      if (_loadingCount.value == 0 && _loadingShowing) {
        _loadingShowing = false;
        _appRouter.navigatorKey.currentContext?.pop();
      }
    });
  }

  static ApiService get to => Get.find<ApiService>();

  Future<Response<T>> request<T>({
    required HttpMethod method,
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? contentType = Headers.jsonContentType,
    ResponseType? responseType = ResponseType.json,
    bool? showLoading,
    bool? showError,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    Duration? timeout,
    Map<String, dynamic>? headers,
  }) {
    if (showLoading ?? false) {
      _loadingCount.value++;
    }
    return _client
        .request<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      options: Options(
        responseType: responseType,
        method: method.name.toUpperCase(),
        sendTimeout: timeout,
        receiveTimeout: timeout,
        headers: headers,
        contentType: contentType,
      ),
    )
        .then((response) {
      if ((showLoading ?? false) && _loadingCount.value > 0) {
        _loadingCount.value--;
      }
      return response;
    }).catchError((e) {
      if ((showLoading ?? false) && _loadingCount.value > 0) {
        _loadingCount.value--;
      }
      if (showError ?? false) {
        if (e is DioException) {
          final context = _appRouter.navigatorKey.currentContext;
          if (context != null && context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => ApiErrorDialog(
                message: e.response?.data["message"] ?? "UNKNOWN_ERROR",
              ),
            );
          }
        } else {
          throw e;
        }
      }
      return Future.value(
        Response<T>(
          requestOptions: RequestOptions(path: path),
          statusCode: e is DioException ? e.response?.statusCode : 500,
          statusMessage:
              e is DioException ? e.response?.statusMessage : e.toString(),
          data: e is DioException ? e.response?.data : null,
        ),
      ).then((response) {
        return Future.value(response);
      });
    });
  }
}
