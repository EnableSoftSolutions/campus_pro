import 'package:campus_pro/src/UTILS/appImages.dart';

class CategoryDummyModel {
  String? image;
  String? title;

  CategoryDummyModel({this.image, this.title});
}

List<CategoryDummyModel> categoryList = [
  CategoryDummyModel(
    image: AppImages.logo,
    title: "Fee Payment",
  ),
  CategoryDummyModel(
    image: AppImages.logo,
    title: "Attendence",
  ),
  CategoryDummyModel(
    image: AppImages.logo,
    title: "Notifications",
  ),
  CategoryDummyModel(
    image: AppImages.logo,
    title: "Classrooms",
  ),
  CategoryDummyModel(
    image: AppImages.logo,
    title: "Online Test",
  ),
  CategoryDummyModel(
    image: AppImages.logo,
    title: "Homework",
  ),
];
