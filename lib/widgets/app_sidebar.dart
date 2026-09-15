import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class AppSidebar extends StatefulWidget {
  final String selectedMenu;
  final Function(String) onMenuSelected;

  const AppSidebar({
    super.key,
    required this.selectedMenu,
    required this.onMenuSelected,
  });

  @override
  State<AppSidebar> createState() {
    return _AppSidebarState();
  }
}

class _AppSidebarState extends State<AppSidebar> {
  // ================================================================
  // EXPANDED MENU STATE
  // ================================================================

  final Map<String, bool> expandedMenus = {
    'Platform Administration': false,
    'HRMS': false,
    'CRM': false,
    'ERP': false,
    'Finance & Accounting': false,
    'Workflow & Automation': false,
    'Document Management': false,
    'Subscription': false,
    'Revenue': false,
    'Reporting & BI': false,
    'Enterprise AI': false,
    'Notification': false,
    'Calendar': false,
    'Integration': false,
    'Search': false,
    'Security & Compliance': false,
  };

  // ================================================================
  // BUILD
  // ================================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xFF071A3D),
      child: Column(
        children: [
          // ==========================================================
          // SIDEBAR MENU
          // ==========================================================

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                // ====================================================
                // MAIN MENU
                // ====================================================

                _sectionTitle('MAIN MENU'),

                _mainMenuItem(
                  icon: Icons.dashboard_outlined,
                  title: 'Dashboard',
                  route: AppRoutes.dashboard,
                ),

                const SizedBox(height: 12),

                // ====================================================
                // PLATFORM
                // ====================================================
                _sectionTitle('PLATFORM'),

                _expandableMenu(
                  icon: Icons.admin_panel_settings_outlined,
                  title: 'Platform Administration',
                  children: [
                    _SubMenu('Global Settings', AppRoutes.globalSettings),
                    _SubMenu('Platform Config', AppRoutes.platformConfig),
                    _SubMenu('License Mgmt.', AppRoutes.licenseManagement),
                    _SubMenu('Feature Mgmt.', AppRoutes.featureManagement),
                    _SubMenu('Resource Mgmt.', AppRoutes.resourceManagement),
                    _SubMenu('System Health', AppRoutes.systemHealth),
                    _SubMenu('Tenant Templates', AppRoutes.tenantTemplates),
                  ],
                ),

                const SizedBox(height: 12),

                // ====================================================
                // BUSINESS MODULES
                // ====================================================
                _sectionTitle('BUSINESS MODULES'),

                // ====================================================
                // HRMS
                // ====================================================
                _expandableMenu(
                  icon: Icons.people_outline,
                  title: 'HRMS',
                  children: [
                    _SubMenu('Employee Mgmt.', AppRoutes.employeeManagement),
                    _SubMenu('Attendance', AppRoutes.attendance),
                    _SubMenu('Leave', AppRoutes.leave),
                    _SubMenu('Payroll', AppRoutes.payroll),
                    _SubMenu('Recruitment', AppRoutes.recruitment),
                    _SubMenu('Performance', AppRoutes.performance),
                    _SubMenu('Learning', AppRoutes.learning),
                    _SubMenu('ESS / MSS', AppRoutes.essMss),
                    _SubMenu('Asset Mgmt.', AppRoutes.hrmsAssetManagement),
                  ],
                ),

                // ====================================================
                // CRM
                // ====================================================
                _expandableMenu(
                  icon: Icons.handshake_outlined,
                  title: 'CRM',
                  children: [
                    _SubMenu('Leads', AppRoutes.leads),
                    _SubMenu('Opportunities', AppRoutes.opportunities),
                    _SubMenu('Accounts', AppRoutes.accounts),
                    _SubMenu('Contacts', AppRoutes.contacts),
                    _SubMenu('Activities', AppRoutes.activities),
                    _SubMenu('Pipeline', AppRoutes.pipeline),
                    _SubMenu('Quotations', AppRoutes.quotations),
                    _SubMenu('Campaigns', AppRoutes.campaigns),
                    _SubMenu('Customer Support', AppRoutes.customerSupport),
                  ],
                ),

                // ====================================================
                // ERP
                // ====================================================
                _expandableMenu(
                  icon: Icons.business_center_outlined,
                  title: 'ERP',
                  children: [
                    _SubMenu('Inventory', AppRoutes.inventory),
                    _SubMenu('Procurement', AppRoutes.procurement),
                    _SubMenu('Production', AppRoutes.production),
                    _SubMenu('Sales Orders', AppRoutes.salesOrders),
                    _SubMenu('Dispatch', AppRoutes.dispatch),
                    _SubMenu('Asset Mgmt.', AppRoutes.erpAssetManagement),
                    _SubMenu('Maintenance', AppRoutes.maintenance),
                    _SubMenu('Vendors', AppRoutes.vendors),
                  ],
                ),

                // ====================================================
                // FINANCE & ACCOUNTING
                // ====================================================
                _expandableMenu(
                  icon: Icons.account_balance_outlined,
                  title: 'Finance & Accounting',
                  children: [
                    _SubMenu('General Ledger', AppRoutes.generalLedger),
                    _SubMenu('Accounts Payable', AppRoutes.accountsPayable),
                    _SubMenu(
                      'Accounts Receivable',
                      AppRoutes.accountsReceivable,
                    ),
                    _SubMenu('Tax Management', AppRoutes.taxManagement),
                    _SubMenu('Budgeting', AppRoutes.budgeting),
                    _SubMenu('Costing', AppRoutes.costing),
                    _SubMenu('Financial Reports', AppRoutes.financialReports),
                    _SubMenu('Reconciliation', AppRoutes.reconciliation),
                    _SubMenu('Multi-Currency', AppRoutes.multiCurrency),
                  ],
                ),

                // ====================================================
                // WORKFLOW & AUTOMATION
                // ====================================================
                _expandableMenu(
                  icon: Icons.account_tree_outlined,
                  title: 'Workflow & Automation',
                  children: [
                    _SubMenu('Workflow Builder', AppRoutes.workflowBuilder),
                    _SubMenu('Approvals', AppRoutes.approvals),
                    _SubMenu('Business Rules', AppRoutes.businessRules),
                    _SubMenu('Process Automation', AppRoutes.processAutomation),
                    _SubMenu('Task Management', AppRoutes.taskManagement),
                    _SubMenu('Triggers', AppRoutes.triggers),
                    _SubMenu('SLAs & Escalations', AppRoutes.slasEscalations),
                    _SubMenu('Process Monitoring', AppRoutes.processMonitoring),
                    _SubMenu('Workflow Templates', AppRoutes.workflowTemplates),
                  ],
                ),

                // ====================================================
                // DOCUMENT MANAGEMENT
                // ====================================================
                _expandableMenu(
                  icon: Icons.folder_outlined,
                  title: 'Document Management',
                  children: [
                    _SubMenu(
                      'Document Repository',
                      AppRoutes.documentRepository,
                    ),
                    _SubMenu('Versioning', AppRoutes.versioning),
                    _SubMenu(
                      'File Upload/Download',
                      AppRoutes.fileUploadDownload,
                    ),
                    _SubMenu('Access Control', AppRoutes.accessControl),
                    _SubMenu('Document Templates', AppRoutes.documentTemplates),
                    _SubMenu('Tagging & Search', AppRoutes.taggingSearch),
                    _SubMenu('Retention Policies', AppRoutes.retentionPolicies),
                    _SubMenu('Audit Trails', AppRoutes.auditTrails),
                    _SubMenu('OCR Integration', AppRoutes.ocrIntegration),
                  ],
                ),

                // ====================================================
                // SUBSCRIPTION
                // ====================================================
                _expandableMenu(
                  icon: Icons.card_membership_outlined,
                  title: 'Subscription',
                  children: [
                    _SubMenu('Plans & Features', AppRoutes.plansFeatures),
                    _SubMenu(
                      'Tenant Subscriptions',
                      AppRoutes.tenantSubscriptions,
                    ),
                    _SubMenu('Usage & Quotas', AppRoutes.usageQuotas),
                    _SubMenu('Payment Tracking', AppRoutes.paymentTracking),
                    _SubMenu('License Allocation', AppRoutes.licenseAllocation),
                    _SubMenu('License Keys', AppRoutes.licenseKeys),
                    _SubMenu('Renewals', AppRoutes.renewals),
                    _SubMenu('Trial Management', AppRoutes.trialManagement),
                    _SubMenu(
                      'Billing Integration',
                      AppRoutes.billingIntegration,
                    ),
                  ],
                ),

                // ====================================================
                // REVENUE
                // ====================================================
                _expandableMenu(
                  icon: Icons.monetization_on_outlined,
                  title: 'Revenue',
                  children: [
                    _SubMenu('Revenue Tracking', AppRoutes.revenueTracking),
                    _SubMenu('Usage Analytics', AppRoutes.usageAnalytics),
                    _SubMenu('Forecasting', AppRoutes.forecasting),
                    _SubMenu('Revenue Reports', AppRoutes.revenueReports),
                    _SubMenu(
                      'Revenue Recognition',
                      AppRoutes.revenueRecognition,
                    ),
                    _SubMenu(
                      'Commission Mgmt.',
                      AppRoutes.commissionManagement,
                    ),
                    _SubMenu(
                      'Financial Analytics',
                      AppRoutes.financialAnalytics,
                    ),
                    _SubMenu('Invoicing', AppRoutes.invoicing),
                    _SubMenu('Integration', AppRoutes.revenueIntegration),
                  ],
                ),

                const SizedBox(height: 12),

                // ====================================================
                // SERVICES
                // ====================================================
                _sectionTitle('SERVICES'),

                // ====================================================
                // REPORTING & BI
                // ====================================================
                _expandableMenu(
                  icon: Icons.analytics_outlined,
                  title: 'Reporting & BI',
                  children: [
                    _SubMenu('Standard Reports', AppRoutes.standardReports),
                    _SubMenu('Ad-hoc Reports', AppRoutes.adHocReports),
                    _SubMenu('Data Exploration', AppRoutes.dataExploration),
                    _SubMenu('BI Management', AppRoutes.biManagement),
                    _SubMenu('Data Export', AppRoutes.dataExport),
                    _SubMenu('Scheduled Reports', AppRoutes.scheduledReports),
                    _SubMenu('Data Visualization', AppRoutes.dataVisualization),
                    _SubMenu(
                      'Self-Service Analytics',
                      AppRoutes.selfServiceAnalytics,
                    ),
                  ],
                ),

                // ====================================================
                // ENTERPRISE AI
                // ====================================================
                _expandableMenu(
                  icon: Icons.auto_awesome_outlined,
                  title: 'Enterprise AI',
                  children: [
                    _SubMenu('AI Models', AppRoutes.aiModels),
                    _SubMenu('AI Chat / Copilot', AppRoutes.aiChatCopilot),
                    _SubMenu('Document AI / OCR', AppRoutes.documentAiOcr),
                    _SubMenu(
                      'Predictive Analytics',
                      AppRoutes.predictiveAnalytics,
                    ),
                    _SubMenu('Recommendations', AppRoutes.recommendations),
                    _SubMenu('AI Workflows', AppRoutes.aiWorkflows),
                    _SubMenu('Model Management', AppRoutes.modelManagement),
                    _SubMenu('Prompt Engineering', AppRoutes.promptEngineering),
                    _SubMenu('AI Usage Logs', AppRoutes.aiUsageLogs),
                  ],
                ),

                // ====================================================
                // NOTIFICATION
                // ====================================================
                _expandableMenu(
                  icon: Icons.notifications_outlined,
                  title: 'Notification',
                  children: [
                    _SubMenu(
                      'In-App Notifications',
                      AppRoutes.inAppNotifications,
                    ),
                    _SubMenu(
                      'Email Notifications',
                      AppRoutes.emailNotifications,
                    ),
                    _SubMenu('SMS Notifications', AppRoutes.smsNotifications),
                    _SubMenu('Push Notifications', AppRoutes.pushNotifications),
                    _SubMenu('Templates', AppRoutes.notificationTemplates),
                    _SubMenu('Preferences', AppRoutes.notificationPreferences),
                    _SubMenu('Schedules', AppRoutes.notificationSchedules),
                    _SubMenu('Delivery Tracking', AppRoutes.deliveryTracking),
                    _SubMenu('Multi-Channel', AppRoutes.multiChannel),
                  ],
                ),

                // ====================================================
                // CALENDAR
                // ====================================================
                _expandableMenu(
                  icon: Icons.calendar_month_outlined,
                  title: 'Calendar',
                  children: [
                    _SubMenu('User Calendars', AppRoutes.userCalendars),
                    _SubMenu('Team Calendars', AppRoutes.teamCalendars),
                    _SubMenu('Meeting Scheduler', AppRoutes.meetingScheduler),
                    _SubMenu('Resource Booking', AppRoutes.resourceBooking),
                    _SubMenu('Reminders', AppRoutes.reminders),
                    _SubMenu(
                      'Integrations (Google, Outlook)',
                      AppRoutes.calendarIntegrations,
                    ),
                    _SubMenu('Availability', AppRoutes.availability),
                    _SubMenu(
                      'Event Notifications',
                      AppRoutes.eventNotifications,
                    ),
                    _SubMenu('Shared Calendars', AppRoutes.sharedCalendars),
                  ],
                ),

                // ====================================================
                // INTEGRATION
                // ====================================================
                _expandableMenu(
                  icon: Icons.integration_instructions_outlined,
                  title: 'Integration',
                  children: [
                    _SubMenu('API Management', AppRoutes.apiManagement),
                    _SubMenu(
                      'Third-Party Integrations',
                      AppRoutes.thirdPartyIntegrations,
                    ),
                    _SubMenu('Webhooks', AppRoutes.webhooks),
                    _SubMenu('Event Streaming', AppRoutes.eventStreaming),
                    _SubMenu(
                      'Data Transformation',
                      AppRoutes.dataTransformation,
                    ),
                    _SubMenu('ETL / Data Sync', AppRoutes.etlDataSync),
                    _SubMenu(
                      'Connectors (ERP, Bank, Payment, etc.)',
                      AppRoutes.connectors,
                    ),
                    _SubMenu('Integration Logs', AppRoutes.integrationLogs),
                  ],
                ),

                // ====================================================
                // SEARCH
                // ====================================================
                _expandableMenu(
                  icon: Icons.search_outlined,
                  title: 'Search',
                  children: [
                    _SubMenu('Global Search', AppRoutes.globalSearch),
                    _SubMenu('Index Management', AppRoutes.indexManagement),
                    _SubMenu('Search Analytics', AppRoutes.searchAnalytics),
                    _SubMenu('Autocomplete', AppRoutes.autocomplete),
                    _SubMenu('Relevance Ranking', AppRoutes.relevanceRanking),
                    _SubMenu('Saved Searches', AppRoutes.savedSearches),
                    _SubMenu('Multi-Tenant Index', AppRoutes.multiTenantIndex),
                    _SubMenu('Synonyms', AppRoutes.synonyms),
                    _SubMenu('Suggestion Engine', AppRoutes.suggestionEngine),
                  ],
                ),

                // ====================================================
                // SECURITY & COMPLIANCE
                // ====================================================
                _expandableMenu(
                  icon: Icons.security_outlined,
                  title: 'Security & Compliance',
                  children: [
                    _SubMenu('Audit Logs', AppRoutes.auditLogs),
                    _SubMenu('Activity Tracking', AppRoutes.activityTracking),
                    _SubMenu('Compliance Reports', AppRoutes.complianceReports),
                    _SubMenu('Data Retention', AppRoutes.dataRetention),
                    _SubMenu('Policy Management', AppRoutes.policyManagement),
                    _SubMenu('Threat Detection', AppRoutes.threatDetection),
                    _SubMenu(
                      'Vulnerability Mgmt.',
                      AppRoutes.vulnerabilityManagement,
                    ),
                    _SubMenu(
                      'Encryption & Key Mgmt.',
                      AppRoutes.encryptionKeyManagement,
                    ),
                    _SubMenu('Security Alerts', AppRoutes.securityAlerts),
                  ],
                ),

                const SizedBox(height: 12),

                // ====================================================
                // SYSTEM
                // ====================================================
                _sectionTitle('SYSTEM'),

                _mainMenuItem(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  route: AppRoutes.settings,
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),

          // ==========================================================
          // USER SECTION
          // ==========================================================
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFF20345A))),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xFFE8F1FF),
                      child: Text(
                        'KR',
                        style: TextStyle(
                          color: Color(0xFF1877F2),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Administrator',
                            style: TextStyle(
                              color: Color(0xFF9EB4D8),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // ====================================================
                // LOGOUT
                // ====================================================
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                    icon: const Icon(Icons.logout_outlined, size: 19),
                    label: const Text('Logout'),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFFF5A5F),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
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

  // ================================================================
  // SECTION TITLE
  // ================================================================

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 7),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF7F94B8),
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.6,
        ),
      ),
    );
  }

  // ================================================================
  // NORMAL MENU ITEM
  // ================================================================

  Widget _mainMenuItem({
    required IconData icon,
    required String title,
    required String route,
  }) {
    final bool selected = widget.selectedMenu == title;

    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      child: Material(
        color: selected ? const Color(0xFF0B6FF9) : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: Icon(
            icon,
            size: 20,
            color: selected ? Colors.white : const Color(0xFFB5C4DC),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFFD8E1F0),
              fontSize: 13,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          onTap: () {
            widget.onMenuSelected(title);

            if (ModalRoute.of(context)?.settings.name != route) {
              Navigator.pushNamed(context, route);
            }
          },
        ),
      ),
    );
  }

  // ================================================================
  // EXPANDABLE MENU
  // ================================================================

  Widget _expandableMenu({
    required IconData icon,
    required String title,
    required List<_SubMenu> children,
  }) {
    final bool expanded = expandedMenus[title] ?? false;

    final bool selected = widget.selectedMenu == title;

    return Column(
      children: [
        // ============================================================
        // PARENT MENU
        // ============================================================

        Container(
          margin: const EdgeInsets.only(bottom: 2),
          child: Material(
            color: selected ? const Color(0xFF0B6FF9) : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              leading: Icon(
                icon,
                size: 20,
                color: selected ? Colors.white : const Color(0xFFB5C4DC),
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFFD8E1F0),
                  fontSize: 13,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              trailing: AnimatedRotation(
                turns: expanded ? 0.25 : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 18,
                  color: selected ? Colors.white : const Color(0xFF7F94B8),
                ),
              ),
              onTap: () {
                setState(() {
                  expandedMenus[title] = !expanded;
                });

                widget.onMenuSelected(title);
              },
            ),
          ),
        ),

        // ============================================================
        // SUBMENU
        // ============================================================
        ClipRect(
          child: AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: expanded
                ? Padding(
                    padding: const EdgeInsets.only(left: 22, right: 5),
                    child: Column(
                      children: children.map((child) {
                        return _submenuItem(child);
                      }).toList(),
                    ),
                  )
                : const SizedBox(height: 0, width: double.infinity),
          ),
        ),
      ],
    );
  }

  // ================================================================
  // SUBMENU ITEM
  // ================================================================

  Widget _submenuItem(_SubMenu item) {
    final bool selected = widget.selectedMenu == item.title;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          // Update selected menu.
          widget.onMenuSelected(item.title);

          // Navigate to the submenu route.
          Navigator.pushNamed(context, item.route);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          margin: const EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF123F82) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              // ======================================================
              // SUBMENU ICON
              // ======================================================

              Icon(
                _getSubmenuIcon(item.title),
                size: 16,
                color: selected ? Colors.white : const Color(0xFF9EB4D8),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: selected ? Colors.white : const Color(0xFFAFC0DA),
                    fontSize: 11.5,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  // SUBMENU ICONS
  // ================================================================

  IconData _getSubmenuIcon(String title) {
    switch (title) {
      // PLATFORM
      case 'Global Settings':
        return Icons.settings_outlined;
      case 'Platform Config':
        return Icons.tune_outlined;
      case 'License Mgmt.':
        return Icons.card_membership_outlined;
      case 'Feature Mgmt.':
        return Icons.extension_outlined;
      case 'Resource Mgmt.':
        return Icons.storage_outlined;
      case 'System Health':
        return Icons.health_and_safety_outlined;
      case 'Tenant Templates':
        return Icons.business_outlined;

      // HRMS
      case 'Employee Mgmt.':
        return Icons.badge_outlined;
      case 'Attendance':
        return Icons.access_time_outlined;
      case 'Leave':
        return Icons.event_busy_outlined;
      case 'Payroll':
        return Icons.payments_outlined;
      case 'Recruitment':
        return Icons.person_search_outlined;
      case 'Performance':
        return Icons.trending_up_outlined;
      case 'Learning':
        return Icons.school_outlined;
      case 'ESS / MSS':
        return Icons.manage_accounts_outlined;
      case 'Asset Mgmt.':
        return Icons.inventory_2_outlined;

      // CRM
      case 'Leads':
        return Icons.person_add_alt_outlined;
      case 'Opportunities':
        return Icons.lightbulb_outline;
      case 'Accounts':
        return Icons.account_circle_outlined;
      case 'Contacts':
        return Icons.contacts_outlined;
      case 'Activities':
        return Icons.task_alt_outlined;
      case 'Pipeline':
        return Icons.filter_alt_outlined;
      case 'Quotations':
        return Icons.request_quote_outlined;
      case 'Campaigns':
        return Icons.campaign_outlined;
      case 'Customer Support':
        return Icons.support_agent_outlined;

      // ERP
      case 'Inventory':
        return Icons.inventory_outlined;
      case 'Procurement':
        return Icons.shopping_cart_outlined;
      case 'Production':
        return Icons.precision_manufacturing_outlined;
      case 'Sales Orders':
        return Icons.receipt_long_outlined;
      case 'Dispatch':
        return Icons.local_shipping_outlined;
      case 'Maintenance':
        return Icons.build_outlined;
      case 'Vendors':
        return Icons.storefront_outlined;

      // FINANCE
      case 'General Ledger':
        return Icons.menu_book_outlined;
      case 'Accounts Payable':
        return Icons.payment_outlined;
      case 'Accounts Receivable':
        return Icons.account_balance_wallet_outlined;
      case 'Tax Management':
        return Icons.receipt_outlined;
      case 'Budgeting':
        return Icons.savings_outlined;
      case 'Costing':
        return Icons.calculate_outlined;
      case 'Financial Reports':
        return Icons.bar_chart_outlined;
      case 'Reconciliation':
        return Icons.sync_alt_outlined;
      case 'Multi-Currency':
        return Icons.currency_exchange_outlined;

      // WORKFLOW
      case 'Workflow Builder':
        return Icons.account_tree_outlined;
      case 'Approvals':
        return Icons.verified_outlined;
      case 'Business Rules':
        return Icons.rule_outlined;
      case 'Process Automation':
        return Icons.autorenew_outlined;
      case 'Task Management':
        return Icons.checklist_outlined;
      case 'Triggers':
        return Icons.flash_on_outlined;
      case 'SLAs & Escalations':
        return Icons.timer_outlined;
      case 'Process Monitoring':
        return Icons.monitor_heart_outlined;
      case 'Workflow Templates':
        return Icons.description_outlined;

      // DOCUMENT
      case 'Document Repository':
        return Icons.folder_copy_outlined;
      case 'Versioning':
        return Icons.history_outlined;
      case 'File Upload/Download':
        return Icons.file_upload_outlined;
      case 'Access Control':
        return Icons.lock_outline;
      case 'Document Templates':
        return Icons.article_outlined;
      case 'Tagging & Search':
        return Icons.label_outline;
      case 'Retention Policies':
        return Icons.policy_outlined;
      case 'Audit Trails':
        return Icons.fact_check_outlined;
      case 'OCR Integration':
        return Icons.document_scanner_outlined;

      // SUBSCRIPTION
      case 'Plans & Features':
        return Icons.view_module_outlined;
      case 'Tenant Subscriptions':
        return Icons.subscriptions_outlined;
      case 'Usage & Quotas':
        return Icons.data_usage_outlined;
      case 'Payment Tracking':
        return Icons.payments_outlined;
      case 'License Allocation':
        return Icons.assignment_outlined;
      case 'License Keys':
        return Icons.vpn_key_outlined;
      case 'Renewals':
        return Icons.autorenew_outlined;
      case 'Trial Management':
        return Icons.hourglass_empty_outlined;
      case 'Billing Integration':
        return Icons.receipt_long_outlined;

      // REVENUE
      case 'Revenue Tracking':
        return Icons.trending_up_outlined;
      case 'Usage Analytics':
        return Icons.analytics_outlined;
      case 'Forecasting':
        return Icons.insights_outlined;
      case 'Revenue Reports':
        return Icons.bar_chart_outlined;
      case 'Revenue Recognition':
        return Icons.account_balance_wallet_outlined;
      case 'Commission Mgmt.':
        return Icons.percent_outlined;
      case 'Financial Analytics':
        return Icons.query_stats_outlined;
      case 'Invoicing':
        return Icons.receipt_long_outlined;
      case 'Integration':
        return Icons.integration_instructions_outlined;

      // REPORTING
      case 'Standard Reports':
        return Icons.description_outlined;
      case 'Ad-hoc Reports':
        return Icons.edit_note_outlined;
      case 'Data Exploration':
        return Icons.explore_outlined;
      case 'BI Management':
        return Icons.dashboard_customize_outlined;
      case 'Data Export':
        return Icons.file_download_outlined;
      case 'Scheduled Reports':
        return Icons.schedule_outlined;
      case 'Data Visualization':
        return Icons.pie_chart_outline;
      case 'Self-Service Analytics':
        return Icons.auto_graph_outlined;

      // AI
      case 'AI Models':
        return Icons.model_training_outlined;
      case 'AI Chat / Copilot':
        return Icons.chat_outlined;
      case 'Document AI / OCR':
        return Icons.document_scanner_outlined;
      case 'Predictive Analytics':
        return Icons.insights_outlined;
      case 'Recommendations':
        return Icons.recommend_outlined;
      case 'AI Workflows':
        return Icons.account_tree_outlined;
      case 'Model Management':
        return Icons.settings_suggest_outlined;
      case 'Prompt Engineering':
        return Icons.psychology_outlined;
      case 'AI Usage Logs':
        return Icons.history_outlined;

      // NOTIFICATION
      case 'In-App Notifications':
        return Icons.notifications_active_outlined;
      case 'Email Notifications':
        return Icons.email_outlined;
      case 'SMS Notifications':
        return Icons.sms_outlined;
      case 'Push Notifications':
        return Icons.notifications_outlined;
      case 'Templates':
        return Icons.description_outlined;
      case 'Preferences':
        return Icons.tune_outlined;
      case 'Schedules':
        return Icons.schedule_outlined;
      case 'Delivery Tracking':
        return Icons.local_shipping_outlined;
      case 'Multi-Channel':
        return Icons.hub_outlined;

      // CALENDAR
      case 'User Calendars':
        return Icons.calendar_today_outlined;
      case 'Team Calendars':
        return Icons.groups_outlined;
      case 'Meeting Scheduler':
        return Icons.event_available_outlined;
      case 'Resource Booking':
        return Icons.book_online_outlined;
      case 'Reminders':
        return Icons.alarm_outlined;
      case 'Integrations (Google, Outlook)':
        return Icons.sync_outlined;
      case 'Availability':
        return Icons.event_available_outlined;
      case 'Event Notifications':
        return Icons.notifications_outlined;
      case 'Shared Calendars':
        return Icons.calendar_view_month_outlined;

      // INTEGRATION
      case 'API Management':
        return Icons.api_outlined;
      case 'Third-Party Integrations':
        return Icons.extension_outlined;
      case 'Webhooks':
        return Icons.link_outlined;
      case 'Event Streaming':
        return Icons.stream_outlined;
      case 'Data Transformation':
        return Icons.transform_outlined;
      case 'ETL / Data Sync':
        return Icons.sync_alt_outlined;
      case 'Connectors (ERP, Bank, Payment, etc.)':
        return Icons.link_outlined;
      case 'Integration Logs':
        return Icons.article_outlined;

      // SEARCH
      case 'Global Search':
        return Icons.search_outlined;
      case 'Index Management':
        return Icons.manage_search_outlined;
      case 'Search Analytics':
        return Icons.analytics_outlined;
      case 'Autocomplete':
        return Icons.auto_awesome_outlined;
      case 'Relevance Ranking':
        return Icons.sort_outlined;
      case 'Saved Searches':
        return Icons.bookmark_border_outlined;
      case 'Multi-Tenant Index':
        return Icons.layers_outlined;
      case 'Synonyms':
        return Icons.compare_arrows_outlined;
      case 'Suggestion Engine':
        return Icons.lightbulb_outline;

      // SECURITY
      case 'Audit Logs':
        return Icons.receipt_long_outlined;
      case 'Activity Tracking':
        return Icons.track_changes_outlined;
      case 'Compliance Reports':
        return Icons.verified_outlined;
      case 'Data Retention':
        return Icons.storage_outlined;
      case 'Policy Management':
        return Icons.policy_outlined;
      case 'Threat Detection':
        return Icons.warning_amber_outlined;
      case 'Vulnerability Mgmt.':
        return Icons.security_update_warning_outlined;
      case 'Encryption & Key Mgmt.':
        return Icons.key_outlined;
      case 'Security Alerts':
        return Icons.security_outlined;

      default:
        return Icons.chevron_right_outlined;
    }
  }
}

// ====================================================================
// SUBMENU MODEL
// ====================================================================

class _SubMenu {
  final String title;
  final String route;

  const _SubMenu(this.title, this.route);
}
