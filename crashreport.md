-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [93785]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.76 (76)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [93094]
Responsible:           Electron [475]
User ID:               501

Date/Time:             2026-01-13 18:59:51.7411 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA


Time Awake Since Boot: 22000 seconds

System Integrity Protection: enabled

Crashed Thread:        18  Dispatch queue: com.apple.root.background-qos.cooperative

Exception Type:        EXC_CRASH (SIGABRT)
Exception Codes:       0x0000000000000000, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Application Specific Information:
abort() called


Thread 0::  Dispatch queue: com.apple.main-thread
0   AppKit                        	    0x7ff8073d1902 DYLD-STUB$$CFArrayGetCount + 0
1   AppKit                        	    0x7ff8069fc17e _NSGestureRecognizerUpdate + 52
2   CoreFoundation                	    0x7ff803e4a450 __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
3   CoreFoundation                	    0x7ff803e4a2e2 __CFRunLoopDoObservers + 543
4   CoreFoundation                	    0x7ff803e49897 __CFRunLoopRun + 1131
5   CoreFoundation                	    0x7ff803e48d6c CFRunLoopRunSpecific + 562
6   HIToolbox                     	    0x7ff80cafb5e6 RunCurrentEventLoopInMode + 292
7   HIToolbox                     	    0x7ff80cafb34a ReceiveNextEventCommon + 594
8   HIToolbox                     	    0x7ff80cafb0e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
9   AppKit                        	    0x7ff806887aa9 _DPSNextEvent + 927
10  AppKit                        	    0x7ff806886166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
11  AppKit                        	    0x7ff806878818 -[NSApplication run] + 586
12  AppKit                        	    0x7ff80684c79a NSApplicationMain + 817
13  SwiftUI                       	    0x7ff90f39d09c specialized runApp(_:) + 161
14  SwiftUI                       	    0x7ff90fdff424 runApp<A>(_:) + 164
15  SwiftUI                       	    0x7ff90f8f7c5f static App.main() + 63
16  RedLemon                      	       0x10a018923 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
17  RedLemon                      	       0x10a0189a9 RedLemon_main + 9
18  dyld                          	       0x119d1752e start + 462

Thread 1:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff803d4793a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff803d47ca8 mach_msg + 56
2   SkyLight                      	    0x7ff808d5cd54 CGSSnarfAndDispatchDatagrams + 152
3   SkyLight                      	    0x7ff809023ef2 SLSGetNextEventRecordInternal + 258
4   SkyLight                      	    0x7ff808e6f26d SLEventCreateNextEvent + 9
5   HIToolbox                     	    0x7ff80cb08039 PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*) + 45
6   HIToolbox                     	    0x7ff80cb07fd5 MessageHandler(__CFMachPort*, void*, long, void*) + 48
7   CoreFoundation                	    0x7ff803e784b0 __CFMachPortPerform + 250
8   CoreFoundation                	    0x7ff803e4b854 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 41
9   CoreFoundation                	    0x7ff803e4b734 __CFRunLoopDoSource1 + 619
10  CoreFoundation                	    0x7ff803e49d9b __CFRunLoopRun + 2415
11  CoreFoundation                	    0x7ff803e48d6c CFRunLoopRunSpecific + 562
12  AppKit                        	    0x7ff8069f5572 _NSEventThread + 132
13  libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
14  libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 2:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff803d4793a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff803d47ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff803e4b29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff803e49928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff803e48d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff808a77964 0x7ff80882f000 + 2394468
6   Foundation                    	    0x7ff804ca0724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 3:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff803d4c30e kevent + 10
1   RedLemon                      	       0x109d5c309 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x109d6622f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109d66884 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109d5cfbb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109d66128 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x109d42bf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x109d43c5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109d34be2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x109d34c37 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81135d72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x109d34aaa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x109d4140d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x109d3ad34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x109d2f5ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x109d32a14 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x109d275a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x109d275ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff818d4ce7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x109d27549 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x109d2e66f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x109cd0388 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x109cd0ada closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x109cd6db3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x109d66c7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x109d697ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x109d698a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff803d4c30e kevent + 10
1   RedLemon                      	       0x109d5c309 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x109d6622f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109d66884 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109d5cfbb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109d66128 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x109d42bf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x109d43c5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109d34be2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x109d34c37 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81135d72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x109d34aaa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x109d4140d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x109d3ad34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x109d2f5ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x109d32a14 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x109d275a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x109d275ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff818d4ce7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x109d27549 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x109d2e66f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x109cd0388 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x109cd0ada closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x109cd6db3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x109d66c7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x109d697ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x109d698a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff803d4c30e kevent + 10
1   RedLemon                      	       0x109d5c309 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x109d6622f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109d66884 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109d5cfbb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109d66128 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x109d42bf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x109d43c5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109d34be2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x109d34c37 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81135d72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x109d34aaa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x109d4140d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x109d3ad34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x109d2f5ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x109d32a14 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x109d275a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x109d275ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff818d4ce7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x109d27549 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x109d2e66f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x109cd0388 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x109cd0ada closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x109cd6db3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x109d66c7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x109d697ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x109d698a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff803d4c30e kevent + 10
1   RedLemon                      	       0x109d5c309 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x109d6622f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109d66884 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109d5cfbb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109d66128 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x109d42bf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x109d43c5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109d34be2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x109d34c37 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81135d72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x109d34aaa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x109d4140d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x109d3ad34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x109d2f5ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x109d32a14 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x109d275a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x109d275ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff818d4ce7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x109d27549 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x109d2e66f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x109cd0388 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x109cd0ada closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x109cd6db3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x109d66c7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x109d697ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x109d698a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 7:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff803d47976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff803bcc7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff803bccc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x109cd927f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x109cda14e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109d66c7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x109d697ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x109d698a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 8:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff803d47976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff803bcc7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff803bccc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x109cd927f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x109cda14e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109d66c7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x109d697ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x109d698a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 9:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff803d47976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff803bcc7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff803bccc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x109cd927f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x109cda14e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109d66c7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x109d697ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x109d698a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 10:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff803d47976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff803bcc7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff803bccc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x109cd927f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x109cda14e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109d66c7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x109d697ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x109d698a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 11:
0   libsystem_pthread.dylib       	    0x7ff803d7ff48 start_wqthread + 0

Thread 12:
0   libsystem_pthread.dylib       	    0x7ff803d7ff48 start_wqthread + 0

Thread 13:
0   libsystem_pthread.dylib       	    0x7ff803d7ff48 start_wqthread + 0

Thread 14::  Dispatch queue: com.apple.CFNetwork.LoaderQ
0   libobjc.A.dylib               	    0x7ff803c1723c objc_msgSend + 60
1   CFNetwork                     	    0x7ff80884fc14 0x7ff80882f000 + 134164
2   CFNetwork                     	    0x7ff80884c330 0x7ff80882f000 + 119600
3   CFNetwork                     	    0x7ff8089cb527 0x7ff80882f000 + 1688871
4   CFNetwork                     	    0x7ff8088cb2f5 0x7ff80882f000 + 639733
5   libdispatch.dylib             	    0x7ff803bcb0cc _dispatch_call_block_and_release + 12
6   libdispatch.dylib             	    0x7ff803bcc317 _dispatch_client_callout + 8
7   libdispatch.dylib             	    0x7ff803bd2317 _dispatch_lane_serial_drain + 672
8   libdispatch.dylib             	    0x7ff803bd2e30 _dispatch_lane_invoke + 417
9   libdispatch.dylib             	    0x7ff803bd40f6 _dispatch_workloop_invoke + 1987
10  libdispatch.dylib             	    0x7ff803bdceee _dispatch_workloop_worker_thread + 753
11  libsystem_pthread.dylib       	    0x7ff803d80fd0 _pthread_wqthread + 326
12  libsystem_pthread.dylib       	    0x7ff803d7ff57 start_wqthread + 15

Thread 15:: worker
0   libsystem_kernel.dylib        	    0x7ff803d4a3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff803d84a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x110d8247d worker_thread + 173
3   libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
4   libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 16:: com.apple.coremedia.rootQueue.47
0   libsystem_kernel.dylib        	    0x7ff803d4798e semaphore_timedwait_trap + 10
1   libdispatch.dylib             	    0x7ff803bcc848 _dispatch_sema4_timedwait + 72
2   libdispatch.dylib             	    0x7ff803bccc75 _dispatch_semaphore_wait_slow + 58
3   libdispatch.dylib             	    0x7ff803bdb8ef _dispatch_worker_thread + 308
4   libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 17:: AMCP Logging Spool
0   libsystem_kernel.dylib        	    0x7ff803d47976 semaphore_wait_trap + 10
1   caulk                         	    0x7ff80c8882e6 caulk::mach::semaphore::wait_or_error() + 16
2   caulk                         	    0x7ff80c870148 caulk::concurrent::details::worker_thread::run() + 36
3   caulk                         	    0x7ff80c86fe0c void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*) + 41
4   libsystem_pthread.dylib       	    0x7ff803d844e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff803d7ff6b thread_start + 15

Thread 18 Crashed::  Dispatch queue: com.apple.root.background-qos.cooperative
0   libsystem_kernel.dylib        	    0x7ff803d4dfce __pthread_kill + 10
1   libsystem_pthread.dylib       	    0x7ff803d841ff pthread_kill + 263
2   libsystem_c.dylib             	    0x7ff803ccfd14 abort + 123
3   libmpv.2.dylib                	       0x110e498dd mp_clients_destroy.cold.1 + 29
4   libmpv.2.dylib                	       0x110d9903d mp_clients_destroy + 77
5   libmpv.2.dylib                	       0x110db7bdd mp_destroy + 93
6   libmpv.2.dylib                	       0x110d99e73 mp_destroy_client + 1043
7   RedLemon                      	       0x10a9f40be (1) suspend resume partial function for closure #1 in MPVWrapper.destroy() + 302 (MPVWrapper.swift:1427)
8   RedLemon                      	       0x10a9f54d1 (1) await resume partial function for partial apply for closure #1 in MPVWrapper.destroy() + 1

Thread 19:
0   libsystem_pthread.dylib       	    0x7ff803d7ff48 start_wqthread + 0

Thread 20:
0   libsystem_pthread.dylib       	    0x7ff803d7ff48 start_wqthread + 0

Thread 21:
0   libsystem_pthread.dylib       	    0x7ff803d7ff48 start_wqthread + 0

Thread 22:
0   libsystem_pthread.dylib       	    0x7ff803d7ff48 start_wqthread + 0


Thread 18 crashed with X86 Thread State (64-bit):
  rax: 0x0000000000000000  rbx: 0x0000700006d0a000  rcx: 0x0000700006d09c18  rdx: 0x0000000000000000
  rdi: 0x000000000001d12b  rsi: 0x0000000000000006  rbp: 0x0000700006d09c40  rsp: 0x0000700006d09c18
   r8: 0x00007f81e6da9848   r9: 0x0000000000000000  r10: 0x0000000000000000  r11: 0x0000000000000246
  r12: 0x000000000001d12b  r13: 0x00007f81e73c57e8  r14: 0x0000000000000006  r15: 0x0000000000000016
  rip: 0x00007ff803d4dfce  rfl: 0x0000000000000246  cr2: 0x0000000000000000
  
Logical CPU:     0
Error Code:      0x02000148 
Trap Number:     133


Binary Images:
    0x7ff806849000 -     0x7ff8076d8fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff803dcb000 -     0x7ff8042cdfff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff80cacd000 -     0x7ff80cdc0fff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff90f321000 -     0x7ff9101c0fff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x108ed2000 -        0x10b8fdfff com.redlemon.app (1.0.76) <c1caaacb-093e-35e3-b352-6e61f008c954> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x119d12000 -        0x119d7dfff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff803d46000 -     0x7ff803d7dfff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff808d53000 -     0x7ff8090f1fff com.apple.SkyLight (1.600.0) <02f1d11d-315c-3bbe-934a-d58ba3cedbe5> /System/Library/PrivateFrameworks/SkyLight.framework/Versions/A/SkyLight
    0x7ff803d7e000 -     0x7ff803d89fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff80882f000 -     0x7ff808cbdfff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff804c48000 -     0x7ff805004fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff811242000 -     0x7ff8116bbfff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff818d4c000 -     0x7ff818d4dfff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff803bc9000 -     0x7ff803c0ffff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff803c10000 -     0x7ff803c4afff libobjc.A.dylib (*) <b36a2b52-68a9-3e44-b927-71c24be1272f> /usr/lib/libobjc.A.dylib
       0x110cdb000 -        0x110f9afff libmpv.2.dylib (*) <e355e4d8-dcc6-3439-90d2-abf0776cc6ac> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libmpv.2.dylib
    0x7ff80c86e000 -     0x7ff80c88ffff com.apple.audio.caulk (1.0) <f04b5c91-d0ec-33c6-8a81-b80a3ebf827f> /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk
    0x7ff803c4e000 -     0x7ff803cd6fff libsystem_c.dylib (*) <202d7260-ea46-3956-a471-19c9bcf45274> /usr/lib/system/libsystem_c.dylib

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
Writable regions: Total=239.5M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=239.5M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               384K        3 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                           228K       14 
CG raster data                     220K       26 
ColorSync                          228K       28 
CoreAnimation                     1980K       41 
CoreGraphics                        12K        2 
CoreUI image data                 1328K       10 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
IOKit                             7940K        1 
Image IO                          2344K       18 
Kernel Alloc Once                    8K        1 
MALLOC                           122.0M      165 
MALLOC guard page                   48K       11 
OpenGL GLSL                        384K        5 
SQLite page cache                 1024K       16 
STACK GUARD                       56.1M       23 
Stack                             19.2M       24 
VM_ALLOCATE                       13.5M       41 
__CTF                               756        1 
__DATA                            55.4M      611 
__DATA_CONST                      33.7M      416 
__DATA_DIRTY                      1658K      205 
__FONT_DATA                          4K        1 
__GLSLBUILTINS                    5176K        1 
__LINKEDIT                       730.6M       85 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           604.0M      615 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        14.6M       48 
mapped file                      344.1M       38 
shared memory                      9.8M       29 
===========                     =======  ======= 
TOTAL                              2.1G     2493 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2026-01-13 19:00:09.00 -0500","app_version":"1.0.76","slice_uuid":"c1caaacb-093e-35e3-b352-6e61f008c954","build_version":"76","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"0AB0EA5F-011F-4636-84CA-A327905507D9","name":"RedLemon"}
{
  "uptime" : 22000,
  "procLaunch" : "2026-01-13 18:54:40.0292 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 22552513921695,
  "coalitionID" : 545,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2026-01-13 18:59:51.7411 -0500",
  "incident" : "0AB0EA5F-011F-4636-84CA-A327905507D9",
  "bug_type" : "309",
  "pid" : 93785,
  "procExitAbsTime" : 22864171103918,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.76","CFBundleVersion":"76","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 93094,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 475,
  "responsibleProc" : "Electron",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000000, 0x0000000000000000","rawCodes":[0,0],"type":"EXC_CRASH","signal":"SIGABRT"},
  "asi" : {"libsystem_c.dylib":["abort() called"]},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 18,
  "threads" : [{"id":352028,"queue":"com.apple.main-thread","frames":[{"imageOffset":12093698,"symbol":"DYLD-STUB$$CFArrayGetCount","symbolLocation":0,"imageIndex":0},{"imageOffset":1782142,"symbol":"_NSGestureRecognizerUpdate","symbolLocation":52,"imageIndex":0},{"imageOffset":521296,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__","symbolLocation":23,"imageIndex":1},{"imageOffset":520930,"symbol":"__CFRunLoopDoObservers","symbolLocation":543,"imageIndex":1},{"imageOffset":518295,"symbol":"__CFRunLoopRun","symbolLocation":1131,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":2},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":2},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":2},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":0},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":0},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":0},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":0},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":3},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":3},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":3},{"imageOffset":18114851,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":4,"symbolLocation":35},{"imageOffset":18114985,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":4},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":5}]},{"id":352073,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":6},{"imageOffset":40276,"symbol":"CGSSnarfAndDispatchDatagrams","symbolLocation":152,"imageIndex":7},{"imageOffset":2952946,"symbol":"SLSGetNextEventRecordInternal","symbolLocation":258,"imageIndex":7},{"imageOffset":1163885,"symbol":"SLEventCreateNextEvent","symbolLocation":9,"imageIndex":7},{"imageOffset":241721,"symbol":"PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*)","symbolLocation":45,"imageIndex":2},{"imageOffset":241621,"symbol":"MessageHandler(__CFMachPort*, void*, long, void*)","symbolLocation":48,"imageIndex":2},{"imageOffset":709808,"symbol":"__CFMachPortPerform","symbolLocation":250,"imageIndex":1},{"imageOffset":526420,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__","symbolLocation":41,"imageIndex":1},{"imageOffset":526132,"symbol":"__CFRunLoopDoSource1","symbolLocation":619,"imageIndex":1},{"imageOffset":519579,"symbol":"__CFRunLoopRun","symbolLocation":2415,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":0},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":352287,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":6},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":2394468,"imageIndex":9},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":10},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":352288,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":6},{"imageOffset":15246089,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":4},{"imageOffset":15286831,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":95},{"imageOffset":15288452,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":4},{"imageOffset":15249339,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":4,"symbolLocation":395},{"imageOffset":15286568,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":312},{"imageOffset":15141878,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":230},{"imageOffset":15146079,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":4},{"imageOffset":15084514,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":50},{"imageOffset":15084599,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":4},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15084202,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":346},{"imageOffset":15135757,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":1053},{"imageOffset":15109428,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":100},{"imageOffset":15062510,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":4,"symbolLocation":158},{"imageOffset":15075860,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":4},{"imageOffset":15029666,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":34},{"imageOffset":15029740,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":4},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15029577,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":57},{"imageOffset":15058543,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":4,"symbolLocation":591},{"imageOffset":14672776,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":4,"symbolLocation":856},{"imageOffset":14674650,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":4,"symbolLocation":282},{"imageOffset":14699955,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":4},{"imageOffset":15289471,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15300591,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15300777,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":352290,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":6},{"imageOffset":15246089,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":4},{"imageOffset":15286831,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":95},{"imageOffset":15288452,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":4},{"imageOffset":15249339,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":4,"symbolLocation":395},{"imageOffset":15286568,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":312},{"imageOffset":15141878,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":230},{"imageOffset":15146079,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":4},{"imageOffset":15084514,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":50},{"imageOffset":15084599,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":4},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15084202,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":346},{"imageOffset":15135757,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":1053},{"imageOffset":15109428,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":100},{"imageOffset":15062510,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":4,"symbolLocation":158},{"imageOffset":15075860,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":4},{"imageOffset":15029666,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":34},{"imageOffset":15029740,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":4},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15029577,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":57},{"imageOffset":15058543,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":4,"symbolLocation":591},{"imageOffset":14672776,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":4,"symbolLocation":856},{"imageOffset":14674650,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":4,"symbolLocation":282},{"imageOffset":14699955,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":4},{"imageOffset":15289471,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15300591,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15300777,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":352291,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":6},{"imageOffset":15246089,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":4},{"imageOffset":15286831,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":95},{"imageOffset":15288452,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":4},{"imageOffset":15249339,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":4,"symbolLocation":395},{"imageOffset":15286568,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":312},{"imageOffset":15141878,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":230},{"imageOffset":15146079,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":4},{"imageOffset":15084514,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":50},{"imageOffset":15084599,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":4},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15084202,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":346},{"imageOffset":15135757,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":1053},{"imageOffset":15109428,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":100},{"imageOffset":15062510,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":4,"symbolLocation":158},{"imageOffset":15075860,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":4},{"imageOffset":15029666,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":34},{"imageOffset":15029740,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":4},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15029577,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":57},{"imageOffset":15058543,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":4,"symbolLocation":591},{"imageOffset":14672776,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":4,"symbolLocation":856},{"imageOffset":14674650,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":4,"symbolLocation":282},{"imageOffset":14699955,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":4},{"imageOffset":15289471,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15300591,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15300777,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":352292,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":6},{"imageOffset":15246089,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":4},{"imageOffset":15286831,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":95},{"imageOffset":15288452,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":4},{"imageOffset":15249339,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":4,"symbolLocation":395},{"imageOffset":15286568,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":312},{"imageOffset":15141878,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":230},{"imageOffset":15146079,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":4},{"imageOffset":15084514,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":50},{"imageOffset":15084599,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":4},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15084202,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":346},{"imageOffset":15135757,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":1053},{"imageOffset":15109428,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":100},{"imageOffset":15062510,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":4,"symbolLocation":158},{"imageOffset":15075860,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":4},{"imageOffset":15029666,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":34},{"imageOffset":15029740,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":4},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15029577,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":57},{"imageOffset":15058543,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":4,"symbolLocation":591},{"imageOffset":14672776,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":4,"symbolLocation":856},{"imageOffset":14674650,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":4,"symbolLocation":282},{"imageOffset":14699955,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":4},{"imageOffset":15289471,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15300591,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15300777,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":352294,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14709375,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":4,"symbolLocation":143},{"imageOffset":14713166,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":4,"symbolLocation":222},{"imageOffset":15289471,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15300591,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15300777,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":352295,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14709375,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":4,"symbolLocation":143},{"imageOffset":14713166,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":4,"symbolLocation":222},{"imageOffset":15289471,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15300591,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15300777,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":352296,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14709375,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":4,"symbolLocation":143},{"imageOffset":14713166,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":4,"symbolLocation":222},{"imageOffset":15289471,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15300591,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15300777,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":352297,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14709375,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":4,"symbolLocation":143},{"imageOffset":14713166,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":4,"symbolLocation":222},{"imageOffset":15289471,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15300591,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15300777,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":356108,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":356334,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":356615,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":356656,"queue":"com.apple.CFNetwork.LoaderQ","frames":[{"imageOffset":29244,"symbol":"objc_msgSend","symbolLocation":60,"imageIndex":14},{"imageOffset":134164,"imageIndex":9},{"imageOffset":119600,"imageIndex":9},{"imageOffset":1688871,"imageIndex":9},{"imageOffset":639733,"imageIndex":9},{"imageOffset":8396,"symbol":"_dispatch_call_block_and_release","symbolLocation":12,"imageIndex":13},{"imageOffset":13079,"symbol":"_dispatch_client_callout","symbolLocation":8,"imageIndex":13},{"imageOffset":37655,"symbol":"_dispatch_lane_serial_drain","symbolLocation":672,"imageIndex":13},{"imageOffset":40496,"symbol":"_dispatch_lane_invoke","symbolLocation":417,"imageIndex":13},{"imageOffset":45302,"symbol":"_dispatch_workloop_invoke","symbolLocation":1987,"imageIndex":13},{"imageOffset":81646,"symbol":"_dispatch_workloop_worker_thread","symbolLocation":753,"imageIndex":13},{"imageOffset":12240,"symbol":"_pthread_wqthread","symbolLocation":326,"imageIndex":8},{"imageOffset":8023,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":8}]},{"id":356658,"name":"worker","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":8},{"imageOffset":685181,"symbol":"worker_thread","symbolLocation":173,"imageIndex":15},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":356667,"name":"com.apple.coremedia.rootQueue.47","frames":[{"imageOffset":6542,"symbol":"semaphore_timedwait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":14408,"symbol":"_dispatch_sema4_timedwait","symbolLocation":72,"imageIndex":13},{"imageOffset":15477,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":58,"imageIndex":13},{"imageOffset":76015,"symbol":"_dispatch_worker_thread","symbolLocation":308,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":356681,"name":"AMCP Logging Spool","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":107238,"symbol":"caulk::mach::semaphore::wait_or_error()","symbolLocation":16,"imageIndex":16},{"imageOffset":8520,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":36,"imageIndex":16},{"imageOffset":7692,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*)","symbolLocation":41,"imageIndex":16},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"triggered":true,"id":356783,"threadState":{"r13":{"value":140195907000296},"rax":{"value":0},"rflags":{"value":582},"cpu":{"value":0},"r14":{"value":6},"rsi":{"value":6},"r8":{"value":140195900594248},"cr2":{"value":0},"rdx":{"value":0},"r10":{"value":0},"r9":{"value":0},"r15":{"value":22},"rbx":{"value":123145416646656},"trap":{"value":133},"err":{"value":33554760},"r11":{"value":582},"rip":{"value":140703192899534,"matchesCrashFrame":1},"rbp":{"value":123145416645696},"rsp":{"value":123145416645656},"r12":{"value":119083},"rcx":{"value":123145416645656},"flavor":"x86_THREAD_STATE","rdi":{"value":119083}},"queue":"com.apple.root.background-qos.cooperative","frames":[{"imageOffset":32718,"symbol":"__pthread_kill","symbolLocation":10,"imageIndex":6},{"imageOffset":25087,"symbol":"pthread_kill","symbolLocation":263,"imageIndex":8},{"imageOffset":531732,"symbol":"abort","symbolLocation":123,"imageIndex":17},{"imageOffset":1501405,"symbol":"mp_clients_destroy.cold.1","symbolLocation":29,"imageIndex":15},{"imageOffset":778301,"symbol":"mp_clients_destroy","symbolLocation":77,"imageIndex":15},{"imageOffset":904157,"symbol":"mp_destroy","symbolLocation":93,"imageIndex":15},{"imageOffset":781939,"symbol":"mp_destroy_client","symbolLocation":1043,"imageIndex":15},{"imageOffset":28451006,"sourceLine":1427,"sourceFile":"MPVWrapper.swift","symbol":"(1) suspend resume partial function for closure #1 in MPVWrapper.destroy()","imageIndex":4,"symbolLocation":302},{"imageOffset":28456145,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for partial apply for closure #1 in MPVWrapper.destroy()","symbolLocation":1,"imageIndex":4}]},{"id":356784,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":356867,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":356868,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":356869,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703237967872,
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
    "arch" : "x86_64h",
    "base" : 140703193411584,
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
    "base" : 140703341268992,
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
    "base" : 140707678523392,
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
    "base" : 4444725248,
    "CFBundleShortVersionString" : "1.0.76",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 44220416,
    "uuid" : "c1caaacb-093e-35e3-b352-6e61f008c954",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "76"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4728102912,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703192866816,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703276806144,
    "CFBundleShortVersionString" : "1.600.0",
    "CFBundleIdentifier" : "com.apple.SkyLight",
    "size" : 3796992,
    "uuid" : "02f1d11d-315c-3bbe-934a-d58ba3cedbe5",
    "path" : "\/System\/Library\/PrivateFrameworks\/SkyLight.framework\/Versions\/A\/SkyLight",
    "name" : "SkyLight"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703193096192,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703271415808,
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
    "base" : 140703208603648,
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
    "base" : 140703416197120,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703545212928,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703191306240,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703191597056,
    "size" : 241664,
    "uuid" : "b36a2b52-68a9-3e44-b927-71c24be1272f",
    "path" : "\/usr\/lib\/libobjc.A.dylib",
    "name" : "libobjc.A.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4576882688,
    "size" : 2883584,
    "uuid" : "e355e4d8-dcc6-3439-90d2-abf0776cc6ac",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libmpv.2.dylib",
    "name" : "libmpv.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703338782720,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.audio.caulk",
    "size" : 139264,
    "uuid" : "f04b5c91-d0ec-33c6-8a81-b80a3ebf827f",
    "path" : "\/System\/Library\/PrivateFrameworks\/caulk.framework\/Versions\/A\/caulk",
    "name" : "caulk"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703191851008,
    "size" : 561152,
    "uuid" : "202d7260-ea46-3956-a471-19c9bcf45274",
    "path" : "\/usr\/lib\/system\/libsystem_c.dylib",
    "name" : "libsystem_c.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703189835776,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=239.5M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=239.5M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               384K        3 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                           228K       14 \nCG raster data                     220K       26 \nColorSync                          228K       28 \nCoreAnimation                     1980K       41 \nCoreGraphics                        12K        2 \nCoreUI image data                 1328K       10 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nIOKit                             7940K        1 \nImage IO                          2344K       18 \nKernel Alloc Once                    8K        1 \nMALLOC                           122.0M      165 \nMALLOC guard page                   48K       11 \nOpenGL GLSL                        384K        5 \nSQLite page cache                 1024K       16 \nSTACK GUARD                       56.1M       23 \nStack                             19.2M       24 \nVM_ALLOCATE                       13.5M       41 \n__CTF                               756        1 \n__DATA                            55.4M      611 \n__DATA_CONST                      33.7M      416 \n__DATA_DIRTY                      1658K      205 \n__FONT_DATA                          4K        1 \n__GLSLBUILTINS                    5176K        1 \n__LINKEDIT                       730.6M       85 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           604.0M      615 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        14.6M       48 \nmapped file                      344.1M       38 \nshared memory                      9.8M       29 \n===========                     =======  ======= \nTOTAL                              2.1G     2493 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.root.background-qos.cooperative"
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
