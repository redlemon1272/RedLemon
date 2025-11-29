-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [47712]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [47556]
Responsible:           Electron [31971]
User ID:               501

Date/Time:             2025-11-28 19:40:28.0537 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        24F646B6-E55A-DF4C-178D-891130B3FBCE

Sleep/Wake UUID:       3664808A-8846-4A6D-948B-D087D2C44439

Time Awake Since Boot: 28000 seconds
Time Since Wake:       4706 seconds

System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 4 Illegal instruction: 4
Terminating Process:   exc handler [47712]

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   SwiftUI                       	    0x7ff91a85df26 validateDimension #1 (min:ideal:max:) in NSView.intrinsicLayoutTraits() + 224
1   SwiftUI                       	    0x7ff91a85d3c1 NSView.intrinsicLayoutTraits() + 140
2   SwiftUI                       	    0x7ff91a85d283 PlatformViewHost.updateLayoutTraits() + 266
3   SwiftUI                       	    0x7ff91a943dea closure #1 in ViewLeafView.layoutTraits() + 146
4   SwiftUI                       	    0x7ff91a943d45 ViewLeafView.layoutTraits() + 43
5   SwiftUI                       	    0x7ff91a943bf9 closure #1 in ViewLeafView.sizeThatFits(in:) + 143
6   SwiftUI                       	    0x7ff91a943a85 ViewLeafView.sizeThatFits(in:) + 185
7   SwiftUI                       	    0x7ff91a22b6a8 closure #1 in LeafLayoutEngine.sizeThatFits(_:) + 55
8   SwiftUI                       	    0x7ff91a22b582 LeafLayoutEngine.sizeThatFits(_:) + 411
9   SwiftUI                       	    0x7ff91a3e2073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
10  SwiftUI                       	    0x7ff91a3ec67f AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:) + 53
11  SwiftUI                       	    0x7ff91a3ec7b6 protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine + 47
12  SwiftUI                       	    0x7ff91a3e2073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
13  SwiftUI                       	    0x7ff91a3ec67f AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:) + 53
14  SwiftUI                       	    0x7ff91a3ec7b6 protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine + 47
15  SwiftUI                       	    0x7ff91a3e2073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
16  SwiftUI                       	    0x7ff91ab687f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
17  SwiftUI                       	    0x7ff91ab693e2 specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 757
18  SwiftUI                       	    0x7ff91ab6a619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
19  SwiftUI                       	    0x7ff91ab67fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
20  SwiftUI                       	    0x7ff91ab6737f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
21  SwiftUI                       	    0x7ff91ab671d4 StackLayout.Storage.sizeThatFits(_:) + 124
22  SwiftUI                       	    0x7ff91a3e1ca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
23  SwiftUI                       	    0x7ff91ab69af1 StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 1634
24  SwiftUI                       	    0x7ff91ab6916f specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130
25  SwiftUI                       	    0x7ff91ab6a619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
26  SwiftUI                       	    0x7ff91ab67fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
27  SwiftUI                       	    0x7ff91ab6737f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
28  SwiftUI                       	    0x7ff91ab671d4 StackLayout.Storage.sizeThatFits(_:) + 124
29  SwiftUI                       	    0x7ff91a2f1862 _PaddingLayout.sizeThatFits(in:context:child:) + 187
30  SwiftUI                       	    0x7ff91a2f1b8b protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout + 49
31  SwiftUI                       	    0x7ff91a79368a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
32  SwiftUI                       	    0x7ff91a793556 UnaryLayoutEngine.sizeThatFits(_:) + 512
33  SwiftUI                       	    0x7ff91a3e2073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
34  SwiftUI                       	    0x7ff91a3e1ca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
35  SwiftUI                       	    0x7ff91ab6982b StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 924
36  SwiftUI                       	    0x7ff91ab6916f specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130
37  SwiftUI                       	    0x7ff91ab6a619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
38  SwiftUI                       	    0x7ff91ab67fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
39  SwiftUI                       	    0x7ff91ab6737f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
40  SwiftUI                       	    0x7ff91ab671d4 StackLayout.Storage.sizeThatFits(_:) + 124
41  SwiftUI                       	    0x7ff91a3e1ca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
42  SwiftUI                       	    0x7ff91ab6982b StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 924
43  SwiftUI                       	    0x7ff91ab6916f specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130
44  SwiftUI                       	    0x7ff91ab6a619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
45  SwiftUI                       	    0x7ff91ab67fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
46  SwiftUI                       	    0x7ff91ab6737f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
47  SwiftUI                       	    0x7ff91ab671d4 StackLayout.Storage.sizeThatFits(_:) + 124
48  SwiftUI                       	    0x7ff91a2f1862 _PaddingLayout.sizeThatFits(in:context:child:) + 187
49  SwiftUI                       	    0x7ff91a2f1b8b protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout + 49
50  SwiftUI                       	    0x7ff91a79368a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
51  SwiftUI                       	    0x7ff91a793556 UnaryLayoutEngine.sizeThatFits(_:) + 512
52  SwiftUI                       	    0x7ff91a3e2073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
53  SwiftUI                       	    0x7ff91a2f1862 _PaddingLayout.sizeThatFits(in:context:child:) + 187
54  SwiftUI                       	    0x7ff91a2f1b8b protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout + 49
55  SwiftUI                       	    0x7ff91a79368a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
56  SwiftUI                       	    0x7ff91a793556 UnaryLayoutEngine.sizeThatFits(_:) + 512
57  SwiftUI                       	    0x7ff91a3e2073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
58  SwiftUI                       	    0x7ff91a2f70d2 _AlignmentLayout.sizeThatFits(in:context:child:) + 138
59  SwiftUI                       	    0x7ff91a79368a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
60  SwiftUI                       	    0x7ff91a793556 UnaryLayoutEngine.sizeThatFits(_:) + 512
61  SwiftUI                       	    0x7ff91a3e2073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
62  SwiftUI                       	    0x7ff91a3df218 _FlexFrameLayout.sizeThatFits(in:context:child:) + 501
63  SwiftUI                       	    0x7ff91a3df6d8 protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout + 46
64  SwiftUI                       	    0x7ff91a79368a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
65  SwiftUI                       	    0x7ff91a793556 UnaryLayoutEngine.sizeThatFits(_:) + 512
66  SwiftUI                       	    0x7ff91a3e2073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
67  SwiftUI                       	    0x7ff91a185166 RootGeometry.value.getter + 299
68  SwiftUI                       	    0x7ff91a01ec7e specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 28
69  SwiftUI                       	    0x7ff91a036187 partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 20
70  AttributeGraph                	    0x7ff91ada2757 AG::Graph::UpdateStack::update() + 559
71  AttributeGraph                	    0x7ff91ada2d57 AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421
72  AttributeGraph                	    0x7ff91adad35e AG::Subgraph::update(unsigned int) + 904
73  SwiftUI                       	    0x7ff91ab304ab GraphHost.flushTransactions() + 495
74  SwiftUI                       	    0x7ff91ab31304 closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:) + 15
75  SwiftUI                       	    0x7ff91a1856aa partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:) + 17
76  SwiftUI                       	    0x7ff91a996ca8 closure #1 in ViewRendererHost.updateViewGraph<A>(body:) + 69
77  SwiftUI                       	    0x7ff91a9958df ViewRendererHost.updateViewGraph<A>(body:) + 78
78  SwiftUI                       	    0x7ff91a9a3cd0 protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1> + 25
79  SwiftUI                       	    0x7ff91a17e2a4 ViewGraphDelegate.updateGraph<A>(body:) + 55
80  SwiftUI                       	    0x7ff91a1855e3 protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1> + 25
81  SwiftUI                       	    0x7ff91ab312e0 closure #1 in GraphHost.init(data:) + 122
82  SwiftUI                       	    0x7ff91a186e3c thunk for @escaping @callee_guaranteed () -> () + 12
83  SwiftUI                       	    0x7ff91aa1625b partial apply for thunk for @escaping @callee_guaranteed () -> () + 17
84  SwiftUI                       	    0x7ff91aa13b20 static NSRunLoop.flushObservers() + 118
85  SwiftUI                       	    0x7ff91aa161d8 closure #1 in closure #1 in static NSRunLoop.addObserver(_:) + 16
86  SwiftUI                       	    0x7ff91aa10716 specialized thunk for @callee_guaranteed () -> (@error @owned Error) + 14
87  libswiftObjectiveC.dylib      	    0x7ff823928e7c autoreleasepool<A>(invoking:) + 44
88  SwiftUI                       	    0x7ff91aa161c0 closure #1 in static NSRunLoop.addObserver(_:) + 35
89  SwiftUI                       	    0x7ff91aa16205 @objc closure #1 in static NSRunLoop.addObserver(_:) + 43
90  CoreFoundation                	    0x7ff80ea26450 __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
91  CoreFoundation                	    0x7ff80ea262e2 __CFRunLoopDoObservers + 543
92  CoreFoundation                	    0x7ff80ea25897 __CFRunLoopRun + 1131
93  CoreFoundation                	    0x7ff80ea24d6c CFRunLoopRunSpecific + 562
94  HIToolbox                     	    0x7ff8176d75e6 RunCurrentEventLoopInMode + 292
95  HIToolbox                     	    0x7ff8176d734a ReceiveNextEventCommon + 594
96  HIToolbox                     	    0x7ff8176d70e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
97  AppKit                        	    0x7ff811463aa9 _DPSNextEvent + 927
98  AppKit                        	    0x7ff811462166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
99  AppKit                        	    0x7ff811454818 -[NSApplication run] + 586
100 AppKit                        	    0x7ff81142879a NSApplicationMain + 817
101 SwiftUI                       	    0x7ff919f7909c specialized runApp(_:) + 161
102 SwiftUI                       	    0x7ff91a9db424 runApp<A>(_:) + 164
103 SwiftUI                       	    0x7ff91a4d3c5f static App.main() + 63
104 RedLemon                      	       0x1079483b3 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
105 RedLemon                      	       0x107948439 RedLemon_main + 9
106 dyld                          	       0x1150e652e start + 462

Thread 1:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff80e92393a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80e923ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80ea2729d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80ea25928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80ea24d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff8115d1572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15

Thread 2:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff80e92393a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80e923ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80ea2729d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80ea25928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80ea24d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff813653964 0x7ff81340b000 + 2394468
6   Foundation                    	    0x7ff80f87c724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15

Thread 3:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff80e92830e kevent + 10
1   RedLemon                      	       0x107720a49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10772a96f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10772afc4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x1077216fb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10772a868 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x107707336 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10770839f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x1076f9322 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x1076f9377 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81bf3972c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x1076f91ea Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x107705b4d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x1076ff474 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x1076f3d2e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x1076f7154 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x1076ebce2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x1076ebd2c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff823928e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x1076ebc89 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x1076f2daf SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107694ac8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10769521a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10769b4f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10772b3bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10772df2f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10772dfe9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff80e92830e kevent + 10
1   RedLemon                      	       0x107720a49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10772a96f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10772afc4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x1077216fb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10772a868 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x107707336 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10770839f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x1076f9322 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x1076f9377 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81bf3972c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x1076f91ea Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x107705b4d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x1076ff474 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x1076f3d2e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x1076f7154 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x1076ebce2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x1076ebd2c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff823928e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x1076ebc89 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x1076f2daf SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107694ac8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10769521a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10769b4f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10772b3bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10772df2f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10772dfe9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff80e92830e kevent + 10
1   RedLemon                      	       0x107720a49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10772a96f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10772afc4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x1077216fb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10772a868 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x107707336 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10770839f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x1076f9322 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x1076f9377 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81bf3972c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x1076f91ea Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x107705b4d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x1076ff474 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x1076f3d2e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x1076f7154 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x1076ebce2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x1076ebd2c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff823928e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x1076ebc89 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x1076f2daf SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107694ac8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10769521a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10769b4f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10772b3bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10772df2f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10772dfe9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff80e92830e kevent + 10
1   RedLemon                      	       0x107720a49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10772a96f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10772afc4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x1077216fb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10772a868 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x107707336 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10770839f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x1076f9322 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x1076f9377 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81bf3972c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x1076f91ea Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x107705b4d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x1076ff474 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x1076f3d2e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x1076f7154 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x1076ebce2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x1076ebd2c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff823928e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x1076ebc89 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x1076f2daf SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107694ac8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10769521a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10769b4f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10772b3bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10772df2f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10772dfe9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15

Thread 7:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff80e923976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80e7a87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80e7a8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10769d9bf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10769e88e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10772b3bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10772df2f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10772dfe9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15

Thread 8:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff80e923976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80e7a87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80e7a8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10769d9bf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10769e88e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10772b3bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10772df2f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10772dfe9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15

Thread 9:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff80e923976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80e7a87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80e7a8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10769d9bf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10769e88e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10772b3bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10772df2f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10772dfe9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15

Thread 10:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff80e923976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80e7a87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80e7a8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10769d9bf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10769e88e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10772b3bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10772df2f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10772dfe9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15

Thread 11:
0   libsystem_pthread.dylib       	    0x7ff80e95bf48 start_wqthread + 0

Thread 12:
0   libsystem_pthread.dylib       	    0x7ff80e95bf48 start_wqthread + 0

Thread 13:
0   libsystem_pthread.dylib       	    0x7ff80e95bf48 start_wqthread + 0

Thread 14:
0   libsystem_pthread.dylib       	    0x7ff80e95bf48 start_wqthread + 0

Thread 15:
0   libsystem_pthread.dylib       	    0x7ff80e95bf48 start_wqthread + 0

Thread 16:
0   libsystem_pthread.dylib       	    0x7ff80e95bf48 start_wqthread + 0

Thread 17:
0   libsystem_pthread.dylib       	    0x7ff80e95bf48 start_wqthread + 0

Thread 18:
0   libsystem_pthread.dylib       	    0x7ff80e95bf48 start_wqthread + 0

Thread 19:
0   libsystem_pthread.dylib       	    0x7ff80e95bf48 start_wqthread + 0

Thread 20:
0   libsystem_pthread.dylib       	    0x7ff80e95bf48 start_wqthread + 0

Thread 21:: com.apple.NSScrollingConcurrentVBLMonitor
0   libsystem_kernel.dylib        	    0x7ff80e92393a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80e923ca8 mach_msg + 56
2   AppKit                        	    0x7ff811982f48 NSWaitUntilHostTime + 102
3   AppKit                        	    0x7ff811dc60a1 run_monitor_thread + 579
4   libsystem_pthread.dylib       	    0x7ff80e9604e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff80e95bf6b thread_start + 15


Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x031dfff850633501  rbx: 0x00007fe7eee20190  rcx: 0x0080000000000001  rdx: 0x0100000000000000
  rdi: 0x00007fe7eee20190  rsi: 0x021dfff850633531  rbp: 0x00007ff7b9663bf0  rsp: 0x00007ff7b9663b90
   r8: 0x0000000000000010   r9: 0x0f0f0f0f0f0f0f0f  r10: 0x00007ff84ff46d38  r11: 0x00007ff80f855c50
  r12: 0x00007ff7b9663c00  r13: 0x00007fe7eee20190  r14: 0x00007ff7b9663c10  r15: 0x00007ff7b9663c90
  rip: 0x00007ff91a85df26  rfl: 0x0000000000010203  cr2: 0x0000000000000000

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
    0x7ff919efd000 -     0x7ff91ad9cfff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
    0x7ff91ad9d000 -     0x7ff91add3fff com.apple.AttributeGraph (3.2.1) <e9337c46-2775-39dc-ae3d-14ccf80d629f> /System/Library/PrivateFrameworks/AttributeGraph.framework/Versions/A/AttributeGraph
    0x7ff823928000 -     0x7ff823929fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff80e9a7000 -     0x7ff80eea9fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff8176a9000 -     0x7ff81799cfff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff811425000 -     0x7ff8122b4fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x106897000 -        0x1087eefff com.redlemon.app (1.0.14) <4ea9e2b7-86a9-3992-a33c-843bbf21cced> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x1150e1000 -        0x11514cfff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff80e922000 -     0x7ff80e959fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff80e95a000 -     0x7ff80e965fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff81340b000 -     0x7ff813899fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff80f824000 -     0x7ff80fbe0fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff81be1e000 -     0x7ff81c297fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff80e7a5000 -     0x7ff80e7ebfff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib

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
Writable regions: Total=169.9M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=169.9M(100%)

                                VIRTUAL   REGION
REGION TYPE                        SIZE    COUNT (non-coalesced)
===========                     =======  =======
Accelerate framework               384K        3
Activity Tracing                   256K        1
CG backing stores                  528K        4
CG image                            24K        4
CG raster data                      20K        2
ColorSync                          232K       28
CoreAnimation                      600K       85
CoreGraphics                         4K        1
CoreUI image data                  660K        9
Dispatch continuations            32.0M        1
Foundation                          16K        1
IOKit                             7940K        1
Image IO                           592K        2
Kernel Alloc Once                    8K        1
MALLOC                            75.6M       82
MALLOC guard page                   48K       10
SQLite page cache                  448K        7
STACK GUARD                       56.1M       22
Stack                             18.7M       22
VM_ALLOCATE                       3136K       15
__CTF                               756        1
__DATA                            55.0M      602
__DATA_CONST                      33.3M      408
__DATA_DIRTY                      1652K      204
__FONT_DATA                          4K        1
__LINKEDIT                       707.9M       83
__OBJC_RO                         82.9M        1
__OBJC_RW                         3200K        2
__TEXT                           583.6M      607
__UNICODE                          592K        1
dyld private memory               1024K        3
libnetwork                        13.6M       40
mapped file                      163.4M       33
shared memory                     2820K       19
===========                     =======  =======
TOTAL                              1.8G     2306



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-11-28 19:40:39.00 -0500","app_version":"1.0.14","slice_uuid":"4ea9e2b7-86a9-3992-a33c-843bbf21cced","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"F2AEE67F-8D9E-4218-8C35-805E6FE97BB0","name":"RedLemon"}
{
  "uptime" : 28000,
  "procLaunch" : "2025-11-28 19:39:43.4765 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookAir7,1",
  "procStartAbsTime" : 28594722635897,
  "coalitionID" : 652,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-11-28 19:40:28.0537 -0500",
  "incident" : "F2AEE67F-8D9E-4218-8C35-805E6FE97BB0",
  "bug_type" : "309",
  "pid" : 47712,
  "procExitAbsTime" : 28639092721297,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"DE7DE55C-FAC2-51DA-92D1-22902ED1697D","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 47556,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "24F646B6-E55A-DF4C-178D-891130B3FBCE",
  "responsiblePid" : 31971,
  "responsibleProc" : "Electron",
  "wakeTime" : 4706,
  "sleepWakeUUID" : "3664808A-8846-4A6D-948B-D087D2C44439",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_INSTRUCTION","signal":"SIGILL"},
  "termination" : {"flags":0,"code":4,"namespace":"SIGNAL","indicator":"Illegal instruction: 4","byProc":"exc handler","byPid":47712},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 0,
  "threads" : [{"triggered":true,"id":255984,"instructionState":{"instructionStream":{"bytes":[22,167,50,0,115,10,102,15,46,196,118,86,49,192,235,13,102,15,46,196,118,76,102,15,46,198,15,151,192,102,15,46,238,114,61,102,15,46,230,114,57,102,15,46,236,15,147,193,32,200,60,1,117,44,102,15,40,198,102,15,40,204,102,15,40,213,232,57,202,163,255,15,40,69,208,15,40,77,192,15,40,85,176,72,131,196,64,91,65,93,65,94,65,95,93,195,15,11,76,141,109,160,73,131,101,0,0,72,184,0,0,0,0,0,0,0,224,73,137,69,8,106,103,95,232,89,104,50,0,65,15,16,69,0,65,15,17,69,0,72,139,53,200,28,244,54,72,137,223,232,0,120,50,0,72,137,199,232,64,120,50,0,72,137,195,72,137,199,232,219,95,50,0,73,137,198,73,137,215,72,137,223,255,21,22,135,9,56,76,141,109,160],"offset":96}},"threadState":{"r13":{"value":140634121961872},"rax":{"value":224616998404044033},"rflags":{"value":66051},"cpu":{"value":0},"r14":{"value":140701944134672},"rsi":{"value":152559404366116145},"r8":{"value":16},"cr2":{"value":0},"rdx":{"value":72057594037927936},"r10":{"value":140704470035768,"symbolLocation":0,"symbol":"OBJC_METACLASS_$_NSThread"},"r9":{"value":1085102592571150095},"r15":{"value":140701944134800},"rbx":{"value":140634121961872},"trap":{"value":6},"err":{"value":0},"r11":{"value":140703389015120,"symbolLocation":0,"symbol":"+[NSThread isMainThread]"},"rip":{"value":140707868565286,"matchesCrashFrame":1},"rbp":{"value":140701944134640},"rsp":{"value":140701944134544},"r12":{"value":140701944134656},"rcx":{"value":36028797018963969},"flavor":"x86_THREAD_STATE","rdi":{"value":140634121961872}},"queue":"com.apple.main-thread","frames":[{"imageOffset":9834278,"symbol":"validateDimension #1 (min:ideal:max:) in NSView.intrinsicLayoutTraits()","symbolLocation":224,"imageIndex":0},{"imageOffset":9831361,"symbol":"NSView.intrinsicLayoutTraits()","symbolLocation":140,"imageIndex":0},{"imageOffset":9831043,"symbol":"PlatformViewHost.updateLayoutTraits()","symbolLocation":266,"imageIndex":0},{"imageOffset":10776042,"symbol":"closure #1 in ViewLeafView.layoutTraits()","symbolLocation":146,"imageIndex":0},{"imageOffset":10775877,"symbol":"ViewLeafView.layoutTraits()","symbolLocation":43,"imageIndex":0},{"imageOffset":10775545,"symbol":"closure #1 in ViewLeafView.sizeThatFits(in:)","symbolLocation":143,"imageIndex":0},{"imageOffset":10775173,"symbol":"ViewLeafView.sizeThatFits(in:)","symbolLocation":185,"imageIndex":0},{"imageOffset":3335848,"symbol":"closure #1 in LeafLayoutEngine.sizeThatFits(_:)","symbolLocation":55,"imageIndex":0},{"imageOffset":3335554,"symbol":"LeafLayoutEngine.sizeThatFits(_:)","symbolLocation":411,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5174911,"symbol":"AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:)","symbolLocation":53,"imageIndex":0},{"imageOffset":5175222,"symbol":"protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine","symbolLocation":47,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5174911,"symbol":"AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:)","symbolLocation":53,"imageIndex":0},{"imageOffset":5175222,"symbol":"protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine","symbolLocation":47,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13026274,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":757,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":13028081,"symbol":"StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:)","symbolLocation":1634,"imageIndex":0},{"imageOffset":13025647,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":130,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":4147298,"symbol":"_PaddingLayout.sizeThatFits(in:context:child:)","symbolLocation":187,"imageIndex":0},{"imageOffset":4148107,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout","symbolLocation":49,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":13027371,"symbol":"StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:)","symbolLocation":924,"imageIndex":0},{"imageOffset":13025647,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":130,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":13027371,"symbol":"StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:)","symbolLocation":924,"imageIndex":0},{"imageOffset":13025647,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":130,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":4147298,"symbol":"_PaddingLayout.sizeThatFits(in:context:child:)","symbolLocation":187,"imageIndex":0},{"imageOffset":4148107,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout","symbolLocation":49,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":4147298,"symbol":"_PaddingLayout.sizeThatFits(in:context:child:)","symbolLocation":187,"imageIndex":0},{"imageOffset":4148107,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout","symbolLocation":49,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":4169938,"symbol":"_AlignmentLayout.sizeThatFits(in:context:child:)","symbolLocation":138,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5120536,"symbol":"_FlexFrameLayout.sizeThatFits(in:context:child:)","symbolLocation":501,"imageIndex":0},{"imageOffset":5121752,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout","symbolLocation":46,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":2654566,"symbol":"RootGeometry.value.getter","symbolLocation":299,"imageIndex":0},{"imageOffset":1186942,"symbol":"specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":28,"imageIndex":0},{"imageOffset":1282439,"symbol":"partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":22359,"symbol":"AG::Graph::UpdateStack::update()","symbolLocation":559,"imageIndex":1},{"imageOffset":23895,"symbol":"AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int)","symbolLocation":421,"imageIndex":1},{"imageOffset":66398,"symbol":"AG::Subgraph::update(unsigned int)","symbolLocation":904,"imageIndex":1},{"imageOffset":12793003,"symbol":"GraphHost.flushTransactions()","symbolLocation":495,"imageIndex":0},{"imageOffset":12796676,"symbol":"closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:)","symbolLocation":15,"imageIndex":0},{"imageOffset":2655914,"symbol":"partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":17,"imageIndex":0},{"imageOffset":11115688,"symbol":"closure #1 in ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":69,"imageIndex":0},{"imageOffset":11110623,"symbol":"ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":78,"imageIndex":0},{"imageOffset":11168976,"symbol":"protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":0},{"imageOffset":2626212,"symbol":"ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":55,"imageIndex":0},{"imageOffset":2655715,"symbol":"protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":0},{"imageOffset":12796640,"symbol":"closure #1 in GraphHost.init(data:)","symbolLocation":122,"imageIndex":0},{"imageOffset":2661948,"symbol":"thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":12,"imageIndex":0},{"imageOffset":11637339,"symbol":"partial apply for thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":17,"imageIndex":0},{"imageOffset":11627296,"symbol":"static NSRunLoop.flushObservers()","symbolLocation":118,"imageIndex":0},{"imageOffset":11637208,"symbol":"closure #1 in closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":16,"imageIndex":0},{"imageOffset":11613974,"symbol":"specialized thunk for @callee_guaranteed () -> (@error @owned Error)","symbolLocation":14,"imageIndex":0},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":11637184,"symbol":"closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":35,"imageIndex":0},{"imageOffset":11637253,"symbol":"@objc closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":43,"imageIndex":0},{"imageOffset":521296,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__","symbolLocation":23,"imageIndex":3},{"imageOffset":520930,"symbol":"__CFRunLoopDoObservers","symbolLocation":543,"imageIndex":3},{"imageOffset":518295,"symbol":"__CFRunLoopRun","symbolLocation":1131,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":4},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":4},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":4},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":5},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":5},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":5},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":5},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":0},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":0},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":0},{"imageOffset":17503155,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":6,"symbolLocation":35},{"imageOffset":17503289,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":6},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":7}]},{"id":256066,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":8},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":8},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":3},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":256084,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":8},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":8},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":3},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":2394468,"imageIndex":10},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":11},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":256085,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":8},{"imageOffset":15243849,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15284591,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15286212,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15247099,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15284328,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15139638,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15143839,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15082274,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":50},{"imageOffset":15082359,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":6},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":12},{"imageOffset":15081962,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":346},{"imageOffset":15133517,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15107188,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15060270,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15073620,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15027426,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15027500,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15027337,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15056303,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14670536,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14672410,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14697715,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15287231,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15298351,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15298537,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":256086,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":8},{"imageOffset":15243849,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15284591,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15286212,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15247099,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15284328,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15139638,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15143839,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15082274,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":50},{"imageOffset":15082359,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":6},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":12},{"imageOffset":15081962,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":346},{"imageOffset":15133517,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15107188,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15060270,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15073620,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15027426,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15027500,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15027337,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15056303,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14670536,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14672410,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14697715,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15287231,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15298351,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15298537,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":256087,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":8},{"imageOffset":15243849,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15284591,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15286212,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15247099,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15284328,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15139638,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15143839,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15082274,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":50},{"imageOffset":15082359,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":6},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":12},{"imageOffset":15081962,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":346},{"imageOffset":15133517,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15107188,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15060270,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15073620,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15027426,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15027500,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15027337,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15056303,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14670536,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14672410,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14697715,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15287231,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15298351,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15298537,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":256088,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":8},{"imageOffset":15243849,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15284591,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15286212,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15247099,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15284328,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15139638,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15143839,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15082274,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":50},{"imageOffset":15082359,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":6},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":12},{"imageOffset":15081962,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":346},{"imageOffset":15133517,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15107188,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15060270,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15073620,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15027426,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15027500,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15027337,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15056303,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14670536,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14672410,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14697715,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15287231,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15298351,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15298537,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":256089,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":8},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14707135,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14710926,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15287231,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15298351,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15298537,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":256090,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":8},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14707135,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14710926,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15287231,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15298351,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15298537,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":256091,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":8},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14707135,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14710926,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15287231,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15298351,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15298537,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":256092,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":8},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14707135,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14710926,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15287231,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15298351,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15298537,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]},{"id":256142,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":256158,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":256189,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":256225,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":256228,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":256229,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":256234,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":256256,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":256257,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":256258,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":9}]},{"id":256267,"name":"com.apple.NSScrollingConcurrentVBLMonitor","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":8},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":8},{"imageOffset":5627720,"symbol":"NSWaitUntilHostTime","symbolLocation":102,"imageIndex":5},{"imageOffset":10096801,"symbol":"run_monitor_thread","symbolLocation":579,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":9},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":9}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140707858731008,
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
    "base" : 140707874066432,
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
    "base" : 140703725420544,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703373619200,
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
    "base" : 140703521476608,
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
    "base" : 140703418175488,
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
    "base" : 4404637696,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 32866304,
    "uuid" : "4ea9e2b7-86a9-3992-a33c-843bbf21cced",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4648210432,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703373074432,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703373303808,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703451623424,
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
    "base" : 140703388811264,
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
    "base" : 140703596404736,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703371513856,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703370043392,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=169.9M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=169.9M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               384K        3 \nActivity Tracing                   256K        1 \nCG backing stores                  528K        4 \nCG image                            24K        4 \nCG raster data                      20K        2 \nColorSync                          232K       28 \nCoreAnimation                      600K       85 \nCoreGraphics                         4K        1 \nCoreUI image data                  660K        9 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nIOKit                             7940K        1 \nImage IO                           592K        2 \nKernel Alloc Once                    8K        1 \nMALLOC                            75.6M       82 \nMALLOC guard page                   48K       10 \nSQLite page cache                  448K        7 \nSTACK GUARD                       56.1M       22 \nStack                             18.7M       22 \nVM_ALLOCATE                       3136K       15 \n__CTF                               756        1 \n__DATA                            55.0M      602 \n__DATA_CONST                      33.3M      408 \n__DATA_DIRTY                      1652K      204 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       707.9M       83 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           583.6M      607 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      163.4M       33 \nshared memory                     2820K       19 \n===========                     =======  ======= \nTOTAL                              1.8G     2306 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.main-thread"
  }
},
  "trialInfo" : {
  "rollouts" : [
    {
      "rolloutId" : "6297d96be2c9387df974efa4",
      "factorPackIds" : {

      },
      "deploymentId" : 240000032
    },
    {
      "rolloutId" : "60da5e84ab0ca017dace9abf",
      "factorPackIds" : {

      },
      "deploymentId" : 240000008
    }
  ],
  "experiments" : [

  ]
}
}

Model: MacBookAir7,1, BootROM 489.0.0.0.0, 2 processors, Dual-Core Intel Core i5, 1.6 GHz, 4 GB, SMC 2.26f2
Graphics: Intel HD Graphics 6000, Intel HD Graphics 6000, Built-In
Display: Color LCD, 1366 x 768 (WSGA - Wide eXtended Graphics Array), Main, MirrorOff, Online
Memory Module: BANK 0/DIMM0, 2 GB, DDR3, 1600 MHz, 0x80CE, 0x4B3445384533303445452D45474345000000
Memory Module: BANK 1/DIMM0, 2 GB, DDR3, 1600 MHz, 0x80CE, 0x4B3445384533303445452D45474345000000
AirPort: spairport_wireless_card_type_wifi (0x14E4, 0x117), Broadcom BCM43xx 1.0 (7.77.111.1 AirPortDriverBrcmNIC-1710.4)
AirPort:
Bluetooth: Version (null), 0 services, 0 devices, 0 incoming serial ports
Network Service: Wi-Fi, AirPort, en0
USB Device: USB30Bus
USB Device: BRCM20702 Hub
USB Device: Bluetooth USB Host Controller
Thunderbolt Bus: MacBook Air, Apple Inc., 27.2
