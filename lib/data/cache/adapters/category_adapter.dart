import 'package:base/base.dart';
import 'package:hive/hive.dart';

class CategoryAdapter extends TypeAdapter<Category>{
  @override
  Category read(BinaryReader reader) {
    return Category(
        id: reader.read(),
        title: reader.read(),
        description: reader.read(),
        cover: reader.read()
    );
  }

  @override
  final typeId = 1;


  @override
  void write(BinaryWriter writer, Category obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.cover);
  }

}