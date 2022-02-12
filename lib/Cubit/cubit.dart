// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game/Cubit/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  bool isHover1 = false;
  bool isHover2 = false;

  void changeHover(int h, bool state) {
    if (h == 1) {
      isHover1 = state;
    } else {
      isHover2 = state;
    }
    emit(ChangeHoverState());
  }

  bool switchControul = false;

  void switchChange() {
    switchControul = !switchControul;
    emit(SwitchChangeState());
  }

  double size = 0;

  bool enableButton = true;

  bool horizontalLine1 = false;
  bool horizontalLine2 = false;
  bool horizontalLine3 = false;

  bool verticalLine1 = false;
  bool verticalLine2 = false;
  bool verticalLine3 = false;

  bool zLine1 = false;
  bool zLine2 = false;

  String winPlayer = "";
  bool player = true;
  String p1 = "";
  String p2 = "";
  String p3 = "";
  String p4 = "";
  String p5 = "";
  String p6 = "";
  String p7 = "";
  String p8 = "";
  String p9 = "";

  List player1 = [];
  List player2 = [];
  List shoices = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];

  void playChange(String p) {
    shoices.remove(p);
    if (p == "1") p1 = player ? "X" : "O";
    if (p == "2") p2 = player ? "X" : "O";
    if (p == "3") p3 = player ? "X" : "O";
    if (p == "4") p4 = player ? "X" : "O";
    if (p == "5") p5 = player ? "X" : "O";
    if (p == "6") p6 = player ? "X" : "O";
    if (p == "7") p7 = player ? "X" : "O";
    if (p == "8") p8 = player ? "X" : "O";
    if (p == "9") p9 = player ? "X" : "O";

    cheackPlay(p);
    player = !player;

    emit(PlayChangeState());
  }

  void cheackPlay(String p) {
    if (p == "2") player ? player1.add("2") : player2.add("2");
    if (p == "1") player ? player1.add("1") : player2.add("1");
    if (p == "3") player ? player1.add("3") : player2.add("3");
    if (p == "4") player ? player1.add("4") : player2.add("4");
    if (p == "5") player ? player1.add("5") : player2.add("5");
    if (p == "6") player ? player1.add("6") : player2.add("6");
    if (p == "7") player ? player1.add("7") : player2.add("7");
    if (p == "8") player ? player1.add("8") : player2.add("8");
    if (p == "9") player ? player1.add("9") : player2.add("9");

    chackWin();
  }

  void chackWin() {
    if (player1.contains("1") &&
        player1.contains("2") &&
        player1.contains("3")) {
      winPlayer = "Win player X";
      horizontalLine1 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player1.contains("4") &&
        player1.contains("5") &&
        player1.contains("6")) {
      winPlayer = "Win player X";
      horizontalLine2 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player1.contains("7") &&
        player1.contains("8") &&
        player1.contains("9")) {
      winPlayer = "Win player X";
      horizontalLine3 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player1.contains("1") &&
        player1.contains("4") &&
        player1.contains("7")) {
      winPlayer = "Win player X";
      verticalLine1 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player1.contains("2") &&
        player1.contains("5") &&
        player1.contains("8")) {
      winPlayer = "Win player X";
      verticalLine2 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player1.contains("3") &&
        player1.contains("6") &&
        player1.contains("9")) {
      winPlayer = "Win player X";
      verticalLine3 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player1.contains("1") &&
        player1.contains("5") &&
        player1.contains("9")) {
      winPlayer = "Win player X";
      zLine1 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player1.contains("3") &&
        player1.contains("5") &&
        player1.contains("7")) {
      winPlayer = "Win player X";
      zLine2 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }

    if (player2.contains("1") &&
        player2.contains("2") &&
        player2.contains("3")) {
      winPlayer = "Win player O";
      horizontalLine1 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player2.contains("4") &&
        player2.contains("5") &&
        player2.contains("6")) {
      winPlayer = "Win player O";
      horizontalLine2 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player2.contains("7") &&
        player2.contains("8") &&
        player2.contains("9")) {
      winPlayer = "Win player O";
      horizontalLine3 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player2.contains("1") &&
        player2.contains("4") &&
        player2.contains("7")) {
      winPlayer = "Win player O";
      verticalLine1 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player2.contains("2") &&
        player2.contains("5") &&
        player2.contains("8")) {
      winPlayer = "Win player O";
      verticalLine2 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player2.contains("3") &&
        player2.contains("6") &&
        player2.contains("9")) {
      winPlayer = "Win player O";
      verticalLine3 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player2.contains("1") &&
        player2.contains("5") &&
        player2.contains("9")) {
      winPlayer = "Win player O";
      zLine1 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }
    if (player2.contains("3") &&
        player2.contains("5") &&
        player2.contains("7")) {
      winPlayer = "Win player O";
      zLine2 = true;
      enableButton = false;
      emit(WinPlayerState());
      return;
    }

    if (player1.length == 5) {
      winPlayer = "Nobody wins try again";
      enableButton = false;
      emit(WinPlayerState());
    }
  }

  void resatGame() {
    p1 = "";
    p2 = "";
    p3 = "";
    p4 = "";
    p5 = "";
    p6 = "";
    p7 = "";
    p8 = "";
    p9 = "";

    player = true;

    player1 = [];
    player2 = [];
    shoices = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];

    winPlayer = "";
    horizontalLine1 = false;
    horizontalLine2 = false;
    horizontalLine3 = false;

    verticalLine1 = false;
    verticalLine2 = false;
    verticalLine3 = false;

    zLine1 = false;
    zLine2 = false;

    enableButton = true;
    emit(ResatGameState());
  }

  void autoPlay() {
    print("HomeCubit.get(context).autoPlay();");
    print("player2: ${player2.length}");
    if (winPlayer != "") {
      return;
    }

    if (player1.length == 1) {
      if (player2.contains("5")) {
        String shoicesPlay = "5";
        playChange(shoicesPlay);
      } else {
        String shoicesPlay = random();
        if (shoicesPlay == "") {
          return;
        }
        print("$shoicesPlay 1");
        shoices.remove(shoicesPlay);
        playChange(shoicesPlay);
      }
    } else {
      String shoicesPlay = shackWinPlay2();
      if (shoicesPlay == "-1") {
        shoicesPlay = shackWinPlay1();
        if (shoicesPlay == "") {
          return;
        }
      }

      print("$shoicesPlay 2");
      shoices.remove(shoicesPlay);
      playChange(shoicesPlay);
    }
  }

  String shackWinPlay2() {
    // V
    if (player2.contains("1") &&
        player2.contains("2") &&
        !player1.contains("3")) {
      return "3";
    }
    if (player2.contains("4") &&
        player2.contains("5") &&
        !player1.contains("6")) {
      return "6";
    }
    if (player2.contains("7") &&
        player2.contains("8") &&
        !player1.contains("9")) {
      return "9";
    }
    if (player2.contains("1") &&
        player2.contains("3") &&
        !player1.contains("2")) {
      return "2";
    }
    if (player2.contains("4") &&
        player2.contains("6") &&
        !player1.contains("5")) {
      return "5";
    }
    if (player2.contains("7") &&
        player2.contains("9") &&
        !player1.contains("8")) {
      return "8";
    }
    // H
    if (player2.contains("1") &&
        player2.contains("4") &&
        !player1.contains("7")) {
      return "7";
    }
    if (player2.contains("2") &&
        player2.contains("5") &&
        !player1.contains("8")) {
      return "8";
    }
    if (player2.contains("3") &&
        player2.contains("6") &&
        !player1.contains("9")) {
      return "9";
    }
    if (player2.contains("1") &&
        player2.contains("7") &&
        !player1.contains("4")) {
      return "4";
    }
    if (player2.contains("2") &&
        player2.contains("8") &&
        !player1.contains("5")) {
      return "5";
    }
    if (player2.contains("3") &&
        player2.contains("9") &&
        !player1.contains("6")) {
      return "6";
    }

    // z
    if (player2.contains("1") &&
        player2.contains("5") &&
        !player1.contains("9")) {
      return "9";
    }
    if (player2.contains("3") &&
        player2.contains("5") &&
        !player1.contains("7")) {
      return "7";
    }
    if (player2.contains("1") &&
        player2.contains("9") &&
        !player1.contains("5")) {
      return "5";
    }
    if (player2.contains("3") &&
        player2.contains("7") &&
        !player1.contains("5")) {
      return "5";
    }

    return "-1";
  }

  String shackWinPlay1() {
    // V
    if (player1.contains("1") &&
        player1.contains("2") &&
        !player2.contains("3")) {
      return "3";
    }
    if (player1.contains("4") &&
        player1.contains("5") &&
        !player2.contains("6")) {
      return "6";
    }
    if (player1.contains("7") &&
        player1.contains("8") &&
        !player2.contains("9")) {
      return "9";
    }
    if (player1.contains("1") &&
        player1.contains("3") &&
        !player2.contains("2")) {
      return "2";
    }
    if (player1.contains("4") &&
        player1.contains("6") &&
        !player2.contains("5")) {
      return "5";
    }
    if (player1.contains("7") &&
        player1.contains("9") &&
        !player2.contains("8")) {
      return "8";
    }
    // H
    if (player1.contains("1") &&
        player1.contains("4") &&
        !player2.contains("7")) {
      return "7";
    }
    if (player1.contains("2") &&
        player1.contains("5") &&
        !player2.contains("8")) {
      return "8";
    }
    if (player1.contains("3") &&
        player1.contains("6") &&
        !player2.contains("9")) {
      return "9";
    }
    if (player1.contains("1") &&
        player1.contains("7") &&
        !player2.contains("4")) {
      return "4";
    }
    if (player1.contains("2") &&
        player1.contains("8") &&
        !player2.contains("5")) {
      return "5";
    }
    if (player1.contains("3") &&
        player1.contains("9") &&
        !player2.contains("6")) {
      return "6";
    }

    // z
    if (player1.contains("1") &&
        player1.contains("5") &&
        !player2.contains("9")) {
      return "9";
    }
    if (player1.contains("3") &&
        player1.contains("5") &&
        !player2.contains("7")) {
      return "7";
    }
    if (player1.contains("1") &&
        player1.contains("9") &&
        !player2.contains("5")) {
      return "5";
    }
    if (player1.contains("3") &&
        player1.contains("7") &&
        !player2.contains("5")) {
      return "5";
    }

    // random
    String shoicesPlay = random();
    if (shoicesPlay == "") {
      return "";
    }
    print("$shoicesPlay 1");
    shoices.remove(shoicesPlay);

    return shoicesPlay;
  }

  String random() {
    if (shoices.isEmpty) {
      return "";
    }
    Random random = Random();
    int index = random.nextInt(shoices.length);
    String p = shoices[index];
    return p;
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
