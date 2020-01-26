# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /opt/android-sdk-linux/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# used during initial config debug
#-dontobfuscate

# Add any project specific keep options here:

# do not use mmseg4j SOLR integration
-dontwarn org.apache.solr.**
-dontwarn com.chenlb.mmseg4j.solr.*

# we use mmseg4j instead of jsword's default SmartChineseAnalyzer
-dontwarn org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer
-dontwarn java.lang.management.ManagementFactory

# do not use JDOM2 jaxen xpath facility
-dontwarn org.jaxen.**

# commons compress does not need classes for other platforms
-dontwarn org.tukaani.xz.**

# hopefully these JDOm dependencies aren't used because I don't think Android provides them
-dontwarn javax.xml.stream.**

-dontwarn javax.swing.text.**

# slf4j has a lot of potential dependencies, not all of which are required
-dontwarn org.slf4j.**

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
-keepclassmembers class net.bible.android.view.activity.page.BibleJavascriptInterface {
   public *;
}

-keepclassmembers class org.apache.lucene.index.IndexReader {
   public *;
}


# Keep all the GreenRobot event handling onEvent functions
-keepclassmembers class ** {
    public void onEvent*(**);
}

# keep dynamically loaded Jsword classes
-keep class org.crosswire.jsword.** { *; }
-keep class net.bible.service.sword.** { *; }

# This class has a number of dynamic invocation so let's not
# touch it
# DO WE NEED THESE 2 LINES
-keep class org.apache.lucene.util.Attribute* { *; }
-keep class org.apache.lucene.analysis.tokenattributes.TermAttribute
# Lucene classes
-keep class org.apache.lucene.codecs.Codec
-keep class * extends org.apache.lucene.codecs.Codec
-keep class org.apache.lucene.codecs.PostingsFormat
-keep class * extends org.apache.lucene.codecs.PostingsFormat
-keep class org.apache.lucene.codecs.DocValuesFormat
-keep class * extends org.apache.lucene.codecs.DocValuesFormat
-keep class org.apache.lucene.analysis.tokenattributes.**
-keep class org.apache.lucene.**Attribute
-keep class * implements org.apache.lucene.**Attribute
# required for non-English searches
-keep class * extends org.tartarus.snowball.SnowballProgram

-keepclassmembers class * extends org.tartarus.snowball.SnowballProgram {
    *;
}

# We need these in order to support Kotlin reflection (used at least in SpeakWidgets.kt)
-keepattributes *Annotation*
-keep class kotlin.** { *; }
-keep class org.jetbrains.** { *; }



# [custom rules begin]
-verbose
-renamesourcefileattribute SourceFile

-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod,AnnotationDefault,JavascriptInterface
-keepattributes RuntimeVisibleAnnotations
-keepattributes RuntimeInvisibleAnnotations
-keepattributes RuntimeVisibleParameterAnnotations
-keepattributes RuntimeInvisibleParameterAnnotations

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers class * extends android.content.Context {
   public void *(android.view.View);
   public void *(android.view.MenuItem);
}

-keep class com.google.** { *; }
-dontwarn com.google.**
-dontwarn com.squareup.picasso.**
-dontwarn com.viewpagerindicator.**

-keepclasseswithmembernames class * {
  native <methods>;
}

# Parcelable implementations are accessed by introspection
-keepclassmembers class * implements android.os.Parcelable {*;}
-keep class * implements android.os.Parcelable {*;}
-keepnames class * implements android.os.Parcelable {*;}

-keep @JvmOverloads class * {
  <init>(...);
  *;
}

# [custom rules end]
