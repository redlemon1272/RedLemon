-------------------------------------
Translated Report (Full Report Below)
-------------------------------------
Process:             RedLemon [57324]
Path:                /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:          com.redlemon.app
Version:             v1.0.182 (182)
Code Type:           ARM-64 (Native)
Role:                Foreground
Parent Process:      Exited process [54303]
Coalition:           com.microsoft.VSCode [2756]
Responsible Process: Electron [6301]
User ID:             502

Date/Time:           2026-01-31 14:23:15.1122 -0500
Launch Time:         2026-01-31 14:22:40.3798 -0500
Hardware Model:      Mac14,2
OS Version:          macOS 26.2 (25C56)
Release Type:        User

Crash Reporter Key:  23926D48-00F6-4930-A350-2C9BC76EE1AE
Incident Identifier: 1D56421B-8A51-43A5-8DF7-3651052B901A

Sleep/Wake UUID:       95AE380F-DEA0-48B8-B769-9039112BBC91

Time Awake Since Boot: 10000 seconds
Time Since Wake:       2220 seconds

System Integrity Protection: enabled

Triggered by Thread: 33, Dispatch Queue: com.apple.root.default-qos.cooperative

Exception Type:    EXC_BAD_ACCESS (SIGSEGV)
Exception Subtype: KERN_INVALID_ADDRESS at 0x0000000000000048
Exception Codes:   0x0000000000000001, 0x0000000000000048

Termination Reason:  Namespace SIGNAL, Code 11, Segmentation fault: 11
Terminating Process: exc handler [57324]


VM Region Info: 0x48 is not in any region.  Bytes before following region: 4338810808
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      UNUSED SPACE AT START
--->  
      __TEXT                      1029d0000-104f24000    [ 37.3M] r-x/r-x SM=COW  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon

Thread 0::  Dispatch queue: com.apple.main-thread
0   libsystem_kernel.dylib        	       0x192fbec34 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x192fd1028 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x192fc798c mach_msg_overwrite + 484
3   libsystem_kernel.dylib        	       0x192fbefb4 mach_msg + 24
4   CoreFoundation                	       0x1930a0ba0 __CFRunLoopServiceMachPort + 160
5   CoreFoundation                	       0x19309f4f8 __CFRunLoopRun + 1188
6   CoreFoundation                	       0x193159e34 _CFRunLoopRunSpecificWithOptions + 532
7   HIToolbox                     	       0x19fb8f790 RunCurrentEventLoopInMode + 316
8   HIToolbox                     	       0x19fb92ab8 ReceiveNextEventCommon + 488
9   HIToolbox                     	       0x19fd1cb64 _BlockUntilNextEventMatchingListInMode + 48
10  AppKit                        	       0x1979b8b5c _DPSBlockUntilNextEventMatchingListInMode + 236
11  AppKit                        	       0x1974b2e48 _DPSNextEvent + 588
12  AppKit                        	       0x197f7dd0c -[NSApplication(NSEventRouting) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 688
13  AppKit                        	       0x197f7da18 -[NSApplication(NSEventRouting) nextEventMatchingMask:untilDate:inMode:dequeue:] + 72
14  AppKit                        	       0x1974ab780 -[NSApplication run] + 368
15  AppKit                        	       0x1974976dc NSApplicationMain + 880
16  SwiftUI                       	       0x1c70f63ec specialized runApp(_:) + 168
17  SwiftUI                       	       0x1c74afb40 runApp<A>(_:) + 112
18  SwiftUI                       	       0x1c777a1d8 static App.main() + 224
19  RedLemon                      	       0x104279128 static RedLemonApp.$main() + 40
20  RedLemon                      	       0x1042791d4 RedLemon_main + 12
21  dyld                          	       0x192c39d54 start + 7184

Thread 1::  Dispatch queue: com.apple.root.default-qos.cooperative
0   libsystem_kernel.dylib        	       0x192fbec34 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x192fd1028 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x192fc798c mach_msg_overwrite + 484
3   libsystem_kernel.dylib        	       0x192fbefb4 mach_msg + 24
4   IOKit                         	       0x19734aa84 io_pm_assertion_retain_release + 180
5   IOKit                         	       0x197346124 IOPMAssertionRelease + 164
6   Foundation                    	       0x195287118 -[_NSActivityAssertion _endFromDealloc:] + 236
7   RedLemon                      	       0x1040ae308 MPVPlaybackService.updateIsPlaying(_:) + 1156 (PlaybackService.swift:179)
8   RedLemon                      	       0x1040ab88c closure #1 in MPVPlaybackService.setupObservers() + 48 (PlaybackService.swift:125)
9   RedLemon                      	       0x1040aba41 partial apply for closure #1 in MPVPlaybackService.setupObservers() + 1
10  RedLemon                      	       0x102af6435 thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A) + 1
11  RedLemon                      	       0x103974f65 partial apply for thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A) + 1
12  libswift_Concurrency.dylib    	       0x28e8ef2fd completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*) + 1

Thread 2::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108777f40 wait_wakeup + 216
3   libmpv.2.dylib                	       0x1087787ac mpv_wait_event + 464
4   RedLemon                      	       0x103fc0824 MPVWrapper.pollEvents() + 180 (MPVWrapper.swift:367)
5   RedLemon                      	       0x103fb7621 closure #1 in MPVWrapper.setupVideo(in:) + 1 (MPVWrapper.swift:163)
6   RedLemon                      	       0x103fb777d partial apply for closure #1 in MPVWrapper.setupVideo(in:) + 1
7   RedLemon                      	       0x102af6435 thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A) + 1
8   RedLemon                      	       0x102af65a1 partial apply for thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A) + 1
9   libswift_Concurrency.dylib    	       0x28e8ef2fd completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*) + 1

Thread 3::  Dispatch queue: com.apple.root.background-qos.cooperative
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108762eac mp_dispatch_lock + 196
3   libmpv.2.dylib                	       0x108778204 mp_destroy_client + 648
4   RedLemon                      	       0x103fdce54 closure #1 in MPVWrapper.destroy() + 280 (MPVWrapper.swift:1547)
5   RedLemon                      	       0x103fdd135 partial apply for closure #1 in MPVWrapper.destroy() + 1
6   RedLemon                      	       0x102af6435 thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A) + 1
7   RedLemon                      	       0x103974f65 partial apply for thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A) + 1
8   libswift_Concurrency.dylib    	       0x28e8ef2fd completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*) + 1

Thread 4:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	       0x192fbec34 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x192fd1028 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x192fc798c mach_msg_overwrite + 484
3   libsystem_kernel.dylib        	       0x192fbefb4 mach_msg + 24
4   CoreFoundation                	       0x1930a0ba0 __CFRunLoopServiceMachPort + 160
5   CoreFoundation                	       0x19309f4f8 __CFRunLoopRun + 1188
6   CoreFoundation                	       0x193159e34 _CFRunLoopRunSpecificWithOptions + 532
7   AppKit                        	       0x197542a34 _NSEventThread + 184
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 5:

Thread 6::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libcorecrypto.dylib           	       0x192d4f5a0 ccn_mux + 88
1   libcorecrypto.dylib           	       0x192db98f4 ge_cmov + 80
2   libcorecrypto.dylib           	       0x192db9804 ge_select + 272
3   libcorecrypto.dylib           	       0x192db8314 ge_scalarmult_base_internal + 228
4   libcorecrypto.dylib           	       0x192db8508 ge_scalarmult_base_masked + 172
5   libcorecrypto.dylib           	       0x192dc41ac cced25519_sign_internal + 400
6   libcorecrypto.dylib           	       0x192dc3fe8 cced25519_sign_with_rng_internal + 276
7   libcorecrypto.dylib           	       0x192dc4354 cced25519_sign + 84
8   CryptoKit                     	       0x1e7b2a668 0x1e7b07000 + 145000
9   CryptoKit                     	       0x1e7b2a1f4 0x1e7b07000 + 143860
10  CryptoKit                     	       0x1e7b11540 0x1e7b07000 + 42304
11  RedLemon                      	       0x103b3d2a0 CryptoManager.sign(message:privateKeyBase64:) + 828 (CryptoManager.swift:33)
12  RedLemon                      	       0x1046636b0 SupabaseClient.makeRequest(path:method:body:query:headers:useEphemeralSession:sign:isFunction:) + 2260 (SupabaseClient.swift:268)
13  RedLemon                      	       0x1046db571 SupabaseClient.syncWatchHistoryItem(_:) + 1 (SupabaseClient.swift:3182)
14  RedLemon                      	       0x104175ec1 closure #2 in PlayerViewModel.saveToWatchHistory(timestamp:duration:force:) + 1 (PlayerViewModel.swift:2163)
15  RedLemon                      	       0x104178ed1 partial apply for closure #2 in PlayerViewModel.saveToWatchHistory(timestamp:duration:force:) + 1
16  RedLemon                      	       0x102af6435 thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A) + 1
17  RedLemon                      	       0x102af65a1 partial apply for thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A) + 1
18  libswift_Concurrency.dylib    	       0x28e8ef2fd completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*) + 1

Thread 7:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	       0x192fbec34 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x192fd1028 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x192fc798c mach_msg_overwrite + 484
3   libsystem_kernel.dylib        	       0x192fbefb4 mach_msg + 24
4   CoreFoundation                	       0x1930a0ba0 __CFRunLoopServiceMachPort + 160
5   CoreFoundation                	       0x19309f4f8 __CFRunLoopRun + 1188
6   CoreFoundation                	       0x193159e34 _CFRunLoopRunSpecificWithOptions + 532
7   CFNetwork                     	       0x199593b30 +[__CFN_CoreSchedulingSetRunnable _run:] + 416
8   Foundation                    	       0x1948b97a0 __NSThread__start__ + 732
9   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
10  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 8:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x103648730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x103650468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1036504ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x103649370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x103650388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x103632918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103633bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1036283ac closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 64 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10362842c partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 52
10  RedLemon                      	       0x1035b568c withUnsafePointer<A, B, C>(to:_:) + 92
11  RedLemon                      	       0x103628274 Optional.withUnsafeOptionalPointer<A>(_:) + 416 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x1036318f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10362c2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x103622d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x103625e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
16  RedLemon                      	       0x10361b7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10361b870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
18  RedLemon                      	       0x10361b8fc autoreleasepool<A, B>(invoking:) + 124
19  RedLemon                      	       0x10361b790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x1036220a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x1035cc358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x1035cc91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
24  RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
25  RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
26  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
27  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 9:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x103648730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x103650468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1036504ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x103649370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x103650388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x103632918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103633bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1036282d8 Optional.withUnsafeOptionalPointer<A>(_:) + 516 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1036318f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10362c2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x103622d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x103625e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
13  RedLemon                      	       0x10361b7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10361b870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
15  RedLemon                      	       0x10361b8fc autoreleasepool<A, B>(invoking:) + 124
16  RedLemon                      	       0x10361b790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x1036220a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x1035cc358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x1035cc91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
21  RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
22  RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
23  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
24  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 10:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x103648730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x103650468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1036504ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x103649370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x103650388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x103632918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103633bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1036282d8 Optional.withUnsafeOptionalPointer<A>(_:) + 516 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1036318f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10362c2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x103622d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x103625e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
13  RedLemon                      	       0x10361b7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10361b870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
15  RedLemon                      	       0x10361b8fc autoreleasepool<A, B>(invoking:) + 124
16  RedLemon                      	       0x10361b790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x1036220a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x1035cc358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x1035cc91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
21  RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
22  RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
23  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
24  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 11:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x103648730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x103650468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1036504ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x103649370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x103650388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x103632918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103633bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1036282d8 Optional.withUnsafeOptionalPointer<A>(_:) + 516 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1036318f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10362c2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x103622d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x103625e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
13  RedLemon                      	       0x10361b7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10361b870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
15  RedLemon                      	       0x10361b8fc autoreleasepool<A, B>(invoking:) + 124
16  RedLemon                      	       0x10361b790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x1036220a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x1035cc358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x1035cc91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
21  RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
22  RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
23  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
24  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 12:: NIO-SGLTN-0-#4
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x103648730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x103650468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1036504ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x103649370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x103650388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x103632918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103633bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1036282d8 Optional.withUnsafeOptionalPointer<A>(_:) + 516 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1036318f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10362c2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x103622d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x103625e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
13  RedLemon                      	       0x10361b7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10361b870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
15  RedLemon                      	       0x10361b8fc autoreleasepool<A, B>(invoking:) + 124
16  RedLemon                      	       0x10361b790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x1036220a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x1035cc358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x1035cc91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
21  RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
22  RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
23  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
24  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 13:: NIO-SGLTN-0-#5
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x103648730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x103650468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1036504ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x103649370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x103650388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x103632918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103633bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1036283ac closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 64 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10362842c partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 52
10  RedLemon                      	       0x1035b568c withUnsafePointer<A, B, C>(to:_:) + 92
11  RedLemon                      	       0x103628274 Optional.withUnsafeOptionalPointer<A>(_:) + 416 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x1036318f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10362c2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x103622d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x103625e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
16  RedLemon                      	       0x10361b7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10361b870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
18  RedLemon                      	       0x10361b8fc autoreleasepool<A, B>(invoking:) + 124
19  RedLemon                      	       0x10361b790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x1036220a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x1035cc358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x1035cc91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
24  RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
25  RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
26  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
27  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 14:: NIO-SGLTN-0-#6
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x103648730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x103650468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1036504ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x103649370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x103650388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x103632918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103633bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1036282d8 Optional.withUnsafeOptionalPointer<A>(_:) + 516 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1036318f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10362c2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x103622d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x103625e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
13  RedLemon                      	       0x10361b7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10361b870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
15  RedLemon                      	       0x10361b8fc autoreleasepool<A, B>(invoking:) + 124
16  RedLemon                      	       0x10361b790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x1036220a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x1035cc358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x1035cc91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
21  RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
22  RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
23  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
24  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 15:: NIO-SGLTN-0-#7
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x103648730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x103650468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1036504ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x103649370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x103650388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x103632918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103633bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1036283ac closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 64 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10362842c partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 52
10  RedLemon                      	       0x1035b568c withUnsafePointer<A, B, C>(to:_:) + 92
11  RedLemon                      	       0x103628274 Optional.withUnsafeOptionalPointer<A>(_:) + 416 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x1036318f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10362c2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x103622d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x103625e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
16  RedLemon                      	       0x10361b7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10361b870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
18  RedLemon                      	       0x10361b8fc autoreleasepool<A, B>(invoking:) + 124
19  RedLemon                      	       0x10361b790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x1036220a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x1035cc358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x1035cc91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
24  RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
25  RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
26  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
27  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 16:: TP-#0
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1035d5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1035d67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 17:: TP-#1
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1035d5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1035d67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 18:: TP-#2
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1035d5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1035d67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 19:: TP-#3
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1035d5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1035d67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 20:: TP-#4
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1035d5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1035d67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 21:: TP-#5
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1035d5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1035d67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 22:: TP-#6
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1035d5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1035d67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 23:: TP-#7
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1035d5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1035d67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103650890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1036529e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103652a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 24:: core
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108762c00 mp_dispatch_queue_process + 192
3   libmpv.2.dylib                	       0x108793b84 mp_wait_events + 80
4   libmpv.2.dylib                	       0x108795780 run_playloop + 1652
5   libmpv.2.dylib                	       0x10878fb08 play_current_file + 3884
6   libmpv.2.dylib                	       0x10878eaec mp_play_files + 204
7   libmpv.2.dylib                	       0x108778580 core_thread + 76
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 25:: */ytdl_hook
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108777ec4 wait_wakeup + 92
3   libmpv.2.dylib                	       0x1087787ac mpv_wait_event + 464
4   libmpv.2.dylib                	       0x1087e6418 script_raw_wait_event + 64
5   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
6   libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
7   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
8   libmpv.2.dylib                	       0x1087e6098 load_scripts + 332
9   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
10  libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
11  libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
12  libluajit-5.1.2.1.1767980792.dylib	       0x10860bcd8 lua_cpcall + 28
13  libmpv.2.dylib                	       0x108798cdc run_script + 92
14  libmpv.2.dylib                	       0x108798d34 script_thread + 12
15  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
16  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 26:: */stats
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108777ec4 wait_wakeup + 92
3   libmpv.2.dylib                	       0x1087787ac mpv_wait_event + 464
4   libmpv.2.dylib                	       0x1087e6418 script_raw_wait_event + 64
5   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
6   libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
7   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
8   libmpv.2.dylib                	       0x1087e6098 load_scripts + 332
9   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
10  libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
11  libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
12  libluajit-5.1.2.1.1767980792.dylib	       0x10860bcd8 lua_cpcall + 28
13  libmpv.2.dylib                	       0x108798cdc run_script + 92
14  libmpv.2.dylib                	       0x108798d34 script_thread + 12
15  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
16  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 27:: */console
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108777ec4 wait_wakeup + 92
3   libmpv.2.dylib                	       0x1087787ac mpv_wait_event + 464
4   libmpv.2.dylib                	       0x1087e6418 script_raw_wait_event + 64
5   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
6   libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
7   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
8   libmpv.2.dylib                	       0x1087e6098 load_scripts + 332
9   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
10  libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
11  libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
12  libluajit-5.1.2.1.1767980792.dylib	       0x10860bcd8 lua_cpcall + 28
13  libmpv.2.dylib                	       0x108798cdc run_script + 92
14  libmpv.2.dylib                	       0x108798d34 script_thread + 12
15  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
16  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 28:: */select
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108777ec4 wait_wakeup + 92
3   libmpv.2.dylib                	       0x1087787ac mpv_wait_event + 464
4   libmpv.2.dylib                	       0x1087e6418 script_raw_wait_event + 64
5   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
6   libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
7   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
8   libmpv.2.dylib                	       0x1087e6098 load_scripts + 332
9   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
10  libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
11  libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
12  libluajit-5.1.2.1.1767980792.dylib	       0x10860bcd8 lua_cpcall + 28
13  libmpv.2.dylib                	       0x108798cdc run_script + 92
14  libmpv.2.dylib                	       0x108798d34 script_thread + 12
15  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
16  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 29:: */positioning
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108777ec4 wait_wakeup + 92
3   libmpv.2.dylib                	       0x1087787ac mpv_wait_event + 464
4   libmpv.2.dylib                	       0x1087e6418 script_raw_wait_event + 64
5   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
6   libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
7   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
8   libmpv.2.dylib                	       0x1087e6098 load_scripts + 332
9   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
10  libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
11  libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
12  libluajit-5.1.2.1.1767980792.dylib	       0x10860bcd8 lua_cpcall + 28
13  libmpv.2.dylib                	       0x108798cdc run_script + 92
14  libmpv.2.dylib                	       0x108798d34 script_thread + 12
15  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
16  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 30:: */commands
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108777ec4 wait_wakeup + 92
3   libmpv.2.dylib                	       0x1087787ac mpv_wait_event + 464
4   libmpv.2.dylib                	       0x1087e6418 script_raw_wait_event + 64
5   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
6   libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
7   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
8   libmpv.2.dylib                	       0x1087e6098 load_scripts + 332
9   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
10  libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
11  libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
12  libluajit-5.1.2.1.1767980792.dylib	       0x10860bcd8 lua_cpcall + 28
13  libmpv.2.dylib                	       0x108798cdc run_script + 92
14  libmpv.2.dylib                	       0x108798d34 script_thread + 12
15  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
16  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 31:: */context_menu
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108777ec4 wait_wakeup + 92
3   libmpv.2.dylib                	       0x1087787ac mpv_wait_event + 464
4   libmpv.2.dylib                	       0x1087e6418 script_raw_wait_event + 64
5   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
6   libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
7   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
8   libmpv.2.dylib                	       0x1087e6098 load_scripts + 332
9   libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
10  libluajit-5.1.2.1.1767980792.dylib	       0x10860bc98 lua_pcall + 152
11  libluajit-5.1.2.1.1767980792.dylib	       0x1085ff004 0x1085fc000 + 12292
12  libluajit-5.1.2.1.1767980792.dylib	       0x10860bcd8 lua_cpcall + 28
13  libmpv.2.dylib                	       0x108798cdc run_script + 92
14  libmpv.2.dylib                	       0x108798d34 script_thread + 12
15  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
16  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 32:

Thread 33 Crashed::  Dispatch queue: com.apple.root.default-qos.cooperative
0   libmpv.2.dylib                	       0x10877988c mpv_get_property + 116
1   libmpv.2.dylib                	       0x108779888 mpv_get_property + 112
2   RedLemon                      	       0x103fce6e8 MPVWrapper.getSubtitleTracks() + 1516 (MPVWrapper.swift:877)
3   RedLemon                      	       0x103fddcf0 protocol witness for MPVController.getSubtitleTracks() in conformance MPVWrapper + 36
4   RedLemon                      	       0x1046402c9 MPVSubtitleService.scanEmbeddedTracks(isFastPath:) + 1 (SubtitleService.swift:198)
5   RedLemon                      	       0x10463c639 closure #1 in MPVSubtitleService.setupObservers() + 1 (SubtitleService.swift:91)
6   RedLemon                      	       0x10463c835 partial apply for closure #1 in MPVSubtitleService.setupObservers() + 1
7   RedLemon                      	       0x102af6435 thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A) + 1
8   RedLemon                      	       0x103974f65 partial apply for thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A) + 1
9   libswift_Concurrency.dylib    	       0x28e8ef2fd completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*) + 1

Thread 34:: demux
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108732424 demux_thread + 264
3   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
4   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 35:: worker
0   libsystem_kernel.dylib        	       0x192fc24f8 __psynch_cvwait + 8
1   libsystem_pthread.dylib       	       0x1930020dc _pthread_cond_wait + 984
2   libmpv.2.dylib                	       0x108765a50 worker_thread + 196
3   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
4   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 36:: com.apple.coremedia.sharedRootQueue.47
0   libsystem_kernel.dylib        	       0x192fbebc8 semaphore_timedwait_trap + 8
1   libdispatch.dylib             	       0x192e79c8c _dispatch_sema4_timedwait + 64
2   libdispatch.dylib             	       0x192e46f08 _dispatch_semaphore_wait_slow + 76
3   libdispatch.dylib             	       0x192e56dc0 _dispatch_worker_thread + 324
4   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
5   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 37:: caulk.messenger.shared:17
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   caulk                         	       0x19f617e08 caulk::semaphore::timed_wait(double) + 224
2   caulk                         	       0x19f617cb0 caulk::concurrent::details::worker_thread::run() + 32
3   caulk                         	       0x19f617950 void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*) + 96
4   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
5   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 38:: caulk.messenger.shared:high
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   caulk                         	       0x19f617e08 caulk::semaphore::timed_wait(double) + 224
2   caulk                         	       0x19f617cb0 caulk::concurrent::details::worker_thread::run() + 32
3   caulk                         	       0x19f617950 void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*) + 96
4   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
5   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 39:: caulk::deferred_logger
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   caulk                         	       0x19f617e08 caulk::semaphore::timed_wait(double) + 224
2   caulk                         	       0x19f617cb0 caulk::concurrent::details::worker_thread::run() + 32
3   caulk                         	       0x19f617950 void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*) + 96
4   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
5   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 40:: com.apple.audio.IOThread.client
0   libsystem_kernel.dylib        	       0x192fbebbc semaphore_wait_signal_trap + 8
1   caulk                         	       0x19f634fac caulk::mach::semaphore::wait_signal_or_error(caulk::mach::semaphore&) + 36
2   CoreAudio                     	       0x1963176f0 HALC_ProxyIOContext::IOWorkLoop() + 5052
3   CoreAudio                     	       0x196315c8c invocation function for block in HALC_ProxyIOContext::HALC_ProxyIOContext(unsigned int, unsigned int) + 172
4   CoreAudio                     	       0x1964e3710 HALC_IOThread::Entry(void*) + 88
5   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
6   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 41:

Thread 42:

Thread 43:


Thread 33 crashed with ARM Thread State (64-bit):
    x0: 0x0000000000000000   x1: 0x0000000000000000   x2: 0x00000000000020a4   x3: 0x0000000000000001
    x4: 0x0000000a0ca1f2c0   x5: 0x0000000000000000   x6: 0x0000000000000062   x7: 0xfffff0003ffff800
    x8: 0x0000000000000000   x9: 0x00000001088101b8  x10: 0x0000040000000402  x11: 0x0000010000000000
   x12: 0x00000000fffffffd  x13: 0x0000040000000000  x14: 0x0000000000000400  x15: 0x0000000000000000
   x16: 0x0000040000000400  x17: 0x0000040000000402  x18: 0x0000000000000000  x19: 0x0000000a0bacad50
   x20: 0x000000016e74eab0  x21: 0x0000000000000000  x22: 0x0000000a0bb3c390  x23: 0x0000000000000000
   x24: 0x000000000000005d  x25: 0x000000016e74f0e0  x26: 0x0000000000000000  x27: 0x00000000fff0ffff
   x28: 0x0000000000000000   fp: 0x000000016e74e130   lr: 0x0000000108779888
    sp: 0x000000016e74e0e0   pc: 0x000000010877988c cpsr: 0x60001000
   far: 0x0000000000000048  esr: 0x92000006 (Data Abort) byte read Translation fault

Binary Images:
       0x1029d0000 -        0x104f23fff com.redlemon.app (v1.0.182) <2f5097c7-941a-326d-9398-381c98c97368> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x108068000 -        0x1080affff org.sparkle-project.Sparkle (2.8.0) <8f886ac7-3842-3b7f-bbf2-c56ffa529f6e> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/Sparkle.framework/Versions/B/Sparkle
       0x1086c4000 -        0x108a13fff libmpv.2.dylib (*) <03681c00-9c6b-3c36-b18e-0aa5ab84556f> /opt/homebrew/*/libmpv.2.dylib
       0x107fd0000 -        0x107ff7fff libass.9.dylib (*) <e8ec394f-559b-32d9-9a38-9d520ad185a3> /opt/homebrew/*/libass.9.dylib
       0x109448000 -        0x109cfbfff libavcodec.62.11.100.dylib (*) <ee19c04e-0da1-391a-a0c4-8d071b295fff> /opt/homebrew/*/libavcodec.62.11.100.dylib
       0x108b10000 -        0x108d5bfff libavfilter.11.4.100.dylib (*) <5c71529c-36df-3e36-b1b3-5c9300b11b48> /opt/homebrew/*/libavfilter.11.4.100.dylib
       0x108df8000 -        0x108fdbfff libavformat.62.3.100.dylib (*) <02b4dc77-f5d6-34b9-9927-325f6fff3b2b> /opt/homebrew/*/libavformat.62.3.100.dylib
       0x10a394000 -        0x10a407fff libavutil.60.8.100.dylib (*) <71234acb-1735-3a3b-9a25-586ec4fe16fd> /opt/homebrew/*/libavutil.60.8.100.dylib
       0x10827c000 -        0x108327fff libplacebo.351.dylib (*) <03007277-7fb4-3f37-adfd-90e73cbef1a4> /opt/homebrew/*/libplacebo.351.dylib
       0x107fac000 -        0x107fbbfff libswresample.6.1.100.dylib (*) <275fc1a4-0ec7-3969-a142-5d02807123eb> /opt/homebrew/*/libswresample.6.1.100.dylib
       0x108150000 -        0x1081bffff libswscale.9.1.100.dylib (*) <db53fb7b-4b83-3840-8a23-b6f4ccdedd84> /opt/homebrew/*/libswscale.9.1.100.dylib
       0x1080d0000 -        0x108107fff libmujs.dylib (*) <1bcda6e7-e51f-326c-86b8-30f68e27b474> /opt/homebrew/*/libmujs.dylib
       0x1083c0000 -        0x1083fffff liblcms2.2.dylib (*) <8544ae79-c27a-3dce-ad01-cfb0ed1269c7> /opt/homebrew/*/liblcms2.2.dylib
       0x1084c8000 -        0x10854ffff libarchive.13.dylib (*) <551362f7-cccf-34f0-896d-d8056eac3dc0> /opt/homebrew/*/libarchive.13.dylib
       0x108038000 -        0x10804bfff libavdevice.62.1.100.dylib (*) <ba5a7055-bb2a-363c-a69f-038e1fdd6512> /opt/homebrew/*/libavdevice.62.1.100.dylib
       0x10841c000 -        0x10845bfff libbluray.3.dylib (*) <cca3fbbc-a2d1-3cdd-84f7-744df4503c8e> /opt/homebrew/*/libbluray.3.dylib
       0x1085fc000 -        0x10866ffff libluajit-5.1.2.1.1767980792.dylib (*) <291ec50f-e60a-364c-bf1c-efe9fb72b3b5> /opt/homebrew/*/libluajit-5.1.2.1.1767980792.dylib
       0x10902c000 -        0x10905bfff librubberband.3.dylib (*) <10cae9d2-9881-3c25-a61c-50a01ab16891> /opt/homebrew/*/librubberband.3.dylib
       0x108478000 -        0x10849ffff libuchardet.0.0.8.dylib (*) <c9e5de7d-3102-3d1d-a9e6-7ceb28632936> /opt/homebrew/*/libuchardet.0.0.8.dylib
       0x108010000 -        0x108013fff libvapoursynth-script.0.dylib (*) <094c5db3-9852-3694-b933-4f9ee8828550> /opt/homebrew/*/libvapoursynth-script.0.dylib
       0x10908c000 -        0x1090c3fff libzimg.2.dylib (*) <71bc0e48-c7b2-3658-98c0-1782add5bc6d> /opt/homebrew/*/libzimg.2.dylib
       0x1090f0000 -        0x10914ffff libjpeg.8.3.2.dylib (*) <b12ad9a5-f87d-3b9f-9195-9e408319fd3a> /opt/homebrew/*/libjpeg.8.3.2.dylib
       0x109204000 -        0x10926bfff libvulkan.1.4.335.dylib (*) <94a5736e-3150-3ca2-895f-b3d8a5c7c031> /opt/homebrew/*/libvulkan.1.4.335.dylib
       0x1092a0000 -        0x10931bfff libfreetype.6.dylib (*) <453df297-0ca4-35f8-bb25-dd04bce98b59> /opt/homebrew/*/libfreetype.6.dylib
       0x108364000 -        0x10837ffff libfribidi.0.dylib (*) <01c59dc9-20b2-319c-88c2-0f7698cc2bc9> /opt/homebrew/*/libfribidi.0.dylib
       0x10b56c000 -        0x10b627fff libharfbuzz.0.dylib (*) <67cf7c00-9bfe-3fc6-b4d1-769ffc46bc68> /opt/homebrew/*/libharfbuzz.0.dylib
       0x108390000 -        0x1083affff libunibreak.6.dylib (*) <8dd7f56f-29c0-32a0-9749-459aa763bcb4> /opt/homebrew/*/libunibreak.6.dylib
       0x108574000 -        0x108597fff libpng16.16.dylib (*) <a5335a51-59c1-3fc7-acb6-b28db402d52c> /opt/homebrew/*/libpng16.16.dylib
       0x10b7e4000 -        0x10b8dffff libglib-2.0.0.dylib (*) <95f652fe-0fda-36d0-b6d0-34427409a2fe> /opt/homebrew/*/libglib-2.0.0.dylib
       0x1085a8000 -        0x1085bbfff libgraphite2.3.2.1.dylib (*) <481f6d39-27e3-3c77-a203-99ddb4e2de7f> /opt/homebrew/*/libgraphite2.3.2.1.dylib
       0x109168000 -        0x10918ffff libintl.8.dylib (*) <4fbeeaca-81e4-303f-840e-2014b4b1b057> /opt/homebrew/*/libintl.8.dylib
       0x10b440000 -        0x10b4b7fff libpcre2-8.0.dylib (*) <0d65de6e-7082-35af-b6d4-ae160ae9d32e> /opt/homebrew/*/libpcre2-8.0.dylib
       0x10bae0000 -        0x10bc57fff libvpx.11.dylib (*) <93bc5562-16ec-3ab4-a0cc-6692b3d8f5be> /opt/homebrew/*/libvpx.11.dylib
       0x10b698000 -        0x10b72ffff libdav1d.7.dylib (*) <b317db1b-7e5e-3ad6-8dfb-5f30139ba348> /opt/homebrew/*/libdav1d.7.dylib
       0x10933c000 -        0x10936ffff libmp3lame.0.dylib (*) <856fb90d-91ac-3a42-b529-e895af08115c> /opt/homebrew/*/libmp3lame.0.dylib
       0x1093b4000 -        0x1093fffff libopus.0.dylib (*) <1c7445f6-fb0e-33ea-8aa8-18597a9443ac> /opt/homebrew/*/libopus.0.dylib
       0x10bf50000 -        0x10c1bbfff libSvtAv1Enc.3.1.2.dylib (*) <08ba4734-ecf7-352b-8d91-9ee8000ae75b> /opt/homebrew/*/libSvtAv1Enc.3.1.2.dylib
       0x10bc94000 -        0x10bdb3fff libx264.165.dylib (*) <b916484f-5239-335b-b9fe-4e71261da16b> /opt/homebrew/*/libx264.165.dylib
       0x10c894000 -        0x10cc8ffff libx265.215.dylib (*) <590e5411-20b2-3cf7-9f18-7e2f3611f7a7> /opt/homebrew/*/libx265.215.dylib
       0x10d4c0000 -        0x10d877fff libshaderc_shared.1.dylib (*) <6492c8fd-dac0-342e-8cbe-063c6b427304> /opt/homebrew/*/libshaderc_shared.1.dylib
       0x1085cc000 -        0x1085ebfff liblzma.5.dylib (*) <7e7bef36-1537-3b34-91b7-eca90293ba43> /opt/homebrew/*/liblzma.5.dylib
       0x10b9d0000 -        0x10ba57fff libzstd.1.5.7.dylib (*) <93a01ac5-b367-3f6d-9b23-ac6404a111a4> /opt/homebrew/*/libzstd.1.5.7.dylib
       0x108684000 -        0x1086a3fff liblz4.1.10.0.dylib (*) <d2dadb7f-f6c0-3a6d-9c83-02596baca219> /opt/homebrew/*/liblz4.1.10.0.dylib
       0x10811c000 -        0x108123fff libb2.1.dylib (*) <cdb9743e-4399-33d0-a9af-8667f7f00478> /opt/homebrew/*/libb2.1.dylib
       0x10b4d0000 -        0x10b503fff libfontconfig.1.dylib (*) <348f051c-4847-3342-a00e-ccd07adf2634> /opt/homebrew/*/libfontconfig.1.dylib
       0x108134000 -        0x10813bfff libudfread.3.dylib (*) <89b8fe85-c709-33fa-a9ec-9e6368c9cbc8> /opt/homebrew/*/libudfread.3.dylib
       0x10c4d8000 -        0x10c643fff libsamplerate.0.2.2.dylib (*) <0da641e6-fcba-3c1a-8c8c-ff25aadedac6> /opt/homebrew/*/libsamplerate.0.2.2.dylib
       0x10dbb4000 -        0x10df7ffff org.python.python (3.14.2, (c) 2001-2024 Python Software Foundation.) <d1eea04d-1fad-31b0-a34c-48e935ff166e> /opt/homebrew/*/Python.framework/Versions/3.14/Python
       0x10b538000 -        0x10b543fff libobjc-trampolines.dylib (*) <d4baeab8-b553-3779-a0ff-d8848e7a22df> /usr/lib/libobjc-trampolines.dylib
       0x12aba8000 -        0x12b36bfff com.apple.AGXMetalG14G (342.3) <fd2ac287-d149-309f-a2ec-eb9d375be6ad> /System/Library/Extensions/AGXMetalG14G.bundle/Contents/MacOS/AGXMetalG14G
       0x13081c000 -        0x13087ffff com.apple.AppleMetalOpenGLRenderer (1.0) <4ff7e230-8427-36ad-98f9-10a81f174e7e> /System/Library/Extensions/AppleMetalOpenGLRenderer.bundle/Contents/MacOS/AppleMetalOpenGLRenderer
       0x1448d8000 -        0x144a1bfff com.apple.audio.units.Components (1.14) <0312381d-61ae-3ab9-9cea-b1e46a0c4e54> /System/Library/Components/CoreAudio.component/Contents/MacOS/CoreAudio
       0x192fbe000 -        0x192ffa49f libsystem_kernel.dylib (*) <548c45c8-9733-3f0d-8ef4-c06df1df2ad0> /usr/lib/system/libsystem_kernel.dylib
       0x193041000 -        0x193589c3f com.apple.CoreFoundation (6.9) <649000a2-3eb4-3cf5-970a-d3cb37b5780c> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
       0x19face000 -        0x19fdd127f com.apple.HIToolbox (2.1.1) <fb92ce0c-1ee5-3f03-992c-df53ed9b3cb4> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
       0x197493000 -        0x198bc227f com.apple.AppKit (6.9) <4e909aec-68bc-3fc9-a87a-de928e1e36e1> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x1c6fe5000 -        0x1c872bd1f com.apple.SwiftUI (7.2.5.1.401) <f0703a94-2852-3e83-9379-1088351e37c9> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x192c31000 -        0x192ccffc3 dyld (*) <0975afba-c46b-364c-bd84-a75daa9e455a> /usr/lib/dyld
               0x0 - 0xffffffffffffffff ??? (*) <00000000-0000-0000-0000-000000000000> ???
       0x19733a000 -        0x19742455f com.apple.framework.IOKit (2.0.2) <8138342a-f920-342d-82b9-a2aafc1e8a6a> /System/Library/Frameworks/IOKit.framework/Versions/A/IOKit
       0x194893000 -        0x1958364df com.apple.Foundation (6.9) <6a518869-0a98-34cb-8a15-cc28f898255e> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
       0x28e882000 -        0x28e90b6ff libswift_Concurrency.dylib (*) <2cd4d4d2-15a3-3057-b506-6e79bd1d6428> /usr/lib/swift/libswift_Concurrency.dylib
       0x192ffb000 -        0x193007abb libsystem_pthread.dylib (*) <527c4ba0-91a5-378b-b3e2-d38269ca5a66> /usr/lib/system/libsystem_pthread.dylib
       0x192d4a000 -        0x192df696f libcorecrypto.dylib (*) <a925150e-a21f-3273-a38d-eb304c5d2d18> /usr/lib/system/libcorecrypto.dylib
       0x1e7b07000 -        0x1e7ba5e8b com.apple.security.CryptoKit (1.0) <966fdbe0-180e-3929-b972-687bd14cb106> /System/Library/Frameworks/CryptoKit.framework/Versions/A/CryptoKit
       0x199348000 -        0x1997030ff com.apple.CFNetwork (1.0) <444dd8ef-e7eb-389b-958c-f45c56c3c4df> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
       0x192e43000 -        0x192e89e5f libdispatch.dylib (*) <a4b349e8-dd6f-3b71-84d9-34f3b4acd849> /usr/lib/system/libdispatch.dylib
       0x19f616000 -        0x19f63ed7f com.apple.audio.caulk (1.0) <d4644b08-911d-30af-82e7-c404878abf47> /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk
       0x196111000 -        0x1968bc57f com.apple.audio.CoreAudio (5.0) <f37b241b-2a83-3f86-bd94-329a18ba4715> /System/Library/Frameworks/CoreAudio.framework/Versions/A/CoreAudio

External Modification Summary:
  Calls made by other processes targeting this process:
    task_for_pid: 0
    thread_create: 0
    thread_set_state: 0
  Calls made by this process:
    task_for_pid: 0
    thread_create: 0
    thread_set_state: 0
  Calls made by all processes on this machine:
    task_for_pid: 0
    thread_create: 0
    thread_set_state: 0

VM Region Summary:
ReadOnly portion of Libraries: Total=1.9G resident=0K(0%) swapped_out_or_unallocated=1.9G(100%)
Writable regions: Total=387.3M written=865K(0%) resident=865K(0%) swapped_out=0K(0%) unallocated=386.5M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               128K        1 
Activity Tracing                   256K        1 
AttributeGraph Data               1024K        1 
CG image                            16K        1 
ColorSync                           48K        3 
CoreAnimation                     1040K       60 
CoreGraphics                        48K        3 
CoreServices                       224K        1 
CoreUI image data                  608K        5 
Dispatch continuations            64.0M        1 
Foundation                        1376K        2 
Image IO                          3536K       38 
Kernel Alloc Once                   32K        1 
MALLOC                           251.3M       53 
MALLOC guard page                 3376K        4 
OpenGL GLSL                        384K        5 
SQLite page cache                  640K        5 
STACK GUARD                       56.7M       44 
Stack                             30.8M       44 
VM_ALLOCATE                       5824K       43 
VM_ALLOCATE (reserved)              32K        1         reserved VM address space (unallocated)
__AUTH                            5781K      644 
__AUTH_CONST                      88.0M     1025 
__CTF                               824        1 
__DATA                            62.9M     1026 
__DATA_CONST                      36.1M     1081 
__DATA_DIRTY                      8688K      882 
__FONT_DATA                        2352        1 
__GLSLBUILTINS                    5176K        1 
__INFO_FILTER                         8        1 
__LINKEDIT                       648.0M       53 
__OBJC_RO                         78.4M        1 
__OBJC_RW                         2570K        1 
__TEXT                             1.2G     1077 
__TEXT (graphics)                 35.5M       28 
__TPRO_CONST                       128K        2 
dyld private memory                128K        1 
mapped file                      448.3M       56 
page table in kernel               865K        1 
shared memory                     2032K       21 
===========                     =======  ======= 
TOTAL                              3.0G     6220 
TOTAL, minus reserved VM space     3.0G     6220 


-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2026-01-31 14:23:22.00 -0500","app_version":"v1.0.182","slice_uuid":"2f5097c7-941a-326d-9398-381c98c97368","build_version":"182","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 26.2 (25C56)","roots_installed":0,"name":"RedLemon","incident_id":"1D56421B-8A51-43A5-8DF7-3651052B901A"}
{
  "uptime" : 10000,
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 502,
  "deployVersion" : 210,
  "modelCode" : "Mac14,2",
  "coalitionID" : 2756,
  "osVersion" : {
    "train" : "macOS 26.2",
    "build" : "25C56",
    "releaseType" : "User"
  },
  "captureTime" : "2026-01-31 14:23:15.1122 -0500",
  "codeSigningMonitor" : 2,
  "incident" : "1D56421B-8A51-43A5-8DF7-3651052B901A",
  "pid" : 57324,
  "translated" : false,
  "cpuType" : "ARM-64",
  "procLaunch" : "2026-01-31 14:22:40.3798 -0500",
  "procStartAbsTime" : 250617174052,
  "procExitAbsTime" : 251450231189,
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"v1.0.182","CFBundleVersion":"182","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7A93D2BC-EE70-5B62-AB04-E4F8F9A9698C","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 54303,
  "coalitionName" : "com.microsoft.VSCode",
  "crashReporterKey" : "23926D48-00F6-4930-A350-2C9BC76EE1AE",
  "appleIntelligenceStatus" : {"reasons":["notOptedIn","assetIsNotReady","siriAssetIsNotReady"],"state":"unavailable"},
  "developerMode" : 1,
  "bootProgressRegister" : "0x2f000000",
  "responsiblePid" : 6301,
  "responsibleProc" : "Electron",
  "codeSigningID" : "com.redlemon.app",
  "codeSigningTeamID" : "",
  "codeSigningFlags" : 570425857,
  "codeSigningValidationCategory" : 10,
  "codeSigningTrustLevel" : 4294967295,
  "codeSigningAuxiliaryInfo" : 0,
  "instructionByteStream" : {"beforePC":"6IcAqeIbALnjEwD5\/ysAuf9\/A6kAJUD5W6X\/l+AjAJEJAACUaCZA+Q==","atPC":"ACVA+Z6l\/5fgK0C5\/XtFqfRPRKn\/gwGRwANf1v8DAtH4XwSp9lcFqQ=="},
  "bootSessionUUID" : "1863D700-7DA0-4057-A46D-1C0CB3CA6E62",
  "wakeTime" : 2220,
  "sleepWakeUUID" : "95AE380F-DEA0-48B8-B769-9039112BBC91",
  "sip" : "enabled",
  "vmRegionInfo" : "0x48 is not in any region.  Bytes before following region: 4338810808\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      UNUSED SPACE AT START\n--->  \n      __TEXT                      1029d0000-104f24000    [ 37.3M] r-x\/r-x SM=COW  \/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000048","rawCodes":[1,72],"type":"EXC_BAD_ACCESS","signal":"SIGSEGV","subtype":"KERN_INVALID_ADDRESS at 0x0000000000000048"},
  "termination" : {"flags":0,"code":11,"namespace":"SIGNAL","indicator":"Segmentation fault: 11","byProc":"exc handler","byPid":57324},
  "vmregioninfo" : "0x48 is not in any region.  Bytes before following region: 4338810808\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      UNUSED SPACE AT START\n--->  \n      __TEXT                      1029d0000-104f24000    [ 37.3M] r-x\/r-x SM=COW  \/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 33,
  "threads" : [{"id":298702,"threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592,"symbolLocation":24,"symbol":"OBJC_METACLASS_$_MPSNNGradientStateNode"},{"value":13207024435200},{"value":0},{"value":13207024435200},{"value":2},{"value":4294967295},{"value":0},{"value":17179869184},{"value":0},{"value":2},{"value":0},{"value":0},{"value":3075},{"value":0},{"value":18446744073709551569},{"value":8611827872},{"value":0},{"value":4294967295},{"value":2},{"value":13207024435200},{"value":0},{"value":13207024435200},{"value":6128063720},{"value":8589934592,"symbolLocation":24,"symbol":"OBJC_METACLASS_$_MPSNNGradientStateNode"},{"value":21592279046},{"value":18446744073709550527},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761025576},"cpsr":{"value":4096},"fp":{"value":6128063568},"sp":{"value":6128063488},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950836},"far":{"value":0}},"queue":"com.apple.main-thread","frames":[{"imageOffset":3124,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":77864,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":52},{"imageOffset":39308,"symbol":"mach_msg_overwrite","symbolLocation":484,"imageIndex":52},{"imageOffset":4020,"symbol":"mach_msg","symbolLocation":24,"imageIndex":52},{"imageOffset":392096,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":160,"imageIndex":53},{"imageOffset":386296,"symbol":"__CFRunLoopRun","symbolLocation":1188,"imageIndex":53},{"imageOffset":1150516,"symbol":"_CFRunLoopRunSpecificWithOptions","symbolLocation":532,"imageIndex":53},{"imageOffset":792464,"symbol":"RunCurrentEventLoopInMode","symbolLocation":316,"imageIndex":54},{"imageOffset":805560,"symbol":"ReceiveNextEventCommon","symbolLocation":488,"imageIndex":54},{"imageOffset":2419556,"symbol":"_BlockUntilNextEventMatchingListInMode","symbolLocation":48,"imageIndex":54},{"imageOffset":5397340,"symbol":"_DPSBlockUntilNextEventMatchingListInMode","symbolLocation":236,"imageIndex":55},{"imageOffset":130632,"symbol":"_DPSNextEvent","symbolLocation":588,"imageIndex":55},{"imageOffset":11447564,"symbol":"-[NSApplication(NSEventRouting) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":688,"imageIndex":55},{"imageOffset":11446808,"symbol":"-[NSApplication(NSEventRouting) nextEventMatchingMask:untilDate:inMode:dequeue:]","symbolLocation":72,"imageIndex":55},{"imageOffset":100224,"symbol":"-[NSApplication run]","symbolLocation":368,"imageIndex":55},{"imageOffset":18140,"symbol":"NSApplicationMain","symbolLocation":880,"imageIndex":55},{"imageOffset":1119212,"symbol":"specialized runApp(_:)","symbolLocation":168,"imageIndex":56},{"imageOffset":5024576,"symbol":"runApp<A>(_:)","symbolLocation":112,"imageIndex":56},{"imageOffset":7950808,"symbol":"static App.main()","symbolLocation":224,"imageIndex":56},{"imageOffset":25858344,"sourceFile":"\/<compiler-generated>","symbol":"static RedLemonApp.$main()","symbolLocation":40,"imageIndex":0},{"imageOffset":25858516,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":12,"imageIndex":0},{"imageOffset":36180,"symbol":"start","symbolLocation":7184,"imageIndex":57}]},{"id":298715,"threadState":{"x":[{"value":0},{"value":17183031299},{"value":171799942419},{"value":36296768708359},{"value":313571267321347},{"value":36296768618496},{"value":60},{"value":0},{"value":0},{"value":17179869184},{"value":60},{"value":7683},{"value":73009},{"value":0},{"value":8451},{"value":0},{"value":18446744073709551569},{"value":8611827872},{"value":0},{"value":0},{"value":60},{"value":36296768618496},{"value":313571267321347},{"value":36296768708359},{"value":6128626484},{"value":171799942419},{"value":17183031299},{"value":18446744073709550527},{"value":3162115}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761025576},"cpsr":{"value":536875008},"fp":{"value":6128626144},"sp":{"value":6128626064},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950836},"far":{"value":0}},"queue":"com.apple.root.default-qos.cooperative","frames":[{"imageOffset":3124,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":77864,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":52},{"imageOffset":39308,"symbol":"mach_msg_overwrite","symbolLocation":484,"imageIndex":52},{"imageOffset":4020,"symbol":"mach_msg","symbolLocation":24,"imageIndex":52},{"imageOffset":68228,"symbol":"io_pm_assertion_retain_release","symbolLocation":180,"imageIndex":59},{"imageOffset":49444,"symbol":"IOPMAssertionRelease","symbolLocation":164,"imageIndex":59},{"imageOffset":10436888,"symbol":"-[_NSActivityAssertion _endFromDealloc:]","symbolLocation":236,"imageIndex":60},{"imageOffset":23978760,"sourceLine":179,"sourceFile":"PlaybackService.swift","symbol":"MPVPlaybackService.updateIsPlaying(_:)","imageIndex":0,"symbolLocation":1156},{"imageOffset":23967884,"sourceLine":125,"sourceFile":"PlaybackService.swift","symbol":"closure #1 in MPVPlaybackService.setupObservers()","imageIndex":0,"symbolLocation":48},{"imageOffset":23968321,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in MPVPlaybackService.setupObservers()","symbolLocation":1,"imageIndex":0},{"imageOffset":1205301,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A)","symbolLocation":1,"imageIndex":0},{"imageOffset":16404325,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A)","symbolLocation":1,"imageIndex":0},{"imageOffset":447229,"symbol":"completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*)","symbolLocation":1,"imageIndex":61}]},{"id":298716,"threadState":{"x":[{"value":260},{"value":0},{"value":17664},{"value":0},{"value":0},{"value":164},{"value":0},{"value":499998459},{"value":6129200232},{"value":0},{"value":256},{"value":1099511628034},{"value":1099511628034},{"value":256},{"value":0},{"value":1099511628032},{"value":305},{"value":8611825992},{"value":0},{"value":43145539096},{"value":43145539160},{"value":6129201376},{"value":499998459},{"value":0},{"value":17664},{"value":17665},{"value":17920},{"value":4293984255},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6129200352},"sp":{"value":6129200208},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":737088,"symbol":"wait_wakeup","symbolLocation":216,"imageIndex":2},{"imageOffset":739244,"symbol":"mpv_wait_event","symbolLocation":464,"imageIndex":2},{"imageOffset":23005220,"sourceLine":367,"sourceFile":"MPVWrapper.swift","symbol":"MPVWrapper.pollEvents()","imageIndex":0,"symbolLocation":180},{"imageOffset":22967841,"sourceLine":163,"sourceFile":"MPVWrapper.swift","symbol":"closure #1 in MPVWrapper.setupVideo(in:)","imageIndex":0,"symbolLocation":1},{"imageOffset":22968189,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in MPVWrapper.setupVideo(in:)","symbolLocation":1,"imageIndex":0},{"imageOffset":1205301,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A)","symbolLocation":1,"imageIndex":0},{"imageOffset":1205665,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A)","symbolLocation":1,"imageIndex":0},{"imageOffset":447229,"symbol":"completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*)","symbolLocation":1,"imageIndex":61}]},{"id":298735,"threadState":{"x":[{"value":4},{"value":0},{"value":726272},{"value":0},{"value":0},{"value":164},{"value":0},{"value":0},{"value":6129773640},{"value":0},{"value":16640},{"value":71468255822082},{"value":71468255822082},{"value":16640},{"value":0},{"value":71468255822080},{"value":305},{"value":8611825992},{"value":0},{"value":43145642720},{"value":43145642784},{"value":6129774816},{"value":0},{"value":0},{"value":726272},{"value":726273},{"value":726528},{"value":4293984255},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6129773760},"sp":{"value":6129773616},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"queue":"com.apple.root.background-qos.cooperative","frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":650924,"symbol":"mp_dispatch_lock","symbolLocation":196,"imageIndex":2},{"imageOffset":737796,"symbol":"mp_destroy_client","symbolLocation":648,"imageIndex":2},{"imageOffset":23121492,"sourceLine":1547,"sourceFile":"MPVWrapper.swift","symbol":"closure #1 in MPVWrapper.destroy()","imageIndex":0,"symbolLocation":280},{"imageOffset":23122229,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in MPVWrapper.destroy()","symbolLocation":1,"imageIndex":0},{"imageOffset":1205301,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A)","symbolLocation":1,"imageIndex":0},{"imageOffset":16404325,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A)","symbolLocation":1,"imageIndex":0},{"imageOffset":447229,"symbol":"completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*)","symbolLocation":1,"imageIndex":61}]},{"id":298743,"name":"com.apple.NSEventThread","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592,"symbolLocation":24,"symbol":"OBJC_METACLASS_$_MPSNNGradientStateNode"},{"value":97869419773952},{"value":0},{"value":97869419773952},{"value":2},{"value":4294967295},{"value":0},{"value":17179869184},{"value":0},{"value":2},{"value":0},{"value":0},{"value":22787},{"value":0},{"value":18446744073709551569},{"value":8611827872},{"value":0},{"value":4294967295},{"value":2},{"value":97869419773952},{"value":0},{"value":97869419773952},{"value":6130917512},{"value":8589934592,"symbolLocation":24,"symbol":"OBJC_METACLASS_$_MPSNNGradientStateNode"},{"value":21592279046},{"value":18446744073709550527},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761025576},"cpsr":{"value":4096},"fp":{"value":6130917360},"sp":{"value":6130917280},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950836},"far":{"value":0}},"frames":[{"imageOffset":3124,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":77864,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":52},{"imageOffset":39308,"symbol":"mach_msg_overwrite","symbolLocation":484,"imageIndex":52},{"imageOffset":4020,"symbol":"mach_msg","symbolLocation":24,"imageIndex":52},{"imageOffset":392096,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":160,"imageIndex":53},{"imageOffset":386296,"symbol":"__CFRunLoopRun","symbolLocation":1188,"imageIndex":53},{"imageOffset":1150516,"symbol":"_CFRunLoopRunSpecificWithOptions","symbolLocation":532,"imageIndex":53},{"imageOffset":719412,"symbol":"_NSEventThread","symbolLocation":184,"imageIndex":55},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298745,"frames":[],"threadState":{"x":[{"value":6131494912},{"value":58139},{"value":6130958336},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6131494912},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"id":298814,"threadState":{"x":[{"value":3},{"value":0},{"value":6133782880},{"value":6759071692,"symbolLocation":27544,"symbol":"base"},{"value":6133782880},{"value":2684354560},{"value":20871036},{"value":10537657681051023},{"value":8887257735803651497},{"value":6148914691236517205},{"value":0},{"value":3332846066837882344},{"value":6130881251722477633},{"value":1237849592743833},{"value":67108864},{"value":4289056309},{"value":11667290168},{"value":18077431},{"value":0},{"value":6759071628,"symbolLocation":27480,"symbol":"base"},{"value":6133782816},{"value":0},{"value":8},{"value":589},{"value":6133784096},{"value":6133783584},{"value":8589040392,"symbolLocation":0,"symbol":"rng_ctx"},{"value":6133784328},{"value":6133783792}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6758832372},"cpsr":{"value":553652224},"fp":{"value":6133782624},"sp":{"value":6133782592},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6758397344},"far":{"value":0}},"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":21920,"symbol":"ccn_mux","symbolLocation":88,"imageIndex":63},{"imageOffset":456948,"symbol":"ge_cmov","symbolLocation":80,"imageIndex":63},{"imageOffset":456708,"symbol":"ge_select","symbolLocation":272,"imageIndex":63},{"imageOffset":451348,"symbol":"ge_scalarmult_base_internal","symbolLocation":228,"imageIndex":63},{"imageOffset":451848,"symbol":"ge_scalarmult_base_masked","symbolLocation":172,"imageIndex":63},{"imageOffset":500140,"symbol":"cced25519_sign_internal","symbolLocation":400,"imageIndex":63},{"imageOffset":499688,"symbol":"cced25519_sign_with_rng_internal","symbolLocation":276,"imageIndex":63},{"imageOffset":500564,"symbol":"cced25519_sign","symbolLocation":84,"imageIndex":63},{"imageOffset":145000,"imageIndex":64},{"imageOffset":143860,"imageIndex":64},{"imageOffset":42304,"imageIndex":64},{"imageOffset":18272928,"sourceLine":33,"sourceFile":"CryptoManager.swift","symbol":"CryptoManager.sign(message:privateKeyBase64:)","imageIndex":0,"symbolLocation":828},{"imageOffset":29963952,"sourceLine":268,"sourceFile":"SupabaseClient.swift","symbol":"SupabaseClient.makeRequest(path:method:body:query:headers:useEphemeralSession:sign:isFunction:)","imageIndex":0,"symbolLocation":2260},{"imageOffset":30455153,"sourceLine":3182,"sourceFile":"SupabaseClient.swift","symbol":"SupabaseClient.syncWatchHistoryItem(_:)","imageIndex":0,"symbolLocation":1},{"imageOffset":24796865,"sourceLine":2163,"sourceFile":"PlayerViewModel.swift","symbol":"closure #2 in PlayerViewModel.saveToWatchHistory(timestamp:duration:force:)","imageIndex":0,"symbolLocation":1},{"imageOffset":24809169,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in PlayerViewModel.saveToWatchHistory(timestamp:duration:force:)","symbolLocation":1,"imageIndex":0},{"imageOffset":1205301,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A)","symbolLocation":1,"imageIndex":0},{"imageOffset":1205665,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A)","symbolLocation":1,"imageIndex":0},{"imageOffset":447229,"symbol":"completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*)","symbolLocation":1,"imageIndex":61}]},{"id":298828,"name":"com.apple.NSURLConnectionLoader","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592,"symbolLocation":24,"symbol":"OBJC_METACLASS_$_MPSNNGradientStateNode"},{"value":303495274037248},{"value":0},{"value":303495274037248},{"value":2},{"value":4294967295},{"value":0},{"value":17179869184},{"value":0},{"value":2},{"value":0},{"value":0},{"value":70663},{"value":0},{"value":18446744073709551569},{"value":8611827872},{"value":0},{"value":4294967295},{"value":2},{"value":303495274037248},{"value":0},{"value":303495274037248},{"value":6134357320},{"value":8589934592,"symbolLocation":24,"symbol":"OBJC_METACLASS_$_MPSNNGradientStateNode"},{"value":21592279046},{"value":18446744073709550527},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761025576},"cpsr":{"value":4096},"fp":{"value":6134357168},"sp":{"value":6134357088},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950836},"far":{"value":0}},"frames":[{"imageOffset":3124,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":77864,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":52},{"imageOffset":39308,"symbol":"mach_msg_overwrite","symbolLocation":484,"imageIndex":52},{"imageOffset":4020,"symbol":"mach_msg","symbolLocation":24,"imageIndex":52},{"imageOffset":392096,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":160,"imageIndex":53},{"imageOffset":386296,"symbol":"__CFRunLoopRun","symbolLocation":1188,"imageIndex":53},{"imageOffset":1150516,"symbol":"_CFRunLoopRunSpecificWithOptions","symbolLocation":532,"imageIndex":53},{"imageOffset":2407216,"symbol":"+[__CFN_CoreSchedulingSetRunnable _run:]","symbolLocation":416,"imageIndex":65},{"imageOffset":157600,"symbol":"__NSThread__start__","symbolLocation":732,"imageIndex":60},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298833,"name":"NIO-SGLTN-0-#0","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":43134013440},{"value":64},{"value":6134931408},{"value":6134930144},{"value":6134931656},{"value":6134930112},{"value":6134930688},{"value":16},{"value":16},{"value":4378234936,"symbolLocation":16,"symbol":"full type metadata for timespec"},{"value":6134931360},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6134931824},{"value":6134930688},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4351887152},"cpsr":{"value":536875008},"fp":{"value":6134929984},"sp":{"value":6134929984},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":52},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944300,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":64},{"imageOffset":12944428,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":52,"imageIndex":0},{"imageOffset":12473996,"sourceFile":"\/<compiler-generated>","symbol":"withUnsafePointer<A, B, C>(to:_:)","symbolLocation":92,"imageIndex":0},{"imageOffset":12943988,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":416},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298834,"name":"NIO-SGLTN-0-#1","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":43126927360},{"value":64},{"value":0},{"value":6135503888},{"value":18446726482597246976},{"value":6135503856},{"value":6135504432},{"value":16},{"value":1},{"value":0},{"value":3765009292858652478,"symbolLocation":3765009288481734658,"symbol":"method descriptor for MPVWrapper.duration.getter"},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6135505264},{"value":6135504432},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4351887152},"cpsr":{"value":536875008},"fp":{"value":6135503728},"sp":{"value":6135503728},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":52},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944088,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":516},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298835,"name":"NIO-SGLTN-0-#2","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":43132207104},{"value":64},{"value":0},{"value":6136077328},{"value":18446726482597246976},{"value":6136077296},{"value":6136077872},{"value":16},{"value":1},{"value":0},{"value":3765009292858652478,"symbolLocation":3765009288481734658,"symbol":"method descriptor for MPVWrapper.duration.getter"},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6136078704},{"value":6136077872},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4351887152},"cpsr":{"value":536875008},"fp":{"value":6136077168},"sp":{"value":6136077168},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":52},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944088,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":516},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298836,"name":"NIO-SGLTN-0-#3","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":43122620416},{"value":64},{"value":0},{"value":6136650768},{"value":18446726482597246976},{"value":6136650736},{"value":6136651312},{"value":16},{"value":1},{"value":0},{"value":3765009292858652478,"symbolLocation":3765009288481734658,"symbol":"method descriptor for MPVWrapper.duration.getter"},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6136652144},{"value":6136651312},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4351887152},"cpsr":{"value":536875008},"fp":{"value":6136650608},"sp":{"value":6136650608},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":52},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944088,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":516},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298837,"name":"NIO-SGLTN-0-#4","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":43122610176},{"value":64},{"value":0},{"value":6137224208},{"value":18446726482597246976},{"value":6137224176},{"value":6137224752},{"value":16},{"value":1},{"value":0},{"value":3765009292858652478,"symbolLocation":3765009288481734658,"symbol":"method descriptor for MPVWrapper.duration.getter"},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6137225584},{"value":6137224752},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4351887152},"cpsr":{"value":536875008},"fp":{"value":6137224048},"sp":{"value":6137224048},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":52},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944088,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":516},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298838,"name":"NIO-SGLTN-0-#5","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":43122608128},{"value":64},{"value":6137798608},{"value":6137797344},{"value":6137798856},{"value":6137797312},{"value":6137797888},{"value":16},{"value":16},{"value":4378234936,"symbolLocation":16,"symbol":"full type metadata for timespec"},{"value":6137798560},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6137799024},{"value":6137797888},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4351887152},"cpsr":{"value":536875008},"fp":{"value":6137797184},"sp":{"value":6137797184},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":52},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944300,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":64},{"imageOffset":12944428,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":52,"imageIndex":0},{"imageOffset":12473996,"sourceFile":"\/<compiler-generated>","symbol":"withUnsafePointer<A, B, C>(to:_:)","symbolLocation":92,"imageIndex":0},{"imageOffset":12943988,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":416},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298839,"name":"NIO-SGLTN-0-#6","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":43122616320},{"value":64},{"value":0},{"value":6138371088},{"value":18446726482597246976},{"value":6138371056},{"value":6138371632},{"value":16},{"value":1},{"value":0},{"value":3765009292858652478,"symbolLocation":3765009288481734658,"symbol":"method descriptor for MPVWrapper.duration.getter"},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6138372464},{"value":6138371632},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4351887152},"cpsr":{"value":536875008},"fp":{"value":6138370928},"sp":{"value":6138370928},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":52},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944088,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":516},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298840,"name":"NIO-SGLTN-0-#7","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":43122618368},{"value":64},{"value":6138945488},{"value":6138944224},{"value":6138945736},{"value":6138944192},{"value":6138944768},{"value":16},{"value":16},{"value":4378234936,"symbolLocation":16,"symbol":"full type metadata for timespec"},{"value":6138945440},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6138945904},{"value":6138944768},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4351887152},"cpsr":{"value":536875008},"fp":{"value":6138944064},"sp":{"value":6138944064},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":52},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944300,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":64},{"imageOffset":12944428,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":52,"imageIndex":0},{"imageOffset":12473996,"sourceFile":"\/<compiler-generated>","symbol":"withUnsafePointer<A, B, C>(to:_:)","symbolLocation":92,"imageIndex":0},{"imageOffset":12943988,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":416},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298841,"name":"TP-#0","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":18446726483666796544},{"value":1},{"value":43143867296},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":72195},{"value":18446744073709551615},{"value":42842513464},{"value":3},{"value":1},{"value":43136058176},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43143711776},{"value":43143711712},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6139521952},"sp":{"value":6139521936},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":66},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":66},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298842,"name":"TP-#1","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":8636359368,"symbolLocation":8,"symbol":"type metadata for ()"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":72195},{"value":18446744073709551615},{"value":42842513464},{"value":3},{"value":1},{"value":43136058176},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43143711776},{"value":43143711712},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6140095392},"sp":{"value":6140095376},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":66},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":66},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298843,"name":"TP-#2","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":18446726483666796544},{"value":1},{"value":43137369312},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":72195},{"value":18446744073709551615},{"value":42842513464},{"value":3},{"value":1},{"value":43136058176},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43143711776},{"value":43143711712},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6140668832},"sp":{"value":6140668816},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":66},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":66},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298844,"name":"TP-#3","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":8636359368,"symbolLocation":8,"symbol":"type metadata for ()"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":72195},{"value":18446744073709551615},{"value":42842513464},{"value":3},{"value":1},{"value":43136058176},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43143711776},{"value":43143711712},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6141242272},"sp":{"value":6141242256},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":66},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":66},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298845,"name":"TP-#4","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":8636359368,"symbolLocation":8,"symbol":"type metadata for ()"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":72195},{"value":18446744073709551615},{"value":42842513464},{"value":3},{"value":1},{"value":43136058176},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43143711776},{"value":43143711712},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6141815712},"sp":{"value":6141815696},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":66},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":66},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298846,"name":"TP-#5","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":8636359368,"symbolLocation":8,"symbol":"type metadata for ()"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":72195},{"value":18446744073709551615},{"value":42842513464},{"value":3},{"value":1},{"value":43136058176},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43143711776},{"value":43143711712},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6142389152},"sp":{"value":6142389136},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":66},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":66},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298847,"name":"TP-#6","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":8636359368,"symbolLocation":8,"symbol":"type metadata for ()"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":72195},{"value":18446744073709551615},{"value":42842513464},{"value":3},{"value":1},{"value":43136058176},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43143711776},{"value":43143711712},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6142962592},"sp":{"value":6142962576},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":66},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":66},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":298848,"name":"TP-#7","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":0},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":72195},{"value":18446744073709551615},{"value":42842513464},{"value":3},{"value":1},{"value":43136058176},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43143711776},{"value":43143711712},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6143536032},"sp":{"value":6143536016},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":66},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":66},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299025,"name":"core","threadState":{"x":[{"value":260},{"value":0},{"value":726272},{"value":0},{"value":0},{"value":164},{"value":0},{"value":0},{"value":6132640696},{"value":0},{"value":16640},{"value":71468255822082},{"value":71468255822082},{"value":16640},{"value":0},{"value":71468255822080},{"value":305},{"value":8611825992},{"value":0},{"value":43145642720},{"value":43145642784},{"value":6132642016},{"value":0},{"value":0},{"value":726272},{"value":726272},{"value":726784},{"value":4437643728,"symbolLocation":0,"symbol":"num_ptracks"},{"value":43129061456}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6132640816},"sp":{"value":6132640672},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":650240,"symbol":"mp_dispatch_queue_process","symbolLocation":192,"imageIndex":2},{"imageOffset":850820,"symbol":"mp_wait_events","symbolLocation":80,"imageIndex":2},{"imageOffset":857984,"symbol":"run_playloop","symbolLocation":1652,"imageIndex":2},{"imageOffset":834312,"symbol":"play_current_file","symbolLocation":3884,"imageIndex":2},{"imageOffset":830188,"symbol":"mp_play_files","symbolLocation":204,"imageIndex":2},{"imageOffset":738688,"symbol":"core_thread","symbolLocation":76,"imageIndex":2},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299040,"name":"*\/ytdl_hook","threadState":{"x":[{"value":260},{"value":0},{"value":4352},{"value":0},{"value":0},{"value":164},{"value":0},{"value":0},{"value":6133213448},{"value":0},{"value":0},{"value":2},{"value":2},{"value":0},{"value":0},{"value":0},{"value":305},{"value":8611825992},{"value":0},{"value":43160931736},{"value":43160931800},{"value":6133215456},{"value":0},{"value":0},{"value":4352},{"value":4353},{"value":4608},{"value":5107892144},{"value":5107892000}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6133213568},"sp":{"value":6133213424},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":736964,"symbol":"wait_wakeup","symbolLocation":92,"imageIndex":2},{"imageOffset":739244,"symbol":"mpv_wait_event","symbolLocation":464,"imageIndex":2},{"imageOffset":1188888,"symbol":"script_raw_wait_event","symbolLocation":64,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":1187992,"symbol":"load_scripts","symbolLocation":332,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64728,"symbol":"lua_cpcall","symbolLocation":28,"imageIndex":16},{"imageOffset":871644,"symbol":"run_script","symbolLocation":92,"imageIndex":2},{"imageOffset":871732,"symbol":"script_thread","symbolLocation":12,"imageIndex":2},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299041,"name":"*\/stats","threadState":{"x":[{"value":260},{"value":0},{"value":3840},{"value":0},{"value":0},{"value":164},{"value":0},{"value":0},{"value":6144108808},{"value":0},{"value":0},{"value":2},{"value":2},{"value":0},{"value":0},{"value":0},{"value":305},{"value":8611825992},{"value":0},{"value":43160932376},{"value":43160932440},{"value":6144110816},{"value":0},{"value":0},{"value":3840},{"value":3841},{"value":4096},{"value":5108591624},{"value":5108591480}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6144108928},"sp":{"value":6144108784},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":736964,"symbol":"wait_wakeup","symbolLocation":92,"imageIndex":2},{"imageOffset":739244,"symbol":"mpv_wait_event","symbolLocation":464,"imageIndex":2},{"imageOffset":1188888,"symbol":"script_raw_wait_event","symbolLocation":64,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":1187992,"symbol":"load_scripts","symbolLocation":332,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64728,"symbol":"lua_cpcall","symbolLocation":28,"imageIndex":16},{"imageOffset":871644,"symbol":"run_script","symbolLocation":92,"imageIndex":2},{"imageOffset":871732,"symbol":"script_thread","symbolLocation":12,"imageIndex":2},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299042,"name":"*\/console","threadState":{"x":[{"value":260},{"value":0},{"value":6656},{"value":0},{"value":0},{"value":164},{"value":0},{"value":0},{"value":6144682248},{"value":0},{"value":0},{"value":2},{"value":2},{"value":0},{"value":0},{"value":0},{"value":305},{"value":8611825992},{"value":0},{"value":43160933016},{"value":43160933080},{"value":6144684256},{"value":0},{"value":0},{"value":6656},{"value":6657},{"value":6912},{"value":5109572520},{"value":5109572376}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6144682368},"sp":{"value":6144682224},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":736964,"symbol":"wait_wakeup","symbolLocation":92,"imageIndex":2},{"imageOffset":739244,"symbol":"mpv_wait_event","symbolLocation":464,"imageIndex":2},{"imageOffset":1188888,"symbol":"script_raw_wait_event","symbolLocation":64,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":1187992,"symbol":"load_scripts","symbolLocation":332,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64728,"symbol":"lua_cpcall","symbolLocation":28,"imageIndex":16},{"imageOffset":871644,"symbol":"run_script","symbolLocation":92,"imageIndex":2},{"imageOffset":871732,"symbol":"script_thread","symbolLocation":12,"imageIndex":2},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299044,"name":"*\/select","threadState":{"x":[{"value":260},{"value":0},{"value":3328},{"value":0},{"value":0},{"value":164},{"value":0},{"value":0},{"value":6145829128},{"value":0},{"value":0},{"value":2},{"value":2},{"value":0},{"value":0},{"value":0},{"value":305},{"value":8611825992},{"value":0},{"value":43160934296},{"value":43160934360},{"value":6145831136},{"value":0},{"value":0},{"value":3328},{"value":3329},{"value":3584},{"value":5107761144},{"value":5107761000}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6145829248},"sp":{"value":6145829104},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":736964,"symbol":"wait_wakeup","symbolLocation":92,"imageIndex":2},{"imageOffset":739244,"symbol":"mpv_wait_event","symbolLocation":464,"imageIndex":2},{"imageOffset":1188888,"symbol":"script_raw_wait_event","symbolLocation":64,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":1187992,"symbol":"load_scripts","symbolLocation":332,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64728,"symbol":"lua_cpcall","symbolLocation":28,"imageIndex":16},{"imageOffset":871644,"symbol":"run_script","symbolLocation":92,"imageIndex":2},{"imageOffset":871732,"symbol":"script_thread","symbolLocation":12,"imageIndex":2},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299045,"name":"*\/positioning","threadState":{"x":[{"value":260},{"value":0},{"value":3584},{"value":0},{"value":0},{"value":164},{"value":0},{"value":0},{"value":6146402568},{"value":0},{"value":0},{"value":2},{"value":2},{"value":0},{"value":0},{"value":0},{"value":305},{"value":8611825992},{"value":0},{"value":43160934936},{"value":43160935000},{"value":6146404576},{"value":0},{"value":0},{"value":3584},{"value":3585},{"value":3840},{"value":5106630576},{"value":5106630432}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6146402688},"sp":{"value":6146402544},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":736964,"symbol":"wait_wakeup","symbolLocation":92,"imageIndex":2},{"imageOffset":739244,"symbol":"mpv_wait_event","symbolLocation":464,"imageIndex":2},{"imageOffset":1188888,"symbol":"script_raw_wait_event","symbolLocation":64,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":1187992,"symbol":"load_scripts","symbolLocation":332,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64728,"symbol":"lua_cpcall","symbolLocation":28,"imageIndex":16},{"imageOffset":871644,"symbol":"run_script","symbolLocation":92,"imageIndex":2},{"imageOffset":871732,"symbol":"script_thread","symbolLocation":12,"imageIndex":2},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299046,"name":"*\/commands","threadState":{"x":[{"value":260},{"value":0},{"value":3328},{"value":0},{"value":0},{"value":164},{"value":0},{"value":0},{"value":6146976008},{"value":0},{"value":0},{"value":2},{"value":2},{"value":0},{"value":0},{"value":0},{"value":305},{"value":8611825992},{"value":0},{"value":43160935576},{"value":43160935640},{"value":6146978016},{"value":0},{"value":0},{"value":3328},{"value":3329},{"value":3584},{"value":5109976544},{"value":5109976400}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6146976128},"sp":{"value":6146975984},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":736964,"symbol":"wait_wakeup","symbolLocation":92,"imageIndex":2},{"imageOffset":739244,"symbol":"mpv_wait_event","symbolLocation":464,"imageIndex":2},{"imageOffset":1188888,"symbol":"script_raw_wait_event","symbolLocation":64,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":1187992,"symbol":"load_scripts","symbolLocation":332,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64728,"symbol":"lua_cpcall","symbolLocation":28,"imageIndex":16},{"imageOffset":871644,"symbol":"run_script","symbolLocation":92,"imageIndex":2},{"imageOffset":871732,"symbol":"script_thread","symbolLocation":12,"imageIndex":2},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299047,"name":"*\/context_menu","threadState":{"x":[{"value":260},{"value":0},{"value":3328},{"value":0},{"value":0},{"value":164},{"value":0},{"value":0},{"value":6147549448},{"value":0},{"value":0},{"value":2},{"value":2},{"value":0},{"value":0},{"value":0},{"value":305},{"value":8611825992},{"value":0},{"value":43160936216},{"value":43160936280},{"value":6147551456},{"value":0},{"value":0},{"value":3328},{"value":3329},{"value":3584},{"value":5107630000},{"value":5107629856}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6147549568},"sp":{"value":6147549424},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":736964,"symbol":"wait_wakeup","symbolLocation":92,"imageIndex":2},{"imageOffset":739244,"symbol":"mpv_wait_event","symbolLocation":464,"imageIndex":2},{"imageOffset":1188888,"symbol":"script_raw_wait_event","symbolLocation":64,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":1187992,"symbol":"load_scripts","symbolLocation":332,"imageIndex":2},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64664,"symbol":"lua_pcall","symbolLocation":152,"imageIndex":16},{"imageOffset":12292,"imageIndex":16},{"imageOffset":64728,"symbol":"lua_cpcall","symbolLocation":28,"imageIndex":16},{"imageOffset":871644,"symbol":"run_script","symbolLocation":92,"imageIndex":2},{"imageOffset":871732,"symbol":"script_thread","symbolLocation":12,"imageIndex":2},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299053,"frames":[],"threadState":{"x":[{"value":6148698112},{"value":98931},{"value":6148161536},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6148698112},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"triggered":true,"id":299055,"threadState":{"x":[{"value":0},{"value":0},{"value":8356},{"value":1},{"value":43161612992},{"value":0},{"value":98},{"value":18446726482597246976},{"value":0},{"value":4437639608,"symbolLocation":16,"symbol":"deprecated_events"},{"value":4398046512130},{"value":1099511627776},{"value":4294967293},{"value":4398046511104},{"value":1024},{"value":0},{"value":4398046512128},{"value":4398046512130},{"value":0},{"value":43145538896},{"value":6148123312},{"value":0},{"value":43146003344},{"value":0},{"value":93},{"value":6148124896},{"value":0},{"value":4293984255},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4437022856},"cpsr":{"value":1610616832},"fp":{"value":6148120880},"sp":{"value":6148120800},"esr":{"value":2449473542,"description":"(Data Abort) byte read Translation fault"},"pc":{"value":4437022860,"matchesCrashFrame":1},"far":{"value":72}},"queue":"com.apple.root.default-qos.cooperative","frames":[{"imageOffset":743564,"symbol":"mpv_get_property","symbolLocation":116,"imageIndex":2},{"imageOffset":743560,"symbol":"mpv_get_property","symbolLocation":112,"imageIndex":2},{"imageOffset":23062248,"sourceLine":877,"sourceFile":"MPVWrapper.swift","symbol":"MPVWrapper.getSubtitleTracks()","imageIndex":0,"symbolLocation":1516},{"imageOffset":23125232,"sourceFile":"\/<compiler-generated>","symbol":"protocol witness for MPVController.getSubtitleTracks() in conformance MPVWrapper","symbolLocation":36,"imageIndex":0},{"imageOffset":29819593,"sourceLine":198,"sourceFile":"SubtitleService.swift","symbol":"MPVSubtitleService.scanEmbeddedTracks(isFastPath:)","imageIndex":0,"symbolLocation":1},{"imageOffset":29804089,"sourceLine":91,"sourceFile":"SubtitleService.swift","symbol":"closure #1 in MPVSubtitleService.setupObservers()","imageIndex":0,"symbolLocation":1},{"imageOffset":29804597,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in MPVSubtitleService.setupObservers()","symbolLocation":1,"imageIndex":0},{"imageOffset":1205301,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A)","symbolLocation":1,"imageIndex":0},{"imageOffset":16404325,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for thunk for @escaping @isolated(any) @callee_guaranteed @async () -> (@out A)","symbolLocation":1,"imageIndex":0},{"imageOffset":447229,"symbol":"completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*)","symbolLocation":1,"imageIndex":61}]},{"id":299097,"name":"demux","threadState":{"x":[{"value":260},{"value":0},{"value":1514496},{"value":0},{"value":0},{"value":164},{"value":0},{"value":978705750},{"value":6149844728},{"value":0},{"value":90368},{"value":388127604695298},{"value":388127604695298},{"value":90368},{"value":0},{"value":388127604695296},{"value":305},{"value":8611825992},{"value":0},{"value":43162332552},{"value":43162332616},{"value":6149845216},{"value":978705750},{"value":0},{"value":1514496},{"value":1514497},{"value":1514752},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6149844848},"sp":{"value":6149844704},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":451620,"symbol":"demux_thread","symbolLocation":264,"imageIndex":2},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299098,"name":"worker","threadState":{"x":[{"value":260},{"value":0},{"value":0},{"value":0},{"value":0},{"value":164},{"value":0},{"value":0},{"value":6150418136},{"value":0},{"value":0},{"value":2},{"value":2},{"value":0},{"value":0},{"value":0},{"value":305},{"value":8611825992},{"value":0},{"value":43155561816},{"value":43155561880},{"value":6150418656},{"value":0},{"value":0},{"value":0},{"value":1},{"value":256},{"value":4437117144,"symbolLocation":0,"symbol":"load_external_opts_thread"},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761226460},"cpsr":{"value":1610616832},"fp":{"value":6150418256},"sp":{"value":6150418112},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760965368},"far":{"value":0}},"frames":[{"imageOffset":17656,"symbol":"__psynch_cvwait","symbolLocation":8,"imageIndex":52},{"imageOffset":28892,"symbol":"_pthread_cond_wait","symbolLocation":984,"imageIndex":62},{"imageOffset":662096,"symbol":"worker_thread","symbolLocation":196,"imageIndex":2},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299114,"name":"com.apple.coremedia.sharedRootQueue.47","threadState":{"x":[{"value":14},{"value":4294967115611373572},{"value":999999958},{"value":68719460488},{"value":43162071168},{"value":0},{"value":0},{"value":35},{"value":999999958},{"value":3},{"value":13835058055282163714},{"value":80000000},{"value":5911694186427136},{"value":5894099852897040},{"value":45056},{"value":44},{"value":18446744073709551578},{"value":8611830336},{"value":0},{"value":251569146308},{"value":43161622080},{"value":1000000000},{"value":43161621944},{"value":6154432736},{"value":0},{"value":0},{"value":18446744071411073023},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759619724},"cpsr":{"value":2147487744},"fp":{"value":6154432320},"sp":{"value":6154432288},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950728},"far":{"value":0}},"frames":[{"imageOffset":3016,"symbol":"semaphore_timedwait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":224396,"symbol":"_dispatch_sema4_timedwait","symbolLocation":64,"imageIndex":66},{"imageOffset":16136,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":76,"imageIndex":66},{"imageOffset":81344,"symbol":"_dispatch_worker_thread","symbolLocation":324,"imageIndex":66},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299133,"name":"caulk.messenger.shared:17","threadState":{"x":[{"value":14},{"value":18290079322},{"value":0},{"value":6155006058},{"value":18290079296},{"value":25},{"value":0},{"value":0},{"value":0},{"value":4294967295},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43109443680},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6968933896},"cpsr":{"value":2147487744},"fp":{"value":6155005824},"sp":{"value":6155005792},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":7688,"symbol":"caulk::semaphore::timed_wait(double)","symbolLocation":224,"imageIndex":67},{"imageOffset":7344,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":32,"imageIndex":67},{"imageOffset":6480,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*)","symbolLocation":96,"imageIndex":67},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299134,"name":"caulk.messenger.shared:high","threadState":{"x":[{"value":14},{"value":111875},{"value":111875},{"value":15},{"value":4294967295},{"value":0},{"value":0},{"value":0},{"value":0},{"value":4294967295},{"value":1},{"value":43117370936},{"value":0},{"value":0},{"value":0},{"value":0},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43109442560},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6968933896},"cpsr":{"value":2147487744},"fp":{"value":6155579264},"sp":{"value":6155579232},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":7688,"symbol":"caulk::semaphore::timed_wait(double)","symbolLocation":224,"imageIndex":67},{"imageOffset":7344,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":32,"imageIndex":67},{"imageOffset":6480,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*)","symbolLocation":96,"imageIndex":67},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299155,"name":"caulk::deferred_logger","threadState":{"x":[{"value":14},{"value":1},{"value":0},{"value":1},{"value":0},{"value":1},{"value":0},{"value":0},{"value":0},{"value":4294967295},{"value":0},{"value":0},{"value":5441929248},{"value":6156152504},{"value":67104768},{"value":0},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":43112943832},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6968933896},"cpsr":{"value":2147487744},"fp":{"value":6156152704},"sp":{"value":6156152672},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":7688,"symbol":"caulk::semaphore::timed_wait(double)","symbolLocation":224,"imageIndex":67},{"imageOffset":7344,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":32,"imageIndex":67},{"imageOffset":6480,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*)","symbolLocation":96,"imageIndex":67},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299158,"name":"com.apple.audio.IOThread.client","threadState":{"x":[{"value":14},{"value":140803},{"value":0},{"value":0},{"value":0},{"value":32},{"value":5446708528},{"value":2},{"value":1},{"value":14522835630989770803},{"value":1099511628032},{"value":1099511628034},{"value":48},{"value":43110599760},{"value":116},{"value":256},{"value":18446744073709551579},{"value":8611830360},{"value":0},{"value":43120693048},{"value":43120693040},{"value":43120693072},{"value":1},{"value":43137391424},{"value":2035},{"value":0},{"value":6820027352},{"value":43120693040},{"value":43120692224}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6969053100},"cpsr":{"value":1610616832},"fp":{"value":6156725504},"sp":{"value":6156725488},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950716},"far":{"value":0}},"frames":[{"imageOffset":3004,"symbol":"semaphore_wait_signal_trap","symbolLocation":8,"imageIndex":52},{"imageOffset":126892,"symbol":"caulk::mach::semaphore::wait_signal_or_error(caulk::mach::semaphore&)","symbolLocation":36,"imageIndex":67},{"imageOffset":2123504,"symbol":"HALC_ProxyIOContext::IOWorkLoop()","symbolLocation":5052,"imageIndex":68},{"imageOffset":2116748,"symbol":"invocation function for block in HALC_ProxyIOContext::HALC_ProxyIOContext(unsigned int, unsigned int)","symbolLocation":172,"imageIndex":68},{"imageOffset":4007696,"symbol":"HALC_IOThread::Entry(void*)","symbolLocation":88,"imageIndex":68},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":299445,"frames":[],"threadState":{"x":[{"value":6130348032},{"value":126419},{"value":6129811456},{"value":0},{"value":409602},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6130348032},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"id":299446,"frames":[],"threadState":{"x":[{"value":6132068352},{"value":0},{"value":6131531776},{"value":0},{"value":278532},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6132068352},"esr":{"value":0},"pc":{"value":6761204628},"far":{"value":0}}},{"id":299447,"frames":[],"threadState":{"x":[{"value":6145257472},{"value":0},{"value":6144720896},{"value":0},{"value":278532},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6145257472},"esr":{"value":0},"pc":{"value":6761204628},"far":{"value":0}}}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4338810880,
    "CFBundleShortVersionString" : "v1.0.182",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 39141376,
    "uuid" : "2f5097c7-941a-326d-9398-381c98c97368",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "182"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4429611008,
    "CFBundleShortVersionString" : "2.8.0",
    "CFBundleIdentifier" : "org.sparkle-project.Sparkle",
    "size" : 294912,
    "uuid" : "8f886ac7-3842-3b7f-bbf2-c56ffa529f6e",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/Sparkle.framework\/Versions\/B\/Sparkle",
    "name" : "Sparkle",
    "CFBundleVersion" : "2049"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4436279296,
    "size" : 3473408,
    "uuid" : "03681c00-9c6b-3c36-b18e-0aa5ab84556f",
    "path" : "\/opt\/homebrew\/*\/libmpv.2.dylib",
    "name" : "libmpv.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4428988416,
    "size" : 163840,
    "uuid" : "e8ec394f-559b-32d9-9a38-9d520ad185a3",
    "path" : "\/opt\/homebrew\/*\/libass.9.dylib",
    "name" : "libass.9.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4450451456,
    "size" : 9125888,
    "uuid" : "ee19c04e-0da1-391a-a0c4-8d071b295fff",
    "path" : "\/opt\/homebrew\/*\/libavcodec.62.11.100.dylib",
    "name" : "libavcodec.62.11.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4440784896,
    "size" : 2408448,
    "uuid" : "5c71529c-36df-3e36-b1b3-5c9300b11b48",
    "path" : "\/opt\/homebrew\/*\/libavfilter.11.4.100.dylib",
    "name" : "libavfilter.11.4.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4443832320,
    "size" : 1982464,
    "uuid" : "02b4dc77-f5d6-34b9-9927-325f6fff3b2b",
    "path" : "\/opt\/homebrew\/*\/libavformat.62.3.100.dylib",
    "name" : "libavformat.62.3.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4466491392,
    "size" : 475136,
    "uuid" : "71234acb-1735-3a3b-9a25-586ec4fe16fd",
    "path" : "\/opt\/homebrew\/*\/libavutil.60.8.100.dylib",
    "name" : "libavutil.60.8.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4431790080,
    "size" : 704512,
    "uuid" : "03007277-7fb4-3f37-adfd-90e73cbef1a4",
    "path" : "\/opt\/homebrew\/*\/libplacebo.351.dylib",
    "name" : "libplacebo.351.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4428840960,
    "size" : 65536,
    "uuid" : "275fc1a4-0ec7-3969-a142-5d02807123eb",
    "path" : "\/opt\/homebrew\/*\/libswresample.6.1.100.dylib",
    "name" : "libswresample.6.1.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4430561280,
    "size" : 458752,
    "uuid" : "db53fb7b-4b83-3840-8a23-b6f4ccdedd84",
    "path" : "\/opt\/homebrew\/*\/libswscale.9.1.100.dylib",
    "name" : "libswscale.9.1.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4430036992,
    "size" : 229376,
    "uuid" : "1bcda6e7-e51f-326c-86b8-30f68e27b474",
    "path" : "\/opt\/homebrew\/*\/libmujs.dylib",
    "name" : "libmujs.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4433117184,
    "size" : 262144,
    "uuid" : "8544ae79-c27a-3dce-ad01-cfb0ed1269c7",
    "path" : "\/opt\/homebrew\/*\/liblcms2.2.dylib",
    "name" : "liblcms2.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4434198528,
    "size" : 557056,
    "uuid" : "551362f7-cccf-34f0-896d-d8056eac3dc0",
    "path" : "\/opt\/homebrew\/*\/libarchive.13.dylib",
    "name" : "libarchive.13.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4429414400,
    "size" : 81920,
    "uuid" : "ba5a7055-bb2a-363c-a69f-038e1fdd6512",
    "path" : "\/opt\/homebrew\/*\/libavdevice.62.1.100.dylib",
    "name" : "libavdevice.62.1.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4433494016,
    "size" : 262144,
    "uuid" : "cca3fbbc-a2d1-3cdd-84f7-744df4503c8e",
    "path" : "\/opt\/homebrew\/*\/libbluray.3.dylib",
    "name" : "libbluray.3.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4435460096,
    "size" : 475136,
    "uuid" : "291ec50f-e60a-364c-bf1c-efe9fb72b3b5",
    "path" : "\/opt\/homebrew\/*\/libluajit-5.1.2.1.1767980792.dylib",
    "name" : "libluajit-5.1.2.1.1767980792.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4446142464,
    "size" : 196608,
    "uuid" : "10cae9d2-9881-3c25-a61c-50a01ab16891",
    "path" : "\/opt\/homebrew\/*\/librubberband.3.dylib",
    "name" : "librubberband.3.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4433870848,
    "size" : 163840,
    "uuid" : "c9e5de7d-3102-3d1d-a9e6-7ceb28632936",
    "path" : "\/opt\/homebrew\/*\/libuchardet.0.0.8.dylib",
    "name" : "libuchardet.0.0.8.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4429250560,
    "size" : 16384,
    "uuid" : "094c5db3-9852-3694-b933-4f9ee8828550",
    "path" : "\/opt\/homebrew\/*\/libvapoursynth-script.0.dylib",
    "name" : "libvapoursynth-script.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4446535680,
    "size" : 229376,
    "uuid" : "71bc0e48-c7b2-3658-98c0-1782add5bc6d",
    "path" : "\/opt\/homebrew\/*\/libzimg.2.dylib",
    "name" : "libzimg.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4446945280,
    "size" : 393216,
    "uuid" : "b12ad9a5-f87d-3b9f-9195-9e408319fd3a",
    "path" : "\/opt\/homebrew\/*\/libjpeg.8.3.2.dylib",
    "name" : "libjpeg.8.3.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4448075776,
    "size" : 425984,
    "uuid" : "94a5736e-3150-3ca2-895f-b3d8a5c7c031",
    "path" : "\/opt\/homebrew\/*\/libvulkan.1.4.335.dylib",
    "name" : "libvulkan.1.4.335.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4448714752,
    "size" : 507904,
    "uuid" : "453df297-0ca4-35f8-bb25-dd04bce98b59",
    "path" : "\/opt\/homebrew\/*\/libfreetype.6.dylib",
    "name" : "libfreetype.6.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4432740352,
    "size" : 114688,
    "uuid" : "01c59dc9-20b2-319c-88c2-0f7698cc2bc9",
    "path" : "\/opt\/homebrew\/*\/libfribidi.0.dylib",
    "name" : "libfribidi.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4485201920,
    "size" : 770048,
    "uuid" : "67cf7c00-9bfe-3fc6-b4d1-769ffc46bc68",
    "path" : "\/opt\/homebrew\/*\/libharfbuzz.0.dylib",
    "name" : "libharfbuzz.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4432920576,
    "size" : 131072,
    "uuid" : "8dd7f56f-29c0-32a0-9749-459aa763bcb4",
    "path" : "\/opt\/homebrew\/*\/libunibreak.6.dylib",
    "name" : "libunibreak.6.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4434903040,
    "size" : 147456,
    "uuid" : "a5335a51-59c1-3fc7-acb6-b28db402d52c",
    "path" : "\/opt\/homebrew\/*\/libpng16.16.dylib",
    "name" : "libpng16.16.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4487790592,
    "size" : 1032192,
    "uuid" : "95f652fe-0fda-36d0-b6d0-34427409a2fe",
    "path" : "\/opt\/homebrew\/*\/libglib-2.0.0.dylib",
    "name" : "libglib-2.0.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4435116032,
    "size" : 81920,
    "uuid" : "481f6d39-27e3-3c77-a203-99ddb4e2de7f",
    "path" : "\/opt\/homebrew\/*\/libgraphite2.3.2.1.dylib",
    "name" : "libgraphite2.3.2.1.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4447436800,
    "size" : 163840,
    "uuid" : "4fbeeaca-81e4-303f-840e-2014b4b1b057",
    "path" : "\/opt\/homebrew\/*\/libintl.8.dylib",
    "name" : "libintl.8.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4483973120,
    "size" : 491520,
    "uuid" : "0d65de6e-7082-35af-b6d4-ae160ae9d32e",
    "path" : "\/opt\/homebrew\/*\/libpcre2-8.0.dylib",
    "name" : "libpcre2-8.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4490919936,
    "size" : 1540096,
    "uuid" : "93bc5562-16ec-3ab4-a0cc-6692b3d8f5be",
    "path" : "\/opt\/homebrew\/*\/libvpx.11.dylib",
    "name" : "libvpx.11.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4486430720,
    "size" : 622592,
    "uuid" : "b317db1b-7e5e-3ad6-8dfb-5f30139ba348",
    "path" : "\/opt\/homebrew\/*\/libdav1d.7.dylib",
    "name" : "libdav1d.7.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4449353728,
    "size" : 212992,
    "uuid" : "856fb90d-91ac-3a42-b529-e895af08115c",
    "path" : "\/opt\/homebrew\/*\/libmp3lame.0.dylib",
    "name" : "libmp3lame.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4449845248,
    "size" : 311296,
    "uuid" : "1c7445f6-fb0e-33ea-8aa8-18597a9443ac",
    "path" : "\/opt\/homebrew\/*\/libopus.0.dylib",
    "name" : "libopus.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4495572992,
    "size" : 2539520,
    "uuid" : "08ba4734-ecf7-352b-8d91-9ee8000ae75b",
    "path" : "\/opt\/homebrew\/*\/libSvtAv1Enc.3.1.2.dylib",
    "name" : "libSvtAv1Enc.3.1.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4492705792,
    "size" : 1179648,
    "uuid" : "b916484f-5239-335b-b9fe-4e71261da16b",
    "path" : "\/opt\/homebrew\/*\/libx264.165.dylib",
    "name" : "libx264.165.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4505288704,
    "size" : 4177920,
    "uuid" : "590e5411-20b2-3cf7-9f18-7e2f3611f7a7",
    "path" : "\/opt\/homebrew\/*\/libx265.215.dylib",
    "name" : "libx265.215.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4518051840,
    "size" : 3899392,
    "uuid" : "6492c8fd-dac0-342e-8cbe-063c6b427304",
    "path" : "\/opt\/homebrew\/*\/libshaderc_shared.1.dylib",
    "name" : "libshaderc_shared.1.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4435263488,
    "size" : 131072,
    "uuid" : "7e7bef36-1537-3b34-91b7-eca90293ba43",
    "path" : "\/opt\/homebrew\/*\/liblzma.5.dylib",
    "name" : "liblzma.5.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4489805824,
    "size" : 557056,
    "uuid" : "93a01ac5-b367-3f6d-9b23-ac6404a111a4",
    "path" : "\/opt\/homebrew\/*\/libzstd.1.5.7.dylib",
    "name" : "libzstd.1.5.7.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4436017152,
    "size" : 131072,
    "uuid" : "d2dadb7f-f6c0-3a6d-9c83-02596baca219",
    "path" : "\/opt\/homebrew\/*\/liblz4.1.10.0.dylib",
    "name" : "liblz4.1.10.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4430348288,
    "size" : 32768,
    "uuid" : "cdb9743e-4399-33d0-a9af-8667f7f00478",
    "path" : "\/opt\/homebrew\/*\/libb2.1.dylib",
    "name" : "libb2.1.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4484562944,
    "size" : 212992,
    "uuid" : "348f051c-4847-3342-a00e-ccd07adf2634",
    "path" : "\/opt\/homebrew\/*\/libfontconfig.1.dylib",
    "name" : "libfontconfig.1.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4430446592,
    "size" : 32768,
    "uuid" : "89b8fe85-c709-33fa-a9ec-9e6368c9cbc8",
    "path" : "\/opt\/homebrew\/*\/libudfread.3.dylib",
    "name" : "libudfread.3.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4501372928,
    "size" : 1490944,
    "uuid" : "0da641e6-fcba-3c1a-8c8c-ff25aadedac6",
    "path" : "\/opt\/homebrew\/*\/libsamplerate.0.2.2.dylib",
    "name" : "libsamplerate.0.2.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4525342720,
    "CFBundleShortVersionString" : "3.14.2, (c) 2001-2024 Python Software Foundation.",
    "CFBundleIdentifier" : "org.python.python",
    "size" : 3981312,
    "uuid" : "d1eea04d-1fad-31b0-a34c-48e935ff166e",
    "path" : "\/opt\/homebrew\/*\/Python.framework\/Versions\/3.14\/Python",
    "name" : "Python",
    "CFBundleVersion" : "3.14.2"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 4484988928,
    "size" : 49152,
    "uuid" : "d4baeab8-b553-3779-a0ff-d8848e7a22df",
    "path" : "\/usr\/lib\/libobjc-trampolines.dylib",
    "name" : "libobjc-trampolines.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 5011832832,
    "CFBundleShortVersionString" : "342.3",
    "CFBundleIdentifier" : "com.apple.AGXMetalG14G",
    "size" : 8142848,
    "uuid" : "fd2ac287-d149-309f-a2ec-eb9d375be6ad",
    "path" : "\/System\/Library\/Extensions\/AGXMetalG14G.bundle\/Contents\/MacOS\/AGXMetalG14G",
    "name" : "AGXMetalG14G",
    "CFBundleVersion" : "342.3"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 5108776960,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.AppleMetalOpenGLRenderer",
    "size" : 409600,
    "uuid" : "4ff7e230-8427-36ad-98f9-10a81f174e7e",
    "path" : "\/System\/Library\/Extensions\/AppleMetalOpenGLRenderer.bundle\/Contents\/MacOS\/AppleMetalOpenGLRenderer",
    "name" : "AppleMetalOpenGLRenderer",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 5445091328,
    "CFBundleShortVersionString" : "1.14",
    "CFBundleIdentifier" : "com.apple.audio.units.Components",
    "size" : 1327104,
    "uuid" : "0312381d-61ae-3ab9-9cea-b1e46a0c4e54",
    "path" : "\/System\/Library\/Components\/CoreAudio.component\/Contents\/MacOS\/CoreAudio",
    "name" : "CoreAudio",
    "CFBundleVersion" : "1.14"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6760947712,
    "size" : 246944,
    "uuid" : "548c45c8-9733-3f0d-8ef4-c06df1df2ad0",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6761484288,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.CoreFoundation",
    "size" : 5540928,
    "uuid" : "649000a2-3eb4-3cf5-970a-d3cb37b5780c",
    "path" : "\/System\/Library\/Frameworks\/CoreFoundation.framework\/Versions\/A\/CoreFoundation",
    "name" : "CoreFoundation",
    "CFBundleVersion" : "4201"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6973874176,
    "CFBundleShortVersionString" : "2.1.1",
    "CFBundleIdentifier" : "com.apple.HIToolbox",
    "size" : 3158656,
    "uuid" : "fb92ce0c-1ee5-3f03-992c-df53ed9b3cb4",
    "path" : "\/System\/Library\/Frameworks\/Carbon.framework\/Versions\/A\/Frameworks\/HIToolbox.framework\/Versions\/A\/HIToolbox",
    "name" : "HIToolbox"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6833123328,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.AppKit",
    "size" : 24310400,
    "uuid" : "4e909aec-68bc-3fc9-a87a-de928e1e36e1",
    "path" : "\/System\/Library\/Frameworks\/AppKit.framework\/Versions\/C\/AppKit",
    "name" : "AppKit",
    "CFBundleVersion" : "2685.30.107"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 7633522688,
    "CFBundleShortVersionString" : "7.2.5.1.401",
    "CFBundleIdentifier" : "com.apple.SwiftUI",
    "size" : 24407328,
    "uuid" : "f0703a94-2852-3e83-9379-1088351e37c9",
    "path" : "\/System\/Library\/Frameworks\/SwiftUI.framework\/Versions\/A\/SwiftUI",
    "name" : "SwiftUI",
    "CFBundleVersion" : "7.2.5.1.401"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6757224448,
    "size" : 651204,
    "uuid" : "0975afba-c46b-364c-bd84-a75daa9e455a",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "size" : 0,
    "source" : "A",
    "base" : 0,
    "uuid" : "00000000-0000-0000-0000-000000000000"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6831710208,
    "CFBundleShortVersionString" : "2.0.2",
    "CFBundleIdentifier" : "com.apple.framework.IOKit",
    "size" : 959840,
    "uuid" : "8138342a-f920-342d-82b9-a2aafc1e8a6a",
    "path" : "\/System\/Library\/Frameworks\/IOKit.framework\/Versions\/A\/IOKit",
    "name" : "IOKit"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6786985984,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.Foundation",
    "size" : 16397536,
    "uuid" : "6a518869-0a98-34cb-8a15-cc28f898255e",
    "path" : "\/System\/Library\/Frameworks\/Foundation.framework\/Versions\/C\/Foundation",
    "name" : "Foundation",
    "CFBundleVersion" : "4201"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 10981220352,
    "size" : 562944,
    "uuid" : "2cd4d4d2-15a3-3057-b506-6e79bd1d6428",
    "path" : "\/usr\/lib\/swift\/libswift_Concurrency.dylib",
    "name" : "libswift_Concurrency.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6761197568,
    "size" : 51900,
    "uuid" : "527c4ba0-91a5-378b-b3e2-d38269ca5a66",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6758375424,
    "size" : 706928,
    "uuid" : "a925150e-a21f-3273-a38d-eb304c5d2d18",
    "path" : "\/usr\/lib\/system\/libcorecrypto.dylib",
    "name" : "libcorecrypto.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 8182067200,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.security.CryptoKit",
    "size" : 650892,
    "uuid" : "966fdbe0-180e-3929-b972-687bd14cb106",
    "path" : "\/System\/Library\/Frameworks\/CryptoKit.framework\/Versions\/A\/CryptoKit",
    "name" : "CryptoKit",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6865321984,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.CFNetwork",
    "size" : 3911936,
    "uuid" : "444dd8ef-e7eb-389b-958c-f45c56c3c4df",
    "path" : "\/System\/Library\/Frameworks\/CFNetwork.framework\/Versions\/A\/CFNetwork",
    "name" : "CFNetwork",
    "CFBundleVersion" : "3860.300.31"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6759395328,
    "size" : 290400,
    "uuid" : "a4b349e8-dd6f-3b71-84d9-34f3b4acd849",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6968926208,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.audio.caulk",
    "size" : 167296,
    "uuid" : "d4644b08-911d-30af-82e7-c404878abf47",
    "path" : "\/System\/Library\/PrivateFrameworks\/caulk.framework\/Versions\/A\/caulk",
    "name" : "caulk"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6812667904,
    "CFBundleShortVersionString" : "5.0",
    "CFBundleIdentifier" : "com.apple.audio.CoreAudio",
    "size" : 8041856,
    "uuid" : "f37b241b-2a83-3f86-bd94-329a18ba4715",
    "path" : "\/System\/Library\/Frameworks\/CoreAudio.framework\/Versions\/A\/CoreAudio",
    "name" : "CoreAudio",
    "CFBundleVersion" : "5.0"
  }
],
  "sharedCache" : {
  "base" : 6756139008,
  "size" : 5653544960,
  "uuid" : "acb998b6-263c-3634-b0a8-ae8270a116c2"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.9G resident=0K(0%) swapped_out_or_unallocated=1.9G(100%)\nWritable regions: Total=387.3M written=865K(0%) resident=865K(0%) swapped_out=0K(0%) unallocated=386.5M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               128K        1 \nActivity Tracing                   256K        1 \nAttributeGraph Data               1024K        1 \nCG image                            16K        1 \nColorSync                           48K        3 \nCoreAnimation                     1040K       60 \nCoreGraphics                        48K        3 \nCoreServices                       224K        1 \nCoreUI image data                  608K        5 \nDispatch continuations            64.0M        1 \nFoundation                        1376K        2 \nImage IO                          3536K       38 \nKernel Alloc Once                   32K        1 \nMALLOC                           251.3M       53 \nMALLOC guard page                 3376K        4 \nOpenGL GLSL                        384K        5 \nSQLite page cache                  640K        5 \nSTACK GUARD                       56.7M       44 \nStack                             30.8M       44 \nVM_ALLOCATE                       5824K       43 \nVM_ALLOCATE (reserved)              32K        1         reserved VM address space (unallocated)\n__AUTH                            5781K      644 \n__AUTH_CONST                      88.0M     1025 \n__CTF                               824        1 \n__DATA                            62.9M     1026 \n__DATA_CONST                      36.1M     1081 \n__DATA_DIRTY                      8688K      882 \n__FONT_DATA                        2352        1 \n__GLSLBUILTINS                    5176K        1 \n__INFO_FILTER                         8        1 \n__LINKEDIT                       648.0M       53 \n__OBJC_RO                         78.4M        1 \n__OBJC_RW                         2570K        1 \n__TEXT                             1.2G     1077 \n__TEXT (graphics)                 35.5M       28 \n__TPRO_CONST                       128K        2 \ndyld private memory                128K        1 \nmapped file                      448.3M       56 \npage table in kernel               865K        1 \nshared memory                     2032K       21 \n===========                     =======  ======= \nTOTAL                              3.0G     6220 \nTOTAL, minus reserved VM space     3.0G     6220 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.root.default-qos.cooperative"
  }
},
  "logWritingSignature" : "ae8a3e6cbd621988aa3697d5f1c86df1fbc23b34",
  "roots_installed" : 0,
  "bug_type" : "309",
  "trmStatus" : 1,
  "trialInfo" : {
  "rollouts" : [
    {
      "rolloutId" : "5fb4245a1bbfe8005e33a1e1",
      "factorPackIds" : [

      ],
      "deploymentId" : 240000021
    },
    {
      "rolloutId" : "670ea6eb7a111748a97092a4",
      "factorPackIds" : [
        "68db21af3b3ace402427b77b"
      ],
      "deploymentId" : 240000189
    }
  ],
  "experiments" : [

  ]
}
}

Model: Mac14,2, BootROM 13822.61.10, proc 8:4:4 processors, 8 GB, SMC 
Graphics: Apple M2, Apple M2, Built-In
Display: Color LCD, 2560 x 1664 Retina, Main, MirrorOff, Online
Memory Module: LPDDR5, Micron
AirPort: spairport_wireless_card_type_wifi (0x14E4, 0x4387), wl0: Sep 22 2025 22:41:34 version 20.131.4.0.8.7.215 FWID 01-45655c04
IO80211_driverkit-1533.5 "IO80211_driverkit-1533.5" Nov 14 2025 18:26:34
AirPort: 
Bluetooth: Version (null), 0 services, 0 devices, 0 incoming serial ports
Network Service: Wi-Fi, AirPort, en0
Thunderbolt Bus: MacBook Air, Apple Inc.
Thunderbolt Bus: MacBook Air, Apple Inc.
