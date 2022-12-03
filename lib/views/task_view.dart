import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled2/cubits/get_data/get_data_cubit.dart';
import 'package:untitled2/cubits/video/video_download_cubit.dart';
import 'package:untitled2/data/db/storage.dart';
import 'package:untitled2/data/models/file_info/file_info.dart';
import 'package:untitled2/utils/icons.dart';
import 'package:untitled2/views/video_view.dart';
import 'package:untitled2/views/widgets/premium_item.dart';
import 'package:untitled2/views/widgets/video_item.dart';
import 'widgets/action_button.dart';
import 'widgets/top_item.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  var singleFile = filesData[0];
  late bool isPremium;
  int lastTap = DateTime.now().millisecondsSinceEpoch;
  int consecutiveTaps = 1;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    StorageRepository.getString('show').isEmpty ? _showMyDialog() : null;
    await context.read<VideoDownloadCubit>().getStatus(file: singleFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "ROUNDED TASK",
            style: TextStyle(color: Color(0XFF121212)),
          )),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.only(top: 24),
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const TopItemWidget(),
              const SizedBox(
                height: 16,
              ),
              ActionButtonWidget(
                fileInfo: singleFile,
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: 344,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: const Color(0xFFF2F2F2),
                )),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VideoView()),
                  );
                },
                child: const VideoItemWidget(),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 380,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    PremiumItem(
                        onChanged: (value) {
                          setState(() {});
                        },
                        isPremium: StorageRepository.getBool('premium1'),
                        id: 1,
                        text: "Grammer",
                        vectorIcon: MyIcons.book,
                        color: const Color(0xFF2898FD)),
                    PremiumItem(
                        onChanged: (value) {
                          setState(() {});
                        },
                        isPremium: StorageRepository.getBool('premium2'),
                        id: 2,
                        text: "Vocabulary",
                        vectorIcon: MyIcons.book,
                        color: Colors.green),
                    PremiumItem(
                        onChanged: (value) {
                          setState(() {});
                        },
                        isPremium: StorageRepository.getBool('premium3'),
                        id: 3,
                        text: "Speaking",
                        vectorIcon: MyIcons.book,
                        color: Colors.deepPurple),
                    PremiumItem(
                      onChanged: (value) {
                        setState(() {});
                      },
                      isPremium: StorageRepository.getBool('premium4'),
                      id: 4,
                      text: "Listening",
                      vectorIcon: MyIcons.book,
                      color: Colors.red,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    await Future.delayed(const Duration(seconds: 1));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
          height: 320,
          width: 327,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 246),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset(MyIcons.close)),
              ),
              const Text(
                'Har safar yangi rasm, siz uchun)',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF121212)),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<GetDataCubit, GetDataState>(
                builder: (context, state) {
                  if (state.status == FormzStatus.submissionInProgress) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 295,
                        height: 138,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else if (state.status == FormzStatus.submissionFailure) {
                    return Text(state.errorText);
                  } else if (state.status == FormzStatus.submissionSuccess) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        height: 138,
                        width: 295,
                        fit: BoxFit.fill,
                        imageUrl: state.currencyData!.urlsModel.small,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 17,
              ),
              TextButton(
                child: Container(
                  height: 48,
                  width: 295,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                      child: Text(
                    "To'xtatish",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await StorageRepository.putString(
                      key: 'show', value: 'false');
                },
              ),
            ],
          ),
        ));
      },
    );
  }
}
