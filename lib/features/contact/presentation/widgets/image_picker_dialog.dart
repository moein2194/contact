import 'dart:io';

import 'package:contact/core/global/app_global.dart';
import 'package:contact/core/models/modal_bottom_sheet_props.dart';
import 'package:contact/core/router/app_router.dart';
import 'package:contact/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:contact/features/contact/presentation/widgets/image_picker_layout.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog {
  static Future<dynamic> show() {
    BuildContext context = AppGlobal.navKey.currentState!.context;
    File? image;

    return AppModalBottomSheet.showSimple<dynamic>(
        props: ModalBottomSheetProps(
      body: ImagePickerLayout(
        onPressedCamera: () async {
          image = await _getImage(context: context, source: ImageSource.camera);
          AppRouter.pop(
            argument: image,
          );
        },
        onPressedGallery: () async {
          image =
              await _getImage(context: context, source: ImageSource.gallery);
          AppRouter.pop(
            argument: image,
          );
        },
      ),
    ));
  }

  static Future<File?> _getImage(
      {required BuildContext context, required ImageSource source}) async {
    //Clicking or Picking from Gallery

    var image = await ImagePicker().pickImage(source: source);

    //Cropping the image

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      maxWidth: 1024,
      maxHeight: 1920,
    );
    File file = File(croppedFile!.path);
    return file;
  }
}
