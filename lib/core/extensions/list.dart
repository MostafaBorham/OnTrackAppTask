extension ListExt on List<Object> {
  updateItem({required Object oldItem, required Object newItem}) {
    var index = indexOf(oldItem);
    this[index] = newItem;
  }
}
