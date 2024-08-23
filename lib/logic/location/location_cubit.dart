
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/core/utils/enums.dart';
import 'package:osta/data/models/address_model.dart';
import 'package:osta/data/repositories/location_repository.dart';
import 'package:osta/logic/location/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState()){
    getAddresses();
  }

  static LocationCubit get(BuildContext context) => BlocProvider.of<LocationCubit>(context);

  List<AddressModel> maiAddresses =[];
  LocationRepository locationRepository = LocationRepository();
  Future<void> getAddresses() async{
    // emit(GetMainAddressesLoadingState());
    await locationRepository.getAddresses().then((value) async{
      value.fold((l) {
        print(l.errorMessage);
        // emit(GetMainAddressesErrorState(errorMsg: l.errorMessage ?? ''));
        emit(state.copyWith(
          getMainAddressesState: RequestState.error,
          getMainAddressesMessage: l.errorMessage,
        ));
      },
              (r) {
        print('its r');
        maiAddresses = r ;
        emit(state.copyWith(mainAddresses: r,getMainAddressesState: RequestState.loaded));
            // emit(GetMainAddressesSuccessState(mainAddresses: r));
          } );
    });
  }


}
