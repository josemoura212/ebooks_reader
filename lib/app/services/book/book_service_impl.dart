import 'package:ebooks_reader/app/models/book_model.dart';
import 'package:ebooks_reader/app/repositories/book/book_repository_impl.dart';

import './book_service.dart';

class BookServiceImpl implements BookService {
  final _repository = BookRepositoryImpl();
  @override
  Future<List<BookModel>> getAllBooks() => _repository.getAllBooks();
}
