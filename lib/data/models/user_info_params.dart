import 'package:equatable/equatable.dart';
import 'package:osta/data/models/user_model.dart';

class UserInfoParam{
  const UserInfoParam({
    required this.name,required this.email
});
  final String name;
  final String email;
}

class authResponse extends Equatable{
final String token;
final UserModel userData;
const authResponse({required this.userData , required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [token];

}