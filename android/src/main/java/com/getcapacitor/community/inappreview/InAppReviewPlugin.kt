package com.getcapacitor.community.inappreview

import com.getcapacitor.Plugin
import com.getcapacitor.PluginCall
import com.getcapacitor.PluginMethod
import com.getcapacitor.annotation.CapacitorPlugin

@CapacitorPlugin(name = "InAppReview")
public class InAppReviewPlugin : Plugin() {
    private val implementation = InAppReview()

    @PluginMethod
    public fun requestReview(call: PluginCall) {
        implementation.requestReview(call, activity)
    }
}
