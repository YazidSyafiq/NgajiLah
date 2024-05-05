import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/asbabun/asbabun_container.dart';
import 'package:ngajilah/page/asbabun/asbabun_form.dart';
import 'package:ngajilah/page/asbabun/asbabun_provider.dart';
import 'package:ngajilah/widget/appbar_widget.dart';
import 'package:provider/provider.dart';

class AsbabunPage extends StatefulWidget {
  const AsbabunPage({super.key});

  @override
  State<AsbabunPage> createState() => _AsbabunPageState();
}

class _AsbabunPageState extends State<AsbabunPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppbarWidget(
          title: Image.asset(
            Assets.asbabunLetter,
            height: 50,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.backgroundSplash,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            const AsbabunContainer(),
            const SizedBox(
              height: 32,
            ),
            const AsbabunForm(),
            const SizedBox(
              height: 24,
            ),
            Consumer<AsbabunProvider>(
              builder: (context, provider, child) {
                if (provider.isLoadingGemini) {
                  return Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          color: ColorCollection.darkGreen1,
                        ),
                      ),
                    ),
                  );
                } else if (provider.errorGemini != null) {
                  return Center(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Text(
                            provider.errorGemini!,
                            style: TextStyleCollection.poppinsNormal.copyWith(
                              fontSize: 14,
                              color: ColorCollection.darkGreen1,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            width: 125,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: const [0, 0.6, 0.8, 0.9],
                                colors: [
                                  ColorCollection.vividOrange,
                                  ColorCollection.princetonOrange,
                                  ColorCollection.royalOrange,
                                  ColorCollection.rajah,
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorCollection.darkGreen1,
                                  offset: const Offset(0, 2.5),
                                  blurRadius: 3,
                                  blurStyle: BlurStyle.normal,
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(Assets.pattern1),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                provider.getAsbabun(
                                    surah: provider.controller.text);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorCollection.transparent,
                                shadowColor: ColorCollection.transparent,
                              ),
                              child: Text(
                                'Refresh',
                                style: TextStyleCollection.poppinsBold.copyWith(
                                  color: ColorCollection.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              color: ColorCollection.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorCollection.grey,
                                  offset: const Offset(1, 3),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.normal,
                                )
                              ],
                            ),
                            child: provider.result != null
                                ? Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      provider.result!,
                                      style: TextStyleCollection.poppinsNormal
                                          .copyWith(
                                        color: ColorCollection.darkGreen1,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
