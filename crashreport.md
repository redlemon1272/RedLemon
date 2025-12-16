-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [25062]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [24940]
Responsible:           Electron [590]
User ID:               501

Date/Time:             2025-12-16 13:42:17.5879 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA


Time Awake Since Boot: 14000 seconds

System Integrity Protection: enabled

Crashed Thread:        1  Dispatch queue: com.apple.root.user-initiated-qos.cooperative

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 4 Illegal instruction: 4
Terminating Process:   exc handler [25062]

Thread 0::  Dispatch queue: com.apple.main-thread
0   libswiftCore.dylib            	    0x7ff82b24919d swift_release + 77
1   SwiftUI                       	    0x7ff9293b1a2c ResolvedImageLayoutDelegate.sizeThatFits(_:) + 404
2   SwiftUI                       	    0x7ff929c96c82 StackLayout.UnmanagedImplementation.explicitAlignment(_:at:) + 502
3   SwiftUI                       	    0x7ff929c96a53 StackLayout.Storage.explicitAlignment(_:at:) + 109
4   SwiftUI                       	    0x7ff9298c27c0 UnaryLayoutEngine.explicitAlignment(_:at:) + 292
5   SwiftUI                       	    0x7ff9298c28bb protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9
6   SwiftUI                       	    0x7ff92951119b LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109
7   SwiftUI                       	    0x7ff9298c27c0 UnaryLayoutEngine.explicitAlignment(_:at:) + 292
8   SwiftUI                       	    0x7ff9298c28bb protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9
9   SwiftUI                       	    0x7ff92951119b LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109
10  SwiftUI                       	    0x7ff929c96d41 StackLayout.UnmanagedImplementation.explicitAlignment(_:at:) + 693
11  SwiftUI                       	    0x7ff929c96a53 StackLayout.Storage.explicitAlignment(_:at:) + 109
12  SwiftUI                       	    0x7ff9298c27c0 UnaryLayoutEngine.explicitAlignment(_:at:) + 292
13  SwiftUI                       	    0x7ff9298c28bb protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9
14  SwiftUI                       	    0x7ff92951119b LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109
15  SwiftUI                       	    0x7ff9298c27c0 UnaryLayoutEngine.explicitAlignment(_:at:) + 292
16  SwiftUI                       	    0x7ff9298c28bb protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9
17  SwiftUI                       	    0x7ff92951119b LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109
18  SwiftUI                       	    0x7ff929c96d41 StackLayout.UnmanagedImplementation.explicitAlignment(_:at:) + 693
19  SwiftUI                       	    0x7ff929c96a53 StackLayout.Storage.explicitAlignment(_:at:) + 109
20  SwiftUI                       	    0x7ff929919dad _LayoutEngine.explicitAlignment(_:at:) + 605
21  SwiftUI                       	    0x7ff929919f9e protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance _LayoutEngine<A> + 9
22  SwiftUI                       	    0x7ff92951119b LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109
23  SwiftUI                       	    0x7ff92912b157 specialized FrameLayoutCommon.commonPlacement(of:in:childProposal:) + 1032
24  SwiftUI                       	    0x7ff92950e3f5 _FlexFrameLayout.placement(of:in:) + 73
25  SwiftUI                       	    0x7ff92950e69f protocol witness for UnaryLayout.placement(of:in:) in conformance _FlexFrameLayout + 75
26  SwiftUI                       	    0x7ff9298c2882 closure #1 in UnaryLayoutEngine.childPlacement(at:) + 66
27  SwiftUI                       	    0x7ff9298c1b45 UnaryLayoutEngine.childPlacement(at:) + 552
28  SwiftUI                       	    0x7ff9298c26cd UnaryLayoutEngine.explicitAlignment(_:at:) + 49
29  SwiftUI                       	    0x7ff9298c28bb protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9
30  SwiftUI                       	    0x7ff92951119b LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109
31  SwiftUI                       	    0x7ff929afd699 ViewDimensions.subscript.getter + 67
32  SwiftUI                       	    0x7ff929c97866 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 217
33  SwiftUI                       	    0x7ff929c97bb7 specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:) + 167
34  SwiftUI                       	    0x7ff929c995f3 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 105
35  SwiftUI                       	    0x7ff929c96fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
36  SwiftUI                       	    0x7ff929c9637f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
37  SwiftUI                       	    0x7ff929c961d4 StackLayout.Storage.sizeThatFits(_:) + 124
38  SwiftUI                       	    0x7ff929420862 _PaddingLayout.sizeThatFits(in:context:child:) + 187
39  SwiftUI                       	    0x7ff929420b8b protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout + 49
40  SwiftUI                       	    0x7ff9298c268a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
41  SwiftUI                       	    0x7ff9298c2556 UnaryLayoutEngine.sizeThatFits(_:) + 512
42  SwiftUI                       	    0x7ff929511073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
43  SwiftUI                       	    0x7ff929420862 _PaddingLayout.sizeThatFits(in:context:child:) + 187
44  SwiftUI                       	    0x7ff929420b8b protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout + 49
45  SwiftUI                       	    0x7ff9298c268a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
46  SwiftUI                       	    0x7ff9298c2556 UnaryLayoutEngine.sizeThatFits(_:) + 512
47  SwiftUI                       	    0x7ff929511073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
48  SwiftUI                       	    0x7ff929c977f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
49  SwiftUI                       	    0x7ff929c97bb7 specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:) + 167
50  SwiftUI                       	    0x7ff929c995f3 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 105
51  SwiftUI                       	    0x7ff929c96fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
52  SwiftUI                       	    0x7ff929c9637f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
53  SwiftUI                       	    0x7ff929c961d4 StackLayout.Storage.sizeThatFits(_:) + 124
54  SwiftUI                       	    0x7ff9292d4d49 static ScrollViewUtilities.sizeThatFits(in:contentComputer:axes:) + 214
55  SwiftUI                       	    0x7ff9298790c9 closure #1 in SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:) + 196
56  SwiftUI                       	    0x7ff929878eef SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:) + 470
57  SwiftUI                       	    0x7ff929511073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
58  SwiftUI                       	    0x7ff929c76dba _ZStackLayout.sizeThatFits(in:context:children:) + 870
59  SwiftUI                       	    0x7ff9299193a3 closure #1 in _LayoutEngine.sizeThatFits(_:) + 79
60  SwiftUI                       	    0x7ff92991924e _LayoutEngine.sizeThatFits(_:) + 506
61  SwiftUI                       	    0x7ff929511073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
62  SwiftUI                       	    0x7ff929c977f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
63  SwiftUI                       	    0x7ff929c983e2 specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 757
64  SwiftUI                       	    0x7ff929c99619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
65  SwiftUI                       	    0x7ff929c96fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
66  SwiftUI                       	    0x7ff929c9637f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
67  SwiftUI                       	    0x7ff929c961d4 StackLayout.Storage.sizeThatFits(_:) + 124
68  SwiftUI                       	    0x7ff92950e218 _FlexFrameLayout.sizeThatFits(in:context:child:) + 501
69  SwiftUI                       	    0x7ff92950e6d8 protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout + 46
70  SwiftUI                       	    0x7ff9298c268a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
71  SwiftUI                       	    0x7ff9298c2556 UnaryLayoutEngine.sizeThatFits(_:) + 512
72  SwiftUI                       	    0x7ff929511073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
73  SwiftUI                       	    0x7ff9292b4166 RootGeometry.value.getter + 299
74  SwiftUI                       	    0x7ff92914dc7e specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 28
75  SwiftUI                       	    0x7ff929165187 partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 20
76  AttributeGraph                	    0x7ff929ed1757 AG::Graph::UpdateStack::update() + 559
77  AttributeGraph                	    0x7ff929ed1d57 AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421
78  AttributeGraph                	    0x7ff929edc35e AG::Subgraph::update(unsigned int) + 904
79  SwiftUI                       	    0x7ff929c5f4ab GraphHost.flushTransactions() + 495
80  SwiftUI                       	    0x7ff929c60304 closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:) + 15
81  SwiftUI                       	    0x7ff9292b46aa partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:) + 17
82  SwiftUI                       	    0x7ff929ac5ca8 closure #1 in ViewRendererHost.updateViewGraph<A>(body:) + 69
83  SwiftUI                       	    0x7ff929ac48df ViewRendererHost.updateViewGraph<A>(body:) + 78
84  SwiftUI                       	    0x7ff929ad2cd0 protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1> + 25
85  SwiftUI                       	    0x7ff9292ad2a4 ViewGraphDelegate.updateGraph<A>(body:) + 55
86  SwiftUI                       	    0x7ff9292b45e3 protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1> + 25
87  SwiftUI                       	    0x7ff929c602e0 closure #1 in GraphHost.init(data:) + 122
88  SwiftUI                       	    0x7ff929c6114e partial apply for closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:) + 19
89  SwiftUI                       	    0x7ff9292b5e3c thunk for @escaping @callee_guaranteed () -> () + 12
90  SwiftUI                       	    0x7ff929b4525b partial apply for thunk for @escaping @callee_guaranteed () -> () + 17
91  SwiftUI                       	    0x7ff929b42b20 static NSRunLoop.flushObservers() + 118
92  SwiftUI                       	    0x7ff929b451d8 closure #1 in closure #1 in static NSRunLoop.addObserver(_:) + 16
93  SwiftUI                       	    0x7ff929b3f716 specialized thunk for @callee_guaranteed () -> (@error @owned Error) + 14
94  libswiftObjectiveC.dylib      	    0x7ff832a57e7c autoreleasepool<A>(invoking:) + 44
95  SwiftUI                       	    0x7ff929b451c0 closure #1 in static NSRunLoop.addObserver(_:) + 35
96  SwiftUI                       	    0x7ff929b45205 @objc closure #1 in static NSRunLoop.addObserver(_:) + 43
97  CoreFoundation                	    0x7ff81db55450 __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
98  CoreFoundation                	    0x7ff81db552e2 __CFRunLoopDoObservers + 543
99  CoreFoundation                	    0x7ff81db54897 __CFRunLoopRun + 1131
100 CoreFoundation                	    0x7ff81db53d6c CFRunLoopRunSpecific + 562
101 HIToolbox                     	    0x7ff8268065e6 RunCurrentEventLoopInMode + 292
102 HIToolbox                     	    0x7ff82680634a ReceiveNextEventCommon + 594
103 HIToolbox                     	    0x7ff8268060e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
104 AppKit                        	    0x7ff820592aa9 _DPSNextEvent + 927
105 AppKit                        	    0x7ff820591166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
106 AppKit                        	    0x7ff820583818 -[NSApplication run] + 586
107 AppKit                        	    0x7ff82055779a NSApplicationMain + 817
108 SwiftUI                       	    0x7ff9290a809c specialized runApp(_:) + 161
109 SwiftUI                       	    0x7ff929b0a424 runApp<A>(_:) + 164
110 SwiftUI                       	    0x7ff929602c5f static App.main() + 63
111 RedLemon                      	       0x10a0357b3 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
112 RedLemon                      	       0x10a035839 RedLemon_main + 9
113 dyld                          	       0x11d90552e start + 462

Thread 1 Crashed::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libswiftCore.dylib            	    0x7ff82af7fff8 closure #1 in closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:) + 456
1   libswiftCore.dylib            	    0x7ff82af7fd0b closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:) + 267
2   libswiftCore.dylib            	    0x7ff82af7fafd closure #1 in _assertionFailure(_:_:file:line:flags:) + 333
3   libswiftCore.dylib            	    0x7ff82af7f675 _assertionFailure(_:_:file:line:flags:) + 309
4   libswiftCore.dylib            	    0x7ff82af9a74b Dictionary.init(dictionaryLiteral:) + 875
5   RedLemon                      	       0x10ac41d3a (1) suspend resume partial function for SupabaseClient.upsertWatchHistory(item:userId:) + 2218 (SupabaseClient.swift:1239)
6   RedLemon                      	       0x10ab299b1 (2) await resume partial function for closure #1 in SocialService.syncLocalHistory() + 1 (SocialService.swift:642)

Thread 2::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   dyld                          	       0x11d93284d invocation function for block in dyld3::MachOFile::forEachSegment(void (dyld3::MachOFile::SegmentInfo const&, bool&) block_pointer) const + 81
1   dyld                          	       0x11d901db3 dyld3::MachOFile::forEachLoadCommand(Diagnostics&, void (load_command const*, bool&) block_pointer) const + 129
2   dyld                          	       0x11d9327d2 dyld3::MachOFile::forEachSegment(void (dyld3::MachOFile::SegmentInfo const&, bool&) block_pointer) const + 154
3   dyld                          	       0x11d932a9d dyld3::MachOFile::preferredLoadAddress() const + 95
4   dyld                          	       0x11d9174e8 dyld4::JustInTimeLoader::contains(dyld4::RuntimeState&, void const*, void const**, unsigned long long*, unsigned char*) const + 88
5   dyld                          	       0x11d9231bc invocation function for block in dyld4::APIs::findImageMappedAt(void const*, dyld3::MachOLoaded const**, bool*, char const**, void const**, unsigned long long*, unsigned char*) + 106
6   dyld                          	       0x11d90a6c9 dyld4::RuntimeState::withLoadersReadLock(void () block_pointer) + 41
7   dyld                          	       0x11d923078 dyld4::APIs::findImageMappedAt(void const*, dyld3::MachOLoaded const**, bool*, char const**, void const**, unsigned long long*, unsigned char*) + 782
8   dyld                          	       0x11d923288 dyld4::APIs::dyld_image_header_containing_address(void const*) + 48
9   libsystem_trace.dylib         	    0x7ff81d802275 _os_log_impl_flatten_and_send + 2502
10  libsystem_trace.dylib         	    0x7ff81d80555f _os_log_with_args_impl + 448
11  libsystem_asl.dylib           	    0x7ff822a3185f asl_log + 250
12  libswiftCore.dylib            	    0x7ff82b247a82 swift_reportError + 66
13  libswiftCore.dylib            	    0x7ff82b2e26e1 _swift_stdlib_reportFatalErrorInFile + 113
14  libswiftCore.dylib            	    0x7ff82af7fff4 closure #1 in closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:) + 452
15  libswiftCore.dylib            	    0x7ff82af7fd0b closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:) + 267
16  libswiftCore.dylib            	    0x7ff82af7fafd closure #1 in _assertionFailure(_:_:file:line:flags:) + 333
17  libswiftCore.dylib            	    0x7ff82af7f675 _assertionFailure(_:_:file:line:flags:) + 309
18  libswiftCore.dylib            	    0x7ff82af9a74b Dictionary.init(dictionaryLiteral:) + 875
19  RedLemon                      	       0x10ac41d3a (1) suspend resume partial function for SupabaseClient.upsertWatchHistory(item:userId:) + 2218 (SupabaseClient.swift:1239)
20  RedLemon                      	       0x10ab299b1 (2) await resume partial function for closure #1 in SocialService.syncLocalHistory() + 1 (SocialService.swift:642)

Thread 3:
0   libsystem_pthread.dylib       	    0x7ff81da8af48 start_wqthread + 0

Thread 4:
0   libsystem_pthread.dylib       	    0x7ff81da8af48 start_wqthread + 0

Thread 5:
0   libsystem_pthread.dylib       	    0x7ff81da8af48 start_wqthread + 0

Thread 6:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff81da5293a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff81da52ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81db5629d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81db54928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81db53d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff820700572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff81da8f4e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff81da8af6b thread_start + 15

Thread 7::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libsystem_kernel.dylib        	    0x7ff81da540aa __ulock_wait + 10
1   libsystem_platform.dylib      	    0x7ff81daa327e _os_unfair_lock_lock_slow + 155
2   dyld                          	       0x11d90a6c2 dyld4::RuntimeState::withLoadersReadLock(void () block_pointer) + 34
3   dyld                          	       0x11d923078 dyld4::APIs::findImageMappedAt(void const*, dyld3::MachOLoaded const**, bool*, char const**, void const**, unsigned long long*, unsigned char*) + 782
4   dyld                          	       0x11d923288 dyld4::APIs::dyld_image_header_containing_address(void const*) + 48
5   libsystem_trace.dylib         	    0x7ff81d802275 _os_log_impl_flatten_and_send + 2502
6   libsystem_trace.dylib         	    0x7ff81d80555f _os_log_with_args_impl + 448
7   libsystem_asl.dylib           	    0x7ff822a3185f asl_log + 250
8   libswiftCore.dylib            	    0x7ff82b247a82 swift_reportError + 66
9   libswiftCore.dylib            	    0x7ff82b2e26e1 _swift_stdlib_reportFatalErrorInFile + 113
10  libswiftCore.dylib            	    0x7ff82af7fff4 closure #1 in closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:) + 452
11  libswiftCore.dylib            	    0x7ff82af7fd0b closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:) + 267
12  libswiftCore.dylib            	    0x7ff82af7fafd closure #1 in _assertionFailure(_:_:file:line:flags:) + 333
13  libswiftCore.dylib            	    0x7ff82af7f675 _assertionFailure(_:_:file:line:flags:) + 309
14  libswiftCore.dylib            	    0x7ff82af9a74b Dictionary.init(dictionaryLiteral:) + 875
15  RedLemon                      	       0x10ac41d3a (1) suspend resume partial function for SupabaseClient.upsertWatchHistory(item:userId:) + 2218 (SupabaseClient.swift:1239)
16  RedLemon                      	       0x10ab299b1 (2) await resume partial function for closure #1 in SocialService.syncLocalHistory() + 1 (SocialService.swift:642)

Thread 8:
0   libsystem_pthread.dylib       	    0x7ff81da8af48 start_wqthread + 0

Thread 9:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff81da5293a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff81da52ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81db5629d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81db54928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81db53d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff822782964 0x7ff82253a000 + 2394468
6   Foundation                    	    0x7ff81e9ab724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff81da8f4e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff81da8af6b thread_start + 15

Thread 10:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff81da5730e kevent + 10
1   RedLemon                      	       0x109e1e2c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x109e281ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109e28844 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109e1ef7b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109e280e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x109e04bb6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x109e05c1f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109df6ae3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x109e033cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x109dfccf4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x109df15ae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x109df49d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x109de9562 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x109de95ac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff832a57e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x109de9509 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x109df062f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x109d92348 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x109d92a9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x109d98d73 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x109e28c3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x109e2b7af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x109e2b869 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff81da8f4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff81da8af6b thread_start + 15

Thread 11:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff81da5730e kevent + 10
1   RedLemon                      	       0x109e1e2c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x109e281ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109e28844 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109e1ef7b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109e280e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x109e04bb6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x109e05c1f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109df6ae3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x109e033cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x109dfccf4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x109df15ae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x109df49d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x109de9562 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x109de95ac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff832a57e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x109de9509 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x109df062f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x109d92348 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x109d92a9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x109d98d73 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x109e28c3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x109e2b7af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x109e2b869 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff81da8f4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff81da8af6b thread_start + 15

Thread 12:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff81da5730e kevent + 10
1   RedLemon                      	       0x109e1e2c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x109e281ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109e28844 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109e1ef7b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109e280e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x109e04bb6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x109e05c1f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109df6ae3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x109e033cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x109dfccf4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x109df15ae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x109df49d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x109de9562 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x109de95ac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff832a57e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x109de9509 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x109df062f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x109d92348 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x109d92a9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x109d98d73 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x109e28c3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x109e2b7af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x109e2b869 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff81da8f4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff81da8af6b thread_start + 15

Thread 13:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff81da5730e kevent + 10
1   RedLemon                      	       0x109e1e2c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x109e281ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x109e28844 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x109e1ef7b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x109e280e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x109e04bb6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x109e05c1f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x109df6ae3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x109e033cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x109dfccf4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x109df15ae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x109df49d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x109de9562 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x109de95ac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff832a57e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x109de9509 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x109df062f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x109d92348 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x109d92a9a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x109d98d73 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x109e28c3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x109e2b7af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x109e2b869 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff81da8f4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff81da8af6b thread_start + 15

Thread 14:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff81da52976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81d8d77ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81d8d7c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x109d9b23f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x109d9c10e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109e28c3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x109e2b7af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x109e2b869 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81da8f4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81da8af6b thread_start + 15

Thread 15:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff81da52976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81d8d77ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81d8d7c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x109d9b23f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x109d9c10e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109e28c3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x109e2b7af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x109e2b869 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81da8f4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81da8af6b thread_start + 15

Thread 16:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff81da52976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81d8d77ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81d8d7c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x109d9b23f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x109d9c10e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109e28c3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x109e2b7af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x109e2b869 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81da8f4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81da8af6b thread_start + 15

Thread 17:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff81da52976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81d8d77ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81d8d7c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x109d9b23f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x109d9c10e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x109e28c3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x109e2b7af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x109e2b869 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81da8f4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81da8af6b thread_start + 15


Thread 1 crashed with X86 Thread State (64-bit):
  rax: 0x0000000000000903  rbx: 0x0000000000000001  rcx: 0x0000000000000000  rdx: 0x000000000006a6f0
  rdi: 0x000000010f388080  rsi: 0x00000000eadc8efb  rbp: 0x000070000e576920  rsp: 0x000070000e576910
   r8: 0x00000000000080b6   r9: 0x0000000000000005  r10: 0x00007fa2ab300000  r11: 0x0000000000000000
  r12: 0x0000000000000002  r13: 0x00007fa2ab38f1e0  r14: 0x000000000000033a  r15: 0x0000000000000001
  rip: 0x00007ff82af7fff8  rfl: 0x0000000000010202  cr2: 0x0000000000000000
  
Logical CPU:     3
Error Code:      0x00000000 
Trap Number:     6

Thread 1 instruction stream:
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
    0x7ff82af4d000 -     0x7ff82b3c6fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff92902c000 -     0x7ff929ecbfff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
    0x7ff929ecc000 -     0x7ff929f02fff com.apple.AttributeGraph (3.2.1) <e9337c46-2775-39dc-ae3d-14ccf80d629f> /System/Library/PrivateFrameworks/AttributeGraph.framework/Versions/A/AttributeGraph
    0x7ff832a57000 -     0x7ff832a58fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff81dad6000 -     0x7ff81dfd8fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff8267d8000 -     0x7ff826acbfff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff820554000 -     0x7ff8213e3fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x108f96000 -        0x10b3bdfff com.redlemon.app (1.0.14) <9be64068-0fff-37d2-88b3-93a64df3cee5> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x11d900000 -        0x11d96bfff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff81d7fd000 -     0x7ff81d815fff libsystem_trace.dylib (*) <707e7930-370d-393f-aeb0-949e48a6e19c> /usr/lib/system/libsystem_trace.dylib
    0x7ff822a2e000 -     0x7ff822a44fff libsystem_asl.dylib (*) <80129583-979f-358f-a3f3-68b96c93859e> /usr/lib/system/libsystem_asl.dylib
    0x7ff81da89000 -     0x7ff81da94fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff81da51000 -     0x7ff81da88fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff81daa1000 -     0x7ff81daaafff libsystem_platform.dylib (*) <81a897b2-8752-3f99-833e-da16ffa9fa58> /usr/lib/system/libsystem_platform.dylib
    0x7ff82253a000 -     0x7ff8229c8fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff81e953000 -     0x7ff81ed0ffff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff81d8d4000 -     0x7ff81d91afff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib

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
Writable regions: Total=148.5M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=148.5M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               256K        2 
Activity Tracing                   256K        1 
CG image                           244K        4 
CG raster data                      68K        8 
ColorSync                          228K       27 
CoreAnimation                      712K       43 
CoreGraphics                         4K        1 
CoreUI image data                 1320K        9 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
Image IO                          4144K        5 
Kernel Alloc Once                    8K        1 
MALLOC                            60.6M       76 
MALLOC guard page                   48K       11 
SQLite page cache                  192K        3 
STACK GUARD                       56.1M       18 
Stack                             17.1M       21 
Stack Guard                          4K        1 
VM_ALLOCATE                       1056K        7 
__CTF                               756        1 
__DATA                            55.0M      596 
__DATA_CONST                      33.3M      406 
__DATA_DIRTY                      1651K      202 
__FONT_DATA                          4K        1 
__LINKEDIT                       717.8M       83 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           587.5M      604 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        13.6M       40 
mapped file                      156.7M       30 
shared memory                      768K       16 
===========                     =======  ======= 
TOTAL                              1.8G     2226 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-12-16 13:42:37.00 -0500","app_version":"1.0.14","slice_uuid":"9be64068-0fff-37d2-88b3-93a64df3cee5","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"2329E87E-0871-4561-A5BC-86FCC859D08B","name":"RedLemon"}
{
  "uptime" : 14000,
  "procLaunch" : "2025-12-16 13:42:14.9741 -0500",
  "procRole" : "Background",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 14161803356893,
  "coalitionID" : 672,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-12-16 13:42:17.5879 -0500",
  "incident" : "2329E87E-0871-4561-A5BC-86FCC859D08B",
  "bug_type" : "309",
  "pid" : 25062,
  "procExitAbsTime" : 14164411835526,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 24940,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 590,
  "responsibleProc" : "Electron",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_INSTRUCTION","signal":"SIGILL"},
  "termination" : {"flags":0,"code":4,"namespace":"SIGNAL","indicator":"Illegal instruction: 4","byProc":"exc handler","byPid":25062},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 1,
  "threads" : [{"id":154028,"queue":"com.apple.main-thread","frames":[{"imageOffset":3129757,"symbol":"swift_release","symbolLocation":77,"imageIndex":0},{"imageOffset":3693100,"symbol":"ResolvedImageLayoutDelegate.sizeThatFits(_:)","symbolLocation":404,"imageIndex":1},{"imageOffset":13020290,"symbol":"StackLayout.UnmanagedImplementation.explicitAlignment(_:at:)","symbolLocation":502,"imageIndex":1},{"imageOffset":13019731,"symbol":"StackLayout.Storage.explicitAlignment(_:at:)","symbolLocation":109,"imageIndex":1},{"imageOffset":9004992,"symbol":"UnaryLayoutEngine.explicitAlignment(_:at:)","symbolLocation":292,"imageIndex":1},{"imageOffset":9005243,"symbol":"protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A>","symbolLocation":9,"imageIndex":1},{"imageOffset":5132699,"symbol":"LayoutComputer.EngineDelegate.explicitAlignment(_:at:)","symbolLocation":109,"imageIndex":1},{"imageOffset":9004992,"symbol":"UnaryLayoutEngine.explicitAlignment(_:at:)","symbolLocation":292,"imageIndex":1},{"imageOffset":9005243,"symbol":"protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A>","symbolLocation":9,"imageIndex":1},{"imageOffset":5132699,"symbol":"LayoutComputer.EngineDelegate.explicitAlignment(_:at:)","symbolLocation":109,"imageIndex":1},{"imageOffset":13020481,"symbol":"StackLayout.UnmanagedImplementation.explicitAlignment(_:at:)","symbolLocation":693,"imageIndex":1},{"imageOffset":13019731,"symbol":"StackLayout.Storage.explicitAlignment(_:at:)","symbolLocation":109,"imageIndex":1},{"imageOffset":9004992,"symbol":"UnaryLayoutEngine.explicitAlignment(_:at:)","symbolLocation":292,"imageIndex":1},{"imageOffset":9005243,"symbol":"protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A>","symbolLocation":9,"imageIndex":1},{"imageOffset":5132699,"symbol":"LayoutComputer.EngineDelegate.explicitAlignment(_:at:)","symbolLocation":109,"imageIndex":1},{"imageOffset":9004992,"symbol":"UnaryLayoutEngine.explicitAlignment(_:at:)","symbolLocation":292,"imageIndex":1},{"imageOffset":9005243,"symbol":"protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A>","symbolLocation":9,"imageIndex":1},{"imageOffset":5132699,"symbol":"LayoutComputer.EngineDelegate.explicitAlignment(_:at:)","symbolLocation":109,"imageIndex":1},{"imageOffset":13020481,"symbol":"StackLayout.UnmanagedImplementation.explicitAlignment(_:at:)","symbolLocation":693,"imageIndex":1},{"imageOffset":13019731,"symbol":"StackLayout.Storage.explicitAlignment(_:at:)","symbolLocation":109,"imageIndex":1},{"imageOffset":9362861,"symbol":"_LayoutEngine.explicitAlignment(_:at:)","symbolLocation":605,"imageIndex":1},{"imageOffset":9363358,"symbol":"protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance _LayoutEngine<A>","symbolLocation":9,"imageIndex":1},{"imageOffset":5132699,"symbol":"LayoutComputer.EngineDelegate.explicitAlignment(_:at:)","symbolLocation":109,"imageIndex":1},{"imageOffset":1044823,"symbol":"specialized FrameLayoutCommon.commonPlacement(of:in:childProposal:)","symbolLocation":1032,"imageIndex":1},{"imageOffset":5121013,"symbol":"_FlexFrameLayout.placement(of:in:)","symbolLocation":73,"imageIndex":1},{"imageOffset":5121695,"symbol":"protocol witness for UnaryLayout.placement(of:in:) in conformance _FlexFrameLayout","symbolLocation":75,"imageIndex":1},{"imageOffset":9005186,"symbol":"closure #1 in UnaryLayoutEngine.childPlacement(at:)","symbolLocation":66,"imageIndex":1},{"imageOffset":9001797,"symbol":"UnaryLayoutEngine.childPlacement(at:)","symbolLocation":552,"imageIndex":1},{"imageOffset":9004749,"symbol":"UnaryLayoutEngine.explicitAlignment(_:at:)","symbolLocation":49,"imageIndex":1},{"imageOffset":9005243,"symbol":"protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A>","symbolLocation":9,"imageIndex":1},{"imageOffset":5132699,"symbol":"LayoutComputer.EngineDelegate.explicitAlignment(_:at:)","symbolLocation":109,"imageIndex":1},{"imageOffset":11343513,"symbol":"ViewDimensions.subscript.getter","symbolLocation":67,"imageIndex":1},{"imageOffset":13023334,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":217,"imageIndex":1},{"imageOffset":13024183,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:)","symbolLocation":167,"imageIndex":1},{"imageOffset":13030899,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":105,"imageIndex":1},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":1},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":1},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":1},{"imageOffset":4147298,"symbol":"_PaddingLayout.sizeThatFits(in:context:child:)","symbolLocation":187,"imageIndex":1},{"imageOffset":4148107,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout","symbolLocation":49,"imageIndex":1},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":1},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":1},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":1},{"imageOffset":4147298,"symbol":"_PaddingLayout.sizeThatFits(in:context:child:)","symbolLocation":187,"imageIndex":1},{"imageOffset":4148107,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout","symbolLocation":49,"imageIndex":1},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":1},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":1},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":1},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":1},{"imageOffset":13024183,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:)","symbolLocation":167,"imageIndex":1},{"imageOffset":13030899,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":105,"imageIndex":1},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":1},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":1},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":1},{"imageOffset":2788681,"symbol":"static ScrollViewUtilities.sizeThatFits(in:contentComputer:axes:)","symbolLocation":214,"imageIndex":1},{"imageOffset":8704201,"symbol":"closure #1 in SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:)","symbolLocation":196,"imageIndex":1},{"imageOffset":8703727,"symbol":"SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:)","symbolLocation":470,"imageIndex":1},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":1},{"imageOffset":12889530,"symbol":"_ZStackLayout.sizeThatFits(in:context:children:)","symbolLocation":870,"imageIndex":1},{"imageOffset":9360291,"symbol":"closure #1 in _LayoutEngine.sizeThatFits(_:)","symbolLocation":79,"imageIndex":1},{"imageOffset":9359950,"symbol":"_LayoutEngine.sizeThatFits(_:)","symbolLocation":506,"imageIndex":1},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":1},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":1},{"imageOffset":13026274,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":757,"imageIndex":1},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":1},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":1},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":1},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":1},{"imageOffset":5120536,"symbol":"_FlexFrameLayout.sizeThatFits(in:context:child:)","symbolLocation":501,"imageIndex":1},{"imageOffset":5121752,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout","symbolLocation":46,"imageIndex":1},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":1},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":1},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":1},{"imageOffset":2654566,"symbol":"RootGeometry.value.getter","symbolLocation":299,"imageIndex":1},{"imageOffset":1186942,"symbol":"specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":28,"imageIndex":1},{"imageOffset":1282439,"symbol":"partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":20,"imageIndex":1},{"imageOffset":22359,"symbol":"AG::Graph::UpdateStack::update()","symbolLocation":559,"imageIndex":2},{"imageOffset":23895,"symbol":"AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int)","symbolLocation":421,"imageIndex":2},{"imageOffset":66398,"symbol":"AG::Subgraph::update(unsigned int)","symbolLocation":904,"imageIndex":2},{"imageOffset":12793003,"symbol":"GraphHost.flushTransactions()","symbolLocation":495,"imageIndex":1},{"imageOffset":12796676,"symbol":"closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:)","symbolLocation":15,"imageIndex":1},{"imageOffset":2655914,"symbol":"partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":17,"imageIndex":1},{"imageOffset":11115688,"symbol":"closure #1 in ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":69,"imageIndex":1},{"imageOffset":11110623,"symbol":"ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":78,"imageIndex":1},{"imageOffset":11168976,"symbol":"protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":1},{"imageOffset":2626212,"symbol":"ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":55,"imageIndex":1},{"imageOffset":2655715,"symbol":"protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":1},{"imageOffset":12796640,"symbol":"closure #1 in GraphHost.init(data:)","symbolLocation":122,"imageIndex":1},{"imageOffset":12800334,"symbol":"partial apply for closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:)","symbolLocation":19,"imageIndex":1},{"imageOffset":2661948,"symbol":"thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":12,"imageIndex":1},{"imageOffset":11637339,"symbol":"partial apply for thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":17,"imageIndex":1},{"imageOffset":11627296,"symbol":"static NSRunLoop.flushObservers()","symbolLocation":118,"imageIndex":1},{"imageOffset":11637208,"symbol":"closure #1 in closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":16,"imageIndex":1},{"imageOffset":11613974,"symbol":"specialized thunk for @callee_guaranteed () -> (@error @owned Error)","symbolLocation":14,"imageIndex":1},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":3},{"imageOffset":11637184,"symbol":"closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":35,"imageIndex":1},{"imageOffset":11637253,"symbol":"@objc closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":43,"imageIndex":1},{"imageOffset":521296,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__","symbolLocation":23,"imageIndex":4},{"imageOffset":520930,"symbol":"__CFRunLoopDoObservers","symbolLocation":543,"imageIndex":4},{"imageOffset":518295,"symbol":"__CFRunLoopRun","symbolLocation":1131,"imageIndex":4},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":4},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":5},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":5},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":5},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":6},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":6},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":6},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":6},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":1},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":1},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":1},{"imageOffset":17430451,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":7,"symbolLocation":35},{"imageOffset":17430585,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":7},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":8}]},{"triggered":true,"id":154033,"instructionState":{"instructionStream":{"bytes":[141,5,42,11,66,0,72,141,61,103,159,65,0,72,141,13,124,162,65,0,190,11,0,0,0,65,184,57,0,0,0,186,2,0,0,0,65,185,2,0,0,0,106,1,106,94,233,251,254,255,255,77,133,210,121,74,72,190,255,255,255,127,255,255,255,255,73,57,242,127,68,72,131,236,8,72,141,5,110,159,65,0,72,141,61,27,159,65,0,72,141,13,128,159,65,0,190,11,0,0,0,65,184,43,0,0,0,186,2,0,0,0,65,185,2,0,0,0,106,1,104,230,13,0,0,233,14,255,255,255,73,57,242,15,131,207,254,255,255,76,139,93,16,76,137,222,72,193,238,32,117,34,139,93,24,72,137,215,137,206,76,137,194,68,137,201,73,137,192,69,137,209,83,65,83,232,124,38,54,0,72,131,196,16,15,11,72,131,236,8,72,141],"offset":184}},"threadState":{"r13":{"value":140336634065376},"rax":{"value":2307},"rflags":{"value":66050},"cpu":{"value":3},"r14":{"value":826},"rsi":{"value":3940323067},"r8":{"value":32950},"cr2":{"value":0},"rdx":{"value":435952},"r10":{"value":140336633479168},"r9":{"value":5},"r15":{"value":1},"rbx":{"value":1},"trap":{"value":6},"err":{"value":0},"r11":{"value":0},"rip":{"value":140703849512952,"matchesCrashFrame":1},"rbp":{"value":123145542920480},"rsp":{"value":123145542920464},"r12":{"value":2},"rcx":{"value":0},"flavor":"x86_THREAD_STATE","rdi":{"value":4550328448}},"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":208888,"symbol":"closure #1 in closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":456,"imageIndex":0},{"imageOffset":208139,"symbol":"closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":267,"imageIndex":0},{"imageOffset":207613,"symbol":"closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":333,"imageIndex":0},{"imageOffset":206453,"symbol":"_assertionFailure(_:_:file:line:flags:)","symbolLocation":309,"imageIndex":0},{"imageOffset":317259,"symbol":"Dictionary.init(dictionaryLiteral:)","symbolLocation":875,"imageIndex":0},{"imageOffset":30063930,"sourceLine":1239,"sourceFile":"SupabaseClient.swift","symbol":"(1) suspend resume partial function for SupabaseClient.upsertWatchHistory(item:userId:)","imageIndex":7,"symbolLocation":2218},{"imageOffset":28916145,"sourceLine":642,"sourceFile":"SocialService.swift","symbol":"(2) await resume partial function for closure #1 in SocialService.syncLocalHistory()","imageIndex":7,"symbolLocation":1}]},{"id":154034,"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":206925,"symbol":"invocation function for block in dyld3::MachOFile::forEachSegment(void (dyld3::MachOFile::SegmentInfo const&, bool&) block_pointer) const","symbolLocation":81,"imageIndex":8},{"imageOffset":7603,"symbol":"dyld3::MachOFile::forEachLoadCommand(Diagnostics&, void (load_command const*, bool&) block_pointer) const","symbolLocation":129,"imageIndex":8},{"imageOffset":206802,"symbol":"dyld3::MachOFile::forEachSegment(void (dyld3::MachOFile::SegmentInfo const&, bool&) block_pointer) const","symbolLocation":154,"imageIndex":8},{"imageOffset":207517,"symbol":"dyld3::MachOFile::preferredLoadAddress() const","symbolLocation":95,"imageIndex":8},{"imageOffset":95464,"symbol":"dyld4::JustInTimeLoader::contains(dyld4::RuntimeState&, void const*, void const**, unsigned long long*, unsigned char*) const","symbolLocation":88,"imageIndex":8},{"imageOffset":143804,"symbol":"invocation function for block in dyld4::APIs::findImageMappedAt(void const*, dyld3::MachOLoaded const**, bool*, char const**, void const**, unsigned long long*, unsigned char*)","symbolLocation":106,"imageIndex":8},{"imageOffset":42697,"symbol":"dyld4::RuntimeState::withLoadersReadLock(void () block_pointer)","symbolLocation":41,"imageIndex":8},{"imageOffset":143480,"symbol":"dyld4::APIs::findImageMappedAt(void const*, dyld3::MachOLoaded const**, bool*, char const**, void const**, unsigned long long*, unsigned char*)","symbolLocation":782,"imageIndex":8},{"imageOffset":144008,"symbol":"dyld4::APIs::dyld_image_header_containing_address(void const*)","symbolLocation":48,"imageIndex":8},{"imageOffset":21109,"symbol":"_os_log_impl_flatten_and_send","symbolLocation":2502,"imageIndex":9},{"imageOffset":34143,"symbol":"_os_log_with_args_impl","symbolLocation":448,"imageIndex":9},{"imageOffset":14431,"symbol":"asl_log","symbolLocation":250,"imageIndex":10},{"imageOffset":3123842,"symbol":"swift_reportError","symbolLocation":66,"imageIndex":0},{"imageOffset":3757793,"symbol":"_swift_stdlib_reportFatalErrorInFile","symbolLocation":113,"imageIndex":0},{"imageOffset":208884,"symbol":"closure #1 in closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":452,"imageIndex":0},{"imageOffset":208139,"symbol":"closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":267,"imageIndex":0},{"imageOffset":207613,"symbol":"closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":333,"imageIndex":0},{"imageOffset":206453,"symbol":"_assertionFailure(_:_:file:line:flags:)","symbolLocation":309,"imageIndex":0},{"imageOffset":317259,"symbol":"Dictionary.init(dictionaryLiteral:)","symbolLocation":875,"imageIndex":0},{"imageOffset":30063930,"sourceLine":1239,"sourceFile":"SupabaseClient.swift","symbol":"(1) suspend resume partial function for SupabaseClient.upsertWatchHistory(item:userId:)","imageIndex":7,"symbolLocation":2218},{"imageOffset":28916145,"sourceLine":642,"sourceFile":"SocialService.swift","symbol":"(2) await resume partial function for closure #1 in SocialService.syncLocalHistory()","imageIndex":7,"symbolLocation":1}]},{"id":154035,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]},{"id":154036,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]},{"id":154057,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]},{"id":154077,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":12},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":12},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":4},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":4},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":4},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":6},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":154081,"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":12458,"symbol":"__ulock_wait","symbolLocation":10,"imageIndex":12},{"imageOffset":8830,"symbol":"_os_unfair_lock_lock_slow","symbolLocation":155,"imageIndex":13},{"imageOffset":42690,"symbol":"dyld4::RuntimeState::withLoadersReadLock(void () block_pointer)","symbolLocation":34,"imageIndex":8},{"imageOffset":143480,"symbol":"dyld4::APIs::findImageMappedAt(void const*, dyld3::MachOLoaded const**, bool*, char const**, void const**, unsigned long long*, unsigned char*)","symbolLocation":782,"imageIndex":8},{"imageOffset":144008,"symbol":"dyld4::APIs::dyld_image_header_containing_address(void const*)","symbolLocation":48,"imageIndex":8},{"imageOffset":21109,"symbol":"_os_log_impl_flatten_and_send","symbolLocation":2502,"imageIndex":9},{"imageOffset":34143,"symbol":"_os_log_with_args_impl","symbolLocation":448,"imageIndex":9},{"imageOffset":14431,"symbol":"asl_log","symbolLocation":250,"imageIndex":10},{"imageOffset":3123842,"symbol":"swift_reportError","symbolLocation":66,"imageIndex":0},{"imageOffset":3757793,"symbol":"_swift_stdlib_reportFatalErrorInFile","symbolLocation":113,"imageIndex":0},{"imageOffset":208884,"symbol":"closure #1 in closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":452,"imageIndex":0},{"imageOffset":208139,"symbol":"closure #1 in closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":267,"imageIndex":0},{"imageOffset":207613,"symbol":"closure #1 in _assertionFailure(_:_:file:line:flags:)","symbolLocation":333,"imageIndex":0},{"imageOffset":206453,"symbol":"_assertionFailure(_:_:file:line:flags:)","symbolLocation":309,"imageIndex":0},{"imageOffset":317259,"symbol":"Dictionary.init(dictionaryLiteral:)","symbolLocation":875,"imageIndex":0},{"imageOffset":30063930,"sourceLine":1239,"sourceFile":"SupabaseClient.swift","symbol":"(1) suspend resume partial function for SupabaseClient.upsertWatchHistory(item:userId:)","imageIndex":7,"symbolLocation":2218},{"imageOffset":28916145,"sourceLine":642,"sourceFile":"SocialService.swift","symbol":"(2) await resume partial function for closure #1 in SocialService.syncLocalHistory()","imageIndex":7,"symbolLocation":1}]},{"id":154082,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]},{"id":154086,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":12},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":12},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":4},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":4},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":4},{"imageOffset":2394468,"imageIndex":14},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":15},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":154100,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":12},{"imageOffset":15237833,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":7},{"imageOffset":15278575,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":95},{"imageOffset":15280196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":7},{"imageOffset":15241083,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":7,"symbolLocation":395},{"imageOffset":15278312,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":312},{"imageOffset":15133622,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":230},{"imageOffset":15137823,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":7},{"imageOffset":15076067,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":7,"symbolLocation":467},{"imageOffset":15127501,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":1053},{"imageOffset":15101172,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":100},{"imageOffset":15054254,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":7,"symbolLocation":158},{"imageOffset":15067604,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":7},{"imageOffset":15021410,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":34},{"imageOffset":15021484,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":7},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":3},{"imageOffset":15021321,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":57},{"imageOffset":15050287,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":7,"symbolLocation":591},{"imageOffset":14664520,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":7,"symbolLocation":856},{"imageOffset":14666394,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":7,"symbolLocation":282},{"imageOffset":14691699,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":7},{"imageOffset":15281215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15292335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15292521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":154101,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":12},{"imageOffset":15237833,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":7},{"imageOffset":15278575,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":95},{"imageOffset":15280196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":7},{"imageOffset":15241083,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":7,"symbolLocation":395},{"imageOffset":15278312,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":312},{"imageOffset":15133622,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":230},{"imageOffset":15137823,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":7},{"imageOffset":15076067,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":7,"symbolLocation":467},{"imageOffset":15127501,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":1053},{"imageOffset":15101172,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":100},{"imageOffset":15054254,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":7,"symbolLocation":158},{"imageOffset":15067604,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":7},{"imageOffset":15021410,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":34},{"imageOffset":15021484,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":7},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":3},{"imageOffset":15021321,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":57},{"imageOffset":15050287,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":7,"symbolLocation":591},{"imageOffset":14664520,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":7,"symbolLocation":856},{"imageOffset":14666394,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":7,"symbolLocation":282},{"imageOffset":14691699,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":7},{"imageOffset":15281215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15292335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15292521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":154102,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":12},{"imageOffset":15237833,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":7},{"imageOffset":15278575,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":95},{"imageOffset":15280196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":7},{"imageOffset":15241083,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":7,"symbolLocation":395},{"imageOffset":15278312,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":312},{"imageOffset":15133622,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":230},{"imageOffset":15137823,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":7},{"imageOffset":15076067,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":7,"symbolLocation":467},{"imageOffset":15127501,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":1053},{"imageOffset":15101172,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":100},{"imageOffset":15054254,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":7,"symbolLocation":158},{"imageOffset":15067604,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":7},{"imageOffset":15021410,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":34},{"imageOffset":15021484,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":7},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":3},{"imageOffset":15021321,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":57},{"imageOffset":15050287,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":7,"symbolLocation":591},{"imageOffset":14664520,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":7,"symbolLocation":856},{"imageOffset":14666394,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":7,"symbolLocation":282},{"imageOffset":14691699,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":7},{"imageOffset":15281215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15292335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15292521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":154103,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":12},{"imageOffset":15237833,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":7},{"imageOffset":15278575,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":95},{"imageOffset":15280196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":7},{"imageOffset":15241083,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":7,"symbolLocation":395},{"imageOffset":15278312,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":7,"symbolLocation":312},{"imageOffset":15133622,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":230},{"imageOffset":15137823,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":7},{"imageOffset":15076067,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":7,"symbolLocation":467},{"imageOffset":15127501,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":1053},{"imageOffset":15101172,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":7,"symbolLocation":100},{"imageOffset":15054254,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":7,"symbolLocation":158},{"imageOffset":15067604,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":7},{"imageOffset":15021410,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":34},{"imageOffset":15021484,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":7},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":3},{"imageOffset":15021321,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":7,"symbolLocation":57},{"imageOffset":15050287,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":7,"symbolLocation":591},{"imageOffset":14664520,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":7,"symbolLocation":856},{"imageOffset":14666394,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":7,"symbolLocation":282},{"imageOffset":14691699,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":7},{"imageOffset":15281215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15292335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15292521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":154105,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":12},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":16},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":16},{"imageOffset":14701119,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":7,"symbolLocation":143},{"imageOffset":14704910,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":7,"symbolLocation":222},{"imageOffset":15281215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15292335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15292521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":154106,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":12},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":16},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":16},{"imageOffset":14701119,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":7,"symbolLocation":143},{"imageOffset":14704910,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":7,"symbolLocation":222},{"imageOffset":15281215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15292335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15292521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":154107,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":12},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":16},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":16},{"imageOffset":14701119,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":7,"symbolLocation":143},{"imageOffset":14704910,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":7,"symbolLocation":222},{"imageOffset":15281215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15292335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15292521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":154108,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":12},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":16},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":16},{"imageOffset":14701119,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":7,"symbolLocation":143},{"imageOffset":14704910,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":7,"symbolLocation":222},{"imageOffset":15281215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":7},{"imageOffset":15292335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":7,"symbolLocation":1007},{"imageOffset":15292521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703849304064,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140708111630336,
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
    "base" : 140708126965760,
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
    "base" : 140703978319872,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703626518528,
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
    "base" : 140703774375936,
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
    "base" : 140703671074816,
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
    "base" : 4445528064,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 37912576,
    "uuid" : "9be64068-0fff-37d2-88b3-93a64df3cee5",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4790943744,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703623532544,
    "size" : 102400,
    "uuid" : "707e7930-370d-393f-aeb0-949e48a6e19c",
    "path" : "\/usr\/lib\/system\/libsystem_trace.dylib",
    "name" : "libsystem_trace.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703709716480,
    "size" : 94208,
    "uuid" : "80129583-979f-358f-a3f3-68b96c93859e",
    "path" : "\/usr\/lib\/system\/libsystem_asl.dylib",
    "name" : "libsystem_asl.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703626203136,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703625973760,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703626301440,
    "size" : 40960,
    "uuid" : "81a897b2-8752-3f99-833e-da16ffa9fa58",
    "path" : "\/usr\/lib\/system\/libsystem_platform.dylib",
    "name" : "libsystem_platform.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703704522752,
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
    "base" : 140703641710592,
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
    "base" : 140703624413184,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703622942720,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=148.5M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=148.5M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               256K        2 \nActivity Tracing                   256K        1 \nCG image                           244K        4 \nCG raster data                      68K        8 \nColorSync                          228K       27 \nCoreAnimation                      712K       43 \nCoreGraphics                         4K        1 \nCoreUI image data                 1320K        9 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nImage IO                          4144K        5 \nKernel Alloc Once                    8K        1 \nMALLOC                            60.6M       76 \nMALLOC guard page                   48K       11 \nSQLite page cache                  192K        3 \nSTACK GUARD                       56.1M       18 \nStack                             17.1M       21 \nStack Guard                          4K        1 \nVM_ALLOCATE                       1056K        7 \n__CTF                               756        1 \n__DATA                            55.0M      596 \n__DATA_CONST                      33.3M      406 \n__DATA_DIRTY                      1651K      202 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       717.8M       83 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           587.5M      604 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      156.7M       30 \nshared memory                      768K       16 \n===========                     =======  ======= \nTOTAL                              1.8G     2226 \n",
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
