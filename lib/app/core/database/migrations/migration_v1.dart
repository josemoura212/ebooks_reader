import 'package:ebooks_reader/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 extends Migration {
  @override
  void create(Batch batch) {
    batch.execute("""
      CREATE TABLE books(
        id Integer not null,
        title text not null,
        author text,
        cover_url text,
        download_url text
      )
    """);
  }

  @override
  void update(Batch batch) {}
}
