import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  // ============================================================
  // LOGIN STATE
  // ============================================================

  bool rememberMe = false;
  bool hidePassword = true;

  bool showOtp = false;
  bool isOtpWrong = false;

  // Demo OTP
  // Later this will come from the Java backend.
  String generatedOtp = '';

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    otpController.dispose();

    super.dispose();
  }

  // ============================================================
  // GENERATE OTP
  // ============================================================

  void generateOtp() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showMessage('Please enter username and password');

      return;
    }

    // Temporary demo OTP.
    // Java backend will generate the real OTP later.
    generatedOtp = '123456';

    otpController.clear();

    setState(() {
      showOtp = true;
      isOtpWrong = false;
    });

    _showMessage('Demo OTP generated: 123456');
  }

  // ============================================================
  // VERIFY OTP
  // ============================================================

  void verifyOtp() {
    final otp = otpController.text.trim();

    if (otp.isEmpty) {
      setState(() {
        isOtpWrong = true;
      });

      return;
    }

    if (otp == generatedOtp) {
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    } else {
      setState(() {
        isOtpWrong = true;
      });
    }
  }

  // ============================================================
  // GOOGLE LOGIN
  // ============================================================

  void googleLogin() {
    _showMessage('Google login will be connected later.');
  }

  // ============================================================
  // APPLE LOGIN
  // ============================================================

  void appleLogin() {
    _showMessage('Apple login will be connected later.');
  }

  // ============================================================
  // MESSAGE
  // ============================================================

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FC),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // ======================================================
            // DESKTOP / LARGE TABLET
            // ======================================================

            if (constraints.maxWidth >= 900) {
              return Row(
                children: [
                  // LEFT BRANDING
                  Expanded(child: _buildLeftSection()),

                  // RIGHT LOGIN
                  Expanded(child: _buildDesktopLoginSection()),
                ],
              );
            }

            // ======================================================
            // MOBILE / SMALL TABLET
            //
            // IMPORTANT:
            // We DO NOT show the large desktop marketing section.
            // This prevents the mobile overflow/layout problem.
            // ======================================================

            return _buildMobileLayout();
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
  // DESKTOP LOGIN SECTION
  // ============================================================

  Widget _buildDesktopLoginSection() {
    return Container(
      width: double.infinity,
      height: double.infinity,

      color: const Color(0xFFFAFBFD),

      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),

        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 600),

          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),

              child: _buildLoginCard(isMobile: false),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE LAYOUT
  // ============================================================

  Widget _buildMobileLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final horizontalPadding = width < 380 ? 16.0 : 22.0;

        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 24,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --------------------------------------------------
              // MOBILE BRAND
              // --------------------------------------------------

              _buildMobileBrand(),

              const SizedBox(height: 24),

              // --------------------------------------------------
              // LOGIN CARD
              // --------------------------------------------------
              _buildLoginCard(isMobile: true),

              const SizedBox(height: 20),

              // --------------------------------------------------
              // MOBILE FOOTER
              // --------------------------------------------------
              _buildMobileFooter(),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // MOBILE BRAND
  // ============================================================

  Widget _buildMobileBrand() {
    return Center(
      child: Column(
        children: [
          // ------------------------------------------------------
          // LOGO
          // ------------------------------------------------------

          Container(
            width: 58,
            height: 58,

            decoration: BoxDecoration(
              color: const Color(0xFF1877F2),
              borderRadius: BorderRadius.circular(16),

              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1877F2).withValues(alpha: 0.20),
                  blurRadius: 18,
                  offset: const Offset(0, 7),
                ),
              ],
            ),

            child: const Icon(
              Icons.cloud_outlined,
              color: Colors.white,
              size: 34,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'OneCloud',

            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1877F2),
            ),
          ),

          const SizedBox(height: 2),

          const Text(
            'Enterprise Platform',

            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF667085),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // LOGIN CARD
  // ============================================================

  Widget _buildLoginCard({required bool isMobile}) {
    final padding = isMobile ? 22.0 : 40.0;

    return Container(
      width: double.infinity,

      padding: EdgeInsets.fromLTRB(
        padding,
        isMobile ? 24 : 36,
        padding,
        isMobile ? 24 : 38,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(isMobile ? 18 : 20),

        border: Border.all(color: const Color(0xFFE6EBF2)),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ======================================================
          // WELCOME
          // ======================================================

          const Text(
            'Welcome Back!',

            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xFF16233B),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Sign in to continue to OneCloud Enterprise Platform.',

            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF667085),
            ),
          ),

          const SizedBox(height: 28),

          // ======================================================
          // USERNAME LABEL
          // ======================================================
          const Text(
            'Username',

            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF344054),
            ),
          ),

          const SizedBox(height: 8),

          // ======================================================
          // USERNAME
          // ======================================================
          TextField(
            controller: usernameController,

            keyboardType: TextInputType.emailAddress,

            textInputAction: TextInputAction.next,

            decoration: _inputDecoration(
              hintText: 'Enter username',
              icon: Icons.person_outline,
            ),
          ),

          const SizedBox(height: 20),

          // ======================================================
          // PASSWORD LABEL + FORGOT
          // ======================================================
          Row(
            children: [
              const Text(
                'Password',

                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF344054),
                ),
              ),

              const Spacer(),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.forgotPassword);
                },

                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),

                child: const Text(
                  'Forgot Password?',

                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1877F2),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ======================================================
          // PASSWORD
          // ======================================================
          TextField(
            controller: passwordController,

            obscureText: hidePassword,

            textInputAction: TextInputAction.done,

            decoration: _inputDecoration(
              hintText: 'Enter your password',
              icon: Icons.lock_outline,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },

                icon: Icon(
                  hidePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,

                  size: 20,

                  color: const Color(0xFF667085),
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          // ======================================================
          // REMEMBER ME
          // ======================================================
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,

                child: Checkbox(
                  value: rememberMe,

                  onChanged: (value) {
                    setState(() {
                      rememberMe = value ?? false;
                    });
                  },

                  activeColor: const Color(0xFF1877F2),

                  side: const BorderSide(color: Color(0xFF98A2B3)),
                ),
              ),

              const SizedBox(width: 8),

              const Text(
                'Remember me',

                style: TextStyle(fontSize: 13, color: Color(0xFF667085)),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // ======================================================
          // GENERATE OTP
          // ======================================================
          if (!showOtp)
            SizedBox(
              height: 52,

              child: ElevatedButton(
                onPressed: generateOtp,

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1877F2),
                  foregroundColor: Colors.white,

                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),

                child: const Text(
                  'Generate OTP',

                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),

          // ======================================================
          // OTP SECTION
          // ======================================================
          if (showOtp) _buildOtpSection(),

          const SizedBox(height: 25),

          // ======================================================
          // OR
          // ======================================================
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey.shade300)),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),

                child: Text(
                  'OR',

                  style: TextStyle(fontSize: 11, color: Color(0xFF98A2B3)),
                ),
              ),

              Expanded(child: Divider(color: Colors.grey.shade300)),
            ],
          ),

          const SizedBox(height: 20),

          // ======================================================
          // GOOGLE
          // ======================================================
          SizedBox(
            height: 50,

            child: OutlinedButton(
              onPressed: googleLogin,

              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,

                side: const BorderSide(color: Color(0xFFE1E6ED)),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const GoogleLogo(),

                  const SizedBox(width: 10),

                  const Text(
                    'Continue with Google',

                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF344054),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ======================================================
          // APPLE
          // ======================================================
          SizedBox(
            height: 50,

            child: OutlinedButton(
              onPressed: appleLogin,

              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,

                side: const BorderSide(color: Color(0xFFE1E6ED)),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Icon(Icons.apple, size: 22, color: Colors.black),

                  const SizedBox(width: 10),

                  const Text(
                    'Continue with Apple',

                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF344054),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ======================================================
          // SIGN UP
          // ======================================================
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Flexible(
                child: Text(
                  "Don't have an account? ",

                  style: TextStyle(fontSize: 13, color: Color(0xFF667085)),
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signup);
                },

                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),

                child: const Text(
                  'Sign Up',

                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1877F2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INPUT DECORATION
  // ============================================================

  InputDecoration _inputDecoration({
    required String hintText,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,

      hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF98A2B3)),

      prefixIcon: Icon(icon, size: 21, color: const Color(0xFF667085)),

      suffixIcon: suffixIcon,

      filled: true,

      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Color(0xFFE1E6ED)),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Color(0xFFE1E6ED)),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Color(0xFF1877F2), width: 1.5),
      ),
    );
  }

  // ============================================================
  // OTP SECTION
  // ============================================================

  Widget _buildOtpSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Enter OTP',

          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF344054),
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: otpController,

          keyboardType: TextInputType.number,

          maxLength: 6,

          textAlign: TextAlign.center,

          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 8,
          ),

          decoration: InputDecoration(
            hintText: '------',

            counterText: '',

            errorText: isOtpWrong ? 'Incorrect OTP' : null,

            filled: true,

            fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE1E6ED)),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE1E6ED)),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF1877F2)),
            ),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 50,

          child: ElevatedButton(
            onPressed: verifyOtp,

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1877F2),
              foregroundColor: Colors.white,

              elevation: 0,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),

            child: const Text(
              'Verify OTP',

              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // MOBILE FOOTER
  // ============================================================

  Widget _buildMobileFooter() {
    return const Center(
      child: Text(
        '© OneCloud Enterprise Platform',

        style: TextStyle(fontSize: 11, color: Color(0xFF98A2B3)),
      ),
    );
  }
}

// =================================================================
// ENTERPRISE DIAGRAM PAINTER
// =================================================================

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

// =================================================================
// GOOGLE LOGO
// =================================================================

class GoogleLogo extends StatelessWidget {
  const GoogleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'G',

      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        color: Color(0xFF4285F4),
      ),
    );
  }
}
