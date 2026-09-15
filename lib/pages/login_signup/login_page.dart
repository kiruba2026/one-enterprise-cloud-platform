import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  // ================================================================
  // CONTROLLERS
  // ================================================================

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  // ================================================================
  // LOGIN STATE
  // ================================================================

  bool rememberMe = false;

  bool hidePassword = true;

  bool showOtp = false;

  bool isOtpWrong = false;

  // Demo OTP
  // Later this will come from the Java backend.
  String generatedOtp = '';

  // ================================================================
  // ANIMATION
  // ================================================================

  late AnimationController _animationController;

  late Animation<double> _fadeAnimation;

  late Animation<double> _logoScaleAnimation;

  late Animation<Offset> _contentSlideAnimation;

  // ================================================================
  // INIT STATE
  // ================================================================

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    // Fade
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    // Logo
    _logoScaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOutBack),
      ),
    );

    // Content
    _contentSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.15, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    _animationController.forward();
  }

  // ================================================================
  // GENERATE OTP
  // ================================================================

  void generateOtp() {
    if (usernameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter username and password')),
      );

      return;
    }

    // Temporary demo OTP.
    // Later Java backend will generate and send this.
    generatedOtp = '123456';

    otpController.clear();

    setState(() {
      showOtp = true;
      isOtpWrong = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Demo OTP generated: 123456'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  // ================================================================
  // VERIFY OTP
  // ================================================================

  void verifyOtp() {
    final String enteredOtp = otpController.text.trim();

    if (enteredOtp.isEmpty) {
      setState(() {
        isOtpWrong = true;
      });

      return;
    }

    if (enteredOtp.length != 6) {
      setState(() {
        isOtpWrong = true;
      });

      return;
    }

    if (enteredOtp == generatedOtp) {
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    } else {
      setState(() {
        isOtpWrong = true;
      });
    }
  }

  // ================================================================
  // GOOGLE LOGIN
  // ================================================================

  void googleLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Google login will be connected later.')),
    );
  }

  // ================================================================
  // APPLE LOGIN
  // ================================================================

  void appleLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Apple login will be connected later.')),
    );
  }

  // ================================================================
  // DISPOSE
  // ================================================================

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    otpController.dispose();

    _animationController.dispose();

    super.dispose();
  }

  // ================================================================
  // MAIN BUILD
  // ================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FC),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // ======================================================
            // DESKTOP
            // ======================================================

            if (constraints.maxWidth >= 900) {
              return Row(
                children: [
                  // LEFT SIDE
                  Expanded(child: _buildLeftSection()),

                  // RIGHT SIDE
                  Expanded(
                    child: SingleChildScrollView(child: _buildRightSection()),
                  ),
                ],
              );
            }

            // ======================================================
            // MOBILE
            //
            // IMPORTANT:
            // Only ONE SingleChildScrollView is used here.
            // This prevents the RenderBox layout error.
            // ======================================================

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [_buildMobileBrandSection(), _buildRightSection()],
              ),
            );
          },
        ),
      ),
    );
  }

  // ================================================================
  // LEFT SECTION
  // ================================================================

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
          // --------------------------------------------------------
          // DECORATIVE CIRCLE 1
          // --------------------------------------------------------

          Positioned(
            top: -100,
            left: -100,
            child: _backgroundCircle(size: 280, alpha: 0.06),
          ),

          // --------------------------------------------------------
          // DECORATIVE CIRCLE 2
          // --------------------------------------------------------
          Positioned(
            bottom: -120,
            left: -70,
            child: _backgroundCircle(size: 320, alpha: 0.05),
          ),

          // --------------------------------------------------------
          // DECORATIVE CIRCLE 3
          // --------------------------------------------------------
          Positioned(
            top: 180,
            right: -130,
            child: _backgroundCircle(size: 260, alpha: 0.04),
          ),

          // --------------------------------------------------------
          // LEFT CONTENT
          // --------------------------------------------------------
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 40),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // LOGO
                  _buildBrand(),

                  const SizedBox(height: 45),

                  // MAIN HEADING
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
        ],
      ),
    );
  }

  // ================================================================
  // BRAND
  // ================================================================

  Widget _buildBrand() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ----------------------------------------------------------
        // CLOUD LOGO
        // ----------------------------------------------------------

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

        // ----------------------------------------------------------
        // BRAND NAME
        // ----------------------------------------------------------
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

  // ================================================================
  // MAIN HEADING
  // ================================================================

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

  // ================================================================
  // DESCRIPTION
  // ================================================================

  Widget _buildDescription() {
    return const Text(
      'Manage your people, customers, operations and '
      'business workflows from one powerful enterprise platform.',

      style: TextStyle(fontSize: 16, height: 1.55, color: Color(0xFF667892)),
    );
  }

  // ================================================================
  // FEATURES
  // ================================================================

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

  // ================================================================
  // FEATURE ITEM
  // ================================================================

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

  // ================================================================
  // RIGHT SECTION
  // ================================================================

  Widget _buildRightSection() {
    return Container(
      width: double.infinity,

      color: const Color(0xFFFAFBFD),

      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),

      child: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,

          child: SlideTransition(
            position: _contentSlideAnimation,

            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),

              child: _buildLoginCard(),
            ),
          ),
        ),
      ),
    );
  }

  // ================================================================
  // LOGIN CARD
  // ================================================================

  Widget _buildLoginCard() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ========================================================
          // WELCOME
          // ========================================================

          const Text(
            'Welcome Back!',

            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF172033),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Sign in to continue to OneCloud Enterprise Platform.',

            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF667085),
            ),
          ),

          const SizedBox(height: 28),

          // ========================================================
          // USERNAME
          // ========================================================
          const Text(
            'Username',

            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF344054),
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: usernameController,

            keyboardType: TextInputType.emailAddress,

            decoration: InputDecoration(
              hintText: 'Enter username',

              prefixIcon: const Icon(Icons.person_outline, size: 20),

              border: _inputBorder(),

              enabledBorder: _inputBorder(),

              focusedBorder: _focusedInputBorder(),
            ),
          ),

          const SizedBox(height: 18),

          // ========================================================
          // PASSWORD + FORGOT PASSWORD
          // ========================================================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                'Password',

                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF344054),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.forgotPassword);
                },

                child: const Text(
                  'Forgot Password?',

                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1976D2),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          TextField(
            controller: passwordController,

            obscureText: hidePassword,

            decoration: InputDecoration(
              hintText: 'Enter your password',

              prefixIcon: const Icon(Icons.lock_outline, size: 20),

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
                ),
              ),

              border: _inputBorder(),

              enabledBorder: _inputBorder(),

              focusedBorder: _focusedInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          // ========================================================
          // REMEMBER ME
          // ========================================================
          Row(
            children: [
              SizedBox(
                width: 22,
                height: 22,

                child: Checkbox(
                  value: rememberMe,

                  onChanged: (value) {
                    setState(() {
                      rememberMe = value ?? false;
                    });
                  },
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

          // ========================================================
          // GENERATE OTP
          // ========================================================
          if (!showOtp)
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: generateOtp,

                style: _buttonStyle(),

                child: const Text(
                  'Generate OTP',

                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),

          // ========================================================
          // OTP SECTION
          // ========================================================
          if (showOtp) _buildOtpSection(),

          const SizedBox(height: 25),

          // ========================================================
          // OR
          // ========================================================
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

          // ========================================================
          // GOOGLE
          // ========================================================
          SizedBox(
            width: double.infinity,
            height: 48,

            child: OutlinedButton(
              onPressed: googleLogin,

              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,

                side: const BorderSide(color: Color(0xFFE1E6ED)),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  _googleIcon(),

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

          // ========================================================
          // APPLE
          // ========================================================
          SizedBox(
            width: double.infinity,
            height: 48,

            child: OutlinedButton(
              onPressed: appleLogin,

              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,

                side: const BorderSide(color: Color(0xFFE1E6ED)),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
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

          const SizedBox(height: 22),

          // ========================================================
          // SIGN UP
          // ========================================================
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.signup);
              },

              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 13, color: Color(0xFF667085)),

                  children: [
                    TextSpan(text: "Don't have an account? "),

                    TextSpan(
                      text: 'Sign Up',

                      style: TextStyle(
                        color: Color(0xFF1976D2),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // OTP SECTION
  // ================================================================

  Widget _buildOtpSection() {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // --------------------------------------------------------
          // OTP INFORMATION BOX
          // --------------------------------------------------------

          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color: const Color(0xFFF0F7FF),

              borderRadius: BorderRadius.circular(12),

              border: Border.all(color: const Color(0xFFD7E9FF)),
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Icon(
                  Icons.verified_user_outlined,

                  color: Color(0xFF1976D2),

                  size: 22,
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'OTP Verification',

                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF172033),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        'Enter the 6-digit verification code.',

                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // --------------------------------------------------------
          // VERIFICATION CODE
          // --------------------------------------------------------
          const Text(
            'Verification Code',

            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF344054),
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: otpController,

            keyboardType: TextInputType.number,

            maxLength: 6,

            decoration: InputDecoration(
              counterText: '',

              hintText: 'Enter OTP',

              prefixIcon: const Icon(Icons.password_outlined, size: 20),

              border: _inputBorder(),

              enabledBorder: _inputBorder(),

              focusedBorder: _focusedInputBorder(),

              errorText: isOtpWrong ? 'Invalid OTP. Please try again.' : null,
            ),
          ),

          const SizedBox(height: 18),

          // --------------------------------------------------------
          // LOGIN
          // --------------------------------------------------------
          SizedBox(
            width: double.infinity,
            height: 50,

            child: ElevatedButton(
              onPressed: verifyOtp,

              style: _buttonStyle(),

              child: const Text(
                'Login',

                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // --------------------------------------------------------
          // RESEND OTP
          // --------------------------------------------------------
          Center(
            child: TextButton(
              onPressed: generateOtp,

              child: const Text(
                'Resend OTP',

                style: TextStyle(
                  color: Color(0xFF1976D2),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // --------------------------------------------------------
          // CHANGE LOGIN DETAILS
          // --------------------------------------------------------
          Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  showOtp = false;
                  isOtpWrong = false;
                  generatedOtp = '';
                  otpController.clear();
                });
              },

              child: const Text(
                'Change Login Details',

                style: TextStyle(color: Color(0xFF667085), fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // GOOGLE ICON
  // ================================================================

  Widget _googleIcon() {
    return const Text(
      'G',

      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Color(0xFF4285F4),
      ),
    );
  }

  // ================================================================
  // BUTTON STYLE
  // ================================================================

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1268E8),

      foregroundColor: Colors.white,

      elevation: 2,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );
  }

  // ================================================================
  // INPUT BORDER
  // ================================================================

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),

      borderSide: const BorderSide(color: Color(0xFFE1E6ED)),
    );
  }

  OutlineInputBorder _focusedInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),

      borderSide: const BorderSide(color: Color(0xFF1976D2), width: 1.5),
    );
  }

  // ================================================================
  // MOBILE BRAND SECTION
  // ================================================================

  Widget _buildMobileBrandSection() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.fromLTRB(28, 30, 28, 35),

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: [Color(0xFFEAF4FF), Color(0xFFDCEEFF)],
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          _buildBrand(),

          const SizedBox(height: 30),

          const Text(
            'Smart Enterprise.',

            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xFF16233B),
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Stronger Operations.',

            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1877F2),
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Better Growth.',

            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xFF16233B),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'Manage your people, customers, operations and '
            'business workflows from one powerful enterprise platform.',

            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF667892),
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // BACKGROUND CIRCLE
  // ================================================================

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
}
