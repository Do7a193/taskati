import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/funcations/navigation.dart';
import 'package:taskati/core/serivces/local_storage.dart';
import 'package:taskati/core/utils/appcolors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/widgest/custom_Button.dart';
import 'package:taskati/feature/home/home_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? path;
  String name = '';

  @override
  void initState() {
    super.initState();
    path = AppLocalSotrage.getCachData(AppLocalSotrage.kImage);
    name = AppLocalSotrage.getCachData(AppLocalSotrage.kName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              PushWithReplacment(context, HomeView());
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Appcolors.Primary,
            )),
        actions: [
          // TextButton(
          //     onPressed: () {
          //       if (path != null && name.isNotEmpty) {
          //         AppLocalSotrage.cachData(AppLocalSotrage.kName, name);
          //         AppLocalSotrage.cachData(AppLocalSotrage.kImage, path);
          //         AppLocalSotrage.cachData(AppLocalSotrage.kIsUpload, true);

          //         PushWithReplacment(context, const HomeView());
          //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //           content: const Text('Success'),
          //           backgroundColor: Appcolors.Primary,
          //         ));
          //       } else if (path == null && name.isNotEmpty) {
          //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //           content: const Text('Please Upload Image'),
          //           backgroundColor: Appcolors.Red,
          //         ));
          //       } else if (path != null && name.isEmpty) {
          //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //           content: const Text('Please Enter Your Name'),
          //           backgroundColor: Appcolors.Red,
          //         ));
          //       } else {
          //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //           content:
          //               const Text('Please Enter Your Name and Upload Image'),
          //           backgroundColor: Appcolors.Red,
          //         ));
          //       }
          //     },
          //     child: const Text('Done'))
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: (path != null)
                        ? FileImage(File(path ?? ' '))
                        : const AssetImage('assets/1077114.png'),
                    backgroundColor: Appcolors.Primary,
                  ),
                  Positioned(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Appcolors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 150,
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      CustomButton(
                                          width: double.infinity,
                                          text: 'Upload From Camera',
                                          onPressed: () {
                                            pickImage(true);
                                            Navigator.pop(context);
                                          }),
                                      Gap(10),
                                      CustomButton(
                                          width: double.infinity,
                                          text: 'Upload From Galary',
                                          onPressed: () {
                                            pickImage(false);
                                            Navigator.pop(context);
                                          })
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: Appcolors.Black,
                        ),
                      ),
                    ),
                    bottom: 10,
                    right: 20,
                  ),
                ],
              ),
              const Gap(10),
              const Divider(),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: getBodyTextStyle(
                          fontSize: 18, colorFree: Appcolors.Primary),
                    ),
                  ),
                  IconButton.outlined(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 250,
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              name = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              hintStyle: getSmallTextStyle(),
                                              hintText: name),
                                        ),
                                        Gap(20),
                                        CustomButton(
                                            width: double.infinity,
                                            text: 'Update Your New Name',
                                            onPressed: () {
                                              if (name.isNotEmpty) {
                                                AppLocalSotrage.cachData(
                                                    AppLocalSotrage.kName,
                                                    name);
                                                Navigator.pop(context);
                                              }
                                            })
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                        color: Appcolors.Primary,
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  pickImage(bool isCamera) {
    ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
        AppLocalSotrage.cachData(AppLocalSotrage.kImage, path);
      }
    });
  }
}
