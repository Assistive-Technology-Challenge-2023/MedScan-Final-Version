import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ajouter_un_medicament_nv2_model.dart';
export 'ajouter_un_medicament_nv2_model.dart';

class AjouterUnMedicamentNv2Widget extends StatefulWidget {
  const AjouterUnMedicamentNv2Widget({
    Key? key,
    this.dateExpiration,
    this.scannedDate,
    this.name,
    required this.gtin,
    this.ind,
  }) : super(key: key);

  final String? dateExpiration;
  final DateTime? scannedDate;
  final String? name;
  final int? gtin;
  final int? ind;

  @override
  _AjouterUnMedicamentNv2WidgetState createState() =>
      _AjouterUnMedicamentNv2WidgetState();
}

class _AjouterUnMedicamentNv2WidgetState
    extends State<AjouterUnMedicamentNv2Widget> {
  late AjouterUnMedicamentNv2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AjouterUnMedicamentNv2Model());
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
        ajouterUnMedicamentNv2MesMedicamentsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        print(widget.dateExpiration);
        final ajouterUnMedicamentNv2MesMedicamentsRecord =
        ajouterUnMedicamentNv2MesMedicamentsRecordList.isNotEmpty
            ? ajouterUnMedicamentNv2MesMedicamentsRecordList.first
            : null;
        print("Performed successfull query");
        print(ajouterUnMedicamentNv2MesMedicamentsRecord.toString());
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
                title: Text(
                  FFLocalizations.of(context).getVariableText(
                    frText:
                    'Médicament détecté: ${widget.name}.  La date d\'expiration est ${widget.dateExpiration == null || widget.dateExpiration == '' ? ' indisponible.' : functions.translateDate(widget.dateExpiration!, FFAppState().language)}. ${ajouterUnMedicamentNv2MesMedicamentsRecord != null && ajouterUnMedicamentNv2MesMedicamentsRecord!.reference != null ? FFLocalizations.of(context).getText('je3oy924' /* Ce médicament est déjà présent... */,) : ''}. Souhaitez-vous enregistrer le médicament dans votre historique ?'
                    ,
                    itText:
                    'Droga rilevata: ${widget.name}.  La data di scadenza è${widget.dateExpiration == null || widget.dateExpiration == '' ? 'non disponibile. ' : functions.translateDate(widget.dateExpiration!, FFAppState().language)}. ${ajouterUnMedicamentNv2MesMedicamentsRecord != null && ajouterUnMedicamentNv2MesMedicamentsRecord!.reference != null ? FFLocalizations.of(context).getText('je3oy924' /* Ce médicament est déjà présent... */,) : ''}. Vuoi salvarlo nella cronologia ?',
                    deText:
                    'Medikament erkannt: ${widget.name}.  Das Ablaufdatum ist${widget.dateExpiration == null || widget.dateExpiration == '' ? 'nicht verfügbar. ' : functions.translateDate(widget.dateExpiration!, FFAppState().language)}. ${ajouterUnMedicamentNv2MesMedicamentsRecord != null && ajouterUnMedicamentNv2MesMedicamentsRecord!.reference != null ? FFLocalizations.of(context).getText('je3oy924' /* Ce médicament est déjà présent... */,) : ''}. Möchten Sie es in Ihrem Verlauf speichern?',
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                actions: [],
                centerTitle: false,
                toolbarHeight: 200.0,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Semantics(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'je3oy924' /* Ce médicament est déjà présent... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),

                    /*Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Text(
                        FFLocalizations.of(context).getVariableText(
                          frText: 'Médicament détecté: ${widget.name}',
                          itText: 'Droga rilevata: ${widget.name}',
                          deText: 'Medikament entdeckt: ${widget.name}',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    if (widget.dateExpiration != null &&
                        widget.dateExpiration != '')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Text(
                          FFLocalizations.of(context).getVariableText(
                            frText:
                            'Date d\'expiration: ${functions.translateDate(widget.dateExpiration!, FFAppState().language)}',
                            itText:
                            '${'Data di scadenza:${functions.translateDate(widget.dateExpiration!, FFAppState().language)}'}',
                            deText:
                            'Verfallsdatum:${functions.translateDate(widget.dateExpiration!, FFAppState().language)}',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),*/

                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final mesMedicamentsCreateData =
                            createMesMedicamentsRecordData(
                              ind: widget.ind,
                              gtin: widget.gtin,
                              lang: FFAppState().language,
                              nom: valueOrDefault<String>(
                                widget.name,
                                '0',
                              ),
                              dateExp: widget.dateExpiration==null ? null : functions.translateDate(widget.dateExpiration!,
                                  FFAppState().language),
                              dateScan: getCurrentTimestamp,
                            );
                            await MesMedicamentsRecord.collection
                                .doc()
                                .set(mesMedicamentsCreateData);

                            context.goNamed('MesMedicamentsNv1');
                          },
                          text: FFLocalizations.of(context).getText(
                            '9uyhugpb' /* Oui */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('HomePage');
                          },
                          text: FFLocalizations.of(context).getText(
                            '3p15haxq' /* Non */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
