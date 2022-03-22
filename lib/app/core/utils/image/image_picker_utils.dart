import 'dart:typed_data';

import 'package:dating_demo/all_file/all_file.dart';
import 'package:http/http.dart' show MultipartFile;
import 'package:image_picker/image_picker.dart';

class FImagePickerUtils{
  static Future<Uint8List?> getBytesFromPicker()async{
    final XFile? photo = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: AppConstant.IMAGE_QUALITY );
    var dataMedia = await photo?.readAsBytes();
    return dataMedia;
  }

  static Future<XFile?> getFileFromPicker()async{
    final XFile? photo = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: AppConstant.IMAGE_QUALITY );
    return photo;
  }

  static Future<List<XFile>?> getMultiFileFromPicker()async{
    return ImagePicker().pickMultiImage(imageQuality: AppConstant.IMAGE_QUALITY );
  }

  static Future<MultipartFile?> getMultiPartFileFromPicker()async{
    final XFile? photo = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: AppConstant.IMAGE_QUALITY );
    var fileName = photo?.path.split('/').last;
    var dataMedia = await photo?.readAsBytes();
    if(dataMedia!=null){
      var media = MultipartFile.fromBytes('media', dataMedia, filename: fileName);
      return media;
    }
    return null;
  }
}

extension XFileUtils on XFile{
  Future<MultipartFile> toMultipartFile()async{
    var fileName = path.split('/').last;
    var dataMedia = await readAsBytes();
    var media = MultipartFile.fromBytes('media', dataMedia, filename: fileName);
    return Future.value(media);
  }
}

extension XFileListUtils on List<XFile>{
  Future<List<MultipartFile>> toListMultipartFile()async{
    List<MultipartFile> list = [];
    await Future.wait(mapAsList((e) => e.toMultipartFile().then((value) => list.add(value))));
    logger.i('list result length ${list.length}');
    return list;
  }
}
