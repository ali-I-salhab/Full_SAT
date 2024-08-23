import 'package:equatable/equatable.dart';

class OnBoardingModel extends Equatable {
  const OnBoardingModel({
    required this.image,
    required this.heading,
    required this.subHeading,
  });
  final String image;
  final String heading;
  final String subHeading;

  @override
  // TODO: implement props
  List<Object?> get props => [image,heading,subHeading];
}
