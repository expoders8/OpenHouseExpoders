// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';

// class PickerUtils {
//   PickerUtils._();

//   static Future<XFile?> pickImageFromGallery() async {
//     return await ImagePicker().pickImage(source: ImageSource.gallery);
//   }

//   static Future<CroppedFile?> cropSelectedImage(String filePath) async {
//     return await ImageCropper().cropImage(
//       sourcePath: filePath,
//       uiSettings: [
//         AndroidUiSettings(
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         IOSUiSettings(
//           title: 'Crop Image',
//         ),
//       ],
//     );
//   }
// }
