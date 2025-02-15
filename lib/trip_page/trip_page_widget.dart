import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../documents/documents_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../item_list/item_list_widget.dart';
import '../profile/profile_widget.dart';
import '../start_page/start_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TripPageWidget extends StatefulWidget {
  TripPageWidget({Key key, this.tripRecord}) : super(key: key);

  final TriprecordRecord tripRecord;

  @override
  _TripPageWidgetState createState() => _TripPageWidgetState();
}

class _TripPageWidgetState extends State<TripPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF191938),
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: FlutterFlowTheme.secondaryColor,
          ),
        ),
        title: Text(
          widget.tripRecord.tripname,
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pop(context);
              await widget.tripRecord.reference.delete();
            },
            icon: Icon(
              Icons.delete_outlined,
              color: FlutterFlowTheme.secondaryColor,
              size: 30,
            ),
            iconSize: 30,
          )
        ],
        centerTitle: true,
        elevation: 25,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      drawer: Drawer(
        elevation: 100,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.primaryColor,
          ),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(currentUserReference),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final columnUsersRecord = snapshot.data;
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Divider(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.25,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        columnUsersRecord.photoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Divider(),
                    StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(currentUserReference),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final textUsersRecord = snapshot.data;
                        return Text(
                          columnUsersRecord.displayName,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                        );
                      },
                    ),
                    Text(
                      'Droot user',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.tertiaryColor,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                      color: Color(0x5C9E9E9E),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Home',
                            icon: Icon(
                              Icons.home,
                              color: FlutterFlowTheme.tertiaryColor,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                          Divider(),
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileWidget(),
                                ),
                              );
                            },
                            text: 'Profile',
                            icon: Icon(
                              Icons.person,
                              color: FlutterFlowTheme.tertiaryColor,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                          Divider(),
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Settings',
                            icon: Icon(
                              Icons.settings,
                              color: FlutterFlowTheme.tertiaryColor,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color(0x5C9E9E9E),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await signOut();
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StartPageWidget(),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Sign Out',
                            icon: Icon(
                              Icons.logout,
                              color: FlutterFlowTheme.tertiaryColor,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            PageTrip(widget: widget),
            ItemListWidget(),
            DocumentsWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: FlutterFlowTheme.appBarColor,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              inactiveColor: FlutterFlowTheme.tertiaryColor,
              activeColor: FlutterFlowTheme.secondaryColor,
              title: Text(
                'Overview',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.trip_origin)),
          BottomNavyBarItem(
              inactiveColor: FlutterFlowTheme.tertiaryColor,
              activeColor: FlutterFlowTheme.secondaryColor,
              title: Text(
                'Item List',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.list)),
          BottomNavyBarItem(
              inactiveColor: FlutterFlowTheme.tertiaryColor,
              activeColor: FlutterFlowTheme.secondaryColor,
              title: Text(
                'Documents',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.pages)),
        ],
      ),
    );
  }
}

class PageTrip extends StatelessWidget {
  const PageTrip({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final TripPageWidget widget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<dynamic>(
                future: unsplashCall(
                  query: widget.tripRecord.destination,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final cardUnsplashResponse = snapshot.data;
                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFF5F5F5),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment(-0.09999999999999998, 0.95),
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Builder(
                                builder: (context) {
                                  final searchResults = (getJsonField(
                                              cardUnsplashResponse,
                                              r'$.results') ??
                                          [])
                                      .take(1)
                                      .toList();
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(searchResults.length,
                                            (searchResultsIndex) {
                                      final searchResultsItem =
                                          searchResults[searchResultsIndex];
                                      return FutureBuilder<dynamic>(
                                        future: unsplashCall(
                                          query: widget.tripRecord.destination,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                          final imageUnsplashResponse =
                                              snapshot.data;
                                          return CachedNetworkImage(
                                            imageUrl: getJsonField(
                                                searchResultsItem,
                                                r'$.urls.full'),
                                            width: double.infinity,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      );
                                    }),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Overview',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 0),
                                          child: Text(
                                            'Origin:',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 8, 0, 0),
                                          child: Text(
                                            widget.tripRecord.origin,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 8, 0, 0),
                                          child: Text(
                                            'Destination:',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 8, 0, 0),
                                          child: Text(
                                            widget.tripRecord.destination,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 0),
                                          child: Text(
                                            'Start Date:',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 8, 0, 0),
                                          child: Text(
                                            DateFormat.yMMMd().format(widget
                                                .tripRecord.startdate
                                                .toDate()),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 0),
                                          child: Text(
                                            'End Date:',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 8, 0, 0),
                                          child: Text(
                                            DateFormat.yMMMd().format(widget
                                                .tripRecord.enddate
                                                .toDate()),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              Divider(),
              Text(
                'Weather ☁',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.title2.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.tertiaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 1, 15, 25),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Temperature(in °C):',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                FutureBuilder<dynamic>(
                                  future: weatherAPICall(
                                    q: widget.tripRecord.destination,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    final textWeatherAPIResponse =
                                        snapshot.data;
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Text(
                                        getJsonField(textWeatherAPIResponse,
                                                r'$.current.temp_c')
                                            .toString(),
                                        style:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Weather:',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                FutureBuilder<dynamic>(
                                  future: weatherAPICall(
                                    q: widget.tripRecord.destination,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    final textWeatherAPIResponse =
                                        snapshot.data;
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(5, 1, 0, 0),
                                      child: AutoSizeText(
                                        getJsonField(textWeatherAPIResponse,
                                                r'$.current.condition.text')
                                            .toString(),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                FutureBuilder<dynamic>(
                                  future: weatherAPICall(
                                    q: widget.tripRecord.destination,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    final imageWeatherAPIResponse =
                                        snapshot.data;
                                    var urlStart = "https:";
                                    var imageUrl = getJsonField(
                                        imageWeatherAPIResponse,
                                        r'$.current.condition.icon');
                                    var imagePath = urlStart + imageUrl;
                                    return CachedNetworkImage(
                                      imageUrl: imagePath,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
