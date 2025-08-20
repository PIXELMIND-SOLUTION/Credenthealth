import 'package:flutter/material.dart';

/// Professional "Coming Soon" screen with subtle entrance animations.
///
/// Usage: Place this file in your lib/ folder and push it with
/// `Navigator.push(context, MaterialPageRoute(builder: (_) => const ComingSoonScreen()));`
class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({super.key});

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fadeIn;
  late final Animation<Offset> _slideUp;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _fadeIn = CurvedAnimation(parent: _ctrl, curve: const Interval(0.0, 0.6, curve: Curves.easeOut));

    _slideUp = Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero)
        .animate(CurvedAnimation(parent: _ctrl, curve: const Interval(0.2, 0.85, curve: Curves.easeOut)));

    _pulse = Tween<double>(begin: 0.95, end: 1.06).animate(CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.6, 1.0, curve: Curves.elasticOut),
    ));

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.primary.withOpacity(0.12),
                  theme.colorScheme.secondary.withOpacity(0.06),
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // IconButton(
                        //   icon: const Icon(Icons.arrow_back),
                        //   onPressed: () => Navigator.maybePop(context),
                        //   tooltip: 'Back',
                        // ),
                        // TextButton(
                        //   onPressed: () {},
                        //   child: const Text('Notify me'),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: FadeTransition(
                        opacity: _fadeIn,
                        child: SlideTransition(
                          position: _slideUp,
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 720),
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                                child: Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ScaleTransition(
                                        scale: _pulse,
                                        child: _LogoCircle(theme: theme),
                                      ),
                                      const SizedBox(height: 18),
                                      Text(
                                        'Coming Soon',
                                        style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'We\'re putting the final touches on something great',
                                        style: theme.textTheme.bodyLarge,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 20),
                                      // _SubscribeRow(),
                                      const SizedBox(height: 20),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   children: [
                                      //     _FeatureDot(active: true, label: 'Product pages'),
                                      //     const SizedBox(width: 8),
                                      //     _FeatureDot(active: false, label: 'Secure checkout'),
                                      //     const SizedBox(width: 8),
                                      //     _FeatureDot(active: false, label: 'Mobile app'),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     '© ${DateTime.now().year} Your Company',
                    //     style: theme.textTheme.caption,
                    //   ),
                    // ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LogoCircle extends StatelessWidget {
  const _LogoCircle({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'App logo',
      child: Container(
        width: 92,
        height: 92,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [theme.colorScheme.primary, theme.colorScheme.secondary]),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.pets,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _SubscribeRow extends StatefulWidget {
  @override
  State<_SubscribeRow> createState() => _SubscribeRowState();
}

class _SubscribeRowState extends State<_SubscribeRow> {
  final _controller = TextEditingController();
  bool _subscribed = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _doSubscribe() {
    final email = _controller.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      // simple validation feedback
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a valid email')));
      return;
    }

    setState(() => _subscribed = true);

    // TODO: wire up real subscription (API / Firebase / analytics)
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thanks — we\'ll notify you!')));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: TextField(
        //     controller: _controller,
        //     keyboardType: TextInputType.emailAddress,
        //     decoration: InputDecoration(
        //       hintText: 'Enter your email',
        //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        //       isDense: true,
        //     ),
        //   ),
        // ),
        // const SizedBox(width: 12),
        // ElevatedButton(
        //   onPressed: _subscribed ? null : _doSubscribe,
        //   style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
        //     child: Text(_subscribed ? 'Subscribed' : 'Subscribe'),
        //   ),
        // )
      ],
    );
  }
}

class _FeatureDot extends StatelessWidget {
  const _FeatureDot({required this.active, required this.label});

  final bool active;
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = active ? Theme.of(context).colorScheme.primary : Colors.black26;
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        // Text(label, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
