-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [40739]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [36268]
Responsible:           Electron [637]
User ID:               501

Date/Time:             2025-11-27 23:49:08.6489 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA

Sleep/Wake UUID:       638EDFA8-4CD7-43A7-8137-3585F02B06A0

Time Awake Since Boot: 38000 seconds
Time Since Wake:       38628 seconds

System Integrity Protection: enabled

Crashed Thread:        14  Dispatch queue: com.apple.root.user-initiated-qos.cooperative

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       UNKNOWN_0xD at 0x0000000000000000
Exception Codes:       0x000000000000000d, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 11 Segmentation fault: 11
Terminating Process:   exc handler [40739]

VM Region Info: 0 is not in any region.  Bytes before following region: 4435406848
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      UNUSED SPACE AT START
--->  
      __TEXT                      1085ef000-10a533000    [ 31.3M] r-x/r-x SM=COW  ...acOS/RedLemon

Thread 0::  Dispatch queue: com.apple.main-thread
0   libswiftCore.dylib            	    0x7ff817a55a9c getEnumTag for ClosedRange<>.Index + 12
1   AttributeGraph                	    0x7ff916720ab8 AG::LayoutDescriptor::compare(unsigned char const*, unsigned char const*, unsigned char const*, unsigned long, unsigned int) + 799
2   AttributeGraph                	    0x7ff91672ff0d AGGraphSetOutputValue + 463
3   SwiftUI                       	    0x7ff915b196b4 partial apply for thunk for @callee_guaranteed (@unowned UnsafePointer<A.BodyAccessor.Body>) -> (@error @owned Error) + 50
4   libswiftCore.dylib            	    0x7ff8178a972c withUnsafePointer<A, B>(to:_:) + 12
5   SwiftUI                       	    0x7ff915b18681 ViewBodyAccessor.updateBody(of:changed:) + 1485
6   SwiftUI                       	    0x7ff915ec661b StaticBody.updateValue() + 165
7   SwiftUI                       	    0x7ff9159a620a partial apply for implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 26
8   AttributeGraph                	    0x7ff916712757 AG::Graph::UpdateStack::update() + 559
9   AttributeGraph                	    0x7ff916712d57 AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421
10  AttributeGraph                	    0x7ff91671d35e AG::Subgraph::update(unsigned int) + 904
11  SwiftUI                       	    0x7ff9164a04ab GraphHost.flushTransactions() + 495
12  SwiftUI                       	    0x7ff9164a1304 closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:) + 15
13  SwiftUI                       	    0x7ff915af56aa partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:) + 17
14  SwiftUI                       	    0x7ff916306ca8 closure #1 in ViewRendererHost.updateViewGraph<A>(body:) + 69
15  SwiftUI                       	    0x7ff9163058df ViewRendererHost.updateViewGraph<A>(body:) + 78
16  SwiftUI                       	    0x7ff916313cd0 protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1> + 25
17  SwiftUI                       	    0x7ff915aee2a4 ViewGraphDelegate.updateGraph<A>(body:) + 55
18  SwiftUI                       	    0x7ff915af55e3 protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1> + 25
19  SwiftUI                       	    0x7ff9164a12e0 closure #1 in GraphHost.init(data:) + 122
20  SwiftUI                       	    0x7ff915af6e3c thunk for @escaping @callee_guaranteed () -> () + 12
21  SwiftUI                       	    0x7ff91638625b partial apply for thunk for @escaping @callee_guaranteed () -> () + 17
22  SwiftUI                       	    0x7ff916383b20 static NSRunLoop.flushObservers() + 118
23  SwiftUI                       	    0x7ff9163861d8 closure #1 in closure #1 in static NSRunLoop.addObserver(_:) + 16
24  SwiftUI                       	    0x7ff916380716 specialized thunk for @callee_guaranteed () -> (@error @owned Error) + 14
25  libswiftObjectiveC.dylib      	    0x7ff81f298e7c autoreleasepool<A>(invoking:) + 44
26  SwiftUI                       	    0x7ff9163861c0 closure #1 in static NSRunLoop.addObserver(_:) + 35
27  SwiftUI                       	    0x7ff916386205 @objc closure #1 in static NSRunLoop.addObserver(_:) + 43
28  CoreFoundation                	    0x7ff80a396450 __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
29  CoreFoundation                	    0x7ff80a3962e2 __CFRunLoopDoObservers + 543
30  CoreFoundation                	    0x7ff80a394de0 CFRunLoopRunSpecific + 678
31  HIToolbox                     	    0x7ff8130475e6 RunCurrentEventLoopInMode + 292
32  HIToolbox                     	    0x7ff81304734a ReceiveNextEventCommon + 594
33  HIToolbox                     	    0x7ff8130470e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
34  AppKit                        	    0x7ff80cdd3aa9 _DPSNextEvent + 927
35  AppKit                        	    0x7ff80cdd2166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
36  AppKit                        	    0x7ff80cdc4818 -[NSApplication run] + 586
37  AppKit                        	    0x7ff80cd9879a NSApplicationMain + 817
38  SwiftUI                       	    0x7ff9158e909c specialized runApp(_:) + 161
39  SwiftUI                       	    0x7ff91634b424 runApp<A>(_:) + 164
40  SwiftUI                       	    0x7ff915e43c5f static App.main() + 63
41  RedLemon                      	       0x10969f2f3 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
42  RedLemon                      	       0x10969f379 RedLemon_main + 9
43  dyld                          	       0x11a1e752e start + 462

Thread 1:
0   libsystem_pthread.dylib       	    0x7ff80a2cbf48 start_wqthread + 0

Thread 2:
0   libsystem_pthread.dylib       	    0x7ff80a2cbf48 start_wqthread + 0

Thread 3:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff80a29393a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80a293ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80a39729d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80a395928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80a394d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff80cf41572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 4:
0   libsystem_pthread.dylib       	    0x7ff80a2cbf48 start_wqthread + 0

Thread 5:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff80a29393a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80a293ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80a39729d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80a395928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80a394d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff80efc3964 0x7ff80ed7b000 + 2394468
6   Foundation                    	    0x7ff80b1ec724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff80a29830e kevent + 10
1   RedLemon                      	       0x109478209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10948212f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109482784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109478ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109482028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10945eaf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10945fb5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109450a23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10945d30d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x109456c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10944b4ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10944e914 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x1094434a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x1094434ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff81f298e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x109443449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10944a56f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x1093ec288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x1093ec9da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x1093f2cb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x109482b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x1094856ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x1094857a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 7:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff80a29830e kevent + 10
1   RedLemon                      	       0x109478209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10948212f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109482784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109478ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109482028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10945eaf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10945fb5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109450ae2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x109450b37 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff8178a972c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x1094509aa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10945d30d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x109456c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10944b4ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10944e914 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x1094434a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x1094434ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff81f298e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x109443449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10944a56f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x1093ec288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x1093ec9da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x1093f2cb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x109482b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x1094856ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x1094857a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 8:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff80a29830e kevent + 10
1   RedLemon                      	       0x109478209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10948212f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109482784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109478ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109482028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10945eaf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10945fb5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109450a23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10945d30d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x109456c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10944b4ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10944e914 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x1094434a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x1094434ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff81f298e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x109443449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10944a56f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x1093ec288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x1093ec9da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x1093f2cb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x109482b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x1094856ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x1094857a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 9:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff80a29830e kevent + 10
1   RedLemon                      	       0x109478209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10948212f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109482784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109478ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109482028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10945eaf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10945fb5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109450ae2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x109450b37 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff8178a972c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x1094509aa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10945d30d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x109456c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10944b4ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10944e914 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x1094434a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x1094434ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff81f298e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x109443449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10944a56f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x1093ec288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x1093ec9da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x1093f2cb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x109482b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x1094856ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x1094857a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 10:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff80a293976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80a1187ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80a118c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x1093f517f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1093f604e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109482b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x1094856ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x1094857a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 11:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff80a293976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80a1187ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80a118c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x1093f517f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1093f604e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109482b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x1094856ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x1094857a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 12:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff80a293976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80a1187ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80a118c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x1093f517f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1093f604e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109482b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x1094856ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x1094857a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 13:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff80a293976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80a1187ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80a118c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x1093f517f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1093f604e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109482b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x1094856ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x1094857a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 14 Crashed::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libswiftCore.dylib            	    0x7ff817a8bede bool swift::HeapObjectSideTableEntry::decrementStrong<(swift::PerformDeinit)1>(unsigned int) + 14
1   RedLemon                      	       0x109ac21ee 0x1085ef000 + 21836270
2   libswiftCore.dylib            	    0x7ff817a8b460 _swift_release_dealloc + 16
3   RedLemon                      	       0x1086e210d 0x1085ef000 + 995597
4   libswiftCore.dylib            	    0x7ff817a8b460 _swift_release_dealloc + 16
5   libswift_Concurrency.dylib    	    0x7ffb237d545a completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*) + 26
6   libswift_Concurrency.dylib    	    0x7ffb237d5441 completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*) + 1

Thread 15:
0   libsystem_pthread.dylib       	    0x7ff80a2cbf48 start_wqthread + 0

Thread 16:: core
0   libsystem_kernel.dylib        	    0x7ff80a2963aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80a2d0a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10e2d463e mp_dispatch_queue_process + 494
3   libmpv.2.dylib                	       0x10e30ff18 mp_wait_events + 88
4   libmpv.2.dylib                	       0x10e31318b mp_idle + 91
5   libmpv.2.dylib                	       0x10e3131f8 idle_loop + 40
6   libmpv.2.dylib                	       0x10e309ed8 mp_play_files + 360
7   libmpv.2.dylib                	       0x10e2ef22e core_thread + 62
8   libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 17:: */ytdl_hook
0   libsystem_kernel.dylib        	    0x7ff80a2963aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80a2d0a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10e2ee9a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x10e2ef4c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x10e3858e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10f9cde16 0x10f9c8000 + 24086

Thread 18:: */stats
0   libsystem_kernel.dylib        	    0x7ff80a2963aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80a2d0a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10e2ee9a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x10e2ef4c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x10e3858e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10f9cde16 0x10f9c8000 + 24086

Thread 19:: */console
0   libsystem_kernel.dylib        	    0x7ff80a2963aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80a2d0a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10e2ee9a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x10e2ef4c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x10e3858e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10f9cde16 0x10f9c8000 + 24086

Thread 20:: */auto_profiles
0   libsystem_kernel.dylib        	    0x7ff80a2963aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80a2d0a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10e2ee9a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x10e2ef4c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x10e3858e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10f9cde16 0x10f9c8000 + 24086

Thread 21:: worker
0   libsystem_kernel.dylib        	    0x7ff80a2963aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80a2d0a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10e2d747d worker_thread + 173
3   libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
4   libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 22:: AMCP Logging Spool
0   libsystem_kernel.dylib        	    0x7ff80a293976 semaphore_wait_trap + 10
1   caulk                         	    0x7ff812dd42e6 caulk::mach::semaphore::wait_or_error() + 16
2   caulk                         	    0x7ff812dbc148 caulk::concurrent::details::worker_thread::run() + 36
3   caulk                         	    0x7ff812dbbe0c void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*) + 41
4   libsystem_pthread.dylib       	    0x7ff80a2d04e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff80a2cbf6b thread_start + 15

Thread 23:
0   libsystem_pthread.dylib       	    0x7ff80a2cbf48 start_wqthread + 0

Thread 24:
0   libsystem_pthread.dylib       	    0x7ff80a2cbf48 start_wqthread + 0

Thread 25::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libswiftCore.dylib            	    0x7ff817a94698 _swift_getGenericMetadata(swift::MetadataRequest, void const* const*, swift::TargetTypeContextDescriptor<swift::InProcess> const*) + 600
1   libswiftCore.dylib            	    0x7ff817a6dba0 __swift_instantiateCanonicalPrespecializedGenericMetadata + 32
2   libswiftCore.dylib            	    0x7ff8177a85b7 Array.append(_:) + 279
3   RedLemon                      	       0x109e8f386 SupabaseRealtimeClient.onPresence(handler:) + 166 (SupabaseRealtimeClient.swift:249)
4   RedLemon                      	       0x109d58355 (4) suspend resume partial function for RealtimeChannelManager.setupHandlers() + 69 (RealtimeChannelManager.swift:113)
5   RedLemon                      	       0x109d564d1 (2) await resume partial function for RealtimeChannelManager.setup(roomId:isHost:userId:username:onSync:) + 1 (RealtimeChannelManager.swift:74)

Thread 26:
0   libsystem_pthread.dylib       	    0x7ff80a2cbf48 start_wqthread + 0

Thread 27:
0   libsystem_pthread.dylib       	    0x7ff80a2cbf48 start_wqthread + 0


Thread 14 crashed with X86 Thread State (64-bit):
  rax: 0x0000000000000000  rbx: 0x0000000000000000  rcx: 0x0000000000000000  rdx: 0x0000000000000000
  rdi: 0x00003fbf35a401f8  rsi: 0x0000000000000001  rbp: 0x0000700008483d90  rsp: 0x0000700008483d80
   r8: 0x80000000ffffffff   r9: 0x0000000000000003  r10: 0x00007f7e6a800000  r11: 0x0000000000000000
  r12: 0x00007ff84ba1f500  r13: 0x00007f7e68bb9920  r14: 0x00007f7e6a8cd240  r15: 0x00007f7e690ae040
  rip: 0x00007ff817a8bede  rfl: 0x0000000000010246  cr2: 0x0000000000000000
  
Logical CPU:     2
Error Code:      0x00000000 
Trap Number:     13

Thread 14 instruction stream:
  0f b1 17 74 dc 48 89 c2-48 01 ca 79 f1 83 f8 ff  ...t.H..H..y....
  74 cf 48 85 c0 78 1a 48-89 c2 4c 21 c2 48 09 f2  t.H..x.H..L!.H..
  f0 48 0f b1 17 75 de 48-83 c7 f8 5d e9 a1 f5 ff  .H...u.H...]....
  ff 48 c1 e0 03 48 89 c7-be 01 00 00 00 5d e9 0f  .H...H.......]..
  00 00 00 66 2e 0f 1f 84-00 00 00 00 00 0f 1f 44  ...f...........D
  00 00 55 48 89 e5 53 50-31 c0 31 d2 31 c9 31 db  ..UH..SP1.1.1.1.
 [f0]48 0f c7 4f 10 49 b9-ff ff ff ff 00 00 00 80  .H..O.I.........	<==
  31 c9 83 fe 01 74 0f 48-89 c3 4c 21 cb 4c 39 cb  1....t.H..L!.L9.
  0f 84 9b 00 00 00 48 89-f1 48 c1 e1 21 49 89 ca  ......H..H..!I..
  49 f7 da 48 89 c3 48 29-cb 78 2a 0f 1f 80 00 00  I..H..H).x*.....
  00 00 49 c1 e0 20 89 d1-49 09 c8 4c 89 c2 f0 48  ..I.. ..I..L...H
  0f c7 4f 10 74 69 49 89-d0 49 c1 e8 20 48 89 c3  ..O.tiI..I.. H..

Binary Images:
    0x7ff81778e000 -     0x7ff817c07fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff91670d000 -     0x7ff916743fff com.apple.AttributeGraph (3.2.1) <e9337c46-2775-39dc-ae3d-14ccf80d629f> /System/Library/PrivateFrameworks/AttributeGraph.framework/Versions/A/AttributeGraph
    0x7ff91586d000 -     0x7ff91670cfff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
    0x7ff81f298000 -     0x7ff81f299fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff80a317000 -     0x7ff80a819fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff813019000 -     0x7ff81330cfff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff80cd95000 -     0x7ff80dc24fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x1085ef000 -        0x10a532fff com.redlemon.app (1.0.14) <05f4cd17-062c-3bcd-875b-c827065cad27> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x11a1e2000 -        0x11a24dfff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff80a2ca000 -     0x7ff80a2d5fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff80a292000 -     0x7ff80a2c9fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff80ed7b000 -     0x7ff80f209fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff80b194000 -     0x7ff80b550fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff80a115000 -     0x7ff80a15bfff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ffb237a5000 -     0x7ffb237e4fff libswift_Concurrency.dylib (*) <01d2f741-2f1e-33c9-9b51-abb5c07e6914> /usr/lib/swift/libswift_Concurrency.dylib
       0x10e230000 -        0x10e4effff libmpv.2.dylib (*) <e355e4d8-dcc6-3439-90d2-abf0776cc6ac> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libmpv.2.dylib
       0x10f9c8000 -        0x10fa2ffff libluajit-5.1.2.dylib (*) <790d1386-66cf-39c0-ab74-e7b60abbd7c9> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libluajit-5.1.2.dylib
    0x7ff812dba000 -     0x7ff812ddbfff com.apple.audio.caulk (1.0) <f04b5c91-d0ec-33c6-8a81-b80a3ebf827f> /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk

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
Writable regions: Total=210.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=210.0M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               256K        2 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                            92K        8 
CG raster data                     144K       13 
ColorSync                          224K       27 
CoreAnimation                      840K       32 
CoreGraphics                        12K        2 
CoreUI image data                  968K        7 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
IOKit                             7940K        1 
Image IO                           356K        2 
Kernel Alloc Once                    8K        1 
MALLOC                           113.3M      142 
MALLOC guard page                   48K       11 
MALLOC_LARGE (reserved)            384K        1         reserved VM address space (unallocated)
OpenGL GLSL                        384K        5 
SQLite page cache                  640K       10 
STACK GUARD                       56.1M       28 
Stack                             21.7M       28 
VM_ALLOCATE                       2644K       41 
__CTF                               756        1 
__DATA                            55.3M      609 
__DATA_CONST                      33.7M      415 
__DATA_DIRTY                      1658K      204 
__FONT_DATA                          4K        1 
__GLSLBUILTINS                    5176K        1 
__LINKEDIT                       707.9M       85 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           593.1M      614 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        13.6M       40 
mapped file                      336.2M       33 
shared memory                      784K       20 
===========                     =======  ======= 
TOTAL                              2.0G     2398 
TOTAL, minus reserved VM space     2.0G     2398 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-11-27 23:49:11.00 -0500","app_version":"1.0.14","slice_uuid":"05f4cd17-062c-3bcd-875b-c827065cad27","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"5DF238BB-D70A-4AFC-9849-9512F293362B","name":"RedLemon"}
{
  "uptime" : 38000,
  "procLaunch" : "2025-11-27 23:46:45.0621 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 38577872549758,
  "coalitionID" : 764,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-11-27 23:49:08.6489 -0500",
  "incident" : "5DF238BB-D70A-4AFC-9849-9512F293362B",
  "bug_type" : "309",
  "pid" : 40739,
  "procExitAbsTime" : 38721375320711,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 36268,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 637,
  "responsibleProc" : "Electron",
  "wakeTime" : 38628,
  "sleepWakeUUID" : "638EDFA8-4CD7-43A7-8137-3585F02B06A0",
  "sip" : "enabled",
  "vmRegionInfo" : "0 is not in any region.  Bytes before following region: 4435406848\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      UNUSED SPACE AT START\n--->  \n      __TEXT                      1085ef000-10a533000    [ 31.3M] r-x\/r-x SM=COW  ...acOS\/RedLemon",
  "isCorpse" : 1,
  "exception" : {"codes":"0x000000000000000d, 0x0000000000000000","rawCodes":[13,0],"type":"EXC_BAD_ACCESS","signal":"SIGSEGV","subtype":"UNKNOWN_0xD at 0x0000000000000000"},
  "termination" : {"flags":0,"code":11,"namespace":"SIGNAL","indicator":"Segmentation fault: 11","byProc":"exc handler","byPid":40739},
  "vmregioninfo" : "0 is not in any region.  Bytes before following region: 4435406848\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      UNUSED SPACE AT START\n--->  \n      __TEXT                      1085ef000-10a533000    [ 31.3M] r-x\/r-x SM=COW  ...acOS\/RedLemon",
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 14,
  "threads" : [{"id":319829,"queue":"com.apple.main-thread","frames":[{"imageOffset":2914972,"symbol":"getEnumTag for ClosedRange<>.Index","symbolLocation":12,"imageIndex":0},{"imageOffset":80568,"symbol":"AG::LayoutDescriptor::compare(unsigned char const*, unsigned char const*, unsigned char const*, unsigned long, unsigned int)","symbolLocation":799,"imageIndex":1},{"imageOffset":143117,"symbol":"AGGraphSetOutputValue","symbolLocation":463,"imageIndex":1},{"imageOffset":2803380,"symbol":"partial apply for thunk for @callee_guaranteed (@unowned UnsafePointer<A.BodyAccessor.Body>) -> (@error @owned Error)","symbolLocation":50,"imageIndex":2},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":2799233,"symbol":"ViewBodyAccessor.updateBody(of:changed:)","symbolLocation":1485,"imageIndex":2},{"imageOffset":6657563,"symbol":"StaticBody.updateValue()","symbolLocation":165,"imageIndex":2},{"imageOffset":1282570,"symbol":"partial apply for implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":26,"imageIndex":2},{"imageOffset":22359,"symbol":"AG::Graph::UpdateStack::update()","symbolLocation":559,"imageIndex":1},{"imageOffset":23895,"symbol":"AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int)","symbolLocation":421,"imageIndex":1},{"imageOffset":66398,"symbol":"AG::Subgraph::update(unsigned int)","symbolLocation":904,"imageIndex":1},{"imageOffset":12793003,"symbol":"GraphHost.flushTransactions()","symbolLocation":495,"imageIndex":2},{"imageOffset":12796676,"symbol":"closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:)","symbolLocation":15,"imageIndex":2},{"imageOffset":2655914,"symbol":"partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":17,"imageIndex":2},{"imageOffset":11115688,"symbol":"closure #1 in ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":69,"imageIndex":2},{"imageOffset":11110623,"symbol":"ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":78,"imageIndex":2},{"imageOffset":11168976,"symbol":"protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":2},{"imageOffset":2626212,"symbol":"ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":55,"imageIndex":2},{"imageOffset":2655715,"symbol":"protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":2},{"imageOffset":12796640,"symbol":"closure #1 in GraphHost.init(data:)","symbolLocation":122,"imageIndex":2},{"imageOffset":2661948,"symbol":"thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":12,"imageIndex":2},{"imageOffset":11637339,"symbol":"partial apply for thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":17,"imageIndex":2},{"imageOffset":11627296,"symbol":"static NSRunLoop.flushObservers()","symbolLocation":118,"imageIndex":2},{"imageOffset":11637208,"symbol":"closure #1 in closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":16,"imageIndex":2},{"imageOffset":11613974,"symbol":"specialized thunk for @callee_guaranteed () -> (@error @owned Error)","symbolLocation":14,"imageIndex":2},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":3},{"imageOffset":11637184,"symbol":"closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":35,"imageIndex":2},{"imageOffset":11637253,"symbol":"@objc closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":43,"imageIndex":2},{"imageOffset":521296,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__","symbolLocation":23,"imageIndex":4},{"imageOffset":520930,"symbol":"__CFRunLoopDoObservers","symbolLocation":543,"imageIndex":4},{"imageOffset":515552,"symbol":"CFRunLoopRunSpecific","symbolLocation":678,"imageIndex":4},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":5},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":5},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":5},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":6},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":6},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":6},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":6},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":2},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":2},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":2},{"imageOffset":17498867,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":7,"symbolLocation":35},{"imageOffset":17499001,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":7},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":8}]},{"id":319835,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":319840,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":319866,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":10},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":4},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":4},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":4},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":319869,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":319890,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":10},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":4},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":4},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":4},{"imageOffset":2394468,"imageIndex":11},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":12},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":319891,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":10},{"imageOffset":15241737,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":7},{"imageOffset":15282479,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":95},{"imageOffset":15284100,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":7},{"imageOffset":15244987,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":7,"symbolLocation":395},{"imageOffset":15282216,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":312},{"imageOffset":15137526,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":230},{"imageOffset":15141727,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":7},{"imageOffset":15079971,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":7,"symbolLocation":467},{"imageOffset":15131405,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":1053},{"imageOffset":15105076,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":100},{"imageOffset":15058158,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":7,"symbolLocation":158},{"imageOffset":15071508,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":7},{"imageOffset":15025314,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":34},{"imageOffset":15025388,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":7},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":3},{"imageOffset":15025225,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":57},{"imageOffset":15054191,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":7,"symbolLocation":591},{"imageOffset":14668424,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":7,"symbolLocation":856},{"imageOffset":14670298,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":7,"symbolLocation":282},{"imageOffset":14695603,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":7},{"imageOffset":15285119,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15296239,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15296425,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":319892,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":10},{"imageOffset":15241737,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":7},{"imageOffset":15282479,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":95},{"imageOffset":15284100,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":7},{"imageOffset":15244987,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":7,"symbolLocation":395},{"imageOffset":15282216,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":312},{"imageOffset":15137526,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":230},{"imageOffset":15141727,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":7},{"imageOffset":15080162,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":7,"symbolLocation":50},{"imageOffset":15080247,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":7},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":15079850,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":7,"symbolLocation":346},{"imageOffset":15131405,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":1053},{"imageOffset":15105076,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":100},{"imageOffset":15058158,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":7,"symbolLocation":158},{"imageOffset":15071508,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":7},{"imageOffset":15025314,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":34},{"imageOffset":15025388,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":7},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":3},{"imageOffset":15025225,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":57},{"imageOffset":15054191,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":7,"symbolLocation":591},{"imageOffset":14668424,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":7,"symbolLocation":856},{"imageOffset":14670298,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":7,"symbolLocation":282},{"imageOffset":14695603,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":7},{"imageOffset":15285119,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15296239,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15296425,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":319893,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":10},{"imageOffset":15241737,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":7},{"imageOffset":15282479,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":95},{"imageOffset":15284100,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":7},{"imageOffset":15244987,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":7,"symbolLocation":395},{"imageOffset":15282216,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":312},{"imageOffset":15137526,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":230},{"imageOffset":15141727,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":7},{"imageOffset":15079971,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":7,"symbolLocation":467},{"imageOffset":15131405,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":1053},{"imageOffset":15105076,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":100},{"imageOffset":15058158,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":7,"symbolLocation":158},{"imageOffset":15071508,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":7},{"imageOffset":15025314,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":34},{"imageOffset":15025388,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":7},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":3},{"imageOffset":15025225,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":57},{"imageOffset":15054191,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":7,"symbolLocation":591},{"imageOffset":14668424,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":7,"symbolLocation":856},{"imageOffset":14670298,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":7,"symbolLocation":282},{"imageOffset":14695603,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":7},{"imageOffset":15285119,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15296239,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15296425,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":319894,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":10},{"imageOffset":15241737,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":7},{"imageOffset":15282479,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":95},{"imageOffset":15284100,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":7},{"imageOffset":15244987,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":7,"symbolLocation":395},{"imageOffset":15282216,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":312},{"imageOffset":15137526,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":230},{"imageOffset":15141727,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":7},{"imageOffset":15080162,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":7,"symbolLocation":50},{"imageOffset":15080247,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":7},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":15079850,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":7,"symbolLocation":346},{"imageOffset":15131405,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":1053},{"imageOffset":15105076,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":100},{"imageOffset":15058158,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":7,"symbolLocation":158},{"imageOffset":15071508,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":7},{"imageOffset":15025314,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":34},{"imageOffset":15025388,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":7},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":3},{"imageOffset":15025225,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":57},{"imageOffset":15054191,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":7,"symbolLocation":591},{"imageOffset":14668424,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":7,"symbolLocation":856},{"imageOffset":14670298,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":7,"symbolLocation":282},{"imageOffset":14695603,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":7},{"imageOffset":15285119,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15296239,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15296425,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":319895,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14705023,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":7,"symbolLocation":143},{"imageOffset":14708814,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":7,"symbolLocation":222},{"imageOffset":15285119,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15296239,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15296425,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":319896,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14705023,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":7,"symbolLocation":143},{"imageOffset":14708814,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":7,"symbolLocation":222},{"imageOffset":15285119,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15296239,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15296425,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":319897,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14705023,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":7,"symbolLocation":143},{"imageOffset":14708814,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":7,"symbolLocation":222},{"imageOffset":15285119,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15296239,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15296425,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":319898,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14705023,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":7,"symbolLocation":143},{"imageOffset":14708814,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":7,"symbolLocation":222},{"imageOffset":15285119,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15296239,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15296425,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"triggered":true,"id":319920,"instructionState":{"instructionStream":{"bytes":[15,177,23,116,220,72,137,194,72,1,202,121,241,131,248,255,116,207,72,133,192,120,26,72,137,194,76,33,194,72,9,242,240,72,15,177,23,117,222,72,131,199,248,93,233,161,245,255,255,72,193,224,3,72,137,199,190,1,0,0,0,93,233,15,0,0,0,102,46,15,31,132,0,0,0,0,0,15,31,68,0,0,85,72,137,229,83,80,49,192,49,210,49,201,49,219,240,72,15,199,79,16,73,185,255,255,255,255,0,0,0,128,49,201,131,254,1,116,15,72,137,195,76,33,203,76,57,203,15,132,155,0,0,0,72,137,241,72,193,225,33,73,137,202,73,247,218,72,137,195,72,41,203,120,42,15,31,128,0,0,0,0,73,193,224,32,137,209,73,9,200,76,137,194,240,72,15,199,79,16,116,105,73,137,208,73,193,232,32,72,137,195],"offset":96}},"threadState":{"r13":{"value":140180899731744},"rax":{"value":0},"rflags":{"value":66118},"cpu":{"value":2},"r14":{"value":140180930220608},"rsi":{"value":1},"r8":{"value":9223372041149743103},"cr2":{"value":0},"rdx":{"value":0},"r10":{"value":140180929380352},"r9":{"value":3},"r15":{"value":140180904927296},"rbx":{"value":0},"trap":{"value":13},"err":{"value":0},"r11":{"value":0},"rip":{"value":140703525551838,"matchesCrashFrame":1},"rbp":{"value":123145441262992},"rsp":{"value":123145441262976},"r12":{"value":140704397522176,"symbolLocation":1792,"symbol":"_dispatch_root_queues"},"rcx":{"value":0},"flavor":"x86_THREAD_STATE","rdi":{"value":70090471244280}},"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":3137246,"symbol":"bool swift::HeapObjectSideTableEntry::decrementStrong<(swift::PerformDeinit)1>(unsigned int)","symbolLocation":14,"imageIndex":0},{"imageOffset":21836270,"imageIndex":7},{"imageOffset":3134560,"symbol":"_swift_release_dealloc","symbolLocation":16,"imageIndex":0},{"imageOffset":995597,"imageIndex":7},{"imageOffset":3134560,"symbol":"_swift_release_dealloc","symbolLocation":16,"imageIndex":0},{"imageOffset":197722,"symbol":"completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*)","symbolLocation":26,"imageIndex":14},{"imageOffset":197697,"symbol":"completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*)","symbolLocation":1,"imageIndex":14}]},{"id":319921,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":320027,"name":"core","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":10},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":9},{"imageOffset":673342,"symbol":"mp_dispatch_queue_process","symbolLocation":494,"imageIndex":15},{"imageOffset":917272,"symbol":"mp_wait_events","symbolLocation":88,"imageIndex":15},{"imageOffset":930187,"symbol":"mp_idle","symbolLocation":91,"imageIndex":15},{"imageOffset":930296,"symbol":"idle_loop","symbolLocation":40,"imageIndex":15},{"imageOffset":892632,"symbol":"mp_play_files","symbolLocation":360,"imageIndex":15},{"imageOffset":782894,"symbol":"core_thread","symbolLocation":62,"imageIndex":15},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":320031,"name":"*\/ytdl_hook","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":10},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":9},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":15},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":15},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":15},{"imageOffset":24086,"imageIndex":16}]},{"id":320032,"name":"*\/stats","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":10},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":9},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":15},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":15},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":15},{"imageOffset":24086,"imageIndex":16}]},{"id":320033,"name":"*\/console","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":10},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":9},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":15},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":15},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":15},{"imageOffset":24086,"imageIndex":16}]},{"id":320034,"name":"*\/auto_profiles","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":10},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":9},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":15},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":15},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":15},{"imageOffset":24086,"imageIndex":16}]},{"id":320036,"name":"worker","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":10},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":9},{"imageOffset":685181,"symbol":"worker_thread","symbolLocation":173,"imageIndex":15},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":320076,"name":"AMCP Logging Spool","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":107238,"symbol":"caulk::mach::semaphore::wait_or_error()","symbolLocation":16,"imageIndex":17},{"imageOffset":8520,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":36,"imageIndex":17},{"imageOffset":7692,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*)","symbolLocation":41,"imageIndex":17},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":320380,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":320381,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":320947,"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":3171992,"symbol":"_swift_getGenericMetadata(swift::MetadataRequest, void const* const*, swift::TargetTypeContextDescriptor<swift::InProcess> const*)","symbolLocation":600,"imageIndex":0},{"imageOffset":3013536,"symbol":"__swift_instantiateCanonicalPrespecializedGenericMetadata","symbolLocation":32,"imageIndex":0},{"imageOffset":107959,"symbol":"Array.append(_:)","symbolLocation":279,"imageIndex":0},{"imageOffset":25822086,"sourceLine":249,"sourceFile":"SupabaseRealtimeClient.swift","symbol":"SupabaseRealtimeClient.onPresence(handler:)","imageIndex":7,"symbolLocation":166},{"imageOffset":24548181,"sourceLine":113,"sourceFile":"RealtimeChannelManager.swift","symbol":"(4) suspend resume partial function for RealtimeChannelManager.setupHandlers()","imageIndex":7,"symbolLocation":69},{"imageOffset":24540369,"sourceLine":74,"sourceFile":"RealtimeChannelManager.swift","symbol":"(2) await resume partial function for RealtimeChannelManager.setup(roomId:isHost:userId:username:onSync:)","imageIndex":7,"symbolLocation":1}]},{"id":320948,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":320949,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703522414592,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140707800076288,
    "CFBundleShortVersionString" : "3.2.1",
    "CFBundleIdentifier" : "com.apple.AttributeGraph",
    "size" : 225280,
    "uuid" : "e9337c46-2775-39dc-ae3d-14ccf80d629f",
    "path" : "\/System\/Library\/PrivateFrameworks\/AttributeGraph.framework\/Versions\/A\/AttributeGraph",
    "name" : "AttributeGraph",
    "CFBundleVersion" : "3.2.1"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140707784740864,
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
    "base" : 140703651430400,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703299629056,
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
    "base" : 140703447486464,
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
    "base" : 140703344185344,
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
    "base" : 4435406848,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 32784384,
    "uuid" : "05f4cd17-062c-3bcd-875b-c827065cad27",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4733149184,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703299313664,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703299084288,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703377633280,
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
    "base" : 140703314821120,
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
    "base" : 140703297523712,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140716608737280,
    "size" : 262144,
    "uuid" : "01d2f741-2f1e-33c9-9b51-abb5c07e6914",
    "path" : "\/usr\/lib\/swift\/libswift_Concurrency.dylib",
    "name" : "libswift_Concurrency.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4532142080,
    "size" : 2883584,
    "uuid" : "e355e4d8-dcc6-3439-90d2-abf0776cc6ac",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libmpv.2.dylib",
    "name" : "libmpv.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4556881920,
    "size" : 425984,
    "uuid" : "790d1386-66cf-39c0-ab74-e7b60abbd7c9",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libluajit-5.1.2.dylib",
    "name" : "libluajit-5.1.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703445000192,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.audio.caulk",
    "size" : 139264,
    "uuid" : "f04b5c91-d0ec-33c6-8a81-b80a3ebf827f",
    "path" : "\/System\/Library\/PrivateFrameworks\/caulk.framework\/Versions\/A\/caulk",
    "name" : "caulk"
  }
],
  "sharedCache" : {
  "base" : 140703296053248,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=210.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=210.0M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               256K        2 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                            92K        8 \nCG raster data                     144K       13 \nColorSync                          224K       27 \nCoreAnimation                      840K       32 \nCoreGraphics                        12K        2 \nCoreUI image data                  968K        7 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nIOKit                             7940K        1 \nImage IO                           356K        2 \nKernel Alloc Once                    8K        1 \nMALLOC                           113.3M      142 \nMALLOC guard page                   48K       11 \nMALLOC_LARGE (reserved)            384K        1         reserved VM address space (unallocated)\nOpenGL GLSL                        384K        5 \nSQLite page cache                  640K       10 \nSTACK GUARD                       56.1M       28 \nStack                             21.7M       28 \nVM_ALLOCATE                       2644K       41 \n__CTF                               756        1 \n__DATA                            55.3M      609 \n__DATA_CONST                      33.7M      415 \n__DATA_DIRTY                      1658K      204 \n__FONT_DATA                          4K        1 \n__GLSLBUILTINS                    5176K        1 \n__LINKEDIT                       707.9M       85 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           593.1M      614 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      336.2M       33 \nshared memory                      784K       20 \n===========                     =======  ======= \nTOTAL                              2.0G     2398 \nTOTAL, minus reserved VM space     2.0G     2398 \n",
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
