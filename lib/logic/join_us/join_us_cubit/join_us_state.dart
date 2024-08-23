
abstract class JoinUsState {}

class JoinUsInitial extends JoinUsState {}

class AddNewToggleState extends JoinUsState {
  bool addNew ;
  AddNewToggleState({required this.addNew});
}
class ChangeSelectedJobState extends JoinUsState {
  String selectedJob ;
  ChangeSelectedJobState({required this.selectedJob});
}