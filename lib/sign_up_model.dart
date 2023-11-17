import 'package:isar/isar.dart';



//part 'student.g.dart';
part 'sign_model.g.dart';

@collection()
class SignUpModel {
  Id id = isarAutoIncrementId;
  late String name;
  late List<String> ages;
  late List<String> occupation;
  late List<String> nationality;
  late String mobile;
  late String email;

}