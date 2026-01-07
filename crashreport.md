-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [18848]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [18707]
Responsible:           Electron [521]
User ID:               501

Date/Time:             2026-01-07 05:28:30.2914 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA

Sleep/Wake UUID:       3749ABA0-2510-4B74-887A-E3B2B9F75160

Time Awake Since Boot: 59000 seconds
Time Since Wake:       21986 seconds

System Integrity Protection: enabled

Crashed Thread:        5  Dispatch queue: com.apple.root.user-initiated-qos.cooperative

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 4 Illegal instruction: 4
Terminating Process:   exc handler [18848]

Thread 0::  Dispatch queue: com.apple.main-thread
0   libsystem_kernel.dylib        	    0x7ff80c3eb93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80c3ebca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80c4ef29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80c4ed928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80c4ecd6c CFRunLoopRunSpecific + 562
5   HIToolbox                     	    0x7ff81519f5e6 RunCurrentEventLoopInMode + 292
6   HIToolbox                     	    0x7ff81519f34a ReceiveNextEventCommon + 594
7   HIToolbox                     	    0x7ff81519f0e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
8   AppKit                        	    0x7ff80ef2baa9 _DPSNextEvent + 927
9   AppKit                        	    0x7ff80ef2a166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
10  AppKit                        	    0x7ff80ef1c818 -[NSApplication run] + 586
11  AppKit                        	    0x7ff80eef079a NSApplicationMain + 817
12  SwiftUI                       	    0x7ff917a4109c specialized runApp(_:) + 161
13  SwiftUI                       	    0x7ff9184a3424 runApp<A>(_:) + 164
14  SwiftUI                       	    0x7ff917f9bc5f static App.main() + 63
15  RedLemon                      	       0x10fe27693 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
16  RedLemon                      	       0x10fe27719 RedLemon_main + 9
17  dyld                          	       0x11f77352e start + 462

Thread 1::  Dispatch queue: com.apple.NSURLSession-work
0   libsqlite3.dylib              	    0x7ff81289217e sqlite3VdbeExec + 51390
1   libsqlite3.dylib              	    0x7ff812884c70 sqlite3_step + 1808
2   CFNetwork                     	    0x7ff811092492 0x7ff810ed3000 + 1832082
3   CFNetwork                     	    0x7ff810f2c0dc 0x7ff810ed3000 + 364764
4   CFNetwork                     	    0x7ff8111052f7 0x7ff810ed3000 + 2302711
5   CFNetwork                     	    0x7ff81109f2ae 0x7ff810ed3000 + 1884846
6   CFNetwork                     	    0x7ff81112c927 0x7ff810ed3000 + 2464039
7   CFNetwork                     	    0x7ff81109c22c 0x7ff810ed3000 + 1872428
8   CFNetwork                     	    0x7ff811002a7c 0x7ff810ed3000 + 1243772
9   CFNetwork                     	    0x7ff810eea0b1 0x7ff810ed3000 + 94385
10  CFNetwork                     	    0x7ff810ee9e3e 0x7ff810ed3000 + 93758
11  libdispatch.dylib             	    0x7ff80c27d3c0 _dispatch_block_async_invoke2 + 83
12  libdispatch.dylib             	    0x7ff80c270317 _dispatch_client_callout + 8
13  libdispatch.dylib             	    0x7ff80c276317 _dispatch_lane_serial_drain + 672
14  libdispatch.dylib             	    0x7ff80c276e30 _dispatch_lane_invoke + 417
15  libdispatch.dylib             	    0x7ff80c280eee _dispatch_workloop_worker_thread + 753
16  libsystem_pthread.dylib       	    0x7ff80c424fd0 _pthread_wqthread + 326
17  libsystem_pthread.dylib       	    0x7ff80c423f57 start_wqthread + 15

Thread 2:
0   libsystem_pthread.dylib       	    0x7ff80c423f48 start_wqthread + 0

Thread 3:
0   libsystem_pthread.dylib       	    0x7ff80c423f48 start_wqthread + 0

Thread 4::  Dispatch queue: com.apple.CFNetwork.Connection
0   libsystem_kernel.dylib        	    0x7ff80c3ed07a __bsdthread_ctl + 10
1   libsystem_pthread.dylib       	    0x7ff80c425882 _pthread_set_properties_self + 80
2   libdispatch.dylib             	    0x7ff80c271fc5 _dispatch_set_priority_and_mach_voucher_slow + 209
3   libdispatch.dylib             	    0x7ff80c272119 _dispatch_set_priority_and_voucher_slow + 196
4   libdispatch.dylib             	    0x7ff80c27649a _dispatch_lane_serial_drain + 1059
5   libdispatch.dylib             	    0x7ff80c276e30 _dispatch_lane_invoke + 417
6   libdispatch.dylib             	    0x7ff80c2780f6 _dispatch_workloop_invoke + 1987
7   libdispatch.dylib             	    0x7ff80c280eee _dispatch_workloop_worker_thread + 753
8   libsystem_pthread.dylib       	    0x7ff80c424fd0 _pthread_wqthread + 326
9   libsystem_pthread.dylib       	    0x7ff80c423f57 start_wqthread + 15

Thread 5 Crashed::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libswiftCore.dylib            	    0x7ff819918ff8 closure #1 in closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:) + 456
1   libswiftCore.dylib            	    0x7ff819918d0b closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:) + 267
2   libswiftCore.dylib            	    0x7ff819918afd closure #1 in _assertionFailure(_:_:file:line:flags:) + 333
3   libswiftCore.dylib            	    0x7ff819918675 _assertionFailure(_:_:file:line:flags:) + 309
4   RedLemon                      	       0x110e3a90e TorrentioService.buildUrl(imdbId:type:season:episode:config:) + 3342 (TorrentioService.swift:78)
5   RedLemon                      	       0x110e382c8 (5) suspend resume partial function for TorrentioService.fetchStreams(imdbId:type:season:episode:) + 2728 (TorrentioService.swift:41)
6   RedLemon                      	       0x110e3c331 (1) await resume partial function for protocol witness for ProviderService.fetchStreams(imdbId:type:season:episode:) in conformance TorrentioService + 1

Thread 6:
0   libsystem_pthread.dylib       	    0x7ff80c423f48 start_wqthread + 0

Thread 7:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff80c3eb93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80c3ebca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80c4ef29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80c4ed928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80c4ecd6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff80f099572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff80c4284e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff80c423f6b thread_start + 15

Thread 8::  Dispatch queue: com.apple.CFNetwork.CacheDB-write
0   CoreFoundation                	    0x7ff80c4a2809 __CFStringAppendBytes + 1010
1   CoreFoundation                	    0x7ff80c4a02d2 __CFStringAppendFormatCore + 9782
2   CoreFoundation                	    0x7ff80c5d0374 _CFStringCreateWithFormatAndArgumentsReturningMetadata + 162
3   CoreFoundation                	    0x7ff80c4e5d4a CFStringCreateWithFormatAndArguments + 141
4   CoreFoundation                	    0x7ff80c49dc53 CFStringCreateWithFormat + 128
5   CoreFoundation                	    0x7ff80c521b83 +[NSObject(NSObject) description] + 38
6   RunningBoardServices          	    0x7ff812b7bac2 -[RBSAssertionDescriptor description] + 64
7   Foundation                    	    0x7ff80d30d608 _NS_os_log_callback + 273
8   libsystem_trace.dylib         	    0x7ff80c19e085 _os_log_fmt_flatten_NSCF + 42
9   libsystem_trace.dylib         	    0x7ff80c19d95d _os_log_fmt_flatten_object + 215
10  libsystem_trace.dylib         	    0x7ff80c19b172 _os_log_impl_flatten_and_send + 2243
11  libsystem_trace.dylib         	    0x7ff80c19a886 _os_log + 128
12  libsystem_trace.dylib         	    0x7ff80c19a7fa _os_log_impl + 21
13  RunningBoardServices          	    0x7ff812b51352 -[RBSConnection acquireAssertion:error:] + 163
14  RunningBoardServices          	    0x7ff812b51054 -[RBSAssertion acquireWithError:] + 229
15  CFNetwork                     	    0x7ff810fde76c 0x7ff810ed3000 + 1095532
16  CFNetwork                     	    0x7ff810fe4523 0x7ff810ed3000 + 1119523
17  libdispatch.dylib             	    0x7ff80c27d3c0 _dispatch_block_async_invoke2 + 83
18  libdispatch.dylib             	    0x7ff80c270317 _dispatch_client_callout + 8
19  libdispatch.dylib             	    0x7ff80c276317 _dispatch_lane_serial_drain + 672
20  libdispatch.dylib             	    0x7ff80c276e30 _dispatch_lane_invoke + 417
21  libdispatch.dylib             	    0x7ff80c280eee _dispatch_workloop_worker_thread + 753
22  libsystem_pthread.dylib       	    0x7ff80c424fd0 _pthread_wqthread + 326
23  libsystem_pthread.dylib       	    0x7ff80c423f57 start_wqthread + 15

Thread 9:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff80c3eb93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80c3ebca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80c4ef29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80c4ed928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80c4ecd6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff81111b964 0x7ff810ed3000 + 2394468
6   Foundation                    	    0x7ff80d344724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff80c4284e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff80c423f6b thread_start + 15

Thread 10:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff80c3f030e kevent + 10
1   RedLemon                      	       0x10fbfaf49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10fc04e6f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10fc054c4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10fbfbbfb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10fc04d68 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10fbe1836 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10fbe289f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10fbd3763 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10fbe004d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10fbd9974 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10fbce22e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10fbd1654 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10fbc61e2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10fbc622c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff8213f0e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10fbc6189 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10fbcd2af SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10fb6efc8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10fb6f71a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10fb759f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10fc058bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10fc0842f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10fc084e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80c4284e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80c423f6b thread_start + 15

Thread 11:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff80c3f030e kevent + 10
1   RedLemon                      	       0x10fbfaf49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10fc04e6f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10fc054c4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10fbfbbfb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10fc04d68 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10fbe1836 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10fbe289f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10fbd3822 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10fbd3877 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff819a0172c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10fbd36ea Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10fbe004d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10fbd9974 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10fbce22e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10fbd1654 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10fbc61e2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10fbc622c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff8213f0e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10fbc6189 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10fbcd2af SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10fb6efc8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10fb6f71a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10fb759f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10fc058bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10fc0842f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10fc084e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80c4284e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80c423f6b thread_start + 15

Thread 12:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff80c3f030e kevent + 10
1   RedLemon                      	       0x10fbfaf49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10fc04e6f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10fc054c4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10fbfbbfb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10fc04d68 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10fbe1836 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10fbe289f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10fbd3763 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10fbe004d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10fbd9974 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10fbce22e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10fbd1654 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10fbc61e2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10fbc622c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff8213f0e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10fbc6189 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10fbcd2af SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10fb6efc8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10fb6f71a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10fb759f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10fc058bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10fc0842f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10fc084e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80c4284e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80c423f6b thread_start + 15

Thread 13:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff80c3f030e kevent + 10
1   RedLemon                      	       0x10fbfaf49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10fc04e6f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10fc054c4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10fbfbbfb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10fc04d68 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10fbe1836 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10fbe289f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10fbd3763 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10fbe004d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10fbd9974 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10fbce22e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10fbd1654 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10fbc61e2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10fbc622c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff8213f0e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10fbc6189 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10fbcd2af SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10fb6efc8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10fb6f71a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10fb759f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10fc058bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10fc0842f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10fc084e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80c4284e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80c423f6b thread_start + 15

Thread 14:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff80c3eb976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c2707ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c270c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10fb77ebf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10fb78d8e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10fc058bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10fc0842f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10fc084e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80c4284e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80c423f6b thread_start + 15

Thread 15:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff80c3eb976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c2707ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c270c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10fb77ebf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10fb78d8e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10fc058bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10fc0842f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10fc084e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80c4284e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80c423f6b thread_start + 15

Thread 16:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff80c3eb976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c2707ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c270c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10fb77ebf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10fb78d8e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10fc058bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10fc0842f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10fc084e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80c4284e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80c423f6b thread_start + 15

Thread 17:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff80c3eb976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c2707ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c270c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10fb77ebf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10fb78d8e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10fc058bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10fc0842f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10fc084e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80c4284e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80c423f6b thread_start + 15


Thread 5 crashed with X86 Thread State (64-bit):
  rax: 0x0000000000004413  rbx: 0x0000000000000001  rcx: 0x0000000000000000  rdx: 0x000000000004fe70
  rdi: 0x0000000115a83080  rsi: 0x000000007182008f  rbp: 0x000070000da8d630  rsp: 0x000070000da8d620
   r8: 0x0000000000001f17   r9: 0x0000000000000006  r10: 0x00007f8669b00000  r11: 0x0000000000000000
  r12: 0x00007f8666b74a02  r13: 0x000070000da8da20  r14: 0x000000000000004e  r15: 0x0000000000000001
  rip: 0x00007ff819918ff8  rfl: 0x0000000000010202  cr2: 0x0000000000000000
  
Logical CPU:     0
Error Code:      0x00000000 
Trap Number:     6

Thread 5 instruction stream:
  8d 05 2a 0b 42 00 48 8d-3d 67 9f 41 00 48 8d 0d  ..*.B.H.=g.A.H..
  7c a2 41 00 be 0b 00 00-00 41 b8 39 00 00 00 ba  |.A......A.9....
  02 00 00 00 41 b9 02 00-00 00 6a 01 6a 5e e9 fb  ....A.....j.j^..
  fe ff ff 4d 85 d2 79 4a-48 be ff ff ff 7f ff ff  ...M..yJH.......
  ff ff 49 39 f2 7f 44 48-83 ec 08 48 8d 05 6e 9f  ..I9..DH...H..n.
  41 00 48 8d 3d 1b 9f 41-00 48 8d 0d 80 9f 41 00  A.H.=..A.H....A.
  be 0b 00 00 00 41 b8 2b-00 00 00 ba 02 00 00 00  .....A.+........
  41 b9 02 00 00 00 6a 01-68 e6 0d 00 00 e9 0e ff  A.....j.h.......
  ff ff 49 39 f2 0f 83 cf-fe ff ff 4c 8b 5d 10 4c  ..I9.......L.].L
  89 de 48 c1 ee 20 75 22-8b 5d 18 48 89 d7 89 ce  ..H.. u".].H....
  4c 89 c2 44 89 c9 49 89-c0 45 89 d1 53 41 53 e8  L..D..I..E..SAS.
  7c 26 36 00 48 83 c4 10-0f]0b 48 83 ec 08 48 8d  |&6.H.....H...H.	<==

Binary Images:
    0x7ff80c3ea000 -     0x7ff80c421fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff80c46f000 -     0x7ff80c971fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff815171000 -     0x7ff815464fff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff80eeed000 -     0x7ff80fd7cfff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff9179c5000 -     0x7ff918864fff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x10ed71000 -        0x111464fff com.redlemon.app (1.0.14) <55176130-64a8-3d91-92d0-3766b665400d> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x11f76e000 -        0x11f7d9fff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff812834000 -     0x7ff8129fffff libsqlite3.dylib (*) <1c02a98a-18ab-3282-87a8-3264836b6e64> /usr/lib/libsqlite3.dylib
    0x7ff810ed3000 -     0x7ff811361fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff80c26d000 -     0x7ff80c2b3fff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff80c422000 -     0x7ff80c42dfff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff8198e6000 -     0x7ff819d5ffff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff812b49000 -     0x7ff812b9efff com.apple.RunningBoardServices (1.0) <80548797-d5c3-382c-a2c0-73d867b0a4d3> /System/Library/PrivateFrameworks/RunningBoardServices.framework/Versions/A/RunningBoardServices
    0x7ff80d2ec000 -     0x7ff80d6a8fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff80c196000 -     0x7ff80c1aefff libsystem_trace.dylib (*) <707e7930-370d-393f-aeb0-949e48a6e19c> /usr/lib/system/libsystem_trace.dylib
    0x7ff8213f0000 -     0x7ff8213f1fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib

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
ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)
Writable regions: Total=144.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=144.0M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               256K        2 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                           236K        6 
CG raster data                      68K        8 
ColorSync                          220K       26 
CoreAnimation                      748K       36 
CoreGraphics                         4K        1 
CoreUI image data                 1208K        9 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
Image IO                          1228K        2 
Kernel Alloc Once                    8K        1 
MALLOC                            62.5M       77 
MALLOC guard page                   48K       11 
MALLOC_LARGE (reserved)             68K        1         reserved VM address space (unallocated)
SQLite page cache                  256K        4 
STACK GUARD                       56.1M       18 
Stack                             16.6M       19 
VM_ALLOCATE                       1088K       15 
__CTF                               756        1 
__DATA                            55.1M      600 
__DATA_CONST                      33.3M      407 
__DATA_DIRTY                      1651K      204 
__FONT_DATA                          4K        1 
__LINKEDIT                       724.1M       83 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           590.4M      606 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        5760K       32 
mapped file                      160.6M       29 
shared memory                      768K       16 
===========                     =======  ======= 
TOTAL                              1.8G     2229 
TOTAL, minus reserved VM space     1.8G     2229 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2026-01-07 05:28:56.00 -0500","app_version":"1.0.14","slice_uuid":"55176130-64a8-3d91-92d0-3766b665400d","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"06D97984-2738-4C11-8F22-AB18186E8C7A","name":"RedLemon"}
{
  "uptime" : 59000,
  "procLaunch" : "2026-01-07 05:28:25.9376 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 59361351703612,
  "coalitionID" : 626,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2026-01-07 05:28:30.2914 -0500",
  "incident" : "06D97984-2738-4C11-8F22-AB18186E8C7A",
  "bug_type" : "309",
  "pid" : 18848,
  "procExitAbsTime" : 59365557049740,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 18707,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 521,
  "responsibleProc" : "Electron",
  "wakeTime" : 21986,
  "sleepWakeUUID" : "3749ABA0-2510-4B74-887A-E3B2B9F75160",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_INSTRUCTION","signal":"SIGILL"},
  "termination" : {"flags":0,"code":4,"namespace":"SIGNAL","indicator":"Illegal instruction: 4","byProc":"exc handler","byPid":18848},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 5,
  "threads" : [{"id":747539,"queue":"com.apple.main-thread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":2},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":2},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":2},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":3},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":3},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":3},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":3},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":4},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":4},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":4},{"imageOffset":17524371,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":5,"symbolLocation":35},{"imageOffset":17524505,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":5},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":6}]},{"id":747543,"queue":"com.apple.NSURLSession-work","frames":[{"imageOffset":385406,"symbol":"sqlite3VdbeExec","symbolLocation":51390,"imageIndex":7},{"imageOffset":330864,"symbol":"sqlite3_step","symbolLocation":1808,"imageIndex":7},{"imageOffset":1832082,"imageIndex":8},{"imageOffset":364764,"imageIndex":8},{"imageOffset":2302711,"imageIndex":8},{"imageOffset":1884846,"imageIndex":8},{"imageOffset":2464039,"imageIndex":8},{"imageOffset":1872428,"imageIndex":8},{"imageOffset":1243772,"imageIndex":8},{"imageOffset":94385,"imageIndex":8},{"imageOffset":93758,"imageIndex":8},{"imageOffset":66496,"symbol":"_dispatch_block_async_invoke2","symbolLocation":83,"imageIndex":9},{"imageOffset":13079,"symbol":"_dispatch_client_callout","symbolLocation":8,"imageIndex":9},{"imageOffset":37655,"symbol":"_dispatch_lane_serial_drain","symbolLocation":672,"imageIndex":9},{"imageOffset":40496,"symbol":"_dispatch_lane_invoke","symbolLocation":417,"imageIndex":9},{"imageOffset":81646,"symbol":"_dispatch_workloop_worker_thread","symbolLocation":753,"imageIndex":9},{"imageOffset":12240,"symbol":"_pthread_wqthread","symbolLocation":326,"imageIndex":10},{"imageOffset":8023,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":10}]},{"id":747544,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":10}]},{"id":747545,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":10}]},{"id":747546,"queue":"com.apple.CFNetwork.Connection","frames":[{"imageOffset":12410,"symbol":"__bsdthread_ctl","symbolLocation":10,"imageIndex":0},{"imageOffset":14466,"symbol":"_pthread_set_properties_self","symbolLocation":80,"imageIndex":10},{"imageOffset":20421,"symbol":"_dispatch_set_priority_and_mach_voucher_slow","symbolLocation":209,"imageIndex":9},{"imageOffset":20761,"symbol":"_dispatch_set_priority_and_voucher_slow","symbolLocation":196,"imageIndex":9},{"imageOffset":38042,"symbol":"_dispatch_lane_serial_drain","symbolLocation":1059,"imageIndex":9},{"imageOffset":40496,"symbol":"_dispatch_lane_invoke","symbolLocation":417,"imageIndex":9},{"imageOffset":45302,"symbol":"_dispatch_workloop_invoke","symbolLocation":1987,"imageIndex":9},{"imageOffset":81646,"symbol":"_dispatch_workloop_worker_thread","symbolLocation":753,"imageIndex":9},{"imageOffset":12240,"symbol":"_pthread_wqthread","symbolLocation":326,"imageIndex":10},{"imageOffset":8023,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":10}]},{"triggered":true,"id":747576,"instructionState":{"instructionStream":{"bytes":[141,5,42,11,66,0,72,141,61,103,159,65,0,72,141,13,124,162,65,0,190,11,0,0,0,65,184,57,0,0,0,186,2,0,0,0,65,185,2,0,0,0,106,1,106,94,233,251,254,255,255,77,133,210,121,74,72,190,255,255,255,127,255,255,255,255,73,57,242,127,68,72,131,236,8,72,141,5,110,159,65,0,72,141,61,27,159,65,0,72,141,13,128,159,65,0,190,11,0,0,0,65,184,43,0,0,0,186,2,0,0,0,65,185,2,0,0,0,106,1,104,230,13,0,0,233,14,255,255,255,73,57,242,15,131,207,254,255,255,76,139,93,16,76,137,222,72,193,238,32,117,34,139,93,24,72,137,215,137,206,76,137,194,68,137,201,73,137,192,69,137,209,83,65,83,232,124,38,54,0,72,131,196,16,15,11,72,131,236,8,72,141],"offset":184}},"threadState":{"r13":{"value":123145531480608},"rax":{"value":17427},"rflags":{"value":66050},"cpu":{"value":0},"r14":{"value":78},"rsi":{"value":1904345231},"r8":{"value":7959},"cr2":{"value":0},"rdx":{"value":327280},"r10":{"value":140215275487232},"r9":{"value":6},"r15":{"value":1},"rbx":{"value":1},"trap":{"value":6},"err":{"value":0},"r11":{"value":0},"rip":{"value":140703557586936,"matchesCrashFrame":1},"rbp":{"value":123145531479600},"rsp":{"value":123145531479584},"r12":{"value":140215225633282},"rcx":{"value":0},"flavor":"x86_THREAD_STATE","rdi":{"value":4658311296}},"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":208888,"symbol":"closure #1 in closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":456,"imageIndex":11},{"imageOffset":208139,"symbol":"closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":267,"imageIndex":11},{"imageOffset":207613,"symbol":"closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":333,"imageIndex":11},{"imageOffset":206453,"symbol":"_assertionFailure(_:_:file:line:flags:)","symbolLocation":309,"imageIndex":11},{"imageOffset":34380046,"sourceLine":78,"sourceFile":"TorrentioService.swift","symbol":"TorrentioService.buildUrl(imdbId:type:season:episode:config:)","imageIndex":5,"symbolLocation":3342},{"imageOffset":34370248,"sourceLine":41,"sourceFile":"TorrentioService.swift","symbol":"(5) suspend resume partial function for TorrentioService.fetchStreams(imdbId:type:season:episode:)","imageIndex":5,"symbolLocation":2728},{"imageOffset":34386737,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for protocol witness for ProviderService.fetchStreams(imdbId:type:season:episode:) in conformance TorrentioService","symbolLocation":1,"imageIndex":5}]},{"id":747607,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":10}]},{"id":747608,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":10},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":10}]},{"id":747612,"queue":"com.apple.CFNetwork.CacheDB-write","frames":[{"imageOffset":210953,"symbol":"__CFStringAppendBytes","symbolLocation":1010,"imageIndex":1},{"imageOffset":201426,"symbol":"__CFStringAppendFormatCore","symbolLocation":9782,"imageIndex":1},{"imageOffset":1446772,"symbol":"_CFStringCreateWithFormatAndArgumentsReturningMetadata","symbolLocation":162,"imageIndex":1},{"imageOffset":486730,"symbol":"CFStringCreateWithFormatAndArguments","symbolLocation":141,"imageIndex":1},{"imageOffset":191571,"symbol":"CFStringCreateWithFormat","symbolLocation":128,"imageIndex":1},{"imageOffset":732035,"symbol":"+[NSObject(NSObject) description]","symbolLocation":38,"imageIndex":1},{"imageOffset":207554,"symbol":"-[RBSAssertionDescriptor description]","symbolLocation":64,"imageIndex":12},{"imageOffset":136712,"symbol":"_NS_os_log_callback","symbolLocation":273,"imageIndex":13},{"imageOffset":32901,"symbol":"_os_log_fmt_flatten_NSCF","symbolLocation":42,"imageIndex":14},{"imageOffset":31069,"symbol":"_os_log_fmt_flatten_object","symbolLocation":215,"imageIndex":14},{"imageOffset":20850,"symbol":"_os_log_impl_flatten_and_send","symbolLocation":2243,"imageIndex":14},{"imageOffset":18566,"symbol":"_os_log","symbolLocation":128,"imageIndex":14},{"imageOffset":18426,"symbol":"_os_log_impl","symbolLocation":21,"imageIndex":14},{"imageOffset":33618,"symbol":"-[RBSConnection acquireAssertion:error:]","symbolLocation":163,"imageIndex":12},{"imageOffset":32852,"symbol":"-[RBSAssertion acquireWithError:]","symbolLocation":229,"imageIndex":12},{"imageOffset":1095532,"imageIndex":8},{"imageOffset":1119523,"imageIndex":8},{"imageOffset":66496,"symbol":"_dispatch_block_async_invoke2","symbolLocation":83,"imageIndex":9},{"imageOffset":13079,"symbol":"_dispatch_client_callout","symbolLocation":8,"imageIndex":9},{"imageOffset":37655,"symbol":"_dispatch_lane_serial_drain","symbolLocation":672,"imageIndex":9},{"imageOffset":40496,"symbol":"_dispatch_lane_invoke","symbolLocation":417,"imageIndex":9},{"imageOffset":81646,"symbol":"_dispatch_workloop_worker_thread","symbolLocation":753,"imageIndex":9},{"imageOffset":12240,"symbol":"_pthread_wqthread","symbolLocation":326,"imageIndex":10},{"imageOffset":8023,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":10}]},{"id":747640,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":2394468,"imageIndex":8},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":10},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":10}]},{"id":747641,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15245129,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15285871,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15287492,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15248379,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15285608,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15140918,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15145119,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15083363,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":467},{"imageOffset":15134797,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15108468,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15061550,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15074900,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15028706,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15028780,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":15},{"imageOffset":15028617,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15057583,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14671816,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14673690,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14698995,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15288511,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15299631,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15299817,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":10},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":10}]},{"id":747642,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15245129,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15285871,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15287492,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15248379,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15285608,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15140918,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15145119,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15083554,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15083639,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15083242,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15134797,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15108468,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15061550,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15074900,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15028706,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15028780,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":15},{"imageOffset":15028617,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15057583,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14671816,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14673690,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14698995,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15288511,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15299631,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15299817,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":10},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":10}]},{"id":747643,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15245129,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15285871,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15287492,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15248379,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15285608,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15140918,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15145119,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15083363,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":467},{"imageOffset":15134797,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15108468,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15061550,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15074900,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15028706,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15028780,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":15},{"imageOffset":15028617,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15057583,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14671816,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14673690,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14698995,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15288511,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15299631,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15299817,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":10},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":10}]},{"id":747644,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15245129,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15285871,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15287492,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15248379,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15285608,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15140918,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15145119,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15083363,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":467},{"imageOffset":15134797,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15108468,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15061550,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15074900,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15028706,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15028780,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":15},{"imageOffset":15028617,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15057583,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14671816,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14673690,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14698995,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15288511,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15299631,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15299817,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":10},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":10}]},{"id":747645,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14708415,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14712206,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15288511,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15299631,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15299817,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":10},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":10}]},{"id":747646,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14708415,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14712206,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15288511,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15299631,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15299817,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":10},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":10}]},{"id":747647,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14708415,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14712206,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15288511,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15299631,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15299817,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":10},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":10}]},{"id":747648,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14708415,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14712206,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15288511,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15299631,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15299817,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":10},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":10}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703334047744,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703334592512,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.CoreFoundation",
    "size" : 5255168,
    "uuid" : "fdd28505-5456-3c40-a5ba-7890b064db39",
    "path" : "\/System\/Library\/Frameworks\/CoreFoundation.framework\/Versions\/A\/CoreFoundation",
    "name" : "CoreFoundation",
    "CFBundleVersion" : "1866"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703482449920,
    "CFBundleShortVersionString" : "2.1.1",
    "CFBundleIdentifier" : "com.apple.HIToolbox",
    "size" : 3096576,
    "uuid" : "913d3d2e-4e4c-3907-98fe-8f4abd551297",
    "path" : "\/System\/Library\/Frameworks\/Carbon.framework\/Versions\/A\/Frameworks\/HIToolbox.framework\/Versions\/A\/HIToolbox",
    "name" : "HIToolbox"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703379148800,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.AppKit",
    "size" : 15269888,
    "uuid" : "5dd484cf-ed6a-3633-b42e-6518aeecd5b9",
    "path" : "\/System\/Library\/Frameworks\/AppKit.framework\/Versions\/C\/AppKit",
    "name" : "AppKit",
    "CFBundleVersion" : "2113.65.150"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140707819704320,
    "CFBundleShortVersionString" : "3.5.2",
    "CFBundleIdentifier" : "com.apple.SwiftUI",
    "size" : 15335424,
    "uuid" : "4270a4c3-e15f-3953-8f17-abb3b351219f",
    "path" : "\/System\/Library\/Frameworks\/SwiftUI.framework\/Versions\/A\/SwiftUI",
    "name" : "SwiftUI",
    "CFBundleVersion" : "3.5.2"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4543942656,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 40845312,
    "uuid" : "55176130-64a8-3d91-92d0-3766b665400d",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4822851584,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703439208448,
    "size" : 1884160,
    "uuid" : "1c02a98a-18ab-3282-87a8-3264836b6e64",
    "path" : "\/usr\/lib\/libsqlite3.dylib",
    "name" : "libsqlite3.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703412596736,
    "CFBundleShortVersionString" : "1335.5",
    "CFBundleIdentifier" : "com.apple.CFNetwork",
    "size" : 4780032,
    "uuid" : "1498ec5d-cbe9-352b-8b10-030e042445c5",
    "path" : "\/System\/Library\/Frameworks\/CFNetwork.framework\/Versions\/A\/CFNetwork",
    "name" : "CFNetwork",
    "CFBundleVersion" : "1335.5"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703332487168,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703334277120,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703557378048,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703442440192,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.RunningBoardServices",
    "size" : 352256,
    "uuid" : "80548797-d5c3-382c-a2c0-73d867b0a4d3",
    "path" : "\/System\/Library\/PrivateFrameworks\/RunningBoardServices.framework\/Versions\/A\/RunningBoardServices",
    "name" : "RunningBoardServices",
    "CFBundleVersion" : "618.100.42"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703349784576,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.Foundation",
    "size" : 3919872,
    "uuid" : "61133096-d5f9-34bd-94b1-1e526ea018b1",
    "path" : "\/System\/Library\/Frameworks\/Foundation.framework\/Versions\/C\/Foundation",
    "name" : "Foundation",
    "CFBundleVersion" : "1866"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703331606528,
    "size" : 102400,
    "uuid" : "707e7930-370d-393f-aeb0-949e48a6e19c",
    "path" : "\/usr\/lib\/system\/libsystem_trace.dylib",
    "name" : "libsystem_trace.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703686393856,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703331016704,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=144.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=144.0M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               256K        2 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                           236K        6 \nCG raster data                      68K        8 \nColorSync                          220K       26 \nCoreAnimation                      748K       36 \nCoreGraphics                         4K        1 \nCoreUI image data                 1208K        9 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nImage IO                          1228K        2 \nKernel Alloc Once                    8K        1 \nMALLOC                            62.5M       77 \nMALLOC guard page                   48K       11 \nMALLOC_LARGE (reserved)             68K        1         reserved VM address space (unallocated)\nSQLite page cache                  256K        4 \nSTACK GUARD                       56.1M       18 \nStack                             16.6M       19 \nVM_ALLOCATE                       1088K       15 \n__CTF                               756        1 \n__DATA                            55.1M      600 \n__DATA_CONST                      33.3M      407 \n__DATA_DIRTY                      1651K      204 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       724.1M       83 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           590.4M      606 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        5760K       32 \nmapped file                      160.6M       29 \nshared memory                      768K       16 \n===========                     =======  ======= \nTOTAL                              1.8G     2229 \nTOTAL, minus reserved VM space     1.8G     2229 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.root.user-initiated-qos.cooperative"
  }
},
  "trialInfo" : {
  "rollouts" : [
    {
      "rolloutId" : "61301e3a61217b3110231469",
      "factorPackIds" : {
        "SIRI_FIND_MY_CONFIGURATION_FILES" : "652886aa2c02f032beae8316"
      },
      "deploymentId" : 240000028
    },
    {
      "rolloutId" : "5fb4245a1bbfe8005e33a1e1",
      "factorPackIds" : {

      },
      "deploymentId" : 240000021
    }
  ],
  "experiments" : [

  ]
}
}

Model: MacBookPro12,1, BootROM 186.0.0.0.0, 2 processors, Dual-Core Intel Core i5, 2.7 GHz, 8 GB, SMC 2.28f7
Graphics: Intel Iris Graphics 6100, Intel Iris Graphics 6100, Built-In
Display: Color LCD, 2560 x 1600 Retina, Main, MirrorOff, Online
Memory Module: BANK 0/DIMM0, 4 GB, DDR3, 1867 MHz, 0x02FE, 0x4544464132333241324D412D4A442D460000
Memory Module: BANK 1/DIMM0, 4 GB, DDR3, 1867 MHz, 0x02FE, 0x4544464132333241324D412D4A442D460000
AirPort: spairport_wireless_card_type_wifi (0x14E4, 0x133), Broadcom BCM43xx 1.0 (7.77.111.1 AirPortDriverBrcmNIC-1710.4)
AirPort: 
Bluetooth: Version (null), 0 services, 0 devices, 0 incoming serial ports
Network Service: Wi-Fi, AirPort, en0
USB Device: USB30Bus
USB Device: Bluetooth USB Host Controller
Thunderbolt Bus: MacBook Pro, Apple Inc., 27.1






