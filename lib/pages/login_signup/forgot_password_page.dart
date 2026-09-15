import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin {
  // ================================================================
  // CONTROLLER
  // ================================================================

  final emailController = TextEditingController();

  // ================================================================
  // STATE
  // ================================================================

  bool isSubmitted = false;

  // ================================================================
  // ANIMATION
  // ================================================================

  late AnimationController _animationController;

  late Animation<double> _fadeAnimation;

  late Animation<Offset> _contentSlideAnimation;

  // ================================================================
  // INIT
  // ================================================================

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _contentSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  // ================================================================
  // RESET PASSWORD
  // ================================================================

  void resetPassword() {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      _showMessage('Please enter your email or username.');
      return;
    }

    if (email.contains('@') && !email.contains('.')) {
      _showMessage('Please enter a valid email address.');
      return;
    }

    setState(() {
      isSubmitted = true;
    });

    _showMessage('Password reset instructions have been sent.');
  }

  // ================================================================
  // MESSAGE
  // ================================================================

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // ================================================================
  // DISPOSE
  // ================================================================

  @override
  void dispose() {
    emailController.dispose();
    _animationController.dispose();

    super.dispose();
  }

  // ================================================================
  // BUILD
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
                  Expanded(child: _buildLeftSection()),

                  Expanded(
                    child: SingleChildScrollView(child: _buildRightSection()),
                  ),
                ],
              );
            }

            // ======================================================
            // MOBILE
            //
            // ONE SCROLL VIEW ONLY
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
          // DECORATIVE CIRCLES
          // --------------------------------------------------------

          Positioned(
            top: -100,
            left: -100,
            child: _backgroundCircle(size: 280, alpha: 0.06),
          ),

          Positioned(
            bottom: -120,
            left: -70,
            child: _backgroundCircle(size: 320, alpha: 0.05),
          ),

          Positioned(
            top: 180,
            right: -130,
            child: _backgroundCircle(size: 260, alpha: 0.04),
          ),

          // --------------------------------------------------------
          // CONTENT
          // --------------------------------------------------------
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 40),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBrand(),

                  const SizedBox(height: 45),

                  _buildMainHeading(),

                  const SizedBox(height: 24),

                  _buildDescription(),

                  const SizedBox(height: 40),

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
        // LOGO
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
        // BRAND
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

              child: _buildForgotPasswordCard(),
            ),
          ),
        ),
      ),
    );
  }

  // ================================================================
  // FORGOT PASSWORD CARD
  // ================================================================

  Widget _buildForgotPasswordCard() {
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
          // TITLE
          // ========================================================

          const Text(
            'Forgot Password?',

            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF172033),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Enter your registered email or username and '
            'we will help you reset your password.',

            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF667085),
            ),
          ),

          const SizedBox(height: 28),

          // ========================================================
          // EMAIL / USERNAME LABEL
          // ========================================================
          const Text(
            'Email or Username',

            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF344054),
            ),
          ),

          const SizedBox(height: 8),

          // ========================================================
          // EMAIL / USERNAME
          // ========================================================
          TextField(
            controller: emailController,

            keyboardType: TextInputType.emailAddress,

            decoration: InputDecoration(
              hintText: 'Enter email or username',

              prefixIcon: const Icon(Icons.person_outline, size: 20),

              border: _inputBorder(),

              enabledBorder: _inputBorder(),

              focusedBorder: _focusedInputBorder(),
            ),
          ),

          const SizedBox(height: 24),

          // ========================================================
          // RESET BUTTON
          // ========================================================
          SizedBox(
            width: double.infinity,
            height: 50,

            child: ElevatedButton(
              onPressed: resetPassword,

              style: _buttonStyle(),

              child: const Text(
                'Reset Password',

                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          // ========================================================
          // SUCCESS MESSAGE
          // ========================================================
          if (isSubmitted) ...[
            const SizedBox(height: 20),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),

                borderRadius: BorderRadius.circular(12),

                border: Border.all(color: const Color(0xFFD1F0DA)),
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Icon(
                    Icons.check_circle_outline,

                    size: 22,

                    color: Color(0xFF16A34A),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text(
                          'Request Submitted',

                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF166534),
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          'Please check your registered email '
                          'for password reset instructions.',

                          style: TextStyle(
                            fontSize: 11,
                            height: 1.4,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 25),

          // ========================================================
          // BACK TO LOGIN
          // ========================================================
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },

              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 13, color: Color(0xFF667085)),

                  children: [
                    TextSpan(text: 'Remember your password? '),

                    TextSpan(
                      text: 'Login',

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

          const SizedBox(height: 24),

          // ========================================================
          // SECURITY INFORMATION
          // ========================================================
          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),

              borderRadius: BorderRadius.circular(12),

              border: Border.all(color: const Color(0xFFE6EAF0)),
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Icon(
                  Icons.security_outlined,

                  size: 22,

                  color: Color(0xFF1976D2),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'Account Security',

                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF344054),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        'For your security, password reset '
                        'instructions are only sent to your '
                        'registered contact information.',

                        style: TextStyle(
                          fontSize: 11,
                          height: 1.4,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
