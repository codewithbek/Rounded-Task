import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled2/data/models/file_info/file_info.dart';
import 'dart:io' as io;

part 'video_download_state.dart';

class VideoDownloadCubit extends Cubit<VideoDownloadState> {
  VideoDownloadCubit()
      : super(
          const VideoDownloadState(
            progress: 0.0,
            newFileLocation: "",
          ),
        );

  void downloadFile({
    required FileInfo fileInfo,
  }) async {
    emit(state.copyWith(
        newFileLocation: "", progress: 0.0, status: Status.isNotExist));

    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;
    Dio dio = Dio();

    var directory = await getDownloadPath();

    String newFileLocation = "${directory?.path}/${fileInfo.fileName}.mp4";

    try {
      emit(state.copyWith(status: Status.downloading));
      await dio.download(fileInfo.fileUrl, newFileLocation,
          onReceiveProgress: (received, total) {
        double pr = received / total;
        emit(state.copyWith(progress: pr));
      });
      emit(state.copyWith(
        status: Status.exist,
        newFileLocation: newFileLocation,
      ));
    } catch (error) {
      debugPrint("DOWNLOAD ERROR:$error");
      emit(state.copyWith(
        status: Status.isNotExist,
        newFileLocation: "",
        progress: 0.0,
      ));
    }
  }

  Future<void> getStatus({required FileInfo file}) async {
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;

    var directory = await getDownloadPath();

    String newFileLocation = "${directory?.path}/${file.fileName}.mp4";

    bool isExist = await io.File(newFileLocation).exists();
    if(isExist){
      emit(state.copyWith(
            newFileLocation: newFileLocation, status: Status.exist));
    }else{
      emit(state.copyWith(
            newFileLocation: "", progress: 0.0, status: Status.isNotExist));
    }
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }
}
