# Razorpay SDK ProGuard Rules
-keep class com.razorpay.** { *; }
-dontwarn com.razorpay.**

# Optional: Keep annotations if used
-keep class proguard.annotation.Keep { *; }
-keep class proguard.annotation.KeepClassMembers { *; }
