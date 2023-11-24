import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:investcraftpartner/services/notificationServices.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
class DownloadeProvider extends ChangeNotifier{
 bool loading = false;
 changeLoading(value){
   loading = value;
   notifyListeners();
 }
  DownloadeProvider(){
    notificationService = NotificationService();
    // listenToNotificationStream();
    notificationService.initializePlatformNotifications();
  }
  // void listenToNotificationStream() =>
  //     notificationService.behaviorSubject.listen((payload) async{
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => DownloadedPdfViewerScreen(pdfUrl: File(payload),)));
  //
  //     });

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final PathProviderPlatform provider = PathProviderPlatform.instance;
  late final NotificationService notificationService;

  Future<bool> saveFile(String url, String fileName) async {
    try {
      if (await _requestPermission(Permission.storage)) {
        changeLoading(true);
        Random random = new Random();
        int randomNumber = random.nextInt(100000);
        print("pppppppppp");
        Directory? directory;
        directory = Platform.isIOS?await getApplicationDocumentsDirectory():await DownloadsPathProvider.downloadsDirectory;
        print(directory);
        String newPath = "";
        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        // newPath = newPath + "/${fileName}";
        // directory = Directory(newPath);
        File saveFile = File(directory.path + "/$fileName""${randomNumber}.pdf");
        if (kDebugMode) {
          print(saveFile.path);
        }
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }
        if (await directory.exists()) {
          await Dio().download(
            url,
            saveFile.path,
          ).then((value) async{
            await notificationService.showLocalNotification(id: randomNumber, title: "${fileName}.pdf", body: "File Downloaded in ${saveFile.path} ", payload: "${saveFile.path}");
          });
        }

        Fluttertoast.showToast(msg: "Pdf Downloaded to Tip Top Directory",toastLength: Toast.LENGTH_LONG);
      }
      changeLoading(false);
      return true;
    } catch (e) {
      changeLoading(false);
      return false;
    }
  }
  Future<bool> _requestPermission(Permission permission) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.mediaLibrary
      //add more permission to request here.
    ].request();
    if (statuses[Permission.mediaLibrary]!.isGranted) {
      return true;
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.mediaLibrary
        //add more permission to request here.
      ].request();
      if (statuses[Permission.mediaLibrary]!.isGranted) {
        return true;
      }
    }
    return false;
  }
}