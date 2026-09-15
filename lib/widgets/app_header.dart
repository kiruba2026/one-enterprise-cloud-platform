import 'package:flutter/material.dart';

class AppHeader extends StatefulWidget {
  final VoidCallback? onMenuPressed;

  const AppHeader({super.key, this.onMenuPressed});

  @override
  State<AppHeader> createState() {
    return _AppHeaderState();
  }
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
    return Container(
      height: 78,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                // ==================================================
                // MENU BUTTON
                // ==================================================

                _buildMenuButton(),

                const SizedBox(width: 10),

                // ==================================================
                // ONECLOUD BRAND
                // ==================================================
                _buildBrand(),

                // ==================================================
                // SPACE
                // ==================================================
                const SizedBox(width: 45),

                // ==================================================
                // RESPONSIVE SEARCH BAR
                // ==================================================
                if (constraints.maxWidth >= 700)
                  _buildResponsiveSearch(constraints.maxWidth),

                const Spacer(),

                // ==================================================
                // NOTIFICATION
                // ==================================================
                _buildNotificationButton(),

                const SizedBox(width: 7),

                // ==================================================
                // AI
                // ==================================================
                _buildAiButton(),

                const SizedBox(width: 10),

                // ==================================================
                // PROFILE
                // ==================================================
                _buildProfile(),
              ],
            ),
          );
        },
      ),
    );
  }

  // ==============================================================
  // MENU BUTTON
  // ==============================================================

  Widget _buildMenuButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          widget.onMenuPressed?.call();
        },
        child: const SizedBox(
          width: 38,
          height: 38,
          child: Center(
            child: Icon(Icons.menu_rounded, size: 25, color: Color(0xFF374151)),
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // ONECLOUD BRAND
  // ==============================================================

  Widget _buildBrand() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Cloud logo
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF1877F2),
            borderRadius: BorderRadius.circular(11),
          ),
          child: const Icon(Icons.cloud_rounded, color: Colors.white, size: 27),
        ),

        const SizedBox(width: 10),

        // Brand text
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OneCloud',
              style: TextStyle(
                color: Color(0xFF1877F2),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.4,
              ),
            ),
            SizedBox(height: 1),
            Text(
              'Enterprise Platform',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ==============================================================
  // RESPONSIVE SEARCH
  // ==============================================================

  Widget _buildResponsiveSearch(double screenWidth) {
    double searchWidth = 450;

    if (screenWidth < 1250) {
      searchWidth = 380;
    }

    if (screenWidth < 1050) {
      searchWidth = 320;
    }

    if (screenWidth < 850) {
      searchWidth = 260;
    }

    return SizedBox(width: searchWidth, height: 44, child: _buildSearchBar());
  }

  // ==============================================================
  // SEARCH BAR
  // ==============================================================

  Widget _buildSearchBar() {
    return TextField(
      controller: searchController,
      style: const TextStyle(color: Color(0xFF1E293B), fontSize: 14),
      decoration: InputDecoration(
        hintText: 'Search employees, customers, documents...',
        hintStyle: const TextStyle(color: Color(0xFF64748B), fontSize: 13),

        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Color(0xFF475569),
          size: 21,
        ),

        suffixIcon: searchController.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  searchController.clear();

                  setState(() {});
                },
                icon: const Icon(
                  Icons.close_rounded,
                  size: 18,
                  color: Color(0xFF64748B),
                ),
              )
            : null,

        filled: true,

        fillColor: const Color(0xFFF1F5F9),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 11,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBFDBFE), width: 1.5),
        ),
      ),

      onChanged: (_) {
        setState(() {});
      },

      onSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          showMessage('Searching for "${value.trim()}"');
        }
      },
    );
  }

  // ==============================================================
  // NOTIFICATION
  // ==============================================================

  Widget _buildNotificationButton() {
    return Tooltip(
      message: 'Notifications',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            showMessage('You have new notifications.');
          },
          child: SizedBox(
            width: 42,
            height: 42,
            child: Stack(
              children: [
                const Center(
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: Color(0xFF374151),
                    size: 24,
                  ),
                ),

                // Notification dot
                Positioned(
                  top: 8,
                  right: 8,
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
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // AI BUTTON
  // ==============================================================

  Widget _buildAiButton() {
    return Tooltip(
      message: 'OneCloud AI',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            showMessage('OneCloud AI assistant is available.');
          },
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              color: Color(0xFF1877F2),
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // PROFILE
  // ==============================================================

  Widget _buildProfile() {
    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      elevation: 8,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      onSelected: (value) {
        switch (value) {
          case 'profile':
            showMessage('Profile selected.');
            break;

          case 'settings':
            showMessage('Settings selected.');
            break;

          case 'logout':
            showMessage('Logout selected.');
            break;
        }
      },

      itemBuilder: (context) {
        return [
          const PopupMenuItem<String>(
            value: 'profile',
            child: Row(
              children: [
                Icon(
                  Icons.person_outline_rounded,
                  size: 20,
                  color: Color(0xFF475569),
                ),
                SizedBox(width: 12),
                Text('My Profile'),
              ],
            ),
          ),

          const PopupMenuItem<String>(
            value: 'settings',
            child: Row(
              children: [
                Icon(
                  Icons.settings_outlined,
                  size: 20,
                  color: Color(0xFF475569),
                ),
                SizedBox(width: 12),
                Text('Settings'),
              ],
            ),
          ),

          const PopupMenuDivider(),

          const PopupMenuItem<String>(
            value: 'logout',
            child: Row(
              children: [
                Icon(Icons.logout_rounded, size: 20, color: Color(0xFFDC2626)),
                SizedBox(width: 12),
                Text('Logout', style: TextStyle(color: Color(0xFFDC2626))),
              ],
            ),
          ),
        ];
      },

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFE8F1FF),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'KR',
                style: TextStyle(
                  color: Color(0xFF1877F2),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          const SizedBox(width: 9),

          // User details
          if (MediaQuery.of(context).size.width >= 900)
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User',
                  style: TextStyle(
                    color: Color(0xFF1E293B),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  'Administrator',
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 10),
                ),
              ],
            ),

          const SizedBox(width: 4),

          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF475569),
            size: 20,
          ),
        ],
      ),
    );
  }

  // ==============================================================
  // MESSAGE
  // ==============================================================

  void showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
