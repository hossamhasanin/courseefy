import 'package:base/base.dart';
import 'package:hive/hive.dart';

class UserAdapter extends TypeAdapter<User>{
  @override
  User read(BinaryReader reader) {
    return User(
        name: reader.read(),
        email: reader.read(),
        token: reader.read(),
        image: reader.read(),
        id: reader.read()
    );
  }

  @override
  final typeId = 0;


  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.name);
    writer.write(obj.email);
    writer.write(obj.token);
    writer.write(obj.image);
    writer.write(obj.id);
  }

}