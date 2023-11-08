import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'map_component_model.dart';
export 'map_component_model.dart';

class MapComponentWidget extends StatefulWidget {
  const MapComponentWidget({super.key});

  @override
  _MapComponentWidgetState createState() => _MapComponentWidgetState();
}

class _MapComponentWidgetState extends State<MapComponentWidget> {
  late MapComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 45.0,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.save,
                  color: Color(0x00FFFFFF),
                  size: 24.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '7e06yetq' /* Set location */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    Icons.save,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              FlutterFlowGoogleMap(
                controller: _model.googleMapsController,
                onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                initialLocation: _model.googleMapsCenter ??=
                    const LatLng(31.8359458, 35.7828242),
                markerColor: GoogleMarkerColor.violet,
                mapType: MapType.normal,
                style: GoogleMapStyle.standard,
                initialZoom: 14.0,
                allowInteraction: true,
                allowZoom: true,
                showZoomControls: true,
                showLocation: true,
                showCompass: false,
                showMapToolbar: false,
                showTraffic: false,
                centerMapOnMarkerTap: false,
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, 0.00),
                child: Icon(
                  Icons.location_pin,
                  color: FlutterFlowTheme.of(context).error,
                  size: 35.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
