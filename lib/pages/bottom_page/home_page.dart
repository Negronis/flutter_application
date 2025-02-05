import 'package:flutter/material.dart';

class CreateLinearBox extends StatelessWidget {
  final double? width;
  final double? height;
  final List<Color> colors;
  final Widget child;
  final double? borderRadius;
  final bool? isShadow;
  const CreateLinearBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.isShadow,
    required this.colors,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
        boxShadow: isShadow == false
            ? []
            : [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 1), // changes position of shadow
                )
              ],
        gradient: LinearGradient(
          stops: [0, 1],
          colors: [colors[0], colors[1]],
          begin: Alignment(0.5, 1),
          end: Alignment(-0.7071, -1),
        ),
      ),
      child: child,
    );
  }
}

class HomeContentPage extends StatefulWidget {
  const HomeContentPage({super.key});

  @override
  State<HomeContentPage> createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: ListView(
          children: [
            Column(
              children: [
                TopCom(),
                CenterCom(),
                // BottomCom(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopCom extends StatefulWidget {
  const TopCom({super.key});

  @override
  State<TopCom> createState() => _TopComState();
}

class _TopComState extends State<TopCom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CreateLinearBox(
        height: 200,
        colors: [Color(0xffa1c4fd), Color(0xfffbc2eb)],
        borderRadius: 30,
        child: Text(''),
      ),
    );
  }
}

class CenterCom extends StatefulWidget {
  const CenterCom({super.key});

  @override
  State<CenterCom> createState() => _CenterComState();
}

class _CenterComState extends State<CenterCom> {
  @override
  Widget build(BuildContext context) {
    // double childHeight = MediaQuery.of(context).size.width / 3;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Wrap(
        runSpacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: CreateLinearBox(
                  isShadow: false,
                  borderRadius: 15,
                  height: 100,
                  colors: [Color(0xffffffff), Color(0xffffffff)],
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(150, 254, 96, 253),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: Colors.black12,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Picture",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "The pictrues",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: CreateLinearBox(
                  isShadow: false,
                  borderRadius: 15,
                  height: 100,
                  colors: [Color(0xffffffff), Color(0xffffffff)],
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(150, 246, 190, 122),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: Colors.black12,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.video_collection,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Video",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "The Videos",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: CreateLinearBox(
                  isShadow: false,
                  borderRadius: 15,
                  height: 100,
                  colors: [Color(0xffffffff), Color(0xffffffff)],
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(150, 99, 217, 249),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: Colors.black12,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.file_copy_sharp,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("My File",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "The My Files",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: CreateLinearBox(
                  isShadow: false,
                  borderRadius: 15,
                  height: 100,
                  colors: [Color(0xffffffff), Color(0xffffffff)],
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(150, 61, 240, 217),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: Colors.black12,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.app_registration_sharp,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Apps",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "The Apps",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomCom extends StatefulWidget {
  const BottomCom({super.key});

  @override
  State<BottomCom> createState() => _BottomComState();
}

class _BottomComState extends State<BottomCom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CreateLinearBox(
        height: 300,
        colors: [Color(0xffa1c4fd), Color(0xfffbc2eb)],
        child: Text(''),
      ),
    );
  }
}
