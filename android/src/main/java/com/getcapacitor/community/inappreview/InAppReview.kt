package com.getcapacitor.community.inappreview

import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import com.getcapacitor.PluginCall
import com.google.android.play.core.review.ReviewManagerFactory

public class InAppReview {
    public fun requestReview(call: PluginCall, activity: AppCompatActivity) {
        val manager = ReviewManagerFactory.create(activity)

        val request = manager.requestReviewFlow()
        request.addOnFailureListener { e ->
            e.printStackTrace()
            call.reject("Request review failed", ex = e)
        }
        request.addOnCompleteListener { task ->
            if (task.isSuccessful) {
                // We can get the ReviewInfo object
                val reviewInfo = task.result
                val flow = manager.launchReviewFlow(activity, reviewInfo)
                flow.addOnCompleteListener {
                    Log.i("RateApp", "Request review flow finished")
                    // The flow has finished. The API does not indicate whether the user
                    // reviewed or not, or even whether the review dialog was shown. Thus, no
                    // matter the result, we continue our app flow.
                    call.resolve()
                }
                flow.addOnSuccessListener { call.resolve() }
                flow.addOnFailureListener { e ->
                    e.printStackTrace()
                    call.reject("Request review flow Failed", ex = e)
                }
            } else {
                // There was some problem, continue regardless of the result.
                call.reject("Request review task Failed")
            }
        }
    }
}
