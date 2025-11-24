-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [22949]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [22869]
Responsible:           Terminal [17558]
User ID:               501

Date/Time:             2025-11-23 16:26:50.4853 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        24F646B6-E55A-DF4C-178D-891130B3FBCE

Sleep/Wake UUID:       1369CF6C-5420-4338-B0CB-84715F5B5831

Time Awake Since Boot: 17000 seconds
Time Since Wake:       38 seconds

System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 4 Illegal instruction: 4
Terminating Process:   exc handler [22949]

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   SwiftUI                       	    0x7ff91eddaf26 validateDimension #1 (min:ideal:max:) in NSView.intrinsicLayoutTraits() + 224
1   SwiftUI                       	    0x7ff91edda3c1 NSView.intrinsicLayoutTraits() + 140
2   SwiftUI                       	    0x7ff91edda283 PlatformViewHost.updateLayoutTraits() + 266
3   SwiftUI                       	    0x7ff91eec0dea closure #1 in ViewLeafView.layoutTraits() + 146
4   SwiftUI                       	    0x7ff91eec0d45 ViewLeafView.layoutTraits() + 43
5   SwiftUI                       	    0x7ff91eec0bf9 closure #1 in ViewLeafView.sizeThatFits(in:) + 143
6   SwiftUI                       	    0x7ff91eec0a85 ViewLeafView.sizeThatFits(in:) + 185
7   SwiftUI                       	    0x7ff91e7a86a8 closure #1 in LeafLayoutEngine.sizeThatFits(_:) + 55
8   SwiftUI                       	    0x7ff91e7a8582 LeafLayoutEngine.sizeThatFits(_:) + 411
9   SwiftUI                       	    0x7ff91e95f073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
10  SwiftUI                       	    0x7ff91e96967f AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:) + 53
11  SwiftUI                       	    0x7ff91e9697b6 protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine + 47
12  SwiftUI                       	    0x7ff91e95f073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
13  SwiftUI                       	    0x7ff91e96967f AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:) + 53
14  SwiftUI                       	    0x7ff91e9697b6 protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine + 47
15  SwiftUI                       	    0x7ff91e95f073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
16  SwiftUI                       	    0x7ff91f0e57f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
17  SwiftUI                       	    0x7ff91f0e5bb7 specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:) + 167
18  SwiftUI                       	    0x7ff91f0e75f3 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 105
19  SwiftUI                       	    0x7ff91f0e4fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
20  SwiftUI                       	    0x7ff91f0e437f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
21  SwiftUI                       	    0x7ff91f0e41d4 StackLayout.Storage.sizeThatFits(_:) + 124
22  SwiftUI                       	    0x7ff91e95eca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
23  SwiftUI                       	    0x7ff91f0e6af1 StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 1634
24  SwiftUI                       	    0x7ff91f0e616f specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130
25  SwiftUI                       	    0x7ff91f0e7619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
26  SwiftUI                       	    0x7ff91f0e4fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
27  SwiftUI                       	    0x7ff91f0e437f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
28  SwiftUI                       	    0x7ff91f0e41d4 StackLayout.Storage.sizeThatFits(_:) + 124
29  SwiftUI                       	    0x7ff91e86e862 _PaddingLayout.sizeThatFits(in:context:child:) + 187
30  SwiftUI                       	    0x7ff91e86eb8b protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout + 49
31  SwiftUI                       	    0x7ff91ed1068a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
32  SwiftUI                       	    0x7ff91ed10556 UnaryLayoutEngine.sizeThatFits(_:) + 512
33  SwiftUI                       	    0x7ff91e95f073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
34  SwiftUI                       	    0x7ff91f0e57f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
35  SwiftUI                       	    0x7ff91f0e5bb7 specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:) + 167
36  SwiftUI                       	    0x7ff91f0e75f3 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 105
37  SwiftUI                       	    0x7ff91f0e4fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
38  SwiftUI                       	    0x7ff91f0e437f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
39  SwiftUI                       	    0x7ff91f0e41d4 StackLayout.Storage.sizeThatFits(_:) + 124
40  SwiftUI                       	    0x7ff91e86e862 _PaddingLayout.sizeThatFits(in:context:child:) + 187
41  SwiftUI                       	    0x7ff91e86eb8b protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout + 49
42  SwiftUI                       	    0x7ff91ed1068a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
43  SwiftUI                       	    0x7ff91ed10556 UnaryLayoutEngine.sizeThatFits(_:) + 512
44  SwiftUI                       	    0x7ff91e95f073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
45  SwiftUI                       	    0x7ff91f0e57f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
46  SwiftUI                       	    0x7ff91f0e5bb7 specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:) + 167
47  SwiftUI                       	    0x7ff91f0e75f3 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 105
48  SwiftUI                       	    0x7ff91f0e4fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
49  SwiftUI                       	    0x7ff91f0e437f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
50  SwiftUI                       	    0x7ff91f0e41d4 StackLayout.Storage.sizeThatFits(_:) + 124
51  SwiftUI                       	    0x7ff91f0e57f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
52  SwiftUI                       	    0x7ff91f0e5bb7 specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:) + 167
53  SwiftUI                       	    0x7ff91f0e75f3 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 105
54  SwiftUI                       	    0x7ff91f0e4fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
55  SwiftUI                       	    0x7ff91f0e437f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
56  SwiftUI                       	    0x7ff91f0e41d4 StackLayout.Storage.sizeThatFits(_:) + 124
57  SwiftUI                       	    0x7ff91e86e862 _PaddingLayout.sizeThatFits(in:context:child:) + 187
58  SwiftUI                       	    0x7ff91e86eb8b protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout + 49
59  SwiftUI                       	    0x7ff91ed1068a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
60  SwiftUI                       	    0x7ff91ed10556 UnaryLayoutEngine.sizeThatFits(_:) + 512
61  SwiftUI                       	    0x7ff91e95f073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
62  SwiftUI                       	    0x7ff91e95c218 _FlexFrameLayout.sizeThatFits(in:context:child:) + 501
63  SwiftUI                       	    0x7ff91e95c6d8 protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout + 46
64  SwiftUI                       	    0x7ff91ed1068a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
65  SwiftUI                       	    0x7ff91ed10556 UnaryLayoutEngine.sizeThatFits(_:) + 512
66  SwiftUI                       	    0x7ff91e95f073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
67  SwiftUI                       	    0x7ff91e722d49 static ScrollViewUtilities.sizeThatFits(in:contentComputer:axes:) + 214
68  SwiftUI                       	    0x7ff91ecc70c9 closure #1 in SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:) + 196
69  SwiftUI                       	    0x7ff91ecc6eef SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:) + 470
70  SwiftUI                       	    0x7ff91e95f073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
71  SwiftUI                       	    0x7ff91e95c218 _FlexFrameLayout.sizeThatFits(in:context:child:) + 501
72  SwiftUI                       	    0x7ff91e95c6d8 protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout + 46
73  SwiftUI                       	    0x7ff91ed1068a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
74  SwiftUI                       	    0x7ff91ed10556 UnaryLayoutEngine.sizeThatFits(_:) + 512
75  SwiftUI                       	    0x7ff91e95f073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
76  SwiftUI                       	    0x7ff91f0e57f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
77  SwiftUI                       	    0x7ff91f0e63e2 specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 757
78  SwiftUI                       	    0x7ff91f0e7619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
79  SwiftUI                       	    0x7ff91f0e4fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
80  SwiftUI                       	    0x7ff91f0e437f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
81  SwiftUI                       	    0x7ff91f0e41d4 StackLayout.Storage.sizeThatFits(_:) + 124
82  SwiftUI                       	    0x7ff91e95c218 _FlexFrameLayout.sizeThatFits(in:context:child:) + 501
83  SwiftUI                       	    0x7ff91e95c6d8 protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout + 46
84  SwiftUI                       	    0x7ff91ed1068a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
85  SwiftUI                       	    0x7ff91ed10556 UnaryLayoutEngine.sizeThatFits(_:) + 512
86  SwiftUI                       	    0x7ff91e95f073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
87  SwiftUI                       	    0x7ff91e702166 RootGeometry.value.getter + 299
88  SwiftUI                       	    0x7ff91e59bc7e specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 28
89  SwiftUI                       	    0x7ff91e5b3187 partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 20
90  AttributeGraph                	    0x7ff91f31f757 AG::Graph::UpdateStack::update() + 559
91  AttributeGraph                	    0x7ff91f31fd57 AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421
92  AttributeGraph                	    0x7ff91f32a35e AG::Subgraph::update(unsigned int) + 904
93  SwiftUI                       	    0x7ff91f0ad4ab GraphHost.flushTransactions() + 495
94  SwiftUI                       	    0x7ff91f0ae304 closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:) + 15
95  SwiftUI                       	    0x7ff91e7026aa partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:) + 17
96  SwiftUI                       	    0x7ff91ef13ca8 closure #1 in ViewRendererHost.updateViewGraph<A>(body:) + 69
97  SwiftUI                       	    0x7ff91ef128df ViewRendererHost.updateViewGraph<A>(body:) + 78
98  SwiftUI                       	    0x7ff91ef20cd0 protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1> + 25
99  SwiftUI                       	    0x7ff91e6fb2a4 ViewGraphDelegate.updateGraph<A>(body:) + 55
100 SwiftUI                       	    0x7ff91e7025e3 protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1> + 25
101 SwiftUI                       	    0x7ff91f0ae2e0 closure #1 in GraphHost.init(data:) + 122
102 SwiftUI                       	    0x7ff91e703e3c thunk for @escaping @callee_guaranteed () -> () + 12
103 SwiftUI                       	    0x7ff91ef9325b partial apply for thunk for @escaping @callee_guaranteed () -> () + 17
104 SwiftUI                       	    0x7ff91ef90b20 static NSRunLoop.flushObservers() + 118
105 SwiftUI                       	    0x7ff91ef931d8 closure #1 in closure #1 in static NSRunLoop.addObserver(_:) + 16
106 SwiftUI                       	    0x7ff91ef8d716 specialized thunk for @callee_guaranteed () -> (@error @owned Error) + 14
107 libswiftObjectiveC.dylib      	    0x7ff827ea5e7c autoreleasepool<A>(invoking:) + 44
108 SwiftUI                       	    0x7ff91ef931c0 closure #1 in static NSRunLoop.addObserver(_:) + 35
109 SwiftUI                       	    0x7ff91ef93205 @objc closure #1 in static NSRunLoop.addObserver(_:) + 43
110 CoreFoundation                	    0x7ff812fa3450 __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
111 CoreFoundation                	    0x7ff812fa32e2 __CFRunLoopDoObservers + 543
112 CoreFoundation                	    0x7ff812fa2897 __CFRunLoopRun + 1131
113 CoreFoundation                	    0x7ff812fa1d6c CFRunLoopRunSpecific + 562
114 HIToolbox                     	    0x7ff81bc545e6 RunCurrentEventLoopInMode + 292
115 HIToolbox                     	    0x7ff81bc5434a ReceiveNextEventCommon + 594
116 HIToolbox                     	    0x7ff81bc540e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
117 AppKit                        	    0x7ff8159e0aa9 _DPSNextEvent + 927
118 AppKit                        	    0x7ff8159df166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
119 AppKit                        	    0x7ff8159d1818 -[NSApplication run] + 586
120 AppKit                        	    0x7ff8159a579a NSApplicationMain + 817
121 SwiftUI                       	    0x7ff91e4f609c specialized runApp(_:) + 161
122 SwiftUI                       	    0x7ff91ef58424 runApp<A>(_:) + 164
123 SwiftUI                       	    0x7ff91ea50c5f static App.main() + 63
124 RedLemon                      	       0x10ea91a23 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
125 RedLemon                      	       0x10ea91aa9 RedLemon_main + 9
126 dyld                          	       0x11c7c952e start + 462

Thread 1:
0   libsystem_pthread.dylib       	    0x7ff812ed8f48 start_wqthread + 0

Thread 2:
0   libsystem_pthread.dylib       	    0x7ff812ed8f48 start_wqthread + 0

Thread 3:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff812ea093a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff812ea0ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff812fa429d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff812fa2928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff812fa1d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff815b4e572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff812edd4e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff812ed8f6b thread_start + 15

Thread 4:
0   libsystem_pthread.dylib       	    0x7ff812ed8f48 start_wqthread + 0

Thread 5:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff812ea093a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff812ea0ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff812fa429d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff812fa2928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff812fa1d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff817bd0964 0x7ff817988000 + 2394468
6   Foundation                    	    0x7ff813df9724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff812edd4e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff812ed8f6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff812ea530e kevent + 10
1   RedLemon                      	       0x10e87c7c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10e8866ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10e886d44 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10e87d47b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10e8865e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10e8630b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10e86411f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10e854fe3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10e8618cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10e85b1f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10e84faae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10e852ed4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10e847a62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10e847aac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff827ea5e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10e847a09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10e84eb2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10e7f0848 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10e7f0f9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10e7f7273 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10e88713f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10e889caf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10e889d69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff812edd4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff812ed8f6b thread_start + 15

Thread 7:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff812ea530e kevent + 10
1   RedLemon                      	       0x10e87c7c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10e8866ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10e886d44 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10e87d47b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10e8865e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10e8630b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10e86411f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10e8550a2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10e8550f7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff8204b672c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10e854f6a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10e8618cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10e85b1f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10e84faae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10e852ed4 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10e847a62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10e847aac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff827ea5e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10e847a09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10e84eb2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10e7f0848 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10e7f0f9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10e7f7273 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10e88713f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10e889caf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10e889d69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff812edd4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff812ed8f6b thread_start + 15

Thread 8:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff812ea530e kevent + 10
1   RedLemon                      	       0x10e87c7c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10e8866ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10e886d44 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10e87d47b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10e8865e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10e8630b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10e86411f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10e854fe3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10e8618cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10e85b1f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10e84faae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10e852ed4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10e847a62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10e847aac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff827ea5e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10e847a09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10e84eb2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10e7f0848 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10e7f0f9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10e7f7273 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10e88713f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10e889caf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10e889d69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff812edd4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff812ed8f6b thread_start + 15

Thread 9:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff812ea530e kevent + 10
1   RedLemon                      	       0x10e87c7c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10e8866ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10e886d44 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10e87d47b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10e8865e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10e8630b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10e86411f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10e854fe3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10e8618cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10e85b1f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10e84faae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10e852ed4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10e847a62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10e847aac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff827ea5e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10e847a09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10e84eb2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10e7f0848 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10e7f0f9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10e7f7273 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10e88713f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10e889caf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10e889d69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff812edd4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff812ed8f6b thread_start + 15

Thread 10:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff812ea0976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff812d257ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff812d25c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10e7f973f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10e7fa60e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10e88713f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10e889caf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10e889d69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff812edd4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff812ed8f6b thread_start + 15

Thread 11:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff812ea0976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff812d257ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff812d25c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10e7f973f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10e7fa60e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10e88713f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10e889caf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10e889d69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff812edd4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff812ed8f6b thread_start + 15

Thread 12:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff812ea0976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff812d257ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff812d25c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10e7f973f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10e7fa60e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10e88713f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10e889caf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10e889d69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff812edd4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff812ed8f6b thread_start + 15

Thread 13:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff812ea0976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff812d257ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff812d25c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10e7f973f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10e7fa60e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10e88713f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10e889caf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10e889d69 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff812edd4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff812ed8f6b thread_start + 15

Thread 14:
0   libsystem_pthread.dylib       	    0x7ff812ed8f48 start_wqthread + 0

Thread 15:
0   libsystem_pthread.dylib       	    0x7ff812ed8f48 start_wqthread + 0

Thread 16:
0   libsystem_pthread.dylib       	    0x7ff812ed8f48 start_wqthread + 0


Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x031dfff854bb0501  rbx: 0x00007fb65a310500  rcx: 0x0080000000000001  rdx: 0x0100000000000000
  rdi: 0x00007fb65a310500  rsi: 0x021dfff854bb0531  rbp: 0x00007ff7b2508590  rsp: 0x00007ff7b2508530
   r8: 0x0000000000000010   r9: 0x0f0f0f0f0f0f0f0f  r10: 0x00007ff8544c3d38  r11: 0x00007ff813dd2c50
  r12: 0x00007ff7b25085a0  r13: 0x00007fb65a310500  r14: 0x00007ff7b25085b0  r15: 0x00007ff7b2508630
  rip: 0x00007ff91eddaf26  rfl: 0x0000000000010203  cr2: 0x0000000000000000

Logical CPU:     1
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
    0x7ff91e47a000 -     0x7ff91f319fff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
    0x7ff91f31a000 -     0x7ff91f350fff com.apple.AttributeGraph (3.2.1) <e9337c46-2775-39dc-ae3d-14ccf80d629f> /System/Library/PrivateFrameworks/AttributeGraph.framework/Versions/A/AttributeGraph
    0x7ff827ea5000 -     0x7ff827ea6fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff812f24000 -     0x7ff813426fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff81bc26000 -     0x7ff81bf19fff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff8159a2000 -     0x7ff816831fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x10d9f2000 -        0x10f82dfff com.redlemon.app (1.0.14) <a8471777-c594-3919-b7ea-ea26e519282e> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x11c7c4000 -        0x11c82ffff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff812ed7000 -     0x7ff812ee2fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff812e9f000 -     0x7ff812ed6fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff817988000 -     0x7ff817e16fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff813da1000 -     0x7ff81415dfff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff82039b000 -     0x7ff820814fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff812d22000 -     0x7ff812d68fff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib

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
Writable regions: Total=654.6M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=654.6M(100%)

                                VIRTUAL   REGION
REGION TYPE                        SIZE    COUNT (non-coalesced)
===========                     =======  =======
Accelerate framework               384K        3
Activity Tracing                   256K        1
CG backing stores                  528K        4
CG image                            76K        7
CG raster data                      32K        2
ColorSync                          232K       28
CoreAnimation                     1344K       80
CoreGraphics                         4K        1
CoreUI image data                  536K        7
Foundation                          16K        1
Image IO                           164K        2
Kernel Alloc Once                    8K        1
MALLOC                           207.3M       92
MALLOC guard page                   64K       13
MALLOC_NANO (reserved)           384.0M        1         reserved VM address space (unallocated)
SQLite page cache                  960K       15
STACK GUARD                       56.1M       17
Stack                             16.1M       17
VM_ALLOCATE                       12.1M       15
__CTF                               756        1
__DATA                            54.4M      600
__DATA_CONST                      33.2M      406
__DATA_DIRTY                      1650K      203
__FONT_DATA                          4K        1
__LINKEDIT                       705.7M       81
__OBJC_RO                         82.9M        1
__OBJC_RW                         3200K        2
__TEXT                           580.6M      605
__UNICODE                          592K        1
dyld private memory               1024K        1
libnetwork                         128K        8
mapped file                      336.1M       32
shared memory                     9984K       21
===========                     =======  =======
TOTAL                              2.4G     2270
TOTAL, minus reserved VM space     2.1G     2270



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-11-23 16:26:50.00 -0500","app_version":"1.0.14","slice_uuid":"a8471777-c594-3919-b7ea-ea26e519282e","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"C56A9951-2AE9-4A88-BFB5-FBF3439CD1A7","name":"RedLemon"}
{
  "uptime" : 17000,
  "procLaunch" : "2025-11-23 16:26:30.7553 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookAir7,1",
  "procStartAbsTime" : 17782768659490,
  "coalitionID" : 1128,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-11-23 16:26:50.4853 -0500",
  "incident" : "C56A9951-2AE9-4A88-BFB5-FBF3439CD1A7",
  "bug_type" : "309",
  "pid" : 22949,
  "procExitAbsTime" : 17802481398246,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"DE7DE55C-FAC2-51DA-92D1-22902ED1697D","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 22869,
  "coalitionName" : "com.apple.Terminal",
  "crashReporterKey" : "24F646B6-E55A-DF4C-178D-891130B3FBCE",
  "responsiblePid" : 17558,
  "responsibleProc" : "Terminal",
  "wakeTime" : 38,
  "sleepWakeUUID" : "1369CF6C-5420-4338-B0CB-84715F5B5831",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_INSTRUCTION","signal":"SIGILL"},
  "termination" : {"flags":0,"code":4,"namespace":"SIGNAL","indicator":"Illegal instruction: 4","byProc":"exc handler","byPid":22949},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 0,
  "threads" : [{"triggered":true,"id":147095,"instructionState":{"instructionStream":{"bytes":[22,167,50,0,115,10,102,15,46,196,118,86,49,192,235,13,102,15,46,196,118,76,102,15,46,198,15,151,192,102,15,46,238,114,61,102,15,46,230,114,57,102,15,46,236,15,147,193,32,200,60,1,117,44,102,15,40,198,102,15,40,204,102,15,40,213,232,57,202,163,255,15,40,69,208,15,40,77,192,15,40,85,176,72,131,196,64,91,65,93,65,94,65,95,93,195,15,11,76,141,109,160,73,131,101,0,0,72,184,0,0,0,0,0,0,0,224,73,137,69,8,106,103,95,232,89,104,50,0,65,15,16,69,0,65,15,17,69,0,72,139,53,200,28,244,54,72,137,223,232,0,120,50,0,72,137,199,232,64,120,50,0,72,137,195,72,137,199,232,219,95,50,0,73,137,198,73,137,215,72,137,223,255,21,22,135,9,56,76,141,109,160],"offset":96}},"threadState":{"r13":{"value":140421173937408},"rax":{"value":224616998476907777},"rflags":{"value":66051},"cpu":{"value":1},"r14":{"value":140701825271216},"rsi":{"value":152559404438979889},"r8":{"value":16},"cr2":{"value":0},"rdx":{"value":72057594037927936},"r10":{"value":140704542899512,"symbolLocation":0,"symbol":"OBJC_METACLASS_$_NSThread"},"r9":{"value":1085102592571150095},"r15":{"value":140701825271344},"rbx":{"value":140421173937408},"trap":{"value":6},"err":{"value":0},"r11":{"value":140703461878864,"symbolLocation":0,"symbol":"+[NSThread isMainThread]"},"rip":{"value":140707941429030,"matchesCrashFrame":1},"rbp":{"value":140701825271184},"rsp":{"value":140701825271088},"r12":{"value":140701825271200},"rcx":{"value":36028797018963969},"flavor":"x86_THREAD_STATE","rdi":{"value":140421173937408}},"queue":"com.apple.main-thread","frames":[{"imageOffset":9834278,"symbol":"validateDimension #1 (min:ideal:max:) in NSView.intrinsicLayoutTraits()","symbolLocation":224,"imageIndex":0},{"imageOffset":9831361,"symbol":"NSView.intrinsicLayoutTraits()","symbolLocation":140,"imageIndex":0},{"imageOffset":9831043,"symbol":"PlatformViewHost.updateLayoutTraits()","symbolLocation":266,"imageIndex":0},{"imageOffset":10776042,"symbol":"closure #1 in ViewLeafView.layoutTraits()","symbolLocation":146,"imageIndex":0},{"imageOffset":10775877,"symbol":"ViewLeafView.layoutTraits()","symbolLocation":43,"imageIndex":0},{"imageOffset":10775545,"symbol":"closure #1 in ViewLeafView.sizeThatFits(in:)","symbolLocation":143,"imageIndex":0},{"imageOffset":10775173,"symbol":"ViewLeafView.sizeThatFits(in:)","symbolLocation":185,"imageIndex":0},{"imageOffset":3335848,"symbol":"closure #1 in LeafLayoutEngine.sizeThatFits(_:)","symbolLocation":55,"imageIndex":0},{"imageOffset":3335554,"symbol":"LeafLayoutEngine.sizeThatFits(_:)","symbolLocation":411,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5174911,"symbol":"AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:)","symbolLocation":53,"imageIndex":0},{"imageOffset":5175222,"symbol":"protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine","symbolLocation":47,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5174911,"symbol":"AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:)","symbolLocation":53,"imageIndex":0},{"imageOffset":5175222,"symbol":"protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine","symbolLocation":47,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13024183,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:)","symbolLocation":167,"imageIndex":0},{"imageOffset":13030899,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":105,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":13028081,"symbol":"StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:)","symbolLocation":1634,"imageIndex":0},{"imageOffset":13025647,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":130,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":4147298,"symbol":"_PaddingLayout.sizeThatFits(in:context:child:)","symbolLocation":187,"imageIndex":0},{"imageOffset":4148107,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout","symbolLocation":49,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13024183,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:)","symbolLocation":167,"imageIndex":0},{"imageOffset":13030899,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":105,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":4147298,"symbol":"_PaddingLayout.sizeThatFits(in:context:child:)","symbolLocation":187,"imageIndex":0},{"imageOffset":4148107,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout","symbolLocation":49,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13024183,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:)","symbolLocation":167,"imageIndex":0},{"imageOffset":13030899,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":105,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13024183,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:)","symbolLocation":167,"imageIndex":0},{"imageOffset":13030899,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":105,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":4147298,"symbol":"_PaddingLayout.sizeThatFits(in:context:child:)","symbolLocation":187,"imageIndex":0},{"imageOffset":4148107,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout","symbolLocation":49,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5120536,"symbol":"_FlexFrameLayout.sizeThatFits(in:context:child:)","symbolLocation":501,"imageIndex":0},{"imageOffset":5121752,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout","symbolLocation":46,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":2788681,"symbol":"static ScrollViewUtilities.sizeThatFits(in:contentComputer:axes:)","symbolLocation":214,"imageIndex":0},{"imageOffset":8704201,"symbol":"closure #1 in SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:)","symbolLocation":196,"imageIndex":0},{"imageOffset":8703727,"symbol":"SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:)","symbolLocation":470,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5120536,"symbol":"_FlexFrameLayout.sizeThatFits(in:context:child:)","symbolLocation":501,"imageIndex":0},{"imageOffset":5121752,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout","symbolLocation":46,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13026274,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":757,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":5120536,"symbol":"_FlexFrameLayout.sizeThatFits(in:context:child:)","symbolLocation":501,"imageIndex":0},{"imageOffset":5121752,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout","symbolLocation":46,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":2654566,"symbol":"RootGeometry.value.getter","symbolLocation":299,"imageIndex":0},{"imageOffset":1186942,"symbol":"specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":28,"imageIndex":0},{"imageOffset":1282439,"symbol":"partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":22359,"symbol":"AG::Graph::UpdateStack::update()","symbolLocation":559,"imageIndex":1},{"imageOffset":23895,"symbol":"AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int)","symbolLocation":421,"imageIndex":1},{"imageOffset":66398,"symbol":"AG::Subgraph::update(unsigned int)","symbolLocation":904,"imageIndex":1},{"imageOffset":12793003,"symbol":"GraphHost.flushTransactions()","symbolLocation":495,"imageIndex":0},{"imageOffset":12796676,"symbol":"closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:)","symbolLocation":15,"imageIndex":0},{"imageOffset":2655914,"symbol":"partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":17,"imageIndex":0},{"imageOffset":11115688,"symbol":"closure #1 in ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":69,"imageIndex":0},{"imageOffset":11110623,"symbol":"ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":78,"imageIndex":0},{"imageOffset":11168976,"symbol":"protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":0},{"imageOffset":2626212,"symbol":"ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":55,"imageIndex":0},{"imageOffset":2655715,"symbol":"protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":0},{"imageOffset":12796640,"symbol":"closure #1 in GraphHost.init(data:)","symbolLocation":122,"imageIndex":0},{"imageOffset":2661948,"symbol":"thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":12,"imageIndex":0},{"imageOffset":11637339,"symbol":"partial apply for thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":17,"imageIndex":0},{"imageOffset":11627296,"symbol":"static NSRunLoop.flushObservers()","symbolLocation":118,"imageIndex":0},{"imageOffset":11637208,"symbol":"closure #1 in closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":16,"imageIndex":0},{"imageOffset":11613974,"symbol":"specialized thunk for @callee_guaranteed () -> (@error @owned Error)","symbolLocation":14,"imageIndex":0},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":11637184,"symbol":"closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":35,"imageIndex":0},{"imageOffset":11637253,"symbol":"@objc closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":43,"imageIndex":0},{"imageOffset":521296,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__","symbolLocation":23,"imageIndex":3},{"imageOffset":520930,"symbol":"__CFRunLoopDoObservers","symbolLocation":543,"imageIndex":3},{"imageOffset":518295,"symbol":"__CFRunLoopRun","symbolLocation":1131,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":4},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":4},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":4},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":5},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":5},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":5},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":5},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":0},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":0},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":0},{"imageOffset":17431075,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":6,"symbolLocation":35},{"imageOffset":17431209,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":6},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":7}]},{"id":147216,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":147233,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":147253,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":9},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":3},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":147273,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":147288,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":9},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":3},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":2394468,"imageIndex":10},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":11},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":147295,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15247305,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15288047,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15289668,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15250555,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15287784,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15143094,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15147295,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15085539,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":467},{"imageOffset":15136973,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15110644,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15063726,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15077076,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15030882,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15030956,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15030793,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15059759,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14673992,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14675866,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14701171,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15290687,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15301807,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15301993,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":147296,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15247305,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15288047,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15289668,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15250555,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15287784,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15143094,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15147295,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15085730,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":50},{"imageOffset":15085815,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":6},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":12},{"imageOffset":15085418,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":346},{"imageOffset":15136973,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15110644,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15063726,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15077076,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15030882,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15030956,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15030793,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15059759,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14673992,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14675866,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14701171,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15290687,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15301807,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15301993,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":147297,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15247305,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15288047,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15289668,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15250555,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15287784,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15143094,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15147295,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15085539,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":467},{"imageOffset":15136973,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15110644,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15063726,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15077076,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15030882,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15030956,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15030793,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15059759,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14673992,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14675866,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14701171,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15290687,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15301807,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15301993,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":147298,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15247305,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15288047,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15289668,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15250555,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15287784,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15143094,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15147295,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15085539,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":467},{"imageOffset":15136973,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15110644,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15063726,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15077076,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15030882,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15030956,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15030793,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15059759,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14673992,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14675866,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14701171,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15290687,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15301807,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15301993,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":147299,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14710591,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14714382,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15290687,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15301807,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15301993,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":147300,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14710591,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14714382,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15290687,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15301807,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15301993,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":147301,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14710591,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14714382,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15290687,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15301807,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15301993,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":147302,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14710591,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14714382,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15290687,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15301807,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15301993,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":147368,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":147373,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":147374,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140707931594752,
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
    "base" : 140707946930176,
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
    "base" : 140703798284288,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703446482944,
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
    "base" : 140703594340352,
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
    "base" : 140703491039232,
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
    "base" : 4523499520,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 31703040,
    "uuid" : "a8471777-c594-3919-b7ea-ea26e519282e",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4772872192,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703446167552,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703445938176,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703524487168,
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
    "base" : 140703461675008,
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
    "base" : 140703669268480,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703444377600,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703442907136,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=654.6M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=654.6M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               384K        3 \nActivity Tracing                   256K        1 \nCG backing stores                  528K        4 \nCG image                            76K        7 \nCG raster data                      32K        2 \nColorSync                          232K       28 \nCoreAnimation                     1344K       80 \nCoreGraphics                         4K        1 \nCoreUI image data                  536K        7 \nFoundation                          16K        1 \nImage IO                           164K        2 \nKernel Alloc Once                    8K        1 \nMALLOC                           207.3M       92 \nMALLOC guard page                   64K       13 \nMALLOC_NANO (reserved)           384.0M        1         reserved VM address space (unallocated)\nSQLite page cache                  960K       15 \nSTACK GUARD                       56.1M       17 \nStack                             16.1M       17 \nVM_ALLOCATE                       12.1M       15 \n__CTF                               756        1 \n__DATA                            54.4M      600 \n__DATA_CONST                      33.2M      406 \n__DATA_DIRTY                      1650K      203 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       705.7M       81 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           580.6M      605 \n__UNICODE                          592K        1 \ndyld private memory               1024K        1 \nlibnetwork                         128K        8 \nmapped file                      336.1M       32 \nshared memory                     9984K       21 \n===========                     =======  ======= \nTOTAL                              2.4G     2270 \nTOTAL, minus reserved VM space     2.1G     2270 \n",
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




















