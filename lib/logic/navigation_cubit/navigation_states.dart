
import 'package:equatable/equatable.dart';
import 'package:osta/core/utils/nav_bar_enum.dart';

class NavigationStates extends Equatable{
  final NavBarItem navbarItem ;
  final int index;
  NavigationStates({required this.navbarItem,required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [this.navbarItem,this.index];
}