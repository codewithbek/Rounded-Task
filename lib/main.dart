import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/get_data/get_data_cubit.dart';
import 'package:untitled2/cubits/video/video_download_cubit.dart';
import 'package:untitled2/data/db/storage.dart';
import 'package:untitled2/views/task_view.dart';

import 'data/repositories/repository.dart';
import 'data/services/api_client.dart';
import 'data/services/api_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  OpenApiService openApiService =
      OpenApiService(openApiClient: OpenApiClient());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetDataCubit(
            repository: Repository(
              openApiService: openApiService,
            ),
          )..getCategories(),
        ),
        BlocProvider<VideoDownloadCubit>(
          create: (context) => VideoDownloadCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskView(),
    );
  }
}
