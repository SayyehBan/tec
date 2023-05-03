import 'package:flutter/material.dart';

const int homeIndex = 0;
const int writerIndex = 0;
const int profileIndex = 0;

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = homeIndex;
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _writerKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();
  final List<int> _history = [];
  late final map = {
    homeIndex:_homeKey,
    writerIndex:_writerKey,
    profileIndex:_profileKey

  };
  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: child, onWillPop: _onWillPop)
  }
}
