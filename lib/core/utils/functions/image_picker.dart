import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../errors/failures.dart';
import '../di.dart';

Future<Either<Failure,String>> pickImage({required ImageSource source}) async {
  final pickedImage = await DependencyInjector.instance<ImagePicker>().pickImage(source: source);
  if (pickedImage != null) {
    return Right(pickedImage.path);
  } else {
    return Left(NoImagePickedFailure());
  }
}