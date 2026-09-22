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
    return Container(
      width: double.infinity,
      height: double.infinity,

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEAF4FF), Color(0xFFDCEEFF), Color(0xFFCFE5FA)],
        ),
      ),

      child: Stack(
        children: [
          // ------------------------------------------------------
          // BACKGROUND CIRCLE 1
          // ------------------------------------------------------

          Positioned(
            top: -100,
            left: -100,
            child: _backgroundCircle(size: 280, alpha: 0.06),
          ),

          // ------------------------------------------------------
          // BACKGROUND CIRCLE 2
          // ------------------------------------------------------
          Positioned(
            bottom: -120,
            left: -70,
            child: _backgroundCircle(size: 320, alpha: 0.05),
          ),

          // ------------------------------------------------------
          // BACKGROUND CIRCLE 3
          // ------------------------------------------------------
          Positioned(
            top: 180,
            right: -130,
            child: _backgroundCircle(size: 260, alpha: 0.04),
          ),

          // ------------------------------------------------------
          // CONTENT
          // ------------------------------------------------------
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 40),

              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 650),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BRAND
                    _buildBrand(),

                    const SizedBox(height: 45),

                    // HEADING
                    _buildMainHeading(),

                    const SizedBox(height: 24),

                    // DESCRIPTION
                    _buildDescription(),

                    const SizedBox(height: 40),

                    // FEATURES
                    _buildFeatures(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BACKGROUND CIRCLE
  // ============================================================

  Widget _backgroundCircle({required double size, required double alpha}) {
    return Container(
      width: size,
      height: size,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF1877F2).withValues(alpha: alpha),
      ),
    );
  }

  // ============================================================
  // DESKTOP BRAND
  // ============================================================

  Widget _buildBrand() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // --------------------------------------------------------
        // LOGO
        // --------------------------------------------------------

        Container(
          width: 65,
          height: 65,

          decoration: BoxDecoration(
            color: const Color(0xFF1877F2),
            borderRadius: BorderRadius.circular(17),

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
            size: 38,
          ),
        ),

        const SizedBox(width: 17),

        // --------------------------------------------------------
        // BRAND NAME
        // --------------------------------------------------------
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OneCloud',

              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1877F2),
              ),
            ),

            SizedBox(height: 2),

            Text(
              'Enterprise Platform',

              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF667085),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // MAIN HEADING
  // ============================================================

  Widget _buildMainHeading() {
    return const Text(
      'Smart Enterprise.\n'
      'Stronger Operations.\n'
      'Better Growth.',

      style: TextStyle(
        fontSize: 42,
        height: 1.15,
        fontWeight: FontWeight.w700,
        color: Color(0xFF16233B),
      ),
    );
  }

  // ============================================================
  // DESCRIPTION
  // ============================================================

  Widget _buildDescription() {
    return const Text(
      'Manage your people, customers, operations and '
      'business workflows from one powerful enterprise platform.',

      style: TextStyle(fontSize: 16, height: 1.55, color: Color(0xFF667892)),
    );
  }

  // ============================================================
  // FEATURES
  // ============================================================

  Widget _buildFeatures() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _featureItem(
                Icons.people_outline,
                'Manage People',
                'HRMS and employee management.',
              ),
            ),

            const SizedBox(width: 35),

            Expanded(
              child: _featureItem(
                Icons.handshake_outlined,
                'Manage Customers',
                'CRM and customer relationships.',
              ),
            ),
          ],
        ),

        const SizedBox(height: 25),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _featureItem(
                Icons.account_balance_wallet_outlined,
                'Manage Finance',
                'Finance and accounting operations.',
              ),
            ),

            const SizedBox(width: 35),

            Expanded(
              child: _featureItem(
                Icons.bar_chart_outlined,
                'Powerful Reports',
                'Business insights and analytics.',
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // FEATURE ITEM
  // ============================================================

  Widget _featureItem(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56,
          height: 56,

          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,

            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          child: Icon(icon, size: 25, color: const Color(0xFF1877F2)),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF16233B),
                ),
              ),

              const SizedBox(height: 4),

              Text(
                description,

                style: const TextStyle(
                  fontSize: 12,
                  height: 1.4,
                  color: Color(0xFF667892),
                ),
              ),
            ],
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
