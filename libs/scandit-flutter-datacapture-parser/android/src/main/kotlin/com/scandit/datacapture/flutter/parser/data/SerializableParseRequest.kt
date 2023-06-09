package com.scandit.datacapture.flutter.parser.data

import org.json.JSONObject

class SerializableParseRequest(val parserId: String, val data: String) {
    constructor(json: JSONObject) : this(
        parserId = json.getString(FIELD_PARSER_ID),
        data = json.optString(FIELD_DATA, "")
    )

    companion object {
        private const val FIELD_PARSER_ID = "parserId"
        private const val FIELD_DATA = "data"
    }
}
