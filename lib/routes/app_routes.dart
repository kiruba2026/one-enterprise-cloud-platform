import 'package:flutter/material.dart';

import '../pages/landing_page.dart';
import '../pages/login_signup/login_page.dart';
import '../pages/login_signup/signup_page.dart';
import '../pages/login_signup/forgot_password_page.dart';

import '../pages/dashboard_page.dart';

import '../pages/platform_administration/global_settings_page.dart';

class AppRoutes {
  // ================================================================
  // LANDING & AUTHENTICATION
  // ================================================================

  static const String landing = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  // ================================================================
  // DASHBOARD
  // ================================================================

  static const String dashboard = '/dashboard';

  // ================================================================
  // PLATFORM ADMINISTRATION
  // ================================================================

  static const String globalSettings = '/platform/global-settings';

  static const String platformConfig = '/platform/platform-config';

  static const String licenseManagement = '/platform/license-management';

  static const String featureManagement = '/platform/feature-management';

  static const String resourceManagement = '/platform/resource-management';

  static const String systemHealth = '/platform/system-health';

  static const String tenantTemplates = '/platform/tenant-templates';

  // ================================================================
  // HRMS
  // ================================================================

  static const String employeeManagement = '/hrms/employee-management';

  static const String attendance = '/hrms/attendance';

  static const String leave = '/hrms/leave';

  static const String payroll = '/hrms/payroll';

  static const String recruitment = '/hrms/recruitment';

  static const String performance = '/hrms/performance';

  static const String learning = '/hrms/learning';

  static const String essMss = '/hrms/ess-mss';

  // IMPORTANT:
  // Separate HRMS and ERP Asset Management routes.
  static const String hrmsAssetManagement = '/hrms/asset-management';

  // ================================================================
  // CRM
  // ================================================================

  static const String leads = '/crm/leads';

  static const String opportunities = '/crm/opportunities';

  static const String accounts = '/crm/accounts';

  static const String contacts = '/crm/contacts';

  static const String activities = '/crm/activities';

  static const String pipeline = '/crm/pipeline';

  static const String quotations = '/crm/quotations';

  static const String campaigns = '/crm/campaigns';

  static const String customerSupport = '/crm/customer-support';

  // ================================================================
  // ERP
  // ================================================================

  static const String inventory = '/erp/inventory';

  static const String procurement = '/erp/procurement';

  static const String production = '/erp/production';

  static const String salesOrders = '/erp/sales-orders';

  static const String dispatch = '/erp/dispatch';

  static const String erpAssetManagement = '/erp/asset-management';

  static const String maintenance = '/erp/maintenance';

  static const String vendors = '/erp/vendors';

  // ================================================================
  // FINANCE & ACCOUNTING
  // ================================================================

  static const String generalLedger = '/finance/general-ledger';

  static const String accountsPayable = '/finance/accounts-payable';

  static const String accountsReceivable = '/finance/accounts-receivable';

  static const String taxManagement = '/finance/tax-management';

  static const String budgeting = '/finance/budgeting';

  static const String costing = '/finance/costing';

  static const String financialReports = '/finance/financial-reports';

  static const String reconciliation = '/finance/reconciliation';

  static const String multiCurrency = '/finance/multi-currency';

  // ================================================================
  // WORKFLOW & AUTOMATION
  // ================================================================

  static const String workflowBuilder = '/workflow/workflow-builder';

  static const String approvals = '/workflow/approvals';

  static const String businessRules = '/workflow/business-rules';

  static const String processAutomation = '/workflow/process-automation';

  static const String taskManagement = '/workflow/task-management';

  static const String triggers = '/workflow/triggers';

  static const String slasEscalations = '/workflow/slas-escalations';

  static const String processMonitoring = '/workflow/process-monitoring';

  static const String workflowTemplates = '/workflow/workflow-templates';

  // ================================================================
  // DOCUMENT MANAGEMENT
  // ================================================================

  static const String documentRepository = '/documents/document-repository';

  static const String versioning = '/documents/versioning';

  static const String fileUploadDownload = '/documents/file-upload-download';

  static const String accessControl = '/documents/access-control';

  static const String documentTemplates = '/documents/document-templates';

  static const String taggingSearch = '/documents/tagging-search';

  static const String retentionPolicies = '/documents/retention-policies';

  static const String auditTrails = '/documents/audit-trails';

  static const String ocrIntegration = '/documents/ocr-integration';

  // ================================================================
  // SUBSCRIPTION
  // ================================================================

  static const String plansFeatures = '/subscription/plans-features';

  static const String tenantSubscriptions =
      '/subscription/tenant-subscriptions';

  static const String usageQuotas = '/subscription/usage-quotas';

  static const String paymentTracking = '/subscription/payment-tracking';

  static const String licenseAllocation = '/subscription/license-allocation';

  static const String licenseKeys = '/subscription/license-keys';

  static const String renewals = '/subscription/renewals';

  static const String trialManagement = '/subscription/trial-management';

  static const String billingIntegration = '/subscription/billing-integration';

  // ================================================================
  // REVENUE
  // ================================================================

  static const String revenueTracking = '/revenue/revenue-tracking';

  static const String usageAnalytics = '/revenue/usage-analytics';

  static const String forecasting = '/revenue/forecasting';

  static const String revenueReports = '/revenue/revenue-reports';

  static const String revenueRecognition = '/revenue/revenue-recognition';

  static const String commissionManagement = '/revenue/commission-management';

  static const String financialAnalytics = '/revenue/financial-analytics';

  static const String invoicing = '/revenue/invoicing';

  static const String revenueIntegration = '/revenue/integration';

  // ================================================================
  // REPORTING & BI
  // ================================================================

  static const String standardReports = '/reporting/standard-reports';

  static const String adHocReports = '/reporting/ad-hoc-reports';

  static const String dataExploration = '/reporting/data-exploration';

  static const String biManagement = '/reporting/bi-management';

  static const String dataExport = '/reporting/data-export';

  static const String scheduledReports = '/reporting/scheduled-reports';

  static const String dataVisualization = '/reporting/data-visualization';

  static const String selfServiceAnalytics =
      '/reporting/self-service-analytics';

  // ================================================================
  // ENTERPRISE AI
  // ================================================================

  static const String aiModels = '/ai/ai-models';

  static const String aiChatCopilot = '/ai/ai-chat-copilot';

  static const String documentAiOcr = '/ai/document-ai-ocr';

  static const String predictiveAnalytics = '/ai/predictive-analytics';

  static const String recommendations = '/ai/recommendations';

  static const String aiWorkflows = '/ai/ai-workflows';

  static const String modelManagement = '/ai/model-management';

  static const String promptEngineering = '/ai/prompt-engineering';

  static const String aiUsageLogs = '/ai/ai-usage-logs';

  // ================================================================
  // NOTIFICATION
  // ================================================================

  static const String inAppNotifications = '/notification/in-app';

  static const String emailNotifications = '/notification/email';

  static const String smsNotifications = '/notification/sms';

  static const String pushNotifications = '/notification/push';

  static const String notificationTemplates = '/notification/templates';

  static const String notificationPreferences = '/notification/preferences';

  static const String notificationSchedules = '/notification/schedules';

  static const String deliveryTracking = '/notification/delivery-tracking';

  static const String multiChannel = '/notification/multi-channel';

  // ================================================================
  // CALENDAR
  // ================================================================

  static const String userCalendars = '/calendar/user-calendars';

  static const String teamCalendars = '/calendar/team-calendars';

  static const String meetingScheduler = '/calendar/meeting-scheduler';

  static const String resourceBooking = '/calendar/resource-booking';

  static const String reminders = '/calendar/reminders';

  static const String calendarIntegrations = '/calendar/integrations';

  static const String availability = '/calendar/availability';

  static const String eventNotifications = '/calendar/event-notifications';

  static const String sharedCalendars = '/calendar/shared-calendars';

  // ================================================================
  // INTEGRATION
  // ================================================================

  static const String apiManagement = '/integration/api-management';

  static const String thirdPartyIntegrations = '/integration/third-party';

  static const String webhooks = '/integration/webhooks';

  static const String eventStreaming = '/integration/event-streaming';

  static const String dataTransformation = '/integration/data-transformation';

  static const String etlDataSync = '/integration/etl-data-sync';

  static const String connectors = '/integration/connectors';

  static const String integrationLogs = '/integration/logs';

  // ================================================================
  // SEARCH
  // ================================================================

  static const String globalSearch = '/search/global-search';

  static const String indexManagement = '/search/index-management';

  static const String searchAnalytics = '/search/search-analytics';

  static const String autocomplete = '/search/autocomplete';

  static const String relevanceRanking = '/search/relevance-ranking';

  static const String savedSearches = '/search/saved-searches';

  static const String multiTenantIndex = '/search/multi-tenant-index';

  static const String synonyms = '/search/synonyms';

  static const String suggestionEngine = '/search/suggestion-engine';

  // ================================================================
  // SECURITY & COMPLIANCE
  // ================================================================

  static const String auditLogs = '/security/audit-logs';

  static const String activityTracking = '/security/activity-tracking';

  static const warmString = '/security/compliance-reports';
  static const String complianceReports = '/security/compliance-reports';

  static const String dataRetention = '/security/data-retention';

  static const String policyManagement = '/security/policy-management';

  static const String threatDetection = '/security/threat-detection';

  static const String vulnerabilityManagement =
      '/security/vulnerability-management';

  static const String encryptionKeyManagement =
      '/security/encryption-key-management';

  static const String securityAlerts = '/security/security-alerts';

  // ================================================================
  // SYSTEM
  // ================================================================

  static const String settings = '/settings';

  // ================================================================
  // ALL ROUTES
  // ================================================================

  static Map<String, WidgetBuilder> get routes {
    return {
      // ------------------------------------------------------------
      // LANDING & AUTH
      // ------------------------------------------------------------
      landing: (context) => const LandingPage(),

      login: (context) => const LoginPage(),

      signup: (context) => const SignupPage(),

      forgotPassword: (context) => const ForgotPasswordPage(),

      // ------------------------------------------------------------
      // DASHBOARD
      // ------------------------------------------------------------
      dashboard: (context) => const DashboardPage(),

      // ------------------------------------------------------------
      // PLATFORM
      // ------------------------------------------------------------
      globalSettings: (context) => const GlobalSettingsPage(),

      platformConfig: (context) => const ModulePlaceholderPage(
        title: 'Platform Config',
        module: 'Platform Administration',
      ),

      licenseManagement: (context) => const ModulePlaceholderPage(
        title: 'License Management',
        module: 'Platform Administration',
      ),

      featureManagement: (context) => const ModulePlaceholderPage(
        title: 'Feature Management',
        module: 'Platform Administration',
      ),

      resourceManagement: (context) => const ModulePlaceholderPage(
        title: 'Resource Management',
        module: 'Platform Administration',
      ),

      systemHealth: (context) => const ModulePlaceholderPage(
        title: 'System Health',
        module: 'Platform Administration',
      ),

      tenantTemplates: (context) => const ModulePlaceholderPage(
        title: 'Tenant Templates',
        module: 'Platform Administration',
      ),

      // ------------------------------------------------------------
      // HRMS
      // ------------------------------------------------------------
      employeeManagement: (context) => const ModulePlaceholderPage(
        title: 'Employee Management',
        module: 'HRMS',
      ),

      attendance: (context) =>
          const ModulePlaceholderPage(title: 'Attendance', module: 'HRMS'),

      leave: (context) =>
          const ModulePlaceholderPage(title: 'Leave', module: 'HRMS'),

      payroll: (context) =>
          const ModulePlaceholderPage(title: 'Payroll', module: 'HRMS'),

      recruitment: (context) =>
          const ModulePlaceholderPage(title: 'Recruitment', module: 'HRMS'),

      performance: (context) =>
          const ModulePlaceholderPage(title: 'Performance', module: 'HRMS'),

      learning: (context) =>
          const ModulePlaceholderPage(title: 'Learning', module: 'HRMS'),

      essMss: (context) =>
          const ModulePlaceholderPage(title: 'ESS / MSS', module: 'HRMS'),

      hrmsAssetManagement: (context) => const ModulePlaceholderPage(
        title: 'Asset Management',
        module: 'HRMS',
      ),

      // ------------------------------------------------------------
      // CRM
      // ------------------------------------------------------------
      leads: (context) =>
          const ModulePlaceholderPage(title: 'Leads', module: 'CRM'),

      opportunities: (context) =>
          const ModulePlaceholderPage(title: 'Opportunities', module: 'CRM'),

      accounts: (context) =>
          const ModulePlaceholderPage(title: 'Accounts', module: 'CRM'),

      contacts: (context) =>
          const ModulePlaceholderPage(title: 'Contacts', module: 'CRM'),

      activities: (context) =>
          const ModulePlaceholderPage(title: 'Activities', module: 'CRM'),

      pipeline: (context) =>
          const ModulePlaceholderPage(title: 'Pipeline', module: 'CRM'),

      quotations: (context) =>
          const ModulePlaceholderPage(title: 'Quotations', module: 'CRM'),

      campaigns: (context) =>
          const ModulePlaceholderPage(title: 'Campaigns', module: 'CRM'),

      customerSupport: (context) =>
          const ModulePlaceholderPage(title: 'Customer Support', module: 'CRM'),

      // ------------------------------------------------------------
      // ERP
      // ------------------------------------------------------------
      inventory: (context) =>
          const ModulePlaceholderPage(title: 'Inventory', module: 'ERP'),

      procurement: (context) =>
          const ModulePlaceholderPage(title: 'Procurement', module: 'ERP'),

      production: (context) =>
          const ModulePlaceholderPage(title: 'Production', module: 'ERP'),

      salesOrders: (context) =>
          const ModulePlaceholderPage(title: 'Sales Orders', module: 'ERP'),

      dispatch: (context) =>
          const ModulePlaceholderPage(title: 'Dispatch', module: 'ERP'),

      erpAssetManagement: (context) =>
          const ModulePlaceholderPage(title: 'Asset Management', module: 'ERP'),

      maintenance: (context) =>
          const ModulePlaceholderPage(title: 'Maintenance', module: 'ERP'),

      vendors: (context) =>
          const ModulePlaceholderPage(title: 'Vendors', module: 'ERP'),

      // ------------------------------------------------------------
      // FINANCE
      // ------------------------------------------------------------
      generalLedger: (context) => const ModulePlaceholderPage(
        title: 'General Ledger',
        module: 'Finance & Accounting',
      ),

      accountsPayable: (context) => const ModulePlaceholderPage(
        title: 'Accounts Payable',
        module: 'Finance & Accounting',
      ),

      accountsReceivable: (context) => const ModulePlaceholderPage(
        title: 'Accounts Receivable',
        module: 'Finance & Accounting',
      ),

      taxManagement: (context) => const ModulePlaceholderPage(
        title: 'Tax Management',
        module: 'Finance & Accounting',
      ),

      budgeting: (context) => const ModulePlaceholderPage(
        title: 'Budgeting',
        module: 'Finance & Accounting',
      ),

      costing: (context) => const ModulePlaceholderPage(
        title: 'Costing',
        module: 'Finance & Accounting',
      ),

      financialReports: (context) => const ModulePlaceholderPage(
        title: 'Financial Reports',
        module: 'Finance & Accounting',
      ),

      reconciliation: (context) => const ModulePlaceholderPage(
        title: 'Reconciliation',
        module: 'Finance & Accounting',
      ),

      multiCurrency: (context) => const ModulePlaceholderPage(
        title: 'Multi-Currency',
        module: 'Finance & Accounting',
      ),

      // ------------------------------------------------------------
      // WORKFLOW
      // ------------------------------------------------------------
      workflowBuilder: (context) => const ModulePlaceholderPage(
        title: 'Workflow Builder',
        module: 'Workflow & Automation',
      ),

      approvals: (context) => const ModulePlaceholderPage(
        title: 'Approvals',
        module: 'Workflow & Automation',
      ),

      businessRules: (context) => const ModulePlaceholderPage(
        title: 'Business Rules',
        module: 'Workflow & Automation',
      ),

      processAutomation: (context) => const ModulePlaceholderPage(
        title: 'Process Automation',
        module: 'Workflow & Automation',
      ),

      taskManagement: (context) => const ModulePlaceholderPage(
        title: 'Task Management',
        module: 'Workflow & Automation',
      ),

      triggers: (context) => const ModulePlaceholderPage(
        title: 'Triggers',
        module: 'Workflow & Automation',
      ),

      slasEscalations: (context) => const ModulePlaceholderPage(
        title: 'SLAs & Escalations',
        module: 'Workflow & Automation',
      ),

      processMonitoring: (context) => const ModulePlaceholderPage(
        title: 'Process Monitoring',
        module: 'Workflow & Automation',
      ),

      workflowTemplates: (context) => const ModulePlaceholderPage(
        title: 'Workflow Templates',
        module: 'Workflow & Automation',
      ),

      // ------------------------------------------------------------
      // DOCUMENT MANAGEMENT
      // ------------------------------------------------------------
      documentRepository: (context) => const ModulePlaceholderPage(
        title: 'Document Repository',
        module: 'Document Management',
      ),

      versioning: (context) => const ModulePlaceholderPage(
        title: 'Versioning',
        module: 'Document Management',
      ),

      fileUploadDownload: (context) => const ModulePlaceholderPage(
        title: 'File Upload / Download',
        module: 'Document Management',
      ),

      accessControl: (context) => const ModulePlaceholderPage(
        title: 'Access Control',
        module: 'Document Management',
      ),

      documentTemplates: (context) => const ModulePlaceholderPage(
        title: 'Document Templates',
        module: 'Document Management',
      ),

      taggingSearch: (context) => const ModulePlaceholderPage(
        title: 'Tagging & Search',
        module: 'Document Management',
      ),

      retentionPolicies: (context) => const ModulePlaceholderPage(
        title: 'Retention Policies',
        module: 'Document Management',
      ),

      auditTrails: (context) => const ModulePlaceholderPage(
        title: 'Audit Trails',
        module: 'Document Management',
      ),

      ocrIntegration: (context) => const ModulePlaceholderPage(
        title: 'OCR Integration',
        module: 'Document Management',
      ),

      // ------------------------------------------------------------
      // SUBSCRIPTION
      // ------------------------------------------------------------
      plansFeatures: (context) => const ModulePlaceholderPage(
        title: 'Plans & Features',
        module: 'Subscription',
      ),

      tenantSubscriptions: (context) => const ModulePlaceholderPage(
        title: 'Tenant Subscriptions',
        module: 'Subscription',
      ),

      usageQuotas: (context) => const ModulePlaceholderPage(
        title: 'Usage & Quotas',
        module: 'Subscription',
      ),

      paymentTracking: (context) => const ModulePlaceholderPage(
        title: 'Payment Tracking',
        module: 'Subscription',
      ),

      licenseAllocation: (context) => const ModulePlaceholderPage(
        title: 'License Allocation',
        module: 'Subscription',
      ),

      licenseKeys: (context) => const ModulePlaceholderPage(
        title: 'License Keys',
        module: 'Subscription',
      ),

      renewals: (context) => const ModulePlaceholderPage(
        title: 'Renewals',
        module: 'Subscription',
      ),

      trialManagement: (context) => const ModulePlaceholderPage(
        title: 'Trial Management',
        module: 'Subscription',
      ),

      billingIntegration: (context) => const ModulePlaceholderPage(
        title: 'Billing Integration',
        module: 'Subscription',
      ),

      // ------------------------------------------------------------
      // REVENUE
      // ------------------------------------------------------------
      revenueTracking: (context) => const ModulePlaceholderPage(
        title: 'Revenue Tracking',
        module: 'Revenue',
      ),

      usageAnalytics: (context) => const ModulePlaceholderPage(
        title: 'Usage Analytics',
        module: 'Revenue',
      ),

      forecasting: (context) =>
          const ModulePlaceholderPage(title: 'Forecasting', module: 'Revenue'),

      revenueReports: (context) => const ModulePlaceholderPage(
        title: 'Revenue Reports',
        module: 'Revenue',
      ),

      revenueRecognition: (context) => const ModulePlaceholderPage(
        title: 'Revenue Recognition',
        module: 'Revenue',
      ),

      commissionManagement: (context) => const ModulePlaceholderPage(
        title: 'Commission Management',
        module: 'Revenue',
      ),

      financialAnalytics: (context) => const ModulePlaceholderPage(
        title: 'Financial Analytics',
        module: 'Revenue',
      ),

      invoicing: (context) =>
          const ModulePlaceholderPage(title: 'Invoicing', module: 'Revenue'),

      revenueIntegration: (context) =>
          const ModulePlaceholderPage(title: 'Integration', module: 'Revenue'),

      // ------------------------------------------------------------
      // REPORTING & BI
      // ------------------------------------------------------------
      standardReports: (context) => const ModulePlaceholderPage(
        title: 'Standard Reports',
        module: 'Reporting & BI',
      ),

      adHocReports: (context) => const ModulePlaceholderPage(
        title: 'Ad-hoc Reports',
        module: 'Reporting & BI',
      ),

      dataExploration: (context) => const ModulePlaceholderPage(
        title: 'Data Exploration',
        module: 'Reporting & BI',
      ),

      biManagement: (context) => const ModulePlaceholderPage(
        title: 'BI Management',
        module: 'Reporting & BI',
      ),

      dataExport: (context) => const ModulePlaceholderPage(
        title: 'Data Export',
        module: 'Reporting & BI',
      ),

      scheduledReports: (context) => const ModulePlaceholderPage(
        title: 'Scheduled Reports',
        module: 'Reporting & BI',
      ),

      dataVisualization: (context) => const ModulePlaceholderPage(
        title: 'Data Visualization',
        module: 'Reporting & BI',
      ),

      selfServiceAnalytics: (context) => const ModulePlaceholderPage(
        title: 'Self-Service Analytics',
        module: 'Reporting & BI',
      ),

      // ------------------------------------------------------------
      // ENTERPRISE AI
      // ------------------------------------------------------------
      aiModels: (context) => const ModulePlaceholderPage(
        title: 'AI Models',
        module: 'Enterprise AI',
      ),

      aiChatCopilot: (context) => const ModulePlaceholderPage(
        title: 'AI Chat / Copilot',
        module: 'Enterprise AI',
      ),

      documentAiOcr: (context) => const ModulePlaceholderPage(
        title: 'Document AI / OCR',
        module: 'Enterprise AI',
      ),

      predictiveAnalytics: (context) => const ModulePlaceholderPage(
        title: 'Predictive Analytics',
        module: 'Enterprise AI',
      ),

      recommendations: (context) => const ModulePlaceholderPage(
        title: 'Recommendations',
        module: 'Enterprise AI',
      ),

      aiWorkflows: (context) => const ModulePlaceholderPage(
        title: 'AI Workflows',
        module: 'Enterprise AI',
      ),

      modelManagement: (context) => const ModulePlaceholderPage(
        title: 'Model Management',
        module: 'Enterprise AI',
      ),

      promptEngineering: (context) => const ModulePlaceholderPage(
        title: 'Prompt Engineering',
        module: 'Enterprise AI',
      ),

      aiUsageLogs: (context) => const ModulePlaceholderPage(
        title: 'AI Usage Logs',
        module: 'Enterprise AI',
      ),

      // ------------------------------------------------------------
      // NOTIFICATION
      // ------------------------------------------------------------
      inAppNotifications: (context) => const ModulePlaceholderPage(
        title: 'In-App Notifications',
        module: 'Notification',
      ),

      emailNotifications: (context) => const ModulePlaceholderPage(
        title: 'Email Notifications',
        module: 'Notification',
      ),

      smsNotifications: (context) => const ModulePlaceholderPage(
        title: 'SMS Notifications',
        module: 'Notification',
      ),

      pushNotifications: (context) => const ModulePlaceholderPage(
        title: 'Push Notifications',
        module: 'Notification',
      ),

      notificationTemplates: (context) => const ModulePlaceholderPage(
        title: 'Templates',
        module: 'Notification',
      ),

      notificationPreferences: (context) => const ModulePlaceholderPage(
        title: 'Preferences',
        module: 'Notification',
      ),

      notificationSchedules: (context) => const ModulePlaceholderPage(
        title: 'Schedules',
        module: 'Notification',
      ),

      deliveryTracking: (context) => const ModulePlaceholderPage(
        title: 'Delivery Tracking',
        module: 'Notification',
      ),

      multiChannel: (context) => const ModulePlaceholderPage(
        title: 'Multi-Channel',
        module: 'Notification',
      ),

      // ------------------------------------------------------------
      // CALENDAR
      // ------------------------------------------------------------
      userCalendars: (context) => const ModulePlaceholderPage(
        title: 'User Calendars',
        module: 'Calendar',
      ),

      teamCalendars: (context) => const ModulePlaceholderPage(
        title: 'Team Calendars',
        module: 'Calendar',
      ),

      meetingScheduler: (context) => const ModulePlaceholderPage(
        title: 'Meeting Scheduler',
        module: 'Calendar',
      ),

      resourceBooking: (context) => const ModulePlaceholderPage(
        title: 'Resource Booking',
        module: 'Calendar',
      ),

      reminders: (context) =>
          const ModulePlaceholderPage(title: 'Reminders', module: 'Calendar'),

      calendarIntegrations: (context) => const ModulePlaceholderPage(
        title: 'Integrations',
        module: 'Calendar',
      ),

      availability: (context) => const ModulePlaceholderPage(
        title: 'Availability',
        module: 'Calendar',
      ),

      eventNotifications: (context) => const ModulePlaceholderPage(
        title: 'Event Notifications',
        module: 'Calendar',
      ),

      sharedCalendars: (context) => const ModulePlaceholderPage(
        title: 'Shared Calendars',
        module: 'Calendar',
      ),

      // ------------------------------------------------------------
      // INTEGRATION
      // ------------------------------------------------------------
      apiManagement: (context) => const ModulePlaceholderPage(
        title: 'API Management',
        module: 'Integration',
      ),

      thirdPartyIntegrations: (context) => const ModulePlaceholderPage(
        title: 'Third-Party Integrations',
        module: 'Integration',
      ),

      webhooks: (context) =>
          const ModulePlaceholderPage(title: 'Webhooks', module: 'Integration'),

      eventStreaming: (context) => const ModulePlaceholderPage(
        title: 'Event Streaming',
        module: 'Integration',
      ),

      dataTransformation: (context) => const ModulePlaceholderPage(
        title: 'Data Transformation',
        module: 'Integration',
      ),

      etlDataSync: (context) => const ModulePlaceholderPage(
        title: 'ETL / Data Sync',
        module: 'Integration',
      ),

      connectors: (context) => const ModulePlaceholderPage(
        title: 'Connectors',
        module: 'Integration',
      ),

      integrationLogs: (context) => const ModulePlaceholderPage(
        title: 'Integration Logs',
        module: 'Integration',
      ),

      // ------------------------------------------------------------
      // SEARCH
      // ------------------------------------------------------------
      globalSearch: (context) =>
          const ModulePlaceholderPage(title: 'Global Search', module: 'Search'),

      indexManagement: (context) => const ModulePlaceholderPage(
        title: 'Index Management',
        module: 'Search',
      ),

      searchAnalytics: (context) => const ModulePlaceholderPage(
        title: 'Search Analytics',
        module: 'Search',
      ),

      autocomplete: (context) =>
          const ModulePlaceholderPage(title: 'Autocomplete', module: 'Search'),

      relevanceRanking: (context) => const ModulePlaceholderPage(
        title: 'Relevance Ranking',
        module: 'Search',
      ),

      savedSearches: (context) => const ModulePlaceholderPage(
        title: 'Saved Searches',
        module: 'Search',
      ),

      multiTenantIndex: (context) => const ModulePlaceholderPage(
        title: 'Multi-Tenant Index',
        module: 'Search',
      ),

      synonyms: (context) =>
          const ModulePlaceholderPage(title: 'Synonyms', module: 'Search'),

      suggestionEngine: (context) => const ModulePlaceholderPage(
        title: 'Suggestion Engine',
        module: 'Search',
      ),

      // ------------------------------------------------------------
      // SECURITY & COMPLIANCE
      // ------------------------------------------------------------
      auditLogs: (context) => const ModulePlaceholderPage(
        title: 'Audit Logs',
        module: 'Security & Compliance',
      ),

      activityTracking: (context) => const ModulePlaceholderPage(
        title: 'Activity Tracking',
        module: 'Security & Compliance',
      ),

      complianceReports: (context) => const ModulePlaceholderPage(
        title: 'Compliance Reports',
        module: 'Security & Compliance',
      ),

      dataRetention: (context) => const ModulePlaceholderPage(
        title: 'Data Retention',
        module: 'Security & Compliance',
      ),

      policyManagement: (context) => const ModulePlaceholderPage(
        title: 'Policy Management',
        module: 'Security & Compliance',
      ),

      threatDetection: (context) => const ModulePlaceholderPage(
        title: 'Threat Detection',
        module: 'Security & Compliance',
      ),

      vulnerabilityManagement: (context) => const ModulePlaceholderPage(
        title: 'Vulnerability Management',
        module: 'Security & Compliance',
      ),

      encryptionKeyManagement: (context) => const ModulePlaceholderPage(
        title: 'Encryption & Key Management',
        module: 'Security & Compliance',
      ),

      securityAlerts: (context) => const ModulePlaceholderPage(
        title: 'Security Alerts',
        module: 'Security & Compliance',
      ),

      // ------------------------------------------------------------
      // SYSTEM
      // ------------------------------------------------------------
      settings: (context) =>
          const ModulePlaceholderPage(title: 'Settings', module: 'System'),
    };
  }
}

// ====================================================================
// PLACEHOLDER PAGE
// ====================================================================

class ModulePlaceholderPage extends StatelessWidget {
  final String title;
  final String module;

  const ModulePlaceholderPage({
    super.key,
    required this.title,
    required this.module,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF071A3D),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.construction_outlined,
                size: 60,
                color: Color(0xFF0B6FF9),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF071A3D),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                module,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'This page is ready for the actual OneCloud module UI.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
