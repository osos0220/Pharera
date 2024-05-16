package com.example.flutter_application_09

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import android.widget.Toast
import android.content.Intent
import android.net.Uri
import android.provider.Settings

class MainActivity: FlutterActivity() {

    companion object {
        private const val REQUEST_STORAGE_PERMISSION = 100
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        checkStoragePermission()
    }

    private fun checkStoragePermission() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            // Permission not granted, request it
            ActivityCompat.requestPermissions(this,
                arrayOf(Manifest.permission.WRITE_EXTERNAL_STORAGE),
                REQUEST_STORAGE_PERMISSION)
        } else {
            // Permission already granted
            performStorageOperations()
        }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == REQUEST_STORAGE_PERMISSION) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // Permission granted, proceed with functionality
                performStorageOperations()
            } else {
                // Permission denied, inform the user
                showPermissionDeniedToast()
            }
        }
    }

    private fun performStorageOperations() {
        // Your code to perform storage-related operations
        Toast.makeText(this, "Storage permission granted. You can now perform storage operations.", Toast.LENGTH_SHORT).show()
    }

    private fun showPermissionDeniedToast() {
        // Inform the user about permission denial
        Toast.makeText(this, "Storage permission denied. Please grant the permission to perform storage operations.", Toast.LENGTH_LONG).show()

        // Offer guidance on how to grant the permission through app settings
        val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
        val uri = Uri.fromParts("package", packageName, null)
        intent.data = uri
        startActivity(intent)
    }
}
