-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [37094]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        launchd [1]
User ID:               501

Date/Time:             2025-11-14 16:24:29.4150 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        59D33877-5D0F-40BA-A3D6-C74ED52CF1F9


Time Awake Since Boot: 27000 seconds

System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 4 Illegal instruction: 4
Terminating Process:   exc handler [37094]

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   SwiftUI                       	    0x7ff92595ff26 validateDimension #1 (min:ideal:max:) in NSView.intrinsicLayoutTraits() + 224
1   SwiftUI                       	    0x7ff92595f398 NSView.intrinsicLayoutTraits() + 99
2   SwiftUI                       	    0x7ff92595f283 PlatformViewHost.updateLayoutTraits() + 266
3   SwiftUI                       	    0x7ff925a45dea closure #1 in ViewLeafView.layoutTraits() + 146
4   SwiftUI                       	    0x7ff925a45d45 ViewLeafView.layoutTraits() + 43
5   SwiftUI                       	    0x7ff925a45bf9 closure #1 in ViewLeafView.sizeThatFits(in:) + 143
6   SwiftUI                       	    0x7ff925a45a85 ViewLeafView.sizeThatFits(in:) + 185
7   SwiftUI                       	    0x7ff92532d6a8 closure #1 in LeafLayoutEngine.sizeThatFits(_:) + 55
8   SwiftUI                       	    0x7ff92532d582 LeafLayoutEngine.sizeThatFits(_:) + 411
9   SwiftUI                       	    0x7ff9254e4073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
10  SwiftUI                       	    0x7ff9254ee67f AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:) + 53
11  SwiftUI                       	    0x7ff9254ee7b6 protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine + 47
12  SwiftUI                       	    0x7ff9254e4073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
13  SwiftUI                       	    0x7ff9254ee67f AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:) + 53
14  SwiftUI                       	    0x7ff9254ee7b6 protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine + 47
15  SwiftUI                       	    0x7ff9254e4073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
16  SwiftUI                       	    0x7ff9254e3ca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
17  SwiftUI                       	    0x7ff925c6baf1 StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 1634
18  SwiftUI                       	    0x7ff925c6b16f specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130
19  SwiftUI                       	    0x7ff925c6c619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
20  SwiftUI                       	    0x7ff925c69fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
21  SwiftUI                       	    0x7ff925c6937f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
22  SwiftUI                       	    0x7ff925c691d4 StackLayout.Storage.sizeThatFits(_:) + 124
23  SwiftUI                       	    0x7ff9254e3ca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
24  SwiftUI                       	    0x7ff925c6baf1 StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 1634
25  SwiftUI                       	    0x7ff925c6b16f specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130
26  SwiftUI                       	    0x7ff925c6c619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
27  SwiftUI                       	    0x7ff925c69fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
28  SwiftUI                       	    0x7ff925c6937f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
29  SwiftUI                       	    0x7ff925c691d4 StackLayout.Storage.sizeThatFits(_:) + 124
30  SwiftUI                       	    0x7ff9254e1218 _FlexFrameLayout.sizeThatFits(in:context:child:) + 501
31  SwiftUI                       	    0x7ff9254e16d8 protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout + 46
32  SwiftUI                       	    0x7ff92589568a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
33  SwiftUI                       	    0x7ff925895556 UnaryLayoutEngine.sizeThatFits(_:) + 512
34  SwiftUI                       	    0x7ff9254e4073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
35  SwiftUI                       	    0x7ff9254e3ca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
36  SwiftUI                       	    0x7ff925c6b82b StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 924
37  SwiftUI                       	    0x7ff925c6b16f specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130
38  SwiftUI                       	    0x7ff925c6c619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
39  SwiftUI                       	    0x7ff925c69fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
40  SwiftUI                       	    0x7ff925c6937f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
41  SwiftUI                       	    0x7ff925c691d4 StackLayout.Storage.sizeThatFits(_:) + 124
42  SwiftUI                       	    0x7ff925c6a7f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
43  SwiftUI                       	    0x7ff925c6b3e2 specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 757
44  SwiftUI                       	    0x7ff925c6c619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
45  SwiftUI                       	    0x7ff925c69fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
46  SwiftUI                       	    0x7ff925c6937f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
47  SwiftUI                       	    0x7ff925c691d4 StackLayout.Storage.sizeThatFits(_:) + 124
48  SwiftUI                       	    0x7ff9254e1218 _FlexFrameLayout.sizeThatFits(in:context:child:) + 501
49  SwiftUI                       	    0x7ff9254e16d8 protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout + 46
50  SwiftUI                       	    0x7ff92589568a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
51  SwiftUI                       	    0x7ff925895556 UnaryLayoutEngine.sizeThatFits(_:) + 512
52  SwiftUI                       	    0x7ff9254e4073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
53  SwiftUI                       	    0x7ff9252800f6 ViewGraph.sizeThatFits(_:) + 256
54  SwiftUI                       	    0x7ff925a9eca3 closure #1 in ViewRendererHost.sizeThatFits(_:) + 47
55  SwiftUI                       	    0x7ff925aa7fb0 partial apply for closure #1 in ViewRendererHost.sizeThatFits(_:) + 43
56  SwiftUI                       	    0x7ff925a98ca8 closure #1 in ViewRendererHost.updateViewGraph<A>(body:) + 69
57  SwiftUI                       	    0x7ff925a978df ViewRendererHost.updateViewGraph<A>(body:) + 78
58  SwiftUI                       	    0x7ff925aa5cd0 protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1> + 25
59  SwiftUI                       	    0x7ff925a889a1 ViewRendererHost.sizeThatFits(_:) + 97
60  SwiftUI                       	    0x7ff925ae1456 NSHostingView.minSize() + 114
61  SwiftUI                       	    0x7ff925ae74d5 NSHostingView.SizeConstraints.update(from:) + 309
62  SwiftUI                       	    0x7ff925ae8103 NSHostingView._willUpdateConstraintsForSubtree() + 240
63  SwiftUI                       	    0x7ff925ae8264 @objc NSHostingView._willUpdateConstraintsForSubtree() + 21
64  AppKit                        	    0x7ff81c60848d -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 73
65  AppKit                        	    0x7ff81c6085ee -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426
66  AppKit                        	    0x7ff81c6085ee -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426
67  AppKit                        	    0x7ff81c6085ee -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426
68  AppKit                        	    0x7ff81c6175fa __82-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]_block_invoke + 269
69  CoreAutoLayout                	    0x7ff8211eacf3 -[NSISEngine withBehaviors:performModifications:] + 84
70  AppKit                        	    0x7ff81c60850a -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 198
71  AppKit                        	    0x7ff81c6085ee -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426
72  AppKit                        	    0x7ff81c6085ee -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426
73  AppKit                        	    0x7ff81c608351 __45-[NSView updateConstraintsForSubtreeIfNeeded]_block_invoke + 48
74  AppKit                        	    0x7ff81c608122 -[NSView updateConstraintsForSubtreeIfNeeded] + 229
75  AppKit                        	    0x7ff81c630f7e __62-[NSWindow(NSConstraintBasedLayout) updateConstraintsIfNeeded]_block_invoke + 134
76  AppKit                        	    0x7ff81c630ea2 -[NSWindow(NSConstraintBasedLayout) updateConstraintsIfNeeded] + 253
77  AppKit                        	    0x7ff81c630ce5 __NSWindowGetDisplayCycleObserverForUpdateConstraints_block_invoke + 430
78  AppKit                        	    0x7ff81c630af7 NSDisplayCycleObserverInvoke + 155
79  AppKit                        	    0x7ff81c630684 NSDisplayCycleFlush + 921
80  QuartzCore                    	    0x7ff820bddbea CA::Transaction::run_commit_handlers(CATransactionPhase) + 98
81  QuartzCore                    	    0x7ff820bdc8f8 CA::Transaction::commit() + 376
82  AppKit                        	    0x7ff81c6d1d71 __62+[CATransaction(NSCATransaction) NS_setFlushesWithDisplayLink]_block_invoke + 285
83  AppKit                        	    0x7ff81ce19d3c ___NSRunLoopObserverCreateWithHandler_block_invoke + 41
84  CoreFoundation                	    0x7ff819b28450 __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
85  CoreFoundation                	    0x7ff819b282e2 __CFRunLoopDoObservers + 543
86  CoreFoundation                	    0x7ff819b27774 __CFRunLoopRun + 840
87  CoreFoundation                	    0x7ff819b26d6c CFRunLoopRunSpecific + 562
88  HIToolbox                     	    0x7ff8227d95e6 RunCurrentEventLoopInMode + 292
89  HIToolbox                     	    0x7ff8227d9213 ReceiveNextEventCommon + 283
90  HIToolbox                     	    0x7ff8227d90e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
91  AppKit                        	    0x7ff81c565aa9 _DPSNextEvent + 927
92  AppKit                        	    0x7ff81c564166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
93  AppKit                        	    0x7ff81c556818 -[NSApplication run] + 586
94  AppKit                        	    0x7ff81c52a79a NSApplicationMain + 817
95  SwiftUI                       	    0x7ff92507b09c specialized runApp(_:) + 161
96  SwiftUI                       	    0x7ff925add424 runApp<A>(_:) + 164
97  SwiftUI                       	    0x7ff9255d5c5f static App.main() + 63
98  RedLemon                      	       0x10d1feeb3 static RedLemonApp.$main() + 35 (RedLemonApp.swift:30)
99  RedLemon                      	       0x10d1fef39 RedLemon_main + 9
100 dyld                          	       0x11f0af52e start + 462

Thread 1:
0   libsystem_pthread.dylib       	    0x7ff819a5df48 start_wqthread + 0

Thread 2:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff819a2593a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff819a25ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff819b2929d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff819b27928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff819b26d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff81c6d3572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff819a624e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff819a5df6b thread_start + 15

Thread 3:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff819a2593a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff819a25ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff819b2929d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff819b27928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff819b26d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff81e755964 0x7ff81e50d000 + 2394468
6   Foundation                    	    0x7ff81a97e724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff819a624e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff819a5df6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff819a2a30e kevent + 10
1   RedLemon                      	       0x10cfd27c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10cfdc6ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10cfdcd44 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10cfd347b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10cfdc5e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10cfb90b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10cfba11f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10cfaafe3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10cfb78cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10cfb11f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10cfa5aae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10cfa8ed4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10cf9da62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10cf9daac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82ea2ae7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10cf9da09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10cfa4b2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10cf46848 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10cf46f9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10cf4d273 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10cfdd13f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10cfdfcaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10cfdfd69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff819a624e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff819a5df6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff819a2a30e kevent + 10
1   RedLemon                      	       0x10cfd27c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10cfdc6ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10cfdcd44 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10cfd347b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10cfdc5e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10cfb90b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10cfba11f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10cfab0a2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10cfab0f7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff82703b72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10cfaaf6a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10cfb78cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10cfb11f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10cfa5aae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10cfa8ed4 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10cf9da62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10cf9daac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82ea2ae7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10cf9da09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10cfa4b2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10cf46848 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10cf46f9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10cf4d273 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10cfdd13f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10cfdfcaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10cfdfd69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff819a624e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff819a5df6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff819a2a30e kevent + 10
1   RedLemon                      	       0x10cfd27c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10cfdc6ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10cfdcd44 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10cfd347b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10cfdc5e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10cfb90b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10cfba11f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10cfaafe3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10cfb78cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10cfb11f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10cfa5aae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10cfa8ed4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10cf9da62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10cf9daac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82ea2ae7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10cf9da09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10cfa4b2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10cf46848 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10cf46f9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10cf4d273 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10cfdd13f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10cfdfcaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10cfdfd69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff819a624e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff819a5df6b thread_start + 15

Thread 7:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff819a2a30e kevent + 10
1   RedLemon                      	       0x10cfd27c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10cfdc6ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10cfdcd44 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10cfd347b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10cfdc5e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10cfb90b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10cfba11f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10cfaafe3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10cfb78cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10cfb11f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10cfa5aae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10cfa8ed4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10cf9da62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10cf9daac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82ea2ae7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10cf9da09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10cfa4b2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10cf46848 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10cf46f9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10cf4d273 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10cfdd13f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10cfdfcaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10cfdfd69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff819a624e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff819a5df6b thread_start + 15

Thread 8:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff819a25976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8198aa7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff8198aac9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10cf4f73f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10cf5060e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10cfdd13f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10cfdfcaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10cfdfd69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff819a624e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff819a5df6b thread_start + 15

Thread 9:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff819a25976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8198aa7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff8198aac9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10cf4f73f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10cf5060e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10cfdd13f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10cfdfcaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10cfdfd69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff819a624e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff819a5df6b thread_start + 15

Thread 10:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff819a25976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8198aa7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff8198aac9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10cf4f73f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10cf5060e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10cfdd13f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10cfdfcaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10cfdfd69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff819a624e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff819a5df6b thread_start + 15

Thread 11:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff819a25976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8198aa7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff8198aac9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10cf4f73f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10cf5060e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10cfdd13f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10cfdfcaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10cfdfd69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff819a624e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff819a5df6b thread_start + 15

Thread 12:
0   libsystem_pthread.dylib       	    0x7ff819a5df48 start_wqthread + 0

Thread 13:
0   libsystem_pthread.dylib       	    0x7ff819a5df48 start_wqthread + 0


Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x031dfff85b735501  rbx: 0x00007faae58df7c0  rcx: 0x0080000000000000  rdx: 0x0100000000000000
  rdi: 0x00007faae58df7c0  rsi: 0x021dfff85b735531  rbp: 0x00007ff7b3db05e0  rsp: 0x00007ff7b3db0580
   r8: 0x0000000000000010   r9: 0x0f0f0f0f0f0f0f0f  r10: 0x00007ff85b048d38  r11: 0x00007ff81a957c50
  r12: 0x00007ff7b3db05f0  r13: 0x00007faae58df7c0  r14: 0x00007ff7b3db0600  r15: 0x00007ff7b3db0680
  rip: 0x00007ff92595ff26  rfl: 0x0000000000010203  cr2: 0x0000000000000000

Logical CPU:     0
Error Code:      0x00000000
Trap Number:     6

Thread 0 instruction stream:
  16 a7 32 00 73 0a 66 0f-2e c4 76 56 31 c0 eb 0d  ..2.s.f...vV1...
  66 0f 2e c4 76 4c 66 0f-2e c6 0f 97 c0 66 0f 2e  f...vLf......f..
  ee 72 3d 66 0f 2e e6 72-39 66 0f 2e ec 0f 93 c1  .r=f...r9f......
  20 c8 3c 01 75 2c 66 0f-28 c6 66 0f 28 cc 66 0f   .<.u,f.(.f.(.f.
  28 d5 e8 39 ca a3 ff 0f-28 45 d0 0f 28 4d c0 0f  (..9....(E..(M..
  28 55 b0 48 83 c4 40 5b-41 5d 41 5e 41 5f 5d c3  (U.H..@[A]A^A_].
 [0f]0b 4c 8d 6d a0 49 83-65 00 00 48 b8 00 00 00  ..L.m.I.e..H....	<==
  00 00 00 00 e0 49 89 45-08 6a 67 5f e8 59 68 32  .....I.E.jg_.Yh2
  00 41 0f 10 45 00 41 0f-11 45 00 48 8b 35 c8 1c  .A..E.A..E.H.5..
  f4 36 48 89 df e8 00 78-32 00 48 89 c7 e8 40 78  .6H....x2.H...@x
  32 00 48 89 c3 48 89 c7-e8 db 5f 32 00 49 89 c6  2.H..H...._2.I..
  49 89 d7 48 89 df ff 15-16 87 09 38 4c 8d 6d a0  I..H.......8L.m.

Binary Images:
    0x7ff924fff000 -     0x7ff925e9efff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
    0x7ff81c527000 -     0x7ff81d3b6fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff8211db000 -     0x7ff821222fff com.apple.CoreAutoLayout (1.0) <ef921e7b-1fc5-391a-9722-5c77e9168810> /System/Library/PrivateFrameworks/CoreAutoLayout.framework/Versions/A/CoreAutoLayout
    0x7ff820bda000 -     0x7ff820eecfff com.apple.QuartzCore (1.11) <5ca19b57-9c18-302f-a989-bb743cd76e00> /System/Library/Frameworks/QuartzCore.framework/Versions/A/QuartzCore
    0x7ff819aa9000 -     0x7ff819fabfff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff8227ab000 -     0x7ff822a9efff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
       0x10c14a000 -        0x10dd09fff com.redlemon.app (1.0.14) <e531ed8a-f157-3ca1-9dbd-3bb7bce7e6d3> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x11f0aa000 -        0x11f115fff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff819a5c000 -     0x7ff819a67fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff819a24000 -     0x7ff819a5bfff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff81e50d000 -     0x7ff81e99bfff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff81a926000 -     0x7ff81ace2fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff82ea2a000 -     0x7ff82ea2bfff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff826f20000 -     0x7ff827399fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff8198a7000 -     0x7ff8198edfff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib

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
Writable regions: Total=163.2M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=163.2M(100%)

                                VIRTUAL   REGION
REGION TYPE                        SIZE    COUNT (non-coalesced)
===========                     =======  =======
Accelerate framework               256K        2
Activity Tracing                   256K        1
CG backing stores                 1920K        4
CG image                            24K        2
CG raster data                     284K       13
ColorSync                          224K       27
CoreAnimation                     2352K       31
CoreGraphics                         4K        1
CoreUI image data                 1432K       10
Dispatch continuations            32.0M        1
Foundation                          36K        2
Image IO                           356K        2
Kernel Alloc Once                    8K        1
MALLOC                            83.6M       84
MALLOC guard page                   48K       11
SQLite page cache                  704K       11
STACK GUARD                       56.1M       14
Stack                             14.6M       14
VM_ALLOCATE                       3136K       15
__CTF                               756        1
__DATA                            54.5M      604
__DATA_CONST                      33.4M      413
__DATA_DIRTY                      1668K      208
__FONT_DATA                          4K        1
__LINKEDIT                       701.5M       81
__OBJC_RO                         82.9M        1
__OBJC_RW                         3200K        2
__TEXT                           579.4M      611
__UNICODE                          592K        1
dyld private memory               1024K        1
libnetwork                         128K        8
mapped file                      361.8M       33
shared memory                     2816K       18
===========                     =======  =======
TOTAL                              2.0G     2229



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-11-14 16:24:33.00 -0500","app_version":"1.0.14","slice_uuid":"e531ed8a-f157-3ca1-9dbd-3bb7bce7e6d3","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"7C2BD656-A390-4239-813D-6D7B6EA7EEF5","name":"RedLemon"}
{
  "uptime" : 27000,
  "procLaunch" : "2025-11-14 16:22:07.9676 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 27596081543141,
  "coalitionID" : 3423,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-11-14 16:24:29.4150 -0500",
  "incident" : "7C2BD656-A390-4239-813D-6D7B6EA7EEF5",
  "bug_type" : "309",
  "pid" : 37094,
  "procExitAbsTime" : 27737520071848,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "launchd",
  "parentPid" : 1,
  "coalitionName" : "com.redlemon.app",
  "crashReporterKey" : "59D33877-5D0F-40BA-A3D6-C74ED52CF1F9",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_INSTRUCTION","signal":"SIGILL"},
  "termination" : {"flags":0,"code":4,"namespace":"SIGNAL","indicator":"Illegal instruction: 4","byProc":"exc handler","byPid":37094},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 0,
  "threads" : [{"triggered":true,"id":519242,"instructionState":{"instructionStream":{"bytes":[22,167,50,0,115,10,102,15,46,196,118,86,49,192,235,13,102,15,46,196,118,76,102,15,46,198,15,151,192,102,15,46,238,114,61,102,15,46,230,114,57,102,15,46,236,15,147,193,32,200,60,1,117,44,102,15,40,198,102,15,40,204,102,15,40,213,232,57,202,163,255,15,40,69,208,15,40,77,192,15,40,85,176,72,131,196,64,91,65,93,65,94,65,95,93,195,15,11,76,141,109,160,73,131,101,0,0,72,184,0,0,0,0,0,0,0,224,73,137,69,8,106,103,95,232,89,104,50,0,65,15,16,69,0,65,15,17,69,0,72,139,53,200,28,244,54,72,137,223,232,0,120,50,0,72,137,199,232,64,120,50,0,72,137,195,72,137,199,232,219,95,50,0,73,137,198,73,137,215,72,137,223,255,21,22,135,9,56,76,141,109,160],"offset":96}},"threadState":{"r13":{"value":140371972454336},"rax":{"value":224616998589650177},"rflags":{"value":66051},"cpu":{"value":0},"r14":{"value":140701851125248},"rsi":{"value":152559404551722289},"r8":{"value":16},"cr2":{"value":0},"rdx":{"value":72057594037927936},"r10":{"value":140704655641912,"symbolLocation":0,"symbol":"OBJC_METACLASS_$_NSThread"},"r9":{"value":1085102592571150095},"r15":{"value":140701851125376},"rbx":{"value":140371972454336},"trap":{"value":6},"err":{"value":0},"r11":{"value":140703574621264,"symbolLocation":0,"symbol":"+[NSThread isMainThread]"},"rip":{"value":140708054171430,"matchesCrashFrame":1},"rbp":{"value":140701851125216},"rsp":{"value":140701851125120},"r12":{"value":140701851125232},"rcx":{"value":36028797018963968},"flavor":"x86_THREAD_STATE","rdi":{"value":140371972454336}},"queue":"com.apple.main-thread","frames":[{"imageOffset":9834278,"symbol":"validateDimension #1 (min:ideal:max:) in NSView.intrinsicLayoutTraits()","symbolLocation":224,"imageIndex":0},{"imageOffset":9831320,"symbol":"NSView.intrinsicLayoutTraits()","symbolLocation":99,"imageIndex":0},{"imageOffset":9831043,"symbol":"PlatformViewHost.updateLayoutTraits()","symbolLocation":266,"imageIndex":0},{"imageOffset":10776042,"symbol":"closure #1 in ViewLeafView.layoutTraits()","symbolLocation":146,"imageIndex":0},{"imageOffset":10775877,"symbol":"ViewLeafView.layoutTraits()","symbolLocation":43,"imageIndex":0},{"imageOffset":10775545,"symbol":"closure #1 in ViewLeafView.sizeThatFits(in:)","symbolLocation":143,"imageIndex":0},{"imageOffset":10775173,"symbol":"ViewLeafView.sizeThatFits(in:)","symbolLocation":185,"imageIndex":0},{"imageOffset":3335848,"symbol":"closure #1 in LeafLayoutEngine.sizeThatFits(_:)","symbolLocation":55,"imageIndex":0},{"imageOffset":3335554,"symbol":"LeafLayoutEngine.sizeThatFits(_:)","symbolLocation":411,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5174911,"symbol":"AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:)","symbolLocation":53,"imageIndex":0},{"imageOffset":5175222,"symbol":"protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine","symbolLocation":47,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5174911,"symbol":"AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:)","symbolLocation":53,"imageIndex":0},{"imageOffset":5175222,"symbol":"protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine","symbolLocation":47,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":13028081,"symbol":"StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:)","symbolLocation":1634,"imageIndex":0},{"imageOffset":13025647,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":130,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":13028081,"symbol":"StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:)","symbolLocation":1634,"imageIndex":0},{"imageOffset":13025647,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":130,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":5120536,"symbol":"_FlexFrameLayout.sizeThatFits(in:context:child:)","symbolLocation":501,"imageIndex":0},{"imageOffset":5121752,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout","symbolLocation":46,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":13027371,"symbol":"StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:)","symbolLocation":924,"imageIndex":0},{"imageOffset":13025647,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":130,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13026274,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":757,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":5120536,"symbol":"_FlexFrameLayout.sizeThatFits(in:context:child:)","symbolLocation":501,"imageIndex":0},{"imageOffset":5121752,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout","symbolLocation":46,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":2625782,"symbol":"ViewGraph.sizeThatFits(_:)","symbolLocation":256,"imageIndex":0},{"imageOffset":11140259,"symbol":"closure #1 in ViewRendererHost.sizeThatFits(_:)","symbolLocation":47,"imageIndex":0},{"imageOffset":11177904,"symbol":"partial apply for closure #1 in ViewRendererHost.sizeThatFits(_:)","symbolLocation":43,"imageIndex":0},{"imageOffset":11115688,"symbol":"closure #1 in ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":69,"imageIndex":0},{"imageOffset":11110623,"symbol":"ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":78,"imageIndex":0},{"imageOffset":11168976,"symbol":"protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":0},{"imageOffset":11049377,"symbol":"ViewRendererHost.sizeThatFits(_:)","symbolLocation":97,"imageIndex":0},{"imageOffset":11412566,"symbol":"NSHostingView.minSize()","symbolLocation":114,"imageIndex":0},{"imageOffset":11437269,"symbol":"NSHostingView.SizeConstraints.update(from:)","symbolLocation":309,"imageIndex":0},{"imageOffset":11440387,"symbol":"NSHostingView._willUpdateConstraintsForSubtree()","symbolLocation":240,"imageIndex":0},{"imageOffset":11440740,"symbol":"@objc NSHostingView._willUpdateConstraintsForSubtree()","symbolLocation":21,"imageIndex":0},{"imageOffset":922765,"symbol":"-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]","symbolLocation":73,"imageIndex":1},{"imageOffset":923118,"symbol":"-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]","symbolLocation":426,"imageIndex":1},{"imageOffset":923118,"symbol":"-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]","symbolLocation":426,"imageIndex":1},{"imageOffset":923118,"symbol":"-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]","symbolLocation":426,"imageIndex":1},{"imageOffset":984570,"symbol":"__82-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]_block_invoke","symbolLocation":269,"imageIndex":1},{"imageOffset":64755,"symbol":"-[NSISEngine withBehaviors:performModifications:]","symbolLocation":84,"imageIndex":2},{"imageOffset":922890,"symbol":"-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]","symbolLocation":198,"imageIndex":1},{"imageOffset":923118,"symbol":"-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]","symbolLocation":426,"imageIndex":1},{"imageOffset":923118,"symbol":"-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]","symbolLocation":426,"imageIndex":1},{"imageOffset":922449,"symbol":"__45-[NSView updateConstraintsForSubtreeIfNeeded]_block_invoke","symbolLocation":48,"imageIndex":1},{"imageOffset":921890,"symbol":"-[NSView updateConstraintsForSubtreeIfNeeded]","symbolLocation":229,"imageIndex":1},{"imageOffset":1089406,"symbol":"__62-[NSWindow(NSConstraintBasedLayout) updateConstraintsIfNeeded]_block_invoke","symbolLocation":134,"imageIndex":1},{"imageOffset":1089186,"symbol":"-[NSWindow(NSConstraintBasedLayout) updateConstraintsIfNeeded]","symbolLocation":253,"imageIndex":1},{"imageOffset":1088741,"symbol":"__NSWindowGetDisplayCycleObserverForUpdateConstraints_block_invoke","symbolLocation":430,"imageIndex":1},{"imageOffset":1088247,"symbol":"NSDisplayCycleObserverInvoke","symbolLocation":155,"imageIndex":1},{"imageOffset":1087108,"symbol":"NSDisplayCycleFlush","symbolLocation":921,"imageIndex":1},{"imageOffset":15338,"symbol":"CA::Transaction::run_commit_handlers(CATransactionPhase)","symbolLocation":98,"imageIndex":3},{"imageOffset":10488,"symbol":"CA::Transaction::commit()","symbolLocation":376,"imageIndex":3},{"imageOffset":1748337,"symbol":"__62+[CATransaction(NSCATransaction) NS_setFlushesWithDisplayLink]_block_invoke","symbolLocation":285,"imageIndex":1},{"imageOffset":9383228,"symbol":"___NSRunLoopObserverCreateWithHandler_block_invoke","symbolLocation":41,"imageIndex":1},{"imageOffset":521296,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__","symbolLocation":23,"imageIndex":4},{"imageOffset":520930,"symbol":"__CFRunLoopDoObservers","symbolLocation":543,"imageIndex":4},{"imageOffset":518004,"symbol":"__CFRunLoopRun","symbolLocation":840,"imageIndex":4},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":4},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":5},{"imageOffset":188947,"symbol":"ReceiveNextEventCommon","symbolLocation":283,"imageIndex":5},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":5},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":1},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":1},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":1},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":1},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":0},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":0},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":0},{"imageOffset":17518259,"sourceLine":30,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":6,"symbolLocation":35},{"imageOffset":17518393,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":6},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":7}]},{"id":519318,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":519359,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":9},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":4},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":4},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":4},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":519377,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":9},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":4},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":4},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":4},{"imageOffset":2394468,"imageIndex":10},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":11},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":519383,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15239113,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15279855,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15281476,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15242363,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15279592,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15134902,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15139103,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15077347,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":467},{"imageOffset":15128781,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15102452,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15055534,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15068884,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15022690,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15022764,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15022601,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15051567,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14665800,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14667674,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14692979,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15282495,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15293615,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15293801,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":519385,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15239113,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15279855,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15281476,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15242363,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15279592,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15134902,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15139103,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15077538,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":50},{"imageOffset":15077623,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":6},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":13},{"imageOffset":15077226,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":346},{"imageOffset":15128781,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15102452,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15055534,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15068884,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15022690,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15022764,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15022601,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15051567,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14665800,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14667674,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14692979,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15282495,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15293615,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15293801,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":519386,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15239113,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15279855,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15281476,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15242363,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15279592,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15134902,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15139103,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15077347,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":467},{"imageOffset":15128781,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15102452,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15055534,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15068884,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15022690,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15022764,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15022601,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15051567,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14665800,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14667674,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14692979,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15282495,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15293615,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15293801,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":519387,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15239113,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15279855,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15281476,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15242363,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15279592,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15134902,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15139103,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15077347,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":467},{"imageOffset":15128781,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15102452,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15055534,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15068884,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15022690,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15022764,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":12},{"imageOffset":15022601,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15051567,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14665800,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14667674,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14692979,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15282495,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15293615,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15293801,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":519388,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":14},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":14},{"imageOffset":14702399,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14706190,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15282495,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15293615,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15293801,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":519389,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":14},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":14},{"imageOffset":14702399,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14706190,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15282495,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15293615,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15293801,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":519390,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":14},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":14},{"imageOffset":14702399,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14706190,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15282495,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15293615,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15293801,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":519391,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":14},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":14},{"imageOffset":14702399,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14706190,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15282495,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15293615,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15293801,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":520281,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":520411,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140708044337152,
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
    "base" : 140703603781632,
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
    "base" : 140703684210688,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.CoreAutoLayout",
    "size" : 294912,
    "uuid" : "ef921e7b-1fc5-391a-9722-5c77e9168810",
    "path" : "\/System\/Library\/PrivateFrameworks\/CoreAutoLayout.framework\/Versions\/A\/CoreAutoLayout",
    "name" : "CoreAutoLayout",
    "CFBundleVersion" : "28"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703677915136,
    "CFBundleShortVersionString" : "1.11",
    "CFBundleIdentifier" : "com.apple.QuartzCore",
    "size" : 3223552,
    "uuid" : "5ca19b57-9c18-302f-a989-bb743cd76e00",
    "path" : "\/System\/Library\/Frameworks\/QuartzCore.framework\/Versions\/A\/QuartzCore",
    "name" : "QuartzCore",
    "CFBundleVersion" : "964.39"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703559225344,
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
    "base" : 140703707082752,
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
    "base" : 4497645568,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 29097984,
    "uuid" : "e531ed8a-f157-3ca1-9dbd-3bb7bce7e6d3",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4815757312,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703558909952,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703558680576,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703637229568,
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
    "base" : 140703574417408,
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
    "base" : 140703911026688,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703782010880,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703557120000,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703555649536,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=163.2M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=163.2M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               256K        2 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                            24K        2 \nCG raster data                     284K       13 \nColorSync                          224K       27 \nCoreAnimation                     2352K       31 \nCoreGraphics                         4K        1 \nCoreUI image data                 1432K       10 \nDispatch continuations            32.0M        1 \nFoundation                          36K        2 \nImage IO                           356K        2 \nKernel Alloc Once                    8K        1 \nMALLOC                            83.6M       84 \nMALLOC guard page                   48K       11 \nSQLite page cache                  704K       11 \nSTACK GUARD                       56.1M       14 \nStack                             14.6M       14 \nVM_ALLOCATE                       3136K       15 \n__CTF                               756        1 \n__DATA                            54.5M      604 \n__DATA_CONST                      33.4M      413 \n__DATA_DIRTY                      1668K      208 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       701.5M       81 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           579.4M      611 \n__UNICODE                          592K        1 \ndyld private memory               1024K        1 \nlibnetwork                         128K        8 \nmapped file                      361.8M       33 \nshared memory                     2816K       18 \n===========                     =======  ======= \nTOTAL                              2.0G     2229 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.main-thread"
  }
},
  "trialInfo" : {
  "rollouts" : [
    {
      "rolloutId" : "607844aa04477260f58a8077",
      "factorPackIds" : {
        "SIRI_MORPHUN_ASSETS" : "6103050cbfe6dc472e1c982a"
      },
      "deploymentId" : 240000066
    },
    {
      "rolloutId" : "61301e3a61217b3110231469",
      "factorPackIds" : {
        "SIRI_FIND_MY_CONFIGURATION_FILES" : "652886aa2c02f032beae8316"
      },
      "deploymentId" : 240000028
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
USB Device: SanDisk 3.2Gen1
USB Device: Bluetooth USB Host Controller
Thunderbolt Bus: MacBook Pro, Apple Inc., 27.1


















