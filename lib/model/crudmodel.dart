import 'package:hive/hive.dart';
    part 'crudmodel.g.dart';    
@HiveType(typeId: 0)
class Notess {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? discription;
  @HiveField(2)
  String? imagepath;
  Notess({required this.title, required this.discription, this.imagepath});
}
