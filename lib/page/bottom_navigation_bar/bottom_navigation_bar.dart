import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/bottom_navigation_bar/bottom_navigation_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.initialIndex,
  });

  final int initialIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (mounted) {
          Provider.of<BottomNavbarProvider>(context, listen: false)
              .getInitialIndex(initialIndex: widget.initialIndex);
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavbarProvider>(
        builder: (context, provider, child) {
          return provider.optionsPage.elementAt(provider.selectedIndex);
        },
      ),
      bottomNavigationBar: Consumer<BottomNavbarProvider>(
        builder: (context, provider, child) {
          return Container(
            height: 75,
            decoration: BoxDecoration(
              color: ColorCollection.white,
              image: DecorationImage(
                image: AssetImage(
                  Assets.backgroundSplash,
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorCollection.semiDarkGrey,
                  offset: const Offset(0, -2),
                  blurRadius: 2,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: BottomBar(
              backgroundColor: ColorCollection.transparent,
              selectedIndex: provider.selectedIndex,
              items: <BottomBarItem>[
                BottomBarItem(
                  backgroundColorOpacity: 1,
                  icon: SvgPicture.asset(
                    IconBottomNavBar.home,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      ColorCollection.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    'Home',
                    style: TextStyleCollection.poppinsBold.copyWith(
                      fontSize: 14,
                      color: ColorCollection.white,
                    ),
                  ),
                  activeIconColor: ColorCollection.white,
                  activeColor: ColorCollection.royalOrange,
                  inactiveColor: ColorCollection.darkGreen1,
                  inactiveIcon: SvgPicture.asset(
                    IconBottomNavBar.home,
                    height: 25,
                    colorFilter: ColorFilter.mode(
                      ColorCollection.darkGreen1,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                BottomBarItem(
                  backgroundColorOpacity: 1,
                  icon: SvgPicture.asset(
                    IconBottomNavBar.quran,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      ColorCollection.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    'Al-Quran',
                    style: TextStyleCollection.poppinsBold.copyWith(
                      fontSize: 14,
                      color: ColorCollection.white,
                    ),
                  ),
                  activeColor: ColorCollection.royalOrange,
                  inactiveColor: ColorCollection.darkGreen1,
                  inactiveIcon: SvgPicture.asset(
                    IconBottomNavBar.quran,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      ColorCollection.darkGreen1,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                BottomBarItem(
                  backgroundColorOpacity: 1,
                  icon: SvgPicture.asset(
                    IconBottomNavBar.doa,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      ColorCollection.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    'Doa',
                    style: TextStyleCollection.poppinsBold.copyWith(
                      fontSize: 14,
                      color: ColorCollection.white,
                    ),
                  ),
                  activeColor: ColorCollection.royalOrange,
                  inactiveColor: ColorCollection.darkGreen1,
                  inactiveIcon: SvgPicture.asset(
                    IconBottomNavBar.doa,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      ColorCollection.darkGreen1,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                BottomBarItem(
                  backgroundColorOpacity: 1,
                  icon: SvgPicture.asset(
                    IconBottomNavBar.tasbih,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      ColorCollection.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    'Tasbih',
                    style: TextStyleCollection.poppinsBold.copyWith(
                      fontSize: 14,
                      color: ColorCollection.white,
                    ),
                  ),
                  activeIconColor: ColorCollection.white,
                  activeColor: ColorCollection.royalOrange,
                  inactiveIcon: SvgPicture.asset(
                    IconBottomNavBar.tasbih,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      ColorCollection.darkGreen1,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
              onTap: (index) {
                provider.getPageByIndex(index: index);
              },
            ),
          );
        },
      ),
    );
  }
}
