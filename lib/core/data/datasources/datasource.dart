abstract class DataSource<T> {

  Future<T> insert(T newEntry);
  Future<List<T>> queryAllRows();
  Future<T> update(T newEntry);
  Future<int> delete(T newEntry);

}