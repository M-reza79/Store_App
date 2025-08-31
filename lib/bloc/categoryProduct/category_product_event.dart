abstract class CategoryProductEvent {}

class CategoryInitializeProductEvent
    extends CategoryProductEvent {
  String categoryId;
  CategoryInitializeProductEvent(this.categoryId);
}
