import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class NewRequestModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Signature widget.
  late SignatureController signatureController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    signatureController = SignatureController(
      penStrokeWidth: 2.0,
      penColor: Colors.black,
      exportBackgroundColor: Color(0xFF01070A),
    );
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  void dispose() {
    signatureController.dispose();
    sideBarNavModel.dispose();
  }

  /// Additional helper methods are added here.

}
