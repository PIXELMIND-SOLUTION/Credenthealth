import 'package:flutter/material.dart';

class GifWalkingShoesAnimation extends StatefulWidget {
  final bool isWalking;
  final double size;
  final String? customGifAsset;
  final String? customGifUrl;

  const GifWalkingShoesAnimation({
    Key? key,
    required this.isWalking,
    this.size = 200.0,
    this.customGifAsset, // For local asset GIF
    this.customGifUrl,   // For network GIF
  }) : super(key: key);

  @override
  State<GifWalkingShoesAnimation> createState() => _GifWalkingShoesAnimationState();
}

class _GifWalkingShoesAnimationState extends State<GifWalkingShoesAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    if (widget.isWalking) {
      _startAnimation();
    }
  }

  void _startAnimation() {
    _controller.repeat();
  }

  void _stopAnimation() {
    _controller.stop();
  }

  @override
  void didUpdateWidget(GifWalkingShoesAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isWalking != oldWidget.isWalking) {
      if (widget.isWalking) {
        _startAnimation();
      } else {
        _stopAnimation();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size * 0.8,
      child: _buildGifAnimation(),
    );
  }

  Widget _buildGifAnimation() {
    // Priority: custom asset > custom URL > default fallback
    if (widget.customGifAsset != null) {
      return _buildAssetGif(widget.customGifAsset!);
    } else if (widget.customGifUrl != null) {
      return _buildNetworkGif(widget.customGifUrl!);
    } else {
      return _buildFallbackAnimation();
    }
  }

  Widget _buildAssetGif(String assetPath) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            assetPath,
            width: widget.size,
            height: widget.size * 0.8,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return _buildFallbackAnimation();
            },
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (!widget.isWalking) {
                // If not walking, show only the first frame
                return Container(
                  width: widget.size,
                  height: widget.size * 0.8,
                  child: child,
                );
              }
              return child ?? const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }

  Widget _buildNetworkGif(String url) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            url,
            width: widget.size,
            height: widget.size * 0.8,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: widget.size,
                height: widget.size * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return _buildFallbackAnimation();
            },
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (!widget.isWalking) {
                // If not walking, show only the first frame
                return Container(
                  width: widget.size,
                  height: widget.size * 0.8,
                  child: child,
                );
              }
              return child ?? const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }

  Widget _buildFallbackAnimation() {
    return Container(
      width: widget.size,
      height: widget.size * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: widget.isWalking ? 1.0 + (_controller.value * 0.1) : 1.0,
                child: Icon(
                  Icons.directions_walk,
                  size: widget.size * 0.3,
                  color: widget.isWalking ? Colors.blue : Colors.grey.shade400,
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            widget.isWalking ? 'Walking...' : 'Stopped',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}