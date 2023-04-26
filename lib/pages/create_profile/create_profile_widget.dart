import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'create_profile_model.dart';
export 'create_profile_model.dart';

class CreateProfileWidget extends StatefulWidget {
  const CreateProfileWidget({Key? key}) : super(key: key);

  @override
  _CreateProfileWidgetState createState() => _CreateProfileWidgetState();
}

class _CreateProfileWidgetState extends State<CreateProfileWidget> {
  late CreateProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createProfile'});
    _model.iDCodeController ??= TextEditingController(
        text: formatNumber(
      random_data.randomInteger(0, 1000),
      formatType: FormatType.custom,
      format: '2023',
      locale: 'en_US',
    ));
    _model.yourNameController ??= TextEditingController();
    _model.cityController ??= TextEditingController();
    _model.phoneController ??= TextEditingController();
    _model.myBioController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'createProfile',
        color: FlutterFlowTheme.of(context).primary,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          drawer: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.sideBarNavModel,
              updateCallback: () => setState(() {}),
              updateOnChange: true,
              child: SideBarNavWidget(
                oneBG: Color(0xFF080404),
                oneIcon: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                ),
                twoBG: Color(0xFF080404),
                twoIcon: Icon(
                  Icons.home,
                ),
                threeColor: Color(0xFF080404),
                threeIcon: Icon(
                  Icons.settings,
                  color: Color(0xFF080404),
                ),
              ),
            ),
          ),
          appBar: responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'yl9m3gmp' /* Create Profile */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                )
              : null,
          body: SafeArea(
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 570.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 44.0, 16.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'zisu25qa' /* Create Profile */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CREATE_PROFILE_PAGE_imageBorder_ON_TAP');
                                  logFirebaseEvent(
                                      'imageBorder_upload_media_to_firebase');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    imageQuality: 80,
                                    allowPhoto: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    pickerFontFamily: 'Outfit',
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];
                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl =
                                            downloadUrls.first;
                                      });
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      setState(() {});
                                      showUploadMessage(
                                          context, 'Failed to upload data');
                                      return;
                                    }
                                  }
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 2.0, 2.0, 2.0),
                                    child: Container(
                                      width: 90.0,
                                      height: 90.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: valueOrDefault<String>(
                                          _model.uploadedFileUrl,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/workout-web-app-manager-m1j9am/assets/v2bacnnrcrpc/addAvatarImage@2x.png',
                                        ),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 16.0),
                          child: TextFormField(
                            controller: _model.iDCodeController,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '0v1rog9s' /* Badge ID */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            validator: _model.iDCodeControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.iDCodeMask],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 16.0),
                          child: TextFormField(
                            controller: _model.yourNameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '89r0708n' /* Your Name */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.yourNameControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 16.0),
                          child: TextFormField(
                            controller: _model.cityController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'd7gtbt79' /* Your City */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.cityControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 12.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.stateValueController ??=
                                FormFieldController<String>(
                              _model.stateValue ??=
                                  FFLocalizations.of(context).getText(
                                'zmi2dngp' /* State */,
                              ),
                            ),
                            options: [
                              FFLocalizations.of(context).getText(
                                'g7o2gi3w' /* State */,
                              ),
                              FFLocalizations.of(context).getText(
                                '3rpryy9h' /* Alabama */,
                              ),
                              FFLocalizations.of(context).getText(
                                '18th1p9h' /* Alaska */,
                              ),
                              FFLocalizations.of(context).getText(
                                'p388sq0h' /* Arizona */,
                              ),
                              FFLocalizations.of(context).getText(
                                'fqc0ymrs' /* Arkansas */,
                              ),
                              FFLocalizations.of(context).getText(
                                'db7zotlp' /* California */,
                              ),
                              FFLocalizations.of(context).getText(
                                'h2m9iwk3' /* Colorado */,
                              ),
                              FFLocalizations.of(context).getText(
                                'tb8wz98i' /* Connecticut */,
                              ),
                              FFLocalizations.of(context).getText(
                                'ajsujlgm' /* Delaware */,
                              ),
                              FFLocalizations.of(context).getText(
                                'p3gn8iz2' /* Florida */,
                              ),
                              FFLocalizations.of(context).getText(
                                'a7f9zmkx' /* Georgia */,
                              ),
                              FFLocalizations.of(context).getText(
                                'dvm7ztyv' /* Hawaii */,
                              ),
                              FFLocalizations.of(context).getText(
                                'wu9h62ub' /* Idaho */,
                              ),
                              FFLocalizations.of(context).getText(
                                'eouyvt1v' /* Illinoi */,
                              ),
                              FFLocalizations.of(context).getText(
                                'hlyj5n3p' /* Indiana */,
                              ),
                              FFLocalizations.of(context).getText(
                                'n1t3vfwk' /* Iowa */,
                              ),
                              FFLocalizations.of(context).getText(
                                'f1q1509x' /* Kansas */,
                              ),
                              FFLocalizations.of(context).getText(
                                'useh5ek8' /* Kentucky */,
                              ),
                              FFLocalizations.of(context).getText(
                                '00zrldq0' /* Louisiana */,
                              ),
                              FFLocalizations.of(context).getText(
                                '2u1pct30' /* Maine */,
                              ),
                              FFLocalizations.of(context).getText(
                                'q7kkpxrt' /* Maryland */,
                              ),
                              FFLocalizations.of(context).getText(
                                '1qw2re4k' /* Massachusetts */,
                              ),
                              FFLocalizations.of(context).getText(
                                '209nstj5' /* Michigan */,
                              ),
                              FFLocalizations.of(context).getText(
                                '07xqf6pp' /* Minnesota */,
                              ),
                              FFLocalizations.of(context).getText(
                                'mh163h21' /* Mississippi */,
                              ),
                              FFLocalizations.of(context).getText(
                                '7ut85zd3' /* Missouri */,
                              ),
                              FFLocalizations.of(context).getText(
                                'nz4lt5iy' /* Monta */,
                              ),
                              FFLocalizations.of(context).getText(
                                '1on7thhn' /* Nebraska */,
                              ),
                              FFLocalizations.of(context).getText(
                                'rc4klke7' /* Nevada */,
                              ),
                              FFLocalizations.of(context).getText(
                                'fqgl4nyi' /* New Hampshire */,
                              ),
                              FFLocalizations.of(context).getText(
                                '15gyjt1b' /* New Jersey */,
                              ),
                              FFLocalizations.of(context).getText(
                                'qhlirymf' /* New Mexico */,
                              ),
                              FFLocalizations.of(context).getText(
                                'gemt7170' /* New York */,
                              ),
                              FFLocalizations.of(context).getText(
                                'b82h0wuz' /* North Carolina */,
                              ),
                              FFLocalizations.of(context).getText(
                                'lzn3k0zc' /* North Dak */,
                              ),
                              FFLocalizations.of(context).getText(
                                '4li44ghs' /* Ohio */,
                              ),
                              FFLocalizations.of(context).getText(
                                'era7iun9' /* Oklahoma */,
                              ),
                              FFLocalizations.of(context).getText(
                                '43offinb' /* Oregon */,
                              ),
                              FFLocalizations.of(context).getText(
                                '80c6di5x' /* Pennsylvani */,
                              ),
                              FFLocalizations.of(context).getText(
                                'acjd3tng' /* Rhode Island */,
                              ),
                              FFLocalizations.of(context).getText(
                                'hfs6yd6r' /* South Caroli */,
                              ),
                              FFLocalizations.of(context).getText(
                                'm13c391s' /* South Dakota */,
                              ),
                              FFLocalizations.of(context).getText(
                                'hbo9gxwj' /* Tennessee */,
                              ),
                              FFLocalizations.of(context).getText(
                                'i3w71slk' /* Texas */,
                              ),
                              FFLocalizations.of(context).getText(
                                '0qf55u5e' /* Utah */,
                              ),
                              FFLocalizations.of(context).getText(
                                'nx5rjwhf' /* Vermont */,
                              ),
                              FFLocalizations.of(context).getText(
                                'fkcme2yb' /* Virginia */,
                              ),
                              FFLocalizations.of(context).getText(
                                's74yqr1g' /* Washingto */,
                              ),
                              FFLocalizations.of(context).getText(
                                'dop72cwb' /* West Virginia */,
                              ),
                              FFLocalizations.of(context).getText(
                                't9033pkf' /* Wisconsin */,
                              ),
                              FFLocalizations.of(context).getText(
                                'yffpcshz' /* Wyoming */,
                              )
                            ],
                            onChanged: (val) =>
                                setState(() => _model.stateValue = val),
                            width: double.infinity,
                            height: 56.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: FFLocalizations.of(context).getText(
                              '5tuc6o8d' /* Select State */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 15.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderWidth: 2.0,
                            borderRadius: 50.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                20.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 16.0),
                          child: TextFormField(
                            controller: _model.phoneController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '6jaqhs2x' /* Phone Number */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.phone,
                            validator: _model.phoneControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.phoneMask],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 12.0),
                          child: TextFormField(
                            controller: _model.myBioController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                              hintText: FFLocalizations.of(context).getText(
                                'nr420u9k' /* Your bio */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            validator: _model.myBioControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.05),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CREATE_PROFILE_SAVE_CHANGES_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');
                                await PostregisterCall.call();
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'Profile2',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.topToBottom,
                                      duration: Duration(milliseconds: 3200),
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '6bh0g5ud' /* Save Changes */,
                              ),
                              options: FFButtonOptions(
                                width: 270.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
