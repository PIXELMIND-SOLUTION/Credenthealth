// import 'package:flutter/material.dart';

// class EnhancedWalkingAnimation extends StatefulWidget {
//   final bool isWalking;
//   final Color activeColor;
//   final double size;
//   final Duration walkingSpeed;

//   const EnhancedWalkingAnimation({
//     Key? key,
//     required this.isWalking,
//     this.activeColor = Colors.green,
//     this.size = 24.0,
//     this.walkingSpeed = const Duration(milliseconds: 400),
//   }) : super(key: key);

//   @override
//   State<EnhancedWalkingAnimation> createState() => _EnhancedWalkingAnimationState();
// }

// class _EnhancedWalkingAnimationState extends State<EnhancedWalkingAnimation>
//     with TickerProviderStateMixin {
//   late AnimationController _walkController;
//   late AnimationController _colorController;
//   late AnimationController _swayController;
  
//   late Animation<double> _verticalBounce;
//   late Animation<double> _horizontalSway;
//   late Animation<double> _rotation;
//   late Animation<Color?> _colorAnimation;

//   @override
//   void initState() {
//     super.initState();
    
//     // Main walking animation controller
//     _walkController = AnimationController(
//       duration: widget.walkingSpeed,
//       vsync: this,
//     );
    
//     // Color animation controller
//     _colorController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );

//     // Subtle sway controller for more natural movement
//     _swayController = AnimationController(
//       duration: Duration(milliseconds: widget.walkingSpeed.inMilliseconds * 2),
//       vsync: this,
//     );

//     // Vertical bouncing motion
//     _verticalBounce = Tween<double>(
//       begin: 0.0,
//       end: -6.0,
//     ).animate(CurvedAnimation(
//       parent: _walkController,
//       curve: Curves.easeInOut,
//     ));

//     // Horizontal swaying motion
//     _horizontalSway = Tween<double>(
//       begin: -1.5,
//       end: 1.5,
//     ).animate(CurvedAnimation(
//       parent: _swayController,
//       curve: Curves.easeInOut,
//     ));

//     // Subtle rotation for more dynamic feel
//     _rotation = Tween<double>(
//       begin: -0.05,
//       end: 0.05,
//     ).animate(CurvedAnimation(
//       parent: _walkController,
//       curve: Curves.easeInOut,
//     ));

//     // Color animation
//     _colorAnimation = ColorTween(
//       begin: Colors.grey,
//       end: widget.activeColor,
//     ).animate(_colorController);

//     if (widget.isWalking) {
//       _startWalkingAnimation();
//     }
//   }

//   void _startWalkingAnimation() {
//     _colorController.forward();
//     _walkController.repeat(reverse: true);
//     _swayController.repeat(reverse: true);
//   }

//   void _stopWalkingAnimation() {
//     _colorController.reverse();
//     _walkController.stop();
//     _swayController.stop();
//     _walkController.reset();
//     _swayController.reset();
//   }

//   @override
//   void didUpdateWidget(EnhancedWalkingAnimation oldWidget) {
//     super.didUpdateWidget(oldWidget);
    
//     if (widget.isWalking != oldWidget.isWalking) {
//       if (widget.isWalking) {
//         _startWalkingAnimation();
//       } else {
//         _stopWalkingAnimation();
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _walkController.dispose();
//     _colorController.dispose();
//     _swayController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: Listenable.merge([
//         _walkController,
//         _colorController,
//         _swayController,
//       ]),
//       builder: (context, child) {
//         return Transform.translate(
//           offset: Offset(_horizontalSway.value, _verticalBounce.value),
//           child: Transform.rotate(
//             angle: _rotation.value,
//             child: Icon(
//               Icons.directions_walk,
//               size: widget.size,
//               color: _colorAnimation.value,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // Alternative realistic walking animation with step-by-step motion
// class SteppingWalkAnimation extends StatefulWidget {
//   final bool isWalking;
//   final Color activeColor;
//   final double size;

//   const SteppingWalkAnimation({
//     Key? key,
//     required this.isWalking,
//     this.activeColor = Colors.green,
//     this.size = 24.0,
//   }) : super(key: key);

//   @override
//   State<SteppingWalkAnimation> createState() => _SteppingWalkAnimationState();
// }

// class _SteppingWalkAnimationState extends State<SteppingWalkAnimation>
//     with TickerProviderStateMixin {
//   late AnimationController _stepController;
//   late AnimationController _colorController;
  
//   late Animation<double> _stepAnimation;
//   late Animation<double> _bobAnimation;
//   late Animation<Color?> _colorAnimation;

//   @override
//   void initState() {
//     super.initState();
    
//     _stepController = AnimationController(
//       duration: const Duration(milliseconds: 350),
//       vsync: this,
//     );
    
//     _colorController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );

//     // Step motion - creates a stepping rhythm
//     _stepAnimation = TweenSequence([
//       TweenSequenceItem(
//         tween: Tween<double>(begin: 0.0, end: -4.0)
//             .chain(CurveTween(curve: Curves.easeOut)),
//         weight: 25,
//       ),
//       TweenSequenceItem(
//         tween: Tween<double>(begin: -4.0, end: -6.0)
//             .chain(CurveTween(curve: Curves.easeInOut)),
//         weight: 25,
//       ),
//       TweenSequenceItem(
//         tween: Tween<double>(begin: -6.0, end: -2.0)
//             .chain(CurveTween(curve: Curves.easeIn)),
//         weight: 25,
//       ),
//       TweenSequenceItem(
//         tween: Tween<double>(begin: -2.0, end: 0.0)
//             .chain(CurveTween(curve: Curves.bounceOut)),
//         weight: 25,
//       ),
//     ]).animate(_stepController);

//     // Subtle bobbing motion
//     _bobAnimation = Tween<double>(
//       begin: 0.0,
//       end: -2.0,
//     ).animate(CurvedAnimation(
//       parent: _stepController,
//       curve: Curves.easeInOut,
//     ));

//     _colorAnimation = ColorTween(
//       begin: Colors.grey,
//       end: widget.activeColor,
//     ).animate(_colorController);

//     if (widget.isWalking) {
//       _startWalkingAnimation();
//     }
//   }

//   void _startWalkingAnimation() {
//     _colorController.forward();
//     _stepController.repeat();
//   }

//   void _stopWalkingAnimation() {
//     _colorController.reverse();
//     _stepController.stop();
//     _stepController.reset();
//   }

//   @override
//   void didUpdateWidget(SteppingWalkAnimation oldWidget) {
//     super.didUpdateWidget(oldWidget);
    
//     if (widget.isWalking != oldWidget.isWalking) {
//       if (widget.isWalking) {
//         _startWalkingAnimation();
//       } else {
//         _stopWalkingAnimation();
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _stepController.dispose();
//     _colorController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: Listenable.merge([_stepController, _colorController]),
//       builder: (context, child) {
//         return Transform.translate(
//           offset: Offset(0, _stepAnimation.value + _bobAnimation.value),
//           child: Icon(
//             Icons.directions_walk,
//             size: widget.size,
//             color: _colorAnimation.value,
//           ),
//         );
//       },
//     );
//   }
// }

// // Usage example widget
// class WalkingAnimationDemo extends StatefulWidget {
//   @override
//   State<WalkingAnimationDemo> createState() => _WalkingAnimationDemoState();
// }

// class _WalkingAnimationDemoState extends State<WalkingAnimationDemo> {
//   bool _isWalking = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Walking Animation Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Enhanced Walking Animation',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             SizedBox(height: 20),
//             EnhancedWalkingAnimation(
//               isWalking: _isWalking,
//               activeColor: Colors.blue,
//               size: 48.0,
//               walkingSpeed: Duration(milliseconds: 300),
//             ),
//             SizedBox(height: 40),
//             Text(
//               'Stepping Animation',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             SizedBox(height: 20),
//             SteppingWalkAnimation(
//               isWalking: _isWalking,
//               activeColor: Colors.orange,
//               size: 48.0,
//             ),
//             SizedBox(height: 40),
//             Text(
//               'Original Bounce Animation',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             SizedBox(height: 20),
//             WalkingAnimationWidget(
//               isWalking: _isWalking,
//               activeColor: Colors.green,
//               size: 48.0,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _isWalking = !_isWalking;
//           });
//         },
//         child: Icon(_isWalking ? Icons.pause : Icons.play_arrow),
//       ),
//     );
//   }
// }

// // Your original animations for reference
// class WalkingAnimationWidget extends StatefulWidget {
//   final bool isWalking;
//   final Color activeColor;
//   final double size;

//   const WalkingAnimationWidget({
//     Key? key,
//     required this.isWalking,
//     this.activeColor = Colors.green,
//     this.size = 24.0,
//   }) : super(key: key);

//   @override
//   State<WalkingAnimationWidget> createState() => _WalkingAnimationWidgetState();
// }

// class _WalkingAnimationWidgetState extends State<WalkingAnimationWidget>
//     with TickerProviderStateMixin {
//   late AnimationController _bounceController;
//   late AnimationController _colorController;
//   late Animation<double> _bounceAnimation;
//   late Animation<Color?> _colorAnimation;

//   @override
//   void initState() {
//     super.initState();
    
//     _bounceController = AnimationController(
//       duration: const Duration(milliseconds: 600),
//       vsync: this,
//     );
    
//     _bounceAnimation = Tween<double>(
//       begin: 0.0,
//       end: -8.0,
//     ).animate(CurvedAnimation(
//       parent: _bounceController,
//       curve: Curves.easeInOut,
//     ));

//     _colorController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );

//     _colorAnimation = ColorTween(
//       begin: Colors.grey,
//       end: widget.activeColor,
//     ).animate(_colorController);

//     if (widget.isWalking) {
//       _startWalkingAnimation();
//     }
//   }

//   void _startWalkingAnimation() {
//     _colorController.forward();
//     _bounceController.repeat(reverse: true);
//   }

//   void _stopWalkingAnimation() {
//     _colorController.reverse();
//     _bounceController.stop();
//     _bounceController.reset();
//   }

//   @override
//   void didUpdateWidget(WalkingAnimationWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
    
//     if (widget.isWalking != oldWidget.isWalking) {
//       if (widget.isWalking) {
//         _startWalkingAnimation();
//       } else {
//         _stopWalkingAnimation();
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _bounceController.dispose();
//     _colorController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: Listenable.merge([_bounceAnimation, _colorAnimation]),
//       builder: (context, child) {
//         return Transform.translate(
//           offset: Offset(0, _bounceAnimation.value),
//           child: Icon(
//             Icons.directions_walk,
//             size: widget.size,
//             color: _colorAnimation.value,
//           ),
//         );
//       },
//     );
//   }
// }

















import 'dart:math';

import 'package:flutter/material.dart';

class WalkingLegAnimation extends StatefulWidget {
  final bool isWalking;
  final Color activeColor;
  final double size;
  final Duration walkingSpeed;

  const WalkingLegAnimation({
    Key? key,
    required this.isWalking,
    this.activeColor = Colors.green,
    this.size = 24.0,
    this.walkingSpeed = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<WalkingLegAnimation> createState() => _WalkingLegAnimationState();
}

class _WalkingLegAnimationState extends State<WalkingLegAnimation>
    with TickerProviderStateMixin {
  late AnimationController _walkController;
  late AnimationController _colorController;
  
  late Animation<double> _leftLegRotation;
  late Animation<double> _rightLegRotation;
  late Animation<double> _leftArmRotation;
  late Animation<double> _rightArmRotation;
  late Animation<double> _bodyBob;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    
    _walkController = AnimationController(
      duration: widget.walkingSpeed,
      vsync: this,
    );
    
    _colorController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Left leg moves forward then back
    _leftLegRotation = Tween<double>(
      begin: -0.3, // back position
      end: 0.3,    // forward position
    ).animate(CurvedAnimation(
      parent: _walkController,
      curve: Curves.easeInOut,
    ));

    // Right leg moves opposite to left leg
    _rightLegRotation = Tween<double>(
      begin: 0.3,  // forward position
      end: -0.3,   // back position
    ).animate(CurvedAnimation(
      parent: _walkController,
      curve: Curves.easeInOut,
    ));

    // Arms move opposite to their corresponding legs
    _leftArmRotation = Tween<double>(
      begin: 0.2,  // forward when left leg is back
      end: -0.2,   // back when left leg is forward
    ).animate(CurvedAnimation(
      parent: _walkController,
      curve: Curves.easeInOut,
    ));

    _rightArmRotation = Tween<double>(
      begin: -0.2, // back when right leg is forward
      end: 0.2,    // forward when right leg is back
    ).animate(CurvedAnimation(
      parent: _walkController,
      curve: Curves.easeInOut,
    ));

    // Subtle body bobbing
    _bodyBob = Tween<double>(
      begin: 0.0,
      end: -2.0,
    ).animate(CurvedAnimation(
      parent: _walkController,
      curve: Curves.easeInOut,
    ));

    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: widget.activeColor,
    ).animate(_colorController);

    if (widget.isWalking) {
      _startWalkingAnimation();
    }
  }

  void _startWalkingAnimation() {
    _colorController.forward();
    _walkController.repeat(reverse: true);
  }

  void _stopWalkingAnimation() {
    _colorController.reverse();
    _walkController.stop();
    _walkController.reset();
  }

  @override
  void didUpdateWidget(WalkingLegAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isWalking != oldWidget.isWalking) {
      if (widget.isWalking) {
        _startWalkingAnimation();
      } else {
        _stopWalkingAnimation();
      }
    }
  }

  @override
  void dispose() {
    _walkController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_walkController, _colorController]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _bodyBob.value),
          child: SizedBox(
            width: widget.size * 1.5,
            height: widget.size * 1.5,
            child: CustomPaint(
              painter: WalkingPersonPainter(
                leftLegAngle: _leftLegRotation.value,
                rightLegAngle: _rightLegRotation.value,
                leftArmAngle: _leftArmRotation.value,
                rightArmAngle: _rightArmRotation.value,
                color: _colorAnimation.value ?? Colors.grey,
                size: widget.size,
              ),
            ),
          ),
        );
      },
    );
  }
}

class WalkingPersonPainter extends CustomPainter {
  final double leftLegAngle;
  final double rightLegAngle;
  final double leftArmAngle;
  final double rightArmAngle;
  final Color color;
  final double size;

  WalkingPersonPainter({
    required this.leftLegAngle,
    required this.rightLegAngle,
    required this.leftArmAngle,
    required this.rightArmAngle,
    required this.color,
    required this.size,
  });

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size * 0.1
      ..strokeCap = StrokeCap.round;

    final center = Offset(canvasSize.width / 2, canvasSize.height / 2);
    final bodyHeight = size * 0.8;
    final legLength = size * 0.5;
    final armLength = size * 0.4;

    // Head
    canvas.drawCircle(
      center + Offset(0, -bodyHeight * 0.7),
      size * 0.15,
      paint,
    );

    // Body
    canvas.drawLine(
      center + Offset(0, -bodyHeight * 0.5),
      center + Offset(0, bodyHeight * 0.2),
      paint,
    );

    // Left Leg
    final leftLegEnd = Offset(
      center.dx + legLength * 0.8 * sin(leftLegAngle),
      center.dy + bodyHeight * 0.2 + legLength * cos(leftLegAngle),
    );
    canvas.drawLine(
      center + Offset(0, bodyHeight * 0.2),
      leftLegEnd,
      paint,
    );

    // Right Leg
    final rightLegEnd = Offset(
      center.dx + legLength * 0.8 * sin(rightLegAngle),
      center.dy + bodyHeight * 0.2 + legLength * cos(rightLegAngle),
    );
    canvas.drawLine(
      center + Offset(0, bodyHeight * 0.2),
      rightLegEnd,
      paint,
    );

    // Left Arm
    final leftArmEnd = Offset(
      center.dx + armLength * 0.8 * sin(leftArmAngle),
      center.dy - bodyHeight * 0.2 + armLength * 0.5 * cos(leftArmAngle),
    );
    canvas.drawLine(
      center + Offset(0, -bodyHeight * 0.2),
      leftArmEnd,
      paint,
    );

    // Right Arm
    final rightArmEnd = Offset(
      center.dx + armLength * 0.8 * sin(rightArmAngle),
      center.dy - bodyHeight * 0.2 + armLength * 0.5 * cos(rightArmAngle),
    );
    canvas.drawLine(
      center + Offset(0, -bodyHeight * 0.2),
      rightArmEnd,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Alternative version using the walking icon with transform effects
class IconWalkingAnimation extends StatefulWidget {
  final bool isWalking;
  final Color activeColor;
  final double size;
  final Duration walkingSpeed;

  const IconWalkingAnimation({
    Key? key,
    required this.isWalking,
    this.activeColor = Colors.green,
    this.size = 24.0,
    this.walkingSpeed = const Duration(milliseconds: 600),
  }) : super(key: key);

  @override
  State<IconWalkingAnimation> createState() => _IconWalkingAnimationState();
}

class _IconWalkingAnimationState extends State<IconWalkingAnimation>
    with TickerProviderStateMixin {
  late AnimationController _walkController;
  late AnimationController _colorController;
  
  late Animation<double> _horizontalMove;
  late Animation<double> _skewTransform;
  late Animation<double> _scaleTransform;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    
    _walkController = AnimationController(
      duration: widget.walkingSpeed,
      vsync: this,
    );
    
    _colorController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Horizontal movement to simulate walking
    _horizontalMove = Tween<double>(
      begin: -2.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _walkController,
      curve: Curves.easeInOut,
    ));

    // Skew transform to simulate leg movement
    _skewTransform = Tween<double>(
      begin: -0.1,
      end: 0.1,
    ).animate(CurvedAnimation(
      parent: _walkController,
      curve: Curves.easeInOut,
    ));

    // Scale transform for stepping effect
    _scaleTransform = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.05),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.05, end: 1.0),
        weight: 50,
      ),
    ]).animate(_walkController);

    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: widget.activeColor,
    ).animate(_colorController);

    if (widget.isWalking) {
      _startWalkingAnimation();
    }
  }

  void _startWalkingAnimation() {
    _colorController.forward();
    _walkController.repeat(reverse: true);
  }

  void _stopWalkingAnimation() {
    _colorController.reverse();
    _walkController.stop();
    _walkController.reset();
  }

  @override
  void didUpdateWidget(IconWalkingAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isWalking != oldWidget.isWalking) {
      if (widget.isWalking) {
        _startWalkingAnimation();
      } else {
        _stopWalkingAnimation();
      }
    }
  }

  @override
  void dispose() {
    _walkController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_walkController, _colorController]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_horizontalMove.value, 0),
          child: Transform.scale(
            scale: _scaleTransform.value,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..setEntry(0, 1, _skewTransform.value),
              child: Icon(
                Icons.directions_walk,
                size: widget.size,
                color: _colorAnimation.value,
              ),
            ),
          ),
        );
      },
    );
  }
}

// Demo widget to test both animations
class WalkingLegAnimationDemo extends StatefulWidget {
  @override
  State<WalkingLegAnimationDemo> createState() => _WalkingLegAnimationDemoState();
}

class _WalkingLegAnimationDemoState extends State<WalkingLegAnimationDemo> {
  bool _isWalking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Walking Leg Animation Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Custom Stick Figure Walking',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            WalkingLegAnimation(
              isWalking: _isWalking,
              activeColor: Colors.blue,
              size: 60.0,
              walkingSpeed: Duration(milliseconds: 400),
            ),
            SizedBox(height: 60),
            Text(
              'Enhanced Icon Walking',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            IconWalkingAnimation(
              isWalking: _isWalking,
              activeColor: Colors.orange,
              size: 48.0,
              walkingSpeed: Duration(milliseconds: 500),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isWalking = !_isWalking;
          });
        },
        child: Icon(_isWalking ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}