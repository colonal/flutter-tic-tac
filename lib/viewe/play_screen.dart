import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game/Cubit/cubit.dart';
import 'package:tic_tac_game/Cubit/state.dart';

import 'line_widget.dart';

class PlayScreen extends StatelessWidget {
  final bool isAutoplay;
  const PlayScreen(this.isAutoplay, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthS = MediaQuery.of(context).size.width;
    double heightS = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          // toolbarHeight: 50.0,
          backgroundColor: const Color(0xff000619),
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Color(0xff000619),

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.dark, // For iOS (dark icons)
          ),
          actions: [
            isAutoplay
                ? const Hero(
                    tag: "autoPlay",
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Image(image: AssetImage("assets/image/autoPlay.png")),
                    ),
                  )
                : const Hero(
                    tag: "2Player",
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Image(image: AssetImage("assets/image/2Player.png")),
                    ),
                  )
          ],
        ),
        body: BlocProvider(
          create: (context) => HomeCubit(),
          child: BlocConsumer<HomeCubit, HomeState>(
              listener: (ctx, state) {},
              builder: (context, state) {
                AnimationController controller = AnimationController(
                  duration: const Duration(milliseconds: 3000),
                  vsync: Scaffold.of(context),
                );
                controller.forward(from: 0.6);

                if (widthS < 210 || heightS < 280) {
                  return Container(
                    color: const Color(0xff000619),
                    child: const Center(
                      child: Text(
                        "Inappropriate screen size",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
                return Container(
                  width: widthS,
                  color: const Color(0xff000619),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: heightS < 450 ? 0 : 20),
                      LayoutBuilder(builder: (context, size) {
                        return Text(
                          'IT\'S TURN! ${HomeCubit.get(context).player ? " X" : "O"}',
                          style: TextStyle(
                              fontSize: size.maxWidth > heightS
                                  ? heightS * 0.1
                                  : size.maxWidth * 0.1,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        );
                      }),
                      SizedBox(height: heightS < 450 ? 0 : 40),
                      Stack(children: [
                        if (1 == 1)
                          SizedBox(
                            width: widthS,
                            height: heightS * 0.5,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: newButton(
                                            alignment: Alignment.topLeft,
                                            function:
                                                HomeCubit.get(context).p1 == ""
                                                    ? () {
                                                        HomeCubit.get(context)
                                                            .playChange("1");
                                                        if (isAutoplay) {
                                                          HomeCubit.get(context)
                                                              .autoPlay();
                                                        }
                                                      }
                                                    : null,
                                            value: HomeCubit.get(context).p1,
                                            context: context,
                                          ),
                                        ),
                                        Expanded(flex: 1, child: Container()),
                                        Expanded(
                                          flex: 3,
                                          child: newButton(
                                            alignment: Alignment.topCenter,
                                            function:
                                                HomeCubit.get(context).p2 == ""
                                                    ? () {
                                                        HomeCubit.get(context)
                                                            .playChange("2");
                                                        if (isAutoplay) {
                                                          HomeCubit.get(context)
                                                              .autoPlay();
                                                        }
                                                      }
                                                    : null,
                                            value: HomeCubit.get(context).p2,
                                            context: context,
                                          ),
                                        ),
                                        Expanded(flex: 1, child: Container()),
                                        Expanded(
                                          flex: 3,
                                          child: newButton(
                                            alignment: Alignment.topRight,
                                            function:
                                                HomeCubit.get(context).p3 == ""
                                                    ? () {
                                                        HomeCubit.get(context)
                                                            .playChange("3");

                                                        if (isAutoplay) {
                                                          HomeCubit.get(context)
                                                              .autoPlay();
                                                        }
                                                      }
                                                    : null,
                                            value: HomeCubit.get(context).p3,
                                            context: context,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: newButton(
                                            alignment: Alignment.centerLeft,
                                            function:
                                                HomeCubit.get(context).p4 == ""
                                                    ? () {
                                                        HomeCubit.get(context)
                                                            .playChange("4");
                                                        if (isAutoplay) {
                                                          HomeCubit.get(context)
                                                              .autoPlay();
                                                        }
                                                      }
                                                    : null,
                                            value: HomeCubit.get(context).p4,
                                            context: context,
                                          ),
                                        ),
                                        Expanded(flex: 1, child: Container()),
                                        Expanded(
                                          flex: 3,
                                          child: newButton(
                                            alignment: Alignment.center,
                                            function:
                                                HomeCubit.get(context).p5 == ""
                                                    ? () {
                                                        HomeCubit.get(context)
                                                            .playChange("5");
                                                        if (isAutoplay) {
                                                          HomeCubit.get(context)
                                                              .autoPlay();
                                                        }
                                                      }
                                                    : null,
                                            value: HomeCubit.get(context).p5,
                                            context: context,
                                          ),
                                        ),
                                        Expanded(flex: 1, child: Container()),
                                        Expanded(
                                          flex: 3,
                                          child: newButton(
                                            alignment: Alignment.centerRight,
                                            function:
                                                HomeCubit.get(context).p6 == ""
                                                    ? () {
                                                        HomeCubit.get(context)
                                                            .playChange("6");
                                                        if (isAutoplay) {
                                                          HomeCubit.get(context)
                                                              .autoPlay();
                                                        }
                                                      }
                                                    : null,
                                            value: HomeCubit.get(context).p6,
                                            context: context,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: newButton(
                                              alignment: Alignment.bottomLeft,
                                              function: HomeCubit.get(context)
                                                          .p7 ==
                                                      ""
                                                  ? () {
                                                      HomeCubit.get(context)
                                                          .playChange("7");

                                                      if (isAutoplay) {
                                                        HomeCubit.get(context)
                                                            .autoPlay();
                                                      }
                                                    }
                                                  : null,
                                              value: HomeCubit.get(context).p7,
                                              context: context,
                                            )),
                                        Expanded(flex: 1, child: Container()),
                                        Expanded(
                                          flex: 3,
                                          child: newButton(
                                            alignment: Alignment.bottomCenter,
                                            function:
                                                HomeCubit.get(context).p8 == ""
                                                    ? () {
                                                        HomeCubit.get(context)
                                                            .playChange("8");

                                                        if (isAutoplay) {
                                                          HomeCubit.get(context)
                                                              .autoPlay();
                                                        }
                                                      }
                                                    : null,
                                            value: HomeCubit.get(context).p8,
                                            context: context,
                                          ),
                                        ),
                                        Expanded(flex: 1, child: Container()),
                                        Expanded(
                                          flex: 3,
                                          child: newButton(
                                            alignment: Alignment.bottomRight,
                                            function:
                                                HomeCubit.get(context).p9 == ""
                                                    ? () {
                                                        HomeCubit.get(context)
                                                            .playChange("9");

                                                        if (isAutoplay) {
                                                          HomeCubit.get(context)
                                                              .autoPlay();
                                                        }
                                                      }
                                                    : null,
                                            value: HomeCubit.get(context).p9,
                                            context: context,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        SizedBox(
                          width: widthS,
                          height: heightS * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: (HomeCubit.get(context)
                                                .verticalLine1)
                                            ? line(
                                                2, heightS, Alignment.topLeft)
                                            : Container()),
                                    Expanded(flex: 1, child: Container()),
                                    Expanded(
                                        flex: 3,
                                        child: (HomeCubit.get(context)
                                                .verticalLine2)
                                            ? line(2, heightS, Alignment.center)
                                            : Container()),
                                    Expanded(flex: 1, child: Container()),
                                    Expanded(
                                        flex: 3,
                                        child: (HomeCubit.get(context)
                                                .verticalLine3)
                                            ? line(
                                                2, heightS, Alignment.topRight)
                                            : Container()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          width: widthS,
                          height: heightS * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (HomeCubit.get(context).horizontalLine1)
                                Line(1, widthS - 15),
                              const SizedBox(height: 15),
                              if (HomeCubit.get(context).horizontalLine2)
                                Line(1, widthS - 30),
                              const SizedBox(height: 15),
                              if (HomeCubit.get(context).horizontalLine3)
                                Line(1, widthS - 30),
                            ],
                          ),
                        ),
                        if (HomeCubit.get(context).zLine1)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Container(
                                width: widthS,
                                height: heightS * 0.50,
                                padding: const EdgeInsets.all(40),
                                child: const Line(0, 0.0)),
                          ),
                        if (HomeCubit.get(context).zLine2)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(40),
                              height: heightS * 0.50,
                              child: const Line(0, 0.0, isZ2: true),
                            ),
                          )
                      ]),
                      Expanded(
                          child: Center(
                        child: Text(
                          HomeCubit.get(context).winPlayer,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      )),
                      Row(
                        children: [
                          Expanded(
                            child: LayoutBuilder(builder: (context, size) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        heightS > 500 ? size.maxWidth * 0.1 : 0,
                                    vertical: heightS > 500 ? 10 : 0),
                                child: MaterialButton(
                                  onPressed: HomeCubit.get(context).resatGame,
                                  color: const Color(0xff001355),
                                  height: heightS * 0.1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    "Repeat The Game",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.maxWidth > heightS
                                            ? heightS * 0.06
                                            : size.maxWidth * 0.06),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 15),
                    ],
                  ),
                );
              }),
        ));
  }

  Widget line(int state, double heightS, AlignmentGeometry alignment) {
    return LayoutBuilder(builder: (context, size) {
      return Container(
        alignment: alignment,
        child: Container(
          width: HomeCubit.get(context).size,
          decoration: const BoxDecoration(),
          clipBehavior: Clip.hardEdge,
          child: Line(state, heightS * 0.5 - 30),
        ),
      );
    });
  }

  Widget newButton({
    required void Function()? function,
    required String value,
    required BuildContext context,
    required AlignmentGeometry alignment,
  }) {
    return LayoutBuilder(builder: (context, size) {
      HomeCubit.get(context).size =
          size.maxWidth < size.maxHeight ? size.maxWidth : size.maxHeight;

      return Align(
        alignment: alignment,
        child: Container(
          height:
              size.maxWidth < size.maxHeight ? size.maxWidth : size.maxHeight,
          width:
              size.maxWidth < size.maxHeight ? size.maxWidth : size.maxHeight,
          decoration: const BoxDecoration(),
          clipBehavior: Clip.hardEdge,
          child: MaterialButton(
            onPressed: HomeCubit.get(context).enableButton ? function : null,
            color: const Color(0xff001355),
            disabledColor: const Color(0xff001355),
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size.maxHeight * 0.15)),
            child: Text(
              value,
              style: TextStyle(
                  fontSize: size.maxWidth < size.maxHeight
                      ? size.maxWidth * 0.5
                      : size.maxHeight * 0.5,
                  color: const Color(0xff056cc7)),
            ),
          ),
        ),
      );
    });
  }
}
