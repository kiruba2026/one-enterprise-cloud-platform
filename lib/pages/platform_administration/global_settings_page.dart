import 'package:flutter/material.dart';

class GlobalSettingsPage extends StatefulWidget {
  const GlobalSettingsPage({super.key});

  @override
  State<GlobalSettingsPage> createState() {
    return _GlobalSettingsPageState();
  }
}

class _GlobalSettingsPageState extends State<GlobalSettingsPage> {
  // ================================================================
  // CONTROLLERS
  // ================================================================

  final TextEditingController platformNameController = TextEditingController(
    text: 'OneCloud - Enterprise Platform',
  );

  final TextEditingController sessionTimeoutController = TextEditingController(
    text: '30',
  );

  // ================================================================
  // SETTINGS
  // ================================================================

  String selectedLanguage = 'English';

  String selectedTimeZone = 'Asia/Kolkata';

  String selectedCurrency = 'INR (₹)';

  bool emailNotifications = true;

  bool smsNotifications = true;

  bool pushNotifications = true;

  bool multiFactorAuthentication = true;

  // ================================================================
  // SAVE SETTINGS
  // ================================================================

  void saveSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Global settings saved successfully')),
    );
  }

  // ================================================================
  // CANCEL
  // ================================================================

  void cancelSettings() {
    setState(() {
      platformNameController.text = 'OneCloud - Enterprise Platform';

      sessionTimeoutController.text = '30';

      selectedLanguage = 'English';

      selectedTimeZone = 'Asia/Kolkata';

      selectedCurrency = 'INR (₹)';

      emailNotifications = true;

      smsNotifications = true;

      pushNotifications = true;

      multiFactorAuthentication = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Changes have been cancelled')),
    );
  }

  // ================================================================
  // DISPOSE
  // ================================================================

  @override
  void dispose() {
    platformNameController.dispose();

    sessionTimeoutController.dispose();

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),

          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // ==================================================
                  // PAGE HEADER
                  // ==================================================

                  const Text(
                    'Global Settings',

                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF172033),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Manage platform-wide configuration and preferences.',

                    style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
                  ),

                  const SizedBox(height: 28),

                  // ==================================================
                  // GENERAL SETTINGS
                  // ==================================================
                  _buildSectionCard(
                    title: 'General Settings',
                    icon: Icons.settings_outlined,
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: platformNameController,
                          label: 'Platform Name',
                          hint: 'Enter platform name',
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Expanded(
                              child: _buildDropdown(
                                label: 'Default Language',
                                value: selectedLanguage,
                                items: const ['English', 'Tamil', 'Hindi'],
                                onChanged: (value) {
                                  setState(() {
                                    selectedLanguage = value!;
                                  });
                                },
                              ),
                            ),

                            const SizedBox(width: 20),

                            Expanded(
                              child: _buildDropdown(
                                label: 'Default Time Zone',
                                value: selectedTimeZone,
                                items: const [
                                  'Asia/Kolkata',
                                  'UTC',
                                  'Asia/Singapore',
                                  'Europe/London',
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedTimeZone = value!;
                                  });
                                },
                              ),
                            ),

                            const SizedBox(width: 20),

                            Expanded(
                              child: _buildDropdown(
                                label: 'Default Currency',
                                value: selectedCurrency,
                                items: const [
                                  'INR (₹)',
                                  'USD (\$)',
                                  'EUR (€)',
                                  'GBP (£)',
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedCurrency = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ==================================================
                  // NOTIFICATION SETTINGS
                  // ==================================================
                  _buildSectionCard(
                    title: 'Notification Settings',
                    icon: Icons.notifications_outlined,
                    child: Column(
                      children: [
                        _buildSwitchRow(
                          title: 'Email Notifications',
                          description: 'Enable platform email notifications.',
                          value: emailNotifications,
                          onChanged: (value) {
                            setState(() {
                              emailNotifications = value;
                            });
                          },
                        ),

                        const Divider(height: 1),

                        _buildSwitchRow(
                          title: 'SMS Notifications',
                          description: 'Enable platform SMS notifications.',
                          value: smsNotifications,
                          onChanged: (value) {
                            setState(() {
                              smsNotifications = value;
                            });
                          },
                        ),

                        const Divider(height: 1),

                        _buildSwitchRow(
                          title: 'Push Notifications',
                          description:
                              'Enable mobile and browser push notifications.',
                          value: pushNotifications,
                          onChanged: (value) {
                            setState(() {
                              pushNotifications = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ==================================================
                  // SECURITY SETTINGS
                  // ==================================================
                  _buildSectionCard(
                    title: 'Security Settings',
                    icon: Icons.security_outlined,
                    child: Column(
                      children: [
                        _buildSwitchRow(
                          title: 'Multi-Factor Authentication',
                          description:
                              'Require additional verification during sign-in.',
                          value: multiFactorAuthentication,
                          onChanged: (value) {
                            setState(() {
                              multiFactorAuthentication = value;
                            });
                          },
                        ),

                        const Divider(height: 1),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Session Timeout',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF172033),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Automatically end inactive sessions.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              width: 120,
                              child: TextField(
                                controller: sessionTimeoutController,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  suffixText: 'min',
                                  filled: true,
                                  fillColor: const Color(0xFFF8FAFC),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFE2E8F0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ==================================================
                  // ACTION BUTTONS
                  // ==================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      OutlinedButton(
                        onPressed: cancelSettings,

                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(110, 46),
                          side: const BorderSide(color: Color(0xFFE2E8F0)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        child: const Text('Cancel'),
                      ),

                      const SizedBox(width: 12),

                      ElevatedButton.icon(
                        onPressed: saveSettings,

                        icon: const Icon(Icons.save_outlined, size: 18),

                        label: const Text('Save Changes'),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1877F2),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(150, 46),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================================================================
  // SECTION CARD
  // ================================================================

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: const Color(0xFFE2E8F0)),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,

                decoration: BoxDecoration(
                  color: const Color(0xFFEAF3FF),
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Icon(icon, color: const Color(0xFF1877F2), size: 20),
              ),

              const SizedBox(width: 12),

              Text(
                title,

                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF172033),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          child,
        ],
      ),
    );
  }

  // ================================================================
  // TEXT FIELD
  // ================================================================

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        labelText: label,
        hintText: hint,

        filled: true,

        fillColor: const Color(0xFFF8FAFC),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),

          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),

          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),

          borderSide: const BorderSide(color: Color(0xFF1877F2), width: 2),
        ),
      ),
    );
  }

  // ================================================================
  // DROPDOWN
  // ================================================================

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,

      decoration: InputDecoration(
        labelText: label,

        filled: true,

        fillColor: const Color(0xFFF8FAFC),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),

          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),

          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
      ),

      items: items.map((item) {
        return DropdownMenuItem<String>(value: item, child: Text(item));
      }).toList(),

      onChanged: onChanged,
    );
  }

  // ================================================================
  // SWITCH ROW
  // ================================================================

  Widget _buildSwitchRow({
    required String title,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF172033),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  description,

                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),

          Switch(
            value: value,

            activeThumbColor: const Color(0xFF1877F2),

            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
