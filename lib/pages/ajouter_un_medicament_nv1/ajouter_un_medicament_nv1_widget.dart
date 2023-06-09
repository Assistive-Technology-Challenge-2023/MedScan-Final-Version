import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ajouter_un_medicament_nv1_model.dart';
export 'ajouter_un_medicament_nv1_model.dart';

import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';
import 'package:scandit_flutter_datacapture_parser/scandit_flutter_datacapture_parser.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import '/backend/sqflite_files/database_service.dart';

class AjouterUnMedicamentNv1Widget extends StatefulWidget {
  const AjouterUnMedicamentNv1Widget({Key? key}) : super(key: key);

  @override
  _AjouterUnMedicamentNv1WidgetState createState() =>
      _AjouterUnMedicamentNv1WidgetState();
}

class _AjouterUnMedicamentNv1WidgetState
    extends State<AjouterUnMedicamentNv1Widget> {
  late AjouterUnMedicamentNv1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AjouterUnMedicamentNv1Model());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                leading: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                        //context.pushNamed('HomePage');
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'icpmqxuu' /* Retour */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    'vxbvs6gm' /* Scan en cours, poser la caméra... */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: BarcodeScannerScreen(),
              )
          ),
        )
    );
  }
}


const String licenseKey = 'AbSTbKCBNORSIJKYgj8ilucp58OkdNWChWUblDNl22a/bQtvR1B2I75lDnkbXsBQLjfmQ9tLEJPISAkSakBk/ItXR4yLTiyyJAgFRDFSv628fgSSwl2IksZKGcsZNGNyljR2QxYZ9nGHEmTzTB98WcoMp/o3rXFWmsO7Y37/OC3MYuJ5zUAtIsHiwIOio+n/XXO31huAC8K+HhfOunGCyVESkU2h0ktYKS8MeQHqL/c4S+24QUFdZpoH9KjhtUIIeI8lBL1Ia0Ka7OjtPC10tueCIf8pU87bok+Qfax71ZLECjw3C6cFIFZCxtSyIaKbjEp3Bf8TFqFyGpIbNaNklvRQueKIRI6pTKiPE8FtXtJId2dlSFbaOxNr93pYmFryQ0VqhiqA18s3n1HGwLQLv5DT0aJSCmrKeZpHPdouuIuprJPC1WfSOVILkeWFgi2pF6D9fcSuDajRsD0LJTsqZsO1n1cTvZ38q+GUzf+LWm+4hbet0ygeNaMR/uNt+4h6zGMtHnvHbvTsyFCgMhj078LMpYS2ol1a5r8A0660NMwYnJT4k5mIhDYow5zrlqE639QQRzYWgJrs7rMBNxpb45wAFZhT5uJaGSsvzciSCfmUERB8MydhX19jG/mmIlluESem7Dx0JFQZpZHZ59NdWNrmYMCKNgp+KMc5bwEVtXgWTvpzfuyNPVC+cIxPJUCJL9xvTpweL7D39kwR4zOjNIhxh/yOoGMnrqaAg5259rblxVuuFZc8SrUDNGiTc5vUAFudl+NKNTKC6AoysJrNIduxtQezq0T7W4kyMV5F8eebELFsG5Rs3JKoWLS+LnKQ';
//const String licenseKey = 'AWwTtgN3IMAdMB2rTjx1G7kuOZrV6AUhGWJLcGpuwXwBbIUydSMndq9L0qHTSBBWvgeeHxpkivCifHxtlHUlhltUzjHHXpAb9SM0js1PE7KOLTYjRVRv+4dQCHmoX8KqrgPeyj4knj24Nxmt7BBsuJWSIojywfKQwhpMKp92bugYH4++EGA4/ER8UR8o3icNAiMonT4xDmKAn8k+VJ+ZuYQnlqJbQm8InmTKeV/rS03sKMwAZ25RwS/wPbzby5jJthrwQCvtUfcWF4CS5WwQhvUb+aUh1jBN+O2FztVpbBxrfGfybfpkzK1mgPG3UgZDss6/OkL8Te7l/ti8UrAUrSWst1qmWbraoXr/KJAKP5WUd1Kui08I2FN7+ky/H/SVVMHdgPOnYC300Ek/8h329q3RAecQZjyfLobstBH3foNyXD9B6ttXgydSXFhMj+e8Q+AhcWQGHQWdkJS/N3cUKyBogiSsTUwjJYUApFLCK/Y1O2LfO4+QDsxTBotOg6yC+HQdR5CIe0DrIc+E/vGG9GtovKtCnIer1fsTnDz+0liABeXBTpId134JQaL9q+N7DK031Igj1D/m5kHi3iuRnf82i4b02cXRsA9ZoHEsh+XL4n7yT6btsRzJECRpQPHZ1HvWsObAGaF809atV4aAfTAJXXw6o1rut7ahZy71Cv7o+G7jX6FJ/Efc8x7Mr8tryPmbzgXjTye1iMjYA3QrrnKwEBKng6+coZtq+sN/1NA2Eylnd3E2QSPUWCevXhUeZq1IamQ5fIhWeiigwsyKZGBL3y9ebHoUUp1E7lRn8Md/D8HubX3ljSBmIKNQrGwa';




class BarcodeScannerScreen extends StatefulWidget {
  // Create data capture context using license key.

  @override
  State<StatefulWidget> createState() => _BarcodeScannerScreenState(DataCaptureContext.forLicenseKey(licenseKey));
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen>
    with WidgetsBindingObserver
    implements BarcodeCaptureListener {
  final DataCaptureContext _context;

  // Use the world-facing (back) camera.
  Camera? _camera = Camera.defaultCamera ;
  late BarcodeCapture _barcodeCapture;
  late DataCaptureView _captureView;
  CameraSettings settings = CameraSettings(VideoResolution.auto, 1.0, FocusRange.near, FocusGestureStrategy.none, 1.0, shouldPreferSmoothAutoFocus: true);
  final parser = GS1BarcodeParser.defaultParser();



  bool _isPermissionMessageVisible = false;

  _BarcodeScannerScreenState(this._context);

  void _checkPermission() {
    Permission.camera.request().isGranted.then((value) => setState(() {
      _isPermissionMessageVisible = !value;
      if (value) {
        _camera?.switchToDesiredState(FrameSourceState.on);
      }
    }));
  }

  @override
  void initState() {
    super.initState();
    _ambiguate(WidgetsBinding.instance)?.addObserver(this);
    _camera?.applySettings(settings);
    _camera?.desiredTorchState = TorchState.on;


    // Switch camera on to start streaming frames and enable the barcode tracking mode.
    // The camera is started asynchronously and will take some time to completely turn on.
    _checkPermission();

    // The barcode capture process is configured through barcode capture settings
    // which are then applied to the barcode capture instance that manages barcode capture.
    var captureSettings = BarcodeCaptureSettings();

    // The settings instance initially has all types of barcodes (symbologies) disabled. For the purpose of this
    // sample we enable a very generous set of symbologies.  ensure that you only enable the
    // symbologies that your app requires as every additional enabled symbology has an impact on processing times.
    captureSettings.enableSymbologies({
      Symbology.dataMatrix,
      Symbology.code128,
      Symbology.ean13Upca,
    });


    // Some linear/1d barcode symbologies allow to encode variable-length data. By default, the Scandit
    // Data Capture SDK only scans barcodes in a certain length range.
    captureSettings.settingsForSymbology(Symbology.code39).activeSymbolCounts =
        [for (var i = 7; i <= 20; i++) i].toSet();

    // Create new barcode capture mode with the settings from above.
    _barcodeCapture = BarcodeCapture.forContext(_context, captureSettings)
    // Register self as a listener to get informed whenever a new barcode got recognized.
      ..addListener(this);

    // To visualize the on-going barcode capturing process on screen, setup a data capture view that renders the
    // camera preview. The view must be connected to the data capture context.
    _captureView = DataCaptureView.forContext(_context);
    //_captureView.scanAreaMargins = MarginsWithUnit(DoubleWithUnit(0, MeasureUnit.dip), DoubleWithUnit(0, MeasureUnit.dip),
    //    DoubleWithUnit(0, MeasureUnit.dip), DoubleWithUnit(200, MeasureUnit.dip));



    // Add a barcode capture overlay to the data capture view to render the location of captured barcodes on top of
    // the video preview. This is optional, but recommended for better visual feedback.
    var overlay = BarcodeCaptureOverlay.withBarcodeCaptureForViewWithStyle(
        _barcodeCapture, _captureView, BarcodeCaptureOverlayStyle.frame);
    //..viewfinder = RectangularViewfinder.withStyleAndLineStyle(
    //    RectangularViewfinderStyle.square, RectangularViewfinderLineStyle.light);

    // Adjust the overlay's barcode highlighting to match the new viewfinder styles and improve the visibility of feedback.
    // With 6.10 we will introduce this visual treatment as a new style for the overlay.
    overlay.brush = Brush(Color.fromARGB(0, 0, 0, 0), Color.fromARGB(
        255, 47, 62, 158), 3);
    overlay.shouldShowScanAreaGuides = true;



    _captureView.addOverlay(overlay);

    // Set the default camera as the frame source of the context. The camera is off by
    // default and must be turned on to start streaming frames to the data capture context for recognition.
    if (_camera != null) {
      _context.setFrameSource(_camera!);
    }

    if (_camera != null) {
      _context.setFrameSource(_camera!);
    } else {
      print('No camera found on the device.');
      return;
    }

    //_camera?.switchToDesiredState(FrameSourceState.on);
    _barcodeCapture.isEnabled = true;
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (_isPermissionMessageVisible) {
      child = Text('No permission to access the camera!',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black));
    } else {
      child = _captureView;
    }
    return WillPopScope(
        child: Stack(
          children: <Widget>[
            Center(child: child),
          ],
        ),
        onWillPop: () {
          dispose();
          return Future.value(true);
        });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermission();
    } else if (state == AppLifecycleState.paused) {
      _camera?.switchToDesiredState(FrameSourceState.off);
    }
  }



  @override
  void didScan(BarcodeCapture barcodeCapture, BarcodeCaptureSession session) async {
    _barcodeCapture.isEnabled = false;

    var barcodes = session.newlyRecognizedBarcodes;
    var bcode = barcodes.firstWhere((code) => code.symbology == Symbology.dataMatrix || code.symbology == Symbology.code128, orElse: () => barcodes.first);
    var data = (bcode.data == null || bcode.data?.isEmpty == true) ? bcode.rawData : bcode.data;


    var result;
    var gtin;
    var date;
    var ind;
    var name;


    //var humanReadableSymbology = SymbologyDescription.forSymbology(code1.symbology);
    if (bcode.symbology == Symbology.ean13Upca) {
      gtin = data;
      date = null;
    } else {
      //var data = (code.data == null || code.data?.isEmpty == true) ? code.rawData : code.data;
      try {
        result = parser.parse(data.toString());

      } catch (e) {
        gtin = null;
        date = null;
        print(e);
      }

      try {
        gtin = result
            .getAIParsedElement('01')
            .data;
      }catch(e){
        gtin = null;
      }

      try {
        date = result.getAIParsedElement('17').data.toString();
      } catch(e) {
        date = null;
      }

    }

    try {
      name = await Provider.of<DatabaseService>(context, listen: false).getDrugName(gtin);
      ind = await Provider.of<DatabaseService>(context, listen: false).getInd(gtin, FFLocalizations.of(context).getText('fh973hg8'));

      Map<String, dynamic> params = {"gtin": gtin};
      context.pushNamed('AjouterUnMedicamentNv2', queryParams: {
        'gtin': serializeParam(
          gtin,
          ParamType.int,),
        'dateExpiration': serializeParam(date, ParamType.String,),
        'name' : serializeParam(name, ParamType.String),
        'ind' : serializeParam(ind, ParamType.int)
      }.withoutNulls);

      _camera?.switchToDesiredState(FrameSourceState.off);

    } catch(e){
      print(e);
      print(gtin);
      print(name);
      print(ind);
      print(e);
      //'dlg8sngo'
      await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text(
              FFLocalizations.of(context).getText('dlg8sngo'),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            actions: [
              Semantics(
                  label: FFLocalizations.of(context).getText('dlg8sngo'),
                  child: TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      })
              )
            ],
          ));
      _barcodeCapture.isEnabled = true;
    }

  }

  @override
  void didUpdateSession(BarcodeCapture barcodeCapture, BarcodeCaptureSession session) {}

  @override
  void dispose() {
    _ambiguate(WidgetsBinding.instance)?.removeObserver(this);
    _barcodeCapture.removeListener(this);
    _barcodeCapture.isEnabled = false;
    _camera?.switchToDesiredState(FrameSourceState.off);
    _context.removeAllModes();
    super.dispose();
  }

  T? _ambiguate<T>(T? value) => value;
}