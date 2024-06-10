import 'package:flutter/material.dart';
import 'package:tryber/pages/cellphone_confirmation_page.dart';
import 'package:tryber/pages/farm_page.dart';
import 'package:tryber/pages/login_page.dart';
import 'package:tryber/pages/mail_confirmation_page.dart';
import 'package:tryber/pages/principal_page.dart';
import 'package:tryber/pages/recovey_page.dart';
import 'package:tryber/pages/register_animal.dart';
import 'package:tryber/pages/register_farm.dart';
import 'package:tryber/pages/register_picket.dart';
import 'package:tryber/pages/register_trough.dart';

class PageControllerWidget extends StatefulWidget {
  const PageControllerWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PageControllerWidgetState();
  }
}

class _PageControllerWidgetState extends State<PageControllerWidget> {
  static const int initialPage = 2;
  final PageController _pageController =
      PageController(initialPage: initialPage);
  int _currentPage = initialPage;
  bool _allowScroll = true;
  double _pointerX = 0.0;

  // Define the pages and the allowed transitions between them
  final Map<int, List<int>> _allowedTransitions = {
    0: [1], // LoginPage can go to FarmPage
    1: [], // FarmPage can go to LoginPage, RegisterFarm, and RecoveyPage
    2: [1], // RegisterFarm can go back to FarmPage
    3: [1], // RecoveyPage can go back to FarmPage
    4: [], // RegisterAnimal cannot navigate anywhere (example)
    5: [], // RegisterPicket cannot navigate anywhere (example)
    6: [], // RegisterTrough cannot navigate anywhere (example)
    7: [], // PrincipalPage cannot navigate anywhere (example)
    8: [], // MailConfirmationPage cannot navigate anywhere (example)
    9: [], // CellphoneConfirmationPage cannot navigate anywhere (example)
  };

  bool _isEmptyTransition(int fromPage, int toPage) {
    final List<int>? transitions = _allowedTransitions[fromPage];
    return transitions == null ||
        transitions.isEmpty ||
        !transitions.contains(toPage);
  }

  void _onPageChanged(int page) {
    if (_allowedTransitions[_currentPage]?.contains(page) ?? false) {
      setState(() {
        _currentPage = page;
        _allowScroll = !_isEmptyTransition(_currentPage, page);
      });
    } else {
      // Revert to the current page if the transition is not allowed
      _pageController.jumpToPage(_currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerMove: (PointerMoveEvent event) {
          _pointerX = event.position.dx; // Atualiza a posição do ponteiro
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics: _allowScroll
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          children: const [
            LoginPage(), //0
            FarmPage(), //1
            RegisterFarm(), //2
            RecoveyPage(), //3
            RegisterAnimal(), //4
            RegisterPicket(), //5
            RegisterTrough(), //6
            PrincipalPage(), //7
            MailConfirmationPage(), //8
            CellphoneConfirmationPage(), //9
          ],
        ),
      ),
    );
  }
}
