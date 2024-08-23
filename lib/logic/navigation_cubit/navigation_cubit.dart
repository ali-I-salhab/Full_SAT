
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/core/utils/nav_bar_enum.dart';
import 'package:osta/logic/navigation_cubit/navigation_states.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationCubit extends Cubit<NavigationStates>{
  NavigationCubit() : super(NavigationStates(navbarItem: NavBarItem.home, index: 0));
  static NavigationCubit get(BuildContext context) => BlocProvider.of<NavigationCubit>(context);

  void getNavBarItem(NavBarItem navbarItem) {
    switch (navbarItem) {
      case NavBarItem.home:
        emit(NavigationStates(navbarItem: NavBarItem.home, index: 0));
        break;
      case NavBarItem.join:
        emit(NavigationStates(navbarItem: NavBarItem.join, index: 1));
        break;
      case NavBarItem.requests:
        emit(NavigationStates(navbarItem: NavBarItem.requests, index: 2));
        break;
      case NavBarItem.profile:
        emit(NavigationStates(navbarItem: NavBarItem.profile, index: 3));
        break;
        case NavBarItem.whatsapp:
          launchWhatsapp();
        // emit(NavigationStates(navbarItem: NavBarItem.whatsapp, index: 4));
        break;
    }
  }

  Future<void> launchWhatsapp() async {
    final url = Uri.parse('https://wa.me/+963994595833');
    print(url);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

}