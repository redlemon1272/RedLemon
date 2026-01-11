-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [26799]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.59 (59)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [26685]
Responsible:           Electron [482]
User ID:               501

Date/Time:             2026-01-11 14:53:43.8332 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA


Time Awake Since Boot: 7900 seconds

System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 4 Illegal instruction: 4
Terminating Process:   exc handler [26799]

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   libswiftCore.dylib            	    0x7ff819c36ff8 closure #1 in closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:) + 456
1   libswiftCore.dylib            	    0x7ff819c36d0b closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:) + 267
2   libswiftCore.dylib            	    0x7ff819c36afd closure #1 in _assertionFailure(_:_:file:line:flags:) + 333
3   libswiftCore.dylib            	    0x7ff819c36675 _assertionFailure(_:_:file:line:flags:) + 309
4   libswiftCore.dylib            	    0x7ff819c1650d _ArrayBuffer._checkInoutAndNativeTypeCheckedBounds(_:wasNativeTypeChecked:) + 253
5   libswiftCore.dylib            	    0x7ff819c19cde Array.subscript.getter + 78
6   RedLemon                      	       0x101f3096e closure #1 in AppOnboardingView.body.getter + 1166 (AppOnboardingView.swift:78)
7   RedLemon                      	       0x101f3113d partial apply for closure #1 in AppOnboardingView.body.getter + 13
8   SwiftUI                       	    0x7ff91892c4c8 ZStack.init(alignment:content:) + 152
9   RedLemon                      	       0x101f303b2 AppOnboardingView.body.getter + 978 (AppOnboardingView.swift:71)
10  RedLemon                      	       0x101f4c347 protocol witness for View.body.getter in conformance AppOnboardingView + 55
11  SwiftUI                       	    0x7ff917f8e6f8 partial apply for closure #1 in ViewBodyAccessor.updateBody(of:changed:) + 22
12  SwiftUI                       	    0x7ff91833c46a closure #1 in BodyAccessor.setBody(_:) + 34
13  SwiftUI                       	    0x7ff917f8e60f ViewBodyAccessor.updateBody(of:changed:) + 1371
14  SwiftUI                       	    0x7ff91833ca9b DynamicBody.updateValue() + 479
15  SwiftUI                       	    0x7ff917e1c20a partial apply for implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 26
16  AttributeGraph                	    0x7ff918b88757 AG::Graph::UpdateStack::update() + 559
17  AttributeGraph                	    0x7ff918b88d57 AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421
18  AttributeGraph                	    0x7ff918b9335e AG::Subgraph::update(unsigned int) + 904
19  SwiftUI                       	    0x7ff9189164ab GraphHost.flushTransactions() + 495
20  SwiftUI                       	    0x7ff918917304 closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:) + 15
21  SwiftUI                       	    0x7ff917f6b6aa partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:) + 17
22  SwiftUI                       	    0x7ff91877cca8 closure #1 in ViewRendererHost.updateViewGraph<A>(body:) + 69
23  SwiftUI                       	    0x7ff91877b8df ViewRendererHost.updateViewGraph<A>(body:) + 78
24  SwiftUI                       	    0x7ff918789cd0 protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1> + 25
25  SwiftUI                       	    0x7ff917f642a4 ViewGraphDelegate.updateGraph<A>(body:) + 55
26  SwiftUI                       	    0x7ff917f6b5e3 protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1> + 25
27  SwiftUI                       	    0x7ff9189172e0 closure #1 in GraphHost.init(data:) + 122
28  SwiftUI                       	    0x7ff91891814e partial apply for closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:) + 19
29  SwiftUI                       	    0x7ff917f6ce3c thunk for @escaping @callee_guaranteed () -> () + 12
30  SwiftUI                       	    0x7ff9187fc25b partial apply for thunk for @escaping @callee_guaranteed () -> () + 17
31  SwiftUI                       	    0x7ff9187f9b20 static NSRunLoop.flushObservers() + 118
32  SwiftUI                       	    0x7ff9187fc1d8 closure #1 in closure #1 in static NSRunLoop.addObserver(_:) + 16
33  SwiftUI                       	    0x7ff9187f6716 specialized thunk for @callee_guaranteed () -> (@error @owned Error) + 14
34  libswiftObjectiveC.dylib      	    0x7ff82170ee7c autoreleasepool<A>(invoking:) + 44
35  SwiftUI                       	    0x7ff9187fc1c0 closure #1 in static NSRunLoop.addObserver(_:) + 35
36  SwiftUI                       	    0x7ff9187fc205 @objc closure #1 in static NSRunLoop.addObserver(_:) + 43
37  CoreFoundation                	    0x7ff80c80c450 __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
38  CoreFoundation                	    0x7ff80c80c2e2 __CFRunLoopDoObservers + 543
39  CoreFoundation                	    0x7ff80c80ade0 CFRunLoopRunSpecific + 678
40  HIToolbox                     	    0x7ff8154bd5e6 RunCurrentEventLoopInMode + 292
41  HIToolbox                     	    0x7ff8154bd213 ReceiveNextEventCommon + 283
42  HIToolbox                     	    0x7ff8154bd0e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
43  AppKit                        	    0x7ff80f249aa9 _DPSNextEvent + 927
44  AppKit                        	    0x7ff80f248166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
45  AppKit                        	    0x7ff80f23a818 -[NSApplication run] + 586
46  AppKit                        	    0x7ff80f20e79a NSApplicationMain + 817
47  SwiftUI                       	    0x7ff917d5f09c specialized runApp(_:) + 161
48  SwiftUI                       	    0x7ff9187c1424 runApp<A>(_:) + 164
49  SwiftUI                       	    0x7ff9182b9c5f static App.main() + 63
50  RedLemon                      	       0x101f7c7c3 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
51  RedLemon                      	       0x101f7c849 RedLemon_main + 9
52  dyld                          	       0x10f68052e start + 462

Thread 1:
0   libsystem_pthread.dylib       	    0x7ff80c741f48 start_wqthread + 0

Thread 2:
0   libsystem_pthread.dylib       	    0x7ff80c741f48 start_wqthread + 0

Thread 3:
0   libsystem_pthread.dylib       	    0x7ff80c741f48 start_wqthread + 0

Thread 4:
0   libsystem_pthread.dylib       	    0x7ff80c741f48 start_wqthread + 0

Thread 5:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff80c70993a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80c709ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80c80d29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80c80b928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80c80ad6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff80f3b7572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff80c70e30e kevent + 10
1   RedLemon                      	       0x101d09209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x101d1312f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x101d13784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x101d09ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x101d13028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x101cefaf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x101cf0b5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x101ce1a23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x101cee30d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x101ce7c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x101cdc4ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x101cdf914 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x101cd44a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x101cd44ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82170ee7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x101cd4449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x101cdb56f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x101c7d288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x101c7d9da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x101c83cb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x101d13b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x101d166ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x101d167a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15

Thread 7:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff80c70e30e kevent + 10
1   RedLemon                      	       0x101d09209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x101d1312f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x101d13784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x101d09ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x101d13028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x101cefaf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x101cf0b5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x101ce1a23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x101cee30d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x101ce7c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x101cdc4ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x101cdf914 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x101cd44a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x101cd44ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82170ee7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x101cd4449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x101cdb56f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x101c7d288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x101c7d9da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x101c83cb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x101d13b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x101d166ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x101d167a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15

Thread 8:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff80c70e30e kevent + 10
1   RedLemon                      	       0x101d09209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x101d1312f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x101d13784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x101d09ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x101d13028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x101cefaf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x101cf0b5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x101ce1a23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x101cee30d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x101ce7c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x101cdc4ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x101cdf914 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x101cd44a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x101cd44ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82170ee7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x101cd4449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x101cdb56f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x101c7d288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x101c7d9da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x101c83cb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x101d13b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x101d166ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x101d167a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15

Thread 9:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff80c70e30e kevent + 10
1   RedLemon                      	       0x101d09209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x101d1312f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x101d13784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x101d09ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x101d13028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x101cefaf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x101cf0b5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x101ce1a23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x101cee30d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x101ce7c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x101cdc4ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x101cdf914 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x101cd44a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x101cd44ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82170ee7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x101cd4449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x101cdb56f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x101c7d288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x101c7d9da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x101c83cb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x101d13b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x101d166ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x101d167a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15

Thread 10:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff80c709976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c58e7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c58ec9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x101c8617f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x101c8704e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x101d13b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x101d166ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x101d167a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15

Thread 11:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff80c709976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c58e7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c58ec9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x101c8617f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x101c8704e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x101d13b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x101d166ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x101d167a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15

Thread 12:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff80c709976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c58e7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c58ec9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x101c8617f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x101c8704e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x101d13b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x101d166ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x101d167a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15

Thread 13:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff80c709976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c58e7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c58ec9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x101c8617f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x101c8704e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x101d13b7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x101d166ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x101d167a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15

Thread 14:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff80c70993a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80c709ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80c80d29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80c80b928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80c80ad6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff811439964 0x7ff8111f1000 + 2394468
6   Foundation                    	    0x7ff80d662724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15

Thread 15:: CVDisplayLink
0   libsystem_kernel.dylib        	    0x7ff80c70c3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff80c746aa4 _pthread_cond_wait + 1302
2   CoreVideo                     	    0x7ff813fede60 CVDisplayLink::waitUntil(unsigned long long) + 370
3   CoreVideo                     	    0x7ff813fecddc CVDisplayLink::runIOThread() + 526
4   libsystem_pthread.dylib       	    0x7ff80c7464e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff80c741f6b thread_start + 15


Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x0000000000000103  rbx: 0x0000000000000001  rcx: 0x0000000000000000  rdx: 0x0000000000116920
  rdi: 0x0000000108390080  rsi: 0x00000000e35c034a  rbp: 0x00007ff7bf073770  rsp: 0x00007ff7bf073760
   r8: 0x000000000000d4db   r9: 0x0000000000000005  r10: 0x00007f8030100000  r11: 0x00007f80301c9a20
  r12: 0x0000000000000002  r13: 0x0000000000000001  r14: 0x000000000000023f  r15: 0x0000000000000001
  rip: 0x00007ff819c36ff8  rfl: 0x0000000000010206  cr2: 0x0000000000000000
  
Logical CPU:     0
Error Code:      0x00000000 
Trap Number:     6

Thread 0 instruction stream:
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
    0x7ff819c04000 -     0x7ff81a07dfff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
       0x100e82000 -        0x1037fdfff com.redlemon.app (1.0.59) <299dc480-4956-3e49-8a33-960c24323cab> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
    0x7ff917ce3000 -     0x7ff918b82fff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
    0x7ff918b83000 -     0x7ff918bb9fff com.apple.AttributeGraph (3.2.1) <e9337c46-2775-39dc-ae3d-14ccf80d629f> /System/Library/PrivateFrameworks/AttributeGraph.framework/Versions/A/AttributeGraph
    0x7ff82170e000 -     0x7ff82170ffff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff80c78d000 -     0x7ff80cc8ffff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff81548f000 -     0x7ff815782fff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff80f20b000 -     0x7ff81009afff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x10f67b000 -        0x10f6e6fff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff80c740000 -     0x7ff80c74bfff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff80c708000 -     0x7ff80c73ffff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff80c58b000 -     0x7ff80c5d1fff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff8111f1000 -     0x7ff81167ffff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff80d60a000 -     0x7ff80d9c6fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff813feb000 -     0x7ff81403cfff com.apple.CoreVideo (1.8) <fe89c8c7-c939-3115-afdb-7a6190835819> /System/Library/Frameworks/CoreVideo.framework/Versions/A/CoreVideo

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
Writable regions: Total=161.9M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=161.9M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               256K        2 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                           280K        8 
CG raster data                     348K       15 
ColorSync                          220K       26 
CoreAnimation                     1904K       57 
CoreGraphics                        12K        2 
CoreUI image data                 1916K       14 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
IOKit                             7940K        1 
Image IO                          2200K        3 
Kernel Alloc Once                    8K        1 
MALLOC                            68.4M       84 
MALLOC guard page                   48K        8 
SQLite page cache                  320K        5 
STACK GUARD                       56.1M       16 
Stack                             15.6M       16 
VM_ALLOCATE                       3116K       10 
__CTF                               756        1 
__DATA                            55.1M      602 
__DATA_CONST                      33.3M      406 
__DATA_DIRTY                      1651K      202 
__FONT_DATA                          4K        1 
__LINKEDIT                       729.5M       83 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           592.9M      605 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        13.6M       40 
mapped file                      165.5M       32 
shared memory                     2840K       22 
===========                     =======  ======= 
TOTAL                              1.8G     2276 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2026-01-11 14:54:05.00 -0500","app_version":"1.0.59","slice_uuid":"299dc480-4956-3e49-8a33-960c24323cab","build_version":"59","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"5AA4F1C6-32BD-423A-BA41-6A0BC0622EE7","name":"RedLemon"}
{
  "uptime" : 7900,
  "procLaunch" : "2026-01-11 14:53:26.1122 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 7956876233625,
  "coalitionID" : 562,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2026-01-11 14:53:43.8332 -0500",
  "incident" : "5AA4F1C6-32BD-423A-BA41-6A0BC0622EE7",
  "bug_type" : "309",
  "pid" : 26799,
  "procExitAbsTime" : 7974474836663,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.59","CFBundleVersion":"59","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 26685,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 482,
  "responsibleProc" : "Electron",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_INSTRUCTION","signal":"SIGILL"},
  "termination" : {"flags":0,"code":4,"namespace":"SIGNAL","indicator":"Illegal instruction: 4","byProc":"exc handler","byPid":26799},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 0,
  "threads" : [{"triggered":true,"id":139057,"instructionState":{"instructionStream":{"bytes":[141,5,42,11,66,0,72,141,61,103,159,65,0,72,141,13,124,162,65,0,190,11,0,0,0,65,184,57,0,0,0,186,2,0,0,0,65,185,2,0,0,0,106,1,106,94,233,251,254,255,255,77,133,210,121,74,72,190,255,255,255,127,255,255,255,255,73,57,242,127,68,72,131,236,8,72,141,5,110,159,65,0,72,141,61,27,159,65,0,72,141,13,128,159,65,0,190,11,0,0,0,65,184,43,0,0,0,186,2,0,0,0,65,185,2,0,0,0,106,1,104,230,13,0,0,233,14,255,255,255,73,57,242,15,131,207,254,255,255,76,139,93,16,76,137,222,72,193,238,32,117,34,139,93,24,72,137,215,137,206,76,137,194,68,137,201,73,137,192,69,137,209,83,65,83,232,124,38,54,0,72,131,196,16,15,11,72,131,236,8,72,141],"offset":184}},"threadState":{"r13":{"value":1},"rax":{"value":259},"rflags":{"value":66054},"cpu":{"value":0},"r14":{"value":575},"rsi":{"value":3814458186},"r8":{"value":54491},"cr2":{"value":0},"rdx":{"value":1141024},"r10":{"value":140188538896384},"r9":{"value":5},"r15":{"value":1},"rbx":{"value":1},"trap":{"value":6},"err":{"value":0},"r11":{"value":140188539722272},"rip":{"value":140703560855544,"matchesCrashFrame":1},"rbp":{"value":140702038570864},"rsp":{"value":140702038570848},"r12":{"value":2},"rcx":{"value":0},"flavor":"x86_THREAD_STATE","rdi":{"value":4432920704}},"queue":"com.apple.main-thread","frames":[{"imageOffset":208888,"symbol":"closure #1 in closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":456,"imageIndex":0},{"imageOffset":208139,"symbol":"closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":267,"imageIndex":0},{"imageOffset":207613,"symbol":"closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":333,"imageIndex":0},{"imageOffset":206453,"symbol":"_assertionFailure(_:_:file:line:flags:)","symbolLocation":309,"imageIndex":0},{"imageOffset":75021,"symbol":"_ArrayBuffer._checkInoutAndNativeTypeCheckedBounds(_:wasNativeTypeChecked:)","symbolLocation":253,"imageIndex":0},{"imageOffset":89310,"symbol":"Array.subscript.getter","symbolLocation":78,"imageIndex":0},{"imageOffset":17492334,"sourceLine":78,"sourceFile":"AppOnboardingView.swift","symbol":"closure #1 in AppOnboardingView.body.getter","imageIndex":1,"symbolLocation":1166},{"imageOffset":17494333,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in AppOnboardingView.body.getter","symbolLocation":13,"imageIndex":1},{"imageOffset":12883144,"symbol":"ZStack.init(alignment:content:)","symbolLocation":152,"imageIndex":2},{"imageOffset":17490866,"sourceLine":71,"sourceFile":"AppOnboardingView.swift","symbol":"AppOnboardingView.body.getter","imageIndex":1,"symbolLocation":978},{"imageOffset":17605447,"sourceFile":"<compiler-generated>","symbol":"protocol witness for View.body.getter in conformance AppOnboardingView","symbolLocation":55,"imageIndex":1},{"imageOffset":2799352,"symbol":"partial apply for closure #1 in ViewBodyAccessor.updateBody(of:changed:)","symbolLocation":22,"imageIndex":2},{"imageOffset":6657130,"symbol":"closure #1 in BodyAccessor.setBody(_:)","symbolLocation":34,"imageIndex":2},{"imageOffset":2799119,"symbol":"ViewBodyAccessor.updateBody(of:changed:)","symbolLocation":1371,"imageIndex":2},{"imageOffset":6658715,"symbol":"DynamicBody.updateValue()","symbolLocation":479,"imageIndex":2},{"imageOffset":1282570,"symbol":"partial apply for implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":26,"imageIndex":2},{"imageOffset":22359,"symbol":"AG::Graph::UpdateStack::update()","symbolLocation":559,"imageIndex":3},{"imageOffset":23895,"symbol":"AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int)","symbolLocation":421,"imageIndex":3},{"imageOffset":66398,"symbol":"AG::Subgraph::update(unsigned int)","symbolLocation":904,"imageIndex":3},{"imageOffset":12793003,"symbol":"GraphHost.flushTransactions()","symbolLocation":495,"imageIndex":2},{"imageOffset":12796676,"symbol":"closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:)","symbolLocation":15,"imageIndex":2},{"imageOffset":2655914,"symbol":"partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":17,"imageIndex":2},{"imageOffset":11115688,"symbol":"closure #1 in ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":69,"imageIndex":2},{"imageOffset":11110623,"symbol":"ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":78,"imageIndex":2},{"imageOffset":11168976,"symbol":"protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":2},{"imageOffset":2626212,"symbol":"ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":55,"imageIndex":2},{"imageOffset":2655715,"symbol":"protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":2},{"imageOffset":12796640,"symbol":"closure #1 in GraphHost.init(data:)","symbolLocation":122,"imageIndex":2},{"imageOffset":12800334,"symbol":"partial apply for closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:)","symbolLocation":19,"imageIndex":2},{"imageOffset":2661948,"symbol":"thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":12,"imageIndex":2},{"imageOffset":11637339,"symbol":"partial apply for thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":17,"imageIndex":2},{"imageOffset":11627296,"symbol":"static NSRunLoop.flushObservers()","symbolLocation":118,"imageIndex":2},{"imageOffset":11637208,"symbol":"closure #1 in closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":16,"imageIndex":2},{"imageOffset":11613974,"symbol":"specialized thunk for @callee_guaranteed () -> (@error @owned Error)","symbolLocation":14,"imageIndex":2},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":4},{"imageOffset":11637184,"symbol":"closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":35,"imageIndex":2},{"imageOffset":11637253,"symbol":"@objc closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":43,"imageIndex":2},{"imageOffset":521296,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__","symbolLocation":23,"imageIndex":5},{"imageOffset":520930,"symbol":"__CFRunLoopDoObservers","symbolLocation":543,"imageIndex":5},{"imageOffset":515552,"symbol":"CFRunLoopRunSpecific","symbolLocation":678,"imageIndex":5},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":6},{"imageOffset":188947,"symbol":"ReceiveNextEventCommon","symbolLocation":283,"imageIndex":6},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":6},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":7},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":7},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":7},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":7},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":2},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":2},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":2},{"imageOffset":17803203,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":1,"symbolLocation":35},{"imageOffset":17803337,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":1},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":8}]},{"id":139062,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":139063,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":139064,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":139080,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":139089,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":10},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":5},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":5},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":5},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":139100,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":10},{"imageOffset":15233545,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":1},{"imageOffset":15274287,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":95},{"imageOffset":15275908,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":1},{"imageOffset":15236795,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":1,"symbolLocation":395},{"imageOffset":15274024,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":312},{"imageOffset":15129334,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":230},{"imageOffset":15133535,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":1},{"imageOffset":15071779,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":1,"symbolLocation":467},{"imageOffset":15123213,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":1053},{"imageOffset":15096884,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":100},{"imageOffset":15049966,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":1,"symbolLocation":158},{"imageOffset":15063316,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":1},{"imageOffset":15017122,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":34},{"imageOffset":15017196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":1},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":4},{"imageOffset":15017033,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":57},{"imageOffset":15045999,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":1,"symbolLocation":591},{"imageOffset":14660232,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":1,"symbolLocation":856},{"imageOffset":14662106,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":1,"symbolLocation":282},{"imageOffset":14687411,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":1},{"imageOffset":15276927,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288047,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288233,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":139101,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":10},{"imageOffset":15233545,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":1},{"imageOffset":15274287,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":95},{"imageOffset":15275908,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":1},{"imageOffset":15236795,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":1,"symbolLocation":395},{"imageOffset":15274024,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":312},{"imageOffset":15129334,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":230},{"imageOffset":15133535,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":1},{"imageOffset":15071779,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":1,"symbolLocation":467},{"imageOffset":15123213,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":1053},{"imageOffset":15096884,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":100},{"imageOffset":15049966,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":1,"symbolLocation":158},{"imageOffset":15063316,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":1},{"imageOffset":15017122,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":34},{"imageOffset":15017196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":1},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":4},{"imageOffset":15017033,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":57},{"imageOffset":15045999,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":1,"symbolLocation":591},{"imageOffset":14660232,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":1,"symbolLocation":856},{"imageOffset":14662106,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":1,"symbolLocation":282},{"imageOffset":14687411,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":1},{"imageOffset":15276927,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288047,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288233,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":139102,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":10},{"imageOffset":15233545,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":1},{"imageOffset":15274287,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":95},{"imageOffset":15275908,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":1},{"imageOffset":15236795,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":1,"symbolLocation":395},{"imageOffset":15274024,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":312},{"imageOffset":15129334,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":230},{"imageOffset":15133535,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":1},{"imageOffset":15071779,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":1,"symbolLocation":467},{"imageOffset":15123213,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":1053},{"imageOffset":15096884,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":100},{"imageOffset":15049966,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":1,"symbolLocation":158},{"imageOffset":15063316,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":1},{"imageOffset":15017122,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":34},{"imageOffset":15017196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":1},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":4},{"imageOffset":15017033,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":57},{"imageOffset":15045999,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":1,"symbolLocation":591},{"imageOffset":14660232,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":1,"symbolLocation":856},{"imageOffset":14662106,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":1,"symbolLocation":282},{"imageOffset":14687411,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":1},{"imageOffset":15276927,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288047,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288233,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":139103,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":10},{"imageOffset":15233545,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":1},{"imageOffset":15274287,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":95},{"imageOffset":15275908,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":1},{"imageOffset":15236795,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":1,"symbolLocation":395},{"imageOffset":15274024,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":312},{"imageOffset":15129334,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":230},{"imageOffset":15133535,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":1},{"imageOffset":15071779,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":1,"symbolLocation":467},{"imageOffset":15123213,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":1053},{"imageOffset":15096884,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":100},{"imageOffset":15049966,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":1,"symbolLocation":158},{"imageOffset":15063316,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":1},{"imageOffset":15017122,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":34},{"imageOffset":15017196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":1},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":4},{"imageOffset":15017033,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":57},{"imageOffset":15045999,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":1,"symbolLocation":591},{"imageOffset":14660232,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":1,"symbolLocation":856},{"imageOffset":14662106,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":1,"symbolLocation":282},{"imageOffset":14687411,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":1},{"imageOffset":15276927,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288047,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288233,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":139104,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":11},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":11},{"imageOffset":14696831,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":1,"symbolLocation":143},{"imageOffset":14700622,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":1,"symbolLocation":222},{"imageOffset":15276927,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288047,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288233,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":139105,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":11},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":11},{"imageOffset":14696831,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":1,"symbolLocation":143},{"imageOffset":14700622,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":1,"symbolLocation":222},{"imageOffset":15276927,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288047,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288233,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":139106,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":11},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":11},{"imageOffset":14696831,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":1,"symbolLocation":143},{"imageOffset":14700622,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":1,"symbolLocation":222},{"imageOffset":15276927,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288047,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288233,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":139107,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":11},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":11},{"imageOffset":14696831,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":1,"symbolLocation":143},{"imageOffset":14700622,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":1,"symbolLocation":222},{"imageOffset":15276927,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288047,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288233,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":139174,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":10},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":10},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":5},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":5},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":5},{"imageOffset":2394468,"imageIndex":12},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":139295,"name":"CVDisplayLink","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":10},{"imageOffset":27300,"symbol":"_pthread_cond_wait","symbolLocation":1302,"imageIndex":9},{"imageOffset":11872,"symbol":"CVDisplayLink::waitUntil(unsigned long long)","symbolLocation":370,"imageIndex":14},{"imageOffset":7644,"symbol":"CVDisplayLink::runIOThread()","symbolLocation":526,"imageIndex":14},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703560646656,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4310179840,
    "CFBundleShortVersionString" : "1.0.59",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 43499520,
    "uuid" : "299dc480-4956-3e49-8a33-960c24323cab",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "59"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140707822972928,
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
    "base" : 140707838308352,
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
    "base" : 140703689662464,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703337861120,
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
    "base" : 140703485718528,
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
    "base" : 140703382417408,
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
    "base" : 4553420800,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703337545728,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703337316352,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703335755776,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703415865344,
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
    "base" : 140703353053184,
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
    "base" : 140703464075264,
    "CFBundleShortVersionString" : "1.8",
    "CFBundleIdentifier" : "com.apple.CoreVideo",
    "size" : 335872,
    "uuid" : "fe89c8c7-c939-3115-afdb-7a6190835819",
    "path" : "\/System\/Library\/Frameworks\/CoreVideo.framework\/Versions\/A\/CoreVideo",
    "name" : "CoreVideo",
    "CFBundleVersion" : "480.1"
  }
],
  "sharedCache" : {
  "base" : 140703334285312,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=161.9M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=161.9M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               256K        2 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                           280K        8 \nCG raster data                     348K       15 \nColorSync                          220K       26 \nCoreAnimation                     1904K       57 \nCoreGraphics                        12K        2 \nCoreUI image data                 1916K       14 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nIOKit                             7940K        1 \nImage IO                          2200K        3 \nKernel Alloc Once                    8K        1 \nMALLOC                            68.4M       84 \nMALLOC guard page                   48K        8 \nSQLite page cache                  320K        5 \nSTACK GUARD                       56.1M       16 \nStack                             15.6M       16 \nVM_ALLOCATE                       3116K       10 \n__CTF                               756        1 \n__DATA                            55.1M      602 \n__DATA_CONST                      33.3M      406 \n__DATA_DIRTY                      1651K      202 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       729.5M       83 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           592.9M      605 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      165.5M       32 \nshared memory                     2840K       22 \n===========                     =======  ======= \nTOTAL                              1.8G     2276 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.main-thread"
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







