part of 'get_data_cubit.dart';

class GetDataState extends Equatable {
  const GetDataState({
    required this.currencyData,
    this.errorText = '',
    this.status = FormzStatus.pure,
    this.isInternet = 'OFFLINE',
  });

  final List<TopLevelModel> currencyData;
  final String errorText;
  final FormzStatus status;
  final String isInternet;

  GetDataState copyWith(
          {List<TopLevelModel>? currencyData,
          String? errorText,
          FormzStatus? status,
          String? isInternet}) =>
      GetDataState(
        currencyData: currencyData ?? this.currencyData,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
        isInternet: isInternet ?? this.isInternet,
      );

  @override
  List<Object> get props => [
        currencyData,
        status,
        errorText,
      ];
}
