-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [38729]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [38593]
Responsible:           Electron [587]
User ID:               501

Date/Time:             2025-12-22 16:49:51.6913 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA

Sleep/Wake UUID:       75457159-ADF6-46EA-9804-2FE6AF72FBF5

Time Awake Since Boot: 23000 seconds
Time Since Wake:       5491 seconds

System Integrity Protection: enabled

Crashed Thread:        17  Dispatch queue: com.apple.root.default-qos.cooperative

Exception Type:        EXC_CRASH (SIGABRT)
Exception Codes:       0x0000000000000000, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Application Specific Information:
abort() called


Application Specific Backtrace 0:
0   CoreFoundation                      0x00007ff80f9ea6e3 __exceptionPreprocess + 242
1   libobjc.A.dylib                     0x00007ff80f74a8bb objc_exception_throw + 48
2   Foundation                          0x00007ff8107c70c7 -[NSRegularExpression(NSMatching) enumerateMatchesInString:options:range:usingBlock:] + 2314
3   Foundation                          0x00007ff8107fe45a -[NSRegularExpression(NSMatching) matchesInString:options:range:] + 160
4   RedLemon                            0x0000000104bdccb9 $s8RedLemon11SubDLClientC22extractSubtitleFromZip33_967C0EEB1F4E5C162458166133338B4ALL6zipURL6season7episodeSS10Foundation0P0V_SiSgALtKF + 12393
5   RedLemon                            0x0000000104bd6ae7 $s8RedLemon11SubDLClientC8download0E4Path6offset6season7episodeS2S_S2iSgAItYaKFTY2_ + 6631
6   RedLemon                            0x0000000104b30c21 $s8RedLemon22registerSubtitleRoutesyy5Vapor11ApplicationCFAC8ResponseCAC7RequestCYaYbKcfU0_TQ3_ + 1
7   RedLemon                            0x0000000104cb87f1 $s5Vapor13RoutesBuilderPAAE2on__4body3useAA5RouteC8NIOHTTP110HTTPMethodO_Say10RoutingKit13PathComponentOGAA22HTTPBodyStreamStrategyOqd__AA7RequestCYaKctAA22AsyncResponseEncodableRd__lFAA0S0CASYaYbKcfU_TQ3_ + 1
8   RedLemon                            0x0000000104cb8e21 $s5Vapor13RoutesBuilderPAAE2on__4body3useAA5RouteC8NIOHTTP110HTTPMethodO_Say10RoutingKit13PathComponentOGAA22HTTPBodyStreamStrategyOqd__AA7RequestCYaKctAA22AsyncResponseEncodableRd__lFAA0S0CASYaYbKcfU_TATQ0_ + 1
9   RedLemon                            0x0000000104ca5b61 $s5Vapor19AsyncBasicResponderV7respond2toAA8ResponseCAA7RequestC_tYaKFTQ0_ + 1
10  RedLemon                            0x0000000104ca5e11 $s5Vapor19AsyncBasicResponderVAA0bD0A2aDP7respond2toAA8ResponseCAA7RequestC_tYaKFTWTQ0_ + 1
11  RedLemon                            0x0000000104cb4571 $s5Vapor14AsyncResponderPAAE7respond2to7NIOCore15EventLoopFutureCyAA8ResponseCGAA7RequestC_tFAJyYaYbKcfU_TQ0_ + 1
12  RedLemon                            0x0000000104cb47f1 $s5Vapor14AsyncResponderPAAE7respond2to7NIOCore15EventLoopFutureCyAA8ResponseCGAA7RequestC_tFAJyYaYbKcfU_TATQ0_ + 1
13  RedLemon                            0x00000001034da771 $s7NIOCore16EventLoopPromiseV16completeWithTaskyScTyyts5NeverOGxyYaYbKcFyyYaYbcfU_TQ0_ + 1
14  RedLemon                            0x00000001034daac1 $s7NIOCore16EventLoopPromiseV16completeWithTaskyScTyyts5NeverOGxyYaYbKcFyyYaYbcfU_TATQ0_ + 1
15  RedLemon                            0x0000000102d0b911 $sxIeghHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_ + 1
16  RedLemon                            0x0000000102d0ba41 $sxIeghHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_ + 1
17  libswift_Concurrency.dylib          0x00007ffb28dad441 _ZL23completeTaskWithClosurePN5swift12AsyncContextEPNS_10SwiftErrorE + 1


Thread 0::  Dispatch queue: com.apple.main-thread
0   libsystem_kernel.dylib        	    0x7ff80f86b93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80f86bca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80f96f29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80f96d928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80f96cd6c CFRunLoopRunSpecific + 562
5   HIToolbox                     	    0x7ff81861f5e6 RunCurrentEventLoopInMode + 292
6   HIToolbox                     	    0x7ff81861f34a ReceiveNextEventCommon + 594
7   HIToolbox                     	    0x7ff81861f0e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
8   AppKit                        	    0x7ff8123abaa9 _DPSNextEvent + 927
9   AppKit                        	    0x7ff8123aa166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
10  AppKit                        	    0x7ff81239c818 -[NSApplication run] + 586
11  AppKit                        	    0x7ff81237079a NSApplicationMain + 817
12  SwiftUI                       	    0x7ff91aec109c specialized runApp(_:) + 161
13  SwiftUI                       	    0x7ff91b923424 runApp<A>(_:) + 164
14  SwiftUI                       	    0x7ff91b41bc5f static App.main() + 63
15  RedLemon                      	       0x103cc1303 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
16  RedLemon                      	       0x103cc1389 RedLemon_main + 9
17  dyld                          	       0x10f86852e start + 462

Thread 1::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libsystem_kernel.dylib        	    0x7ff80f86e3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80f8a8a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x109e28a1f wait_wakeup + 255
3   libmpv.2.dylib                	       0x109e294c8 mpv_wait_event + 584
4   RedLemon                      	       0x10449a3b3 (3) suspend resume partial function for MPVWrapper.pollEvents() + 259 (MPVWrapper.swift:312)
5   RedLemon                      	       0x1044861e1 (2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:) + 1 (MPVWrapper.swift:125)

Thread 2:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 3:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 4:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 5:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 6:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff80f86b93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80f86bca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80f96f29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80f96d928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80f96cd6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff812519572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 7:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 8:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff80f86b93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80f86bca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80f96f29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80f96d928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80f96cd6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff81459b964 0x7ff814353000 + 2394468
6   Foundation                    	    0x7ff8107c4724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 9:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff80f87030e kevent + 10
1   RedLemon                      	       0x103aa1a89 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x103aab9af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x103aac004 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x103aa273b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x103aab8a8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x103a88376 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103a893df partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x103a7a362 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x103a7a3b7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81ce8172c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x103a7a22a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x103a86b8d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x103a804b4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x103a74d6e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x103a78194 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x103a6cd22 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x103a6cd6c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff824870e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x103a6ccc9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x103a73def SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x103a15b08 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x103a1625a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x103a1c533 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x103aac3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x103aaef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x103aaf029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 10:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff80f87030e kevent + 10
1   RedLemon                      	       0x103aa1a89 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x103aab9af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x103aac004 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x103aa273b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x103aab8a8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x103a88376 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103a893df partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x103a7a362 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x103a7a3b7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81ce8172c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x103a7a22a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x103a86b8d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x103a804b4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x103a74d6e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x103a78194 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x103a6cd22 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x103a6cd6c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff824870e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x103a6ccc9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x103a73def SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x103a15b08 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x103a1625a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x103a1c533 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x103aac3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x103aaef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x103aaf029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 11:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff80f87030e kevent + 10
1   RedLemon                      	       0x103aa1a89 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x103aab9af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x103aac004 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x103aa273b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x103aab8a8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x103a88376 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103a893df partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x103a7a362 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x103a7a3b7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81ce8172c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x103a7a22a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x103a86b8d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x103a804b4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x103a74d6e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x103a78194 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x103a6cd22 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x103a6cd6c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff824870e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x103a6ccc9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x103a73def SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x103a15b08 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x103a1625a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x103a1c533 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x103aac3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x103aaef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x103aaf029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 12:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff80f87030e kevent + 10
1   RedLemon                      	       0x103aa1a89 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x103aab9af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x103aac004 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x103aa273b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x103aab8a8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x103a88376 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x103a893df partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x103a7a362 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x103a7a3b7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81ce8172c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x103a7a22a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x103a86b8d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x103a804b4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x103a74d6e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x103a78194 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x103a6cd22 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x103a6cd6c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff824870e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x103a6ccc9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x103a73def SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x103a15b08 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x103a1625a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x103a1c533 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x103aac3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x103aaef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x103aaf029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 13:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff80f86b976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80f6f07ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80f6f0c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x103a1e9ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x103a1f8ce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103aac3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x103aaef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103aaf029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 14:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff80f86b976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80f6f07ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80f6f0c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x103a1e9ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x103a1f8ce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103aac3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x103aaef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103aaf029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 15:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff80f86b976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80f6f07ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80f6f0c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x103a1e9ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x103a1f8ce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103aac3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x103aaef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103aaf029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 16:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff80f86b976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80f6f07ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80f6f0c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x103a1e9ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x103a1f8ce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x103aac3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x103aaef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x103aaf029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 17 Crashed::  Dispatch queue: com.apple.root.default-qos.cooperative
0   libsystem_kernel.dylib        	    0x7ff80f871fce __pthread_kill + 10
1   libsystem_pthread.dylib       	    0x7ff80f8a81ff pthread_kill + 263
2   libsystem_c.dylib             	    0x7ff80f7f3d14 abort + 123
3   libc++abi.dylib               	    0x7ff80f864082 abort_message + 241
4   libc++abi.dylib               	    0x7ff80f85525d demangling_terminate_handler() + 266
5   libobjc.A.dylib               	    0x7ff80f751e39 _objc_terminate() + 96
6   libc++abi.dylib               	    0x7ff80f8634a7 std::__terminate(void (*)()) + 8
7   libc++abi.dylib               	    0x7ff80f865d05 __cxxabiv1::failed_throw(__cxxabiv1::__cxa_exception*) + 27
8   libc++abi.dylib               	    0x7ff80f865ccc __cxa_throw + 116
9   libobjc.A.dylib               	    0x7ff80f74a9b9 objc_exception_throw + 302
10  Foundation                    	    0x7ff8107c70c7 -[NSRegularExpression(NSMatching) enumerateMatchesInString:options:range:usingBlock:] + 2314
11  Foundation                    	    0x7ff8107fe45a -[NSRegularExpression(NSMatching) matchesInString:options:range:] + 160
12  RedLemon                      	       0x104bdccb9 SubDLClient.extractSubtitleFromZip(zipURL:season:episode:) + 12393 (SubDLClient.swift:558)
13  RedLemon                      	       0x104bd6ae7 (3) suspend resume partial function for SubDLClient.download(downloadPath:offset:season:episode:) + 6631 (SubDLClient.swift:363)
14  RedLemon                      	       0x104b30c21 (4) await resume partial function for closure #2 in registerSubtitleRoutes(_:) + 1 (SubtitleRoutes.swift:74)
15  RedLemon                      	       0x104cb87f1 (4) await resume partial function for closure #1 in RoutesBuilder.on<A>(_:_:body:use:) + 1 (RoutesBuilder+Concurrency.swift:148)
16  RedLemon                      	       0x104cb8e21 (1) await resume partial function for partial apply for closure #1 in RoutesBuilder.on<A>(_:_:body:use:) + 1

Thread 18:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 19:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 20:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 21:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 22:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 23:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 24:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 25:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 26:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 27:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 28:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 29:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 30:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 31:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 32:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 33:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 34:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 35:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 36:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 37:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 38:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 39:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 40:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 41:
0   libsystem_pthread.dylib       	    0x7ff80f8a3f48 start_wqthread + 0

Thread 42:: core
0   libsystem_kernel.dylib        	    0x7ff80f86e3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80f8a8a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x109e0e5c1 mp_dispatch_queue_process + 369
3   libmpv.2.dylib                	       0x109e49f18 mp_wait_events + 88
4   libmpv.2.dylib                	       0x109e4d18b mp_idle + 91
5   libmpv.2.dylib                	       0x109e4649b open_demux_reentrant + 299
6   libmpv.2.dylib                	       0x109e444a5 play_current_file + 1301
7   libmpv.2.dylib                	       0x109e43ef9 mp_play_files + 393
8   libmpv.2.dylib                	       0x109e2922e core_thread + 62
9   libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
10  libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 43:: */ytdl_hook
0   libsystem_kernel.dylib        	    0x7ff80f86e3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80f8a8a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x109e289a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x109e294c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x109ebf8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10b507e16 0x10b502000 + 24086

Thread 44:: */stats
0   libsystem_kernel.dylib        	    0x7ff80f86e3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80f8a8a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x109e289a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x109e294c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x109ebf8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10b507e16 0x10b502000 + 24086

Thread 45:: */console
0   libsystem_kernel.dylib        	    0x7ff80f86e3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80f8a8a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x109e289a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x109e294c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x109ebf8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10b507e16 0x10b502000 + 24086

Thread 46:: */auto_profiles
0   libsystem_kernel.dylib        	    0x7ff80f86e3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80f8a8a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x109e289a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x109e294c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x109ebf8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10b507e16 0x10b502000 + 24086

Thread 47:: CVDisplayLink
0   libsystem_kernel.dylib        	    0x7ff80f86e3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80f8a8aa4 _pthread_cond_wait + 1302
2   CoreVideo                     	    0x7ff81714fe60 CVDisplayLink::waitUntil(unsigned long long) + 370
3   CoreVideo                     	    0x7ff81714eddc CVDisplayLink::runIOThread() + 526
4   libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15

Thread 48:: opener
0   libsystem_kernel.dylib        	    0x7ff80f87206a poll + 10
1   libavformat.61.dylib          	       0x109c02bdd 0x109b14000 + 977885

Thread 49:: worker
0   libsystem_kernel.dylib        	    0x7ff80f86e3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80f8a8a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x109e1147d worker_thread + 173
3   libsystem_pthread.dylib       	    0x7ff80f8a84e1 _pthread_start + 125
4   libsystem_pthread.dylib       	    0x7ff80f8a3f6b thread_start + 15


Thread 17 crashed with X86 Thread State (64-bit):
  rax: 0x0000000000000000  rbx: 0x00007000015d0000  rcx: 0x00007000015cbcb8  rdx: 0x0000000000000000
  rdi: 0x0000000000011717  rsi: 0x0000000000000006  rbp: 0x00007000015cbce0  rsp: 0x00007000015cbcb8
   r8: 0x00007000015cbb80   r9: 0x00007ff80f866f9b  r10: 0x0000000000000000  r11: 0x0000000000000246
  r12: 0x0000000000011717  r13: 0x0000003000000008  r14: 0x0000000000000006  r15: 0x0000000000000016
  rip: 0x00007ff80f871fce  rfl: 0x0000000000000246  cr2: 0x0000000000000000
  
Logical CPU:     0
Error Code:      0x02000148 
Trap Number:     133


Binary Images:
    0x7ff80f86a000 -     0x7ff80f8a1fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff80f8ef000 -     0x7ff80fdf1fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff8185f1000 -     0x7ff8188e4fff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff81236d000 -     0x7ff8131fcfff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff91ae45000 -     0x7ff91bce4fff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x102c19000 -        0x105200fff com.redlemon.app (1.0.14) <91e82b35-2446-3d75-879c-7a1e33ac183d> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x10f863000 -        0x10f8cefff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff80f8a2000 -     0x7ff80f8adfff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
       0x109d6a000 -        0x10a029fff libmpv.2.dylib (*) <e355e4d8-dcc6-3439-90d2-abf0776cc6ac> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libmpv.2.dylib
    0x7ff814353000 -     0x7ff8147e1fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff81076c000 -     0x7ff810b28fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff81cd66000 -     0x7ff81d1dffff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff824870000 -     0x7ff824871fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff80f6ed000 -     0x7ff80f733fff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff80f772000 -     0x7ff80f7fafff libsystem_c.dylib (*) <202d7260-ea46-3956-a471-19c9bcf45274> /usr/lib/system/libsystem_c.dylib
    0x7ff80f854000 -     0x7ff80f869fff libc++abi.dylib (*) <69ac868b-1157-364a-984a-5ef26973f661> /usr/lib/libc++abi.dylib
    0x7ff80f734000 -     0x7ff80f76efff libobjc.A.dylib (*) <b36a2b52-68a9-3e44-b927-71c24be1272f> /usr/lib/libobjc.A.dylib
       0x10b502000 -        0x10b569fff libluajit-5.1.2.dylib (*) <790d1386-66cf-39c0-ab74-e7b60abbd7c9> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libluajit-5.1.2.dylib
    0x7ff81714d000 -     0x7ff81719efff com.apple.CoreVideo (1.8) <fe89c8c7-c939-3115-afdb-7a6190835819> /System/Library/Frameworks/CoreVideo.framework/Versions/A/CoreVideo
       0x109b14000 -        0x109ccffff libavformat.61.dylib (*) <9e080321-bda0-344f-97ee-eb2d8365a1c4> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libavformat.61.dylib
    0x7ffb28d7d000 -     0x7ffb28dbcfff libswift_Concurrency.dylib (*) <01d2f741-2f1e-33c9-9b51-abb5c07e6914> /usr/lib/swift/libswift_Concurrency.dylib

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
Writable regions: Total=253.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=253.0M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               256K        2 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                           116K       11 
CG raster data                      68K        8 
ColorSync                          224K       27 
CoreAnimation                      696K       33 
CoreGraphics                        12K        2 
CoreUI image data                  952K        9 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
IOKit                             7940K        1 
Image IO                          8456K        3 
Kernel Alloc Once                    8K        1 
MALLOC                           117.2M      174 
MALLOC guard page                   48K       11 
SQLite page cache                 1408K       22 
STACK GUARD                       56.2M       50 
Stack                             32.9M       52 
VM_ALLOCATE                       13.4M       25 
__CTF                               756        1 
__DATA                            55.4M      604 
__DATA_CONST                      33.6M      413 
__DATA_DIRTY                      1658K      204 
__FONT_DATA                          4K        1 
__GLSLBUILTINS                    5176K        1 
__LINKEDIT                       722.1M       82 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           598.5M      613 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        13.6M       40 
mapped file                      348.9M       41 
shared memory                      9.8M       24 
===========                     =======  ======= 
TOTAL                              2.1G     2469 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-12-22 16:49:57.00 -0500","app_version":"1.0.14","slice_uuid":"91e82b35-2446-3d75-879c-7a1e33ac183d","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"4FAC1500-8FC4-4C7D-91D5-85E0F9AE269B","name":"RedLemon"}
{
  "uptime" : 23000,
  "procLaunch" : "2025-12-22 16:49:36.4584 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 23173675853861,
  "coalitionID" : 666,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-12-22 16:49:51.6913 -0500",
  "incident" : "4FAC1500-8FC4-4C7D-91D5-85E0F9AE269B",
  "bug_type" : "309",
  "pid" : 38729,
  "procExitAbsTime" : 23188898526685,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 38593,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 587,
  "responsibleProc" : "Electron",
  "wakeTime" : 5491,
  "sleepWakeUUID" : "75457159-ADF6-46EA-9804-2FE6AF72FBF5",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000000, 0x0000000000000000","rawCodes":[0,0],"type":"EXC_CRASH","signal":"SIGABRT"},
  "asi" : {"libsystem_c.dylib":["abort() called"]},
  "asiBacktraces" : ["0   CoreFoundation                      0x00007ff80f9ea6e3 __exceptionPreprocess + 242\n1   libobjc.A.dylib                     0x00007ff80f74a8bb objc_exception_throw + 48\n2   Foundation                          0x00007ff8107c70c7 -[NSRegularExpression(NSMatching) enumerateMatchesInString:options:range:usingBlock:] + 2314\n3   Foundation                          0x00007ff8107fe45a -[NSRegularExpression(NSMatching) matchesInString:options:range:] + 160\n4   RedLemon                            0x0000000104bdccb9 $s8RedLemon11SubDLClientC22extractSubtitleFromZip33_967C0EEB1F4E5C162458166133338B4ALL6zipURL6season7episodeSS10Foundation0P0V_SiSgALtKF + 12393\n5   RedLemon                            0x0000000104bd6ae7 $s8RedLemon11SubDLClientC8download0E4Path6offset6season7episodeS2S_S2iSgAItYaKFTY2_ + 6631\n6   RedLemon                            0x0000000104b30c21 $s8RedLemon22registerSubtitleRoutesyy5Vapor11ApplicationCFAC8ResponseCAC7RequestCYaYbKcfU0_TQ3_ + 1\n7   RedLemon                            0x0000000104cb87f1 $s5Vapor13RoutesBuilderPAAE2on__4body3useAA5RouteC8NIOHTTP110HTTPMethodO_Say10RoutingKit13PathComponentOGAA22HTTPBodyStreamStrategyOqd__AA7RequestCYaKctAA22AsyncResponseEncodableRd__lFAA0S0CASYaYbKcfU_TQ3_ + 1\n8   RedLemon                            0x0000000104cb8e21 $s5Vapor13RoutesBuilderPAAE2on__4body3useAA5RouteC8NIOHTTP110HTTPMethodO_Say10RoutingKit13PathComponentOGAA22HTTPBodyStreamStrategyOqd__AA7RequestCYaKctAA22AsyncResponseEncodableRd__lFAA0S0CASYaYbKcfU_TATQ0_ + 1\n9   RedLemon                            0x0000000104ca5b61 $s5Vapor19AsyncBasicResponderV7respond2toAA8ResponseCAA7RequestC_tYaKFTQ0_ + 1\n10  RedLemon                            0x0000000104ca5e11 $s5Vapor19AsyncBasicResponderVAA0bD0A2aDP7respond2toAA8ResponseCAA7RequestC_tYaKFTWTQ0_ + 1\n11  RedLemon                            0x0000000104cb4571 $s5Vapor14AsyncResponderPAAE7respond2to7NIOCore15EventLoopFutureCyAA8ResponseCGAA7RequestC_tFAJyYaYbKcfU_TQ0_ + 1\n12  RedLemon                            0x0000000104cb47f1 $s5Vapor14AsyncResponderPAAE7respond2to7NIOCore15EventLoopFutureCyAA8ResponseCGAA7RequestC_tFAJyYaYbKcfU_TATQ0_ + 1\n13  RedLemon                            0x00000001034da771 $s7NIOCore16EventLoopPromiseV16completeWithTaskyScTyyts5NeverOGxyYaYbKcFyyYaYbcfU_TQ0_ + 1\n14  RedLemon                            0x00000001034daac1 $s7NIOCore16EventLoopPromiseV16completeWithTaskyScTyyts5NeverOGxyYaYbKcFyyYaYbcfU_TATQ0_ + 1\n15  RedLemon                            0x0000000102d0b911 $sxIeghHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_ + 1\n16  RedLemon                            0x0000000102d0ba41 $sxIeghHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_ + 1\n17  libswift_Concurrency.dylib          0x00007ffb28dad441 _ZL23completeTaskWithClosurePN5swift12AsyncContextEPNS_10SwiftErrorE + 1"],
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "lastExceptionBacktrace" : [{"imageOffset":1029843,"symbol":"__exceptionPreprocess","symbolLocation":226,"imageIndex":1},{"imageOffset":92347,"symbol":"objc_exception_throw","symbolLocation":48,"imageIndex":16},{"imageOffset":372935,"symbol":"-[NSRegularExpression(NSMatching) enumerateMatchesInString:options:range:usingBlock:]","symbolLocation":2314,"imageIndex":10},{"imageOffset":599130,"symbol":"-[NSRegularExpression(NSMatching) matchesInString:options:range:]","symbolLocation":160,"imageIndex":10},{"imageOffset":33307833,"sourceLine":558,"sourceFile":"SubDLClient.swift","symbol":"SubDLClient.extractSubtitleFromZip(zipURL:season:episode:)","imageIndex":5,"symbolLocation":12393},{"imageOffset":33282791,"sourceLine":363,"sourceFile":"SubDLClient.swift","symbol":"(3) suspend resume partial function for SubDLClient.download(downloadPath:offset:season:episode:)","imageIndex":5,"symbolLocation":6631},{"imageOffset":32603169,"sourceLine":74,"sourceFile":"SubtitleRoutes.swift","symbol":"(4) await resume partial function for closure #2 in registerSubtitleRoutes(_:)","imageIndex":5,"symbolLocation":1},{"imageOffset":34207729,"sourceLine":148,"sourceFile":"RoutesBuilder+Concurrency.swift","symbol":"(4) await resume partial function for closure #1 in RoutesBuilder.on<A>(_:_:body:use:)","imageIndex":5,"symbolLocation":1},{"imageOffset":34209313,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for partial apply for closure #1 in RoutesBuilder.on<A>(_:_:body:use:)","symbolLocation":1,"imageIndex":5},{"imageOffset":34130785,"sourceLine":24,"sourceFile":"AsyncBasicResponder.swift","symbol":"(1) await resume partial function for AsyncBasicResponder.respond(to:)","imageIndex":5,"symbolLocation":1},{"imageOffset":34131473,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for protocol witness for AsyncResponder.respond(to:) in conformance AsyncBasicResponder","symbolLocation":1,"imageIndex":5},{"imageOffset":34190705,"sourceLine":11,"sourceFile":"Responder+Concurrency.swift","symbol":"(1) await resume partial function for closure #1 in AsyncResponder.respond(to:)","imageIndex":5,"symbolLocation":1},{"imageOffset":34191345,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for partial apply for closure #1 in AsyncResponder.respond(to:)","symbolLocation":1,"imageIndex":5},{"imageOffset":9181041,"sourceLine":67,"sourceFile":"AsyncAwaitSupport.swift","symbol":"(1) await resume partial function for closure #1 in EventLoopPromise.completeWithTask(_:)","imageIndex":5,"symbolLocation":1},{"imageOffset":9181889,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for partial apply for closure #1 in EventLoopPromise.completeWithTask(_:)","symbolLocation":1,"imageIndex":5},{"imageOffset":993553,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for thunk for @escaping @callee_guaranteed @Sendable @async () -> (@out A)","symbolLocation":1,"imageIndex":5},{"imageOffset":993857,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for partial apply for thunk for @escaping @callee_guaranteed @Sendable @async () -> (@out A)","symbolLocation":1,"imageIndex":5},{"imageOffset":197697,"symbol":"completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*)","symbolLocation":1,"imageIndex":20}],
  "faultingThread" : 17,
  "threads" : [{"id":254087,"queue":"com.apple.main-thread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":2},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":2},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":2},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":3},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":3},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":3},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":3},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":4},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":4},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":4},{"imageOffset":17466115,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":5,"symbolLocation":35},{"imageOffset":17466249,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":5},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":6}]},{"id":254093,"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780831,"symbol":"wait_wakeup","symbolLocation":255,"imageIndex":8},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":8},{"imageOffset":25695155,"sourceLine":312,"sourceFile":"MPVWrapper.swift","symbol":"(3) suspend resume partial function for MPVWrapper.pollEvents()","imageIndex":5,"symbolLocation":259},{"imageOffset":25612769,"sourceLine":125,"sourceFile":"MPVWrapper.swift","symbol":"(2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:)","imageIndex":5,"symbolLocation":1}]},{"id":254094,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254095,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254096,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254116,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254144,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254146,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254148,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":2394468,"imageIndex":9},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":10},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254153,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15239817,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15280559,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15282180,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15243067,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15280296,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15135606,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15139807,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15078242,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15078327,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15077930,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15129485,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15103156,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15056238,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15069588,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15023394,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15023468,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15023305,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15052271,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14666504,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14668378,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14693683,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15283199,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15294319,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15294505,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254154,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15239817,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15280559,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15282180,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15243067,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15280296,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15135606,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15139807,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15078242,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15078327,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15077930,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15129485,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15103156,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15056238,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15069588,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15023394,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15023468,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15023305,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15052271,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14666504,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14668378,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14693683,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15283199,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15294319,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15294505,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254155,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15239817,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15280559,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15282180,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15243067,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15280296,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15135606,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15139807,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15078242,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15078327,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15077930,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15129485,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15103156,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15056238,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15069588,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15023394,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15023468,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15023305,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15052271,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14666504,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14668378,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14693683,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15283199,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15294319,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15294505,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254156,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15239817,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15280559,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15282180,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15243067,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15280296,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15135606,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15139807,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15078242,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15078327,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15077930,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15129485,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15103156,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15056238,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15069588,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15023394,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15023468,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15023305,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15052271,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14666504,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14668378,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14693683,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15283199,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15294319,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15294505,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254157,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14703103,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14706894,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15283199,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15294319,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15294505,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254158,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14703103,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14706894,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15283199,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15294319,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15294505,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254159,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14703103,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14706894,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15283199,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15294319,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15294505,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254160,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14703103,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14706894,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15283199,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15294319,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15294505,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"triggered":true,"id":254206,"threadState":{"r13":{"value":206158430216},"rax":{"value":0},"rflags":{"value":582},"cpu":{"value":0},"r14":{"value":6},"rsi":{"value":6},"r8":{"value":123145325165440},"cr2":{"value":0},"rdx":{"value":0},"r10":{"value":0},"r9":{"value":140703389085595},"r15":{"value":22},"rbx":{"value":123145325182976},"trap":{"value":133},"err":{"value":33554760},"r11":{"value":582},"rip":{"value":140703389130702,"matchesCrashFrame":1},"rbp":{"value":123145325165792},"rsp":{"value":123145325165752},"r12":{"value":71447},"rcx":{"value":123145325165752},"flavor":"x86_THREAD_STATE","rdi":{"value":71447}},"queue":"com.apple.root.default-qos.cooperative","frames":[{"imageOffset":32718,"symbol":"__pthread_kill","symbolLocation":10,"imageIndex":0},{"imageOffset":25087,"symbol":"pthread_kill","symbolLocation":263,"imageIndex":7},{"imageOffset":531732,"symbol":"abort","symbolLocation":123,"imageIndex":14},{"imageOffset":65666,"symbol":"abort_message","symbolLocation":241,"imageIndex":15},{"imageOffset":4701,"symbol":"demangling_terminate_handler()","symbolLocation":266,"imageIndex":15},{"imageOffset":122425,"symbol":"_objc_terminate()","symbolLocation":96,"imageIndex":16},{"imageOffset":62631,"symbol":"std::__terminate(void (*)())","symbolLocation":8,"imageIndex":15},{"imageOffset":72965,"symbol":"__cxxabiv1::failed_throw(__cxxabiv1::__cxa_exception*)","symbolLocation":27,"imageIndex":15},{"imageOffset":72908,"symbol":"__cxa_throw","symbolLocation":116,"imageIndex":15},{"imageOffset":92601,"symbol":"objc_exception_throw","symbolLocation":302,"imageIndex":16},{"imageOffset":372935,"symbol":"-[NSRegularExpression(NSMatching) enumerateMatchesInString:options:range:usingBlock:]","symbolLocation":2314,"imageIndex":10},{"imageOffset":599130,"symbol":"-[NSRegularExpression(NSMatching) matchesInString:options:range:]","symbolLocation":160,"imageIndex":10},{"imageOffset":33307833,"sourceLine":558,"sourceFile":"SubDLClient.swift","symbol":"SubDLClient.extractSubtitleFromZip(zipURL:season:episode:)","imageIndex":5,"symbolLocation":12393},{"imageOffset":33282791,"sourceLine":363,"sourceFile":"SubDLClient.swift","symbol":"(3) suspend resume partial function for SubDLClient.download(downloadPath:offset:season:episode:)","imageIndex":5,"symbolLocation":6631},{"imageOffset":32603169,"sourceLine":74,"sourceFile":"SubtitleRoutes.swift","symbol":"(4) await resume partial function for closure #2 in registerSubtitleRoutes(_:)","imageIndex":5,"symbolLocation":1},{"imageOffset":34207729,"sourceLine":148,"sourceFile":"RoutesBuilder+Concurrency.swift","symbol":"(4) await resume partial function for closure #1 in RoutesBuilder.on<A>(_:_:body:use:)","imageIndex":5,"symbolLocation":1},{"imageOffset":34209313,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for partial apply for closure #1 in RoutesBuilder.on<A>(_:_:body:use:)","symbolLocation":1,"imageIndex":5}]},{"id":254315,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254316,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254317,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254318,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254319,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254320,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254321,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254322,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254323,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254324,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254325,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254326,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254327,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254328,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254329,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254330,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254331,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254332,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254333,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254334,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254335,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254336,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254337,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254338,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":254339,"name":"core","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":673217,"symbol":"mp_dispatch_queue_process","symbolLocation":369,"imageIndex":8},{"imageOffset":917272,"symbol":"mp_wait_events","symbolLocation":88,"imageIndex":8},{"imageOffset":930187,"symbol":"mp_idle","symbolLocation":91,"imageIndex":8},{"imageOffset":902299,"symbol":"open_demux_reentrant","symbolLocation":299,"imageIndex":8},{"imageOffset":894117,"symbol":"play_current_file","symbolLocation":1301,"imageIndex":8},{"imageOffset":892665,"symbol":"mp_play_files","symbolLocation":393,"imageIndex":8},{"imageOffset":782894,"symbol":"core_thread","symbolLocation":62,"imageIndex":8},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254345,"name":"*\/ytdl_hook","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":8},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":8},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":8},{"imageOffset":24086,"imageIndex":17}]},{"id":254346,"name":"*\/stats","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":8},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":8},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":8},{"imageOffset":24086,"imageIndex":17}]},{"id":254347,"name":"*\/console","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":8},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":8},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":8},{"imageOffset":24086,"imageIndex":17}]},{"id":254348,"name":"*\/auto_profiles","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":8},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":8},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":8},{"imageOffset":24086,"imageIndex":17}]},{"id":254349,"name":"CVDisplayLink","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27300,"symbol":"_pthread_cond_wait","symbolLocation":1302,"imageIndex":7},{"imageOffset":11872,"symbol":"CVDisplayLink::waitUntil(unsigned long long)","symbolLocation":370,"imageIndex":18},{"imageOffset":7644,"symbol":"CVDisplayLink::runIOThread()","symbolLocation":526,"imageIndex":18},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":254351,"name":"opener","frames":[{"imageOffset":32874,"symbol":"poll","symbolLocation":10,"imageIndex":0},{"imageOffset":977885,"imageIndex":19}]},{"id":254377,"name":"worker","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":685181,"symbol":"worker_thread","symbolLocation":173,"imageIndex":8},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703389097984,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703389642752,
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
    "base" : 140703537500160,
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
    "base" : 140703434199040,
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
    "base" : 140707874754560,
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
    "base" : 4341207040,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 39747584,
    "uuid" : "91e82b35-2446-3d75-879c-7a1e33ac183d",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4555419648,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703389327360,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4460027904,
    "size" : 2883584,
    "uuid" : "e355e4d8-dcc6-3439-90d2-abf0776cc6ac",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libmpv.2.dylib",
    "name" : "libmpv.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703467646976,
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
    "base" : 140703404834816,
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
    "base" : 140703612428288,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703741444096,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703387537408,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703388082176,
    "size" : 561152,
    "uuid" : "202d7260-ea46-3956-a471-19c9bcf45274",
    "path" : "\/usr\/lib\/system\/libsystem_c.dylib",
    "name" : "libsystem_c.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703389007872,
    "size" : 90112,
    "uuid" : "69ac868b-1157-364a-984a-5ef26973f661",
    "path" : "\/usr\/lib\/libc++abi.dylib",
    "name" : "libc++abi.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703387828224,
    "size" : 241664,
    "uuid" : "b36a2b52-68a9-3e44-b927-71c24be1272f",
    "path" : "\/usr\/lib\/libobjc.A.dylib",
    "name" : "libobjc.A.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4484767744,
    "size" : 425984,
    "uuid" : "790d1386-66cf-39c0-ab74-e7b60abbd7c9",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libluajit-5.1.2.dylib",
    "name" : "libluajit-5.1.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703515856896,
    "CFBundleShortVersionString" : "1.8",
    "CFBundleIdentifier" : "com.apple.CoreVideo",
    "size" : 335872,
    "uuid" : "fe89c8c7-c939-3115-afdb-7a6190835819",
    "path" : "\/System\/Library\/Frameworks\/CoreVideo.framework\/Versions\/A\/CoreVideo",
    "name" : "CoreVideo",
    "CFBundleVersion" : "480.1"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4457578496,
    "size" : 1818624,
    "uuid" : "9e080321-bda0-344f-97ee-eb2d8365a1c4",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libavformat.61.dylib",
    "name" : "libavformat.61.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140716698750976,
    "size" : 262144,
    "uuid" : "01d2f741-2f1e-33c9-9b51-abb5c07e6914",
    "path" : "\/usr\/lib\/swift\/libswift_Concurrency.dylib",
    "name" : "libswift_Concurrency.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703386066944,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=253.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=253.0M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               256K        2 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                           116K       11 \nCG raster data                      68K        8 \nColorSync                          224K       27 \nCoreAnimation                      696K       33 \nCoreGraphics                        12K        2 \nCoreUI image data                  952K        9 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nIOKit                             7940K        1 \nImage IO                          8456K        3 \nKernel Alloc Once                    8K        1 \nMALLOC                           117.2M      174 \nMALLOC guard page                   48K       11 \nSQLite page cache                 1408K       22 \nSTACK GUARD                       56.2M       50 \nStack                             32.9M       52 \nVM_ALLOCATE                       13.4M       25 \n__CTF                               756        1 \n__DATA                            55.4M      604 \n__DATA_CONST                      33.6M      413 \n__DATA_DIRTY                      1658K      204 \n__FONT_DATA                          4K        1 \n__GLSLBUILTINS                    5176K        1 \n__LINKEDIT                       722.1M       82 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           598.5M      613 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      348.9M       41 \nshared memory                      9.8M       24 \n===========                     =======  ======= \nTOTAL                              2.1G     2469 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.root.default-qos.cooperative"
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





