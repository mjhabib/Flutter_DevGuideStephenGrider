import 'package:news_api/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds =
      PublishSubject<List<int>>(); // == like StreamController in BLoC

  Stream<List<int>> get topIds => _topIds.stream;

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  dispose() {
    _topIds.close();
  }
}
