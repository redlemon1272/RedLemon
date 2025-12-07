-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [33656]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [33525]
Responsible:           Electron [524]
User ID:               501

Date/Time:             2025-12-07 18:23:25.1404 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA

Sleep/Wake UUID:       BD43FAE9-BB94-4DB5-B999-DE7118FB8551

Time Awake Since Boot: 31000 seconds
Time Since Wake:       218 seconds

System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 4 Illegal instruction: 4
Terminating Process:   exc handler [33656]

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   SwiftUI                       	    0x7ff922b7df26 validateDimension #1 (min:ideal:max:) in NSView.intrinsicLayoutTraits() + 224
1   SwiftUI                       	    0x7ff922b7d398 NSView.intrinsicLayoutTraits() + 99
2   SwiftUI                       	    0x7ff922b7d283 PlatformViewHost.updateLayoutTraits() + 266
3   SwiftUI                       	    0x7ff922c63dea closure #1 in ViewLeafView.layoutTraits() + 146
4   SwiftUI                       	    0x7ff922c63d45 ViewLeafView.layoutTraits() + 43
5   SwiftUI                       	    0x7ff922c63bf9 closure #1 in ViewLeafView.sizeThatFits(in:) + 143
6   SwiftUI                       	    0x7ff922c63a85 ViewLeafView.sizeThatFits(in:) + 185
7   SwiftUI                       	    0x7ff92254b6a8 closure #1 in LeafLayoutEngine.sizeThatFits(_:) + 55
8   SwiftUI                       	    0x7ff92254b582 LeafLayoutEngine.sizeThatFits(_:) + 411
9   SwiftUI                       	    0x7ff922702073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
10  SwiftUI                       	    0x7ff92270c67f AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:) + 53
11  SwiftUI                       	    0x7ff92270c7b6 protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine + 47
12  SwiftUI                       	    0x7ff922702073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
13  SwiftUI                       	    0x7ff92270c67f AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:) + 53
14  SwiftUI                       	    0x7ff92270c7b6 protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine + 47
15  SwiftUI                       	    0x7ff922702073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
16  SwiftUI                       	    0x7ff922e887f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
17  SwiftUI                       	    0x7ff922e88bb7 specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:) + 167
18  SwiftUI                       	    0x7ff922e8a5f3 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 105
19  SwiftUI                       	    0x7ff922e87fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
20  SwiftUI                       	    0x7ff922e8737f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
21  SwiftUI                       	    0x7ff922e871d4 StackLayout.Storage.sizeThatFits(_:) + 124
22  SwiftUI                       	    0x7ff922e887f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
23  SwiftUI                       	    0x7ff922e88bb7 specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:) + 167
24  SwiftUI                       	    0x7ff922e8a5f3 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 105
25  SwiftUI                       	    0x7ff922e87fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
26  SwiftUI                       	    0x7ff922e8737f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
27  SwiftUI                       	    0x7ff922e871d4 StackLayout.Storage.sizeThatFits(_:) + 124
28  SwiftUI                       	    0x7ff922e67dba _ZStackLayout.sizeThatFits(in:context:children:) + 870
29  SwiftUI                       	    0x7ff922b0a3a3 closure #1 in _LayoutEngine.sizeThatFits(_:) + 79
30  SwiftUI                       	    0x7ff922b0a24e _LayoutEngine.sizeThatFits(_:) + 506
31  SwiftUI                       	    0x7ff922702073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
32  SwiftUI                       	    0x7ff922e67dba _ZStackLayout.sizeThatFits(in:context:children:) + 870
33  SwiftUI                       	    0x7ff922b0a3a3 closure #1 in _LayoutEngine.sizeThatFits(_:) + 79
34  SwiftUI                       	    0x7ff922b0a24e _LayoutEngine.sizeThatFits(_:) + 506
35  SwiftUI                       	    0x7ff922702073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
36  SwiftUI                       	    0x7ff922701ca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
37  SwiftUI                       	    0x7ff9229a2153 specialized LazyHVStack<>.lengthAndSpacing(children:predecessors:minorGeometry:) + 343
38  SwiftUI                       	    0x7ff9229a1ff8 specialized LazyHVStack<>.lengthAndSpacing(children:predecessors:minorGeometry:) + 33
39  SwiftUI                       	    0x7ff922d3f109 specialized flushMinorGroup #1 <A>() in IncrementalStack<>.sizeThatFits(proposedSize:children:context:state:) + 255
40  SwiftUI                       	    0x7ff922d3f9e0 specialized closure #1 in IncrementalStack<>.sizeThatFits(proposedSize:children:context:state:) + 553
41  SwiftUI                       	    0x7ff922d40658 specialized closure #1 in IncrementalStack<>.sizeThatFits(proposedSize:children:context:state:) + 149
42  SwiftUI                       	    0x7ff922d409c8 partial apply for specialized closure #1 in IncrementalStack<>.sizeThatFits(proposedSize:children:context:state:) + 86
43  SwiftUI                       	    0x7ff922a9228a applyNode #1 (start:style:node:transform:section:) in _IncrementalLayout_Children.apply(from:style:to:) + 571
44  SwiftUI                       	    0x7ff922a92496 closure #1 in applyNode #1 (start:style:node:transform:section:) in _IncrementalLayout_Children.apply(from:style:to:) + 62
45  SwiftUI                       	    0x7ff922aa4a73 partial apply for closure #1 in applyNode #1 (start:style:node:transform:section:) in _IncrementalLayout_Children.apply(from:style:to:) + 64
46  SwiftUI                       	    0x7ff922362f6b BaseViewList.applyNodes(from:style:list:transform:to:) + 437
47  SwiftUI                       	    0x7ff922366348 ModifiedViewList.applyNodes(from:style:list:transform:to:) + 289
48  SwiftUI                       	    0x7ff922366348 ModifiedViewList.applyNodes(from:style:list:transform:to:) + 289
49  SwiftUI                       	    0x7ff922366348 ModifiedViewList.applyNodes(from:style:list:transform:to:) + 289
50  SwiftUI                       	    0x7ff922366348 ModifiedViewList.applyNodes(from:style:list:transform:to:) + 289
51  SwiftUI                       	    0x7ff922366348 ModifiedViewList.applyNodes(from:style:list:transform:to:) + 289
52  SwiftUI                       	    0x7ff922366348 ModifiedViewList.applyNodes(from:style:list:transform:to:) + 289
53  SwiftUI                       	    0x7ff922366348 ModifiedViewList.applyNodes(from:style:list:transform:to:) + 289
54  SwiftUI                       	    0x7ff922366348 ModifiedViewList.applyNodes(from:style:list:transform:to:) + 289
55  SwiftUI                       	    0x7ff9228af671 closure #1 in ForEachState.applyNodes(from:style:list:transform:to:) + 932
56  SwiftUI                       	    0x7ff9228b46e9 partial apply for closure #1 in ForEachState.applyNodes(from:style:list:transform:to:) + 33
57  SwiftUI                       	    0x7ff9228adca0 ForEachState.forEachItem(from:style:do:) + 1440
58  SwiftUI                       	    0x7ff9228af2c7 ForEachState.applyNodes(from:style:list:transform:to:) + 43
59  SwiftUI                       	    0x7ff9228b2b3d ForEachList.applyNodes(from:style:list:transform:to:) + 32
60  SwiftUI                       	    0x7ff9228b2f95 protocol witness for ViewList.applyNodes(from:style:list:transform:to:) in conformance ForEachList<A, B, C> + 80
61  SwiftUI                       	    0x7ff92235c9af _ViewList_Group.applyNodes(from:style:transform:to:) + 287
62  SwiftUI                       	    0x7ff922a9233f applyNode #1 (start:style:node:transform:section:) in _IncrementalLayout_Children.apply(from:style:to:) + 752
63  SwiftUI                       	    0x7ff922a92503 closure #1 in _IncrementalLayout_Children.apply(from:style:to:) + 62
64  SwiftUI                       	    0x7ff922aa4beb partial apply for closure #1 in _IncrementalLayout_Children.apply(from:style:to:) + 30
65  SwiftUI                       	    0x7ff922364127 _ViewList_Group.applyNodes(from:style:list:transform:to:) + 72
66  SwiftUI                       	    0x7ff9223644d8 protocol witness for ViewList.applyNodes(from:style:list:transform:to:) in conformance _ViewList_Group + 37
67  SwiftUI                       	    0x7ff92235c769 _ViewList_Node.applyNodes(from:style:transform:to:) + 200
68  SwiftUI                       	    0x7ff922a92598 _IncrementalLayout_Children.apply(from:style:to:) + 123
69  SwiftUI                       	    0x7ff922d3b6c2 specialized IncrementalStack<>.sizeThatFits(proposedSize:children:context:state:) + 900
70  SwiftUI                       	    0x7ff922d40072 protocol witness for IncrementalLayout.sizeThatFits(proposedSize:children:context:state:) in conformance LazyHStackLayout + 107
71  SwiftUI                       	    0x7ff922d40001 protocol witness for IncrementalLayout.sizeThatFits(proposedSize:children:context:state:) in conformance LazyVStackLayout + 24
72  SwiftUI                       	    0x7ff922a9c278 closure #1 in IncrementalLayoutComputer.Engine.sizeThatFits(_:) + 229
73  SwiftUI                       	    0x7ff922a9c0a2 IncrementalLayoutComputer.Engine.sizeThatFits(_:) + 463
74  SwiftUI                       	    0x7ff922702073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
75  SwiftUI                       	    0x7ff922611862 _PaddingLayout.sizeThatFits(in:context:child:) + 187
76  SwiftUI                       	    0x7ff922611b8b protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout + 49
77  SwiftUI                       	    0x7ff922ab368a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
78  SwiftUI                       	    0x7ff922ab3556 UnaryLayoutEngine.sizeThatFits(_:) + 512
79  SwiftUI                       	    0x7ff922702073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
80  SwiftUI                       	    0x7ff9224c5d49 static ScrollViewUtilities.sizeThatFits(in:contentComputer:axes:) + 214
81  SwiftUI                       	    0x7ff922a6a0c9 closure #1 in SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:) + 196
82  SwiftUI                       	    0x7ff922a69eef SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:) + 470
83  SwiftUI                       	    0x7ff922702073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
84  SwiftUI                       	    0x7ff922701ca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
85  SwiftUI                       	    0x7ff922e89af1 StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 1634
86  SwiftUI                       	    0x7ff922e8916f specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130
87  SwiftUI                       	    0x7ff922e8a619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
88  SwiftUI                       	    0x7ff922e87fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
89  SwiftUI                       	    0x7ff922e8737f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
90  SwiftUI                       	    0x7ff922e871d4 StackLayout.Storage.sizeThatFits(_:) + 124
91  SwiftUI                       	    0x7ff922e887f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
92  SwiftUI                       	    0x7ff922e893e2 specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 757
93  SwiftUI                       	    0x7ff922e8a619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
94  SwiftUI                       	    0x7ff922e87fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
95  SwiftUI                       	    0x7ff922e8737f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
96  SwiftUI                       	    0x7ff922e871d4 StackLayout.Storage.sizeThatFits(_:) + 124
97  SwiftUI                       	    0x7ff9226ff218 _FlexFrameLayout.sizeThatFits(in:context:child:) + 501
98  SwiftUI                       	    0x7ff9226ff6d8 protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout + 46
99  SwiftUI                       	    0x7ff922ab368a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
100 SwiftUI                       	    0x7ff922ab3556 UnaryLayoutEngine.sizeThatFits(_:) + 512
101 SwiftUI                       	    0x7ff922702073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
102 SwiftUI                       	    0x7ff9224a5166 RootGeometry.value.getter + 299
103 SwiftUI                       	    0x7ff92233ec7e specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 28
104 SwiftUI                       	    0x7ff922356187 partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 20
105 AttributeGraph                	    0x7ff9230c2757 AG::Graph::UpdateStack::update() + 559
106 AttributeGraph                	    0x7ff9230c2d57 AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421
107 AttributeGraph                	    0x7ff9230cd35e AG::Subgraph::update(unsigned int) + 904
108 SwiftUI                       	    0x7ff922e504ab GraphHost.flushTransactions() + 495
109 SwiftUI                       	    0x7ff922e51304 closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:) + 15
110 SwiftUI                       	    0x7ff9224a56aa partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:) + 17
111 SwiftUI                       	    0x7ff922cb6ca8 closure #1 in ViewRendererHost.updateViewGraph<A>(body:) + 69
112 SwiftUI                       	    0x7ff922cb58df ViewRendererHost.updateViewGraph<A>(body:) + 78
113 SwiftUI                       	    0x7ff922cc3cd0 protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1> + 25
114 SwiftUI                       	    0x7ff92249e2a4 ViewGraphDelegate.updateGraph<A>(body:) + 55
115 SwiftUI                       	    0x7ff9224a55e3 protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1> + 25
116 SwiftUI                       	    0x7ff922e512e0 closure #1 in GraphHost.init(data:) + 122
117 SwiftUI                       	    0x7ff9224a6e3c thunk for @escaping @callee_guaranteed () -> () + 12
118 SwiftUI                       	    0x7ff922d3625b partial apply for thunk for @escaping @callee_guaranteed () -> () + 17
119 SwiftUI                       	    0x7ff922d33b20 static NSRunLoop.flushObservers() + 118
120 SwiftUI                       	    0x7ff922d361d8 closure #1 in closure #1 in static NSRunLoop.addObserver(_:) + 16
121 SwiftUI                       	    0x7ff922d30716 specialized thunk for @callee_guaranteed () -> (@error @owned Error) + 14
122 libswiftObjectiveC.dylib      	    0x7ff82bc48e7c autoreleasepool<A>(invoking:) + 44
123 SwiftUI                       	    0x7ff922d361c0 closure #1 in static NSRunLoop.addObserver(_:) + 35
124 SwiftUI                       	    0x7ff922d36205 @objc closure #1 in static NSRunLoop.addObserver(_:) + 43
125 CoreFoundation                	    0x7ff816d46450 __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
126 CoreFoundation                	    0x7ff816d462e2 __CFRunLoopDoObservers + 543
127 CoreFoundation                	    0x7ff816d45897 __CFRunLoopRun + 1131
128 CoreFoundation                	    0x7ff816d44d6c CFRunLoopRunSpecific + 562
129 HIToolbox                     	    0x7ff81f9f75e6 RunCurrentEventLoopInMode + 292
130 HIToolbox                     	    0x7ff81f9f734a ReceiveNextEventCommon + 594
131 HIToolbox                     	    0x7ff81f9f70e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
132 AppKit                        	    0x7ff819783aa9 _DPSNextEvent + 927
133 AppKit                        	    0x7ff819782166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
134 AppKit                        	    0x7ff819774818 -[NSApplication run] + 586
135 AppKit                        	    0x7ff81974879a NSApplicationMain + 817
136 SwiftUI                       	    0x7ff92229909c specialized runApp(_:) + 161
137 SwiftUI                       	    0x7ff922cfb424 runApp<A>(_:) + 164
138 SwiftUI                       	    0x7ff9227f3c5f static App.main() + 63
139 RedLemon                      	       0x108d5cc23 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
140 RedLemon                      	       0x108d5cca9 RedLemon_main + 9
141 dyld                          	       0x11991352e start + 462

Thread 1:
0   libsystem_pthread.dylib       	    0x7ff816c7bf48 start_wqthread + 0

Thread 2:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff816c4393a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff816c43ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff816d4729d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff816d45928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff816d44d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff8198f1572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff816c804e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff816c7bf6b thread_start + 15

Thread 3:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff816c4393a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff816c43ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff816d4729d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff816d45928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff816d44d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff81b973964 0x7ff81b72b000 + 2394468
6   Foundation                    	    0x7ff817b9c724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff816c804e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff816c7bf6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff816c4830e kevent + 10
1   RedLemon                      	       0x108b2be49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x108b35d6f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x108b363c4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x108b2cafb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x108b35c68 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x108b12736 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x108b1379f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x108b04663 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x108b10f4d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x108b0a874 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x108aff12e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x108b02554 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x108af70e2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x108af712c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82bc48e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x108af7089 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x108afe1af SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x108a9fec8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x108aa061a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x108aa68f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x108b367bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x108b3932f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x108b393e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff816c804e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff816c7bf6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff816c4830e kevent + 10
1   RedLemon                      	       0x108b2be49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x108b35d6f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x108b363c4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x108b2cafb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x108b35c68 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x108b12736 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x108b1379f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x108b04722 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x108b04777 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff82425972c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x108b045ea Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x108b10f4d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x108b0a874 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x108aff12e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x108b02554 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x108af70e2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x108af712c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82bc48e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x108af7089 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x108afe1af SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x108a9fec8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x108aa061a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x108aa68f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x108b367bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x108b3932f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x108b393e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff816c804e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff816c7bf6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff816c4830e kevent + 10
1   RedLemon                      	       0x108b2be49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x108b35d6f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x108b363c4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x108b2cafb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x108b35c68 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x108b12736 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x108b1379f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x108b04663 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x108b10f4d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x108b0a874 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x108aff12e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x108b02554 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x108af70e2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x108af712c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82bc48e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x108af7089 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x108afe1af SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x108a9fec8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x108aa061a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x108aa68f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x108b367bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x108b3932f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x108b393e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff816c804e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff816c7bf6b thread_start + 15

Thread 7:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff816c4830e kevent + 10
1   RedLemon                      	       0x108b2be49 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x108b35d6f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x108b363c4 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x108b2cafb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x108b35c68 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x108b12736 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x108b1379f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x108b04663 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x108b10f4d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x108b0a874 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x108aff12e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x108b02554 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x108af70e2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x108af712c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82bc48e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x108af7089 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x108afe1af SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x108a9fec8 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x108aa061a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x108aa68f3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x108b367bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x108b3932f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x108b393e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff816c804e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff816c7bf6b thread_start + 15

Thread 8:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff816c43976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff816ac87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff816ac8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x108aa8dbf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x108aa9c8e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x108b367bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x108b3932f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x108b393e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff816c804e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff816c7bf6b thread_start + 15

Thread 9:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff816c43976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff816ac87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff816ac8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x108aa8dbf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x108aa9c8e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x108b367bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x108b3932f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x108b393e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff816c804e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff816c7bf6b thread_start + 15

Thread 10:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff816c43976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff816ac87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff816ac8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x108aa8dbf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x108aa9c8e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x108b367bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x108b3932f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x108b393e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff816c804e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff816c7bf6b thread_start + 15

Thread 11:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff816c43976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff816ac87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff816ac8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x108aa8dbf NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x108aa9c8e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x108b367bf thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x108b3932f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x108b393e9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff816c804e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff816c7bf6b thread_start + 15

Thread 12:
0   libsystem_pthread.dylib       	    0x7ff816c7bf48 start_wqthread + 0

Thread 13:
0   libsystem_pthread.dylib       	    0x7ff816c7bf48 start_wqthread + 0

Thread 14:
0   libsystem_pthread.dylib       	    0x7ff816c7bf48 start_wqthread + 0


Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x031dfff858953501  rbx: 0x00007f94818c2010  rcx: 0x0080000000000000  rdx: 0x0100000000000000
  rdi: 0x00007f94818c2010  rsi: 0x021dfff858953531  rbp: 0x00007ff7b8255b10  rsp: 0x00007ff7b8255ab0
   r8: 0x0000000000000010   r9: 0x0f0f0f0f0f0f0f0f  r10: 0x00007ff858266d38  r11: 0x00007ff817b75c50
  r12: 0x00007ff7b8255b20  r13: 0x00007f94818c2010  r14: 0x00007ff7b8255b30  r15: 0x00007ff7b8255bb0
  rip: 0x00007ff922b7df26  rfl: 0x0000000000010203  cr2: 0x0000000000000000
  
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
    0x7ff92221d000 -     0x7ff9230bcfff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
    0x7ff9230bd000 -     0x7ff9230f3fff com.apple.AttributeGraph (3.2.1) <e9337c46-2775-39dc-ae3d-14ccf80d629f> /System/Library/PrivateFrameworks/AttributeGraph.framework/Versions/A/AttributeGraph
    0x7ff82bc48000 -     0x7ff82bc49fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff816cc7000 -     0x7ff8171c9fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff81f9c9000 -     0x7ff81fcbcfff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff819745000 -     0x7ff81a5d4fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x107ca3000 -        0x109c9afff com.redlemon.app (1.0.14) <9eafc00b-5793-3081-93df-4ca3f8a5bd8e> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x11990e000 -        0x119979fff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff816c7a000 -     0x7ff816c85fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff816c42000 -     0x7ff816c79fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff81b72b000 -     0x7ff81bbb9fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff817b44000 -     0x7ff817f00fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff82413e000 -     0x7ff8245b7fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff816ac5000 -     0x7ff816b0bfff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib

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
Writable regions: Total=226.7M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=226.7M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               512K        4 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                           352K        9 
CG raster data                     120K       10 
ColorSync                          232K       28 
CoreAnimation                     2324K       66 
CoreGraphics                        12K        2 
CoreUI image data                 1372K        9 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
Image IO                           556K        4 
Kernel Alloc Once                    8K        1 
MALLOC                           116.1M      121 
MALLOC guard page                   48K       11 
SQLite page cache                  960K       15 
STACK GUARD                       56.1M       15 
Stack                             15.1M       15 
VM_ALLOCATE                       12.0M       11 
__CTF                               756        1 
__DATA                            55.0M      599 
__DATA_CONST                      33.3M      410 
__DATA_DIRTY                      1651K      203 
__FONT_DATA                          4K        1 
__LINKEDIT                       709.1M       83 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           584.2M      608 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        13.6M       40 
mapped file                      343.2M       36 
shared memory                      9.8M       23 
===========                     =======  ======= 
TOTAL                              2.0G     2339 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-12-07 18:23:42.00 -0500","app_version":"1.0.14","slice_uuid":"9eafc00b-5793-3081-93df-4ca3f8a5bd8e","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"46EB62FA-7A06-462E-943A-455C801CDB7A","name":"RedLemon"}
{
  "uptime" : 31000,
  "procLaunch" : "2025-12-07 18:22:09.5477 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 30988206188432,
  "coalitionID" : 626,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-12-07 18:23:25.1404 -0500",
  "incident" : "46EB62FA-7A06-462E-943A-455C801CDB7A",
  "bug_type" : "309",
  "pid" : 33656,
  "procExitAbsTime" : 31063776475682,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 33525,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 524,
  "responsibleProc" : "Electron",
  "wakeTime" : 218,
  "sleepWakeUUID" : "BD43FAE9-BB94-4DB5-B999-DE7118FB8551",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_INSTRUCTION","signal":"SIGILL"},
  "termination" : {"flags":0,"code":4,"namespace":"SIGNAL","indicator":"Illegal instruction: 4","byProc":"exc handler","byPid":33656},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 0,
  "threads" : [{"triggered":true,"id":258200,"instructionState":{"instructionStream":{"bytes":[22,167,50,0,115,10,102,15,46,196,118,86,49,192,235,13,102,15,46,196,118,76,102,15,46,198,15,151,192,102,15,46,238,114,61,102,15,46,230,114,57,102,15,46,236,15,147,193,32,200,60,1,117,44,102,15,40,198,102,15,40,204,102,15,40,213,232,57,202,163,255,15,40,69,208,15,40,77,192,15,40,85,176,72,131,196,64,91,65,93,65,94,65,95,93,195,15,11,76,141,109,160,73,131,101,0,0,72,184,0,0,0,0,0,0,0,224,73,137,69,8,106,103,95,232,89,104,50,0,65,15,16,69,0,65,15,17,69,0,72,139,53,200,28,244,54,72,137,223,232,0,120,50,0,72,137,199,232,64,120,50,0,72,137,195,72,137,199,232,219,95,50,0,73,137,198,73,137,215,72,137,223,255,21,22,135,9,56,76,141,109,160],"offset":96}},"threadState":{"r13":{"value":140275805331472},"rax":{"value":224616998541538561},"rflags":{"value":66051},"cpu":{"value":1},"r14":{"value":140701923105584},"rsi":{"value":152559404503610673},"r8":{"value":16},"cr2":{"value":0},"rdx":{"value":72057594037927936},"r10":{"value":140704607530296,"symbolLocation":0,"symbol":"OBJC_METACLASS_$_NSThread"},"r9":{"value":1085102592571150095},"r15":{"value":140701923105712},"rbx":{"value":140275805331472},"trap":{"value":6},"err":{"value":0},"r11":{"value":140703526509648,"symbolLocation":0,"symbol":"+[NSThread isMainThread]"},"rip":{"value":140708006059814,"matchesCrashFrame":1},"rbp":{"value":140701923105552},"rsp":{"value":140701923105456},"r12":{"value":140701923105568},"rcx":{"value":36028797018963968},"flavor":"x86_THREAD_STATE","rdi":{"value":140275805331472}},"queue":"com.apple.main-thread","frames":[{"imageOffset":9834278,"symbol":"validateDimension #1 (min:ideal:max:) in NSView.intrinsicLayoutTraits()","symbolLocation":224,"imageIndex":0},{"imageOffset":9831320,"symbol":"NSView.intrinsicLayoutTraits()","symbolLocation":99,"imageIndex":0},{"imageOffset":9831043,"symbol":"PlatformViewHost.updateLayoutTraits()","symbolLocation":266,"imageIndex":0},{"imageOffset":10776042,"symbol":"closure #1 in ViewLeafView.layoutTraits()","symbolLocation":146,"imageIndex":0},{"imageOffset":10775877,"symbol":"ViewLeafView.layoutTraits()","symbolLocation":43,"imageIndex":0},{"imageOffset":10775545,"symbol":"closure #1 in ViewLeafView.sizeThatFits(in:)","symbolLocation":143,"imageIndex":0},{"imageOffset":10775173,"symbol":"ViewLeafView.sizeThatFits(in:)","symbolLocation":185,"imageIndex":0},{"imageOffset":3335848,"symbol":"closure #1 in LeafLayoutEngine.sizeThatFits(_:)","symbolLocation":55,"imageIndex":0},{"imageOffset":3335554,"symbol":"LeafLayoutEngine.sizeThatFits(_:)","symbolLocation":411,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5174911,"symbol":"AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:)","symbolLocation":53,"imageIndex":0},{"imageOffset":5175222,"symbol":"protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine","symbolLocation":47,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5174911,"symbol":"AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:)","symbolLocation":53,"imageIndex":0},{"imageOffset":5175222,"symbol":"protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine","symbolLocation":47,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13024183,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:)","symbolLocation":167,"imageIndex":0},{"imageOffset":13030899,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":105,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13024183,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:)","symbolLocation":167,"imageIndex":0},{"imageOffset":13030899,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":105,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12889530,"symbol":"_ZStackLayout.sizeThatFits(in:context:children:)","symbolLocation":870,"imageIndex":0},{"imageOffset":9360291,"symbol":"closure #1 in _LayoutEngine.sizeThatFits(_:)","symbolLocation":79,"imageIndex":0},{"imageOffset":9359950,"symbol":"_LayoutEngine.sizeThatFits(_:)","symbolLocation":506,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":12889530,"symbol":"_ZStackLayout.sizeThatFits(in:context:children:)","symbolLocation":870,"imageIndex":0},{"imageOffset":9360291,"symbol":"closure #1 in _LayoutEngine.sizeThatFits(_:)","symbolLocation":79,"imageIndex":0},{"imageOffset":9359950,"symbol":"_LayoutEngine.sizeThatFits(_:)","symbolLocation":506,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":7885139,"symbol":"specialized LazyHVStack<>.lengthAndSpacing(children:predecessors:minorGeometry:)","symbolLocation":343,"imageIndex":0},{"imageOffset":7884792,"symbol":"specialized LazyHVStack<>.lengthAndSpacing(children:predecessors:minorGeometry:)","symbolLocation":33,"imageIndex":0},{"imageOffset":11673865,"symbol":"specialized flushMinorGroup #1 <A>() in IncrementalStack<>.sizeThatFits(proposedSize:children:context:state:)","symbolLocation":255,"imageIndex":0},{"imageOffset":11676128,"symbol":"specialized closure #1 in IncrementalStack<>.sizeThatFits(proposedSize:children:context:state:)","symbolLocation":553,"imageIndex":0},{"imageOffset":11679320,"symbol":"specialized closure #1 in IncrementalStack<>.sizeThatFits(proposedSize:children:context:state:)","symbolLocation":149,"imageIndex":0},{"imageOffset":11680200,"symbol":"partial apply for specialized closure #1 in IncrementalStack<>.sizeThatFits(proposedSize:children:context:state:)","symbolLocation":86,"imageIndex":0},{"imageOffset":8868490,"symbol":"applyNode #1 (start:style:node:transform:section:) in _IncrementalLayout_Children.apply(from:style:to:)","symbolLocation":571,"imageIndex":0},{"imageOffset":8869014,"symbol":"closure #1 in applyNode #1 (start:style:node:transform:section:) in _IncrementalLayout_Children.apply(from:style:to:)","symbolLocation":62,"imageIndex":0},{"imageOffset":8944243,"symbol":"partial apply for closure #1 in applyNode #1 (start:style:node:transform:section:) in _IncrementalLayout_Children.apply(from:style:to:)","symbolLocation":64,"imageIndex":0},{"imageOffset":1335147,"symbol":"BaseViewList.applyNodes(from:style:list:transform:to:)","symbolLocation":437,"imageIndex":0},{"imageOffset":1348424,"symbol":"ModifiedViewList.applyNodes(from:style:list:transform:to:)","symbolLocation":289,"imageIndex":0},{"imageOffset":1348424,"symbol":"ModifiedViewList.applyNodes(from:style:list:transform:to:)","symbolLocation":289,"imageIndex":0},{"imageOffset":1348424,"symbol":"ModifiedViewList.applyNodes(from:style:list:transform:to:)","symbolLocation":289,"imageIndex":0},{"imageOffset":1348424,"symbol":"ModifiedViewList.applyNodes(from:style:list:transform:to:)","symbolLocation":289,"imageIndex":0},{"imageOffset":1348424,"symbol":"ModifiedViewList.applyNodes(from:style:list:transform:to:)","symbolLocation":289,"imageIndex":0},{"imageOffset":1348424,"symbol":"ModifiedViewList.applyNodes(from:style:list:transform:to:)","symbolLocation":289,"imageIndex":0},{"imageOffset":1348424,"symbol":"ModifiedViewList.applyNodes(from:style:list:transform:to:)","symbolLocation":289,"imageIndex":0},{"imageOffset":1348424,"symbol":"ModifiedViewList.applyNodes(from:style:list:transform:to:)","symbolLocation":289,"imageIndex":0},{"imageOffset":6891121,"symbol":"closure #1 in ForEachState.applyNodes(from:style:list:transform:to:)","symbolLocation":932,"imageIndex":0},{"imageOffset":6911721,"symbol":"partial apply for closure #1 in ForEachState.applyNodes(from:style:list:transform:to:)","symbolLocation":33,"imageIndex":0},{"imageOffset":6884512,"symbol":"ForEachState.forEachItem(from:style:do:)","symbolLocation":1440,"imageIndex":0},{"imageOffset":6890183,"symbol":"ForEachState.applyNodes(from:style:list:transform:to:)","symbolLocation":43,"imageIndex":0},{"imageOffset":6904637,"symbol":"ForEachList.applyNodes(from:style:list:transform:to:)","symbolLocation":32,"imageIndex":0},{"imageOffset":6905749,"symbol":"protocol witness for ViewList.applyNodes(from:style:list:transform:to:) in conformance ForEachList<A, B, C>","symbolLocation":80,"imageIndex":0},{"imageOffset":1309103,"symbol":"_ViewList_Group.applyNodes(from:style:transform:to:)","symbolLocation":287,"imageIndex":0},{"imageOffset":8868671,"symbol":"applyNode #1 (start:style:node:transform:section:) in _IncrementalLayout_Children.apply(from:style:to:)","symbolLocation":752,"imageIndex":0},{"imageOffset":8869123,"symbol":"closure #1 in _IncrementalLayout_Children.apply(from:style:to:)","symbolLocation":62,"imageIndex":0},{"imageOffset":8944619,"symbol":"partial apply for closure #1 in _IncrementalLayout_Children.apply(from:style:to:)","symbolLocation":30,"imageIndex":0},{"imageOffset":1339687,"symbol":"_ViewList_Group.applyNodes(from:style:list:transform:to:)","symbolLocation":72,"imageIndex":0},{"imageOffset":1340632,"symbol":"protocol witness for ViewList.applyNodes(from:style:list:transform:to:) in conformance _ViewList_Group","symbolLocation":37,"imageIndex":0},{"imageOffset":1308521,"symbol":"_ViewList_Node.applyNodes(from:style:transform:to:)","symbolLocation":200,"imageIndex":0},{"imageOffset":8869272,"symbol":"_IncrementalLayout_Children.apply(from:style:to:)","symbolLocation":123,"imageIndex":0},{"imageOffset":11658946,"symbol":"specialized IncrementalStack<>.sizeThatFits(proposedSize:children:context:state:)","symbolLocation":900,"imageIndex":0},{"imageOffset":11677810,"symbol":"protocol witness for IncrementalLayout.sizeThatFits(proposedSize:children:context:state:) in conformance LazyHStackLayout","symbolLocation":107,"imageIndex":0},{"imageOffset":11677697,"symbol":"protocol witness for IncrementalLayout.sizeThatFits(proposedSize:children:context:state:) in conformance LazyVStackLayout","symbolLocation":24,"imageIndex":0},{"imageOffset":8909432,"symbol":"closure #1 in IncrementalLayoutComputer.Engine.sizeThatFits(_:)","symbolLocation":229,"imageIndex":0},{"imageOffset":8908962,"symbol":"IncrementalLayoutComputer.Engine.sizeThatFits(_:)","symbolLocation":463,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":4147298,"symbol":"_PaddingLayout.sizeThatFits(in:context:child:)","symbolLocation":187,"imageIndex":0},{"imageOffset":4148107,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout","symbolLocation":49,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":2788681,"symbol":"static ScrollViewUtilities.sizeThatFits(in:contentComputer:axes:)","symbolLocation":214,"imageIndex":0},{"imageOffset":8704201,"symbol":"closure #1 in SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:)","symbolLocation":196,"imageIndex":0},{"imageOffset":8703727,"symbol":"SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:)","symbolLocation":470,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":13028081,"symbol":"StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:)","symbolLocation":1634,"imageIndex":0},{"imageOffset":13025647,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":130,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13026274,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":757,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":5120536,"symbol":"_FlexFrameLayout.sizeThatFits(in:context:child:)","symbolLocation":501,"imageIndex":0},{"imageOffset":5121752,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout","symbolLocation":46,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":2654566,"symbol":"RootGeometry.value.getter","symbolLocation":299,"imageIndex":0},{"imageOffset":1186942,"symbol":"specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":28,"imageIndex":0},{"imageOffset":1282439,"symbol":"partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":22359,"symbol":"AG::Graph::UpdateStack::update()","symbolLocation":559,"imageIndex":1},{"imageOffset":23895,"symbol":"AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int)","symbolLocation":421,"imageIndex":1},{"imageOffset":66398,"symbol":"AG::Subgraph::update(unsigned int)","symbolLocation":904,"imageIndex":1},{"imageOffset":12793003,"symbol":"GraphHost.flushTransactions()","symbolLocation":495,"imageIndex":0},{"imageOffset":12796676,"symbol":"closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:)","symbolLocation":15,"imageIndex":0},{"imageOffset":2655914,"symbol":"partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":17,"imageIndex":0},{"imageOffset":11115688,"symbol":"closure #1 in ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":69,"imageIndex":0},{"imageOffset":11110623,"symbol":"ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":78,"imageIndex":0},{"imageOffset":11168976,"symbol":"protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":0},{"imageOffset":2626212,"symbol":"ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":55,"imageIndex":0},{"imageOffset":2655715,"symbol":"protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":0},{"imageOffset":12796640,"symbol":"closure #1 in GraphHost.init(data:)","symbolLocation":122,"imageIndex":0},{"imageOffset":2661948,"symbol":"thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":12,"imageIndex":0},{"imageOffset":11637339,"symbol":"partial apply for thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":17,"imageIndex":0},{"imageOffset":11627296,"symbol":"static NSRunLoop.flushObservers()","symbolLocation":118,"imageIndex":0},{"imageOffset":11637208,"symbol":"closure #1 in closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":16,"imageIndex":0},{"imageOffset":11613974,"symbol":"specialized thunk for @callee_guaranteed () -> (@error @owned Error)","symbolLocation":14,"imageIndex":0},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":11637184,"symbol":"closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":35,"imageIndex":0},{"imageOffset":11637253,"symbol":"@objc closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":43,"imageIndex":0},{"imageOffset":521296,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__","symbolLocation":23,"imageIndex":3},{"imageOffset":520930,"symbol":"__CFRunLoopDoObservers","symbolLocation":543,"imageIndex":3},{"imageOffset":518295,"symbol":"__CFRunLoopRun","symbolLocation":1131,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":4},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":4},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":4},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":5},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":5},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":5},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":5},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":0},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":0},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":0},{"imageOffset":17538083,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":6,"symbolLocation":35},{"imageOffset":17538217,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":6},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":7}]},{"id":258203,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":258234,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":9},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":3},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":258263,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":9},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":3},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":2394468,"imageIndex":10},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":11},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":258265,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15240777,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15281519,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15283140,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15244027,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15281256,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15136566,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15140767,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15079011,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":467},{"imageOffset":15130445,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15104116,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15057198,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15070548,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15024354,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15024428,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15024265,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15053231,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14667464,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14669338,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14694643,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15284159,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15295279,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15295465,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":258268,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15240777,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15281519,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15283140,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15244027,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15281256,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15136566,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15140767,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15079202,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":50},{"imageOffset":15079287,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":6},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":12},{"imageOffset":15078890,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":346},{"imageOffset":15130445,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15104116,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15057198,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15070548,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15024354,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15024428,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15024265,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15053231,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14667464,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14669338,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14694643,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15284159,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15295279,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15295465,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":258269,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15240777,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15281519,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15283140,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15244027,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15281256,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15136566,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15140767,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15079011,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":467},{"imageOffset":15130445,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15104116,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15057198,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15070548,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15024354,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15024428,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15024265,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15053231,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14667464,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14669338,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14694643,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15284159,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15295279,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15295465,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":258270,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":9},{"imageOffset":15240777,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":6},{"imageOffset":15281519,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":95},{"imageOffset":15283140,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":6},{"imageOffset":15244027,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":6,"symbolLocation":395},{"imageOffset":15281256,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":6,"symbolLocation":312},{"imageOffset":15136566,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":230},{"imageOffset":15140767,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":6},{"imageOffset":15079011,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":6,"symbolLocation":467},{"imageOffset":15130445,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":1053},{"imageOffset":15104116,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":6,"symbolLocation":100},{"imageOffset":15057198,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":6,"symbolLocation":158},{"imageOffset":15070548,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":6},{"imageOffset":15024354,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":34},{"imageOffset":15024428,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":6},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":15024265,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":6,"symbolLocation":57},{"imageOffset":15053231,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":6,"symbolLocation":591},{"imageOffset":14667464,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":6,"symbolLocation":856},{"imageOffset":14669338,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":6,"symbolLocation":282},{"imageOffset":14694643,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":6},{"imageOffset":15284159,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15295279,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15295465,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":258272,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14704063,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14707854,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15284159,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15295279,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15295465,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":258273,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14704063,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14707854,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15284159,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15295279,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15295465,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":258274,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14704063,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14707854,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15284159,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15295279,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15295465,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":258275,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":9},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14704063,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":6,"symbolLocation":143},{"imageOffset":14707854,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":6,"symbolLocation":222},{"imageOffset":15284159,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":6},{"imageOffset":15295279,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":6,"symbolLocation":1007},{"imageOffset":15295465,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]},{"id":258650,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":258666,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":258750,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140707996225536,
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
    "base" : 140708011560960,
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
    "base" : 140703862915072,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703511113728,
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
    "base" : 140703658971136,
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
    "base" : 140703555670016,
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
    "base" : 4425658368,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 33521664,
    "uuid" : "9eafc00b-5793-3081-93df-4ca3f8a5bd8e",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4723892224,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703510798336,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703510568960,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703589117952,
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
    "base" : 140703526305792,
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
    "base" : 140703733899264,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703509008384,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703507537920,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=226.7M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=226.7M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               512K        4 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                           352K        9 \nCG raster data                     120K       10 \nColorSync                          232K       28 \nCoreAnimation                     2324K       66 \nCoreGraphics                        12K        2 \nCoreUI image data                 1372K        9 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nImage IO                           556K        4 \nKernel Alloc Once                    8K        1 \nMALLOC                           116.1M      121 \nMALLOC guard page                   48K       11 \nSQLite page cache                  960K       15 \nSTACK GUARD                       56.1M       15 \nStack                             15.1M       15 \nVM_ALLOCATE                       12.0M       11 \n__CTF                               756        1 \n__DATA                            55.0M      599 \n__DATA_CONST                      33.3M      410 \n__DATA_DIRTY                      1651K      203 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       709.1M       83 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           584.2M      608 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      343.2M       36 \nshared memory                      9.8M       23 \n===========                     =======  ======= \nTOTAL                              2.0G     2339 \n",
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

