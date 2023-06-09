import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ajouter_une_prescription_nv2_model.dart';
export 'ajouter_une_prescription_nv2_model.dart';

class AjouterUnePrescriptionNv2Widget extends StatefulWidget {
  const AjouterUnePrescriptionNv2Widget({
    Key? key,
    this.ind,
  }) : super(key: key);

  final int? ind;

  @override
  _AjouterUnePrescriptionNv2WidgetState createState() =>
      _AjouterUnePrescriptionNv2WidgetState();
}

class _AjouterUnePrescriptionNv2WidgetState
    extends State<AjouterUnePrescriptionNv2Widget> {
  late AjouterUnePrescriptionNv2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AjouterUnePrescriptionNv2Model());
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

    return StreamBuilder<List<MesMedicamentsRecord>>(
      stream: queryMesMedicamentsRecord(
        queryBuilder: (mesMedicamentsRecord) =>
            mesMedicamentsRecord.where('ind', isEqualTo: widget.ind),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<MesMedicamentsRecord>
            ajouterUnePrescriptionNv2MesMedicamentsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final ajouterUnePrescriptionNv2MesMedicamentsRecord =
            ajouterUnePrescriptionNv2MesMedicamentsRecordList.isNotEmpty
                ? ajouterUnePrescriptionNv2MesMedicamentsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    custom_widgets.SoundRecordAndPlay(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
