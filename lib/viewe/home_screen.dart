import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game/Cubit/cubit.dart';
import 'package:tic_tac_game/Cubit/state.dart';
import 'package:tic_tac_game/viewe/play_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightS = MediaQuery.of(context).size.height;
    double widthS = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff000619),
      appBar: AppBar(
        elevation: 0.0,
        // toolbarHeight: 50.0,
        backgroundColor: const Color(0xff000619),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Color(0xff000619),

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: BlocProvider(
        create: (_) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (ctx, state) {},
          builder: (ctx, state) => SafeArea(
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  height: 300,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: MouseRegion(
                          onHover: (event) {
                            HomeCubit.get(ctx).changeHover(1, true);
                          },
                          onExit: (event) {
                            HomeCubit.get(ctx).changeHover(1, false);
                          },
                          child: MaterialButton(
                            splashColor: Colors.grey,
                            hoverElevation: heightS * 0.3,
                            // color: Colors.redAccent,
                            onPressed: () {
                              Navigator.push(
                                ctx,
                                MaterialPageRoute(
                                    builder: (ctx) => const PlayScreen(true)),
                              );
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Hero(
                                    tag: "autoPlay",
                                    child: Container(
                                      height: heightS * 0.2,
                                      width: double.maxFinite,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/image/autoPlay.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      "One Play",
                                      style: TextStyle(
                                          color: HomeCubit.get(ctx).isHover1
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.5),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: widthS * 0.10),
                      Expanded(
                          child: MouseRegion(
                              onHover: (event) {
                                HomeCubit.get(ctx).changeHover(2, true);
                              },
                              onExit: (event) {
                                HomeCubit.get(ctx).changeHover(2, false);
                              },
                              child: MaterialButton(
                                splashColor: Colors.grey,
                                hoverElevation: heightS * 0.3,
                                onPressed: () {
                                  Navigator.push(
                                    ctx,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            const PlayScreen(false)),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Hero(
                                        tag: "2Player",
                                        child: Container(
                                          height: heightS * 0.2,
                                          width: double.maxFinite,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/image/2Player.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "Towe Play",
                                          style: TextStyle(
                                              color: HomeCubit.get(ctx).isHover2
                                                  ? Colors.white
                                                  : Colors.white
                                                      .withOpacity(0.5),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
