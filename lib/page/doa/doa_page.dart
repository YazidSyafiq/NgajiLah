import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/page/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ngajilah/page/bottom_navigation_bar/bottom_navigation_provider.dart';
import 'package:ngajilah/page/doa/doa_header.dart';
import 'package:ngajilah/page/doa/doa_list.dart';
import 'package:ngajilah/page/doa/doa_provider.dart';
import 'package:provider/provider.dart';

class KumpulanDoaPage extends StatefulWidget {
  const KumpulanDoaPage({super.key});

  @override
  State<KumpulanDoaPage> createState() => _KumpulanDoaPageState();
}

class _KumpulanDoaPageState extends State<KumpulanDoaPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (mounted) {
          Provider.of<DoaProvider>(context, listen: false).getListDoa();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        int selectedIndex =
            Provider.of<BottomNavbarProvider>(context, listen: false)
                .selectedIndex;
        if (selectedIndex == 2) {
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
      child: const Scaffold(
        body: Column(
          children: [
            DoaHeader(),
            ListDoa(),
          ],
        ),
      ),
    );
  }
}
