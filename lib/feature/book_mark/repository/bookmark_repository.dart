import 'package:hive_ce/hive.dart';
import 'package:today_news/core/constant/constant.dart';
import 'package:today_news/feature/book_mark/models/bookmark_model.dart';
import 'package:today_news/feature/home/models/NewsArticleModel.dart';

class BookmarkRepository {
  BookmarkRepository._internal();
  static final BookmarkRepository _instance = BookmarkRepository._internal();
  factory BookmarkRepository() => _instance;

  Box<BookmarkModel>? _bookmarkBox;

  Box<BookmarkModel> get bookmarkBox {
    if (_bookmarkBox == null) {
      throw Exception("bookmarkBox is not initialized");
    }
    return _bookmarkBox!;
  }

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(BookmarkModelAdapter());
    }
    _bookmarkBox = await Hive.openBox<BookmarkModel>(Constant.bookmarkBox);
  }

  List<BookmarkModel> getBookmarks() {
    return bookmarkBox.values.toList();
  }

  Future<void> addBookmark(NewsArticleModel article) async {
    final bookmark = BookmarkModel(
      author: article.author,
      title: article.title,
      description: article.description,
      url: article.url ?? "",
      urlToImage: article.urlToImage,
      publishedAt: article.publishedAt,
      content: article.content,
      bookmarkAt: DateTime.now(),
    );
    await bookmarkBox.put(article.url, bookmark);
  }

  Future<void> removeBookmark(String url) async {
    await bookmarkBox.delete(url);
  }

  bool isBookmarked(String? url) {
    if (url == null || url.isEmpty) return false;
    return bookmarkBox.containsKey(url);
  }

  Future<void> clearBookmarks() async {
    await bookmarkBox.clear();
  }

  BookmarkModel? getBookmark(String url) {
    return bookmarkBox.get(url);
  }

  toggleBookmark(NewsArticleModel article) async {
    if (isBookmarked(article.url)) {
      await removeBookmark(article.url!);
      return false;
    } else {
      await addBookmark(article);
      return true;
    }
  }

  getBookmarkCount() {
    return bookmarkBox.length;
  }

  clearAllBookmarks() async {
    await bookmarkBox.clear();
  }

  searchBookmarks(String query) {
    if (query.isEmpty) return getBookmarks();
    final lowerCaseQuery = query.toLowerCase();
    return bookmarkBox.values.where((bookmark) {
      final titleMatch =
          bookmark.title?.toLowerCase().contains(lowerCaseQuery) ?? false;
      final descriptionMatch =
          bookmark.description?.toLowerCase().contains(lowerCaseQuery) ?? false;
      final authorMatch =
          bookmark.author?.toLowerCase().contains(lowerCaseQuery) ?? false;
      return titleMatch || descriptionMatch || authorMatch;
    }).toList()..sort((a, b) => b.bookmarkAt.compareTo(a.bookmarkAt));
  }

  bookmarkToNewsArticle(BookmarkModel bookmark) {
    return NewsArticleModel(
      author: bookmark.author,
      title: bookmark.title,
      description: bookmark.description,
      url: bookmark.url,
      urlToImage: bookmark.urlToImage,
      publishedAt: bookmark.publishedAt,
      content: bookmark.content,
    );
  }
}
