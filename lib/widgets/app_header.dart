import 'package:flutter/material.dart';

class AppHeader extends StatefulWidget {
  final VoidCallback? onMenuPressed;

  const AppHeader({super.key, this.onMenuPressed});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 1,
      child: SizedBox(
        height: 72,
        width: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            if (width < 600) {
              return _buildMobileHeader();
            }

            if (width < 900) {
              return _buildTabletHeader();
            }

            return _buildDesktopHeader();
          },
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE HEADER
  // ============================================================

  Widget _buildMobileHeader() {
    return Container(
      height: 72,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          // MENU BUTTON
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onMenuPressed,
              borderRadius: BorderRadius.circular(10),
              child: const SizedBox(
                width: 44,
                height: 44,
                child: Center(
                  child: Icon(Icons.menu, size: 25, color: Color(0xFF334155)),
                ),
              ),
            ),
          ),

          const SizedBox(width: 4),

          // LOGO
          Expanded(child: _buildMobileLogo()),

          // NOTIFICATION
          _notificationButton(size: 38),

          const SizedBox(width: 4),

          // AI
          _aiButton(size: 38),

          const SizedBox(width: 4),

          // CLICKABLE USER
          _mobileUserMenu(),
        ],
      ),
    );
  }

  // ============================================================
  // TABLET HEADER
  // ============================================================

  Widget _buildTabletHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _menuButton(),

          const SizedBox(width: 12),

          _buildLogo(),

          const SizedBox(width: 20),

          Expanded(child: _buildSearch()),

          const SizedBox(width: 16),

          _notificationButton(),

          const SizedBox(width: 8),

          _aiButton(),

          const SizedBox(width: 8),

          // CLICKABLE USER
          _userProfile(),
        ],
      ),
    );
  }

  // ============================================================
  // DESKTOP HEADER
  // ============================================================

  Widget _buildDesktopHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _menuButton(),

          const SizedBox(width: 16),

          _buildLogo(),

          const SizedBox(width: 28),

          Expanded(child: _buildSearch()),

          const SizedBox(width: 24),

          _notificationButton(),

          const SizedBox(width: 10),

          _aiButton(),

          const SizedBox(width: 10),

          // CLICKABLE USER
          _userProfile(),
        ],
      ),
    );
  }

  // ============================================================
  // MENU BUTTON
  // ============================================================

  Widget _menuButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onMenuPressed,
        borderRadius: BorderRadius.circular(10),
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Center(
            child: Icon(Icons.menu, size: 24, color: Color(0xFF334155)),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE LOGO
  // ============================================================

  Widget _buildMobileLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFF1877F2),
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Icon(Icons.cloud, color: Colors.white, size: 24),
        ),

        const SizedBox(width: 7),

        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'OneCloud',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF1877F2),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Enterprise Platform',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF718096),
                  fontSize: 7,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DESKTOP / TABLET LOGO
  // ============================================================

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF1877F2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.cloud, color: Colors.white, size: 25),
        ),

        const SizedBox(width: 8),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'OneCloud',
              style: TextStyle(
                color: Color(0xFF1877F2),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Enterprise Platform',
              style: TextStyle(
                color: Color(0xFF718096),
                fontSize: 8,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // SEARCH
  // ============================================================

  Widget _buildSearch() {
    return Container(
      height: 42,
      constraints: const BoxConstraints(maxWidth: 520),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F7FB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5EAF1)),
      ),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          hintText: 'Search employees, customers, documents...',
          hintStyle: TextStyle(color: Color(0xFF8A96A8), fontSize: 12),
          prefixIcon: Icon(Icons.search, size: 19, color: Color(0xFF718096)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 11),
        ),
      ),
    );
  }

  // ============================================================
  // NOTIFICATION
  // ============================================================

  Widget _notificationButton({double size = 40}) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                size: 23,
                color: Color(0xFF334155),
              ),
              padding: EdgeInsets.zero,
              splashRadius: 22,
            ),
          ),

          Positioned(
            right: 5,
            top: 4,
            child: Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: Color(0xFFEF4444),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // AI BUTTON
  // ============================================================

  Widget _aiButton({double size = 40}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F6FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.auto_awesome,
          size: 21,
          color: Color(0xFF1877F2),
        ),
        padding: EdgeInsets.zero,
        splashRadius: 22,
      ),
    );
  }

  // ============================================================
  // MOBILE USER MENU
  // ============================================================

  Widget _mobileUserMenu() {
    return PopupMenuButton<String>(
      tooltip: 'User Account',
      offset: const Offset(-180, 8),
      position: PopupMenuPosition.under,

      onSelected: _handleUserMenu,

      itemBuilder: (context) {
        return _userMenuItems();
      },

      child: Container(
        width: 34,
        height: 34,
        decoration: const BoxDecoration(
          color: Color(0xFFE8F1FF),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: const Text(
          'KR',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DESKTOP / TABLET USER PROFILE
  // ============================================================

  Widget _userProfile() {
    return PopupMenuButton<String>(
      tooltip: 'User Account',

      offset: const Offset(0, 8),

      position: PopupMenuPosition.under,

      onSelected: _handleUserMenu,

      itemBuilder: (context) {
        return _userMenuItems();
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                color: Color(0xFFE8F1FF),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Text(
                'KR',
                style: TextStyle(
                  color: Color(0xFF1877F2),
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(width: 8),

            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User',
                  style: TextStyle(
                    color: Color(0xFF1E293B),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 2),

                Text(
                  'Administrator',
                  style: TextStyle(color: Color(0xFF718096), fontSize: 9),
                ),
              ],
            ),

            const SizedBox(width: 4),

            const Icon(
              Icons.keyboard_arrow_down,
              size: 17,
              color: Color(0xFF64748B),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // USER MENU ITEMS
  // ============================================================

  List<PopupMenuEntry<String>> _userMenuItems() {
    return [
      PopupMenuItem<String>(
        enabled: false,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // USER HEADER
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F1FF),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'KR',
                      style: TextStyle(
                        color: Color(0xFF1877F2),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User',
                          style: TextStyle(
                            color: Color(0xFF172033),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Administrator',
                          style: TextStyle(
                            color: Color(0xFF718096),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              const Divider(),

              const SizedBox(height: 8),

              // EMAIL
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 17,
                    color: Color(0xFF718096),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 10,
                          ),
                        ),

                        SizedBox(height: 2),

                        Text(
                          'user@onecloud.com',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ROLE
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.admin_panel_settings_outlined,
                    size: 17,
                    color: Color(0xFF718096),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Role',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 10,
                          ),
                        ),

                        SizedBox(height: 2),

                        Text(
                          'Administrator',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),
            ],
          ),
        ),
      ),

      const PopupMenuDivider(),

      // PROFILE
      const PopupMenuItem<String>(
        value: 'profile',
        child: Row(
          children: [
            Icon(Icons.person_outline, size: 20, color: Color(0xFF1877F2)),

            SizedBox(width: 12),

            Text(
              'My Profile',
              style: TextStyle(color: Color(0xFF334155), fontSize: 13),
            ),
          ],
        ),
      ),

      // SETTINGS
      const PopupMenuItem<String>(
        value: 'settings',
        child: Row(
          children: [
            Icon(Icons.settings_outlined, size: 20, color: Color(0xFF1877F2)),

            SizedBox(width: 12),

            Text(
              'Settings',
              style: TextStyle(color: Color(0xFF334155), fontSize: 13),
            ),
          ],
        ),
      ),

      const PopupMenuDivider(),

      // LOGOUT
      const PopupMenuItem<String>(
        value: 'logout',
        child: Row(
          children: [
            Icon(Icons.logout, size: 20, color: Colors.red),

            SizedBox(width: 12),

            Text('Logout', style: TextStyle(color: Colors.red, fontSize: 13)),
          ],
        ),
      ),
    ];
  }

  // ============================================================
  // USER MENU ACTIONS
  // ============================================================

  void _handleUserMenu(String value) {
    switch (value) {
      case 'profile':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('My Profile clicked'),
            duration: Duration(seconds: 2),
          ),
        );
        break;

      case 'settings':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Settings clicked'),
            duration: Duration(seconds: 2),
          ),
        );
        break;

      case 'logout':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logout clicked'),
            duration: Duration(seconds: 2),
          ),
        );
        break;
    }
  }
}
