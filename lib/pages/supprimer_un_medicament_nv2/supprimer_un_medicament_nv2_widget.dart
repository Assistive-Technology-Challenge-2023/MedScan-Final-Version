import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'supprimer_un_medicament_nv2_model.dart';
export 'supprimer_un_medicament_nv2_model.dart';

class SupprimerUnMedicamentNv2Widget extends StatefulWidget {
  const SupprimerUnMedicamentNv2Widget({
    Key? key,
    required this.ind,
  }) : super(key: key);

  final int? ind;

  @override
  _SupprimerUnMedicamentNv2WidgetState createState() =>
      _SupprimerUnMedicamentNv2WidgetState();
}

class _SupprimerUnMedicamentNv2WidgetState
    extends State<SupprimerUnMedicamentNv2Widget> {
  late SupprimerUnMedicamentNv2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupprimerUnMedicamentNv2Model());
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
        supprimerUnMedicamentNv2MesMedicamentsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final supprimerUnMedicamentNv2MesMedicamentsRecord =
        supprimerUnMedicamentNv2MesMedicamentsRecordList.isNotEmpty
            ? supprimerUnMedicamentNv2MesMedicamentsRecordList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getVariableText(
                  frText:
                  'Voulez-vous supprimer le médicament ?${supprimerUnMedicamentNv2MesMedicamentsRecord!.nom}',
                  itText:
                  'Vuoi eliminare il farmaco?${supprimerUnMedicamentNv2MesMedicamentsRecord!.nom}',
                  deText:
                  'Möchten Sie das Medikament löschen?${supprimerUnMedicamentNv2MesMedicamentsRecord!.nom}',
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
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          60.0, 60.0, 60.0, 60.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await supprimerUnMedicamentNv2MesMedicamentsRecord!
                              .reference
                              .delete();

                          context.goNamed('HomePage');
                        },
                        text: FFLocalizations.of(context).getText(
                          'ur1355r6' /* Oui */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                          ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          60.0, 60.0, 60.0, 60.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: FFLocalizations.of(context).getText(
                          'vgvg6itz' /* Non */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                          ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
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