class Pagination {
  int? start;
  int? limit;

  @override
  String toString() => 'Pagination(start: $start, limit: $limit)';

  @override
  bool operator ==(Object ob) {
    if (identical(this, ob)) return true;
    return ob is Pagination && ob.start == start && ob.limit == limit;
  }

  @override
  int get hashCode => start.hashCode ^ limit.hashCode;
}
