import 'package:base/base.dart';
import 'package:courseefy/data/cache/adapters/category_adapter.dart';
import 'package:courseefy/data/cache/adapters/user_adapter.dart';
import 'package:hive/hive.dart';

class CourseAdapter extends TypeAdapter<Course>{

  final UserAdapter _userAdapter;
  final CategoryAdapter _categoryAdapter;

  CourseAdapter(this._userAdapter, this._categoryAdapter);

  @override
  Course read(BinaryReader reader) {
    return Course(
        id: reader.read(),
        title: reader.read(),
        image: reader.read(),
        description: reader.read(),
        rating: reader.read(),
        level: reader.read(),
        cost: reader.read(),
        duration: reader.read(),
        introVideoUrl: reader.read(),
        introduction: reader.read(),
        studentNumber: reader.read(),
        tutor: _userAdapter.read(reader),
        category: _categoryAdapter.read(reader)
    );
  }

  @override
  final typeId = 2;


  @override
  void write(BinaryWriter writer, Course obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.image);
    writer.write(obj.description);
    writer.write(obj.rating);
    writer.write(obj.level);
    writer.write(obj.cost);
    writer.write(obj.duration);
    writer.write(obj.introVideoUrl);
    writer.write(obj.introduction);
    writer.write(obj.studentNumber);
    _userAdapter.write(writer, obj.tutor);
    _categoryAdapter.write(writer, obj.category);
  }

}