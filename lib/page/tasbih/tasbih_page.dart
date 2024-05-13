import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ngajilah/provider/bottom_navigation_provider.dart';
import 'package:ngajilah/page/tasbih/tasbih_button.dart';
import 'package:ngajilah/page/tasbih/tasbih_container.dart';
import 'package:ngajilah/provider/tasbih_provider.dart';
import 'package:ngajilah/page/tasbih/tasbih_refresh.dart';
import 'package:provider/provider.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({super.key});

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        int selectedIndex =
            Provider.of<BottomNavbarProvider>(context, listen: false)
                .selectedIndex;
        if (selectedIndex == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(
                initialIndex: 0,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorCollection.darkGreen1,
            image: DecorationImage(
              image: AssetImage(
                Assets.backgroundSplash,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset(
                    Assets.tasbihLetter,
                    height: 50,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const TasbihContainer(),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: 225,
                height: 225,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      Assets.tasbihImagePage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(child: Consumer<TasbihProvider>(
                  builder: (context, provider, child) {
                    return Text(
                      '${provider.tasbihCounter}',
                      style: TextStyleCollection.poppinsBold.copyWith(
                        color: ColorCollection.white,
                        fontSize: 50,
                      ),
                    );
                  },
                )),
              ),
              const SizedBox(
                height: 24,
              ),
              const TasbihRefresh(),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        ),
        floatingActionButton: const ButtonTasbih(),
      ),
    );
  }
}
