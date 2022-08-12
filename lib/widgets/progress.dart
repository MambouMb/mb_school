import 'package:flutter/material.dart';
import 'package:mb_school/config/config.dart';

class PForm extends StatefulWidget{
  late final List<Widget> pages;
  late final List<PTitle> title;
  PFormController? controller;
  final Color activeColor = Config.colors.gbColor,
      disableColor = Config.colors.tirthTextColor;
  late double height;

  PForm({
    required this.pages,
    required this.title,
    this.controller,
    this.height = 250,
  });
  @override
  _PFormState createState() => _PFormState();
}

class _PFormState extends State<PForm> with TickerProviderStateMixin{
  late List<AnimationController> _controllers;
  late List<Animation<double>> _annimations;
  late List<Animation<double>> _annimationsOpacity;
  late List<bool> activeColor;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
        widget.pages.length,
            (index) => AnimationController(
              vsync: this, duration: const Duration(milliseconds: 200),
                lowerBound: .1));
    _annimations = _controllers.map((controller) =>
        Tween<double> (begin: .05, end: 1).animate(controller))
        .toList();
    _annimationsOpacity = _controllers.map((controller) =>
        Tween<double> (begin: 0, end: 1).animate(controller))
        .toList();
    activeColor = List.generate(widget.pages.length, (index) => false);


    if(widget.controller != null){
      widget.controller?.addListener(() {
        controlColor(widget.controller?.currentPage);
      });
    }
  }

  controlColor(int index){
    for (var i = 0; i < activeColor.length; i++){
      if(index == i){
        if(!_controllers[i].isCompleted) {
          _controllers[index].animateTo(1);
        }
      } else {
        if(_controllers[i].isCompleted) {
          _controllers[i].reverse();
        }
      }
    }
    for (var i = 0; i <= index; i++){
      activeColor[i] = true;
    }
    for (var i = index+1; i< activeColor.length; i++){
      activeColor[i] = false;
    }
    setState(() {});
  }

  @override
  void dispose(){
    super.dispose();
    for (var c in _controllers) {
      c.dispose();
    }
  }
  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.pages.map((e) {
          int index = widget.pages.indexOf(e);
          return Stack(
            children: [
              if (index != widget.pages.length -1)
                Container(
                  margin: const EdgeInsets.only(left: 2, top: 37),
                  child: SizeTransition(
                    sizeFactor: _annimations[index],
                    child: Container(
                      margin: const EdgeInsets.only(left: 13,right: 20),
                      width: 3,
                      height: widget.height,
                      color: activeColor[index+1]? Config.colors.gbColor
                          : Colors.grey,
                    ),
                  ),
                ),
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controlColor(index);
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(10),
                            color: activeColor[index]
                                ? widget.activeColor
                                : widget.disableColor.withOpacity(.9),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      widget.title[index].copyWith(
                        activeColor: activeColor[index]
                            ? widget.activeColor
                            : Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          child: FadeTransition(
                            opacity: _annimationsOpacity[index],
                            child: SizeTransition(sizeFactor: _annimations[index],
                            child: e)))
                    ],
                  )
                ],
              ),

            ],
          );
        }).toList(),
      ),
    );
  }
}

class PTitle extends StatelessWidget{
  late String title;
  late String? subtitle;
  late Color? activeColor;

  PTitle({this.activeColor, this.subtitle, required this.title});
  @override
  Widget build(BuildContext context){
    if(activeColor == null) activeColor == Colors.black;
    return Column(
      children: [
        Text(title, style: TextStyle(
          fontSize: 15, fontWeight:
        FontWeight.bold,
          color: activeColor,
          fontFamily: "roboto_bold"
        )),
        if(subtitle != null) Text(subtitle!),
      ],
    );
  }
  copyWith({String? title, String? subtitle, Color? activeColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title??this.title, style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold,
          color: activeColor??this.activeColor,
            fontFamily: "roboto_bold"
        )),
        Text(subtitle??this.subtitle??"",
          style: TextStyle(color: Config.colors.tirthTextColor,
              fontFamily: "roboto_bold"),),
      ],
    );
  }
}



class PFormController extends ChangeNotifier {
  PFormController(this.lenght);
  int _page = -1;
  late final int lenght;

  nextPage(){
    if(_page < lenght -1 ) _page++;

      notifyListeners();
  }
  get currentPage => _page;
  set jumpToPage(int p){
    _page = p;
    notifyListeners();
  }

  prevPage(){
    if(_page > 0) _page--;
    notifyListeners();
  }
}