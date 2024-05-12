import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/doa/doa_detail_page.dart';
import 'package:ngajilah/page/doa/doa_provider.dart';
import 'package:ngajilah/widget/error_widget.dart';
import 'package:provider/provider.dart';

class ListDoa extends StatefulWidget {
  const ListDoa({super.key});

  @override
  State<ListDoa> createState() => _ListDoaState();
}

class _ListDoaState extends State<ListDoa> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DoaProvider>(
      builder: (context, provider, child) {
        if (provider.isLoadingListDoa) {
          return Expanded(
            child: Container(
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: ColorCollection.vividOrange,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (provider.errorListDoa != null) {
          return Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.backgroundSplash,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: ErrorGlobalWidget(
                errorText: provider.errorListDoa!,
                onRefresh: () {
                  provider.getListDoa();
                },
              ),
            ),
          );
        } else {
          return Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(
                    Assets.backgroundSplash,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView.builder(
                itemCount: provider.listDoaResponse.data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoaDetailPage(
                              idDoa: (index + 1).toString(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
                              color: ColorCollection.semiDarkGrey,
                              offset: const Offset(0, 2.5),
                              blurRadius: 3,
                              blurStyle: BlurStyle.normal,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(
                              Assets.pattern2,
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.15,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      Assets.frameNomor,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyleCollection.poppinsBold
                                        .copyWith(
                                      fontSize: 14,
                                      color: ColorCollection.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                provider.listDoaResponse.data?[index].judul ??
                                    '-',
                                style: TextStyleCollection.poppinsBold.copyWith(
                                  color: ColorCollection.white,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
