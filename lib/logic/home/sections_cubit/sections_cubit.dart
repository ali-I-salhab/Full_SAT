import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/data/models/main_service_model.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());

  List<MainService> getServices(BuildContext context) {
    return [
      MainService(serviceId: 1,
          serviceName: 'home.maintainance'.tr(context,),
          serviceLogo: 'assets/images/main_services_logos/tools.png'),
      MainService(serviceId: 2,
          serviceName: 'home.worker'.tr(context),
          serviceLogo: 'assets/images/main_services_logos/worker.png'),
      MainService(serviceId: 3,
          serviceName: 'home.transport'.tr(context),
          serviceLogo: 'assets/images/main_services_logos/transport.png'),
      MainService(serviceId: 4,
          serviceName: 'home.store'.tr(context),
          serviceLogo: 'assets/images/main_services_logos/store.png'),
      MainService(serviceId: 5,
          serviceName: 'home.cleaning'.tr(context),
          serviceLogo: 'assets/images/main_services_logos/cleaning.png'),
      MainService(serviceId: 6,
          serviceName: 'home.gas'.tr(context),
          serviceLogo: 'assets/images/main_services_logos/gas.png'),
            MainService(serviceId: 7,
          serviceName: 'home.tender'.tr(context),
          serviceLogo: 'assets/images/main_services_logos/tender.png'),

    ];
  }

}
