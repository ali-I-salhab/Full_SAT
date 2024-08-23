import 'package:dot_bottom_nav/dot_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:osta/core/helpers/cache_helper.dart';
import 'package:osta/core/utils/nav_bar_enum.dart';
import 'package:osta/data/models/category_model.dart';
import 'package:osta/data/models/order_models/invoice_model.dart';
import 'package:osta/data/models/order_models/order_details.dart';
import 'package:osta/data/models/parameter_models/order_cost_info_parameter.dart';
import 'package:osta/data/models/user_info_params.dart';
import 'package:osta/data/models/user_model.dart';
import 'package:osta/data/models/worker_model.dart';
import 'package:osta/logic/auth/auth_bloc.dart';
import 'package:osta/logic/navigation_cubit/navigation_cubit.dart';
import 'package:osta/logic/on_boarding/on_boarding_cubit.dart';
import 'package:osta/logic/profile/profile_cubit.dart';
import 'package:osta/presentation/router/routes.dart';
import 'package:osta/presentation/screens/about_app/terms_and_conditions_screen.dart';
import 'package:osta/presentation/screens/auth_screens/register_number_screen.dart';
import 'package:osta/presentation/screens/auth_screens/verify_otp_screen.dart';
import 'package:osta/presentation/screens/cleaning_screens/building_cleaning/building_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/cleaning_categories.dart';
import 'package:osta/presentation/screens/cleaning_screens/commercial_cleaning/commercial_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/frontage_cleaning/frontage_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/furniture_cleaning/carpet_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/furniture_cleaning/curtains_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/furniture_cleaning/furniture_categories.dart';
import 'package:osta/presentation/screens/cleaning_screens/furniture_cleaning/interior_glass_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/furniture_cleaning/kitchen_equipment_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/furniture_cleaning/medical_equipment_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/furniture_cleaning/office_equipment_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/furniture_cleaning/sofa_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/hard_work_cleaning/garden_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/hard_work_cleaning/hard_work_cleaning_categories.dart';
import 'package:osta/presentation/screens/cleaning_screens/hard_work_cleaning/manhole_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/hard_work_cleaning/street_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/hard_work_cleaning/swimmingpool_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/hard_work_cleaning/tank_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/house_cleaning/house_cleaning_order.dart';
import 'package:osta/presentation/screens/cleaning_screens/sterilization_cleaning/sterilization_cleaning_order.dart';
import 'package:osta/presentation/screens/gas_screens/gas_categories_screen.dart';
import 'package:osta/presentation/screens/gas_screens/gas_order_screen.dart';
import 'package:osta/presentation/screens/home_screen/sub_categories_screen.dart';
import 'package:osta/presentation/screens/join_screens/store_application_screen.dart';
import 'package:osta/presentation/screens/join_screens/transport_application_screen.dart';
import 'package:osta/presentation/screens/join_screens/worker_application_screen.dart';
import 'package:osta/presentation/screens/join_screens/workshop_application_screen.dart';
import 'package:osta/presentation/screens/layout/layout.dart';
import 'package:osta/presentation/screens/maintenance/air_conditioning_and_refrigration_work_order_screen.dart';
import 'package:osta/presentation/screens/maintenance/basic_maintenance_works_order_screen.dart';
import 'package:osta/presentation/screens/maintenance/frontage_work_order_screen.dart';
import 'package:osta/presentation/screens/maintenance/isolation_work_order_screen.dart';
import 'package:osta/presentation/screens/maintenance/maintenance_categories.dart';
import 'package:osta/presentation/screens/maintenance/paint_order_screen.dart';
import 'package:osta/presentation/screens/maintenance/painting_and_decoration_order_screen.dart';
import 'package:osta/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:osta/presentation/screens/order_screens/confirm_order_detail_screen.dart';
import 'package:osta/presentation/screens/order_screens/order_cost_details_screen.dart';
import 'package:osta/presentation/screens/order_screens/order_details_screen.dart';
import 'package:osta/presentation/screens/profile_screens/profile_config.dart';
import 'package:osta/presentation/screens/profile_screens/profile_info_screen.dart';
import 'package:osta/presentation/screens/profile_screens/select_location_screen.dart';
import 'package:osta/presentation/screens/requests_screens/order_tracker_screen.dart';
import 'package:osta/presentation/screens/settings/change_language_screen.dart';
import 'package:osta/presentation/screens/settings/notification_screen.dart';
import 'package:osta/presentation/screens/splash_screen/splash_screen.dart';
import 'package:osta/presentation/screens/store_screens/main_stores_screen.dart';
import 'package:osta/presentation/screens/store_screens/shopping_cart_screen.dart';
import 'package:osta/presentation/screens/store_screens/store_products.dart';
import 'package:osta/presentation/screens/tender_screens/add_tender_screen.dart';
import 'package:osta/presentation/screens/tender_screens/tender_categories.dart';
import 'package:osta/presentation/screens/tender_screens/tender_offer_details_screen.dart';
import 'package:osta/presentation/screens/tender_screens/tender_offer_screen.dart';
import 'package:osta/presentation/screens/transport_screens/transport_order_details.dart';
import 'package:osta/presentation/screens/transport_screens/transport_order_screen.dart';
import 'package:osta/presentation/screens/waiting_screens/waiting_screen.dart';
import 'package:osta/presentation/screens/worker_screens/all_workers_screen.dart';


class AppRoutes {

  // MaterialPageRoute _goToNext() {
  //   bool? onBoarding = CacheHelper.getBoolData(key: 'onBoarding');
  //   final String? utok = CacheHelper.getStringData(key: 'userToken');
  //   // int? userId = CacheHelper.getIntData(key: 'userId');
  //
  //   print(utok);
  //   if (onBoarding != null) {
  //     if (utok != null ) {
  //       return MaterialPageRoute(builder: (context) => const Layout(),);
  //
  //       // context.navigateAndRemoveUntil(newRoute: Routes.layoutViewRoute);
  //     }
  //    else if(utok == null || utok == ''){
  //   return MaterialPageRoute(
  //   builder: (context) => BlocProvider(
  //   create: (context) => AuthBloc(),
  //   child: const RegisterNumberScreen(),
  //   ),
  //   );
  //       // context.navigateAndRemoveUntil(newRoute: Routes.registerNumberViewRoute);
  //     }
  //   } else {
  //   return MaterialPageRoute(
  //   builder: (context) => BlocProvider(
  //   create: (context) => OnBoardingCubit(),
  //   child: const OnBoardingScreen(),
  //   ),
  //   );
  //     // context.navigateAndRemoveUntil(newRoute: Routes.onBoardingViewRoute);
  //   }
  // }

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    FlutterNativeSplash.remove();
    switch (routeSettings.name) {
      case Routes.initialRoute:
        // _goToNext();
        return MaterialPageRoute(builder: (context) => FutureBuilder(
            builder: (context,data)=> const SplashView(), future: Future.wait([

        ]),));

      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingScreen(),
          ),
        );

      case Routes.registerNumberViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthBloc(),
            child: const RegisterNumberScreen(),
          ),
        );

      case Routes.verifyOtpViewRoute:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthBloc(),
            child: VerifyOtpScreen(phoneNumber:args),
          ),
        );

      case Routes.layoutViewRoute:
        final args = routeSettings.arguments as int?;
        return MaterialPageRoute(
          builder: (context) =>  Layout(specifiedRoute: args),
        );

        case Routes.profileConfigViewRoute:
          final args = routeSettings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthBloc(),
            child:  ProfileConfigScreen(user: args),
          ),
        );
        case Routes.profileViewRoute:
          final args = routeSettings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ProfileCubit(),
    // ..getUserInfo(),
            child: ProfileInfoScreen(user: args),
          ),
        );

        case Routes.selectLocationViewRoute:
          final args = routeSettings.arguments as UserInfoParam;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthBloc(),
            child: SelectLocationScreen(userName: args.name,email: args.email,),
          ),
        );

      case Routes.changeLanguageViewRoute:
        return MaterialPageRoute(
          builder: (context) => ChangeLanguageScreen(),
        );
        case Routes.notificationViewRoute:
        return MaterialPageRoute(
          builder: (context) => NotificationScreen(),
        );
        case Routes.termAndConditionViewRoute:
        return MaterialPageRoute(
          builder: (context) => TermsAndConditionScreen(),
        );

      case Routes.subCategoriesViewRoute:
        final args = routeSettings.arguments as ServiceCategory;
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(categories: args,),
        );
      case Routes.orderDetailsViewRoute:
        final args = routeSettings.arguments as OrderDetails ;
        return MaterialPageRoute(
          builder: (context) => OrderDetailsScreen(orderDetails: args),
        );
        case Routes.orderCostDetailsViewRoute:
          final args = routeSettings.arguments as OrderCostInfoParam ;
        return MaterialPageRoute(
          builder: (context) => OrderCostDetailsScreen(orderCostInfoParam: args),
        );
        case Routes.confirmOrderDetailsViewRoute:
        return MaterialPageRoute(
          builder: (context) => ConfirmOrderDetailsScreen(),
        );

        case Routes.waitingViewRoute:
        return MaterialPageRoute(
          builder: (context) => WaitingScreen(),
        );

        case Routes.maintenanceCategoriesViewRoute:
        return MaterialPageRoute(
          builder: (context) => MaintenanceCategoriesScreen(),
        );

        case Routes.basicMaintenanceWorkOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => BasicMaintenanceWorkOrderScreen(),
        );
        case Routes.decorationOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => PaintingAndDecorationOrderScreen(),
        );
        case Routes.paintingOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => PaintingOrderScreen(),
        );
        case Routes.frontageWorkOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => FrontageWorkOrderScreen(),
        );
        case Routes.airConditioningAndRefrigrationWorkOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => AirConditioningAndRefrigrationWorkOrderScreen(),
        );
        case Routes.isolationWorkOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => IsolationWorkOrderScreen(),
        );

        case Routes.transportMainViewRoute:
        return MaterialPageRoute(
          builder: (context) => TransportOrderScreen(),
        );
        case Routes.transportOrderDetailsViewRoute:
        return MaterialPageRoute(
          builder: (context) => TransportOrderDetails(),
        );

      case Routes.allWorkersViewRoute:
        final args = routeSettings.arguments as List<WorkerModel>;
        return MaterialPageRoute(
          builder: (context) => ALlWorkersScreen(workers: args,),
        );
      case Routes.cleaningCategoriesViewRoute:
        final args = routeSettings.arguments as List<CategoryModel>;
        return MaterialPageRoute(
          builder: (context) => CleaningCategoriesScreen(categories: args,),
        );

        case Routes.houseCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => HouseCleaningOrderScreen(),
        );
        case Routes.commercialCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => CommercialCleaningOrderScreen(),
        );
        case Routes.buildingCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => BuildingCleaningOrderScreen(),
        );
        case Routes.furnitureCleaningCategoriesViewRoute:
        return MaterialPageRoute(
          builder: (context) => FurnitureCategoriesScreen(),
        );
        case Routes.hardWorkCleaningCategoriesViewRoute:
        return MaterialPageRoute(
          builder: (context) => HardworkCategoriesScreen(),
        );
        case Routes.frontageCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => FrontageCleaningOrderScreen(),
        );
        case Routes.sterilizationCleaningCategoriesViewRoute:
        return MaterialPageRoute(
          builder: (context) => SterilizationCleaningOrderScreen(),
        );

        case Routes.tankCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => TankCleaningOrderScreen(),
        );
      case Routes.swimmingPoolCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => SwimmingPoolCleaningOrderScreen(),
        );
      case Routes.streetCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => StreetCleaningOrderScreen(),
        );
      case Routes.gardensCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => GardenCleaningOrderScreen(),
        );
      case Routes.manholeCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => ManholeCleaningOrderScreen(),
        );

        case Routes.interiorGlassCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => InteriorGlassCleaningOrderScreen(),
        );
      case Routes.carpetCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => CarpetCleaningOrderScreen(),
        );
      case Routes.sofaCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => SofaCleaningOrderScreen(),
        );
      case Routes.curtainsCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => CurtainsCleaningOrderScreen(),
        );
      case Routes.medicalEquipmentCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => MedicalEquipmentCleaningOrderScreen(),
        );
      case Routes.officeEquipmentCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => OfficeEquipmentCleaningOrderScreen(),
        );
      case Routes.kitchenEquipmentCleaningOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => KitchenEquipmentCleaningOrderScreen(),
        );

        case Routes.mainStoreViewRoute:
        return MaterialPageRoute(
          builder: (context) => MainStoresScreen(),
        );

        case Routes.storeProductsViewRoute:
          final args = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => StoreProductsScreen(storeId: args),
        );
        case Routes.shoppingCartViewRoute:
        return MaterialPageRoute(
          builder: (context) => ShoppingCartScreen(),
        );

      case Routes.orderTrackerViewRoute:
        return MaterialPageRoute(
          builder: (context) => OrderTrackerScreen(),
        );

      case Routes.workerApplicationViewRoute:
        return MaterialPageRoute(
          builder: (context) => WorkerApllicationScreen(),
        );

      case Routes.workShopApplicationViewRoute:
        return MaterialPageRoute(
          builder: (context) => WorkshopApplicationScreen(),
        );

        case Routes.storeApplicationViewRoute:
        return MaterialPageRoute(
          builder: (context) => StoreApplicationScreen(),
        );

        case Routes.transportApplicationViewRoute:
        return MaterialPageRoute(
          builder: (context) => TransportApplicationScreen(),
        );

        case Routes.gasCategoriesViewRoute:
        return MaterialPageRoute(
          builder: (context) => GasCategoriesScreen(),
        );

        case Routes.gasOrderViewRoute:
        return MaterialPageRoute(
          builder: (context) => GasOrderScreen(),
        );

        case Routes.tenderCategoriesViewRoute:
        return MaterialPageRoute(
          builder: (context) => TenderCategoriesScreen(),
        );
        case Routes.addTenderViewRoute:
        return MaterialPageRoute(
          builder: (context) => AddTenderScreen(),
        );
        case Routes.tenderOfferViewRoute:
        return MaterialPageRoute(
          builder: (context) => TenderOfferScreen(),
        );
        case Routes.tenderOfferDetailsViewRoute:
        return MaterialPageRoute(
          builder: (context) => TenderOfferDetailsScreen(),
        );



      // case Routes.bookingOneViewRoute:
      //   final args = routeSettings.arguments as BookedHotelInfo;
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => serviceLocator.get<BookingOneCubit>(),
      //       child: BookingOneView(bookedHotelInfo: args),
      //     ),
      //   );

      // case Routes.searchLocationViewRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const SearchLocationView(),
      //   );

      default:
        return unFoundRoute();
    }
  }

  static Route<dynamic> unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            "Un Found Route",
            // style: AppTextStyles.splashTextStyle,
          ),
        ),
      ),
    );
  }
}
