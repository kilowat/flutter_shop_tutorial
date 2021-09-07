import 'package:equatable/equatable.dart';
import 'package:flippy/features/domain/entities/category_entity.dart';

abstract class CategoryState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryEmptyState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<CategoryEntity> categories;

  CategoryLoadedState(this.categories);
  @override
  // TODO: implement props
  List<Object?> get props => [categories];
}

class CategoryErrorState extends CategoryState {
  final String message;

  CategoryErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
