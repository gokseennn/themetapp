import 'package:flutter/material.dart';

class CachedNetworkImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Duration fadeInDuration;

  const CachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.fadeInDuration = const Duration(milliseconds: 300),
  });

  @override
  State<CachedNetworkImage> createState() => _CachedNetworkImageState();
}

class _CachedNetworkImageState extends State<CachedNetworkImage> {
  String? _previousUrl;
  int? _safeCacheWidth;
  int? _safeCacheHeight;
  late NetworkImage _networkImage;

  @override
  void initState() {
    super.initState();
    _updateCacheDimensions();
    _initNetworkImage();
  }

  void _initNetworkImage() {
    _networkImage = NetworkImage(widget.imageUrl);
    _previousUrl = widget.imageUrl;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImage();
  }

  @override
  void didUpdateWidget(CachedNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);

    // URL değiştiyse network image ve önbellekleme güncelleniyor
    if (oldWidget.imageUrl != widget.imageUrl) {
      _initNetworkImage();
      _precacheImage();
    }

    // Boyutlar değiştiyse güvenli boyutları güncelle
    if (oldWidget.width != widget.width || oldWidget.height != widget.height) {
      _updateCacheDimensions();
    }
  }

  void _updateCacheDimensions() {
    _safeCacheWidth = _getValidDimension(widget.width);
    _safeCacheHeight = _getValidDimension(widget.height);
  }

  void _precacheImage() {
    if (_previousUrl == widget.imageUrl) return;
    precacheImage(_networkImage, context);
  }

  int? _getValidDimension(double? dimension) {
    if (dimension == null ||
        dimension.isNaN ||
        dimension.isInfinite ||
        dimension <= 0) {
      return null;
    }
    return dimension.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: ResizeImage(
        _networkImage,
        width: _safeCacheWidth,
        height: _safeCacheHeight,
      ),
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return FadeTransition(
            opacity: frame == null
                ? const AlwaysStoppedAnimation(1.0)
                : Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: ModalRoute.of(context)?.animation ??
                          const AlwaysStoppedAnimation(1.0),
                      curve: Interval(0.0, 1.0, curve: Curves.easeOut),
                    ),
                  ),
            child: child,
          );
        } else {
          return widget.placeholder ?? _defaultLoadingWidget();
        }
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return widget.placeholder ?? _defaultLoadingWidget();
      },
      errorBuilder: (context, error, stackTrace) {
        return widget.errorWidget ?? _defaultErrorWidget();
      },
    );
  }

  Widget _defaultLoadingWidget() {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.grey[200],
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _defaultErrorWidget() {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.grey[200],
      child: const Icon(
        Icons.error_outline,
        color: Colors.red,
      ),
    );
  }
}
