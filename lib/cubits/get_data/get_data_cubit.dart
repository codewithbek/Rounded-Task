
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:untitled2/data/models/api_model/top_level/top_level.dart';
import 'package:untitled2/data/repositories/repository.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
   GetDataCubit({required Repository repository})
      : _repository = repository,
        super(const GetDataState(currencyData: []));

  final Repository _repository;
  void getCategories() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final currencyData = await _repository.getAllData();
      emit(state.copyWith(
        currencyData: currencyData,
        status: FormzStatus.submissionSuccess,
      ));
    } on DioError catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorText: error.toString(),
        ),
      );
    }
  }
}
