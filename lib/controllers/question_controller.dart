import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

// We use get package for our state management

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  AnimationController _animationController;
  Animation _animation;
  RxString category = "".obs;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = [
    Question(
        id: 1,
        question: "Tôi là ai 1 ",
        category: "Cuộc sống",
        options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
        answer: 1),
    Question(
        id: 1,
        question: "Tôi là ai 2 ",
        category: "Cuộc sống",
        options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
        answer: 1),
    Question(
        id: 1,
        question: "Tôi là ai 3",
        category: "Cuộc sống",
        options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
        answer: 1),
    Question(
        id: 1,
        question: "Tôi là ai 4",
        category: "Cuộc sống",
        options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
        answer: 1),
    Question(
        id: 1,
        question: "Tôi là ai 5",
        category: "Nhân lực",
        options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
        answer: 1),
    Question(
        id: 1,
        question: "Tôi là ai 6",
        category: "Nhân lực",
        options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
        answer: 1),
    Question(
        id: 1,
        question: "Tôi là ai 7",
        category: "Nhân lực",
        options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
        answer: 1),
    Question(
        id: 1,
        question: "Tôi là ai 8",
        category: "Nhân lực",
        options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
        answer: 1),
    Question(
        id: 1,
        question: "Tôi là ai 9",
        category: "Nhân lực",
        options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
        answer: 1),
  ];
  List<Question> get questions => this.getQuestionByCategory();

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  List<Question> getQuestionByCategory() {
    return _questions
        .where((element) => element.category.contains(category))
        .toList();
  }

  void nextQuestion() {
    if (_questionNumber.value < getQuestionByCategory().length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
