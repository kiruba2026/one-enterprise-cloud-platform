import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int _currentStep = 1;

  final TextEditingController _orgNameController = TextEditingController();
  final TextEditingController _orgCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  bool _isManualCodeEdit = false;

  String _orgType = 'Enterprise';
  String _industry = 'Information Technology';
  String _companySize = '501-1000';
  String _country = 'India';
  String _stateProvince = 'Telangana';
  String _timeZone = 'Asia/Kolkata (UTC +05:30)';

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _officialEmailController =
      TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  bool _agreeTermsAndPrivacy = false;
  bool _confirmAuthorized = false;
  bool _agreeDpa = false;
  bool _sendProductUpdates = false;

  @override
  void initState() {
    super.initState();
    _orgNameController.addListener(_generateOrgCode);
  }

  void _generateOrgCode() {
    if (_isManualCodeEdit) return;

    final text = _orgNameController.text;
    final cleanText = text
        .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')
        .toUpperCase();
    final code = cleanText.length > 6 ? cleanText.substring(0, 6) : cleanText;

    if (_orgCodeController.text != code) {
      _orgCodeController.value = TextEditingValue(
        text: code,
        selection: TextSelection.collapsed(offset: code.length),
      );
    }
  }

  @override
  void dispose() {
    _orgNameController.removeListener(_generateOrgCode);
    _orgNameController.dispose();
    _orgCodeController.dispose();
    _cityController.dispose();

    _firstNameController.dispose();
    _lastNameController.dispose();
    _officialEmailController.dispose();
    _mobileNumberController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  void _onStep1Continue() {
    if (_orgNameController.text.trim().isEmpty) {
      _showMessage('Please enter organization name.');
      return;
    }
    if (_orgCodeController.text.trim().isEmpty) {
      _showMessage('Please enter organization code.');
      return;
    }
    setState(() => _currentStep = 2);
  }

  void _onStep2Continue() {
    if (_firstNameController.text.trim().isEmpty) {
      _showMessage('Please enter first name.');
      return;
    }
    if (_lastNameController.text.trim().isEmpty) {
      _showMessage('Please enter last name.');
      return;
    }
    if (!_officialEmailController.text.contains('@')) {
      _showMessage('Please enter a valid official email.');
      return;
    }
    if (_mobileNumberController.text.trim().isEmpty) {
      _showMessage('Please enter mobile number.');
      return;
    }
    if (_usernameController.text.trim().isEmpty) {
      _showMessage('Please enter username.');
      return;
    }
    if (_passwordController.text.length < 8) {
      _showMessage('Password must be at least 8 characters.');
      return;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      _showMessage('Passwords do not match.');
      return;
    }
    setState(() => _currentStep = 3);
  }

  void _onCreateAccount() {
    if (!_agreeTermsAndPrivacy) {
      _showMessage('Please agree to the Terms of Service and Privacy Policy.');
      return;
    }
    if (!_confirmAuthorized) {
      _showMessage('Please confirm that you are authorized to register.');
      return;
    }
    if (!_agreeDpa) {
      _showMessage('Please agree to the Data Processing Agreement.');
      return;
    }

    _showMessage('Workspace created successfully! Please sign in.');
    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 900) {
              return Row(
                children: [
                  Expanded(child: _buildLeftSection()),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 44.0,
                          vertical: 40.0,
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 580),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: _buildStepWidget(isMobile: false),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }

            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: 95.0 + bottomInset),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildMobileHeader(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 20.0,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 580),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: _buildStepWidget(isMobile: true),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Left banner uses one_enterprise_left_full.png
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

  Widget _buildMobileHeader() {
    return Container(
      width: double.infinity,
      color: Colors.black,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/Mobile_login_top.png',
        width: double.infinity,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
        errorBuilder: (context, error, stackTrace) => Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: const Text(
            'One Enterprise',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepWidget({required bool isMobile}) {
    switch (_currentStep) {
      case 1:
        return _buildStep1Organization(isMobile: isMobile);
      case 2:
        return _buildStep2AdminAccount(isMobile: isMobile);
      case 3:
        return _buildStep3ReviewAndConfirm(isMobile: isMobile);
      default:
        return _buildStep1Organization(isMobile: isMobile);
    }
  }

  Widget _buildStepProgress(int current) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: current >= 1
                  ? const Color(0xFF1E293B)
                  : const Color(0xFFE2E8F0),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: current == 2
                  ? const Color(0xFF1E293B)
                  : current > 2
                  ? const Color(0xFF818CF8)
                  : const Color(0xFFE2E8F0),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: current >= 3
                  ? const Color(0xFF1E293B)
                  : const Color(0xFFE2E8F0),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackRow({required VoidCallback onTap}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.chevron_left, size: 20, color: Color(0xFF64748B)),
              SizedBox(width: 4),
              Text(
                'Back',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep1Organization({required bool isMobile}) {
    return Column(
      key: const ValueKey(1),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildStepProgress(1),
        const SizedBox(height: 24),
        const Text(
          'STEP 1 OF 3  ·  ORGANIZATION DETAILS',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.8,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Tell us about your organization',
          style: TextStyle(
            fontSize: isMobile ? 28 : 32,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F172A),
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          "This creates your organization's workspace on One Enterprise.",
          style: TextStyle(fontSize: 14, color: Color(0xFF64748B), height: 1.4),
        ),
        const SizedBox(height: 24),

        _buildFieldLabel('Organization Name'),
        const SizedBox(height: 6),
        _buildTextInput(controller: _orgNameController),
        const SizedBox(height: 16),

        _buildFieldLabel('Organization Code'),
        const SizedBox(height: 6),
        _buildTextInput(
          controller: _orgCodeController,
          onChanged: (val) {
            _isManualCodeEdit = true;
          },
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () {
            setState(() {
              _isManualCodeEdit = true;
            });
            _showMessage('Manual code edit enabled.');
          },
          child: RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              children: [
                TextSpan(text: 'Auto-generated from your organization name — '),
                TextSpan(
                  text: 'edit manually',
                  style: TextStyle(
                    color: Color(0xFF2563EB),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        _buildFieldLabel('Organization Type'),
        const SizedBox(height: 6),
        _buildDropdownInput(
          value: _orgType,
          items: const ['Enterprise', 'Mid-market', 'Startup', 'Government'],
          onChanged: (val) => setState(() => _orgType = val!),
        ),
        const SizedBox(height: 16),

        _buildFieldLabel('Industry'),
        const SizedBox(height: 6),
        _buildDropdownInput(
          value: _industry,
          items: const [
            'Information Technology',
            'Financial Services',
            'Healthcare',
            'Manufacturing',
            'Retail & E-commerce',
          ],
          onChanged: (val) => setState(() => _industry = val!),
        ),
        const SizedBox(height: 16),

        _buildFieldLabel('Company Size'),
        const SizedBox(height: 6),
        _buildDropdownInput(
          value: _companySize,
          items: const ['1-50', '51-200', '201-500', '501-1000', '1000+'],
          onChanged: (val) => setState(() => _companySize = val!),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('Country'),
                  const SizedBox(height: 6),
                  _buildDropdownInput(
                    value: _country,
                    items: const [
                      'India',
                      'United States',
                      'United Kingdom',
                      'Singapore',
                      'UAE',
                    ],
                    onChanged: (val) => setState(() => _country = val!),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('State / Province'),
                  const SizedBox(height: 6),
                  _buildDropdownInput(
                    value: _stateProvince,
                    items: const [
                      'Telangana',
                      'Tamil Nadu',
                      'Karnataka',
                      'Maharashtra',
                      'Delhi',
                    ],
                    onChanged: (val) => setState(() => _stateProvince = val!),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('City'),
                  const SizedBox(height: 6),
                  _buildTextInput(controller: _cityController),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('Time Zone'),
                  const SizedBox(height: 6),
                  _buildDropdownInput(
                    value: _timeZone,
                    items: const [
                      'Asia/Kolkata (UTC +05:30)',
                      'America/New_York (UTC -05:00)',
                      'Europe/London (UTC +00:00)',
                      'Asia/Singapore (UTC +08:00)',
                    ],
                    onChanged: (val) => setState(() => _timeZone = val!),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        _primaryDarkButton(label: 'Continue', onPressed: _onStep1Continue),
        const SizedBox(height: 20),

        _buildFooterSignInLink(),
      ],
    );
  }

  Widget _buildStep2AdminAccount({required bool isMobile}) {
    final orgDisplayName = _orgNameController.text.trim().isEmpty
        ? 'your organization'
        : _orgNameController.text.trim();

    return Column(
      key: const ValueKey(2),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBackRow(onTap: () => setState(() => _currentStep = 1)),
        const SizedBox(height: 14),
        _buildStepProgress(2),
        const SizedBox(height: 24),
        const Text(
          'STEP 2 OF 3  ·  SUPER ADMIN ACCOUNT',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.8,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Create your admin account',
          style: TextStyle(
            fontSize: isMobile ? 28 : 32,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F172A),
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "This is the account you'll use to manage $orgDisplayName.",
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF64748B),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E7FF)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.verified_user_outlined,
                  size: 18,
                  color: Color(0xFF4F46E5),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF334155),
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'This account will automatically be assigned the ',
                      ),
                      TextSpan(
                        text: 'SUPER_ADMIN',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      TextSpan(
                        text: ' role, with full access to your organization\'s workspace.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('First Name'),
                  const SizedBox(height: 6),
                  _buildTextInput(controller: _firstNameController),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('Last Name'),
                  const SizedBox(height: 6),
                  _buildTextInput(controller: _lastNameController),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        _buildFieldLabel('Official Email'),
        const SizedBox(height: 6),
        _buildTextInput(
          controller: _officialEmailController,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),

        _buildFieldLabel('Mobile Number'),
        const SizedBox(height: 6),
        _buildTextInput(
          controller: _mobileNumberController,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 16),

        _buildFieldLabel('Username'),
        const SizedBox(height: 6),
        _buildTextInput(controller: _usernameController),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('Password'),
                  const SizedBox(height: 6),
                  _buildPasswordInput(
                    controller: _passwordController,
                    hide: _hidePassword,
                    onToggle: () =>
                        setState(() => _hidePassword = !_hidePassword),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('Confirm Password'),
                  const SizedBox(height: 6),
                  _buildPasswordInput(
                    controller: _confirmPasswordController,
                    hide: _hideConfirmPassword,
                    onToggle: () => setState(
                      () => _hideConfirmPassword = !_hideConfirmPassword,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          'Minimum 8 characters, with at least one number and one symbol.',
          style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
        ),
        const SizedBox(height: 24),

        _primaryDarkButton(label: 'Continue', onPressed: _onStep2Continue),
        const SizedBox(height: 20),

        _buildFooterSignInLink(),
      ],
    );
  }

  Widget _buildStep3ReviewAndConfirm({required bool isMobile}) {
    final orgDisplayName = _orgNameController.text.trim().isEmpty
        ? 'your organization'
        : _orgNameController.text.trim();

    return Column(
      key: const ValueKey(3),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBackRow(onTap: () => setState(() => _currentStep = 2)),
        const SizedBox(height: 14),
        _buildStepProgress(3),
        const SizedBox(height: 24),
        const Text(
          'STEP 3 OF 3  ·  TERMS & AUTHORIZATION',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.8,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Review and confirm',
          style: TextStyle(
            fontSize: isMobile ? 28 : 32,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F172A),
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "One last step before we create $orgDisplayName's workspace.",
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF64748B),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCheckboxRow(
                value: _agreeTermsAndPrivacy,
                onChanged: (val) =>
                    setState(() => _agreeTermsAndPrivacy = val ?? false),
                textSpan: const TextSpan(
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF334155),
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(text: 'I have read and agree to the '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              _buildCheckboxRow(
                value: _confirmAuthorized,
                onChanged: (val) =>
                    setState(() => _confirmAuthorized = val ?? false),
                textSpan: TextSpan(
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF334155),
                    height: 1.4,
                  ),
                  children: [
                    const TextSpan(
                      text: 'I confirm that I am authorized to register ',
                    ),
                    TextSpan(
                      text: orgDisplayName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const TextSpan(
                      text: ' on One Enterprise, and I accept responsibility as its Super Administrator.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              _buildCheckboxRow(
                value: _agreeDpa,
                onChanged: (val) => setState(() => _agreeDpa = val ?? false),
                textSpan: const TextSpan(
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF334155),
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(text: 'I agree to the '),
                    TextSpan(
                      text: 'Data Processing Agreement',
                      style: TextStyle(
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' governing how organization data is stored and processed.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              _buildCheckboxRow(
                value: _sendProductUpdates,
                onChanged: (val) =>
                    setState(() => _sendProductUpdates = val ?? false),
                textSpan: const TextSpan(
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF334155),
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(
                      text: 'Send me product updates and security notices by email  ',
                    ),
                    TextSpan(
                      text: 'OPTIONAL',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        _primaryDarkButton(
          label: 'Create account',
          onPressed: _onCreateAccount,
        ),
        const SizedBox(height: 20),

        _buildFooterSignInLink(),
      ],
    );
  }

  Widget _buildFieldLabel(String label) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0F172A),
        ),
        children: [
          TextSpan(text: label),
          const TextSpan(
            text: ' *',
            style: TextStyle(color: Color(0xFFEF4444)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextInput({
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    ValueChanged<String>? onChanged,
  }) {
    return SizedBox(
      height: 46,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, color: Color(0xFF0F172A)),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF0F172A), width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordInput({
    required TextEditingController controller,
    required bool hide,
    required VoidCallback onToggle,
  }) {
    return SizedBox(
      height: 46,
      child: TextField(
        controller: controller,
        obscureText: hide,
        style: const TextStyle(fontSize: 14, color: Color(0xFF0F172A)),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          suffixIcon: IconButton(
            icon: Icon(
              hide ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              size: 19,
              color: const Color(0xFF64748B),
            ),
            onPressed: onToggle,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF0F172A), width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownInput({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF64748B)),
          style: const TextStyle(fontSize: 14, color: Color(0xFF0F172A)),
          items: items.map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Text(e, overflow: TextOverflow.ellipsis),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildCheckboxRow({
    required bool value,
    required ValueChanged<bool?> onChanged,
    required InlineSpan textSpan,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF0F172A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(color: Color(0xFF94A3B8), width: 1.5),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: RichText(text: textSpan)),
      ],
    );
  }

  Widget _primaryDarkButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0F172A),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildFooterSignInLink() {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              children: [
                TextSpan(text: 'Already have an organization? '),
                TextSpan(
                  text: 'Sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2563EB),
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
