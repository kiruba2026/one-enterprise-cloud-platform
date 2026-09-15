import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  // ================================================================
  // CONTROLLERS
  // ================================================================

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // ================================================================
  // STATE
  // ================================================================

  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool acceptTerms = false;

  // ================================================================
  // ANIMATION
  // ================================================================

  late AnimationController _animationController;

  late Animation<double> _fadeAnimation;

  late Animation<double> _logoScaleAnimation;

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

    // Fade animation
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    // Logo animation
    _logoScaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOutBack),
      ),
    );

    // Content animation
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
  // CREATE ACCOUNT
  // ================================================================

  void createAccount() {
    if (firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        usernameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      _showMessage('Please fill all required fields.');

      return;
    }

    if (!emailController.text.contains('@')) {
      _showMessage('Please enter a valid email address.');

      return;
    }

    if (passwordController.text.length < 6) {
      _showMessage('Password must contain at least 6 characters.');

      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _showMessage('Passwords do not match.');

      return;
    }

    if (!acceptTerms) {
      _showMessage('Please accept the Terms of Service and Privacy Policy.');

      return;
    }

    _showMessage('Account created successfully. Please login.');

    Future.delayed(const Duration(milliseconds: 800), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  // ================================================================
  // SIGN UP WITH GOOGLE
  // ================================================================

  void signupWithGoogle() {
    _showMessage('Google sign-up will be connected later.');
  }

  // ================================================================
  // SIGN UP WITH APPLE
  // ================================================================

  void signupWithApple() {
    _showMessage('Apple sign-up will be connected later.');
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
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

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
            // ONE OUTER SCROLL VIEW
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
        // CLOUD LOGO
        // ----------------------------------------------------------

        ScaleTransition(
          scale: _logoScaleAnimation,

          child: Container(
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
        // ----------------------------------------------------------
        // ROW 1
        // ----------------------------------------------------------

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

        // ----------------------------------------------------------
        // ROW 2
        // ----------------------------------------------------------
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

              child: _buildSignupCard(),
            ),
          ),
        ),
      ),
    );
  }

  // ================================================================
  // SIGNUP CARD
  // ================================================================

  Widget _buildSignupCard() {
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
            'Create Account',

            style: TextStyle(
              fontSize: 28,

              fontWeight: FontWeight.w700,

              color: Color(0xFF172033),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Create your account to get started with OneCloud.',

            style: TextStyle(
              fontSize: 13,

              height: 1.5,

              color: Color(0xFF667085),
            ),
          ),

          const SizedBox(height: 25),

          // ========================================================
          // FIRST NAME + LAST NAME
          // ========================================================
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  label: 'First Name',

                  hint: 'First name',

                  icon: Icons.person_outline,

                  controller: firstNameController,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _buildTextField(
                  label: 'Last Name',

                  hint: 'Last name',

                  icon: Icons.person_outline,

                  controller: lastNameController,
                ),
              ),
            ],
          ),

          const SizedBox(height: 17),

          // ========================================================
          // USERNAME
          // ========================================================
          _buildTextField(
            label: 'Username',

            hint: 'Enter username',

            icon: Icons.account_circle_outlined,

            controller: usernameController,
          ),

          const SizedBox(height: 17),

          // ========================================================
          // EMAIL
          // ========================================================
          _buildTextField(
            label: 'Email Address',

            hint: 'Enter email address',

            icon: Icons.email_outlined,

            controller: emailController,

            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: 17),

          // ========================================================
          // PHONE
          // ========================================================
          _buildTextField(
            label: 'Phone Number',

            hint: 'Enter phone number',

            icon: Icons.phone_outlined,

            controller: phoneController,

            keyboardType: TextInputType.phone,
          ),

          const SizedBox(height: 17),

          // ========================================================
          // PASSWORD
          // ========================================================
          _buildPasswordField(
            label: 'Password',

            hint: 'Create password',

            controller: passwordController,

            hidePassword: hidePassword,

            onToggle: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
          ),

          const SizedBox(height: 17),

          // ========================================================
          // CONFIRM PASSWORD
          // ========================================================
          _buildPasswordField(
            label: 'Confirm Password',

            hint: 'Confirm password',

            controller: confirmPasswordController,

            hidePassword: hideConfirmPassword,

            onToggle: () {
              setState(() {
                hideConfirmPassword = !hideConfirmPassword;
              });
            },
          ),

          const SizedBox(height: 18),

          // ========================================================
          // TERMS
          // ========================================================
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(
                width: 22,
                height: 22,

                child: Checkbox(
                  value: acceptTerms,

                  onChanged: (value) {
                    setState(() {
                      acceptTerms = value ?? false;
                    });
                  },
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 12,

                      height: 1.4,

                      color: Color(0xFF667085),
                    ),

                    children: [
                      TextSpan(text: 'I agree to the '),

                      TextSpan(
                        text: 'Terms of Service',

                        style: TextStyle(
                          color: Color(0xFF1976D2),

                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      TextSpan(text: ' and '),

                      TextSpan(
                        text: 'Privacy Policy',

                        style: TextStyle(
                          color: Color(0xFF1976D2),

                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          // ========================================================
          // CREATE ACCOUNT
          // ========================================================
          SizedBox(
            width: double.infinity,

            height: 50,

            child: ElevatedButton(
              onPressed: createAccount,

              style: _buttonStyle(),

              child: const Text(
                'Create Account',

                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // ========================================================
          // OR DIVIDER
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
          // GOOGLE SIGN UP
          // ========================================================
          SizedBox(
            width: double.infinity,

            height: 48,

            child: OutlinedButton(
              onPressed: signupWithGoogle,

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
                    'Sign up with Google',

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
          // APPLE SIGN UP
          // ========================================================
          SizedBox(
            width: double.infinity,

            height: 48,

            child: OutlinedButton(
              onPressed: signupWithApple,

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
                    'Sign up with Apple',

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
          // LOGIN
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
                    TextSpan(text: 'Already have an account? '),

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
        ],
      ),
    );
  }

  // ================================================================
  // TEXT FIELD
  // ================================================================

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          label,

          style: const TextStyle(
            fontSize: 13,

            fontWeight: FontWeight.w700,

            color: Color(0xFF344054),
          ),
        ),

        const SizedBox(height: 7),

        TextField(
          controller: controller,

          keyboardType: keyboardType,

          decoration: InputDecoration(
            hintText: hint,

            prefixIcon: Icon(icon, size: 20),

            border: _inputBorder(),

            enabledBorder: _inputBorder(),

            focusedBorder: _focusedInputBorder(),
          ),
        ),
      ],
    );
  }

  // ================================================================
  // PASSWORD FIELD
  // ================================================================

  Widget _buildPasswordField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required bool hidePassword,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          label,

          style: const TextStyle(
            fontSize: 13,

            fontWeight: FontWeight.w700,

            color: Color(0xFF344054),
          ),
        ),

        const SizedBox(height: 7),

        TextField(
          controller: controller,

          obscureText: hidePassword,

          decoration: InputDecoration(
            hintText: hint,

            prefixIcon: const Icon(Icons.lock_outline, size: 20),

            suffixIcon: IconButton(
              onPressed: onToggle,

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
      ],
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
