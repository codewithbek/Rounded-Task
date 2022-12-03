import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/cubits/video/video_download_cubit.dart';
import 'package:untitled2/data/models/file_info/file_info.dart';
import 'package:untitled2/utils/icons.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({
    Key? key,
    required this.fileInfo,
  }) : super(key: key);

  final FileInfo fileInfo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoDownloadCubit, VideoDownloadState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
                width: 166,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0XFF00AFFF)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Saqlab qo'yish",
                        style: TextStyle(
                            color: Color(0xFF00AFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SvgPicture.asset(MyIcons.bookMark)
                    ]),
              ),
            ),
            TextButton(
              onPressed: () {
                if (state.newFileLocation.isEmpty) {
                  context
                      .read<VideoDownloadCubit>()
                      .downloadFile(fileInfo: fileInfo);
                } else {
                  Fluttertoast.showToast(msg: 'File mavjud!');
                }
              },
              child: Container(
                width: 166,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        state.newFileLocation.isNotEmpty
                            ? "Yuklangan"
                            : state.status == Status.downloading
                                ? "${(state.progress * 100).round()} %"
                                : "Yuklab olish",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      state.newFileLocation.isEmpty
                          ? SvgPicture.asset(
                              MyIcons.iCloud,
                              color: Colors.white,
                            )
                          : state.status == Status.downloading
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 5,
                                  ),
                                  child: CircularProgressIndicator(
                                    value: state.progress,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(
                                  Icons.download_done_rounded,
                                  color: Colors.white,
                                )
                    ]),
              ),
            ),
          ],
        );
      },
    );
  }
}
