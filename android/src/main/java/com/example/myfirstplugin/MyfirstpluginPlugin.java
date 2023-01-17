package com.example.myfirstplugin;

import android.os.Build;

import androidx.annotation.NonNull;

import java.util.UUID;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** MyfirstpluginPlugin */
public class MyfirstpluginPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native
  /// Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine
  /// and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "myfirstplugin");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    // if (call.method.equals("getPlatformVersion")) {
    // result.success("Android " + android.os.Build.VERSION.RELEASE);
    // } else {
    // result.notImplemented();
    // }

    if (call.method.equals("getCustomData")) {
      String query = call.argument("query");
      if (query.equals("uuid")) {
        String id = UUID.randomUUID().toString();
        result.success("Android UUID - " + id);
      } else if (query.equals("buildVersion")) {
        String version = Build.VERSION.RELEASE;
        result.success("Android Version - " + version);
      } else {
        result.notImplemented();
      }
    } else {
      result.notImplemented();
    }

  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
