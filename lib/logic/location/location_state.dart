
import 'package:equatable/equatable.dart';
import 'package:osta/core/utils/enums.dart';
import 'package:osta/data/models/address_model.dart';

// abstract class LocationState {

// }

// class LocationInitial extends LocationState {}

// class GetMainAddressesLoadingState extends LocationState{}
// class GetMainAddressesSuccessState extends LocationState{
//   final List<AddressModel> mainAddresses;
//   GetMainAddressesSuccessState({required this.mainAddresses});
// }
// class GetMainAddressesErrorState extends LocationState{
//   final String errorMsg;
//   GetMainAddressesErrorState({required this.errorMsg});
// }

class LocationState extends Equatable {
  const LocationState({
    this.mainAddresses = const [],
    this.getMainAddressesState = RequestState.loading,
    this.getMainAddressesMessage = '',

  });

  final List<AddressModel> mainAddresses;
  final RequestState getMainAddressesState;
  final String getMainAddressesMessage;

  LocationState copyWith({
    List<AddressModel>? mainAddresses,
    RequestState? getMainAddressesState,
    String? getMainAddressesMessage,

  }) {
    return LocationState(
      mainAddresses: mainAddresses ?? this.mainAddresses,
    getMainAddressesState: getMainAddressesState ?? this.getMainAddressesState,
      getMainAddressesMessage: getMainAddressesMessage ?? this.getMainAddressesMessage
    );
  }

  @override
  List<Object?> get props => [
    mainAddresses,
    getMainAddressesState,
    getMainAddressesMessage
  ];
}
