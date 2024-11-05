import '../errors/exceptions.dart';
import 'app_durations.dart';

abstract class NetworkConstants{
  static const String apiKey='sk-proj-Uahti1I76I0s41VXrB6IT3BlbkFJ5LQJ1AM9aRvnxkvhHDcj';
  static const String serverKey = 'AIzaSyDHYdGe_bBHlvNpeB7M10Trene8XY_rKxo';
  static const String baseUrl='https://fakestoreapi.com/';
  static const String jsonContentType='application/json';
  static const String contentType='Content-Type';
  static const String accept = "Accept";
  static const int successStatusCode = 200;
  static const int failStatusCode = 404;
  static const String bearerAuthPrefix = 'Bearer';
  static const String keyEqualPrefix = 'key=';
  static const String imagesFolder = 'Images';
  static const String sortKey = 'sort';
  static const Duration timeoutDuration = AppDurations.d15Sec;
//////////////////////////////////////////////////////////////////////
  static callTimeOutCallback() => throw TimeOutException();
}