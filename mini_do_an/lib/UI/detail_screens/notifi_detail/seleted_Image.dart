import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../notifi_layout_picture/five_pictures.dart';
import '../notifi_layout_picture/four_pictures.dart';
import '../notifi_layout_picture/more_five_pictures.dart';
import '../notifi_layout_picture/one_picture.dart';
import '../notifi_layout_picture/three_pictures.dart';
import '../notifi_layout_picture/two_pictures.dart';

class SeletedImageScreen extends StatefulWidget {
  SeletedImageScreen({
    Key? key,
    required this.pathImage,
  }) : super(key: key);
  Function pathImage;
  @override
  State<SeletedImageScreen> createState() => _SeletedImageScreenState();
}

class _SeletedImageScreenState extends State<SeletedImageScreen> {
  File? imageFile;
  List<String> listImage = [];
  var _lengthListImage;

  late List<Widget> listLayoutPictures;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listLayoutPictures = [
      OnePicture(link: listImage),
      TwoPictures(link: listImage),
      ThreePictures(link: listImage),
      FourPictures(
        link: listImage,
      ),
      FivePictures(link: listImage),
      MoreFivePictures(
        link: listImage,
      ),
    ];
  }

  Widget getWidget() {
    _lengthListImage = listImage.length;
    print(" list Images la : $_lengthListImage");
    if (listImage.length == 0) {
      return SizedBox(
        height: 10,
      );
    } else if (listImage.length < 6) {
      return listLayoutPictures[_lengthListImage - 1];
    }
    return listLayoutPictures[5];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // imageFile == null
          //     ? SizedBox(
          //         height: 1,
          //       ),
          // Image.asset(
          //     'assets/no_profile_image.png',
          //     height: 300.0,
          //     width: 300.0,
          //   )
          // : listImage.length == 1
          //     ? Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 2),
          //         child: ClipRRect(
          //             borderRadius: BorderRadius.circular(10.0),
          //             child: Image.file(
          //               imageFile!,
          //               height: 300.0,
          //               width: double.infinity,
          //               fit: BoxFit.fill,
          //             )),
          //       )
          //     : Container(
          //         height: 400,
          //         width: double.infinity,
          //         child: Row(children: [
          //           Expanded(
          //             flex: 1,
          //             child: ClipRRect(
          //                 borderRadius: BorderRadius.circular(10.0),
          //                 child: Image.file(
          //                   File.fromUri(Uri.parse(listImage[0])),
          //                   height: 300.0,
          //                   fit: BoxFit.fill,
          //                 )),
          //           ),
          //           Expanded(
          //             flex: 1,
          //             child: ClipRRect(
          //                 borderRadius: BorderRadius.circular(10.0),
          //                 child: Image.file(
          //                   File.fromUri(Uri.parse(listImage[1])),
          //                   height: 300.0,
          //                   fit: BoxFit.fill,
          //                 )),
          //           ),
          //         ]),
          //       ),

          getWidget(),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () async {
              Map<Permission, PermissionStatus> statuses = await [
                Permission.storage,
                Permission.camera,
              ].request();
              if (statuses[Permission.storage]!.isGranted &&
                  statuses[Permission.camera]!.isGranted) {
                showImagePicker(context);
              } else {
                print('no permission provided');
              }
            },
            child: Text('Select Image'),
          ),
        ],
      ),
    );
  }

  final picker = ImagePicker();

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.pop(context);
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: SizedBox(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 60.0,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        _imgFromCamera();

                        Navigator.pop(context);
                      },
                    ))
                  ],
                )),
          );
        });
  }

  _imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));

        ///
        setState(() {
          print('link pathImage Gallery: ${File(value.path)}');
          widget.pathImage('${File(value.path).path}');
          listImage.add('${File(value.path).path}'); // them path vao listImage
        });
      }
    });
  }

  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
        ////
        setState(() {
          print('link pathImage camera: ${File(value.path).path}');
          widget.pathImage('${File(value.path).path}');
          listImage.add('${File(value.path).path}'); // them path vao listImage
        });
      }
    });
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
      });
      // reload();
    }
  }
}
