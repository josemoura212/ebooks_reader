import 'package:ebooks_reader/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 extends Migration {
  @override
  void create(Batch batch) {
    batch.execute("""
      CREATE TABLE books (
        id integer not null,
        title text not null,
        author text not null,
        cover_url text not null,
        download_url text not null,
        favorite integer not null
      )
    """);
  }

  @override
  void update(Batch batch) {}
}
