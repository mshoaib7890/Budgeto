import 'package:budgets_app/colors.dart';
import 'package:budgets_app/presentation/screens/home_screen/home_screen.dart';
import 'package:budgets_app/presentation/screens/my_wallet/wallet_screen.dart';
import 'package:budgets_app/presentation/screens/user_profile/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../budgeto_themes.dart';
import '../screens/auth/login_screen.dart';
import '../screens/plan/planning_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return const [
      HomeScreen(),
      WalletScreen(),
      PlanningScreeen(),
      UserProfileScreeen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    final navBarColor =
        BudgetoThemes.isDarkMode(context) ? kDarkGreenNavIconC : kGreenNavC;
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: navBarColor,
        activeColorPrimary: navBarColor,
        icon: const Icon(Icons.home),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: navBarColor,
        activeColorPrimary: navBarColor,
        icon: const Icon(Icons.account_balance_wallet),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: navBarColor,
        activeColorPrimary: navBarColor,
        icon: const Icon(Icons.article),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: navBarColor,
        activeColorPrimary: navBarColor,
        icon: const Icon(Icons.person),
      ),
    ];
  }

  bool isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PersistentTabView(
            context,
            controller: controller,
            screens: _buildScreens(),
            items: _navBarItems(),
            navBarHeight: 60,
            decoration: NavBarDecoration(
              colorBehindNavBar: BudgetoThemes.isDarkMode(context)
                  ? kDarkGreenBackC
                  : kGreenDarkC,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            padding: EdgeInsets.all(0), // Corrected margin usage
            backgroundColor: Theme.of(context).primaryColor,
            navBarStyle: NavBarStyle.style3, // Style of the navigation bar
          );
        }
        return const LoginScreen();
      },
    );
  }
}
