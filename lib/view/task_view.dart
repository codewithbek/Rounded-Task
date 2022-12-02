import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/cubits/get_data/get_data_cubit.dart';
import 'package:untitled2/data/db/storage.dart';
import 'package:untitled2/utils/icons.dart';
import 'package:untitled2/view/widgets/video_player_wiget.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  void initState() {
    print("SHOW VALUE:${StorageRepository.getString('show')}");
    _init();
    super.initState();
  }

  _init() async {
    debugPrint(">>>>>${StorageRepository.getString('show')}");
    StorageRepository.getString('show').isEmpty ? _showMyDialog() : null;
    print("SHOW VALUE:${StorageRepository.getString('show')}");
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
          child: Column(children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  MyIcons.img3,
                  width: 96,
                  height: 96,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Lesson 2",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black38),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "How to talk about nation\nAsilbek Asqarov Asilbek",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                Container(
                  width: 166,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Saqlab qo'yish",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SvgPicture.asset(
                          MyIcons.bookMark,
                          color: Colors.white,
                        )
                      ]),
                ),
              ],
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => VidePlayerWidget()),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Stack(children: [
                      Image.asset(
                        MyIcons.img1,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.6)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0.6, 0.95]),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        bottom: 20,
                        child: Text(
                          "How to speak like a native",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                      Positioned(
                          right: 20,
                          bottom: 20,
                          child: SvgPicture.asset(MyIcons.playCircle))
                    ]),
                  ),
                ),
              ),
            ),
          ])),
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
