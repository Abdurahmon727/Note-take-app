import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

import 'assets/colors.dart';
import 'assets/theme.dart';
import 'core/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'core/data/service_locator.dart';
import 'core/models/popup_types.dart';
import 'core/widgets/popups.dart';
import 'features/home/presentaion/bloc/calendar_bloc.dart';
import 'features/home/presentaion/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalendarBloc()..add(const CalendarEvent.init()),
        ),
        BlocProvider(
          create: (context) => ShowPopUpBloc(),
        ),
      ],
      child: Builder(builder: (context) {
        return BlocListener<ShowPopUpBloc, ShowPopUpState>(
          listener: (context, state) {
            if (state.showPopUp && state.popUpType == PopUpType.error) {
              showSimpleNotification(
                WPopUp(color: red, text: state.errorText),
                elevation: 0,
                background: Colors.transparent,
                autoDismiss: true,
                slideDismissDirection: DismissDirection.horizontal,
              );
            } else if (state.showPopUp &&
                state.popUpType == PopUpType.warning) {
              showSimpleNotification(
                WPopUp(
                  color: orange,
                  text: state.warningText,
                ),
                elevation: 0,
                background: Colors.transparent,
                autoDismiss: true,
                slideDismissDirection: DismissDirection.horizontal,
              );
            } else if (state.showPopUp &&
                state.popUpType == PopUpType.success) {
              showSimpleNotification(
                WPopUp(
                  color: green,
                  text: state.successText,
                ),
                elevation: 0,
                background: Colors.transparent,
                autoDismiss: true,
                slideDismissDirection: DismissDirection.horizontal,
              );
            }
          },
          child: OverlaySupport.global(
            child: MaterialApp(
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              themeMode: ThemeMode.dark,
              home: const HomePage(),
            ),
          ),
        );
      }),
    );
  }
}
