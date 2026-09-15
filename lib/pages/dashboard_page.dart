import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../widgets/app_header.dart';
import '../widgets/app_sidebar.dart';
import '../widgets/app_footer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  // =============================================================
  // SELECTED SIDEBAR MENU
  // =============================================================

  String selectedMenu = 'Dashboard';

  // =============================================================
  // SIDEBAR OPEN / CLOSE
  // =============================================================

  bool sidebarOpen = true;

  // =============================================================
  // SELECT MENU
  // =============================================================

  void selectMenu(String menu) {
    setState(() {
      selectedMenu = menu;
    });
  }

  // =============================================================
  // TOGGLE SIDEBAR
  // =============================================================

  void toggleSidebar() {
    setState(() {
      sidebarOpen = !sidebarOpen;
    });
  }

  // =============================================================
  // QUICK ACCESS NAVIGATION
  // =============================================================

  void openQuickAccess(String title) {
    switch (title) {
      case 'Employees':
        Navigator.pushNamed(context, AppRoutes.employeeManagement);
        break;

      case 'Finance':
        Navigator.pushNamed(context, AppRoutes.generalLedger);
        break;

      case 'Procurement':
        Navigator.pushNamed(context, AppRoutes.procurement);
        break;

      case 'Inventory':
        Navigator.pushNamed(context, AppRoutes.inventory);
        break;

      case 'Documents':
        Navigator.pushNamed(context, AppRoutes.documentRepository);
        break;

      case 'Reports':
        Navigator.pushNamed(context, AppRoutes.standardReports);
        break;

      case 'AI Copilot':
        Navigator.pushNamed(context, AppRoutes.aiChatCopilot);
        break;

      case 'Calendar':
        Navigator.pushNamed(context, AppRoutes.userCalendars);
        break;
    }
  }

  // =============================================================
  // BUILD
  // =============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FC),
      body: Column(
        children: [
          // =====================================================
          // HEADER
          // =====================================================

          AppHeader(onMenuPressed: toggleSidebar),

          // =====================================================
          // MAIN AREA
          // =====================================================
          Expanded(
            child: Row(
              children: [
                // =================================================
                // SIDEBAR
                // =================================================

                if (sidebarOpen)
                  AppSidebar(
                    selectedMenu: selectedMenu,
                    onMenuSelected: selectMenu,
                  ),

                // =================================================
                // DASHBOARD CONTENT
                // =================================================
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // =================================================
                        // PAGE TITLE
                        // =================================================

                        const Text(
                          'Dashboard',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF172033),
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          'Welcome to OneCloud Enterprise Platform',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF64748B),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // =================================================
                        // KPI CARDS
                        // =================================================
                        _buildKpiSection(),

                        const SizedBox(height: 24),

                        // =================================================
                        // SALES PIPELINE + PENDING APPROVALS
                        // =================================================
                        _buildSalesAndApprovalsSection(),

                        const SizedBox(height: 24),

                        // =================================================
                        // QUICK ACCESS
                        // =================================================
                        _buildQuickAccessCard(),

                        const SizedBox(height: 24),

                        // =================================================
                        // AI RECOMMENDATIONS
                        // =================================================
                        _buildAiRecommendationCard(),

                        const SizedBox(height: 30),

                        // =================================================
                        // FOOTER
                        // =================================================
                        const AppFooter(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =============================================================
  // KPI SECTION
  // =============================================================

  Widget _buildKpiSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth;

        if (constraints.maxWidth >= 1100) {
          cardWidth = (constraints.maxWidth - 48) / 4;
        } else if (constraints.maxWidth >= 600) {
          cardWidth = (constraints.maxWidth - 16) / 2;
        } else {
          cardWidth = constraints.maxWidth;
        }

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            DashboardCard(
              width: cardWidth,
              title: 'Revenue',
              value: '₹12.5M',
              subtitle: '+8.5% this month',
              icon: Icons.trending_up,
            ),
            DashboardCard(
              width: cardWidth,
              title: 'Profit',
              value: '₹4.2M',
              subtitle: '+6.2% this month',
              icon: Icons.account_balance,
            ),
            DashboardCard(
              width: cardWidth,
              title: 'Employees',
              value: '2,458',
              subtitle: 'Active employees',
              icon: Icons.people,
            ),
            DashboardCard(
              width: cardWidth,
              title: 'Customers',
              value: '1,284',
              subtitle: '+12.4% growth',
              icon: Icons.business,
            ),
          ],
        );
      },
    );
  }

  // =============================================================
  // SALES + APPROVALS
  // =============================================================

  Widget _buildSalesAndApprovalsSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return Column(
            children: [
              _buildSalesPipelineCard(),
              const SizedBox(height: 20),
              _buildPendingApprovalsCard(),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildSalesPipelineCard()),
            const SizedBox(width: 20),
            Expanded(child: _buildPendingApprovalsCard()),
          ],
        );
      },
    );
  }

  // =============================================================
  // SALES PIPELINE
  // =============================================================

  Widget _buildSalesPipelineCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sales Pipeline',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF172033),
            ),
          ),

          const SizedBox(height: 20),

          _buildPipelineRow('Leads', '428', 0.75),

          _buildPipelineRow('Opportunities', '186', 0.55),

          _buildPipelineRow('Quotations', '92', 0.38),

          _buildPipelineRow('Closed Deals', '47', 0.25),
        ],
      ),
    );
  }

  Widget _buildPipelineRow(String title, String value, double progress) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Color(0xFF172033))),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF172033),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          LinearProgressIndicator(
            value: progress,
            minHeight: 7,
            backgroundColor: const Color(0xFFE3EDF8),
            valueColor: const AlwaysStoppedAnimation(Color(0xFF1877F2)),
          ),
        ],
      ),
    );
  }

  // =============================================================
  // PENDING APPROVALS
  // =============================================================

  Widget _buildPendingApprovalsCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pending Approvals',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF172033),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F1FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '8 Pending',
                  style: TextStyle(
                    color: Color(0xFF1877F2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          _buildApprovalRow(
            Icons.receipt_long,
            'Purchase Request',
            '₹2,40,000',
          ),

          _buildApprovalRow(Icons.person, 'Leave Request', '3 Employees'),

          _buildApprovalRow(Icons.account_balance, 'Expense Claim', '₹18,500'),

          _buildApprovalRow(
            Icons.description,
            'Document Approval',
            '5 Documents',
          ),
        ],
      ),
    );
  }

  Widget _buildApprovalRow(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF1877F2)),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF172033),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right, color: Color(0xFF8A8D91)),
        ],
      ),
    );
  }

  // =============================================================
  // QUICK ACCESS
  // =============================================================

  Widget _buildQuickAccessCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF172033),
            ),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildQuickButton(Icons.people, 'Employees'),

              _buildQuickButton(Icons.attach_money, 'Finance'),

              _buildQuickButton(Icons.shopping_cart, 'Procurement'),

              _buildQuickButton(Icons.inventory, 'Inventory'),

              _buildQuickButton(Icons.description, 'Documents'),

              _buildQuickButton(Icons.analytics, 'Reports'),

              _buildQuickButton(Icons.smart_toy, 'AI Copilot'),

              _buildQuickButton(Icons.calendar_month, 'Calendar'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickButton(IconData icon, String title) {
    return OutlinedButton.icon(
      onPressed: () {
        openQuickAccess(title);
      },
      icon: Icon(icon, size: 20),
      label: Text(title),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF1877F2),
        side: const BorderSide(color: Color(0xFFD6E4F5)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // =============================================================
  // AI RECOMMENDATIONS
  // =============================================================

  Widget _buildAiRecommendationCard() {
    return _whiteCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F1FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.auto_awesome,
              size: 30,
              color: Color(0xFF1877F2),
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Recommendations',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF172033),
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  'AI-powered recommendations and insights will appear here as Enterprise AI services are connected.',
                  style: TextStyle(color: Color(0xFF64748B), height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =============================================================
  // COMMON WHITE CARD
  // =============================================================

  Widget _whiteCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE3EAF2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

// =============================================================
// DASHBOARD KPI CARD
// =============================================================

class DashboardCard extends StatelessWidget {
  final double width;
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  const DashboardCard({
    super.key,
    required this.width,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE3EAF2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 14),
              ),

              Icon(icon, color: const Color(0xFF1877F2)),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            value,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF172033),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }
}
