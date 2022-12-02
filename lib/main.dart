import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/cubits/get_data/get_data_cubit.dart';
import 'package:untitled2/view/task_view.dart';

import 'data/repositories/repository.dart';
import 'data/services/api_client.dart';
import 'data/services/api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OpenApiService openApiService =
      OpenApiService(openApiClient: OpenApiClient());
  // I will not use Multi repository. However I don't need to it.
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
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
