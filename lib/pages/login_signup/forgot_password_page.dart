import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _sendResetLink() {
    final value = _usernameController.text.trim();

    if (value.isEmpty) {
      _showMessage('Please enter your username or email.');
      return;
    }

    _showMessage('Password reset link sent.');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  void _backToLogin() {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FC),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // DESKTOP LAYOUT (Matches Login & Signup)
            if (constraints.maxWidth >= 900) {
              return Row(
                children: [
                  Expanded(child: _buildLeftSection()),
                  Expanded(child: _buildDesktopRightSection()),
                ],
              );
            }

            // MOBILE LAYOUT
            return _buildMobileLayout();
          },
        ),
      ),
    );
  }

  // -------------------------------------------------------------
  // DESKTOP LEFT SECTION (Exact match to Login)
  // -------------------------------------------------------------
  Widget _buildLeftSection() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/one_enterprise_left_full.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
        gaplessPlayback: true,
      ),
    );
  }

  // -------------------------------------------------------------
  // DESKTOP RIGHT SECTION
  // -------------------------------------------------------------
  Widget _buildDesktopRightSection() {
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
              child: _buildCard(isMobile: false),
            ),
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------
  // MOBILE LAYOUT
  // -------------------------------------------------------------
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
              _buildMobileBrand(),
              const SizedBox(height: 24),
              _buildCard(isMobile: true),
              const SizedBox(height: 20),
              _buildMobileFooter(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileBrand() {
    return Center(
      child: Column(
        children: [
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

  // -------------------------------------------------------------
  // FORGOT PASSWORD CARD
  // -------------------------------------------------------------
  Widget _buildCard({required bool isMobile}) {
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
          // BACK BUTTON
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: _backToLogin,
              borderRadius: BorderRadius.circular(20),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                child: Icon(
                  Icons.arrow_back,
                  size: 22,
                  color: Color(0xFF344054),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // TITLE (Matched with Login Welcome)
          const Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xFF16233B),
            ),
          ),
          const SizedBox(height: 8),

          // SUBTITLE
          const Text(
            'Enter your username or email address and we will send you a reset link.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF667085),
            ),
          ),
          const SizedBox(height: 28),

          // USERNAME OR EMAIL LABEL
          const Text(
            'Username or Email',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF344054),
            ),
          ),
          const SizedBox(height: 8),

          // INPUT FIELD (Same decoration as Login)
          TextField(
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: 'Enter username or email',
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xFF98A2B3),
              ),
              prefixIcon: const Icon(
                Icons.person_outline,
                size: 21,
                color: Color(0xFF667085),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
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
                borderSide: const BorderSide(
                  color: Color(0xFF1877F2),
                  width: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // SUBMIT BUTTON (Same size/color as Login primary button)
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: _sendResetLink,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1877F2),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              child: const Text(
                'Send Reset Link',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 22),

          // RETURN TO LOGIN LINK
          Center(
            child: TextButton(
              onPressed: _backToLogin,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Back to Login',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1877F2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFooter() {
    return const Center(
      child: Text(
        '© OneCloud Enterprise Platform',
        style: TextStyle(fontSize: 11, color: Color(0xFF98A2B3)),
      ),
    );
  }
}
