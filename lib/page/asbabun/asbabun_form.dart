import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/provider/asbabun_provider.dart';
import 'package:provider/provider.dart';

class AsbabunForm extends StatefulWidget {
  const AsbabunForm({super.key});

  @override
  State<AsbabunForm> createState() => _AsbabunFormState();
}

class _AsbabunFormState extends State<AsbabunForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AsbabunProvider>(
      builder: (context, provider, child) {
        return Form(
          key: provider.formKey,
          child: Column(
            children: [
              Container(
                height: 75,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: TextFormField(
                  controller: provider.controller,
                  readOnly: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Pastikan form sudah terisi';
                    }
                    return null;
                  },
                  style: TextStyleCollection.poppinsNormal.copyWith(
                    fontSize: 14,
                    color: ColorCollection.darkGreen1,
                  ),
                  decoration: InputDecoration(
                    label: Text(
                      'Pilih Surah',
                      style: TextStyleCollection.poppinsNormal.copyWith(
                        fontSize: 14,
                        color: ColorCollection.darkGreen1,
                      ),
                    ),
                    suffixIcon: provider.controller.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              provider.deleteSurah();
                            },
                            icon: Icon(
                              Icons.delete,
                              color: ColorCollection.darkGreen1,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: ColorCollection.white,
                                    shadowColor: ColorCollection.transparent,
                                    title: Text(
                                      'Pilih Surah',
                                      style: TextStyleCollection.poppinsBold
                                          .copyWith(
                                        color: ColorCollection.darkGreen1,
                                        fontSize: 16,
                                      ),
                                    ),
                                    content: SizedBox(
                                      width: double.maxFinite,
                                      child: ListView.builder(
                                        itemCount: provider.namaSurah.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              provider.pilihSurah(
                                                surah:
                                                    provider.namaSurah[index],
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: Container(
                                                width: double.infinity,
                                                height: 75,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: ColorCollection.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          ColorCollection.grey,
                                                      offset:
                                                          const Offset(0, 2),
                                                      blurRadius: 3,
                                                      blurStyle:
                                                          BlurStyle.normal,
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 16,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                              Assets
                                                                  .frameNomor1,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            (index + 1)
                                                                .toString(),
                                                            style:
                                                                TextStyleCollection
                                                                    .poppinsBold
                                                                    .copyWith(
                                                              color:
                                                                  ColorCollection
                                                                      .white,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        provider
                                                            .namaSurah[index],
                                                        style:
                                                            TextStyleCollection
                                                                .poppinsBold
                                                                .copyWith(
                                                          color: ColorCollection
                                                              .darkGreen1,
                                                          fontSize: 14,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.add,
                              color: ColorCollection.darkGreen1,
                            ),
                          ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorCollection.darkGreen1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorCollection.darkGreen1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                width: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.2, 0.45, 0.6, 0.7, 0.8, 0.9, 0.95],
                    colors: [
                      ColorCollection.darkGreen1,
                      ColorCollection.blueGreen,
                      ColorCollection.castletonGreen,
                      ColorCollection.bangladeshGreen,
                      ColorCollection.bangladeshGreen1,
                      ColorCollection.spanishViridian,
                      ColorCollection.genericViridian,
                    ],
                  ),
                  image: DecorationImage(
                    image: AssetImage(Assets.pattern2),
                    fit: BoxFit.cover,
                    opacity: 0.1,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (provider.formKey.currentState!.validate()) {
                      provider.getAsbabun(surah: provider.controller.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorCollection.transparent,
                    shadowColor: ColorCollection.transparent,
                    foregroundColor: ColorCollection.white,
                  ),
                  child: Text(
                    'Cari',
                    style: TextStyleCollection.poppinsBold.copyWith(
                      fontSize: 16,
                      color: ColorCollection.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
