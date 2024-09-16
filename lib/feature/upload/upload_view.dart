import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/funcations/navigation.dart';
import 'package:taskati/core/serivces/local_storage.dart';
import 'package:taskati/core/utils/appcolors.dart';
import 'package:taskati/core/widgest/custom_Button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/feature/home/home_view.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  AppLocalSotrage.cachData(AppLocalSotrage.kName, name);
                  AppLocalSotrage.cachData(AppLocalSotrage.kImage, path);
                  AppLocalSotrage.cachData(AppLocalSotrage.kIsUpload, true);

                  PushWithReplacment(context,const HomeView());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Success'),
                    backgroundColor: Appcolors.Primary,
                  ));
                } else if (path == null && name.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Please Upload Image'),
                    backgroundColor: Appcolors.Red,
                  ));
                } else if (path != null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Please Enter Your Name'),
                    backgroundColor: Appcolors.Red,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        const Text('Please Enter Your Name and Upload Image'),
                    backgroundColor: Appcolors.Red,
                  ));
                }
              },
              child: const Text('Done'))
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: (path != null)
                    ? FileImage(File(path ?? ' '))
                    : const AssetImage('assets/1077114.png'),
                backgroundColor: Appcolors.Primary,
              ),
              const Gap(20),
              CustomButton(
                text: 'Upload From Camera',
                onPressed: () {
                  pickImage(true);
                },
              ),
              const Gap(10),
              CustomButton(
                  text: 'Upload From Galary',
                  onPressed: () {
                    pickImage(false);
                  }),
              const Gap(10),
              const Divider(),
              const Gap(10),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Your Name',
                ),
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
      }
    });
  }
}
