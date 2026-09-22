import 'package:flutter/material.dart';

class SuperAdminDashboardPage extends StatelessWidget {
  const SuperAdminDashboardPage({super.key});

  static const Color navy = Color(0xFF0B1230);
  static const Color blue = Color(0xFF2563EB);
  static const Color lightBlue = Color(0xFFEFF4FF);
  static const Color background = Color(0xFFF7F8FC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;

          if (isMobile) {
            return _buildMobileLayout(context);
          }

          return _buildDesktopLayout(context);
        },
      ),
    );
  }

  // ============================================================
  // DESKTOP
  // ============================================================

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 245, child: _Sidebar()),

        Expanded(
          child: Column(
            children: [
              const _TopHeader(),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: _buildDashboardContent(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.cloud, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Text(
              'OneCloud',
              style: TextStyle(
                color: blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: navy),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const Drawer(child: _Sidebar()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _buildDashboardContent(),
      ),
    );
  }

  // ============================================================
  // DASHBOARD CONTENT
  // ============================================================

  Widget _buildDashboardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Breadcrumb
        const Text(
          'Platform Administration  /  Dashboard',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),

        const SizedBox(height: 8),

        // Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Super Admin Dashboard',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome back, Super Admin',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh, size: 16),
                  label: const Text('Refresh'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download, size: 16),
                  label: const Text('Export report'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 24),

        const Text(
          'PLATFORM OVERVIEW',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 12),

        // Statistics
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            int count;

            if (width > 1000) {
              count = 4;
            } else if (width > 600) {
              count = 2;
            } else {
              count = 1;
            }

            return GridView.count(
              crossAxisCount: count,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.4,
              children: const [
                _StatCard(
                  title: 'TOTAL USERS',
                  value: '96,412',
                  subtitle: '↑ 1.8% this month',
                  icon: Icons.people_outline,
                  iconColor: Colors.green,
                ),
                _StatCard(
                  title: 'ACTIVE USERS',
                  value: '78,930',
                  subtitle: '4,215 online now',
                  icon: Icons.check_circle_outline,
                  iconColor: Colors.blue,
                ),
                _StatCard(
                  title: 'ORGANIZATIONS',
                  value: '1,842',
                  subtitle: '↑ 4.2% this month',
                  icon: Icons.business_outlined,
                  iconColor: Colors.orange,
                ),
                _StatCard(
                  title: 'LICENSES ACTIVE',
                  value: '2,140',
                  subtitle: '27 expiring < 30 days',
                  icon: Icons.description_outlined,
                  iconColor: Colors.white,
                  dark: true,
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 24),

        const Text(
          'SYSTEM STATUS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 12),

        LayoutBuilder(
          builder: (context, constraints) {
            final count = constraints.maxWidth > 700 ? 4 : 1;

            return GridView.count(
              crossAxisCount: count,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3.5,
              children: const [
                _StatusCard(
                  title: 'SERVER STATUS',
                  status: 'Healthy',
                  icon: Icons.dns_outlined,
                ),
                _StatusCard(
                  title: 'DATABASE',
                  status: 'Connected',
                  icon: Icons.storage_outlined,
                ),
                _StatusCard(
                  title: 'API GATEWAY',
                  status: 'Running',
                  icon: Icons.api_outlined,
                ),
                _StatusCard(
                  title: 'STORAGE',
                  status: '68% used',
                  icon: Icons.sd_storage_outlined,
                  warning: true,
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 24),

        _resourceUtilization(),

        const SizedBox(height: 24),

        const Text(
          'QUICK NAVIGATION',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 12),

        LayoutBuilder(
          builder: (context, constraints) {
            final count = constraints.maxWidth > 1000
                ? 4
                : constraints.maxWidth > 600
                ? 2
                : 1;

            return GridView.count(
              crossAxisCount: count,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.8,
              children: const [
                _NavigationCard(
                  icon: Icons.people_outline,
                  title: 'User Management',
                  subtitle: 'Manage accounts & roles',
                ),
                _NavigationCard(
                  icon: Icons.settings_outlined,
                  title: 'Platform Settings',
                  subtitle: 'Global configuration',
                ),
                _NavigationCard(
                  icon: Icons.description_outlined,
                  title: 'License Management',
                  subtitle: 'Renewals & seat usage',
                ),
                _NavigationCard(
                  icon: Icons.receipt_long_outlined,
                  title: 'Audit Logs',
                  subtitle: 'Track admin actions',
                ),
                _NavigationCard(
                  icon: Icons.notifications_none,
                  title: 'Notifications',
                  subtitle: 'Notification centre',
                ),
                _NavigationCard(
                  icon: Icons.backup_outlined,
                  title: 'Backup & Recovery',
                  subtitle: 'Snapshots & restore',
                ),
                _NavigationCard(
                  icon: Icons.bar_chart_outlined,
                  title: 'Reports',
                  subtitle: 'Platform analytics',
                ),
                _NavigationCard(
                  icon: Icons.security_outlined,
                  title: 'Security Center',
                  subtitle: 'Threats & policies',
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 24),

        _bottomSection(),
      ],
    );
  }

  // ============================================================
  // RESOURCE UTILIZATION
  // ============================================================

  Widget _resourceUtilization() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RESOURCE UTILIZATION',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 20),

          _resourceRow('CPU usage', 0.42, '42%'),

          const SizedBox(height: 18),

          _resourceRow('Memory usage', 0.57, '57%'),

          const SizedBox(height: 18),

          _resourceRow('Storage', 0.68, '68%'),
        ],
      ),
    );
  }

  Widget _resourceRow(String title, double value, String percentage) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 13, color: navy)),
            Text(
              percentage,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
          ],
        ),

        const SizedBox(height: 7),

        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 6,
            backgroundColor: const Color(0xFFE5E7EB),
            valueColor: const AlwaysStoppedAnimation<Color>(blue),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // BOTTOM SECTION
  // ============================================================

  Widget _bottomSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _securityAlerts()),
              const SizedBox(width: 16),
              Expanded(child: _recentActivities()),
            ],
          );
        }

        return Column(
          children: [
            _securityAlerts(),
            const SizedBox(height: 16),
            _recentActivities(),
          ],
        );
      },
    );
  }

  Widget _securityAlerts() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Security alerts',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: navy,
            ),
          ),

          const SizedBox(height: 14),

          _alert(
            Icons.warning_amber_rounded,
            '27 licenses expiring within 30 days',
            'Review renewals before Sep 22.',
          ),

          const SizedBox(height: 8),

          _alert(
            Icons.info_outline,
            '3 organizations awaiting activation approval',
            'Submitted via self-signup, pending review.',
          ),

          const SizedBox(height: 8),

          _alert(
            Icons.lock_outline,
            'Unusual login pattern detected',
            'Delta Retail Group – 3 logins from new locations.',
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('View all alerts'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _alert(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7E8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.orange),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: navy,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentActivities() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent login activities',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: navy,
            ),
          ),

          const SizedBox(height: 14),

          _activity(
            'Ana Ferreira signed in from Lisbon, PT',
            '14 minutes ago',
            true,
          ),

          _activity(
            'Unrecognized device signed in to Delta Retail Group',
            '52 minutes ago',
            false,
          ),

          _activity('Renu Kapoor signed in', '3 hours ago', true),

          _activity('Renu Kapoor signed in', '3 hours ago', true),
        ],
      ),
    );
  }

  Widget _activity(String title, String time, bool success) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: success
                ? const Color(0xFFE8F8EF)
                : const Color(0xFFFFF2DC),
            child: Icon(
              success ? Icons.check : Icons.priority_high,
              size: 12,
              color: success ? Colors.green : Colors.orange,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 12, color: navy),
            ),
          ),

          const SizedBox(width: 8),

          Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color(0xFFE5E7EB)),
    );
  }
}

// ============================================================
// STAT CARD
// ============================================================

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final bool dark;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF272F9B) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: dark ? null : Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 1,
                    color: dark ? Colors.white70 : Colors.grey,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  value,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: dark ? Colors.white : const Color(0xFF182238),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    color: dark ? Colors.white70 : Colors.green,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: dark
                  ? Colors.white.withValues(alpha: 0.15)
                  : const Color(0xFFEFF4FF),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, size: 19, color: iconColor),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// STATUS CARD
// ============================================================

class _StatusCard extends StatelessWidget {
  final String title;
  final String status;
  final IconData icon;
  final bool warning;

  const _StatusCard({
    required this.title,
    required this.status,
    required this.icon,
    this.warning = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF64748B)),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: warning ? Colors.orange : Colors.green,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      status,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF182238),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// QUICK NAVIGATION CARD
// ============================================================

class _NavigationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _NavigationCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF4FF),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, size: 18, color: const Color(0xFF4F6BFF)),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF182238),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SIDEBAR
// ============================================================

class _Sidebar extends StatelessWidget {
  const _Sidebar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0B1230),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.cloud, color: Colors.white),
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    'OneCloud',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            _section('SUPER ADMIN MANAGEMENT'),

            _menu(Icons.dashboard_outlined, 'Super Admin Dashboard', true),
            _menu(Icons.public, 'Platform Administration'),
            _menu(Icons.bar_chart_outlined, 'Global Dashboard'),
            _menu(Icons.settings_outlined, 'Platform Configuration'),
            _menu(Icons.brush_outlined, 'Platform Branding'),
            _menu(Icons.layers_outlined, 'Feature Management'),
            _menu(Icons.description_outlined, 'License Management'),
            _menu(Icons.tune, 'Settings'),

            const SizedBox(height: 10),

            _section('ORGANIZATION'),

            _menu(Icons.business_outlined, 'Company Setup'),
            _menu(Icons.people_outline, 'User Management'),

            const Spacer(),

            _menu(Icons.language, 'Language'),
            _menu(Icons.logout, 'Log out'),

            const SizedBox(height: 12),

            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFF2435B5),
                    child: Text(
                      'KR',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),

                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Super Admin',
                        style: TextStyle(color: Colors.white60, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _section(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 9,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _menu(IconData icon, String title, [bool selected = false]) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF1769E8) : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          Icon(icon, size: 17, color: selected ? Colors.white : Colors.white70),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: selected ? Colors.white : Colors.white70,
                fontSize: 11,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TOP HEADER
// ============================================================

class _TopHeader extends StatelessWidget {
  const _TopHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, size: 18, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Search tenants, users, settings, audit logs...',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF182238),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined, color: Color(0xFF182238)),
          ),

          const SizedBox(width: 8),

          const CircleAvatar(
            radius: 17,
            backgroundColor: Color(0xFF2435B5),
            child: Text('R', style: TextStyle(color: Colors.white)),
          ),

          const SizedBox(width: 8),

          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Super Admin',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
              Text(
                'Administrator',
                style: TextStyle(fontSize: 9, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(width: 5),

          const Icon(Icons.keyboard_arrow_down, size: 18),
        ],
      ),
    );
  }
}
