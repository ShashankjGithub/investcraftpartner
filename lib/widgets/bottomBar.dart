import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investcraftpartner/providers/teamProvider.dart';
import 'package:investcraftpartner/screens/leadsScreens/leadProvider.dart';
import 'package:investcraftpartner/widgets/tabNavigator.dart';

import 'package:provider/provider.dart';

import '../config/themeConfig.dart';
import '../generated/assets.dart';
import '../providers/leadDataProvider.dart';
import '../providers/myQrProvider.dart';



class BottomBarScreen extends StatefulWidget {
  final int? screenid;
  const BottomBarScreen({super.key, this.screenid});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int cIndex = 0;
  GlobalKey<NavigatorState> navigatorKeyy = GlobalKey();

  String currentPage = "Page1";
  List<String> pageKeys = ["Page1", "Page2", "Page3", "Page4"];
  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),

  };


  void selectTab(String tabItem, int index) {
    if (tabItem == currentPage) {
      navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      changeIndex(index);
    }
  }



  changeIndex(index){
   setState(() {
     currentPage = pageKeys[index];
     cIndex = index;
   });
  }

  @override
  void initState() {
    if(widget.screenid!=null&&widget.screenid==2){
      changeIndex(1);
    }
    getLead();

    super.initState();
  }


  getLead(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LeadProvider>().getLead(context);
      context.read<TeamProvider>().getTeamMembers(context);
      context.read<LeadDataProvider>().getLeadData(context);
      context.read<MyQrProvider>().getQrData(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await navigatorKeys[currentPage]!.currentState!
            .maybePop();
        if (isFirstRouteInCurrentTab) {
          if (currentPage != "Page1") {
            selectTab("Page1", 1);
            return false;
          }
        }

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              padding: EdgeInsets.only(top: 8, left: 8, right: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 0,
                showUnselectedLabels: true,
                unselectedItemColor: Colors.grey,
                currentIndex: cIndex,
                selectedFontSize: 11.sp,
                unselectedFontSize: 11.sp,
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 12,
                ),
                selectedItemColor: mainColor,
                selectedIconTheme: IconThemeData(color: mainColor),
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Container(
                        height: 22.h,
                        width: 18.w,
                        child: SvgPicture.asset(Assets.bottomActiveHome)),
                    icon: Container(
                        height: 22.h,
                        width: 18.w,
                        child: SvgPicture.asset(Assets.bottomInactivehome)),
                    label: ('Home'),
                  ),
                  BottomNavigationBarItem(
                      activeIcon: Container(
                          height: 22.h,
                          width: 18.w,
                          child:
                          SvgPicture.asset(Assets.bottomActiveproduct)),
                      icon: Container(
                          height: 22.h,
                          width: 18.w,
                          child: SvgPicture.asset(
                              Assets.bottomInactiveproduct)),
                      label: ('Leads')),
                  BottomNavigationBarItem(
                      activeIcon: Container(
                          height: 22.h,
                          width: 18.w,
                          child:
                          SvgPicture.asset(Assets.bottomActiveprofile)),
                      icon: Container(
                          height: 22.h,
                          width: 18.w,
                          child: SvgPicture.asset(
                              Assets.bottomInactiveprofile)),
                      label: ('Teams')),
                  BottomNavigationBarItem(
                      activeIcon: Container(
                          height: 22.h,
                          width: 18.w,
                          child: SvgPicture.asset(Assets.bottomActiveMore)),
                      icon: Container(
                          height: 22.h,
                          width: 18.w,
                          child:
                          SvgPicture.asset(Assets.bottomInActiveMore)),
                      label: ('More')),
                ],
                onTap: (int index) {
                  selectTab(pageKeys[index], index);
                },
              ),
            ),
          ),
          body: Stack(
            children: [
              _buildOffstageNavigator("Page1"),
              _buildOffstageNavigator("Page2"),
              _buildOffstageNavigator("Page3"),
              _buildOffstageNavigator("Page4"),

            ],
          )),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
