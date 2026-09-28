import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  void _sendResetLink() {
    final username = usernameController.text.trim();

    if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your username or email.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset request submitted.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Desktop: standardized One Enterprise left panel + the original
            // Forgot Password form unchanged on the right.
            if (constraints.maxWidth >= 900) {
              return Row(
                children: [
                  Expanded(child: _buildLeftSection()),
                  Expanded(child: _buildRightSection()),
                ],
              );
            }

            // Mobile/tablet: keep the original Forgot Password experience.
            return _buildRightSection();
          },
        ),
      ),
    );
  }

  // ============================================================
  // DESKTOP LEFT SECTION
  // ============================================================

  Widget _buildLeftSection() {
    // The reference artwork is based on a 600 x 817 design canvas.
    // The coordinates below intentionally follow that canvas so the
    // left panel keeps the same proportions at different desktop sizes.
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFF0F1330),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final sx = constraints.maxWidth / 600.0;
          final sy = constraints.maxHeight / 817.0;
          final textScale = sx < sy ? sx : sy;

          double x(double value) => value * sx;
          double y(double value) => value * sy;
          double t(double value) => value * textScale;

          return Stack(
            fit: StackFit.expand,
            children: [
              const Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.52, 1.0],
                      colors: [
                        Color(0xFF151B3F),
                        Color(0xFF0F1330),
                        Color(0xFF0C1028),
                      ],
                    ),
                  ),
                ),
              ),

              // ------------------------------------------------------
              // BRAND
              // ------------------------------------------------------
              Positioned(
                left: x(69),
                top: y(42),
                child: Row(
                  children: [
                    Container(
                      width: t(23),
                      height: t(23),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(t(6)),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFF0B72E), Color(0xFF69D8C2)],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '1E',
                        style: TextStyle(
                          fontSize: t(8.8),
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.25,
                          color: const Color(0xFF111530),
                        ),
                      ),
                    ),
                    SizedBox(width: t(11)),
                    Text(
                      'One Enterprise',
                      style: TextStyle(
                        fontSize: t(15.5),
                        height: 1.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // ------------------------------------------------------
              // CATEGORY LINE
              // ------------------------------------------------------
              Positioned(
                left: x(69),
                top: y(213),
                right: x(42),
                child: Text(
                  'CLOUD PLATFORM  ·  HRMS  ·  CRM  ·  ERP  ·  FINANCE  ·  AI',
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: t(9.2),
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: t(2.55),
                    color: const Color(0xFF35D3D2),
                  ),
                ),
              ),

              // ------------------------------------------------------
              // MAIN HEADING
              // ------------------------------------------------------
              Positioned(
                left: x(69),
                top: y(243),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Every operation.',
                      style: TextStyle(
                        fontSize: t(36),
                        height: 1.04,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1.15 * textScale,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: t(1)),
                    Text(
                      'One sign-in.',
                      style: TextStyle(
                        fontSize: t(36),
                        height: 1.04,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1.15 * textScale,
                        color: const Color(0xFFF2A82B),
                      ),
                    ),
                  ],
                ),
              ),

              // ------------------------------------------------------
              // DESCRIPTION
              // ------------------------------------------------------
              Positioned(
                left: x(69),
                top: y(347),
                right: x(66),
                child: Text(
                  'HR, sales, procurement, finance and your AI copilot – running\n'
                  'on one identity, one policy, one audit trail.',
                  style: TextStyle(
                    fontSize: t(13.2),
                    height: 1.58,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02 * textScale,
                    color: const Color(0xFFB9BED6),
                  ),
                ),
              ),

              // ------------------------------------------------------
              // SYSTEM DIAGRAM
              // ------------------------------------------------------
              Positioned(
                left: x(69),
                top: y(430),
                width: x(499),
                height: y(160),
                child: CustomPaint(
                  painter: _EnterpriseDiagramPainter(),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _diagramTargetLabel(
                        label: 'HRMS',
                        left: x(49),
                        top: y(17),
                        dotOnLeft: true,
                        sx: sx,
                        sy: sy,
                        textScale: textScale,
                      ),
                      _diagramTargetLabel(
                        label: 'CRM',
                        left: x(49),
                        top: y(65),
                        dotOnLeft: true,
                        sx: sx,
                        sy: sy,
                        textScale: textScale,
                      ),
                      _diagramTargetLabel(
                        label: 'ERP',
                        left: x(49),
                        top: y(113),
                        dotOnLeft: true,
                        sx: sx,
                        sy: sy,
                        textScale: textScale,
                      ),
                      _diagramTargetLabel(
                        label: 'FINANCE',
                        right: x(49),
                        top: y(17),
                        dotOnLeft: false,
                        sx: sx,
                        sy: sy,
                        textScale: textScale,
                      ),
                      _diagramTargetLabel(
                        label: 'WORKFLOW',
                        right: x(49),
                        top: y(65),
                        dotOnLeft: false,
                        sx: sx,
                        sy: sy,
                        textScale: textScale,
                      ),
                      _diagramTargetLabel(
                        label: 'ANALYTICS',
                        right: x(49),
                        top: y(113),
                        dotOnLeft: false,
                        sx: sx,
                        sy: sy,
                        textScale: textScale,
                      ),
                      Center(
                        child: Container(
                          width: t(39),
                          height: t(39),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF20285F),
                            border: Border.all(
                              color: const Color(0xFF39468C),
                              width: t(1),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'AI',
                            style: TextStyle(
                              fontSize: t(8.8),
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFA2A9C9),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: t(50),
                          height: t(50),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFC28A28),
                              width: t(1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ------------------------------------------------------
              // TRUST / COMPLIANCE BAR
              // ------------------------------------------------------
              Positioned(
                left: x(69),
                right: x(50),
                top: y(746),
                child: Container(height: 1, color: const Color(0xFF282E48)),
              ),
              Positioned(
                left: x(69),
                right: x(50),
                top: y(774),
                child: Row(
                  children: [
                    _targetTrustItem(
                      Icons.shield_outlined,
                      'SOC 2 Type II',
                      textScale,
                    ),
                    SizedBox(width: t(25)),
                    _targetTrustItem(
                      Icons.lock_outline,
                      'ISO 27001',
                      textScale,
                    ),
                    SizedBox(width: t(25)),
                    _targetTrustItem(
                      Icons.access_time,
                      '99.95% uptime SLA',
                      textScale,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _diagramTargetLabel({
    required String label,
    double? left,
    double? right,
    required double top,
    required bool dotOnLeft,
    required double sx,
    required double sy,
    required double textScale,
  }) {
    final row = Row(
      mainAxisSize: MainAxisSize.min,
      children: dotOnLeft
          ? [
              _diagramTargetDot(textScale),
              SizedBox(width: 8 * textScale),
              Text(
                label,
                style: TextStyle(
                  fontSize: 8.8 * textScale,
                  height: 1,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9AA3C5),
                ),
              ),
            ]
          : [
              Text(
                label,
                style: TextStyle(
                  fontSize: 8.8 * textScale,
                  height: 1,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9AA3C5),
                ),
              ),
              SizedBox(width: 8 * textScale),
              _diagramTargetDot(textScale),
            ],
    );

    return Positioned(left: left, right: right, top: top, child: row);
  }

  Widget _diagramTargetDot(double scale) {
    return Container(
      width: 11 * scale,
      height: 11 * scale,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF252D69),
        border: Border.all(color: const Color(0xFF4C5798), width: 0.9 * scale),
      ),
    );
  }

  Widget _targetTrustItem(IconData icon, String text, double scale) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 10.5 * scale, color: const Color(0xFF8992B3)),
        SizedBox(width: 5 * scale),
        Text(
          text,
          style: TextStyle(
            fontSize: 8.5 * scale,
            height: 1,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.75 * scale,
            color: const Color(0xFF8992B3),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // ORIGINAL FORGOT PASSWORD FORM
  // ============================================================

  Widget _buildRightSection() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  padding: EdgeInsets.zero,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF172033),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Enter your username or email address and '
                  'we will help you reset your password.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF6B7890),
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'Username or Email',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF27344D),
                  ),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter username or email',
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFD9E1EC)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xFF1976D2),
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _sendResetLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1976D2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Send Reset Link',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back to Login',
                      style: TextStyle(
                        color: Color(0xFF1976D2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EnterpriseDiagramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Coordinates are normalized to the 499 x 160 reference diagram.
    final sx = size.width / 499.0;
    final sy = size.height / 160.0;
    final center = Offset(size.width / 2, size.height / 2);

    final leftX = 20.0 * sx;
    final rightX = size.width - 20.0 * sx;
    final topY = 23.0 * sy;
    final middleY = 80.0 * sy;
    final bottomY = 137.0 * sy;

    final centerLeft = Offset(center.dx - 25.0 * sx, center.dy);
    final centerRight = Offset(center.dx + 25.0 * sx, center.dy);

    final solidPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.9 * (sx < sy ? sx : sy)
      ..color = const Color(0xFF2A969C).withValues(alpha: 0.95);

    final dashedPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.85 * (sx < sy ? sx : sy)
      ..color = const Color(0xFF34427D).withValues(alpha: 0.9);

    final leftTop = Path()
      ..moveTo(leftX, topY)
      ..cubicTo(
        size.width * 0.30,
        topY,
        size.width * 0.40,
        center.dy - 22 * sy,
        centerLeft.dx,
        center.dy,
      );

    final leftMiddle = Path()
      ..moveTo(leftX, middleY)
      ..lineTo(centerLeft.dx, middleY);

    final leftBottom = Path()
      ..moveTo(leftX, bottomY)
      ..cubicTo(
        size.width * 0.30,
        bottomY,
        size.width * 0.40,
        center.dy + 22 * sy,
        centerLeft.dx,
        center.dy,
      );

    final rightTop = Path()
      ..moveTo(rightX, topY)
      ..cubicTo(
        size.width * 0.70,
        topY,
        size.width * 0.60,
        center.dy - 22 * sy,
        centerRight.dx,
        center.dy,
      );

    final rightMiddle = Path()
      ..moveTo(centerRight.dx, middleY)
      ..lineTo(rightX, middleY);

    final rightBottom = Path()
      ..moveTo(centerRight.dx, center.dy)
      ..cubicTo(
        size.width * 0.60,
        center.dy + 22 * sy,
        size.width * 0.70,
        bottomY,
        rightX,
        bottomY,
      );

    canvas.drawPath(leftTop, solidPaint);
    canvas.drawPath(leftMiddle, solidPaint);
    _drawDashedPath(canvas, leftBottom, dashedPaint);

    canvas.drawPath(rightTop, solidPaint);
    _drawDashedPath(canvas, rightMiddle, dashedPaint);
    _drawDashedPath(canvas, rightBottom, dashedPaint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    for (final metric in path.computeMetrics()) {
      final dashLength = 4.5 * (paint.strokeWidth / 0.85);
      final gapLength = 5.0 * (paint.strokeWidth / 0.85);
      var distance = 0.0;

      while (distance < metric.length) {
        final end = (distance + dashLength).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _EnterpriseDiagramPainter oldDelegate) => false;
}
