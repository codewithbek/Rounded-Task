import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:untitled2/cubits/get_data/get_data_cubit.dart';
import 'package:untitled2/data/db/storage.dart';
import 'package:untitled2/utils/icons.dart';
import 'package:untitled2/views/video_view.dart';
import 'package:untitled2/views/widgets/video_item.dart';
import 'widgets/action_button.dart';
import 'widgets/top_item.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    StorageRepository.getString('show').isEmpty ? _showMyDialog() : null;
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
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const TopItemWidget(),
            const SizedBox(
              height: 16,
            ),
            const ActionButtonWidget(),
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
          ],
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
          height: 300,
          width: 327,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
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
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF121212)),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<GetDataCubit, GetDataState>(
                builder: (context, state) {
                  if (state.status == FormzStatus.submissionInProgress) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state.status == FormzStatus.submissionFailure) {
                    return Text(state.errorText);
                  } else if (state.status == FormzStatus.submissionSuccess) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        state.currencyData!.urlsModel.small,
                        width: 295,
                        height: 138,
                        fit: BoxFit.fill,
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
