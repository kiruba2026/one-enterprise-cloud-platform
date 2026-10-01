import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../widgets/app_header.dart';
import '../widgets/app_sidebar.dart';
import '../widgets/app_footer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // =============================================================
  // STATE
  // =============================================================

  String selectedMenu = 'Dashboard';

  // Desktop / tablet sidebar
  bool sidebarOpen = true;

  // Mobile sidebar
  bool mobileSidebarOpen = false;

  // Header height used on mobile
  static const double mobileHeaderHeight = 72;

  // Parent sections that toggle sub-menus and must not close the sidebar
  static const Set<String> _parentSections = {
    'Platform Administration',
    'HRMS',
    'CRM',
    'ERP',
    'Finance & Accounting',
    'Workflow & Automation',
    'Document Management',
    'Subscription',
    'Revenue',
    'Reporting & BI',
    'Enterprise AI',
    'Notification',
    'Calendar',
    'Integration',
    'Search',
    'Security & Compliance',
  };

  // =============================================================
  // MENU SELECTION
  // =============================================================

  void selectMenu(String menu) {
    if (_parentSections.contains(menu)) {
      return;
    }

    setState(() {
      selectedMenu = menu;
      mobileSidebarOpen = false;
    });

    switch (menu) {
      case 'Dashboard':
        break;
      default:
        _navigateToMenu(menu);
        break;
    }
  }

  // =============================================================
  // MENU NAVIGATION
  // =============================================================

  void _navigateToMenu(String menu) {
    final Map<String, String> routes = {
      'Employees': AppRoutes.employeeManagement,
      'Finance': AppRoutes.generalLedger,
      'Procurement': AppRoutes.procurement,
      'Inventory': AppRoutes.inventory,
      'Documents': AppRoutes.documentRepository,
      'Reports': AppRoutes.standardReports,
      'AI Copilot': AppRoutes.aiChatCopilot,
      'Calendar': AppRoutes.userCalendars,
    };

    final String? route = routes[menu];
    if (route != null) {
      Navigator.pushNamed(context, route);
    }
  }

  // =============================================================
  // DESKTOP / TABLET SIDEBAR
  // =============================================================

  void toggleSidebar() {
    setState(() {
      sidebarOpen = !sidebarOpen;
    });
  }

  // =============================================================
  // MOBILE SIDEBAR
  // =============================================================

  void toggleMobileSidebar() {
    setState(() {
      mobileSidebarOpen = !mobileSidebarOpen;
    });
  }

  void closeMobileSidebar() {
    if (mobileSidebarOpen) {
      setState(() {
        mobileSidebarOpen = false;
      });
    }
  }

  // =============================================================
  // QUICK ACCESS
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
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;

            if (width < 700) {
              return _buildMobileLayout();
            }

            return _buildDesktopLayout();
          },
        ),
      ),
    );
  }

  // =============================================================
  // MOBILE LAYOUT
  // =============================================================

  Widget _buildMobileLayout() {
    return Stack(
      children: [
        // MAIN CONTENT
        Column(
          children: [
            AppHeader(onMenuPressed: toggleMobileSidebar),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                child: _buildDashboardContent(),
              ),
            ),
          ],
        ),

        // DARK OVERLAY
        if (mobileSidebarOpen)
          Positioned.fill(
            top: mobileHeaderHeight,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: closeMobileSidebar,
              child: Container(color: Colors.black.withValues(alpha: 0.35)),
            ),
          ),

        // MOBILE SIDEBAR
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          left: mobileSidebarOpen ? 0 : -270,
          top: mobileHeaderHeight,
          bottom: 90, // Lifted above mobile browser bottom navigation bars
          width: 270,
          child: Material(
            elevation: 16,
            color: const Color(0xFF071A3D),
            child: AppSidebar(
              selectedMenu: selectedMenu,
              onMenuSelected: selectMenu,
            ),
          ),
        ),
      ],
    );
  }

  // =============================================================
  // DESKTOP / TABLET LAYOUT
  // =============================================================

  Widget _buildDesktopLayout() {
    return Column(
      children: [
        AppHeader(onMenuPressed: toggleSidebar),
        Expanded(
          child: Row(
            children: [
              if (sidebarOpen)
                AppSidebar(
                  selectedMenu: selectedMenu,
                  onMenuSelected: selectMenu,
                ),
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

  // =============================================================
  // DASHBOARD CONTENT
  // =============================================================

  Widget _buildDashboardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          style: TextStyle(fontSize: 15, color: Color(0xFF64748B)),
        ),
        const SizedBox(height: 24),
        _buildKpiSection(),
        const SizedBox(height: 24),
        _buildSalesAndApprovalsSection(),
        const SizedBox(height: 24),
        _buildQuickAccessCard(),
        const SizedBox(height: 24),
        _buildAiRecommendationCard(),
        const SizedBox(height: 30),
        const AppFooter(),
      ],
    );
  }

  // =============================================================
  // KPI SECTION
  // =============================================================

  Widget _buildKpiSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableWidth = constraints.maxWidth;
        int columns;

        if (availableWidth >= 1100) {
          columns = 4;
        } else if (availableWidth >= 600) {
          columns = 2;
        } else {
          columns = 1;
        }

        const double spacing = 16;
        final double cardWidth = columns == 1
            ? availableWidth
            : (availableWidth - ((columns - 1) * spacing)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            _buildKpiCard(
              width: cardWidth,
              title: 'Revenue',
              value: '₹12.5M',
              subtitle: '+8.5% this month',
              icon: Icons.trending_up,
            ),
            _buildKpiCard(
              width: cardWidth,
              title: 'Profit',
              value: '₹4.2M',
              subtitle: '+6.2% this month',
              icon: Icons.account_balance,
            ),
            _buildKpiCard(
              width: cardWidth,
              title: 'Employees',
              value: '2,458',
              subtitle: 'Active employees',
              icon: Icons.people_outline,
            ),
            _buildKpiCard(
              width: cardWidth,
              title: 'Customers',
              value: '1,284',
              subtitle: '+12.4% growth',
              icon: Icons.business_outlined,
            ),
          ],
        );
      },
    );
  }

  // =============================================================
  // KPI CARD
  // =============================================================

  Widget _buildKpiCard({
    required double width,
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
  }) {
    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF3FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFF0B6FF9), size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF172033),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
          _buildPipelineRow('Leads', '428', 0.85),
          const SizedBox(height: 18),
          _buildPipelineRow('Opportunities', '186', 0.65),
          const SizedBox(height: 18),
          _buildPipelineRow('Quotations', '92', 0.45),
          const SizedBox(height: 18),
          _buildPipelineRow('Closed Deals', '47', 0.30),
        ],
      ),
    );
  }

  // =============================================================
  // PIPELINE ROW
  // =============================================================

  Widget _buildPipelineRow(String title, String value, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF172033),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 7,
            backgroundColor: const Color(0xFFE6EDF5),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1877F2)),
          ),
        ),
      ],
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
          const Text(
            'Pending Approvals',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF172033),
            ),
          ),
          const SizedBox(height: 15),
          _approvalRow(
            Icons.shopping_cart_outlined,
            'Purchase Request',
            '₹2,40,000',
          ),
          _approvalRow(Icons.person_outline, 'Leave Request', '3 Employees'),
          _approvalRow(
            Icons.account_balance_outlined,
            'Expense Claim',
            '₹18,500',
          ),
          _approvalRow(
            Icons.description_outlined,
            'Document Approval',
            '5 Documents',
          ),
        ],
      ),
    );
  }

  // =============================================================
  // APPROVAL ROW
  // =============================================================

  Widget _approvalRow(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE8EDF3))),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF0B6FF9)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF172033),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
        ],
      ),
    );
  }

  // =============================================================
  // QUICK ACCESS
  // =============================================================

  Widget _buildQuickAccessCard() {
    final List<String> items = [
      'Employees',
      'Finance',
      'Procurement',
      'Inventory',
      'Documents',
      'Reports',
      'AI Copilot',
      'Calendar',
    ];

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
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: items.map((item) {
              return OutlinedButton(
                onPressed: () => openQuickAccess(item),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF0B6FF9),
                  side: const BorderSide(color: Color(0xFFD6E5F8)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(item),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // =============================================================
  // AI RECOMMENDATION
  // =============================================================

  Widget _buildAiRecommendationCard() {
    return _whiteCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.auto_awesome, color: Color(0xFF0B6FF9)),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Recommendations',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF172033),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'AI-powered recommendations and insights will appear here as Enterprise AI services are connected.',
                  style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
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
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
