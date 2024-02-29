import 'package:eneler_mariia/src/common/components/colors/colors.dart';
import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:eneler_mariia/src/features/education/presentation/screens/video_list_screen.dart';
import 'package:eneler_mariia/src/features/profile/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const _pages = <Widget>[VideoListScreen(), ProfileScreen()];

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: onTap,
        selectedItemColor: activeColor,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/not_active_home.svg'),
              activeIcon: SvgPicture.asset('assets/icons/home.svg'),
              label: AppLocalizations.of(context)!.lessons),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/not_active_profile.svg'),
              activeIcon: SvgPicture.asset('assets/icons/active_profile.svg'),
              label: AppLocalizations.of(context)!.profile)
        ],
        selectedLabelStyle: selectedLabelTextStyle,
        unselectedLabelStyle: unSelectedLabelTextStyle,
      ),
    );
  }

  void onTap(int page) {
    setState(() {
      currentPage = page;
    });
  }
}
