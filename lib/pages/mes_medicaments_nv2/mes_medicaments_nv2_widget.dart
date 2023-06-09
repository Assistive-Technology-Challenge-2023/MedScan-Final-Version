import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mes_medicaments_nv2_model.dart';
export 'mes_medicaments_nv2_model.dart';
import '/backend/sqflite_files/database_service.dart';
import '/backend/sqflite_files/leaflet_section.dart';

class MesMedicamentsNv2Widget extends StatefulWidget {
  const MesMedicamentsNv2Widget({
    Key? key,
    this.gtin,
    required this.ind,
    this.nom,
  }) : super(key: key);

  final int? gtin;
  final int? ind;
  final String? nom;

  @override
  _MesMedicamentsNv2WidgetState createState() =>
      _MesMedicamentsNv2WidgetState();
}

class _MesMedicamentsNv2WidgetState extends State<MesMedicamentsNv2Widget> {
  late MesMedicamentsNv2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MesMedicamentsNv2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: () async {
        try {
          return await Provider.of<DatabaseService>(context, listen: false).getLeaflet(widget.ind);
        } catch (e) {
          return 'Error: $e';
        }
      }(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.startsWith('Error')) {
            return Text(snapshot.data!);
          }
          String leafletJson = snapshot.data!;
          List<LeafletSection> leafletSections = parseLeaflet(leafletJson.toString());
          return Scaffold(
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
            body: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: leafletSections.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    context.pushNamed(
                      'noticeItem',
                      queryParams: {
                        'paragraph': serializeParam(
                          leafletSections[index].paragraphs.join('\n'),
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                    title: Text(leafletSections[index].title,
                      style: FlutterFlowTheme
                          .of(context)
                          .titleLarge,
                    ),
                    tileColor: FlutterFlowTheme
                        .of(context)
                        .secondaryBackground,
                    dense: false,
                  );
              },
              ),
            );
        }else{
          var err = "";
          if (snapshot.hasError) {
            err = snapshot.error.toString();
          }
          return Text('Error: ${err} \n Notice inexistent',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ));
        }
      },
    );
  }
}
