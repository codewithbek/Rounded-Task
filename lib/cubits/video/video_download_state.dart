part of 'video_download_cubit.dart';

enum Status {
  exist,
  isNotExist,
  downloading,
}

class VideoDownloadState extends Equatable {
  const VideoDownloadState({
    required this.progress,
    required this.newFileLocation,
    this.status = Status.isNotExist,
  });

  final double progress;
  final String newFileLocation;
  final Status status;

  VideoDownloadState copyWith(
          {double? progress, String? newFileLocation, Status? status}) =>
      VideoDownloadState(
        status: status ?? this.status,
        progress: progress ?? this.progress,
        newFileLocation: newFileLocation ?? this.newFileLocation,
      );

  @override
  List<Object?> get props => [
        status,
        progress,
        newFileLocation,
      ];
}
