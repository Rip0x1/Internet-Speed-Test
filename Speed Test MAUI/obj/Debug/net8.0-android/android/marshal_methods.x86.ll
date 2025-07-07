; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [317 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [628 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 233
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 267
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 308
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 191
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 251
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 251
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 271
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 20: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 21: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 207
	i32 176265551, ; 22: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 23: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 253
	i32 184328833, ; 24: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 25: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 305
	i32 199333315, ; 26: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 306
	i32 205061960, ; 27: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 28: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 205
	i32 220171995, ; 29: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 30: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 227
	i32 230752869, ; 31: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 32: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 33: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 34: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 35: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 210
	i32 276479776, ; 36: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 37: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 229
	i32 280482487, ; 38: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 226
	i32 280992041, ; 39: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 277
	i32 291076382, ; 40: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 41: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 42: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 305
	i32 318968648, ; 43: Xamarin.AndroidX.Activity.dll => 0x13031348 => 196
	i32 321597661, ; 44: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 45: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 290
	i32 342366114, ; 46: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 228
	i32 356389973, ; 47: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 289
	i32 360082299, ; 48: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 49: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 50: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 51: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 52: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 53: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 54: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 55: _Microsoft.Android.Resource.Designer => 0x17969339 => 313
	i32 403441872, ; 56: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 57: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 301
	i32 441335492, ; 58: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 211
	i32 442565967, ; 59: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 60: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 224
	i32 451504562, ; 61: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 62: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 63: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 64: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 65: System.dll => 0x1bff388e => 164
	i32 476646585, ; 66: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 226
	i32 486930444, ; 67: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 239
	i32 498788369, ; 68: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 69: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 288
	i32 503918385, ; 70: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 282
	i32 513247710, ; 71: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 185
	i32 526420162, ; 72: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 73: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 271
	i32 530272170, ; 74: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 75: Microsoft.Extensions.Logging => 0x20216150 => 181
	i32 540030774, ; 76: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 77: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 78: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 79: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 80: Jsr305Binding => 0x213954e7 => 264
	i32 569601784, ; 81: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 262
	i32 577335427, ; 82: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 83: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 296
	i32 597488923, ; 84: CommunityToolkit.Maui => 0x239cf51b => 173
	i32 601371474, ; 85: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 86: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 87: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 88: Xamarin.AndroidX.CustomView => 0x2568904f => 216
	i32 627931235, ; 89: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 294
	i32 639843206, ; 90: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 222
	i32 643868501, ; 91: System.Net => 0x2660a755 => 81
	i32 662205335, ; 92: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 93: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 258
	i32 666292255, ; 94: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 203
	i32 672442732, ; 95: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 96: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 97: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 276
	i32 690569205, ; 98: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 99: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 273
	i32 693804605, ; 100: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 101: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 102: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 268
	i32 700358131, ; 103: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 104: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 291
	i32 709557578, ; 105: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 279
	i32 720511267, ; 106: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 272
	i32 722857257, ; 107: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 108: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 109: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 110: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 193
	i32 759454413, ; 111: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 112: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 113: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 114: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 300
	i32 789151979, ; 115: Microsoft.Extensions.Options => 0x2f0980eb => 184
	i32 790371945, ; 116: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 217
	i32 804715423, ; 117: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 118: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 231
	i32 823281589, ; 119: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 120: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 121: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 122: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 123: Xamarin.AndroidX.Print => 0x3246f6cd => 244
	i32 873119928, ; 124: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 125: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 126: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 127: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 128: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 129: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 303
	i32 928116545, ; 130: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 267
	i32 952186615, ; 131: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 132: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 272
	i32 966729478, ; 133: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 265
	i32 967690846, ; 134: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 228
	i32 975236339, ; 135: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 136: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 137: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 138: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 139: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 140: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 141: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 142: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 248
	i32 1019214401, ; 143: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 144: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 180
	i32 1029334545, ; 145: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 278
	i32 1031528504, ; 146: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 266
	i32 1035644815, ; 147: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 201
	i32 1036536393, ; 148: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 149: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 150: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 235
	i32 1067306892, ; 151: GoogleGson => 0x3f9dcf8c => 176
	i32 1082857460, ; 152: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 153: Xamarin.Kotlin.StdLib => 0x409e66d8 => 269
	i32 1098259244, ; 154: System => 0x41761b2c => 164
	i32 1118262833, ; 155: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 291
	i32 1121599056, ; 156: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 234
	i32 1127624469, ; 157: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 183
	i32 1149092582, ; 158: Xamarin.AndroidX.Window => 0x447dc2e6 => 261
	i32 1168523401, ; 159: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 297
	i32 1170634674, ; 160: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 161: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 257
	i32 1178241025, ; 162: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 242
	i32 1203215381, ; 163: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 295
	i32 1204270330, ; 164: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 203
	i32 1208641965, ; 165: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 166: CommunityToolkit.Mvvm => 0x4868cc7b => 175
	i32 1219128291, ; 167: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 168: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 293
	i32 1243150071, ; 169: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 262
	i32 1253011324, ; 170: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 171: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 277
	i32 1264511973, ; 172: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 252
	i32 1267360935, ; 173: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 256
	i32 1273260888, ; 174: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 208
	i32 1275534314, ; 175: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 273
	i32 1278448581, ; 176: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 200
	i32 1293217323, ; 177: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 219
	i32 1309188875, ; 178: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 179: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 261
	i32 1324164729, ; 180: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 181: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 182: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 183: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 307
	i32 1376866003, ; 184: Xamarin.AndroidX.SavedState => 0x52114ed3 => 248
	i32 1379779777, ; 185: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 186: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 187: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 212
	i32 1408764838, ; 188: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 189: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 190: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 191: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 275
	i32 1434145427, ; 192: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 193: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 265
	i32 1439761251, ; 194: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 195: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 196: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 197: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 198: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 199: es\Microsoft.Maui.Controls.resources => 0x57152abe => 281
	i32 1461234159, ; 200: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 201: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 202: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 203: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 202
	i32 1470490898, ; 204: Microsoft.Extensions.Primitives => 0x57a5e912 => 185
	i32 1479771757, ; 205: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 206: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 207: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 208: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 249
	i32 1493001747, ; 209: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 285
	i32 1514721132, ; 210: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 280
	i32 1536373174, ; 211: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 212: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 213: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 214: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 215: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 300
	i32 1565862583, ; 216: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 217: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 218: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 219: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 220: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 218
	i32 1592978981, ; 221: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 222: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 266
	i32 1601112923, ; 223: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1603525486, ; 224: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 309
	i32 1604827217, ; 225: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 226: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 227: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 238
	i32 1622358360, ; 228: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 229: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 260
	i32 1634654947, ; 230: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 174
	i32 1635184631, ; 231: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 222
	i32 1636350590, ; 232: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 215
	i32 1639515021, ; 233: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 234: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 235: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 236: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 237: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 254
	i32 1658251792, ; 238: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 263
	i32 1670060433, ; 239: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 210
	i32 1675553242, ; 240: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 241: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 242: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 243: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 244: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 245: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 246: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 270
	i32 1701541528, ; 247: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 248: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 231
	i32 1726116996, ; 249: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 250: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 251: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 206
	i32 1736233607, ; 252: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 298
	i32 1743415430, ; 253: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 276
	i32 1744735666, ; 254: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 255: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 256: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 257: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 258: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 259: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 260: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 253
	i32 1770582343, ; 261: Microsoft.Extensions.Logging.dll => 0x6988f147 => 181
	i32 1776026572, ; 262: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 263: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 264: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 265: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 292
	i32 1788241197, ; 266: Xamarin.AndroidX.Fragment => 0x6a96652d => 224
	i32 1793755602, ; 267: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 284
	i32 1808609942, ; 268: Xamarin.AndroidX.Loader => 0x6bcd3296 => 238
	i32 1813058853, ; 269: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 269
	i32 1813201214, ; 270: Xamarin.Google.Android.Material => 0x6c13413e => 263
	i32 1818569960, ; 271: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 243
	i32 1818787751, ; 272: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 273: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 274: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1827303595, ; 275: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 311
	i32 1828688058, ; 276: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 182
	i32 1842015223, ; 277: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 304
	i32 1847515442, ; 278: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 193
	i32 1853025655, ; 279: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 301
	i32 1858542181, ; 280: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 281: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 282: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 283
	i32 1879696579, ; 283: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 284: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 204
	i32 1885918049, ; 285: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 311
	i32 1888955245, ; 286: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 287: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 288: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 289: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 290: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 291: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 292: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 293: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 250
	i32 1968388702, ; 294: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 177
	i32 1983156543, ; 295: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 270
	i32 1985761444, ; 296: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 195
	i32 2003115576, ; 297: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 280
	i32 2011961780, ; 298: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 299: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 235
	i32 2025202353, ; 300: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 275
	i32 2031763787, ; 301: Xamarin.Android.Glide => 0x791a414b => 192
	i32 2045470958, ; 302: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 303: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 230
	i32 2060060697, ; 304: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 305: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 279
	i32 2070888862, ; 306: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 307: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 308: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2117912485, ; 309: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 0x7e3cc7a5 => 312
	i32 2127167465, ; 310: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 311: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 312: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 313: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 314: Microsoft.Maui => 0x80bd55ad => 189
	i32 2169148018, ; 315: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 287
	i32 2181898931, ; 316: Microsoft.Extensions.Options.dll => 0x820d22b3 => 184
	i32 2192057212, ; 317: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 182
	i32 2193016926, ; 318: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 319: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 274
	i32 2201231467, ; 320: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 321: it\Microsoft.Maui.Controls.resources => 0x839595db => 289
	i32 2217644978, ; 322: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 257
	i32 2222056684, ; 323: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 324: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 239
	i32 2252106437, ; 325: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 326: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 327: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 328: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 178
	i32 2267999099, ; 329: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 194
	i32 2270573516, ; 330: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 283
	i32 2279755925, ; 331: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 246
	i32 2293034957, ; 332: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 333: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 334: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 335: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 293
	i32 2305521784, ; 336: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 337: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 198
	i32 2320631194, ; 338: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 339: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 340: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 341: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 342: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 343: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 177
	i32 2378619854, ; 344: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 345: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 346: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 288
	i32 2401565422, ; 347: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 348: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 221
	i32 2409983638, ; 349: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 310
	i32 2421380589, ; 350: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 351: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 208
	i32 2427813419, ; 352: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 285
	i32 2435356389, ; 353: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 354: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 355: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 356: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 357: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 358: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 211
	i32 2471841756, ; 359: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 360: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 361: Microsoft.Maui.Controls => 0x93dba8a1 => 187
	i32 2483903535, ; 362: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 363: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 364: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 365: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 366: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 233
	i32 2522472828, ; 367: Xamarin.Android.Glide.dll => 0x9659e17c => 192
	i32 2538310050, ; 368: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 369: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 286
	i32 2562349572, ; 370: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 371: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 372: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 234
	i32 2581819634, ; 373: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 256
	i32 2585220780, ; 374: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 375: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 376: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 377: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 295
	i32 2605712449, ; 378: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 274
	i32 2615233544, ; 379: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 225
	i32 2616218305, ; 380: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 183
	i32 2617129537, ; 381: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 382: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 383: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 215
	i32 2624644809, ; 384: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 220
	i32 2626831493, ; 385: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 290
	i32 2627185994, ; 386: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 387: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 388: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 229
	i32 2663391936, ; 389: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 194
	i32 2663698177, ; 390: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 391: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 392: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 393: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 394: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 395: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 396: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 254
	i32 2715334215, ; 397: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 398: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 399: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 400: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 401: Xamarin.AndroidX.Activity => 0xa2e0939b => 196
	i32 2735172069, ; 402: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 403: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 202
	i32 2740948882, ; 404: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 405: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 406: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 296
	i32 2758225723, ; 407: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 188
	i32 2764765095, ; 408: Microsoft.Maui.dll => 0xa4caf7a7 => 189
	i32 2765824710, ; 409: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 410: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 268
	i32 2778768386, ; 411: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 259
	i32 2779977773, ; 412: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 247
	i32 2785988530, ; 413: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 302
	i32 2788224221, ; 414: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 225
	i32 2801831435, ; 415: Microsoft.Maui.Graphics => 0xa7008e0b => 191
	i32 2803228030, ; 416: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 417: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 281
	i32 2810250172, ; 418: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 212
	i32 2819470561, ; 419: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 420: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 421: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 247
	i32 2824502124, ; 422: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 423: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 294
	i32 2838993487, ; 424: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 236
	i32 2849599387, ; 425: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 426: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 259
	i32 2855708567, ; 427: Xamarin.AndroidX.Transition => 0xaa36a797 => 255
	i32 2861098320, ; 428: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 429: Microsoft.Maui.Essentials => 0xaa8a4878 => 190
	i32 2868488919, ; 430: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 174
	i32 2870099610, ; 431: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 197
	i32 2875164099, ; 432: Jsr305Binding.dll => 0xab5f85c3 => 264
	i32 2875220617, ; 433: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 434: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 223
	i32 2887636118, ; 435: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 436: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 437: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 438: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 439: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 440: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 441: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 260
	i32 2919462931, ; 442: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 443: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 199
	i32 2936416060, ; 444: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 445: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 446: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 447: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 448: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 449: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 450: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 219
	i32 2987532451, ; 451: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 250
	i32 2996846495, ; 452: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 232
	i32 3016983068, ; 453: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 252
	i32 3023353419, ; 454: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 455: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 227
	i32 3038032645, ; 456: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 313
	i32 3056245963, ; 457: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 249
	i32 3057625584, ; 458: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 240
	i32 3059408633, ; 459: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 460: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 461: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 462: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 287
	i32 3090735792, ; 463: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 464: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 465: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 466: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 467: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 468: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 469: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 470: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 471: GoogleGson.dll => 0xbba64c02 => 176
	i32 3159123045, ; 472: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 473: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 474: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 241
	i32 3192346100, ; 475: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 476: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 477: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 478: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 479: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 218
	i32 3217618498, ; 480: Microsoft.VisualStudio.DesignTools.XamlTapContract => 0xbfc8f642 => 312
	i32 3220365878, ; 481: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 482: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 483: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 484: Xamarin.AndroidX.CardView => 0xc235e84d => 206
	i32 3265493905, ; 485: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 486: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 487: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 488: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 489: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 490: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 491: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 492: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 493: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 282
	i32 3316684772, ; 494: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 495: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 216
	i32 3317144872, ; 496: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 497: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 204
	i32 3345895724, ; 498: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 245
	i32 3346324047, ; 499: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 242
	i32 3357674450, ; 500: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 299
	i32 3358260929, ; 501: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 502: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 197
	i32 3362522851, ; 503: Xamarin.AndroidX.Core => 0xc86c06e3 => 213
	i32 3366347497, ; 504: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 505: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 246
	i32 3381016424, ; 506: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 278
	i32 3395150330, ; 507: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 508: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 509: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 217
	i32 3428513518, ; 510: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 179
	i32 3429136800, ; 511: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 512: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 513: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 220
	i32 3445260447, ; 514: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 515: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 186
	i32 3452432287, ; 516: Speed Test MAUI.dll => 0xcdc7ef9f => 0
	i32 3463511458, ; 517: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 286
	i32 3471940407, ; 518: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 519: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 520: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 299
	i32 3484440000, ; 521: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 298
	i32 3485117614, ; 522: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 523: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 524: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 209
	i32 3509114376, ; 525: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 526: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 527: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 528: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 529: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 530: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 531: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 306
	i32 3597029428, ; 532: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 195
	i32 3598340787, ; 533: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 534: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 535: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 536: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 244
	i32 3633644679, ; 537: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 199
	i32 3638274909, ; 538: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 539: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 230
	i32 3643446276, ; 540: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 303
	i32 3643854240, ; 541: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 241
	i32 3645089577, ; 542: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 543: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 178
	i32 3660523487, ; 544: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 545: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3676670898, ; 546: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 309
	i32 3682565725, ; 547: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 205
	i32 3684561358, ; 548: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 209
	i32 3697841164, ; 549: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 308
	i32 3700866549, ; 550: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 551: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 214
	i32 3716563718, ; 552: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 553: Xamarin.AndroidX.Annotation => 0xdda814c6 => 198
	i32 3724971120, ; 554: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 240
	i32 3732100267, ; 555: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 556: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 557: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 558: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 559: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 207
	i32 3792276235, ; 560: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 561: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 186
	i32 3802395368, ; 562: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 563: CommunityToolkit.Maui.dll => 0xe3886bf7 => 173
	i32 3819260425, ; 564: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 565: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 566: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 567: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 180
	i32 3844307129, ; 568: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 569: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 570: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 571: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 572: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 573: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 574: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 255
	i32 3888767677, ; 575: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 245
	i32 3889960447, ; 576: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 307
	i32 3896106733, ; 577: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 578: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 213
	i32 3901907137, ; 579: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 580: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 581: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 258
	i32 3928044579, ; 582: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 583: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 584: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 243
	i32 3945713374, ; 585: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 586: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 587: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 201
	i32 3959773229, ; 588: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 232
	i32 3980434154, ; 589: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 302
	i32 3987592930, ; 590: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 284
	i32 4003436829, ; 591: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 592: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 200
	i32 4025784931, ; 593: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 594: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 188
	i32 4054681211, ; 595: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 596: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 597: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 598: Microsoft.Maui.Essentials.dll => 0xf40add04 => 190
	i32 4099507663, ; 599: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 600: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 601: Xamarin.AndroidX.Emoji2 => 0xf479582c => 221
	i32 4102112229, ; 602: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 297
	i32 4125707920, ; 603: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 292
	i32 4126470640, ; 604: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 179
	i32 4127667938, ; 605: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 606: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 607: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 608: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 304
	i32 4151237749, ; 609: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 610: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 611: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 612: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 613: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 614: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 237
	i32 4182880526, ; 615: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 310
	i32 4185676441, ; 616: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 617: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 618: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4254109270, ; 619: Speed Test MAUI => 0xfd908e56 => 0
	i32 4256097574, ; 620: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 214
	i32 4258378803, ; 621: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 236
	i32 4260525087, ; 622: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 623: Microsoft.Maui.Controls.dll => 0xfea12dee => 187
	i32 4274623895, ; 624: CommunityToolkit.Mvvm.dll => 0xfec99597 => 175
	i32 4274976490, ; 625: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 626: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 237
	i32 4294763496 ; 627: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 223
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [628 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 233, ; 3
	i32 267, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 308, ; 9
	i32 124, ; 10
	i32 191, ; 11
	i32 102, ; 12
	i32 251, ; 13
	i32 107, ; 14
	i32 251, ; 15
	i32 139, ; 16
	i32 271, ; 17
	i32 77, ; 18
	i32 124, ; 19
	i32 13, ; 20
	i32 207, ; 21
	i32 132, ; 22
	i32 253, ; 23
	i32 151, ; 24
	i32 305, ; 25
	i32 306, ; 26
	i32 18, ; 27
	i32 205, ; 28
	i32 26, ; 29
	i32 227, ; 30
	i32 1, ; 31
	i32 59, ; 32
	i32 42, ; 33
	i32 91, ; 34
	i32 210, ; 35
	i32 147, ; 36
	i32 229, ; 37
	i32 226, ; 38
	i32 277, ; 39
	i32 54, ; 40
	i32 69, ; 41
	i32 305, ; 42
	i32 196, ; 43
	i32 83, ; 44
	i32 290, ; 45
	i32 228, ; 46
	i32 289, ; 47
	i32 131, ; 48
	i32 55, ; 49
	i32 149, ; 50
	i32 74, ; 51
	i32 145, ; 52
	i32 62, ; 53
	i32 146, ; 54
	i32 313, ; 55
	i32 165, ; 56
	i32 301, ; 57
	i32 211, ; 58
	i32 12, ; 59
	i32 224, ; 60
	i32 125, ; 61
	i32 152, ; 62
	i32 113, ; 63
	i32 166, ; 64
	i32 164, ; 65
	i32 226, ; 66
	i32 239, ; 67
	i32 84, ; 68
	i32 288, ; 69
	i32 282, ; 70
	i32 185, ; 71
	i32 150, ; 72
	i32 271, ; 73
	i32 60, ; 74
	i32 181, ; 75
	i32 51, ; 76
	i32 103, ; 77
	i32 114, ; 78
	i32 40, ; 79
	i32 264, ; 80
	i32 262, ; 81
	i32 120, ; 82
	i32 296, ; 83
	i32 173, ; 84
	i32 52, ; 85
	i32 44, ; 86
	i32 119, ; 87
	i32 216, ; 88
	i32 294, ; 89
	i32 222, ; 90
	i32 81, ; 91
	i32 136, ; 92
	i32 258, ; 93
	i32 203, ; 94
	i32 8, ; 95
	i32 73, ; 96
	i32 276, ; 97
	i32 155, ; 98
	i32 273, ; 99
	i32 154, ; 100
	i32 92, ; 101
	i32 268, ; 102
	i32 45, ; 103
	i32 291, ; 104
	i32 279, ; 105
	i32 272, ; 106
	i32 109, ; 107
	i32 129, ; 108
	i32 25, ; 109
	i32 193, ; 110
	i32 72, ; 111
	i32 55, ; 112
	i32 46, ; 113
	i32 300, ; 114
	i32 184, ; 115
	i32 217, ; 116
	i32 22, ; 117
	i32 231, ; 118
	i32 86, ; 119
	i32 43, ; 120
	i32 160, ; 121
	i32 71, ; 122
	i32 244, ; 123
	i32 3, ; 124
	i32 42, ; 125
	i32 63, ; 126
	i32 16, ; 127
	i32 53, ; 128
	i32 303, ; 129
	i32 267, ; 130
	i32 105, ; 131
	i32 272, ; 132
	i32 265, ; 133
	i32 228, ; 134
	i32 34, ; 135
	i32 158, ; 136
	i32 85, ; 137
	i32 32, ; 138
	i32 12, ; 139
	i32 51, ; 140
	i32 56, ; 141
	i32 248, ; 142
	i32 36, ; 143
	i32 180, ; 144
	i32 278, ; 145
	i32 266, ; 146
	i32 201, ; 147
	i32 35, ; 148
	i32 58, ; 149
	i32 235, ; 150
	i32 176, ; 151
	i32 17, ; 152
	i32 269, ; 153
	i32 164, ; 154
	i32 291, ; 155
	i32 234, ; 156
	i32 183, ; 157
	i32 261, ; 158
	i32 297, ; 159
	i32 153, ; 160
	i32 257, ; 161
	i32 242, ; 162
	i32 295, ; 163
	i32 203, ; 164
	i32 29, ; 165
	i32 175, ; 166
	i32 52, ; 167
	i32 293, ; 168
	i32 262, ; 169
	i32 5, ; 170
	i32 277, ; 171
	i32 252, ; 172
	i32 256, ; 173
	i32 208, ; 174
	i32 273, ; 175
	i32 200, ; 176
	i32 219, ; 177
	i32 85, ; 178
	i32 261, ; 179
	i32 61, ; 180
	i32 112, ; 181
	i32 57, ; 182
	i32 307, ; 183
	i32 248, ; 184
	i32 99, ; 185
	i32 19, ; 186
	i32 212, ; 187
	i32 111, ; 188
	i32 101, ; 189
	i32 102, ; 190
	i32 275, ; 191
	i32 104, ; 192
	i32 265, ; 193
	i32 71, ; 194
	i32 38, ; 195
	i32 32, ; 196
	i32 103, ; 197
	i32 73, ; 198
	i32 281, ; 199
	i32 9, ; 200
	i32 123, ; 201
	i32 46, ; 202
	i32 202, ; 203
	i32 185, ; 204
	i32 9, ; 205
	i32 43, ; 206
	i32 4, ; 207
	i32 249, ; 208
	i32 285, ; 209
	i32 280, ; 210
	i32 31, ; 211
	i32 138, ; 212
	i32 92, ; 213
	i32 93, ; 214
	i32 300, ; 215
	i32 49, ; 216
	i32 141, ; 217
	i32 112, ; 218
	i32 140, ; 219
	i32 218, ; 220
	i32 115, ; 221
	i32 266, ; 222
	i32 157, ; 223
	i32 309, ; 224
	i32 76, ; 225
	i32 79, ; 226
	i32 238, ; 227
	i32 37, ; 228
	i32 260, ; 229
	i32 174, ; 230
	i32 222, ; 231
	i32 215, ; 232
	i32 64, ; 233
	i32 138, ; 234
	i32 15, ; 235
	i32 116, ; 236
	i32 254, ; 237
	i32 263, ; 238
	i32 210, ; 239
	i32 48, ; 240
	i32 70, ; 241
	i32 80, ; 242
	i32 126, ; 243
	i32 94, ; 244
	i32 121, ; 245
	i32 270, ; 246
	i32 26, ; 247
	i32 231, ; 248
	i32 97, ; 249
	i32 28, ; 250
	i32 206, ; 251
	i32 298, ; 252
	i32 276, ; 253
	i32 149, ; 254
	i32 169, ; 255
	i32 4, ; 256
	i32 98, ; 257
	i32 33, ; 258
	i32 93, ; 259
	i32 253, ; 260
	i32 181, ; 261
	i32 21, ; 262
	i32 41, ; 263
	i32 170, ; 264
	i32 292, ; 265
	i32 224, ; 266
	i32 284, ; 267
	i32 238, ; 268
	i32 269, ; 269
	i32 263, ; 270
	i32 243, ; 271
	i32 2, ; 272
	i32 134, ; 273
	i32 111, ; 274
	i32 311, ; 275
	i32 182, ; 276
	i32 304, ; 277
	i32 193, ; 278
	i32 301, ; 279
	i32 58, ; 280
	i32 95, ; 281
	i32 283, ; 282
	i32 39, ; 283
	i32 204, ; 284
	i32 311, ; 285
	i32 25, ; 286
	i32 94, ; 287
	i32 89, ; 288
	i32 99, ; 289
	i32 10, ; 290
	i32 87, ; 291
	i32 100, ; 292
	i32 250, ; 293
	i32 177, ; 294
	i32 270, ; 295
	i32 195, ; 296
	i32 280, ; 297
	i32 7, ; 298
	i32 235, ; 299
	i32 275, ; 300
	i32 192, ; 301
	i32 88, ; 302
	i32 230, ; 303
	i32 154, ; 304
	i32 279, ; 305
	i32 33, ; 306
	i32 116, ; 307
	i32 82, ; 308
	i32 312, ; 309
	i32 20, ; 310
	i32 11, ; 311
	i32 162, ; 312
	i32 3, ; 313
	i32 189, ; 314
	i32 287, ; 315
	i32 184, ; 316
	i32 182, ; 317
	i32 84, ; 318
	i32 274, ; 319
	i32 64, ; 320
	i32 289, ; 321
	i32 257, ; 322
	i32 143, ; 323
	i32 239, ; 324
	i32 157, ; 325
	i32 41, ; 326
	i32 117, ; 327
	i32 178, ; 328
	i32 194, ; 329
	i32 283, ; 330
	i32 246, ; 331
	i32 131, ; 332
	i32 75, ; 333
	i32 66, ; 334
	i32 293, ; 335
	i32 172, ; 336
	i32 198, ; 337
	i32 143, ; 338
	i32 106, ; 339
	i32 151, ; 340
	i32 70, ; 341
	i32 156, ; 342
	i32 177, ; 343
	i32 121, ; 344
	i32 127, ; 345
	i32 288, ; 346
	i32 152, ; 347
	i32 221, ; 348
	i32 310, ; 349
	i32 141, ; 350
	i32 208, ; 351
	i32 285, ; 352
	i32 20, ; 353
	i32 14, ; 354
	i32 135, ; 355
	i32 75, ; 356
	i32 59, ; 357
	i32 211, ; 358
	i32 167, ; 359
	i32 168, ; 360
	i32 187, ; 361
	i32 15, ; 362
	i32 74, ; 363
	i32 6, ; 364
	i32 23, ; 365
	i32 233, ; 366
	i32 192, ; 367
	i32 91, ; 368
	i32 286, ; 369
	i32 1, ; 370
	i32 136, ; 371
	i32 234, ; 372
	i32 256, ; 373
	i32 134, ; 374
	i32 69, ; 375
	i32 146, ; 376
	i32 295, ; 377
	i32 274, ; 378
	i32 225, ; 379
	i32 183, ; 380
	i32 88, ; 381
	i32 96, ; 382
	i32 215, ; 383
	i32 220, ; 384
	i32 290, ; 385
	i32 31, ; 386
	i32 45, ; 387
	i32 229, ; 388
	i32 194, ; 389
	i32 109, ; 390
	i32 158, ; 391
	i32 35, ; 392
	i32 22, ; 393
	i32 114, ; 394
	i32 57, ; 395
	i32 254, ; 396
	i32 144, ; 397
	i32 118, ; 398
	i32 120, ; 399
	i32 110, ; 400
	i32 196, ; 401
	i32 139, ; 402
	i32 202, ; 403
	i32 54, ; 404
	i32 105, ; 405
	i32 296, ; 406
	i32 188, ; 407
	i32 189, ; 408
	i32 133, ; 409
	i32 268, ; 410
	i32 259, ; 411
	i32 247, ; 412
	i32 302, ; 413
	i32 225, ; 414
	i32 191, ; 415
	i32 159, ; 416
	i32 281, ; 417
	i32 212, ; 418
	i32 163, ; 419
	i32 132, ; 420
	i32 247, ; 421
	i32 161, ; 422
	i32 294, ; 423
	i32 236, ; 424
	i32 140, ; 425
	i32 259, ; 426
	i32 255, ; 427
	i32 169, ; 428
	i32 190, ; 429
	i32 174, ; 430
	i32 197, ; 431
	i32 264, ; 432
	i32 40, ; 433
	i32 223, ; 434
	i32 81, ; 435
	i32 56, ; 436
	i32 37, ; 437
	i32 97, ; 438
	i32 166, ; 439
	i32 172, ; 440
	i32 260, ; 441
	i32 82, ; 442
	i32 199, ; 443
	i32 98, ; 444
	i32 30, ; 445
	i32 159, ; 446
	i32 18, ; 447
	i32 127, ; 448
	i32 119, ; 449
	i32 219, ; 450
	i32 250, ; 451
	i32 232, ; 452
	i32 252, ; 453
	i32 165, ; 454
	i32 227, ; 455
	i32 313, ; 456
	i32 249, ; 457
	i32 240, ; 458
	i32 170, ; 459
	i32 16, ; 460
	i32 144, ; 461
	i32 287, ; 462
	i32 125, ; 463
	i32 118, ; 464
	i32 38, ; 465
	i32 115, ; 466
	i32 47, ; 467
	i32 142, ; 468
	i32 117, ; 469
	i32 34, ; 470
	i32 176, ; 471
	i32 95, ; 472
	i32 53, ; 473
	i32 241, ; 474
	i32 129, ; 475
	i32 153, ; 476
	i32 24, ; 477
	i32 161, ; 478
	i32 218, ; 479
	i32 312, ; 480
	i32 148, ; 481
	i32 104, ; 482
	i32 89, ; 483
	i32 206, ; 484
	i32 60, ; 485
	i32 142, ; 486
	i32 100, ; 487
	i32 5, ; 488
	i32 13, ; 489
	i32 122, ; 490
	i32 135, ; 491
	i32 28, ; 492
	i32 282, ; 493
	i32 72, ; 494
	i32 216, ; 495
	i32 24, ; 496
	i32 204, ; 497
	i32 245, ; 498
	i32 242, ; 499
	i32 299, ; 500
	i32 137, ; 501
	i32 197, ; 502
	i32 213, ; 503
	i32 168, ; 504
	i32 246, ; 505
	i32 278, ; 506
	i32 101, ; 507
	i32 123, ; 508
	i32 217, ; 509
	i32 179, ; 510
	i32 163, ; 511
	i32 167, ; 512
	i32 220, ; 513
	i32 39, ; 514
	i32 186, ; 515
	i32 0, ; 516
	i32 286, ; 517
	i32 17, ; 518
	i32 171, ; 519
	i32 299, ; 520
	i32 298, ; 521
	i32 137, ; 522
	i32 150, ; 523
	i32 209, ; 524
	i32 155, ; 525
	i32 130, ; 526
	i32 19, ; 527
	i32 65, ; 528
	i32 147, ; 529
	i32 47, ; 530
	i32 306, ; 531
	i32 195, ; 532
	i32 79, ; 533
	i32 61, ; 534
	i32 106, ; 535
	i32 244, ; 536
	i32 199, ; 537
	i32 49, ; 538
	i32 230, ; 539
	i32 303, ; 540
	i32 241, ; 541
	i32 14, ; 542
	i32 178, ; 543
	i32 68, ; 544
	i32 171, ; 545
	i32 309, ; 546
	i32 205, ; 547
	i32 209, ; 548
	i32 308, ; 549
	i32 78, ; 550
	i32 214, ; 551
	i32 108, ; 552
	i32 198, ; 553
	i32 240, ; 554
	i32 67, ; 555
	i32 63, ; 556
	i32 27, ; 557
	i32 160, ; 558
	i32 207, ; 559
	i32 10, ; 560
	i32 186, ; 561
	i32 11, ; 562
	i32 173, ; 563
	i32 78, ; 564
	i32 126, ; 565
	i32 83, ; 566
	i32 180, ; 567
	i32 66, ; 568
	i32 107, ; 569
	i32 65, ; 570
	i32 128, ; 571
	i32 122, ; 572
	i32 77, ; 573
	i32 255, ; 574
	i32 245, ; 575
	i32 307, ; 576
	i32 8, ; 577
	i32 213, ; 578
	i32 2, ; 579
	i32 44, ; 580
	i32 258, ; 581
	i32 156, ; 582
	i32 128, ; 583
	i32 243, ; 584
	i32 23, ; 585
	i32 133, ; 586
	i32 201, ; 587
	i32 232, ; 588
	i32 302, ; 589
	i32 284, ; 590
	i32 29, ; 591
	i32 200, ; 592
	i32 62, ; 593
	i32 188, ; 594
	i32 90, ; 595
	i32 87, ; 596
	i32 148, ; 597
	i32 190, ; 598
	i32 36, ; 599
	i32 86, ; 600
	i32 221, ; 601
	i32 297, ; 602
	i32 292, ; 603
	i32 179, ; 604
	i32 50, ; 605
	i32 6, ; 606
	i32 90, ; 607
	i32 304, ; 608
	i32 21, ; 609
	i32 162, ; 610
	i32 96, ; 611
	i32 50, ; 612
	i32 113, ; 613
	i32 237, ; 614
	i32 310, ; 615
	i32 130, ; 616
	i32 76, ; 617
	i32 27, ; 618
	i32 0, ; 619
	i32 214, ; 620
	i32 236, ; 621
	i32 7, ; 622
	i32 187, ; 623
	i32 175, ; 624
	i32 110, ; 625
	i32 237, ; 626
	i32 223 ; 627
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
