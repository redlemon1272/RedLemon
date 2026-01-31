-------------------------------------
Translated Report (Full Report Below)
-------------------------------------
Process:             RedLemon [80726]
Path:                /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:          com.redlemon.app
Version:             v1.0.182 (182)
Code Type:           ARM-64 (Native)
Role:                Foreground
Parent Process:      launchd [1]
Coalition:           com.redlemon.app [3568]
User ID:             502

Date/Time:           2026-01-31 15:50:02.2330 -0500
Launch Time:         2026-01-31 15:49:19.5671 -0500
Hardware Model:      Mac14,2
OS Version:          macOS 26.2 (25C56)
Release Type:        User

Crash Reporter Key:  23926D48-00F6-4930-A350-2C9BC76EE1AE
Incident Identifier: 2D278BD2-AAA5-4365-99D9-B9B3066F8805

Sleep/Wake UUID:       89B00B7C-502F-43A1-B10B-BDE6C965A808

Time Awake Since Boot: 15000 seconds
Time Since Wake:       1261 seconds

System Integrity Protection: enabled

Triggered by Thread: 24, Dispatch Queue: com.apple.root.default-qos.cooperative

Exception Type:    EXC_CRASH (SIGABRT)
Exception Codes:   0x0000000000000000, 0x0000000000000000

Termination Reason:  Namespace SIGNAL, Code 6, Abort trap: 6
Terminating Process: RedLemon [80726]


Application Specific Information:
abort() called


Thread 0::  Dispatch queue: com.apple.main-thread
0   libswiftCore.dylib            	       0x1a62daf04 swift::checkTransitiveCompleteness(swift::TargetMetadata<swift::InProcess> const*) + 0
1   libswiftCore.dylib            	       0x1a62e100c swift::GenericCacheEntry::tryInitialize(swift::TargetMetadata<swift::InProcess>*, swift::PrivateMetadataState, swift::PrivateMetadataCompletionContext*) + 836
2   libswiftCore.dylib            	       0x1a62e0868 swift::MetadataCacheEntryBase<swift::GenericCacheEntry, void const*>::doInitialization(swift::MetadataWaitQueue::Worker&, swift::MetadataRequest) + 104
3   libswiftCore.dylib            	       0x1a62e39b4 std::__1::pair<swift::GenericCacheEntry*, swift::MetadataResponse> swift::LockingConcurrentMap<swift::GenericCacheEntry, swift::LockingConcurrentMapStorage<swift::GenericCacheEntry, (unsigned short)14>>::getOrInsert<swift::MetadataCacheKey, swift::MetadataRequest&, swift::TargetTypeContextDescriptor<swift::InProcess> const*&, void const* const*&>(swift::MetadataCacheKey, swift::MetadataRequest&, swift::TargetTypeContextDescriptor<swift::InProcess> const*&, void const* const*&) + 212
4   libswiftCore.dylib            	       0x1a62cae88 _swift_getGenericMetadata(swift::MetadataRequest, void const* const*, swift::TargetTypeContextDescriptor<swift::InProcess> const*) + 280
5   libswiftCore.dylib            	       0x1a671f27c __swift_instantiateGenericMetadata + 36
6   libswiftCore.dylib            	       0x1a63074b8 (anonymous namespace)::DecodedMetadataBuilder::createBoundGenericType(swift::TargetContextDescriptor<swift::InProcess> const*, __swift::__runtime::llvm::ArrayRef<swift::MetadataPackOrValue>, swift::MetadataPackOrValue) const + 796
7   libswiftCore.dylib            	       0x1a6303484 swift::Demangle::__runtime::TypeDecoder<(anonymous namespace)::DecodedMetadataBuilder>::decodeMangledType(swift::Demangle::__runtime::Node*, unsigned int, bool) + 9016
8   libswiftCore.dylib            	       0x1a62fb7b8 swift_getTypeByMangledNodeImpl(swift::MetadataRequest, swift::Demangle::__runtime::Demangler&, swift::Demangle::__runtime::Node*, void const* const*, std::__1::function<void const* (unsigned int, unsigned int)>, std::__1::function<swift::TargetWitnessTable<swift::InProcess> const* (swift::TargetMetadata<swift::InProcess> const*, unsigned int)>) + 880
9   libswiftCore.dylib            	       0x1a62f70c8 swift_getTypeByMangledNode + 368
10  libswiftCore.dylib            	       0x1a62fc24c swift_getTypeByMangledNameImpl(swift::MetadataRequest, __swift::__runtime::llvm::StringRef, void const* const*, std::__1::function<void const* (unsigned int, unsigned int)>, std::__1::function<swift::TargetWitnessTable<swift::InProcess> const* (swift::TargetMetadata<swift::InProcess> const*, unsigned int)>) + 1204
11  libswiftCore.dylib            	       0x1a62f4c0c swift_getTypeByMangledName + 368
12  libswiftCore.dylib            	       0x1a62dc740 swift_getAssociatedTypeWitnessSlowImpl(swift::MetadataRequest, swift::TargetWitnessTable<swift::InProcess>*, swift::TargetMetadata<swift::InProcess> const*, swift::TargetProtocolRequirement<swift::InProcess> const*, swift::TargetProtocolRequirement<swift::InProcess> const*) + 472
13  libswiftCore.dylib            	       0x1a62d9b98 swift_getAssociatedTypeWitness + 88
14  libswiftCore.dylib            	       0x1a63cbbd4 Collection.first.getter + 80
15  Combine                       	       0x1a8b53e08 ConduitList.remove(_:) + 256
16  Combine                       	       0x1a8b1ae68 PublishedSubject.disassociate(_:) + 124
17  Combine                       	       0x1a8b1c40c PublishedSubject.Conduit.cancel() + 576
18  Combine                       	       0x1a8b541a4 protocol witness for Cancellable.cancel() in conformance ConduitBase<A, B> + 56
19  Combine                       	       0x1a8b24c2c AbstractCombineLatest.cancel() + 372
20  Combine                       	       0x1a8b253dc protocol witness for Cancellable.cancel() in conformance AbstractCombineLatest<A, B, C> + 24
21  Combine                       	       0x1a8b1a784 PublishedSubject.deinit + 204
22  Combine                       	       0x1a8b1a854 PublishedSubject.__deallocating_deinit + 16
23  libswiftCore.dylib            	       0x1a62be5a8 _swift_release_dealloc + 56
-------- RECURSION LEVEL 9
24  libswiftCore.dylib            	       0x1a62bf290 bool swift::RefCounts<swift::SideTableRefCountBits>::doDecrementSlow<(swift::PerformDeinit)1>(swift::SideTableRefCountBits, unsigned int) + 168
25  libswiftCore.dylib            	       0x1a62a27f4 void multiPayloadEnumGeneric<&handleRefCountsDestroy(swift::TargetMetadata<swift::InProcess> const*, swift::LayoutStringReader1&, unsigned long&, unsigned char*)>(swift::TargetMetadata<swift::InProcess> const*, swift::LayoutStringReader1&, unsigned long&, unsigned char*) + 264
26  libswiftCore.dylib            	       0x1a629e6c0 swift_cvw_destroyImpl(swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*) + 1120
27  RedLemon                      	       0x105890f38 FriendsViewModel.deinit + 184
28  RedLemon                      	       0x105891098 FriendsViewModel.__deallocating_deinit + 28
29  libswiftCore.dylib            	       0x1a62be5a8 _swift_release_dealloc + 56
-------- RECURSION LEVEL 8
30  libswiftCore.dylib            	       0x1a62bf290 bool swift::RefCounts<swift::SideTableRefCountBits>::doDecrementSlow<(swift::PerformDeinit)1>(swift::SideTableRefCountBits, unsigned int) + 168
31  RedLemon                      	       0x1055d8b74 outlined consume of StateObject<FriendsViewModel>.Storage + 44
32  RedLemon                      	       0x105662a00 0x1045a0000 + 17574400
33  libswiftCore.dylib            	       0x1a62be5a8 _swift_release_dealloc + 56
-------- RECURSION LEVEL 7
--------
-------- ELIDED 3 LEVELS OF RECURSION THROUGH 0x1a62be5a8 _swift_release_dealloc + 56
--------
44  libswiftCore.dylib            	       0x1a62bf114 bool swift::RefCounts<swift::RefCountBitsT<(swift::RefCountInlinedness)1>>::doDecrementSlow<(swift::PerformDeinit)1>(swift::RefCountBitsT<(swift::RefCountInlinedness)1>, unsigned int) + 152
45  SwiftUICore                   	       0x23ea2f3cc DefaultLayoutViewResponder.deinit + 48
46  SwiftUICore                   	       0x23ea30554 DefaultLayoutViewResponder.__deallocating_deinit + 16
47  libswiftCore.dylib            	       0x1a62be5a8 _swift_release_dealloc + 56
-------- RECURSION LEVEL 3
48  libswiftCore.dylib            	       0x1a62bf290 bool swift::RefCounts<swift::SideTableRefCountBits>::doDecrementSlow<(swift::PerformDeinit)1>(swift::SideTableRefCountBits, unsigned int) + 168
49  SwiftUI                       	       0x1c7a7b5e4 HostingScrollViewResponder.__deallocating_deinit + 172
50  libswiftCore.dylib            	       0x1a62be5a8 _swift_release_dealloc + 56
-------- RECURSION LEVEL 2
51  libswiftCore.dylib            	       0x1a62bf290 bool swift::RefCounts<swift::SideTableRefCountBits>::doDecrementSlow<(swift::PerformDeinit)1>(swift::SideTableRefCountBits, unsigned int) + 168
52  libswiftCore.dylib            	       0x1a629b938 swift_arrayDestroy + 192
53  libswiftCore.dylib            	       0x1a64302a0 _ContiguousArrayStorage.__deallocating_deinit + 96
54  libswiftCore.dylib            	       0x1a62be5a8 _swift_release_dealloc + 56
-------- RECURSION LEVEL 1
55  libswiftCore.dylib            	       0x1a62bf114 bool swift::RefCounts<swift::RefCountBitsT<(swift::RefCountInlinedness)1>>::doDecrementSlow<(swift::PerformDeinit)1>(swift::RefCountBitsT<(swift::RefCountInlinedness)1>, unsigned int) + 152
56  SwiftUICore                   	       0x23ea2c984 MultiViewResponder.containsGlobalPoints(_:cacheKey:options:) + 744
57  SwiftUICore                   	       0x23ea2c8e4 MultiViewResponder.containsGlobalPoints(_:cacheKey:options:) + 584
58  SwiftUICore                   	       0x23ea2e8b8 ViewResponder.hitTest(globalPoints:weights:mask:cacheKey:options:) + 220
59  SwiftUICore                   	       0x23ea2e0e4 HitTestBindingResponder.bindEvent(_:) + 196
60  SwiftUI                       	       0x1c72df398 HoverEventDispatcher.receiveEvents(_:manager:) + 2596
61  SwiftUICore                   	       0x23ef059f0 EventBindingManager.dispatchNonGestureEvents(_:) + 412
62  SwiftUICore                   	       0x23ef04a54 EventBindingManager.sendDownstream(_:) + 748
63  SwiftUICore                   	       0x23ef03a58 EventBindingManager.send(_:) + 120
64  SwiftUI                       	       0x1c7854314 NSHostingView.sendEvents(_:track:) + 1244
65  SwiftUI                       	       0x1c7853d1c NSHostingView.sendEvent<A>(_:serial:track:) + 580
66  SwiftUI                       	       0x1c7858520 NSHostingView.sendHoverEvent(_:phase:) + 1564
67  SwiftUI                       	       0x1c7869c14 NSHostingView.mouseMoved(with:) + 428
68  SwiftUI                       	       0x1c7869cd0 @objc NSHostingView.mouseMoved(with:) + 56
69  AppKit                        	       0x19826b738 -[NSTrackingArea mouseMoved:] + 116
70  AppKit                        	       0x197e5e130 -[_NSTrackingAreaAKManager _mouseMoved:] + 440
71  AppKit                        	       0x198244d84 _routeMouseMovedEvent + 240
72  AppKit                        	       0x19824466c -[NSWindow(NSEventRouting) _reallySendEvent:isDelayedEvent:] + 556
73  AppKit                        	       0x1982440bc -[NSWindow(NSEventRouting) sendEvent:] + 372
74  AppKit                        	       0x197f7d108 routeMouseMovedEvent + 148
75  AppKit                        	       0x197f7c728 -[NSApplication(NSEventRouting) sendEvent:] + 964
76  AppKit                        	       0x197a146f4 -[NSApplication _handleEvent:] + 60
77  AppKit                        	       0x1974ab7a8 -[NSApplication run] + 408
78  AppKit                        	       0x1974976dc NSApplicationMain + 880
79  SwiftUI                       	       0x1c70f63ec specialized runApp(_:) + 168
80  SwiftUI                       	       0x1c74afb40 runApp<A>(_:) + 112
81  SwiftUI                       	       0x1c777a1d8 static App.main() + 224
82  RedLemon                      	       0x105e4d0d4 static RedLemonApp.$main() + 40
83  RedLemon                      	       0x105e4d180 RedLemon_main + 12
84  dyld                          	       0x192c39d54 start + 7184

Thread 1:

Thread 2:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	       0x192fbec34 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x192fd1028 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x192fc798c mach_msg_overwrite + 484
3   libsystem_kernel.dylib        	       0x192fbefb4 mach_msg + 24
4   CoreFoundation                	       0x1930a0ba0 __CFRunLoopServiceMachPort + 160
5   CoreFoundation                	       0x19309f4f8 __CFRunLoopRun + 1188
6   CoreFoundation                	       0x193159e34 _CFRunLoopRunSpecificWithOptions + 532
7   AppKit                        	       0x197542a34 _NSEventThread + 184
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 3:

Thread 4:

Thread 5:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	       0x192fbec34 mach_msg2_trap + 8
1   libsystem_kernel.dylib        	       0x192fd1028 mach_msg2_internal + 76
2   libsystem_kernel.dylib        	       0x192fc798c mach_msg_overwrite + 484
3   libsystem_kernel.dylib        	       0x192fbefb4 mach_msg + 24
4   CoreFoundation                	       0x1930a0ba0 __CFRunLoopServiceMachPort + 160
5   CoreFoundation                	       0x19309f4f8 __CFRunLoopRun + 1188
6   CoreFoundation                	       0x193159e34 _CFRunLoopRunSpecificWithOptions + 532
7   CFNetwork                     	       0x199593b30 +[__CFN_CoreSchedulingSetRunnable _run:] + 416
8   Foundation                    	       0x1948b97a0 __NSThread__start__ + 732
9   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
10  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 6:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x105218730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x105220468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1052204ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x105219370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x105220388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x105202918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x105203bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1051f82d8 Optional.withUnsafeOptionalPointer<A>(_:) + 516 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1052018f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x1051fc2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x1051f2d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x1051f5e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
13  RedLemon                      	       0x1051eb7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x1051eb870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
15  RedLemon                      	       0x1051eb8fc autoreleasepool<A, B>(invoking:) + 124
16  RedLemon                      	       0x1051eb790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x1051f20a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10519c358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10519c91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
21  RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
22  RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
23  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
24  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 7:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x105218730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x105220468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1052204ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x105219370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x105220388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x105202918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x105203bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1051f83ac closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 64 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x1051f842c partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 52
10  RedLemon                      	       0x10518568c withUnsafePointer<A, B, C>(to:_:) + 92
11  RedLemon                      	       0x1051f8274 Optional.withUnsafeOptionalPointer<A>(_:) + 416 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x1052018f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x1051fc2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x1051f2d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x1051f5e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
16  RedLemon                      	       0x1051eb7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x1051eb870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
18  RedLemon                      	       0x1051eb8fc autoreleasepool<A, B>(invoking:) + 124
19  RedLemon                      	       0x1051eb790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x1051f20a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10519c358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10519c91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
24  RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
25  RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
26  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
27  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 8:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x105218730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x105220468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1052204ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x105219370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x105220388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x105202918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x105203bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1051f82d8 Optional.withUnsafeOptionalPointer<A>(_:) + 516 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1052018f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x1051fc2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x1051f2d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x1051f5e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
13  RedLemon                      	       0x1051eb7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x1051eb870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
15  RedLemon                      	       0x1051eb8fc autoreleasepool<A, B>(invoking:) + 124
16  RedLemon                      	       0x1051eb790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x1051f20a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10519c358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10519c91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
21  RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
22  RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
23  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
24  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 9:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x105218730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x105220468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1052204ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x105219370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x105220388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x105202918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x105203bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1051f82d8 Optional.withUnsafeOptionalPointer<A>(_:) + 516 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1052018f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x1051fc2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x1051f2d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x1051f5e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
13  RedLemon                      	       0x1051eb7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x1051eb870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
15  RedLemon                      	       0x1051eb8fc autoreleasepool<A, B>(invoking:) + 124
16  RedLemon                      	       0x1051eb790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x1051f20a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10519c358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10519c91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
21  RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
22  RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
23  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
24  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 10:: NIO-SGLTN-0-#4
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x105218730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x105220468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1052204ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x105219370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x105220388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x105202918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x105203bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1051f82d8 Optional.withUnsafeOptionalPointer<A>(_:) + 516 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1052018f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x1051fc2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x1051f2d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x1051f5e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
13  RedLemon                      	       0x1051eb7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x1051eb870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
15  RedLemon                      	       0x1051eb8fc autoreleasepool<A, B>(invoking:) + 124
16  RedLemon                      	       0x1051eb790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x1051f20a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10519c358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10519c91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
21  RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
22  RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
23  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
24  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 11:: NIO-SGLTN-0-#5
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x105218730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x105220468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1052204ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x105219370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x105220388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x105202918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x105203bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1051f83ac closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 64 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x1051f842c partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 52
10  RedLemon                      	       0x10518568c withUnsafePointer<A, B, C>(to:_:) + 92
11  RedLemon                      	       0x1051f8274 Optional.withUnsafeOptionalPointer<A>(_:) + 416 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x1052018f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x1051fc2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x1051f2d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x1051f5e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
16  RedLemon                      	       0x1051eb7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x1051eb870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
18  RedLemon                      	       0x1051eb8fc autoreleasepool<A, B>(invoking:) + 124
19  RedLemon                      	       0x1051eb790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x1051f20a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10519c358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10519c91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
24  RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
25  RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
26  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
27  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 12:: NIO-SGLTN-0-#6
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x105218730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x105220468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1052204ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x105219370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x105220388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x105202918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x105203bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1051f82d8 Optional.withUnsafeOptionalPointer<A>(_:) + 516 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1052018f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x1051fc2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x1051f2d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x1051f5e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
13  RedLemon                      	       0x1051eb7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x1051eb870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
15  RedLemon                      	       0x1051eb8fc autoreleasepool<A, B>(invoking:) + 124
16  RedLemon                      	       0x1051eb790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x1051f20a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10519c358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10519c91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
21  RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
22  RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
23  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
24  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 13:: NIO-SGLTN-0-#7
0   libsystem_kernel.dylib        	       0x192fc4f30 kevent + 8
1   RedLemon                      	       0x105218730 @nonobjc kevent(_:_:_:_:_:_:) + 12
2   RedLemon                      	       0x105220468 closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 72 (System.swift:911)
3   RedLemon                      	       0x1052204ac partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 44
4   RedLemon                      	       0x105219370 syscall<A>(blocking:where:_:) + 332 (System.swift:247)
5   RedLemon                      	       0x105220388 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 260 (System.swift:910)
6   RedLemon                      	       0x105202918 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 412 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x105203bac partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 20
8   RedLemon                      	       0x1051f83ac closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 64 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x1051f842c partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 52
10  RedLemon                      	       0x10518568c withUnsafePointer<A, B, C>(to:_:) + 92
11  RedLemon                      	       0x1051f8274 Optional.withUnsafeOptionalPointer<A>(_:) + 416 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x1052018f8 Selector.whenReady0(strategy:onLoopBegin:_:) + 916 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x1051fc2cc Selector.whenReady(strategy:onLoopBegin:_:) + 116 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x1051f2d50 closure #2 in SelectableEventLoop.run() + 168 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x1051f5e54 partial apply for closure #2 in SelectableEventLoop.run() + 28
16  RedLemon                      	       0x1051eb7f8 closure #1 in withAutoReleasePool<A>(_:) + 52 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x1051eb870 partial apply for closure #1 in withAutoReleasePool<A>(_:) + 44
18  RedLemon                      	       0x1051eb8fc autoreleasepool<A, B>(invoking:) + 124
19  RedLemon                      	       0x1051eb790 withAutoReleasePool<A>(_:) + 144 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x1051f20a8 SelectableEventLoop.run() + 516 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10519c358 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 616 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10519c91c closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 260 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
24  RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
25  RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
26  libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
27  libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 14:: TP-#0
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1051a5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1051a67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 15:: TP-#1
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1051a5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1051a67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 16:: TP-#2
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1051a5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1051a67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 17:: TP-#3
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1051a5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1051a67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 18:: TP-#4
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1051a5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1051a67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 19:: TP-#5
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1051a5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1051a67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 20:: TP-#6
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1051a5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1051a67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 21:: TP-#7
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   libdispatch.dylib             	       0x192e46990 _dispatch_sema4_wait + 28
2   libdispatch.dylib             	       0x192e46f40 _dispatch_semaphore_wait_slow + 132
3   RedLemon                      	       0x1051a5978 NIOThreadPool.process(identifier:) + 128 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1051a67f0 closure #3 in NIOThreadPool._start(threadNamePrefix:) + 208 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x105220890 thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 24
6   RedLemon                      	       0x1052229e4 closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 696 (ThreadPosix.swift:116)
7   RedLemon                      	       0x105222a9c @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 12
8   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
9   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 22:

Thread 23:

Thread 24 Crashed::  Dispatch queue: com.apple.root.default-qos.cooperative
0   libsystem_kernel.dylib        	       0x192fc75b0 __pthread_kill + 8
1   libsystem_pthread.dylib       	       0x193001888 pthread_kill + 296
2   libsystem_c.dylib             	       0x192f06850 abort + 124
3   libswiftCore.dylib            	       0x1a62b6798 swift::fatalErrorv(unsigned int, char const*, char*) + 144
4   libswiftCore.dylib            	       0x1a62b67b8 swift::fatalError(unsigned int, char const*, ...) + 32
5   libswiftCore.dylib            	       0x1a6724458 swift_deallocClassInstance.cold.1 + 168
6   libswiftCore.dylib            	       0x1a62be6c4 swift_deallocClassInstance + 224
7   RedLemon                      	       0x105bb1158 MPVWrapper.__deallocating_deinit + 52
8   libswiftCore.dylib            	       0x1a62be5a8 _swift_release_dealloc + 56
9   libswiftCore.dylib            	       0x1a62bf290 bool swift::RefCounts<swift::SideTableRefCountBits>::doDecrementSlow<(swift::PerformDeinit)1>(swift::SideTableRefCountBits, unsigned int) + 168
10  RedLemon                      	       0x105c81ba8 0x1045a0000 + 23993256
11  libswiftCore.dylib            	       0x1a62be5a8 _swift_release_dealloc + 56
12  libswiftCore.dylib            	       0x1a62bf114 bool swift::RefCounts<swift::RefCountBitsT<(swift::RefCountInlinedness)1>>::doDecrementSlow<(swift::PerformDeinit)1>(swift::RefCountBitsT<(swift::RefCountInlinedness)1>, unsigned int) + 152
13  RedLemon                      	       0x105544e8c 0x1045a0000 + 16404108
14  libswiftCore.dylib            	       0x1a62be5a8 _swift_release_dealloc + 56
15  libswiftCore.dylib            	       0x1a62bf114 bool swift::RefCounts<swift::RefCountBitsT<(swift::RefCountInlinedness)1>>::doDecrementSlow<(swift::PerformDeinit)1>(swift::RefCountBitsT<(swift::RefCountInlinedness)1>, unsigned int) + 152
16  libswift_Concurrency.dylib    	       0x28e8ef32c completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*) + 48
17  libswift_Concurrency.dylib    	       0x28e8ef2fd completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*) + 1

Thread 25:

Thread 26:

Thread 27:

Thread 28:: com.apple.coremedia.sharedRootQueue.47
0   libsystem_kernel.dylib        	       0x192fbebc8 semaphore_timedwait_trap + 8
1   libdispatch.dylib             	       0x192e79c8c _dispatch_sema4_timedwait + 64
2   libdispatch.dylib             	       0x192e46f08 _dispatch_semaphore_wait_slow + 76
3   libdispatch.dylib             	       0x192e56dc0 _dispatch_worker_thread + 324
4   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
5   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 29:: caulk.messenger.shared:17
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   caulk                         	       0x19f617e08 caulk::semaphore::timed_wait(double) + 224
2   caulk                         	       0x19f617cb0 caulk::concurrent::details::worker_thread::run() + 32
3   caulk                         	       0x19f617950 void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*) + 96
4   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
5   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 30:: caulk.messenger.shared:high
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   caulk                         	       0x19f617e08 caulk::semaphore::timed_wait(double) + 224
2   caulk                         	       0x19f617cb0 caulk::concurrent::details::worker_thread::run() + 32
3   caulk                         	       0x19f617950 void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*) + 96
4   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
5   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 31:: caulk::deferred_logger
0   libsystem_kernel.dylib        	       0x192fbebb0 semaphore_wait_trap + 8
1   caulk                         	       0x19f617e08 caulk::semaphore::timed_wait(double) + 224
2   caulk                         	       0x19f617cb0 caulk::concurrent::details::worker_thread::run() + 32
3   caulk                         	       0x19f617950 void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*) + 96
4   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
5   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8

Thread 32:: AudioSession - RootQueue
0   libsystem_kernel.dylib        	       0x192fbebc8 semaphore_timedwait_trap + 8
1   libdispatch.dylib             	       0x192e79c8c _dispatch_sema4_timedwait + 64
2   libdispatch.dylib             	       0x192e46f08 _dispatch_semaphore_wait_slow + 76
3   libdispatch.dylib             	       0x192e56dc0 _dispatch_worker_thread + 324
4   libsystem_pthread.dylib       	       0x193001c08 _pthread_start + 136
5   libsystem_pthread.dylib       	       0x192ffcba8 thread_start + 8


Thread 24 crashed with ARM Thread State (64-bit):
    x0: 0x0000000000000000   x1: 0x0000000000000000   x2: 0x0000000000000000   x3: 0x0000000000000000
    x4: 0x00000005422f4100   x5: 0x0000000000000020   x6: 0xffffffffbfc007ff   x7: 0xfffff0003ffff800
    x8: 0xa39572d97b74ab59   x9: 0xa39572d810c5db59  x10: 0x0000000000000002  x11: 0x0000010000000000
   x12: 0x00000000fffffffd  x13: 0x0000000000000000  x14: 0x0000000000000000  x15: 0x0000000000000000
   x16: 0x0000000000000148  x17: 0x00000002014e0990  x18: 0x0000000000000000  x19: 0x0000000000000006
   x20: 0x000000000000cf23  x21: 0x000000016bb170e0  x22: 0x00000007bdf9a170  x23: 0x0000000000000000
   x24: 0x000000000000007d  x25: 0x000000016bb170e0  x26: 0x0000000000000000  x27: 0x00000000fff0ffff
   x28: 0x0000000000000000   fp: 0x000000016bb16c00   lr: 0x0000000193001888
    sp: 0x000000016bb16be0   pc: 0x0000000192fc75b0 cpsr: 0x40001000
   far: 0x0000000000000000  esr: 0x56000080 (Syscall)

Binary Images:
       0x1045a0000 -        0x106af7fff com.redlemon.app (v1.0.182) <4b4278ed-5cfe-3e6b-be0a-88150bc9b72b> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x109c40000 -        0x109c87fff org.sparkle-project.Sparkle (2.8.0) <8f886ac7-3842-3b7f-bbf2-c56ffa529f6e> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/Sparkle.framework/Versions/B/Sparkle
       0x10a3e8000 -        0x10a737fff libmpv.2.dylib (*) <03681c00-9c6b-3c36-b18e-0aa5ab84556f> /opt/homebrew/*/libmpv.2.dylib
       0x109ba8000 -        0x109bcffff libass.9.dylib (*) <e8ec394f-559b-32d9-9a38-9d520ad185a3> /opt/homebrew/*/libass.9.dylib
       0x10b16c000 -        0x10ba1ffff libavcodec.62.11.100.dylib (*) <ee19c04e-0da1-391a-a0c4-8d071b295fff> /opt/homebrew/*/libavcodec.62.11.100.dylib
       0x10a834000 -        0x10aa7ffff libavfilter.11.4.100.dylib (*) <5c71529c-36df-3e36-b1b3-5c9300b11b48> /opt/homebrew/*/libavfilter.11.4.100.dylib
       0x109fa0000 -        0x10a183fff libavformat.62.3.100.dylib (*) <02b4dc77-f5d6-34b9-9927-325f6fff3b2b> /opt/homebrew/*/libavformat.62.3.100.dylib
       0x10c0b8000 -        0x10c12bfff libavutil.60.8.100.dylib (*) <71234acb-1735-3a3b-9a25-586ec4fe16fd> /opt/homebrew/*/libavutil.60.8.100.dylib
       0x109d90000 -        0x109e3bfff libplacebo.351.dylib (*) <03007277-7fb4-3f37-adfd-90e73cbef1a4> /opt/homebrew/*/libplacebo.351.dylib
       0x109b84000 -        0x109b93fff libswresample.6.1.100.dylib (*) <275fc1a4-0ec7-3969-a142-5d02807123eb> /opt/homebrew/*/libswresample.6.1.100.dylib
       0x109e78000 -        0x109ee7fff libswscale.9.1.100.dylib (*) <db53fb7b-4b83-3840-8a23-b6f4ccdedd84> /opt/homebrew/*/libswscale.9.1.100.dylib
       0x109ca8000 -        0x109cdffff libmujs.dylib (*) <1bcda6e7-e51f-326c-86b8-30f68e27b474> /opt/homebrew/*/libmujs.dylib
       0x10a1d4000 -        0x10a213fff liblcms2.2.dylib (*) <8544ae79-c27a-3dce-ad01-cfb0ed1269c7> /opt/homebrew/*/liblcms2.2.dylib
       0x10a2dc000 -        0x10a363fff libarchive.13.dylib (*) <551362f7-cccf-34f0-896d-d8056eac3dc0> /opt/homebrew/*/libarchive.13.dylib
       0x109c10000 -        0x109c23fff libavdevice.62.1.100.dylib (*) <ba5a7055-bb2a-363c-a69f-038e1fdd6512> /opt/homebrew/*/libavdevice.62.1.100.dylib
       0x10a230000 -        0x10a26ffff libbluray.3.dylib (*) <cca3fbbc-a2d1-3cdd-84f7-744df4503c8e> /opt/homebrew/*/libbluray.3.dylib
       0x10ab1c000 -        0x10ab8ffff libluajit-5.1.2.1.1767980792.dylib (*) <291ec50f-e60a-364c-bf1c-efe9fb72b3b5> /opt/homebrew/*/libluajit-5.1.2.1.1767980792.dylib
       0x10a388000 -        0x10a3b7fff librubberband.3.dylib (*) <10cae9d2-9881-3c25-a61c-50a01ab16891> /opt/homebrew/*/librubberband.3.dylib
       0x109d2c000 -        0x109d53fff libuchardet.0.0.8.dylib (*) <c9e5de7d-3102-3d1d-a9e6-7ceb28632936> /opt/homebrew/*/libuchardet.0.0.8.dylib
       0x109be8000 -        0x109bebfff libvapoursynth-script.0.dylib (*) <094c5db3-9852-3694-b933-4f9ee8828550> /opt/homebrew/*/libvapoursynth-script.0.dylib
       0x10ac08000 -        0x10ac3ffff libzimg.2.dylib (*) <71bc0e48-c7b2-3658-98c0-1782add5bc6d> /opt/homebrew/*/libzimg.2.dylib
       0x10ace4000 -        0x10ad43fff libjpeg.8.3.2.dylib (*) <b12ad9a5-f87d-3b9f-9195-9e408319fd3a> /opt/homebrew/*/libjpeg.8.3.2.dylib
       0x10adf8000 -        0x10ae5ffff libvulkan.1.4.335.dylib (*) <94a5736e-3150-3ca2-895f-b3d8a5c7c031> /opt/homebrew/*/libvulkan.1.4.335.dylib
       0x10ae94000 -        0x10af0ffff libfreetype.6.dylib (*) <453df297-0ca4-35f8-bb25-dd04bce98b59> /opt/homebrew/*/libfreetype.6.dylib
       0x109d64000 -        0x109d7ffff libfribidi.0.dylib (*) <01c59dc9-20b2-319c-88c2-0f7698cc2bc9> /opt/homebrew/*/libfribidi.0.dylib
       0x10d164000 -        0x10d21ffff libharfbuzz.0.dylib (*) <67cf7c00-9bfe-3fc6-b4d1-769ffc46bc68> /opt/homebrew/*/libharfbuzz.0.dylib
       0x10a28c000 -        0x10a2abfff libunibreak.6.dylib (*) <8dd7f56f-29c0-32a0-9749-459aa763bcb4> /opt/homebrew/*/libunibreak.6.dylib
       0x10aba4000 -        0x10abc7fff libpng16.16.dylib (*) <a5335a51-59c1-3fc7-acb6-b28db402d52c> /opt/homebrew/*/libpng16.16.dylib
       0x10d290000 -        0x10d38bfff libglib-2.0.0.dylib (*) <95f652fe-0fda-36d0-b6d0-34427409a2fe> /opt/homebrew/*/libglib-2.0.0.dylib
       0x10a2b8000 -        0x10a2cbfff libgraphite2.3.2.1.dylib (*) <481f6d39-27e3-3c77-a203-99ddb4e2de7f> /opt/homebrew/*/libgraphite2.3.2.1.dylib
       0x10ac6c000 -        0x10ac93fff libintl.8.dylib (*) <4fbeeaca-81e4-303f-840e-2014b4b1b057> /opt/homebrew/*/libintl.8.dylib
       0x10af30000 -        0x10afa7fff libpcre2-8.0.dylib (*) <0d65de6e-7082-35af-b6d4-ae160ae9d32e> /opt/homebrew/*/libpcre2-8.0.dylib
       0x10d58c000 -        0x10d703fff libvpx.11.dylib (*) <93bc5562-16ec-3ab4-a0cc-6692b3d8f5be> /opt/homebrew/*/libvpx.11.dylib
       0x10d3dc000 -        0x10d473fff libdav1d.7.dylib (*) <b317db1b-7e5e-3ad6-8dfb-5f30139ba348> /opt/homebrew/*/libdav1d.7.dylib
       0x10afc0000 -        0x10aff3fff libmp3lame.0.dylib (*) <856fb90d-91ac-3a42-b529-e895af08115c> /opt/homebrew/*/libmp3lame.0.dylib
       0x10b038000 -        0x10b083fff libopus.0.dylib (*) <1c7445f6-fb0e-33ea-8aa8-18597a9443ac> /opt/homebrew/*/libopus.0.dylib
       0x10d9fc000 -        0x10dc67fff libSvtAv1Enc.3.1.2.dylib (*) <08ba4734-ecf7-352b-8d91-9ee8000ae75b> /opt/homebrew/*/libSvtAv1Enc.3.1.2.dylib
       0x10de08000 -        0x10df27fff libx264.165.dylib (*) <b916484f-5239-335b-b9fe-4e71261da16b> /opt/homebrew/*/libx264.165.dylib
       0x10e570000 -        0x10e96bfff libx265.215.dylib (*) <590e5411-20b2-3cf7-9f18-7e2f3611f7a7> /opt/homebrew/*/libx265.215.dylib
       0x10f19c000 -        0x10f553fff libshaderc_shared.1.dylib (*) <6492c8fd-dac0-342e-8cbe-063c6b427304> /opt/homebrew/*/libshaderc_shared.1.dylib
       0x10abd8000 -        0x10abf7fff liblzma.5.dylib (*) <7e7bef36-1537-3b34-91b7-eca90293ba43> /opt/homebrew/*/liblzma.5.dylib
       0x10d4d8000 -        0x10d55ffff libzstd.1.5.7.dylib (*) <93a01ac5-b367-3f6d-9b23-ac6404a111a4> /opt/homebrew/*/libzstd.1.5.7.dylib
       0x10aca4000 -        0x10acc3fff liblz4.1.10.0.dylib (*) <d2dadb7f-f6c0-3a6d-9c83-02596baca219> /opt/homebrew/*/liblz4.1.10.0.dylib
       0x109cf4000 -        0x109cfbfff libb2.1.dylib (*) <cdb9743e-4399-33d0-a9af-8667f7f00478> /opt/homebrew/*/libb2.1.dylib
       0x10ada8000 -        0x10addbfff libfontconfig.1.dylib (*) <348f051c-4847-3342-a00e-ccd07adf2634> /opt/homebrew/*/libfontconfig.1.dylib
       0x109d0c000 -        0x109d13fff libudfread.3.dylib (*) <89b8fe85-c709-33fa-a9ec-9e6368c9cbc8> /opt/homebrew/*/libudfread.3.dylib
       0x10e038000 -        0x10e1a3fff libsamplerate.0.2.2.dylib (*) <0da641e6-fcba-3c1a-8c8c-ff25aadedac6> /opt/homebrew/*/libsamplerate.0.2.2.dylib
       0x10f890000 -        0x10fc5bfff org.python.python (3.14.2, (c) 2001-2024 Python Software Foundation.) <d1eea04d-1fad-31b0-a34c-48e935ff166e> /opt/homebrew/*/Python.framework/Versions/3.14/Python
       0x10e4cc000 -        0x10e4d7fff libobjc-trampolines.dylib (*) <d4baeab8-b553-3779-a0ff-d8848e7a22df> /usr/lib/libobjc-trampolines.dylib
       0x12c098000 -        0x12c85bfff com.apple.AGXMetalG14G (342.3) <fd2ac287-d149-309f-a2ec-eb9d375be6ad> /System/Library/Extensions/AGXMetalG14G.bundle/Contents/MacOS/AGXMetalG14G
       0x11aa6c000 -        0x11aacffff com.apple.AppleMetalOpenGLRenderer (1.0) <4ff7e230-8427-36ad-98f9-10a81f174e7e> /System/Library/Extensions/AppleMetalOpenGLRenderer.bundle/Contents/MacOS/AppleMetalOpenGLRenderer
       0x132bcc000 -        0x132d0ffff com.apple.audio.units.Components (1.14) <0312381d-61ae-3ab9-9cea-b1e46a0c4e54> /System/Library/Components/CoreAudio.component/Contents/MacOS/CoreAudio
       0x1a6296000 -        0x1a68245ff libswiftCore.dylib (*) <d07a076a-d1d5-315c-8a31-90e34a236afb> /usr/lib/swift/libswiftCore.dylib
       0x1a8af8000 -        0x1a8bee02f com.apple.combine (1.0) <c81f6237-6777-38a7-9a68-34fd7267db1e> /System/Library/Frameworks/Combine.framework/Versions/A/Combine
       0x23e44a000 -        0x23f3be99f com.apple.SwiftUICore (7.2.5.1.401) <6c0d0cd1-2abf-3443-bd3e-cf2ff9ea799f> /System/Library/Frameworks/SwiftUICore.framework/Versions/A/SwiftUICore
       0x1c6fe5000 -        0x1c872bd1f com.apple.SwiftUI (7.2.5.1.401) <f0703a94-2852-3e83-9379-1088351e37c9> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x197493000 -        0x198bc227f com.apple.AppKit (6.9) <4e909aec-68bc-3fc9-a87a-de928e1e36e1> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x192c31000 -        0x192ccffc3 dyld (*) <0975afba-c46b-364c-bd84-a75daa9e455a> /usr/lib/dyld
               0x0 - 0xffffffffffffffff ??? (*) <00000000-0000-0000-0000-000000000000> ???
       0x193008000 -        0x1930103ef libsystem_platform.dylib (*) <4dbaf982-1576-3ffc-86be-03a9d2c96be5> /usr/lib/system/libsystem_platform.dylib
       0x192fbe000 -        0x192ffa49f libsystem_kernel.dylib (*) <548c45c8-9733-3f0d-8ef4-c06df1df2ad0> /usr/lib/system/libsystem_kernel.dylib
       0x193041000 -        0x193589c3f com.apple.CoreFoundation (6.9) <649000a2-3eb4-3cf5-970a-d3cb37b5780c> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
       0x192ffb000 -        0x193007abb libsystem_pthread.dylib (*) <527c4ba0-91a5-378b-b3e2-d38269ca5a66> /usr/lib/system/libsystem_pthread.dylib
       0x199348000 -        0x1997030ff com.apple.CFNetwork (1.0) <444dd8ef-e7eb-389b-958c-f45c56c3c4df> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
       0x194893000 -        0x1958364df com.apple.Foundation (6.9) <6a518869-0a98-34cb-8a15-cc28f898255e> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
       0x192e43000 -        0x192e89e5f libdispatch.dylib (*) <a4b349e8-dd6f-3b71-84d9-34f3b4acd849> /usr/lib/system/libdispatch.dylib
       0x192e8d000 -        0x192f0f047 libsystem_c.dylib (*) <fb5569a9-cb26-36c2-aa05-e99243692b60> /usr/lib/system/libsystem_c.dylib
       0x28e882000 -        0x28e90b6ff libswift_Concurrency.dylib (*) <2cd4d4d2-15a3-3057-b506-6e79bd1d6428> /usr/lib/swift/libswift_Concurrency.dylib
       0x19f616000 -        0x19f63ed7f com.apple.audio.caulk (1.0) <d4644b08-911d-30af-82e7-c404878abf47> /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk
       0x1a4568000 -        0x1a462a81f com.apple.MediaExperience (1.0) <20e67caa-84cf-379a-98e4-b84267bf9982> /System/Library/PrivateFrameworks/MediaExperience.framework/Versions/A/MediaExperience

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
ReadOnly portion of Libraries: Total=1.9G resident=0K(0%) swapped_out_or_unallocated=1.9G(100%)
Writable regions: Total=389.7M written=881K(0%) resident=881K(0%) swapped_out=0K(0%) unallocated=388.8M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               128K        1 
Activity Tracing                   256K        1 
AttributeGraph Data               1024K        1 
CG image                            48K        2 
ColorSync                           64K        3 
CoreAnimation                     1184K       66 
CoreGraphics                        32K        2 
CoreUI image data                  608K        5 
Dispatch continuations            64.0M        1 
Foundation                        1376K        2 
Image IO                          4592K       44 
Kernel Alloc Once                   32K        1 
MALLOC                           264.7M       57 
MALLOC guard page                 3968K        4 
OpenGL GLSL                        384K        5 
SQLite page cache                  640K        5 
STACK GUARD                       56.5M       33 
Stack                             25.0M       33 
VM_ALLOCATE                        528K       22 
__AUTH                            5781K      644 
__AUTH_CONST                      88.0M     1025 
__CTF                               824        1 
__DATA                            62.9M     1026 
__DATA_CONST                      36.1M     1081 
__DATA_DIRTY                      8688K      882 
__FONT_DATA                        2352        1 
__GLSLBUILTINS                    5176K        1 
__INFO_FILTER                         8        1 
__LINKEDIT                       648.0M       53 
__OBJC_RO                         78.4M        1 
__OBJC_RW                         2570K        1 
__TEXT                             1.2G     1062 
__TEXT (graphics)                 34.4M       38 
__TEXT (network)                  2720K        5 
__TPRO_CONST                       128K        2 
dyld private memory                128K        1 
mapped file                      448.4M       56 
page table in kernel               881K        1 
shared memory                     1520K       23 
===========                     =======  ======= 
TOTAL                              3.0G     6193 


-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2026-01-31 15:50:09.00 -0500","app_version":"v1.0.182","slice_uuid":"4b4278ed-5cfe-3e6b-be0a-88150bc9b72b","build_version":"182","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 26.2 (25C56)","roots_installed":0,"name":"RedLemon","incident_id":"2D278BD2-AAA5-4365-99D9-B9B3066F8805"}
{
  "uptime" : 15000,
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 502,
  "deployVersion" : 210,
  "modelCode" : "Mac14,2",
  "coalitionID" : 3568,
  "osVersion" : {
    "train" : "macOS 26.2",
    "build" : "25C56",
    "releaseType" : "User"
  },
  "captureTime" : "2026-01-31 15:50:02.2330 -0500",
  "codeSigningMonitor" : 2,
  "incident" : "2D278BD2-AAA5-4365-99D9-B9B3066F8805",
  "pid" : 80726,
  "translated" : false,
  "cpuType" : "ARM-64",
  "procLaunch" : "2026-01-31 15:49:19.5671 -0500",
  "procStartAbsTime" : 373259797725,
  "procExitAbsTime" : 374283435487,
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"v1.0.182","CFBundleVersion":"182","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7A93D2BC-EE70-5B62-AB04-E4F8F9A9698C","thirdParty":true},
  "parentProc" : "launchd",
  "parentPid" : 1,
  "coalitionName" : "com.redlemon.app",
  "crashReporterKey" : "23926D48-00F6-4930-A350-2C9BC76EE1AE",
  "appleIntelligenceStatus" : {"state":"unavailable","reasons":["notOptedIn","assetIsNotReady","siriAssetIsNotReady"]},
  "developerMode" : 1,
  "bootProgressRegister" : "0x2f000000",
  "codeSigningID" : "com.redlemon.app",
  "codeSigningTeamID" : "",
  "codeSigningFlags" : 570425857,
  "codeSigningValidationCategory" : 10,
  "codeSigningTrustLevel" : 4294967295,
  "codeSigningAuxiliaryInfo" : 0,
  "instructionByteStream" : {"beforePC":"fyMD1f17v6n9AwCRFOD\/l78DAJH9e8Go\/w9f1sADX9YQKYDSARAA1A==","atPC":"AwEAVH8jA9X9e7+p\/QMAkQng\/5e\/AwCR\/XvBqP8PX9bAA1\/WcAqA0g=="},
  "bootSessionUUID" : "1863D700-7DA0-4057-A46D-1C0CB3CA6E62",
  "wakeTime" : 1261,
  "sleepWakeUUID" : "89B00B7C-502F-43A1-B10B-BDE6C965A808",
  "sip" : "enabled",
  "exception" : {"codes":"0x0000000000000000, 0x0000000000000000","rawCodes":[0,0],"type":"EXC_CRASH","signal":"SIGABRT"},
  "termination" : {"flags":0,"code":6,"namespace":"SIGNAL","indicator":"Abort trap: 6","byProc":"RedLemon","byPid":80726},
  "asi" : {"libsystem_c.dylib":["abort() called"]},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 24,
  "threads" : [{"recursionInfoArray":[{"hottestElided":34,"coldestElided":43,"depth":9,"keyFrame":{"imageOffset":165288,"symbol":"_swift_release_dealloc","symbolLocation":56,"imageIndex":52}}],"id":403226,"originalLength":86,"threadState":{"x":[{"value":33272059840},{"value":33272059840},{"value":3},{"value":6098890688},{"value":6098891128},{"value":6757521688,"symbolLocation":0,"symbol":"dyld4::APIs::_dyld_find_pointer_hash_table_entry(void const*, void const*, unsigned long, void const**)"},{"value":33255685064},{"value":18446726482597246976},{"value":6098890664},{"value":0},{"value":0},{"value":6756139008},{"value":6098885288},{"value":33255675720},{"value":1765376},{"value":3},{"value":6761252996,"symbolLocation":0,"symbol":"os_unfair_lock_unlock"},{"value":8611834912},{"value":0},{"value":6098890664},{"value":33272059840},{"value":255},{"value":33272059840},{"value":6098890688},{"value":3},{"value":33223091584},{"value":6098892488},{"value":18446744073709551615},{"value":8639561344,"symbolLocation":56,"symbol":"value witness table for AbstractCombineLatest.Side"}],"flavor":"ARM_THREAD_STATE64","lr":{"value":7083003916},"cpsr":{"value":536875008},"fp":{"value":6098890640},"sp":{"value":6098890608},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":7082979076},"far":{"value":0}},"queue":"com.apple.main-thread","frames":[{"imageOffset":282372,"symbol":"swift::checkTransitiveCompleteness(swift::TargetMetadata<swift::InProcess> const*)","symbolLocation":0,"imageIndex":52},{"imageOffset":307212,"symbol":"swift::GenericCacheEntry::tryInitialize(swift::TargetMetadata<swift::InProcess>*, swift::PrivateMetadataState, swift::PrivateMetadataCompletionContext*)","symbolLocation":836,"imageIndex":52},{"imageOffset":305256,"symbol":"swift::MetadataCacheEntryBase<swift::GenericCacheEntry, void const*>::doInitialization(swift::MetadataWaitQueue::Worker&, swift::MetadataRequest)","symbolLocation":104,"imageIndex":52},{"imageOffset":317876,"symbol":"std::__1::pair<swift::GenericCacheEntry*, swift::MetadataResponse> swift::LockingConcurrentMap<swift::GenericCacheEntry, swift::LockingConcurrentMapStorage<swift::GenericCacheEntry, (unsigned short)14>>::getOrInsert<swift::MetadataCacheKey, swift::MetadataRequest&, swift::TargetTypeContextDescriptor<swift::InProcess> const*&, void const* const*&>(swift::MetadataCacheKey, swift::MetadataRequest&, swift::TargetTypeContextDescriptor<swift::InProcess> const*&, void const* const*&)","symbolLocation":212,"imageIndex":52},{"imageOffset":216712,"symbol":"_swift_getGenericMetadata(swift::MetadataRequest, void const* const*, swift::TargetTypeContextDescriptor<swift::InProcess> const*)","symbolLocation":280,"imageIndex":52},{"imageOffset":4756092,"symbol":"__swift_instantiateGenericMetadata","symbolLocation":36,"imageIndex":52},{"imageOffset":464056,"symbol":"(anonymous namespace)::DecodedMetadataBuilder::createBoundGenericType(swift::TargetContextDescriptor<swift::InProcess> const*, __swift::__runtime::llvm::ArrayRef<swift::MetadataPackOrValue>, swift::MetadataPackOrValue) const","symbolLocation":796,"imageIndex":52},{"imageOffset":447620,"symbol":"swift::Demangle::__runtime::TypeDecoder<(anonymous namespace)::DecodedMetadataBuilder>::decodeMangledType(swift::Demangle::__runtime::Node*, unsigned int, bool)","symbolLocation":9016,"imageIndex":52},{"imageOffset":415672,"symbol":"swift_getTypeByMangledNodeImpl(swift::MetadataRequest, swift::Demangle::__runtime::Demangler&, swift::Demangle::__runtime::Node*, void const* const*, std::__1::function<void const* (unsigned int, unsigned int)>, std::__1::function<swift::TargetWitnessTable<swift::InProcess> const* (swift::TargetMetadata<swift::InProcess> const*, unsigned int)>)","symbolLocation":880,"imageIndex":52},{"imageOffset":397512,"symbol":"swift_getTypeByMangledNode","symbolLocation":368,"imageIndex":52},{"imageOffset":418380,"symbol":"swift_getTypeByMangledNameImpl(swift::MetadataRequest, __swift::__runtime::llvm::StringRef, void const* const*, std::__1::function<void const* (unsigned int, unsigned int)>, std::__1::function<swift::TargetWitnessTable<swift::InProcess> const* (swift::TargetMetadata<swift::InProcess> const*, unsigned int)>)","symbolLocation":1204,"imageIndex":52},{"imageOffset":388108,"symbol":"swift_getTypeByMangledName","symbolLocation":368,"imageIndex":52},{"imageOffset":288576,"symbol":"swift_getAssociatedTypeWitnessSlowImpl(swift::MetadataRequest, swift::TargetWitnessTable<swift::InProcess>*, swift::TargetMetadata<swift::InProcess> const*, swift::TargetProtocolRequirement<swift::InProcess> const*, swift::TargetProtocolRequirement<swift::InProcess> const*)","symbolLocation":472,"imageIndex":52},{"imageOffset":277400,"symbol":"swift_getAssociatedTypeWitness","symbolLocation":88,"imageIndex":52},{"imageOffset":1268692,"symbol":"Collection.first.getter","symbolLocation":80,"imageIndex":52},{"imageOffset":376328,"symbol":"ConduitList.remove(_:)","symbolLocation":256,"imageIndex":53},{"imageOffset":142952,"symbol":"PublishedSubject.disassociate(_:)","symbolLocation":124,"imageIndex":53},{"imageOffset":148492,"symbol":"PublishedSubject.Conduit.cancel()","symbolLocation":576,"imageIndex":53},{"imageOffset":377252,"symbol":"protocol witness for Cancellable.cancel() in conformance ConduitBase<A, B>","symbolLocation":56,"imageIndex":53},{"imageOffset":183340,"symbol":"AbstractCombineLatest.cancel()","symbolLocation":372,"imageIndex":53},{"imageOffset":185308,"symbol":"protocol witness for Cancellable.cancel() in conformance AbstractCombineLatest<A, B, C>","symbolLocation":24,"imageIndex":53},{"imageOffset":141188,"symbol":"PublishedSubject.deinit","symbolLocation":204,"imageIndex":53},{"imageOffset":141396,"symbol":"PublishedSubject.__deallocating_deinit","symbolLocation":16,"imageIndex":53},{"imageOffset":165288,"symbol":"_swift_release_dealloc","symbolLocation":56,"imageIndex":52},{"imageOffset":168592,"symbol":"bool swift::RefCounts<swift::SideTableRefCountBits>::doDecrementSlow<(swift::PerformDeinit)1>(swift::SideTableRefCountBits, unsigned int)","symbolLocation":168,"imageIndex":52},{"imageOffset":51188,"symbol":"void multiPayloadEnumGeneric<&handleRefCountsDestroy(swift::TargetMetadata<swift::InProcess> const*, swift::LayoutStringReader1&, unsigned long&, unsigned char*)>(swift::TargetMetadata<swift::InProcess> const*, swift::LayoutStringReader1&, unsigned long&, unsigned char*)","symbolLocation":264,"imageIndex":52},{"imageOffset":34496,"symbol":"swift_cvw_destroyImpl(swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*)","symbolLocation":1120,"imageIndex":52},{"imageOffset":19861304,"sourceFile":"FriendsViewModel.swift","symbol":"FriendsViewModel.deinit","symbolLocation":184,"imageIndex":0},{"imageOffset":19861656,"sourceFile":"FriendsViewModel.swift","symbol":"FriendsViewModel.__deallocating_deinit","symbolLocation":28,"imageIndex":0},{"imageOffset":165288,"symbol":"_swift_release_dealloc","symbolLocation":56,"imageIndex":52},{"imageOffset":168592,"symbol":"bool swift::RefCounts<swift::SideTableRefCountBits>::doDecrementSlow<(swift::PerformDeinit)1>(swift::SideTableRefCountBits, unsigned int)","symbolLocation":168,"imageIndex":52},{"imageOffset":17009524,"sourceFile":"\/<compiler-generated>","symbol":"outlined consume of StateObject<FriendsViewModel>.Storage","symbolLocation":44,"imageIndex":0},{"imageOffset":17574400,"imageIndex":0},{"imageOffset":165288,"symbol":"_swift_release_dealloc","symbolLocation":56,"imageIndex":52},{"imageOffset":168212,"symbol":"bool swift::RefCounts<swift::RefCountBitsT<(swift::RefCountInlinedness)1>>::doDecrementSlow<(swift::PerformDeinit)1>(swift::RefCountBitsT<(swift::RefCountInlinedness)1>, unsigned int)","symbolLocation":152,"imageIndex":52},{"imageOffset":6181836,"symbol":"DefaultLayoutViewResponder.deinit","symbolLocation":48,"imageIndex":54},{"imageOffset":6186324,"symbol":"DefaultLayoutViewResponder.__deallocating_deinit","symbolLocation":16,"imageIndex":54},{"imageOffset":165288,"symbol":"_swift_release_dealloc","symbolLocation":56,"imageIndex":52},{"imageOffset":168592,"symbol":"bool swift::RefCounts<swift::SideTableRefCountBits>::doDecrementSlow<(swift::PerformDeinit)1>(swift::SideTableRefCountBits, unsigned int)","symbolLocation":168,"imageIndex":52},{"imageOffset":11101668,"symbol":"HostingScrollViewResponder.__deallocating_deinit","symbolLocation":172,"imageIndex":55},{"imageOffset":165288,"symbol":"_swift_release_dealloc","symbolLocation":56,"imageIndex":52},{"imageOffset":168592,"symbol":"bool swift::RefCounts<swift::SideTableRefCountBits>::doDecrementSlow<(swift::PerformDeinit)1>(swift::SideTableRefCountBits, unsigned int)","symbolLocation":168,"imageIndex":52},{"imageOffset":22840,"symbol":"swift_arrayDestroy","symbolLocation":192,"imageIndex":52},{"imageOffset":1680032,"symbol":"_ContiguousArrayStorage.__deallocating_deinit","symbolLocation":96,"imageIndex":52},{"imageOffset":165288,"symbol":"_swift_release_dealloc","symbolLocation":56,"imageIndex":52},{"imageOffset":168212,"symbol":"bool swift::RefCounts<swift::RefCountBitsT<(swift::RefCountInlinedness)1>>::doDecrementSlow<(swift::PerformDeinit)1>(swift::RefCountBitsT<(swift::RefCountInlinedness)1>, unsigned int)","symbolLocation":152,"imageIndex":52},{"imageOffset":6171012,"symbol":"MultiViewResponder.containsGlobalPoints(_:cacheKey:options:)","symbolLocation":744,"imageIndex":54},{"imageOffset":6170852,"symbol":"MultiViewResponder.containsGlobalPoints(_:cacheKey:options:)","symbolLocation":584,"imageIndex":54},{"imageOffset":6179000,"symbol":"ViewResponder.hitTest(globalPoints:weights:mask:cacheKey:options:)","symbolLocation":220,"imageIndex":54},{"imageOffset":6176996,"symbol":"HitTestBindingResponder.bindEvent(_:)","symbolLocation":196,"imageIndex":54},{"imageOffset":3122072,"symbol":"HoverEventDispatcher.receiveEvents(_:manager:)","symbolLocation":2596,"imageIndex":55},{"imageOffset":11254256,"symbol":"EventBindingManager.dispatchNonGestureEvents(_:)","symbolLocation":412,"imageIndex":54},{"imageOffset":11250260,"symbol":"EventBindingManager.sendDownstream(_:)","symbolLocation":748,"imageIndex":54},{"imageOffset":11246168,"symbol":"EventBindingManager.send(_:)","symbolLocation":120,"imageIndex":54},{"imageOffset":8844052,"symbol":"NSHostingView.sendEvents(_:track:)","symbolLocation":1244,"imageIndex":55},{"imageOffset":8842524,"symbol":"NSHostingView.sendEvent<A>(_:serial:track:)","symbolLocation":580,"imageIndex":55},{"imageOffset":8860960,"symbol":"NSHostingView.sendHoverEvent(_:phase:)","symbolLocation":1564,"imageIndex":55},{"imageOffset":8932372,"symbol":"NSHostingView.mouseMoved(with:)","symbolLocation":428,"imageIndex":55},{"imageOffset":8932560,"symbol":"@objc NSHostingView.mouseMoved(with:)","symbolLocation":56,"imageIndex":55},{"imageOffset":14518072,"symbol":"-[NSTrackingArea mouseMoved:]","symbolLocation":116,"imageIndex":56},{"imageOffset":10268976,"symbol":"-[_NSTrackingAreaAKManager _mouseMoved:]","symbolLocation":440,"imageIndex":56},{"imageOffset":14359940,"symbol":"_routeMouseMovedEvent","symbolLocation":240,"imageIndex":56},{"imageOffset":14358124,"symbol":"-[NSWindow(NSEventRouting) _reallySendEvent:isDelayedEvent:]","symbolLocation":556,"imageIndex":56},{"imageOffset":14356668,"symbol":"-[NSWindow(NSEventRouting) sendEvent:]","symbolLocation":372,"imageIndex":56},{"imageOffset":11444488,"symbol":"routeMouseMovedEvent","symbolLocation":148,"imageIndex":56},{"imageOffset":11441960,"symbol":"-[NSApplication(NSEventRouting) sendEvent:]","symbolLocation":964,"imageIndex":56},{"imageOffset":5773044,"symbol":"-[NSApplication _handleEvent:]","symbolLocation":60,"imageIndex":56},{"imageOffset":100264,"symbol":"-[NSApplication run]","symbolLocation":408,"imageIndex":56},{"imageOffset":18140,"symbol":"NSApplicationMain","symbolLocation":880,"imageIndex":56},{"imageOffset":1119212,"symbol":"specialized runApp(_:)","symbolLocation":168,"imageIndex":55},{"imageOffset":5024576,"symbol":"runApp<A>(_:)","symbolLocation":112,"imageIndex":55},{"imageOffset":7950808,"symbol":"static App.main()","symbolLocation":224,"imageIndex":55},{"imageOffset":25874644,"sourceFile":"\/<compiler-generated>","symbol":"static RedLemonApp.$main()","symbolLocation":40,"imageIndex":0},{"imageOffset":25874816,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":12,"imageIndex":0},{"imageOffset":36180,"symbol":"start","symbolLocation":7184,"imageIndex":57}]},{"id":403352,"frames":[],"threadState":{"x":[{"value":6099464192},{"value":5123},{"value":6098927616},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6099464192},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"id":403375,"name":"com.apple.NSEventThread","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592,"symbolLocation":24,"symbol":"OBJC_METACLASS_$_MPSNNGradientStateNode"},{"value":133053791862784},{"value":0},{"value":133053791862784},{"value":2},{"value":4294967295},{"value":0},{"value":17179869184},{"value":0},{"value":2},{"value":0},{"value":0},{"value":30979},{"value":0},{"value":18446744073709551569},{"value":8611827872},{"value":0},{"value":4294967295},{"value":2},{"value":133053791862784},{"value":0},{"value":133053791862784},{"value":6101180552},{"value":8589934592,"symbolLocation":24,"symbol":"OBJC_METACLASS_$_MPSNNGradientStateNode"},{"value":21592279046},{"value":18446744073709550527},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761025576},"cpsr":{"value":4096},"fp":{"value":6101180400},"sp":{"value":6101180320},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950836},"far":{"value":0}},"frames":[{"imageOffset":3124,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":77864,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":60},{"imageOffset":39308,"symbol":"mach_msg_overwrite","symbolLocation":484,"imageIndex":60},{"imageOffset":4020,"symbol":"mach_msg","symbolLocation":24,"imageIndex":60},{"imageOffset":392096,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":160,"imageIndex":61},{"imageOffset":386296,"symbol":"__CFRunLoopRun","symbolLocation":1188,"imageIndex":61},{"imageOffset":1150516,"symbol":"_CFRunLoopRunSpecificWithOptions","symbolLocation":532,"imageIndex":61},{"imageOffset":719412,"symbol":"_NSEventThread","symbolLocation":184,"imageIndex":56},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403378,"frames":[],"threadState":{"x":[{"value":6102904832},{"value":25603},{"value":6102368256},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6102904832},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"id":403451,"frames":[],"threadState":{"x":[{"value":6105772032},{"value":80659},{"value":6105235456},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6105772032},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"id":403456,"name":"com.apple.NSURLConnectionLoader","threadState":{"x":[{"value":268451845},{"value":21592279046},{"value":8589934592,"symbolLocation":24,"symbol":"OBJC_METACLASS_$_MPSNNGradientStateNode"},{"value":327667349979136},{"value":0},{"value":327667349979136},{"value":2},{"value":4294967295},{"value":0},{"value":17179869184},{"value":0},{"value":2},{"value":0},{"value":0},{"value":76291},{"value":0},{"value":18446744073709551569},{"value":8611827872},{"value":0},{"value":4294967295},{"value":2},{"value":327667349979136},{"value":0},{"value":327667349979136},{"value":6106340680},{"value":8589934592,"symbolLocation":24,"symbol":"OBJC_METACLASS_$_MPSNNGradientStateNode"},{"value":21592279046},{"value":18446744073709550527},{"value":4412409862}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761025576},"cpsr":{"value":4096},"fp":{"value":6106340528},"sp":{"value":6106340448},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950836},"far":{"value":0}},"frames":[{"imageOffset":3124,"symbol":"mach_msg2_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":77864,"symbol":"mach_msg2_internal","symbolLocation":76,"imageIndex":60},{"imageOffset":39308,"symbol":"mach_msg_overwrite","symbolLocation":484,"imageIndex":60},{"imageOffset":4020,"symbol":"mach_msg","symbolLocation":24,"imageIndex":60},{"imageOffset":392096,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":160,"imageIndex":61},{"imageOffset":386296,"symbol":"__CFRunLoopRun","symbolLocation":1188,"imageIndex":61},{"imageOffset":1150516,"symbol":"_CFRunLoopRunSpecificWithOptions","symbolLocation":532,"imageIndex":61},{"imageOffset":2407216,"symbol":"+[__CFN_CoreSchedulingSetRunnable _run:]","symbolLocation":416,"imageIndex":63},{"imageOffset":157600,"symbol":"__NSThread__start__","symbolLocation":732,"imageIndex":64},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403459,"name":"NIO-SGLTN-0-#0","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":33246029824},{"value":64},{"value":0},{"value":6106913808},{"value":18446726482597246976},{"value":6106913776},{"value":6106914352},{"value":16},{"value":1},{"value":0},{"value":3765009292887897974,"symbolLocation":3765009288481734658,"symbol":"reflection metadata field descriptor NSStringCompareOptions"},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6106915184},{"value":6106914352},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4381050672},"cpsr":{"value":536875008},"fp":{"value":6106913648},"sp":{"value":6106913648},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":60},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944088,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":516},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403460,"name":"NIO-SGLTN-0-#1","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":33246023680},{"value":64},{"value":6107488208},{"value":6107486944},{"value":6107488456},{"value":6107486912},{"value":6107487488},{"value":16},{"value":16},{"value":4407414840,"symbolLocation":16,"symbol":"full type metadata for timespec"},{"value":6107488160},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6107488624},{"value":6107487488},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4381050672},"cpsr":{"value":536875008},"fp":{"value":6107486784},"sp":{"value":6107486784},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":60},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944300,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":64},{"imageOffset":12944428,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":52,"imageIndex":0},{"imageOffset":12473996,"sourceFile":"\/<compiler-generated>","symbol":"withUnsafePointer<A, B, C>(to:_:)","symbolLocation":92,"imageIndex":0},{"imageOffset":12943988,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":416},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403461,"name":"NIO-SGLTN-0-#2","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":33246021632},{"value":64},{"value":0},{"value":6108060688},{"value":18446726482597246976},{"value":6108060656},{"value":6108061232},{"value":16},{"value":1},{"value":0},{"value":3765009292887897974,"symbolLocation":3765009288481734658,"symbol":"reflection metadata field descriptor NSStringCompareOptions"},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6108062064},{"value":6108061232},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4381050672},"cpsr":{"value":536875008},"fp":{"value":6108060528},"sp":{"value":6108060528},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":60},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944088,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":516},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403462,"name":"NIO-SGLTN-0-#3","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":33246031872},{"value":64},{"value":0},{"value":6108634128},{"value":18446726482597246976},{"value":6108634096},{"value":6108634672},{"value":16},{"value":1},{"value":0},{"value":3765009292887897974,"symbolLocation":3765009288481734658,"symbol":"reflection metadata field descriptor NSStringCompareOptions"},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6108635504},{"value":6108634672},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4381050672},"cpsr":{"value":536875008},"fp":{"value":6108633968},"sp":{"value":6108633968},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":60},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944088,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":516},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403463,"name":"NIO-SGLTN-0-#4","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":33252392960},{"value":64},{"value":0},{"value":6109207568},{"value":18446726482597246976},{"value":6109207536},{"value":6109208112},{"value":16},{"value":1},{"value":0},{"value":3765009292887897974,"symbolLocation":3765009288481734658,"symbol":"reflection metadata field descriptor NSStringCompareOptions"},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6109208944},{"value":6109208112},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4381050672},"cpsr":{"value":536875008},"fp":{"value":6109207408},"sp":{"value":6109207408},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":60},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944088,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":516},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403464,"name":"NIO-SGLTN-0-#5","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":33245892608},{"value":64},{"value":6109781968},{"value":6109780704},{"value":6109782216},{"value":6109780672},{"value":6109781248},{"value":16},{"value":16},{"value":4407414840,"symbolLocation":16,"symbol":"full type metadata for timespec"},{"value":6109781920},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6109782384},{"value":6109781248},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4381050672},"cpsr":{"value":536875008},"fp":{"value":6109780544},"sp":{"value":6109780544},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":60},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944300,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":64},{"imageOffset":12944428,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":52,"imageIndex":0},{"imageOffset":12473996,"sourceFile":"\/<compiler-generated>","symbol":"withUnsafePointer<A, B, C>(to:_:)","symbolLocation":92,"imageIndex":0},{"imageOffset":12943988,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":416},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403465,"name":"NIO-SGLTN-0-#6","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":33245894656},{"value":64},{"value":0},{"value":6110354448},{"value":18446726482597246976},{"value":6110354416},{"value":6110354992},{"value":16},{"value":1},{"value":0},{"value":3765009292887897974,"symbolLocation":3765009288481734658,"symbol":"reflection metadata field descriptor NSStringCompareOptions"},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6110355824},{"value":6110354992},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4381050672},"cpsr":{"value":536875008},"fp":{"value":6110354288},"sp":{"value":6110354288},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":60},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944088,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":516},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403466,"name":"NIO-SGLTN-0-#7","threadState":{"x":[{"value":4},{"value":0},{"value":0},{"value":33245902848},{"value":64},{"value":6110928848},{"value":6110927584},{"value":6110929096},{"value":6110927552},{"value":6110928128},{"value":16},{"value":16},{"value":4407414840,"symbolLocation":16,"symbol":"full type metadata for timespec"},{"value":6110928800},{"value":668265261},{"value":1},{"value":363},{"value":8636409168,"symbolLocation":0,"symbol":"type metadata for Int32"},{"value":0},{"value":6110929264},{"value":6110928128},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":4381050672},"cpsr":{"value":536875008},"fp":{"value":6110927424},"sp":{"value":6110927424},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760976176},"far":{"value":0}},"frames":[{"imageOffset":28464,"symbol":"kevent","symbolLocation":8,"imageIndex":60},{"imageOffset":13076272,"sourceFile":"\/<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":12,"imageIndex":0},{"imageOffset":13108328,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":72},{"imageOffset":13108396,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":44,"imageIndex":0},{"imageOffset":13079408,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":0,"symbolLocation":332},{"imageOffset":13108104,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":0,"symbolLocation":260},{"imageOffset":12986648,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":412},{"imageOffset":12991404,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":20,"imageIndex":0},{"imageOffset":12944300,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":64},{"imageOffset":12944428,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":52,"imageIndex":0},{"imageOffset":12473996,"sourceFile":"\/<compiler-generated>","symbol":"withUnsafePointer<A, B, C>(to:_:)","symbolLocation":92,"imageIndex":0},{"imageOffset":12943988,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":0,"symbolLocation":416},{"imageOffset":12982520,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":916},{"imageOffset":12960460,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":0,"symbolLocation":116},{"imageOffset":12922192,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":0,"symbolLocation":168},{"imageOffset":12934740,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":28,"imageIndex":0},{"imageOffset":12892152,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":52},{"imageOffset":12892272,"sourceFile":"\/<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":44,"imageIndex":0},{"imageOffset":12892412,"sourceFile":"\/<compiler-generated>","symbol":"autoreleasepool<A, B>(invoking:)","symbolLocation":124,"imageIndex":0},{"imageOffset":12892048,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":0,"symbolLocation":144},{"imageOffset":12918952,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":0,"symbolLocation":516},{"imageOffset":12567384,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":0,"symbolLocation":616},{"imageOffset":12568860,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":0,"symbolLocation":260},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403467,"name":"TP-#0","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":18446726483666796544},{"value":1},{"value":33251883968},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":130307},{"value":18446744073709551615},{"value":18496718392},{"value":3},{"value":1},{"value":33235494208},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33219346736},{"value":33219346672},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6111505312},"sp":{"value":6111505296},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":65},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":65},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403468,"name":"TP-#1","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":18446726483666796544},{"value":1},{"value":33251883968},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":130307},{"value":18446744073709551615},{"value":18496718392},{"value":3},{"value":1},{"value":33235494208},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33219346736},{"value":33219346672},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6112078752},"sp":{"value":6112078736},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":65},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":65},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403469,"name":"TP-#2","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":8636359368,"symbolLocation":8,"symbol":"type metadata for ()"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":130307},{"value":18446744073709551615},{"value":18496718392},{"value":3},{"value":1},{"value":33235494208},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33219346736},{"value":33219346672},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6112652192},"sp":{"value":6112652176},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":65},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":65},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403470,"name":"TP-#3","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":8636359368,"symbolLocation":8,"symbol":"type metadata for ()"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":130307},{"value":18446744073709551615},{"value":18496718392},{"value":3},{"value":1},{"value":33235494208},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33219346736},{"value":33219346672},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6113225632},"sp":{"value":6113225616},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":65},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":65},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403471,"name":"TP-#4","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":8636359368,"symbolLocation":8,"symbol":"type metadata for ()"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":130307},{"value":18446744073709551615},{"value":18496718392},{"value":3},{"value":1},{"value":33235494208},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33219346736},{"value":33219346672},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6113799072},"sp":{"value":6113799056},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":65},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":65},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403472,"name":"TP-#5","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":8636359368,"symbolLocation":8,"symbol":"type metadata for ()"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":130307},{"value":18446744073709551615},{"value":18496718392},{"value":3},{"value":1},{"value":33235494208},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33219346736},{"value":33219346672},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6114372512},"sp":{"value":6114372496},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":65},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":65},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403473,"name":"TP-#6","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":8636359368,"symbolLocation":8,"symbol":"type metadata for ()"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":130307},{"value":18446744073709551615},{"value":18496718392},{"value":3},{"value":1},{"value":33235494208},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33219346736},{"value":33219346672},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6114945952},"sp":{"value":6114945936},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":65},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":65},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403474,"name":"TP-#7","threadState":{"x":[{"value":14},{"value":18446744073709551615},{"value":0},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":8636371336,"symbolLocation":0,"symbol":"protocol witness table for Never"},{"value":0},{"value":18446744072631617535},{"value":18446726482597246976},{"value":130307},{"value":18446744073709551615},{"value":18496718392},{"value":3},{"value":1},{"value":33235494208},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":8589043624,"symbolLocation":0,"symbol":"OBJC_CLASS_$_OS_dispatch_semaphore"},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33219346736},{"value":33219346672},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759410064},"cpsr":{"value":1610616832},"fp":{"value":6115519392},"sp":{"value":6115519376},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":14736,"symbol":"_dispatch_sema4_wait","symbolLocation":28,"imageIndex":65},{"imageOffset":16192,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":132,"imageIndex":65},{"imageOffset":12605816,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":0,"symbolLocation":128},{"imageOffset":12609520,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":0,"symbolLocation":208},{"imageOffset":13109392,"sourceFile":"\/<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":24,"imageIndex":0},{"imageOffset":13117924,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":0,"symbolLocation":696},{"imageOffset":13118108,"sourceFile":"\/<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":12,"imageIndex":0},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":403642,"frames":[],"threadState":{"x":[{"value":6100037632},{"value":73767},{"value":6099501056},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6100037632},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"id":403754,"frames":[],"threadState":{"x":[{"value":6100611072},{"value":76807},{"value":6100074496},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6100611072},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"triggered":true,"id":403755,"threadState":{"x":[{"value":0},{"value":0},{"value":0},{"value":0},{"value":22585229568},{"value":32},{"value":18446744072631617535},{"value":18446726482597246976},{"value":11787453878116854617},{"value":11787453872032045913},{"value":2},{"value":1099511627776},{"value":4294967293},{"value":0},{"value":0},{"value":0},{"value":328},{"value":8611826064},{"value":0},{"value":6},{"value":53027},{"value":6101758176},{"value":33252024688},{"value":0},{"value":125},{"value":6101758176},{"value":0},{"value":4293984255},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6761224328},"cpsr":{"value":1073745920},"fp":{"value":6101756928},"sp":{"value":6101756896},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760986032,"matchesCrashFrame":1},"far":{"value":0}},"queue":"com.apple.root.default-qos.cooperative","frames":[{"imageOffset":38320,"symbol":"__pthread_kill","symbolLocation":8,"imageIndex":60},{"imageOffset":26760,"symbol":"pthread_kill","symbolLocation":296,"imageIndex":62},{"imageOffset":497744,"symbol":"abort","symbolLocation":124,"imageIndex":66},{"imageOffset":133016,"symbol":"swift::fatalErrorv(unsigned int, char const*, char*)","symbolLocation":144,"imageIndex":52},{"imageOffset":133048,"symbol":"swift::fatalError(unsigned int, char const*, ...)","symbolLocation":32,"imageIndex":52},{"imageOffset":4777048,"symbol":"swift_deallocClassInstance.cold.1","symbolLocation":168,"imageIndex":52},{"imageOffset":165572,"symbol":"swift_deallocClassInstance","symbolLocation":224,"imageIndex":52},{"imageOffset":23138648,"sourceFile":"MPVWrapper.swift","symbol":"MPVWrapper.__deallocating_deinit","symbolLocation":52,"imageIndex":0},{"imageOffset":165288,"symbol":"_swift_release_dealloc","symbolLocation":56,"imageIndex":52},{"imageOffset":168592,"symbol":"bool swift::RefCounts<swift::SideTableRefCountBits>::doDecrementSlow<(swift::PerformDeinit)1>(swift::SideTableRefCountBits, unsigned int)","symbolLocation":168,"imageIndex":52},{"imageOffset":23993256,"imageIndex":0},{"imageOffset":165288,"symbol":"_swift_release_dealloc","symbolLocation":56,"imageIndex":52},{"imageOffset":168212,"symbol":"bool swift::RefCounts<swift::RefCountBitsT<(swift::RefCountInlinedness)1>>::doDecrementSlow<(swift::PerformDeinit)1>(swift::RefCountBitsT<(swift::RefCountInlinedness)1>, unsigned int)","symbolLocation":152,"imageIndex":52},{"imageOffset":16404108,"imageIndex":0},{"imageOffset":165288,"symbol":"_swift_release_dealloc","symbolLocation":56,"imageIndex":52},{"imageOffset":168212,"symbol":"bool swift::RefCounts<swift::RefCountBitsT<(swift::RefCountInlinedness)1>>::doDecrementSlow<(swift::PerformDeinit)1>(swift::RefCountBitsT<(swift::RefCountInlinedness)1>, unsigned int)","symbolLocation":152,"imageIndex":52},{"imageOffset":447276,"symbol":"completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*)","symbolLocation":48,"imageIndex":67},{"imageOffset":447229,"symbol":"completeTaskWithClosure(swift::AsyncContext*, swift::SwiftError*)","symbolLocation":1,"imageIndex":67}]},{"id":403902,"frames":[],"threadState":{"x":[{"value":6118961152},{"value":78563},{"value":6118424576},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6118961152},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"id":403903,"frames":[],"threadState":{"x":[{"value":6119534592},{"value":75187},{"value":6118998016},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6119534592},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"id":403904,"frames":[],"threadState":{"x":[{"value":6118387712},{"value":119887},{"value":6117851136},{"value":0},{"value":409604},{"value":18446744073709551615},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":0},"cpsr":{"value":4096},"fp":{"value":0},"sp":{"value":6118387712},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6761204628},"far":{"value":0}}},{"id":403993,"name":"com.apple.coremedia.sharedRootQueue.47","threadState":{"x":[{"value":14},{"value":4294967115611373572},{"value":999999958},{"value":68719460488},{"value":33256570112},{"value":0},{"value":0},{"value":35},{"value":999999958},{"value":3},{"value":13835058055282163714},{"value":80000000},{"value":6017260187616200},{"value":5999665854086096},{"value":65536},{"value":44},{"value":18446744073709551578},{"value":8611830336},{"value":0},{"value":374364843540},{"value":33206647424},{"value":1000000000},{"value":33206647288},{"value":6124122336},{"value":0},{"value":0},{"value":18446744071411073023},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759619724},"cpsr":{"value":2147487744},"fp":{"value":6124121920},"sp":{"value":6124121888},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950728},"far":{"value":0}},"frames":[{"imageOffset":3016,"symbol":"semaphore_timedwait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":224396,"symbol":"_dispatch_sema4_timedwait","symbolLocation":64,"imageIndex":65},{"imageOffset":16136,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":76,"imageIndex":65},{"imageOffset":81344,"symbol":"_dispatch_worker_thread","symbolLocation":324,"imageIndex":65},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":404003,"name":"caulk.messenger.shared:17","threadState":{"x":[{"value":14},{"value":1},{"value":0},{"value":1},{"value":0},{"value":1},{"value":0},{"value":0},{"value":0},{"value":4294967295},{"value":0},{"value":0},{"value":5069193240},{"value":6125268568},{"value":28},{"value":0},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33198780256},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6968933896},"cpsr":{"value":2147487744},"fp":{"value":6125268864},"sp":{"value":6125268832},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":7688,"symbol":"caulk::semaphore::timed_wait(double)","symbolLocation":224,"imageIndex":68},{"imageOffset":7344,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":32,"imageIndex":68},{"imageOffset":6480,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*)","symbolLocation":96,"imageIndex":68},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":404004,"name":"caulk.messenger.shared:high","threadState":{"x":[{"value":14},{"value":105731},{"value":105731},{"value":15},{"value":4294967295},{"value":0},{"value":0},{"value":0},{"value":0},{"value":4294967295},{"value":1},{"value":33223519160},{"value":0},{"value":0},{"value":0},{"value":0},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33198780480},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6968933896},"cpsr":{"value":2147487744},"fp":{"value":6125842304},"sp":{"value":6125842272},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":7688,"symbol":"caulk::semaphore::timed_wait(double)","symbolLocation":224,"imageIndex":68},{"imageOffset":7344,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":32,"imageIndex":68},{"imageOffset":6480,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*)","symbolLocation":96,"imageIndex":68},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":404023,"name":"caulk::deferred_logger","threadState":{"x":[{"value":14},{"value":1},{"value":0},{"value":1},{"value":0},{"value":1},{"value":0},{"value":0},{"value":0},{"value":4294967295},{"value":0},{"value":0},{"value":5069193248},{"value":6126415544},{"value":67104768},{"value":0},{"value":18446744073709551580},{"value":8611830352},{"value":0},{"value":33257195768},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6968933896},"cpsr":{"value":2147487744},"fp":{"value":6126415744},"sp":{"value":6126415712},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950704},"far":{"value":0}},"frames":[{"imageOffset":2992,"symbol":"semaphore_wait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":7688,"symbol":"caulk::semaphore::timed_wait(double)","symbolLocation":224,"imageIndex":68},{"imageOffset":7344,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":32,"imageIndex":68},{"imageOffset":6480,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*>>>(void*)","symbolLocation":96,"imageIndex":68},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]},{"id":404097,"name":"AudioSession - RootQueue","threadState":{"x":[{"value":14},{"value":4294967115611373572},{"value":999999958},{"value":68719460488},{"value":33142950912},{"value":7052784653},{"value":0},{"value":0},{"value":999999958},{"value":3},{"value":13835058055282163714},{"value":80000000},{"value":4029100238909625},{"value":4011505905379483},{"value":77824},{"value":26},{"value":18446744073709551578},{"value":8611830336},{"value":0},{"value":374369190444},{"value":33206633984},{"value":1000000000},{"value":33206633848},{"value":6102331616},{"value":0},{"value":0},{"value":18446744071411073023},{"value":0},{"value":0}],"flavor":"ARM_THREAD_STATE64","lr":{"value":6759619724},"cpsr":{"value":2147487744},"fp":{"value":6102331200},"sp":{"value":6102331168},"esr":{"value":1442840704,"description":"(Syscall)"},"pc":{"value":6760950728},"far":{"value":0}},"frames":[{"imageOffset":3016,"symbol":"semaphore_timedwait_trap","symbolLocation":8,"imageIndex":60},{"imageOffset":224396,"symbol":"_dispatch_sema4_timedwait","symbolLocation":64,"imageIndex":65},{"imageOffset":16136,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":76,"imageIndex":65},{"imageOffset":81344,"symbol":"_dispatch_worker_thread","symbolLocation":324,"imageIndex":65},{"imageOffset":27656,"symbol":"_pthread_start","symbolLocation":136,"imageIndex":62},{"imageOffset":7080,"symbol":"thread_start","symbolLocation":8,"imageIndex":62}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4367974400,
    "CFBundleShortVersionString" : "v1.0.182",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 39157760,
    "uuid" : "4b4278ed-5cfe-3e6b-be0a-88150bc9b72b",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "182"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4458807296,
    "CFBundleShortVersionString" : "2.8.0",
    "CFBundleIdentifier" : "org.sparkle-project.Sparkle",
    "size" : 294912,
    "uuid" : "8f886ac7-3842-3b7f-bbf2-c56ffa529f6e",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/Sparkle.framework\/Versions\/B\/Sparkle",
    "name" : "Sparkle",
    "CFBundleVersion" : "2049"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4466835456,
    "size" : 3473408,
    "uuid" : "03681c00-9c6b-3c36-b18e-0aa5ab84556f",
    "path" : "\/opt\/homebrew\/*\/libmpv.2.dylib",
    "name" : "libmpv.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4458184704,
    "size" : 163840,
    "uuid" : "e8ec394f-559b-32d9-9a38-9d520ad185a3",
    "path" : "\/opt\/homebrew\/*\/libass.9.dylib",
    "name" : "libass.9.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4481007616,
    "size" : 9125888,
    "uuid" : "ee19c04e-0da1-391a-a0c4-8d071b295fff",
    "path" : "\/opt\/homebrew\/*\/libavcodec.62.11.100.dylib",
    "name" : "libavcodec.62.11.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4471341056,
    "size" : 2408448,
    "uuid" : "5c71529c-36df-3e36-b1b3-5c9300b11b48",
    "path" : "\/opt\/homebrew\/*\/libavfilter.11.4.100.dylib",
    "name" : "libavfilter.11.4.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4462346240,
    "size" : 1982464,
    "uuid" : "02b4dc77-f5d6-34b9-9927-325f6fff3b2b",
    "path" : "\/opt\/homebrew\/*\/libavformat.62.3.100.dylib",
    "name" : "libavformat.62.3.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4497047552,
    "size" : 475136,
    "uuid" : "71234acb-1735-3a3b-9a25-586ec4fe16fd",
    "path" : "\/opt\/homebrew\/*\/libavutil.60.8.100.dylib",
    "name" : "libavutil.60.8.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4460183552,
    "size" : 704512,
    "uuid" : "03007277-7fb4-3f37-adfd-90e73cbef1a4",
    "path" : "\/opt\/homebrew\/*\/libplacebo.351.dylib",
    "name" : "libplacebo.351.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4458037248,
    "size" : 65536,
    "uuid" : "275fc1a4-0ec7-3969-a142-5d02807123eb",
    "path" : "\/opt\/homebrew\/*\/libswresample.6.1.100.dylib",
    "name" : "libswresample.6.1.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4461133824,
    "size" : 458752,
    "uuid" : "db53fb7b-4b83-3840-8a23-b6f4ccdedd84",
    "path" : "\/opt\/homebrew\/*\/libswscale.9.1.100.dylib",
    "name" : "libswscale.9.1.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4459233280,
    "size" : 229376,
    "uuid" : "1bcda6e7-e51f-326c-86b8-30f68e27b474",
    "path" : "\/opt\/homebrew\/*\/libmujs.dylib",
    "name" : "libmujs.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4464656384,
    "size" : 262144,
    "uuid" : "8544ae79-c27a-3dce-ad01-cfb0ed1269c7",
    "path" : "\/opt\/homebrew\/*\/liblcms2.2.dylib",
    "name" : "liblcms2.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4465737728,
    "size" : 557056,
    "uuid" : "551362f7-cccf-34f0-896d-d8056eac3dc0",
    "path" : "\/opt\/homebrew\/*\/libarchive.13.dylib",
    "name" : "libarchive.13.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4458610688,
    "size" : 81920,
    "uuid" : "ba5a7055-bb2a-363c-a69f-038e1fdd6512",
    "path" : "\/opt\/homebrew\/*\/libavdevice.62.1.100.dylib",
    "name" : "libavdevice.62.1.100.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4465033216,
    "size" : 262144,
    "uuid" : "cca3fbbc-a2d1-3cdd-84f7-744df4503c8e",
    "path" : "\/opt\/homebrew\/*\/libbluray.3.dylib",
    "name" : "libbluray.3.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4474388480,
    "size" : 475136,
    "uuid" : "291ec50f-e60a-364c-bf1c-efe9fb72b3b5",
    "path" : "\/opt\/homebrew\/*\/libluajit-5.1.2.1.1767980792.dylib",
    "name" : "libluajit-5.1.2.1.1767980792.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4466442240,
    "size" : 196608,
    "uuid" : "10cae9d2-9881-3c25-a61c-50a01ab16891",
    "path" : "\/opt\/homebrew\/*\/librubberband.3.dylib",
    "name" : "librubberband.3.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4459773952,
    "size" : 163840,
    "uuid" : "c9e5de7d-3102-3d1d-a9e6-7ceb28632936",
    "path" : "\/opt\/homebrew\/*\/libuchardet.0.0.8.dylib",
    "name" : "libuchardet.0.0.8.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4458446848,
    "size" : 16384,
    "uuid" : "094c5db3-9852-3694-b933-4f9ee8828550",
    "path" : "\/opt\/homebrew\/*\/libvapoursynth-script.0.dylib",
    "name" : "libvapoursynth-script.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4475355136,
    "size" : 229376,
    "uuid" : "71bc0e48-c7b2-3658-98c0-1782add5bc6d",
    "path" : "\/opt\/homebrew\/*\/libzimg.2.dylib",
    "name" : "libzimg.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4476256256,
    "size" : 393216,
    "uuid" : "b12ad9a5-f87d-3b9f-9195-9e408319fd3a",
    "path" : "\/opt\/homebrew\/*\/libjpeg.8.3.2.dylib",
    "name" : "libjpeg.8.3.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4477386752,
    "size" : 425984,
    "uuid" : "94a5736e-3150-3ca2-895f-b3d8a5c7c031",
    "path" : "\/opt\/homebrew\/*\/libvulkan.1.4.335.dylib",
    "name" : "libvulkan.1.4.335.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4478025728,
    "size" : 507904,
    "uuid" : "453df297-0ca4-35f8-bb25-dd04bce98b59",
    "path" : "\/opt\/homebrew\/*\/libfreetype.6.dylib",
    "name" : "libfreetype.6.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4460003328,
    "size" : 114688,
    "uuid" : "01c59dc9-20b2-319c-88c2-0f7698cc2bc9",
    "path" : "\/opt\/homebrew\/*\/libfribidi.0.dylib",
    "name" : "libfribidi.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4514529280,
    "size" : 770048,
    "uuid" : "67cf7c00-9bfe-3fc6-b4d1-769ffc46bc68",
    "path" : "\/opt\/homebrew\/*\/libharfbuzz.0.dylib",
    "name" : "libharfbuzz.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4465410048,
    "size" : 131072,
    "uuid" : "8dd7f56f-29c0-32a0-9749-459aa763bcb4",
    "path" : "\/opt\/homebrew\/*\/libunibreak.6.dylib",
    "name" : "libunibreak.6.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4474945536,
    "size" : 147456,
    "uuid" : "a5335a51-59c1-3fc7-acb6-b28db402d52c",
    "path" : "\/opt\/homebrew\/*\/libpng16.16.dylib",
    "name" : "libpng16.16.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4515758080,
    "size" : 1032192,
    "uuid" : "95f652fe-0fda-36d0-b6d0-34427409a2fe",
    "path" : "\/opt\/homebrew\/*\/libglib-2.0.0.dylib",
    "name" : "libglib-2.0.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4465590272,
    "size" : 81920,
    "uuid" : "481f6d39-27e3-3c77-a203-99ddb4e2de7f",
    "path" : "\/opt\/homebrew\/*\/libgraphite2.3.2.1.dylib",
    "name" : "libgraphite2.3.2.1.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4475764736,
    "size" : 163840,
    "uuid" : "4fbeeaca-81e4-303f-840e-2014b4b1b057",
    "path" : "\/opt\/homebrew\/*\/libintl.8.dylib",
    "name" : "libintl.8.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4478664704,
    "size" : 491520,
    "uuid" : "0d65de6e-7082-35af-b6d4-ae160ae9d32e",
    "path" : "\/opt\/homebrew\/*\/libpcre2-8.0.dylib",
    "name" : "libpcre2-8.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4518887424,
    "size" : 1540096,
    "uuid" : "93bc5562-16ec-3ab4-a0cc-6692b3d8f5be",
    "path" : "\/opt\/homebrew\/*\/libvpx.11.dylib",
    "name" : "libvpx.11.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4517117952,
    "size" : 622592,
    "uuid" : "b317db1b-7e5e-3ad6-8dfb-5f30139ba348",
    "path" : "\/opt\/homebrew\/*\/libdav1d.7.dylib",
    "name" : "libdav1d.7.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4479254528,
    "size" : 212992,
    "uuid" : "856fb90d-91ac-3a42-b529-e895af08115c",
    "path" : "\/opt\/homebrew\/*\/libmp3lame.0.dylib",
    "name" : "libmp3lame.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4479746048,
    "size" : 311296,
    "uuid" : "1c7445f6-fb0e-33ea-8aa8-18597a9443ac",
    "path" : "\/opt\/homebrew\/*\/libopus.0.dylib",
    "name" : "libopus.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4523540480,
    "size" : 2539520,
    "uuid" : "08ba4734-ecf7-352b-8d91-9ee8000ae75b",
    "path" : "\/opt\/homebrew\/*\/libSvtAv1Enc.3.1.2.dylib",
    "name" : "libSvtAv1Enc.3.1.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4527783936,
    "size" : 1179648,
    "uuid" : "b916484f-5239-335b-b9fe-4e71261da16b",
    "path" : "\/opt\/homebrew\/*\/libx264.165.dylib",
    "name" : "libx264.165.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4535549952,
    "size" : 4177920,
    "uuid" : "590e5411-20b2-3cf7-9f18-7e2f3611f7a7",
    "path" : "\/opt\/homebrew\/*\/libx265.215.dylib",
    "name" : "libx265.215.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4548313088,
    "size" : 3899392,
    "uuid" : "6492c8fd-dac0-342e-8cbe-063c6b427304",
    "path" : "\/opt\/homebrew\/*\/libshaderc_shared.1.dylib",
    "name" : "libshaderc_shared.1.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4475158528,
    "size" : 131072,
    "uuid" : "7e7bef36-1537-3b34-91b7-eca90293ba43",
    "path" : "\/opt\/homebrew\/*\/liblzma.5.dylib",
    "name" : "liblzma.5.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4518150144,
    "size" : 557056,
    "uuid" : "93a01ac5-b367-3f6d-9b23-ac6404a111a4",
    "path" : "\/opt\/homebrew\/*\/libzstd.1.5.7.dylib",
    "name" : "libzstd.1.5.7.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4475994112,
    "size" : 131072,
    "uuid" : "d2dadb7f-f6c0-3a6d-9c83-02596baca219",
    "path" : "\/opt\/homebrew\/*\/liblz4.1.10.0.dylib",
    "name" : "liblz4.1.10.0.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4459544576,
    "size" : 32768,
    "uuid" : "cdb9743e-4399-33d0-a9af-8667f7f00478",
    "path" : "\/opt\/homebrew\/*\/libb2.1.dylib",
    "name" : "libb2.1.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4477059072,
    "size" : 212992,
    "uuid" : "348f051c-4847-3342-a00e-ccd07adf2634",
    "path" : "\/opt\/homebrew\/*\/libfontconfig.1.dylib",
    "name" : "libfontconfig.1.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4459642880,
    "size" : 32768,
    "uuid" : "89b8fe85-c709-33fa-a9ec-9e6368c9cbc8",
    "path" : "\/opt\/homebrew\/*\/libudfread.3.dylib",
    "name" : "libudfread.3.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4530077696,
    "size" : 1490944,
    "uuid" : "0da641e6-fcba-3c1a-8c8c-ff25aadedac6",
    "path" : "\/opt\/homebrew\/*\/libsamplerate.0.2.2.dylib",
    "name" : "libsamplerate.0.2.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64",
    "base" : 4555603968,
    "CFBundleShortVersionString" : "3.14.2, (c) 2001-2024 Python Software Foundation.",
    "CFBundleIdentifier" : "org.python.python",
    "size" : 3981312,
    "uuid" : "d1eea04d-1fad-31b0-a34c-48e935ff166e",
    "path" : "\/opt\/homebrew\/*\/Python.framework\/Versions\/3.14\/Python",
    "name" : "Python",
    "CFBundleVersion" : "3.14.2"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 4534878208,
    "size" : 49152,
    "uuid" : "d4baeab8-b553-3779-a0ff-d8848e7a22df",
    "path" : "\/usr\/lib\/libobjc-trampolines.dylib",
    "name" : "libobjc-trampolines.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 5033787392,
    "CFBundleShortVersionString" : "342.3",
    "CFBundleIdentifier" : "com.apple.AGXMetalG14G",
    "size" : 8142848,
    "uuid" : "fd2ac287-d149-309f-a2ec-eb9d375be6ad",
    "path" : "\/System\/Library\/Extensions\/AGXMetalG14G.bundle\/Contents\/MacOS\/AGXMetalG14G",
    "name" : "AGXMetalG14G",
    "CFBundleVersion" : "342.3"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 4742103040,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.AppleMetalOpenGLRenderer",
    "size" : 409600,
    "uuid" : "4ff7e230-8427-36ad-98f9-10a81f174e7e",
    "path" : "\/System\/Library\/Extensions\/AppleMetalOpenGLRenderer.bundle\/Contents\/MacOS\/AppleMetalOpenGLRenderer",
    "name" : "AppleMetalOpenGLRenderer",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 5146198016,
    "CFBundleShortVersionString" : "1.14",
    "CFBundleIdentifier" : "com.apple.audio.units.Components",
    "size" : 1327104,
    "uuid" : "0312381d-61ae-3ab9-9cea-b1e46a0c4e54",
    "path" : "\/System\/Library\/Components\/CoreAudio.component\/Contents\/MacOS\/CoreAudio",
    "name" : "CoreAudio",
    "CFBundleVersion" : "1.14"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 7082696704,
    "size" : 5826048,
    "uuid" : "d07a076a-d1d5-315c-8a31-90e34a236afb",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 7125041152,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.combine",
    "size" : 1007664,
    "uuid" : "c81f6237-6777-38a7-9a68-34fd7267db1e",
    "path" : "\/System\/Library\/Frameworks\/Combine.framework\/Versions\/A\/Combine",
    "name" : "Combine",
    "CFBundleVersion" : "3023"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 9634619392,
    "CFBundleShortVersionString" : "7.2.5.1.401",
    "CFBundleIdentifier" : "com.apple.SwiftUICore",
    "size" : 16206240,
    "uuid" : "6c0d0cd1-2abf-3443-bd3e-cf2ff9ea799f",
    "path" : "\/System\/Library\/Frameworks\/SwiftUICore.framework\/Versions\/A\/SwiftUICore",
    "name" : "SwiftUICore",
    "CFBundleVersion" : "7.2.5.1.401"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 7633522688,
    "CFBundleShortVersionString" : "7.2.5.1.401",
    "CFBundleIdentifier" : "com.apple.SwiftUI",
    "size" : 24407328,
    "uuid" : "f0703a94-2852-3e83-9379-1088351e37c9",
    "path" : "\/System\/Library\/Frameworks\/SwiftUI.framework\/Versions\/A\/SwiftUI",
    "name" : "SwiftUI",
    "CFBundleVersion" : "7.2.5.1.401"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6833123328,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.AppKit",
    "size" : 24310400,
    "uuid" : "4e909aec-68bc-3fc9-a87a-de928e1e36e1",
    "path" : "\/System\/Library\/Frameworks\/AppKit.framework\/Versions\/C\/AppKit",
    "name" : "AppKit",
    "CFBundleVersion" : "2685.30.107"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6757224448,
    "size" : 651204,
    "uuid" : "0975afba-c46b-364c-bd84-a75daa9e455a",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "size" : 0,
    "source" : "A",
    "base" : 0,
    "uuid" : "00000000-0000-0000-0000-000000000000"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6761250816,
    "size" : 33776,
    "uuid" : "4dbaf982-1576-3ffc-86be-03a9d2c96be5",
    "path" : "\/usr\/lib\/system\/libsystem_platform.dylib",
    "name" : "libsystem_platform.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6760947712,
    "size" : 246944,
    "uuid" : "548c45c8-9733-3f0d-8ef4-c06df1df2ad0",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6761484288,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.CoreFoundation",
    "size" : 5540928,
    "uuid" : "649000a2-3eb4-3cf5-970a-d3cb37b5780c",
    "path" : "\/System\/Library\/Frameworks\/CoreFoundation.framework\/Versions\/A\/CoreFoundation",
    "name" : "CoreFoundation",
    "CFBundleVersion" : "4201"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6761197568,
    "size" : 51900,
    "uuid" : "527c4ba0-91a5-378b-b3e2-d38269ca5a66",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6865321984,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.CFNetwork",
    "size" : 3911936,
    "uuid" : "444dd8ef-e7eb-389b-958c-f45c56c3c4df",
    "path" : "\/System\/Library\/Frameworks\/CFNetwork.framework\/Versions\/A\/CFNetwork",
    "name" : "CFNetwork",
    "CFBundleVersion" : "3860.300.31"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6786985984,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.Foundation",
    "size" : 16397536,
    "uuid" : "6a518869-0a98-34cb-8a15-cc28f898255e",
    "path" : "\/System\/Library\/Frameworks\/Foundation.framework\/Versions\/C\/Foundation",
    "name" : "Foundation",
    "CFBundleVersion" : "4201"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6759395328,
    "size" : 290400,
    "uuid" : "a4b349e8-dd6f-3b71-84d9-34f3b4acd849",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6759698432,
    "size" : 532552,
    "uuid" : "fb5569a9-cb26-36c2-aa05-e99243692b60",
    "path" : "\/usr\/lib\/system\/libsystem_c.dylib",
    "name" : "libsystem_c.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 10981220352,
    "size" : 562944,
    "uuid" : "2cd4d4d2-15a3-3057-b506-6e79bd1d6428",
    "path" : "\/usr\/lib\/swift\/libswift_Concurrency.dylib",
    "name" : "libswift_Concurrency.dylib"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 6968926208,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.audio.caulk",
    "size" : 167296,
    "uuid" : "d4644b08-911d-30af-82e7-c404878abf47",
    "path" : "\/System\/Library\/PrivateFrameworks\/caulk.framework\/Versions\/A\/caulk",
    "name" : "caulk"
  },
  {
    "source" : "P",
    "arch" : "arm64e",
    "base" : 7052099584,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.MediaExperience",
    "size" : 796704,
    "uuid" : "20e67caa-84cf-379a-98e4-b84267bf9982",
    "path" : "\/System\/Library\/PrivateFrameworks\/MediaExperience.framework\/Versions\/A\/MediaExperience",
    "name" : "MediaExperience",
    "CFBundleVersion" : "1"
  }
],
  "sharedCache" : {
  "base" : 6756139008,
  "size" : 5653544960,
  "uuid" : "acb998b6-263c-3634-b0a8-ae8270a116c2"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.9G resident=0K(0%) swapped_out_or_unallocated=1.9G(100%)\nWritable regions: Total=389.7M written=881K(0%) resident=881K(0%) swapped_out=0K(0%) unallocated=388.8M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               128K        1 \nActivity Tracing                   256K        1 \nAttributeGraph Data               1024K        1 \nCG image                            48K        2 \nColorSync                           64K        3 \nCoreAnimation                     1184K       66 \nCoreGraphics                        32K        2 \nCoreUI image data                  608K        5 \nDispatch continuations            64.0M        1 \nFoundation                        1376K        2 \nImage IO                          4592K       44 \nKernel Alloc Once                   32K        1 \nMALLOC                           264.7M       57 \nMALLOC guard page                 3968K        4 \nOpenGL GLSL                        384K        5 \nSQLite page cache                  640K        5 \nSTACK GUARD                       56.5M       33 \nStack                             25.0M       33 \nVM_ALLOCATE                        528K       22 \n__AUTH                            5781K      644 \n__AUTH_CONST                      88.0M     1025 \n__CTF                               824        1 \n__DATA                            62.9M     1026 \n__DATA_CONST                      36.1M     1081 \n__DATA_DIRTY                      8688K      882 \n__FONT_DATA                        2352        1 \n__GLSLBUILTINS                    5176K        1 \n__INFO_FILTER                         8        1 \n__LINKEDIT                       648.0M       53 \n__OBJC_RO                         78.4M        1 \n__OBJC_RW                         2570K        1 \n__TEXT                             1.2G     1062 \n__TEXT (graphics)                 34.4M       38 \n__TEXT (network)                  2720K        5 \n__TPRO_CONST                       128K        2 \ndyld private memory                128K        1 \nmapped file                      448.4M       56 \npage table in kernel               881K        1 \nshared memory                     1520K       23 \n===========                     =======  ======= \nTOTAL                              3.0G     6193 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.root.default-qos.cooperative"
  }
},
  "logWritingSignature" : "6802e4d978bfbad66fb9b75f98410fd73dfecb16",
  "roots_installed" : 0,
  "bug_type" : "309",
  "trmStatus" : 1,
  "trialInfo" : {
  "rollouts" : [
    {
      "rolloutId" : "5fb4245a1bbfe8005e33a1e1",
      "factorPackIds" : [

      ],
      "deploymentId" : 240000021
    },
    {
      "rolloutId" : "670ea6eb7a111748a97092a4",
      "factorPackIds" : [
        "68db21af3b3ace402427b77b"
      ],
      "deploymentId" : 240000189
    }
  ],
  "experiments" : [

  ]
}
}

Model: Mac14,2, BootROM 13822.61.10, proc 8:4:4 processors, 8 GB, SMC 
Graphics: Apple M2, Apple M2, Built-In
Display: Color LCD, 2560 x 1664 Retina, Main, MirrorOff, Online
Memory Module: LPDDR5, Micron
AirPort: spairport_wireless_card_type_wifi (0x14E4, 0x4387), wl0: Sep 22 2025 22:41:34 version 20.131.4.0.8.7.215 FWID 01-45655c04
IO80211_driverkit-1533.5 "IO80211_driverkit-1533.5" Nov 14 2025 18:26:34
AirPort: 
Bluetooth: Version (null), 0 services, 0 devices, 0 incoming serial ports
Network Service: Wi-Fi, AirPort, en0
Thunderbolt Bus: MacBook Air, Apple Inc.
Thunderbolt Bus: MacBook Air, Apple Inc.
