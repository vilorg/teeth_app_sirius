import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/models/text_title.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<bool> visible = [true, true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: kDeffaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextTitle(title: "Квесты"),
          SizedBox(height: kDeffaultPadding * 2),
          TaskBlock(
            path: "assets/images/quest1.png",
            title: "Почистить зубы мануальной щеткой",
            opacity: visible[0],
            setVisible: () => setState(() => visible[0] = !visible[0]),
          ),
          TaskBlock(
            path: "assets/images/quest2.png",
            title: "Почистить зубы монопучком",
            opacity: visible[1],
            setVisible: () => setState(() => visible[1] = !visible[1]),
          ),
          TaskBlock(
            path: "assets/images/quest3.png",
            title: "Использовать зубную нить",
            opacity: visible[2],
            setVisible: () => setState(() => visible[2] = !visible[2]),
          ),
          TaskBlock(
            path: "assets/images/quest1.png",
            title: "Почистить зубы мануальной щеткой",
            opacity: visible[3],
            setVisible: () => setState(() => visible[3] = !visible[3]),
          ),
          TaskBlock(
            path: "assets/images/quest2.png",
            title: "Почистить зубы монопучком",
            opacity: visible[4],
            setVisible: () => setState(() => visible[4] = !visible[4]),
          ),
          TaskBlock(
            path: "assets/images/quest3.png",
            title: "Использовать зубную нить",
            opacity: visible[5],
            setVisible: () => setState(() => visible[5] = !visible[5]),
          ),
        ],
      ),
    );
  }
}

class TaskBlock extends StatelessWidget {
  final String title;
  final String path;
  final bool opacity;
  final VoidCallback setVisible;

  const TaskBlock({
    Key? key,
    required this.title,
    required this.path,
    required this.opacity,
    required this.setVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity ? 1 : 0.5,
      child: InkWell(
        onTap: setVisible,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0.5 * kDeffaultPadding),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black26,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(kDeffaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(path),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
