import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'supprimer_un_medicament_nv1_model.dart';
export 'supprimer_un_medicament_nv1_model.dart';

class SupprimerUnMedicamentNv1Widget extends StatefulWidget {
  const SupprimerUnMedicamentNv1Widget({Key? key}) : super(key: key);

  @override
  _SupprimerUnMedicamentNv1WidgetState createState() =>
      _SupprimerUnMedicamentNv1WidgetState();
}

class _SupprimerUnMedicamentNv1WidgetState
    extends State<SupprimerUnMedicamentNv1Widget> {
  late SupprimerUnMedicamentNv1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupprimerUnMedicamentNv1Model());
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
          title: Text(
            FFLocalizations.of(context).getText(
              'f6n9hmqo' /* Scan en cours, poser la caméra... */,
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
          child: StreamBuilder<List<MesMedicamentsRecord>>(
            stream: queryMesMedicamentsRecord(
              queryBuilder: (mesMedicamentsRecord) =>
                  mesMedicamentsRecord.orderBy('dateScan', descending: true),
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
              List<MesMedicamentsRecord> listViewMesMedicamentsRecordList =
                  snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewMesMedicamentsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewMesMedicamentsRecord =
                      listViewMesMedicamentsRecordList[listViewIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'SupprimerUnMedicamentNv2',
                        queryParams: {
                          'ind': serializeParam(
                            listViewMesMedicamentsRecord.ind,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: ListTile(
                      title: Text(
                        listViewMesMedicamentsRecord.nom,
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                      subtitle: Text(
                        listViewMesMedicamentsRecord.dateExp,
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20.0,
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: false,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
