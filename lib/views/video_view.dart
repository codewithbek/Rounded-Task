import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/video/video_download_cubit.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    if (context.read<VideoDownloadCubit>().state.status == Status.isNotExist ||
        context.read<VideoDownloadCubit>().state.status == Status.downloading) {
      videoPlayerController = VideoPlayerController.network(
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")
        ..initialize().then((value) {
          setState(() {});
        });
    } else {
      var file = context.read<VideoDownloadCubit>().state.newFileLocation;
      videoPlayerController = VideoPlayerController.file(File(file))
        ..initialize().then((value) {
          setState(() {});
        });
    }

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
