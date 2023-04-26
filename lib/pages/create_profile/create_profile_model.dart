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

class CreateProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for IDCode widget.
  TextEditingController? iDCodeController;
  final iDCodeMask = MaskTextInputFormatter(mask: '#######');
  String? Function(BuildContext, String?)? iDCodeControllerValidator;
  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for city widget.
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateValueController;
  // State field(s) for Phone widget.
  TextEditingController? phoneController;
  final phoneMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for myBio widget.
  TextEditingController? myBioController;
  String? Function(BuildContext, String?)? myBioControllerValidator;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    iDCodeController?.dispose();
    yourNameController?.dispose();
    cityController?.dispose();
    phoneController?.dispose();
    myBioController?.dispose();
    sideBarNavModel.dispose();
  }

  /// Additional helper methods are added here.

}
