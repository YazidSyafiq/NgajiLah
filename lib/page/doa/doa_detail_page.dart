import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/doa/doa_provider.dart';
import 'package:ngajilah/widget/appbar_widget.dart';
import 'package:ngajilah/widget/error_widget.dart';
import 'package:provider/provider.dart';

class DoaDetailPage extends StatefulWidget {
  const DoaDetailPage({
    super.key,
    required this.idDoa,
  });

  final String idDoa;

  @override
  State<DoaDetailPage> createState() => _DoaDetailPageState();
}

class _DoaDetailPageState extends State<DoaDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (mounted) {
          Provider.of<DoaProvider>(context, listen: false)
              .getDetailDoa(idDoa: widget.idDoa);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppbarWidget(
          title: Image.asset(
            Assets.doaLetter,
            height: 50,
          ),
        ),
      ),
      body: Consumer<DoaProvider>(
        builder: (context, provider, child) {
          if (provider.isLoadingDetailDoa) {
            return Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: ColorCollection.vividOrange,
                ),
              ),
            );
          } else if (provider.errorDetailDoa != null) {
            return ErrorGlobalWidget(
              errorText: provider.errorDetailDoa!,
              onRefresh: () {
                provider.getDetailDoa(idDoa: widget.idDoa);
              },
            );
          } else {
            return ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 125,
                        width: double.infinity,
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
                              color: ColorCollection.grey,
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
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Center(
                            child: Text(
                              provider.detailDoaResponse.data?.judul ?? '-',
                              style: TextStyleCollection.poppinsBold.copyWith(
                                fontSize: 18,
                                color: ColorCollection.white,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorCollection.lightGrey2,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                provider.detailDoaResponse.data?.arab ?? '-',
                                style: TextStyleCollection.lateefArabic,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Artinya:',
                              style: TextStyleCollection.poppinsBold.copyWith(
                                fontSize: 14,
                                color: ColorCollection.darkGreen1,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              provider.detailDoaResponse.data?.indo ?? '-',
                              style: TextStyleCollection.poppinsNormal.copyWith(
                                fontSize: 14,
                                color: ColorCollection.darkGreen1,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
