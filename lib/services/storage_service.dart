import 'package:get_storage/get_storage.dart';
import 'package:prompita/utils/storage_constants.dart';

class StorageService {
  static final GetStorage box = GetStorage();

//   To get the user session
  static dynamic get getUserSession => box.read(StorageConstants.authKey);
}
