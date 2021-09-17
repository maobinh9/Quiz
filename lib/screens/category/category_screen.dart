import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  QuestionController categoryController = Get.put(QuestionController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: Text(
            'Select Category',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildCardCategory(size, "assets/images/calender.png", 'Cuộc sống',
                () {
              categoryController.category.value = 'Cuộc sống';
              Get.to(() => QuizScreen());
            }),
            _buildCardCategory(size, "assets/images/category1.png", 'Nhân lực',
                () {
              categoryController.category.value = 'Nhân lực';
              Get.to(() => QuizScreen());
            }),
            _buildCardCategory(size, "assets/images/category2.png", 'Thế giới',
                () {
              categoryController.category.value = 'Thế giới';
              Get.to(() => QuizScreen());
            }),
            _buildCardCategory(size, "assets/images/category3.png", 'Văn hóa',
                () {
              categoryController.category.value = 'Văn hóa';
              Get.to(() => QuizScreen());
            }),
            _buildCardCategory(size, "assets/images/calender.png", 'Cuộc sống',
                () {
              categoryController.category.value = 'Cuộc sống';
              Get.to(() => QuizScreen());
            }),
            _buildCardCategory(size, "assets/images/category1.png", 'Nhân lực',
                () {
              categoryController.category.value = 'Nhân lực';
              Get.to(() => QuizScreen());
            }),
            _buildCardCategory(size, "assets/images/category2.png", 'Thế giới',
                () {
              categoryController.category.value = 'Thế giới';
              Get.to(() => QuizScreen());
            }),
            _buildCardCategory(size, "assets/images/category3.png", 'Văn hóa',
                () {
              categoryController.category.value = 'Văn hóa';
              Get.to(() => QuizScreen());
            }),
          ],
        ));
  }

  Card _buildCardCategory(
      Size size, String url, String categoryText, Function press) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: InkWell(
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Image.asset(url, width: size.width * 0.3),
              Text(
                categoryText,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
