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

@assembly_image_cache = dso_local local_unnamed_addr global [351 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [702 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 270
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 304
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 316
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 210
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 9: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 325
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 349
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 205
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 16: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 333
	i32 101534019, ; 17: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 288
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 288
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 127863914, ; 21: UraniumUI.Material => 0x79f0c6a => 228
	i32 134690465, ; 22: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 312
	i32 136584136, ; 23: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 348
	i32 140062828, ; 24: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 341
	i32 142721839, ; 25: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149764678, ; 26: Svg.Skia.dll => 0x8ed3a46 => 223
	i32 149972175, ; 27: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 28: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 29: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 244
	i32 176265551, ; 30: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 31: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 290
	i32 184328833, ; 32: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 33: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 34: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 242
	i32 220171995, ; 35: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 36: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 264
	i32 230752869, ; 37: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 38: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 39: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 40: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 41: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 247
	i32 276479776, ; 42: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 277295747, ; 43: Refit.HttpClientFactory => 0x10873283 => 213
	i32 278686392, ; 44: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 266
	i32 280482487, ; 45: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 263
	i32 291076382, ; 46: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 291275502, ; 47: Microsoft.Extensions.Http.dll => 0x115c82ee => 189
	i32 292822316, ; 48: Mapsui.UI.Maui => 0x11741d2c => 181
	i32 298918909, ; 49: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 50: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 346
	i32 318968648, ; 51: Xamarin.AndroidX.Activity.dll => 0x13031348 => 233
	i32 321597661, ; 52: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 53: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 324
	i32 342366114, ; 54: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 265
	i32 360082299, ; 55: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 56: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 57: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 58: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 59: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 60: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 61: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 62: _Microsoft.Android.Resource.Designer => 0x17969339 => 350
	i32 403441872, ; 63: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 64: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 344
	i32 441335492, ; 65: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 248
	i32 442565967, ; 66: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 67: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 261
	i32 451504562, ; 68: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 69: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 70: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465658307, ; 71: ExCSS => 0x1bc161c3 => 176
	i32 465846621, ; 72: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 73: System.dll => 0x1bff388e => 164
	i32 469965489, ; 74: Svg.Model => 0x1c031ab1 => 222
	i32 476646585, ; 75: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 263
	i32 485463106, ; 76: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 195
	i32 486930444, ; 77: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 276
	i32 489220957, ; 78: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 322
	i32 498788369, ; 79: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 80: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 194
	i32 525008092, ; 81: SkiaSharp.dll => 0x1f4afcdc => 215
	i32 526420162, ; 82: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 83: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 312
	i32 530272170, ; 84: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 85: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 343
	i32 539058512, ; 86: Microsoft.Extensions.Logging => 0x20216150 => 190
	i32 540030774, ; 87: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 88: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 89: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 90: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 91: Jsr305Binding => 0x213954e7 => 301
	i32 569601784, ; 92: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 299
	i32 577335427, ; 93: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 597488923, ; 94: CommunityToolkit.Maui => 0x239cf51b => 174
	i32 601371474, ; 95: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 96: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 97: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 98: Xamarin.AndroidX.CustomView => 0x2568904f => 253
	i32 627931235, ; 99: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 335
	i32 639843206, ; 100: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 259
	i32 643868501, ; 101: System.Net => 0x2660a755 => 81
	i32 662205335, ; 102: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 103: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 295
	i32 666292255, ; 104: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 240
	i32 672442732, ; 105: System.Collections.Concurrent => 0x2814a96c => 8
	i32 680049820, ; 106: Mapsui.Rendering.Skia.dll => 0x2888bc9c => 183
	i32 683518922, ; 107: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 108: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 109: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 314
	i32 693804605, ; 110: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 111: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 112: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 309
	i32 700358131, ; 113: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 114: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 313
	i32 722857257, ; 115: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 116: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 117: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 118: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 230
	i32 759454413, ; 119: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 120: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 121: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 122: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 341
	i32 778756650, ; 123: SkiaSharp.HarfBuzz.dll => 0x2e6ae22a => 216
	i32 789151979, ; 124: Microsoft.Extensions.Options => 0x2f0980eb => 193
	i32 790371945, ; 125: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 254
	i32 804715423, ; 126: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 127: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 268
	i32 823281589, ; 128: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 129: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 130: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 131: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 132: Xamarin.AndroidX.Print => 0x3246f6cd => 281
	i32 864169614, ; 133: Plainer.Maui => 0x33822e8e => 211
	i32 869139383, ; 134: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 326
	i32 873119928, ; 135: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 136: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 137: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 138: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 340
	i32 899130691, ; 139: NetTopologySuite.dll => 0x3597a543 => 207
	i32 904024072, ; 140: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 908337989, ; 141: Refit => 0x36242345 => 212
	i32 908888060, ; 142: Microsoft.Maui.Maps => 0x362c87fc => 206
	i32 911108515, ; 143: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 144: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 337
	i32 928116545, ; 145: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 304
	i32 952186615, ; 146: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 147: Newtonsoft.Json => 0x38f24a24 => 210
	i32 956575887, ; 148: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 313
	i32 961460050, ; 149: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 330
	i32 966729478, ; 150: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 302
	i32 967690846, ; 151: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 265
	i32 975236339, ; 152: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 153: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 154: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 155: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 156: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 339
	i32 992768348, ; 157: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 158: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 159: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 160: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 285
	i32 1019214401, ; 161: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 162: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 188
	i32 1031528504, ; 163: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 303
	i32 1035644815, ; 164: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 238
	i32 1036536393, ; 165: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 166: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 320
	i32 1044663988, ; 167: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 168: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 272
	i32 1067306892, ; 169: GoogleGson => 0x3f9dcf8c => 177
	i32 1082857460, ; 170: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 171: Xamarin.Kotlin.StdLib => 0x409e66d8 => 310
	i32 1098259244, ; 172: System => 0x41761b2c => 164
	i32 1108272742, ; 173: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 342
	i32 1117529484, ; 174: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 336
	i32 1118262833, ; 175: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 332
	i32 1121599056, ; 176: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 271
	i32 1122549021, ; 177: Refit.HttpClientFactory.dll => 0x42e8bd1d => 213
	i32 1127624469, ; 178: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 192
	i32 1149092582, ; 179: Xamarin.AndroidX.Window => 0x447dc2e6 => 298
	i32 1168523401, ; 180: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 338
	i32 1170634674, ; 181: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 182: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 294
	i32 1178241025, ; 183: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 279
	i32 1204270330, ; 184: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 240
	i32 1208641965, ; 185: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 186: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1243150071, ; 187: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 299
	i32 1253011324, ; 188: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 189: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 318
	i32 1264511973, ; 190: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 289
	i32 1267360935, ; 191: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 293
	i32 1273260888, ; 192: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 245
	i32 1275534314, ; 193: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 314
	i32 1278448581, ; 194: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 237
	i32 1293217323, ; 195: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 256
	i32 1308624726, ; 196: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 327
	i32 1309188875, ; 197: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1313028017, ; 198: Topten.RichTextKit => 0x4e4337b1 => 225
	i32 1322716291, ; 199: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 298
	i32 1324164729, ; 200: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 201: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 202: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 347
	i32 1364015309, ; 203: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 204: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 348
	i32 1376866003, ; 205: Xamarin.AndroidX.SavedState => 0x52114ed3 => 285
	i32 1379779777, ; 206: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1388087747, ; 207: Mapsui.dll => 0x52bc89c3 => 180
	i32 1402170036, ; 208: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 209: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 249
	i32 1408764838, ; 210: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 211: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 212: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1422967952, ; 213: Mapsui.Tiling.dll => 0x54d0c490 => 184
	i32 1430672901, ; 214: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 316
	i32 1434145427, ; 215: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 216: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 302
	i32 1439761251, ; 217: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1443938015, ; 218: NetTopologySuite => 0x5610bedf => 207
	i32 1452070440, ; 219: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 220: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 221: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 222: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 223: System.IdentityModel.Tokens.Jwt => 0x57137723 => 224
	i32 1461004990, ; 224: es\Microsoft.Maui.Controls.resources => 0x57152abe => 322
	i32 1461234159, ; 225: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 226: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 227: System.IO.Compression.dll => 0x57261233 => 46
	i32 1462944030, ; 228: InputKit.Maui => 0x5732c11e => 179
	i32 1469204771, ; 229: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 239
	i32 1470490898, ; 230: Microsoft.Extensions.Primitives => 0x57a5e912 => 194
	i32 1479771757, ; 231: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 232: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 233: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 234: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 286
	i32 1498168481, ; 235: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 196
	i32 1505131794, ; 236: Microsoft.Extensions.Http => 0x59b67d12 => 189
	i32 1526286932, ; 237: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 346
	i32 1536373174, ; 238: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 239: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 240: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 241: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565862583, ; 242: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 243: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 244: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 245: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 246: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 255
	i32 1592978981, ; 247: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 248: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 303
	i32 1600541741, ; 249: ShimSkiaSharp => 0x5f66542d => 214
	i32 1601112923, ; 250: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 251: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 252: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 253: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 275
	i32 1622358360, ; 254: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1623212457, ; 255: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 218
	i32 1624863272, ; 256: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 297
	i32 1634654947, ; 257: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 175
	i32 1635184631, ; 258: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 259
	i32 1636350590, ; 259: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 252
	i32 1639515021, ; 260: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 261: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 262: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 263: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 264: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 291
	i32 1658251792, ; 265: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 300
	i32 1670060433, ; 266: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 247
	i32 1672364457, ; 267: NetTopologySuite.IO.GeoJSON4STJ.dll => 0x63ae41a9 => 209
	i32 1675553242, ; 268: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 269: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 270: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 271: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 272: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 273: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 274: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 311
	i32 1701541528, ; 275: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 276: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 268
	i32 1726116996, ; 277: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 278: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 279: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 243
	i32 1743415430, ; 280: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 317
	i32 1744735666, ; 281: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 282: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 283: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 284: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 285: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 286: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 287: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 290
	i32 1770582343, ; 288: Microsoft.Extensions.Logging.dll => 0x6988f147 => 190
	i32 1776026572, ; 289: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 290: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 291: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 292: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 333
	i32 1788241197, ; 293: Xamarin.AndroidX.Fragment => 0x6a96652d => 261
	i32 1793755602, ; 294: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 325
	i32 1808330690, ; 295: UraniumUI.Icons.FontAwesome.dll => 0x6bc8efc2 => 227
	i32 1808609942, ; 296: Xamarin.AndroidX.Loader => 0x6bcd3296 => 275
	i32 1813058853, ; 297: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 310
	i32 1813201214, ; 298: Xamarin.Google.Android.Material => 0x6c13413e => 300
	i32 1818569960, ; 299: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 280
	i32 1818787751, ; 300: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 301: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 302: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 303: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 191
	i32 1839733746, ; 304: Mapsui.Nts.dll => 0x6da81bf2 => 182
	i32 1847515442, ; 305: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 230
	i32 1853025655, ; 306: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 342
	i32 1858542181, ; 307: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 308: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 309: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 324
	i32 1879696579, ; 310: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 311: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 241
	i32 1888955245, ; 312: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 313: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 314: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 318
	i32 1898237753, ; 315: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 316: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1908813208, ; 317: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 306
	i32 1910275211, ; 318: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 319: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 320: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 329
	i32 1956758971, ; 321: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 322: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 287
	i32 1968388702, ; 323: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 185
	i32 1981205650, ; 324: MauiAppVTC.dll => 0x7616cc92 => 0
	i32 1983156543, ; 325: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 311
	i32 1985761444, ; 326: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 232
	i32 1986222447, ; 327: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 198
	i32 2003115576, ; 328: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 321
	i32 2011961780, ; 329: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 330: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 272
	i32 2031763787, ; 331: Xamarin.Android.Glide => 0x791a414b => 229
	i32 2045470958, ; 332: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 333: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 267
	i32 2060060697, ; 334: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 335: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 320
	i32 2070888862, ; 336: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 337: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2089259565, ; 338: UraniumUI.dll => 0x7c87922d => 226
	i32 2090596640, ; 339: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 340: System.Console => 0x7ec9ffe9 => 20
	i32 2129483829, ; 341: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 305
	i32 2142473426, ; 342: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 343: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 344: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 345: Microsoft.Maui => 0x80bd55ad => 203
	i32 2169148018, ; 346: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 328
	i32 2181898931, ; 347: Microsoft.Extensions.Options.dll => 0x820d22b3 => 193
	i32 2192057212, ; 348: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 191
	i32 2193016926, ; 349: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 350: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 315
	i32 2201231467, ; 351: System.Net.Http => 0x8334206b => 64
	i32 2204407019, ; 352: MauiAppVTC => 0x836494eb => 0
	i32 2207618523, ; 353: it\Microsoft.Maui.Controls.resources => 0x839595db => 330
	i32 2217644978, ; 354: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 294
	i32 2222056684, ; 355: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 356: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 276
	i32 2252106437, ; 357: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 358: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 359: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 360: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 186
	i32 2267999099, ; 361: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 231
	i32 2279755925, ; 362: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 283
	i32 2293034957, ; 363: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 364: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 365: System.Net.Mail => 0x88ffe49e => 66
	i32 2303073227, ; 366: Microsoft.Maui.Controls.Maps.dll => 0x89461bcb => 201
	i32 2303942373, ; 367: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 334
	i32 2305521784, ; 368: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 369: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 235
	i32 2320631194, ; 370: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2327893114, ; 371: ExCSS.dll => 0x8ac0d47a => 176
	i32 2340441535, ; 372: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 373: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 374: System.Net.Primitives => 0x8c40e0db => 70
	i32 2364201794, ; 375: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 220
	i32 2366048013, ; 376: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 328
	i32 2368005991, ; 377: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 378: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 197
	i32 2371007202, ; 379: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 185
	i32 2378619854, ; 380: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 381: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 382: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 329
	i32 2401565422, ; 383: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 384: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 258
	i32 2421380589, ; 385: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 386: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 245
	i32 2427813419, ; 387: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 326
	i32 2435356389, ; 388: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 389: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2439473040, ; 390: InputKit.Maui.dll => 0x91676790 => 179
	i32 2454642406, ; 391: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 392: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 393: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 394: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 248
	i32 2471841756, ; 395: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 396: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 397: Microsoft.Maui.Controls => 0x93dba8a1 => 200
	i32 2483903535, ; 398: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 399: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 400: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 401: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 402: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 332
	i32 2505896520, ; 403: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 270
	i32 2521915375, ; 404: SkiaSharp.Views.Maui.Controls.Compatibility => 0x96515fef => 219
	i32 2522472828, ; 405: Xamarin.Android.Glide.dll => 0x9659e17c => 229
	i32 2523023297, ; 406: Svg.Custom.dll => 0x966247c1 => 221
	i32 2538310050, ; 407: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 408: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 327
	i32 2562349572, ; 409: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 410: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 411: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 331
	i32 2577414832, ; 412: Mapsui.Nts => 0x99a03ab0 => 182
	i32 2581783588, ; 413: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 271
	i32 2581819634, ; 414: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 293
	i32 2585220780, ; 415: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 416: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 417: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 418: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 336
	i32 2602257211, ; 419: Svg.Model.dll => 0x9b1b4b3b => 222
	i32 2605712449, ; 420: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 315
	i32 2609324236, ; 421: Svg.Custom => 0x9b8720cc => 221
	i32 2615233544, ; 422: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 262
	i32 2616218305, ; 423: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 192
	i32 2617129537, ; 424: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 425: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 426: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 252
	i32 2624644809, ; 427: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 257
	i32 2625339995, ; 428: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 220
	i32 2626831493, ; 429: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 331
	i32 2627185994, ; 430: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 431: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 432: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 266
	i32 2640290731, ; 433: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 197
	i32 2663391936, ; 434: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 231
	i32 2663698177, ; 435: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 436: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 437: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 438: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 439: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 440: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 441: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 291
	i32 2715334215, ; 442: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 443: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 444: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 445: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 446: Xamarin.AndroidX.Activity => 0xa2e0939b => 233
	i32 2735172069, ; 447: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 448: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 239
	i32 2740698338, ; 449: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 317
	i32 2740948882, ; 450: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 451: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 452: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 337
	i32 2756874198, ; 453: NetTopologySuite.IO.GeoJSON4STJ => 0xa4528fd6 => 209
	i32 2758225723, ; 454: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 202
	i32 2764765095, ; 455: Microsoft.Maui.dll => 0xa4caf7a7 => 203
	i32 2765824710, ; 456: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 457: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 309
	i32 2778768386, ; 458: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 296
	i32 2779977773, ; 459: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 284
	i32 2785988530, ; 460: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 343
	i32 2788224221, ; 461: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 262
	i32 2795602088, ; 462: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 217
	i32 2801831435, ; 463: Microsoft.Maui.Graphics => 0xa7008e0b => 205
	i32 2803228030, ; 464: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 465: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 249
	i32 2819470561, ; 466: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 467: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 468: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 284
	i32 2824502124, ; 469: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2838993487, ; 470: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 273
	i32 2847418871, ; 471: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 305
	i32 2849599387, ; 472: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 473: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 296
	i32 2855708567, ; 474: Xamarin.AndroidX.Transition => 0xaa36a797 => 292
	i32 2861098320, ; 475: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 476: Microsoft.Maui.Essentials => 0xaa8a4878 => 204
	i32 2863996930, ; 477: UraniumUI.Material.dll => 0xaab52002 => 228
	i32 2868488919, ; 478: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 175
	i32 2870099610, ; 479: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 234
	i32 2875164099, ; 480: Jsr305Binding.dll => 0xab5f85c3 => 301
	i32 2875220617, ; 481: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 482: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 260
	i32 2887636118, ; 483: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 484: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 485: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 486: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 487: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 488: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2912489636, ; 489: SkiaSharp.Views.Android => 0xad9910a4 => 217
	i32 2916838712, ; 490: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 297
	i32 2919462931, ; 491: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 492: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 236
	i32 2936416060, ; 493: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 494: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 495: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 496: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 497: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 498: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 499: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 256
	i32 2987532451, ; 500: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 287
	i32 2996846495, ; 501: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 269
	i32 3016983068, ; 502: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 289
	i32 3017076677, ; 503: Xamarin.GooglePlayServices.Maps => 0xb3d4efc5 => 307
	i32 3023353419, ; 504: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 505: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 264
	i32 3038032645, ; 506: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 350
	i32 3053864966, ; 507: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 323
	i32 3056245963, ; 508: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 286
	i32 3057625584, ; 509: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 277
	i32 3058099980, ; 510: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 308
	i32 3059408633, ; 511: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 512: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 513: System.Threading.Tasks => 0xb755818f => 144
	i32 3084678329, ; 514: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 198
	i32 3090735792, ; 515: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 516: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 517: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 518: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 519: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 520: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 521: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3134694676, ; 522: ShimSkiaSharp.dll => 0xbad7a514 => 214
	i32 3147165239, ; 523: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 524: GoogleGson.dll => 0xbba64c02 => 177
	i32 3159123045, ; 525: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 526: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 527: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 278
	i32 3192346100, ; 528: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 529: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 530: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 531: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 532: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 255
	i32 3220365878, ; 533: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 534: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3230466174, ; 535: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 306
	i32 3251039220, ; 536: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 537: Xamarin.AndroidX.CardView => 0xc235e84d => 243
	i32 3265493905, ; 538: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 539: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 540: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3278552754, ; 541: Mapsui => 0xc36abeb2 => 180
	i32 3279906254, ; 542: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 543: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 544: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 545: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 546: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 547: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 323
	i32 3312457198, ; 548: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 196
	i32 3316684772, ; 549: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 550: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 253
	i32 3317144872, ; 551: System.Data => 0xc5b79d28 => 24
	i32 3340387945, ; 552: SkiaSharp => 0xc71a4669 => 215
	i32 3340431453, ; 553: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 241
	i32 3345895724, ; 554: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 282
	i32 3346324047, ; 555: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 279
	i32 3357674450, ; 556: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 340
	i32 3358260929, ; 557: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 558: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 234
	i32 3362522851, ; 559: Xamarin.AndroidX.Core => 0xc86c06e3 => 250
	i32 3366347497, ; 560: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 561: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 283
	i32 3381016424, ; 562: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 319
	i32 3395150330, ; 563: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 564: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 565: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 254
	i32 3428513518, ; 566: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 187
	i32 3429136800, ; 567: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 568: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 569: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 257
	i32 3445260447, ; 570: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 571: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 199
	i32 3458724246, ; 572: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 338
	i32 3459815001, ; 573: Mapsui.Rendering.Skia => 0xce389659 => 183
	i32 3466574376, ; 574: SkiaSharp.Views.Maui.Controls.Compatibility.dll => 0xce9fba28 => 219
	i32 3471940407, ; 575: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3473156932, ; 576: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 218
	i32 3476120550, ; 577: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 578: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 339
	i32 3485117614, ; 579: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 580: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 581: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 246
	i32 3500773090, ; 582: Microsoft.Maui.Controls.Maps => 0xd0a98ee2 => 201
	i32 3509114376, ; 583: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 584: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 585: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 586: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 587: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 588: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 589: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 347
	i32 3592228221, ; 590: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 349
	i32 3597029428, ; 591: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 232
	i32 3598340787, ; 592: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 593: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 594: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 595: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 281
	i32 3633644679, ; 596: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 236
	i32 3638274909, ; 597: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 598: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 267
	i32 3643446276, ; 599: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 344
	i32 3643854240, ; 600: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 278
	i32 3645089577, ; 601: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 602: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 186
	i32 3660523487, ; 603: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 604: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 605: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 242
	i32 3684561358, ; 606: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 246
	i32 3700591436, ; 607: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 195
	i32 3700866549, ; 608: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3700887674, ; 609: Plainer.Maui.dll => 0xdc97107a => 211
	i32 3706696989, ; 610: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 251
	i32 3712156464, ; 611: Mapsui.UI.Maui.dll => 0xdd430330 => 181
	i32 3716563718, ; 612: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 613: Xamarin.AndroidX.Annotation => 0xdda814c6 => 235
	i32 3724971120, ; 614: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 277
	i32 3732100267, ; 615: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 616: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 617: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 618: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 619: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 319
	i32 3786282454, ; 620: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 244
	i32 3792276235, ; 621: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3792835768, ; 622: HarfBuzzSharp => 0xe21214b8 => 178
	i32 3798102808, ; 623: BruTile => 0xe2627318 => 173
	i32 3800979733, ; 624: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 199
	i32 3802395368, ; 625: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 626: CommunityToolkit.Maui.dll => 0xe3886bf7 => 174
	i32 3819260425, ; 627: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 628: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 629: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 630: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 188
	i32 3844307129, ; 631: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 632: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 633: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 634: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 635: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 636: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 637: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 292
	i32 3888767677, ; 638: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 282
	i32 3896106733, ; 639: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 640: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 250
	i32 3901907137, ; 641: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 642: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 335
	i32 3920810846, ; 643: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 644: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 295
	i32 3928044579, ; 645: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 646: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 647: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 280
	i32 3934069706, ; 648: Topten.RichTextKit.dll => 0xea7d23ca => 225
	i32 3945713374, ; 649: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3952289091, ; 650: NetTopologySuite.Features.dll => 0xeb932543 => 208
	i32 3953583589, ; 651: Svg.Skia => 0xeba6e5e5 => 223
	i32 3953953790, ; 652: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 653: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 238
	i32 3959773229, ; 654: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 269
	i32 3970018735, ; 655: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 308
	i32 4003436829, ; 656: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4003906742, ; 657: HarfBuzzSharp.dll => 0xeea6c4b6 => 178
	i32 4013003792, ; 658: BruTile.dll => 0xef319410 => 173
	i32 4015948917, ; 659: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 237
	i32 4022681963, ; 660: Mapsui.Tiling => 0xefc5416b => 184
	i32 4025784931, ; 661: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 662: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 202
	i32 4054681211, ; 663: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4066802364, ; 664: SkiaSharp.HarfBuzz => 0xf2667abc => 216
	i32 4068434129, ; 665: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 666: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 667: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 321
	i32 4094352644, ; 668: Microsoft.Maui.Essentials.dll => 0xf40add04 => 204
	i32 4099507663, ; 669: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 670: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 671: Xamarin.AndroidX.Emoji2 => 0xf479582c => 258
	i32 4103439459, ; 672: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 345
	i32 4126470640, ; 673: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 187
	i32 4127667938, ; 674: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 675: System.AppContext => 0xf6318da0 => 6
	i32 4144557198, ; 676: NetTopologySuite.Features => 0xf708ec8e => 208
	i32 4144683026, ; 677: Refit.dll => 0xf70ad812 => 212
	i32 4147896353, ; 678: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4148203663, ; 679: UraniumUI.Icons.FontAwesome => 0xf740908f => 227
	i32 4150914736, ; 680: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 345
	i32 4151237749, ; 681: System.Core => 0xf76edc75 => 21
	i32 4156770220, ; 682: UraniumUI => 0xf7c347ac => 226
	i32 4159265925, ; 683: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 684: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 685: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 686: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 687: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 274
	i32 4185676441, ; 688: System.Security => 0xf97c5a99 => 130
	i32 4190991637, ; 689: Microsoft.Maui.Maps.dll => 0xf9cd7515 => 206
	i32 4196529839, ; 690: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 691: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 692: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 334
	i32 4256097574, ; 693: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 251
	i32 4258378803, ; 694: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 273
	i32 4260525087, ; 695: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 696: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 224
	i32 4271975918, ; 697: Microsoft.Maui.Controls.dll => 0xfea12dee => 200
	i32 4274976490, ; 698: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4278134329, ; 699: Xamarin.GooglePlayServices.Maps.dll => 0xfeff2639 => 307
	i32 4292120959, ; 700: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 274
	i32 4294763496 ; 701: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 260
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [702 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 270, ; 3
	i32 304, ; 4
	i32 48, ; 5
	i32 316, ; 6
	i32 210, ; 7
	i32 80, ; 8
	i32 325, ; 9
	i32 145, ; 10
	i32 30, ; 11
	i32 349, ; 12
	i32 124, ; 13
	i32 205, ; 14
	i32 102, ; 15
	i32 333, ; 16
	i32 288, ; 17
	i32 107, ; 18
	i32 288, ; 19
	i32 139, ; 20
	i32 228, ; 21
	i32 312, ; 22
	i32 348, ; 23
	i32 341, ; 24
	i32 77, ; 25
	i32 223, ; 26
	i32 124, ; 27
	i32 13, ; 28
	i32 244, ; 29
	i32 132, ; 30
	i32 290, ; 31
	i32 151, ; 32
	i32 18, ; 33
	i32 242, ; 34
	i32 26, ; 35
	i32 264, ; 36
	i32 1, ; 37
	i32 59, ; 38
	i32 42, ; 39
	i32 91, ; 40
	i32 247, ; 41
	i32 147, ; 42
	i32 213, ; 43
	i32 266, ; 44
	i32 263, ; 45
	i32 54, ; 46
	i32 189, ; 47
	i32 181, ; 48
	i32 69, ; 49
	i32 346, ; 50
	i32 233, ; 51
	i32 83, ; 52
	i32 324, ; 53
	i32 265, ; 54
	i32 131, ; 55
	i32 55, ; 56
	i32 149, ; 57
	i32 74, ; 58
	i32 145, ; 59
	i32 62, ; 60
	i32 146, ; 61
	i32 350, ; 62
	i32 165, ; 63
	i32 344, ; 64
	i32 248, ; 65
	i32 12, ; 66
	i32 261, ; 67
	i32 125, ; 68
	i32 152, ; 69
	i32 113, ; 70
	i32 176, ; 71
	i32 166, ; 72
	i32 164, ; 73
	i32 222, ; 74
	i32 263, ; 75
	i32 195, ; 76
	i32 276, ; 77
	i32 322, ; 78
	i32 84, ; 79
	i32 194, ; 80
	i32 215, ; 81
	i32 150, ; 82
	i32 312, ; 83
	i32 60, ; 84
	i32 343, ; 85
	i32 190, ; 86
	i32 51, ; 87
	i32 103, ; 88
	i32 114, ; 89
	i32 40, ; 90
	i32 301, ; 91
	i32 299, ; 92
	i32 120, ; 93
	i32 174, ; 94
	i32 52, ; 95
	i32 44, ; 96
	i32 119, ; 97
	i32 253, ; 98
	i32 335, ; 99
	i32 259, ; 100
	i32 81, ; 101
	i32 136, ; 102
	i32 295, ; 103
	i32 240, ; 104
	i32 8, ; 105
	i32 183, ; 106
	i32 73, ; 107
	i32 155, ; 108
	i32 314, ; 109
	i32 154, ; 110
	i32 92, ; 111
	i32 309, ; 112
	i32 45, ; 113
	i32 313, ; 114
	i32 109, ; 115
	i32 129, ; 116
	i32 25, ; 117
	i32 230, ; 118
	i32 72, ; 119
	i32 55, ; 120
	i32 46, ; 121
	i32 341, ; 122
	i32 216, ; 123
	i32 193, ; 124
	i32 254, ; 125
	i32 22, ; 126
	i32 268, ; 127
	i32 86, ; 128
	i32 43, ; 129
	i32 160, ; 130
	i32 71, ; 131
	i32 281, ; 132
	i32 211, ; 133
	i32 326, ; 134
	i32 3, ; 135
	i32 42, ; 136
	i32 63, ; 137
	i32 340, ; 138
	i32 207, ; 139
	i32 16, ; 140
	i32 212, ; 141
	i32 206, ; 142
	i32 53, ; 143
	i32 337, ; 144
	i32 304, ; 145
	i32 105, ; 146
	i32 210, ; 147
	i32 313, ; 148
	i32 330, ; 149
	i32 302, ; 150
	i32 265, ; 151
	i32 34, ; 152
	i32 158, ; 153
	i32 85, ; 154
	i32 32, ; 155
	i32 339, ; 156
	i32 12, ; 157
	i32 51, ; 158
	i32 56, ; 159
	i32 285, ; 160
	i32 36, ; 161
	i32 188, ; 162
	i32 303, ; 163
	i32 238, ; 164
	i32 35, ; 165
	i32 320, ; 166
	i32 58, ; 167
	i32 272, ; 168
	i32 177, ; 169
	i32 17, ; 170
	i32 310, ; 171
	i32 164, ; 172
	i32 342, ; 173
	i32 336, ; 174
	i32 332, ; 175
	i32 271, ; 176
	i32 213, ; 177
	i32 192, ; 178
	i32 298, ; 179
	i32 338, ; 180
	i32 153, ; 181
	i32 294, ; 182
	i32 279, ; 183
	i32 240, ; 184
	i32 29, ; 185
	i32 52, ; 186
	i32 299, ; 187
	i32 5, ; 188
	i32 318, ; 189
	i32 289, ; 190
	i32 293, ; 191
	i32 245, ; 192
	i32 314, ; 193
	i32 237, ; 194
	i32 256, ; 195
	i32 327, ; 196
	i32 85, ; 197
	i32 225, ; 198
	i32 298, ; 199
	i32 61, ; 200
	i32 112, ; 201
	i32 347, ; 202
	i32 57, ; 203
	i32 348, ; 204
	i32 285, ; 205
	i32 99, ; 206
	i32 180, ; 207
	i32 19, ; 208
	i32 249, ; 209
	i32 111, ; 210
	i32 101, ; 211
	i32 102, ; 212
	i32 184, ; 213
	i32 316, ; 214
	i32 104, ; 215
	i32 302, ; 216
	i32 71, ; 217
	i32 207, ; 218
	i32 38, ; 219
	i32 32, ; 220
	i32 103, ; 221
	i32 73, ; 222
	i32 224, ; 223
	i32 322, ; 224
	i32 9, ; 225
	i32 123, ; 226
	i32 46, ; 227
	i32 179, ; 228
	i32 239, ; 229
	i32 194, ; 230
	i32 9, ; 231
	i32 43, ; 232
	i32 4, ; 233
	i32 286, ; 234
	i32 196, ; 235
	i32 189, ; 236
	i32 346, ; 237
	i32 31, ; 238
	i32 138, ; 239
	i32 92, ; 240
	i32 93, ; 241
	i32 49, ; 242
	i32 141, ; 243
	i32 112, ; 244
	i32 140, ; 245
	i32 255, ; 246
	i32 115, ; 247
	i32 303, ; 248
	i32 214, ; 249
	i32 157, ; 250
	i32 76, ; 251
	i32 79, ; 252
	i32 275, ; 253
	i32 37, ; 254
	i32 218, ; 255
	i32 297, ; 256
	i32 175, ; 257
	i32 259, ; 258
	i32 252, ; 259
	i32 64, ; 260
	i32 138, ; 261
	i32 15, ; 262
	i32 116, ; 263
	i32 291, ; 264
	i32 300, ; 265
	i32 247, ; 266
	i32 209, ; 267
	i32 48, ; 268
	i32 70, ; 269
	i32 80, ; 270
	i32 126, ; 271
	i32 94, ; 272
	i32 121, ; 273
	i32 311, ; 274
	i32 26, ; 275
	i32 268, ; 276
	i32 97, ; 277
	i32 28, ; 278
	i32 243, ; 279
	i32 317, ; 280
	i32 149, ; 281
	i32 169, ; 282
	i32 4, ; 283
	i32 98, ; 284
	i32 33, ; 285
	i32 93, ; 286
	i32 290, ; 287
	i32 190, ; 288
	i32 21, ; 289
	i32 41, ; 290
	i32 170, ; 291
	i32 333, ; 292
	i32 261, ; 293
	i32 325, ; 294
	i32 227, ; 295
	i32 275, ; 296
	i32 310, ; 297
	i32 300, ; 298
	i32 280, ; 299
	i32 2, ; 300
	i32 134, ; 301
	i32 111, ; 302
	i32 191, ; 303
	i32 182, ; 304
	i32 230, ; 305
	i32 342, ; 306
	i32 58, ; 307
	i32 95, ; 308
	i32 324, ; 309
	i32 39, ; 310
	i32 241, ; 311
	i32 25, ; 312
	i32 94, ; 313
	i32 318, ; 314
	i32 89, ; 315
	i32 99, ; 316
	i32 306, ; 317
	i32 10, ; 318
	i32 87, ; 319
	i32 329, ; 320
	i32 100, ; 321
	i32 287, ; 322
	i32 185, ; 323
	i32 0, ; 324
	i32 311, ; 325
	i32 232, ; 326
	i32 198, ; 327
	i32 321, ; 328
	i32 7, ; 329
	i32 272, ; 330
	i32 229, ; 331
	i32 88, ; 332
	i32 267, ; 333
	i32 154, ; 334
	i32 320, ; 335
	i32 33, ; 336
	i32 116, ; 337
	i32 226, ; 338
	i32 82, ; 339
	i32 20, ; 340
	i32 305, ; 341
	i32 11, ; 342
	i32 162, ; 343
	i32 3, ; 344
	i32 203, ; 345
	i32 328, ; 346
	i32 193, ; 347
	i32 191, ; 348
	i32 84, ; 349
	i32 315, ; 350
	i32 64, ; 351
	i32 0, ; 352
	i32 330, ; 353
	i32 294, ; 354
	i32 143, ; 355
	i32 276, ; 356
	i32 157, ; 357
	i32 41, ; 358
	i32 117, ; 359
	i32 186, ; 360
	i32 231, ; 361
	i32 283, ; 362
	i32 131, ; 363
	i32 75, ; 364
	i32 66, ; 365
	i32 201, ; 366
	i32 334, ; 367
	i32 172, ; 368
	i32 235, ; 369
	i32 143, ; 370
	i32 176, ; 371
	i32 106, ; 372
	i32 151, ; 373
	i32 70, ; 374
	i32 220, ; 375
	i32 328, ; 376
	i32 156, ; 377
	i32 197, ; 378
	i32 185, ; 379
	i32 121, ; 380
	i32 127, ; 381
	i32 329, ; 382
	i32 152, ; 383
	i32 258, ; 384
	i32 141, ; 385
	i32 245, ; 386
	i32 326, ; 387
	i32 20, ; 388
	i32 14, ; 389
	i32 179, ; 390
	i32 135, ; 391
	i32 75, ; 392
	i32 59, ; 393
	i32 248, ; 394
	i32 167, ; 395
	i32 168, ; 396
	i32 200, ; 397
	i32 15, ; 398
	i32 74, ; 399
	i32 6, ; 400
	i32 23, ; 401
	i32 332, ; 402
	i32 270, ; 403
	i32 219, ; 404
	i32 229, ; 405
	i32 221, ; 406
	i32 91, ; 407
	i32 327, ; 408
	i32 1, ; 409
	i32 136, ; 410
	i32 331, ; 411
	i32 182, ; 412
	i32 271, ; 413
	i32 293, ; 414
	i32 134, ; 415
	i32 69, ; 416
	i32 146, ; 417
	i32 336, ; 418
	i32 222, ; 419
	i32 315, ; 420
	i32 221, ; 421
	i32 262, ; 422
	i32 192, ; 423
	i32 88, ; 424
	i32 96, ; 425
	i32 252, ; 426
	i32 257, ; 427
	i32 220, ; 428
	i32 331, ; 429
	i32 31, ; 430
	i32 45, ; 431
	i32 266, ; 432
	i32 197, ; 433
	i32 231, ; 434
	i32 109, ; 435
	i32 158, ; 436
	i32 35, ; 437
	i32 22, ; 438
	i32 114, ; 439
	i32 57, ; 440
	i32 291, ; 441
	i32 144, ; 442
	i32 118, ; 443
	i32 120, ; 444
	i32 110, ; 445
	i32 233, ; 446
	i32 139, ; 447
	i32 239, ; 448
	i32 317, ; 449
	i32 54, ; 450
	i32 105, ; 451
	i32 337, ; 452
	i32 209, ; 453
	i32 202, ; 454
	i32 203, ; 455
	i32 133, ; 456
	i32 309, ; 457
	i32 296, ; 458
	i32 284, ; 459
	i32 343, ; 460
	i32 262, ; 461
	i32 217, ; 462
	i32 205, ; 463
	i32 159, ; 464
	i32 249, ; 465
	i32 163, ; 466
	i32 132, ; 467
	i32 284, ; 468
	i32 161, ; 469
	i32 273, ; 470
	i32 305, ; 471
	i32 140, ; 472
	i32 296, ; 473
	i32 292, ; 474
	i32 169, ; 475
	i32 204, ; 476
	i32 228, ; 477
	i32 175, ; 478
	i32 234, ; 479
	i32 301, ; 480
	i32 40, ; 481
	i32 260, ; 482
	i32 81, ; 483
	i32 56, ; 484
	i32 37, ; 485
	i32 97, ; 486
	i32 166, ; 487
	i32 172, ; 488
	i32 217, ; 489
	i32 297, ; 490
	i32 82, ; 491
	i32 236, ; 492
	i32 98, ; 493
	i32 30, ; 494
	i32 159, ; 495
	i32 18, ; 496
	i32 127, ; 497
	i32 119, ; 498
	i32 256, ; 499
	i32 287, ; 500
	i32 269, ; 501
	i32 289, ; 502
	i32 307, ; 503
	i32 165, ; 504
	i32 264, ; 505
	i32 350, ; 506
	i32 323, ; 507
	i32 286, ; 508
	i32 277, ; 509
	i32 308, ; 510
	i32 170, ; 511
	i32 16, ; 512
	i32 144, ; 513
	i32 198, ; 514
	i32 125, ; 515
	i32 118, ; 516
	i32 38, ; 517
	i32 115, ; 518
	i32 47, ; 519
	i32 142, ; 520
	i32 117, ; 521
	i32 214, ; 522
	i32 34, ; 523
	i32 177, ; 524
	i32 95, ; 525
	i32 53, ; 526
	i32 278, ; 527
	i32 129, ; 528
	i32 153, ; 529
	i32 24, ; 530
	i32 161, ; 531
	i32 255, ; 532
	i32 148, ; 533
	i32 104, ; 534
	i32 306, ; 535
	i32 89, ; 536
	i32 243, ; 537
	i32 60, ; 538
	i32 142, ; 539
	i32 100, ; 540
	i32 180, ; 541
	i32 5, ; 542
	i32 13, ; 543
	i32 122, ; 544
	i32 135, ; 545
	i32 28, ; 546
	i32 323, ; 547
	i32 196, ; 548
	i32 72, ; 549
	i32 253, ; 550
	i32 24, ; 551
	i32 215, ; 552
	i32 241, ; 553
	i32 282, ; 554
	i32 279, ; 555
	i32 340, ; 556
	i32 137, ; 557
	i32 234, ; 558
	i32 250, ; 559
	i32 168, ; 560
	i32 283, ; 561
	i32 319, ; 562
	i32 101, ; 563
	i32 123, ; 564
	i32 254, ; 565
	i32 187, ; 566
	i32 163, ; 567
	i32 167, ; 568
	i32 257, ; 569
	i32 39, ; 570
	i32 199, ; 571
	i32 338, ; 572
	i32 183, ; 573
	i32 219, ; 574
	i32 17, ; 575
	i32 218, ; 576
	i32 171, ; 577
	i32 339, ; 578
	i32 137, ; 579
	i32 150, ; 580
	i32 246, ; 581
	i32 201, ; 582
	i32 155, ; 583
	i32 130, ; 584
	i32 19, ; 585
	i32 65, ; 586
	i32 147, ; 587
	i32 47, ; 588
	i32 347, ; 589
	i32 349, ; 590
	i32 232, ; 591
	i32 79, ; 592
	i32 61, ; 593
	i32 106, ; 594
	i32 281, ; 595
	i32 236, ; 596
	i32 49, ; 597
	i32 267, ; 598
	i32 344, ; 599
	i32 278, ; 600
	i32 14, ; 601
	i32 186, ; 602
	i32 68, ; 603
	i32 171, ; 604
	i32 242, ; 605
	i32 246, ; 606
	i32 195, ; 607
	i32 78, ; 608
	i32 211, ; 609
	i32 251, ; 610
	i32 181, ; 611
	i32 108, ; 612
	i32 235, ; 613
	i32 277, ; 614
	i32 67, ; 615
	i32 63, ; 616
	i32 27, ; 617
	i32 160, ; 618
	i32 319, ; 619
	i32 244, ; 620
	i32 10, ; 621
	i32 178, ; 622
	i32 173, ; 623
	i32 199, ; 624
	i32 11, ; 625
	i32 174, ; 626
	i32 78, ; 627
	i32 126, ; 628
	i32 83, ; 629
	i32 188, ; 630
	i32 66, ; 631
	i32 107, ; 632
	i32 65, ; 633
	i32 128, ; 634
	i32 122, ; 635
	i32 77, ; 636
	i32 292, ; 637
	i32 282, ; 638
	i32 8, ; 639
	i32 250, ; 640
	i32 2, ; 641
	i32 335, ; 642
	i32 44, ; 643
	i32 295, ; 644
	i32 156, ; 645
	i32 128, ; 646
	i32 280, ; 647
	i32 225, ; 648
	i32 23, ; 649
	i32 208, ; 650
	i32 223, ; 651
	i32 133, ; 652
	i32 238, ; 653
	i32 269, ; 654
	i32 308, ; 655
	i32 29, ; 656
	i32 178, ; 657
	i32 173, ; 658
	i32 237, ; 659
	i32 184, ; 660
	i32 62, ; 661
	i32 202, ; 662
	i32 90, ; 663
	i32 216, ; 664
	i32 87, ; 665
	i32 148, ; 666
	i32 321, ; 667
	i32 204, ; 668
	i32 36, ; 669
	i32 86, ; 670
	i32 258, ; 671
	i32 345, ; 672
	i32 187, ; 673
	i32 50, ; 674
	i32 6, ; 675
	i32 208, ; 676
	i32 212, ; 677
	i32 90, ; 678
	i32 227, ; 679
	i32 345, ; 680
	i32 21, ; 681
	i32 226, ; 682
	i32 162, ; 683
	i32 96, ; 684
	i32 50, ; 685
	i32 113, ; 686
	i32 274, ; 687
	i32 130, ; 688
	i32 206, ; 689
	i32 76, ; 690
	i32 27, ; 691
	i32 334, ; 692
	i32 251, ; 693
	i32 273, ; 694
	i32 7, ; 695
	i32 224, ; 696
	i32 200, ; 697
	i32 110, ; 698
	i32 307, ; 699
	i32 274, ; 700
	i32 260 ; 701
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

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
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

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
