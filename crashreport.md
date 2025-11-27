-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [20495]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [20358]
Responsible:           Electron [485]
User ID:               501

Date/Time:             2025-11-27 05:21:53.5348 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA


Time Awake Since Boot: 2200 seconds

System Integrity Protection: enabled

Crashed Thread:        5  Dispatch queue: com.apple.network.connections

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_INVALID_ADDRESS at 0x000007f8e99b7858
Exception Codes:       0x0000000000000001, 0x000007f8e99b7858
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 11 Segmentation fault: 11
Terminating Process:   exc handler [20495]

VM Region Info: 0x7f8e99b7858 is not in any region.  Bytes after previous region: 8760565856345  Bytes before following region: 114379763431336
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      VM_ALLOCATE                 12f300000-12f310000    [   64K] r-x/rwx SM=PRV  
--->  GAP OF 0x6ffed795b000 BYTES
      Stack Guard              700006c6b000-700006c6c000 [    4K] ---/rwx SM=NUL  

Thread 0::  Dispatch queue: com.apple.main-thread
0   libsystem_kernel.dylib        	    0x7ff807afa93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff807afaca8 mach_msg + 56
2   CoreFoundation                	    0x7ff807bfe29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff807bfc928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff807bfbd6c CFRunLoopRunSpecific + 562
5   HIToolbox                     	    0x7ff8108ae5e6 RunCurrentEventLoopInMode + 292
6   HIToolbox                     	    0x7ff8108ae34a ReceiveNextEventCommon + 594
7   HIToolbox                     	    0x7ff8108ae0e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
8   AppKit                        	    0x7ff80a63aaa9 _DPSNextEvent + 927
9   AppKit                        	    0x7ff80a639166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
10  AppKit                        	    0x7ff80a62b818 -[NSApplication run] + 586
11  AppKit                        	    0x7ff80a5ff79a NSApplicationMain + 817
12  SwiftUI                       	    0x7ff91315009c specialized runApp(_:) + 161
13  SwiftUI                       	    0x7ff913bb2424 runApp<A>(_:) + 164
14  SwiftUI                       	    0x7ff9136aac5f static App.main() + 63
15  RedLemon                      	       0x10449f273 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
16  RedLemon                      	       0x10449f2f9 RedLemon_main + 9
17  dyld                          	       0x116fc652e start + 462

Thread 1:
0   libsystem_pthread.dylib       	    0x7ff807b32f48 start_wqthread + 0

Thread 2::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libsystem_kernel.dylib        	    0x7ff807afd3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff807b37a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10910ca1f wait_wakeup + 255
3   libmpv.2.dylib                	       0x10910d4c8 mpv_wait_event + 584
4   RedLemon                      	       0x1048e4613 (3) suspend resume partial function for MPVWrapper.pollEvents() + 259 (MPVWrapper.swift:263)
5   RedLemon                      	       0x1048e0d61 (2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:) + 1 (MPVWrapper.swift:111)

Thread 3:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff807afa93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff807afaca8 mach_msg + 56
2   CoreFoundation                	    0x7ff807bfe29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff807bfc928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff807bfbd6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff80a7a8572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 4:
0   libsystem_pthread.dylib       	    0x7ff807b32f48 start_wqthread + 0

Thread 5 Crashed::  Dispatch queue: com.apple.network.connections
0   libobjc.A.dylib               	    0x7ff8079cce2f objc_release + 31
1   CFNetwork                     	    0x7ff80c60490b 0x7ff80c5e2000 + 141579
2   CoreFoundation                	    0x7ff807ccb046 _CFRelease + 244
3   CFNetwork                     	    0x7ff80c603f37 0x7ff80c5e2000 + 139063
4   libsystem_blocks.dylib        	    0x7ff807868654 _Block_release + 130
5   CFNetwork                     	    0x7ff80c76c9b5 0x7ff80c5e2000 + 1616309
6   CFNetwork                     	    0x7ff80c76afc7 0x7ff80c5e2000 + 1609671
7   libsystem_blocks.dylib        	    0x7ff807868654 _Block_release + 130
8   libnetwork.dylib              	    0x7ff80bee0209 nw_proxy_deallocate_options + 25
9   libnetwork.dylib              	    0x7ff80bc0f89c -[NWConcrete_nw_protocol_options dealloc] + 44
10  libnetwork.dylib              	    0x7ff80c352f52 nw_array_dispose + 466
11  libnetwork.dylib              	    0x7ff80bc0fcb1 -[OS_nw_array dealloc] + 17
12  libnetwork.dylib              	    0x7ff80bc0e563 -[NWConcrete_nw_parameters .cxx_destruct] + 83
13  libobjc.A.dylib               	    0x7ff8079d4746 object_cxxDestructFromClass(objc_object*, objc_class*) + 83
14  libobjc.A.dylib               	    0x7ff8079ccf86 objc_destructInstance + 94
15  libobjc.A.dylib               	    0x7ff8079ccf1d _objc_rootDealloc + 62
16  libnetwork.dylib              	    0x7ff80bc0e29d -[NWConcrete_nw_parameters dealloc] + 93
17  libobjc.A.dylib               	    0x7ff8079d4746 object_cxxDestructFromClass(objc_object*, objc_class*) + 83
18  libobjc.A.dylib               	    0x7ff8079ccf86 objc_destructInstance + 94
19  libobjc.A.dylib               	    0x7ff8079ccf1d _objc_rootDealloc + 62
20  libnetwork.dylib              	    0x7ff80bd5abb7 -[NWConcrete_nw_path_evaluator dealloc] + 1111
21  libnetwork.dylib              	    0x7ff80bd5c88a __nw_association_schedule_deactivation_block_invoke + 1322
22  libdispatch.dylib             	    0x7ff80797f317 _dispatch_client_callout + 8
23  libdispatch.dylib             	    0x7ff807981d7c _dispatch_continuation_pop + 453
24  libdispatch.dylib             	    0x7ff807993208 _dispatch_source_invoke + 2179
25  libdispatch.dylib             	    0x7ff8079870f6 _dispatch_workloop_invoke + 1987
26  libdispatch.dylib             	    0x7ff80798feee _dispatch_workloop_worker_thread + 753
27  libsystem_pthread.dylib       	    0x7ff807b33fd0 _pthread_wqthread + 326
28  libsystem_pthread.dylib       	    0x7ff807b32f57 start_wqthread + 15

Thread 6:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff807afa93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff807afaca8 mach_msg + 56
2   CoreFoundation                	    0x7ff807bfe29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff807bfc928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff807bfbd6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff80c82a964 0x7ff80c5e2000 + 2394468
6   Foundation                    	    0x7ff808a53724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 7:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff807aff30e kevent + 10
1   RedLemon                      	       0x104278189 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x1042820af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x104282704 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x104278e3b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x104281fa8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10425ea76 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10425fadf partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x104250a62 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x104250ab7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81511072c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10425092a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10425d28d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x104256bb4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10424b46e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10424e894 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x104243422 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10424346c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff81caffe7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x1042433c9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10424a4ef SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x1041ec208 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x1041ec95a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x1041f2c33 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x104282aff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10428566f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x104285729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 8:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff807aff30e kevent + 10
1   RedLemon                      	       0x104278189 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x1042820af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x104282704 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x104278e3b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x104281fa8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10425ea76 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10425fadf partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x104250a62 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x104250ab7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81511072c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10425092a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10425d28d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x104256bb4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10424b46e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10424e894 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x104243422 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10424346c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff81caffe7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x1042433c9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10424a4ef SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x1041ec208 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x1041ec95a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x1041f2c33 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x104282aff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10428566f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x104285729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 9:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff807aff30e kevent + 10
1   RedLemon                      	       0x104278189 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x1042820af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x104282704 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x104278e3b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x104281fa8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10425ea76 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10425fadf partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x1042509a3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10425d28d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x104256bb4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10424b46e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10424e894 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x104243422 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10424346c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff81caffe7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x1042433c9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10424a4ef SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x1041ec208 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x1041ec95a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x1041f2c33 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x104282aff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10428566f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x104285729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 10:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff807aff30e kevent + 10
1   RedLemon                      	       0x104278189 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x1042820af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x104282704 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x104278e3b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x104281fa8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10425ea76 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10425fadf partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x1042509a3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10425d28d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x104256bb4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10424b46e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10424e894 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x104243422 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10424346c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff81caffe7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x1042433c9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10424a4ef SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x1041ec208 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x1041ec95a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x1041f2c33 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x104282aff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10428566f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x104285729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 11:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff807afa976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80797f7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80797fc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x1041f50ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1041f5fce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x104282aff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10428566f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x104285729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 12:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff807afa976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80797f7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80797fc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x1041f50ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1041f5fce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x104282aff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10428566f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x104285729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 13:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff807afa976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80797f7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80797fc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x1041f50ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1041f5fce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x104282aff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10428566f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x104285729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 14:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff807afa976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80797f7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80797fc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x1041f50ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x1041f5fce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x104282aff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10428566f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x104285729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 15:: core
0   libsystem_kernel.dylib        	    0x7ff807afd3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff807b37a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1090f25c1 mp_dispatch_queue_process + 369
3   libmpv.2.dylib                	       0x10912df18 mp_wait_events + 88
4   libmpv.2.dylib                	       0x10913118b mp_idle + 91
5   libmpv.2.dylib                	       0x1091311f8 idle_loop + 40
6   libmpv.2.dylib                	       0x109127ed8 mp_play_files + 360
7   libmpv.2.dylib                	       0x10910d22e core_thread + 62
8   libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 16:: */ytdl_hook
0   libsystem_kernel.dylib        	    0x7ff807afd3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff807b37a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10910c9a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x10910d4c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x1091a38e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10a7ebe16 0x10a7e6000 + 24086

Thread 17:: */stats
0   libsystem_kernel.dylib        	    0x7ff807afd3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff807b37a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10910c9a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x10910d4c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x1091a38e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10a7ebe16 0x10a7e6000 + 24086

Thread 18:: */console
0   libsystem_kernel.dylib        	    0x7ff807afd3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff807b37a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10910c9a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x10910d4c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x1091a38e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10a7ebe16 0x10a7e6000 + 24086

Thread 19:: */auto_profiles
0   libsystem_kernel.dylib        	    0x7ff807afd3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff807b37a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x10910c9a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x10910d4c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x1091a38e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x10a7ebe16 0x10a7e6000 + 24086

Thread 20:: worker
0   libsystem_kernel.dylib        	    0x7ff807afd3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff807b37a6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1090f547d worker_thread + 173
3   libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
4   libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 21:: AMCP Logging Spool
0   libsystem_kernel.dylib        	    0x7ff807afa976 semaphore_wait_trap + 10
1   caulk                         	    0x7ff81063b2e6 caulk::mach::semaphore::wait_or_error() + 16
2   caulk                         	    0x7ff810623148 caulk::concurrent::details::worker_thread::run() + 36
3   caulk                         	    0x7ff810622e0c void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*) + 41
4   libsystem_pthread.dylib       	    0x7ff807b374e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff807b32f6b thread_start + 15

Thread 22:
0   libsystem_pthread.dylib       	    0x7ff807b32f48 start_wqthread + 0

Thread 23:
0   libsystem_pthread.dylib       	    0x7ff807b32f48 start_wqthread + 0

Thread 24:
0   libsystem_pthread.dylib       	    0x7ff807b32f48 start_wqthread + 0

Thread 25:
0   libsystem_pthread.dylib       	    0x7ff807b32f48 start_wqthread + 0

Thread 26:
0   libsystem_pthread.dylib       	    0x7ff807b32f48 start_wqthread + 0


Thread 5 crashed with X86 Thread State (64-bit):
  rax: 0x300007f8e99b7839  rbx: 0x00007f8e96fe23d0  rcx: 0x000007f8e99b7838  rdx: 0x00007f8e96fe2668
  rdi: 0x00007f8e99b2b6a0  rsi: 0x00000000822c606f  rbp: 0x0000700006ffd3a0  rsp: 0x0000700006ffd388
   r8: 0x000000000000007b   r9: 0x0000000000000000  r10: 0x00007f8e93a00000  r11: 0x00007f8e93a7de10
  r12: 0x0000000100000000  r13: 0x00007f8e96fe23c0  r14: 0x0000000000000148  r15: 0xffffffff00000000
  rip: 0x00007ff8079cce2f  rfl: 0x0000000000010202  cr2: 0x000007f8e99b7858
  
Logical CPU:     0
Error Code:      0x00000004 (no mapping for user data read)
Trap Number:     14

Thread 5 instruction stream:
  48 89 c2 48 c1 ea 37 74-34 48 89 c2 48 01 ca 72  H..H..7t4H..H..r
  12 f0 48 0f b1 17 74 25-a8 01 75 e4 31 f6 e9 78  ..H...t%..u.1..x
  d3 01 00 31 f6 e9 e7 81-00 00 48 b9 f8 ff ff ff  ...1......H.....
  ff 7f 00 00 48 21 c8 f6-40 1c 01 74 df 48 89 f8  ....H!..@..t.H..
  c3 48 85 ff 74 76 89 f8-83 e0 01 48 85 c0 75 6c  .H..tv.....H..ul
  48 8b 07 48 b9 f8 ff ff-ff ff 7f 00 00 48 21 c1  H..H.........H!.
 [48]8b 51 20 f6 c2 04 74-54 a8 01 74 72 48 b9 00  H.Q ...tT..trH..	<==
  00 00 00 00 00 80 00 48-ba 00 00 00 00 00 00 00  .......H........
  01 48 39 c8 72 36 48 89-c6 48 29 d6 72 17 f0 48  .H9.r6H..H).r..H
  0f b1 37 74 22 a8 01 75-e8 31 f6 ba 01 00 00 00  ..7t"..u.1......
  e9 86 cf 01 00 48 85 c8-75 3d 48 8b 35 08 c3 8d  .....H..u=H.5...
  41 ff 25 ca 62 e6 3f 48-39 ce 72 ee c3 66 83 79  A.%.b.?H9.r..f.y

Binary Images:
    0x7ff807af9000 -     0x7ff807b30fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff807b7e000 -     0x7ff808080fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff810880000 -     0x7ff810b73fff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff80a5fc000 -     0x7ff80b48bfff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff9130d4000 -     0x7ff913f73fff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x1033ed000 -        0x105330fff com.redlemon.app (1.0.14) <9afc016a-8973-3667-a32e-3510292e4b2b> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x116fc1000 -        0x11702cfff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff807b31000 -     0x7ff807b3cfff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
       0x10904e000 -        0x10930dfff libmpv.2.dylib (*) <e355e4d8-dcc6-3439-90d2-abf0776cc6ac> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libmpv.2.dylib
    0x7ff8079c3000 -     0x7ff8079fdfff libobjc.A.dylib (*) <b36a2b52-68a9-3e44-b927-71c24be1272f> /usr/lib/libobjc.A.dylib
    0x7ff80c5e2000 -     0x7ff80ca70fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff807867000 -     0x7ff807868fff libsystem_blocks.dylib (*) <f44f0d7c-74fd-37fd-8267-8d3aec7e7fb8> /usr/lib/system/libsystem_blocks.dylib
    0x7ff80bbf1000 -     0x7ff80c5e1fff libnetwork.dylib (*) <bab2b20a-67af-312c-9b68-f98e1930218e> /usr/lib/libnetwork.dylib
    0x7ff80797c000 -     0x7ff8079c2fff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff8089fb000 -     0x7ff808db7fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff814ff5000 -     0x7ff81546efff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff81caff000 -     0x7ff81cb00fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
       0x10a7e6000 -        0x10a84dfff libluajit-5.1.2.dylib (*) <790d1386-66cf-39c0-ab74-e7b60abbd7c9> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libluajit-5.1.2.dylib
    0x7ff810621000 -     0x7ff810642fff com.apple.audio.caulk (1.0) <f04b5c91-d0ec-33c6-8a81-b80a3ebf827f> /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk
               0x0 - 0xffffffffffffffff ??? (*) <00000000-0000-0000-0000-000000000000> ???

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
Writable regions: Total=280.3M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=280.3M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               384K        3 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                            80K        9 
CG raster data                     280K       20 
ColorSync                          232K       28 
CoreAnimation                     1160K       68 
CoreGraphics                        12K        2 
CoreUI image data                 1764K       12 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
IOKit                             7940K        1 
Image IO                          1084K        5 
Kernel Alloc Once                    8K        1 
MALLOC                           162.4M      191 
MALLOC guard page                   48K       11 
MALLOC_LARGE (reserved)            384K        1         reserved VM address space (unallocated)
OpenGL GLSL                        384K        5 
SQLite page cache                 1344K       21 
STACK GUARD                       56.1M       27 
Stack                             21.2M       27 
VM_ALLOCATE                       13.7M       47 
__CTF                               756        1 
__DATA                            55.4M      617 
__DATA_CONST                      33.9M      422 
__DATA_DIRTY                      1676K      209 
__FONT_DATA                          4K        1 
__GLSLBUILTINS                    5176K        1 
__LINKEDIT                       708.0M       85 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           594.5M      621 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        13.6M       40 
mapped file                      342.1M       37 
shared memory                     9992K       23 
===========                     =======  ======= 
TOTAL                              2.1G     2550 
TOTAL, minus reserved VM space     2.1G     2550 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-11-27 05:22:11.00 -0500","app_version":"1.0.14","slice_uuid":"9afc016a-8973-3667-a32e-3510292e4b2b","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"D1E1FF93-96CA-4AB9-800E-AFCF2287DF3E","name":"RedLemon"}
{
  "uptime" : 2200,
  "procLaunch" : "2025-11-27 05:20:49.0233 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 2160156285585,
  "coalitionID" : 550,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-11-27 05:21:53.5348 -0500",
  "incident" : "D1E1FF93-96CA-4AB9-800E-AFCF2287DF3E",
  "bug_type" : "309",
  "pid" : 20495,
  "procExitAbsTime" : 2224620922514,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 20358,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 485,
  "responsibleProc" : "Electron",
  "sip" : "enabled",
  "vmRegionInfo" : "0x7f8e99b7858 is not in any region.  Bytes after previous region: 8760565856345  Bytes before following region: 114379763431336\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      VM_ALLOCATE                 12f300000-12f310000    [   64K] r-x\/rwx SM=PRV  \n--->  GAP OF 0x6ffed795b000 BYTES\n      Stack Guard              700006c6b000-700006c6c000 [    4K] ---\/rwx SM=NUL  ",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x000007f8e99b7858","rawCodes":[1,8765652564056],"type":"EXC_BAD_ACCESS","signal":"SIGSEGV","subtype":"KERN_INVALID_ADDRESS at 0x000007f8e99b7858"},
  "termination" : {"flags":0,"code":11,"namespace":"SIGNAL","indicator":"Segmentation fault: 11","byProc":"exc handler","byPid":20495},
  "vmregioninfo" : "0x7f8e99b7858 is not in any region.  Bytes after previous region: 8760565856345  Bytes before following region: 114379763431336\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      VM_ALLOCATE                 12f300000-12f310000    [   64K] r-x\/rwx SM=PRV  \n--->  GAP OF 0x6ffed795b000 BYTES\n      Stack Guard              700006c6b000-700006c6c000 [    4K] ---\/rwx SM=NUL  ",
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 5,
  "threads" : [{"id":61085,"queue":"com.apple.main-thread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":2},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":2},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":2},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":3},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":3},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":3},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":3},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":4},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":4},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":4},{"imageOffset":17506931,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":5,"symbolLocation":35},{"imageOffset":17507065,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":5},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":6}]},{"id":61092,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":61093,"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780831,"symbol":"wait_wakeup","symbolLocation":255,"imageIndex":8},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":8},{"imageOffset":21984787,"sourceLine":263,"sourceFile":"MPVWrapper.swift","symbol":"(3) suspend resume partial function for MPVWrapper.pollEvents()","imageIndex":5,"symbolLocation":259},{"imageOffset":21970273,"sourceLine":111,"sourceFile":"MPVWrapper.swift","symbol":"(2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:)","imageIndex":5,"symbolLocation":1}]},{"id":61109,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61114,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"triggered":true,"id":61119,"instructionState":{"instructionStream":{"bytes":[72,137,194,72,193,234,55,116,52,72,137,194,72,1,202,114,18,240,72,15,177,23,116,37,168,1,117,228,49,246,233,120,211,1,0,49,246,233,231,129,0,0,72,185,248,255,255,255,255,127,0,0,72,33,200,246,64,28,1,116,223,72,137,248,195,72,133,255,116,118,137,248,131,224,1,72,133,192,117,108,72,139,7,72,185,248,255,255,255,255,127,0,0,72,33,193,72,139,81,32,246,194,4,116,84,168,1,116,114,72,185,0,0,0,0,0,0,128,0,72,186,0,0,0,0,0,0,0,1,72,57,200,114,54,72,137,198,72,41,214,114,23,240,72,15,177,55,116,34,168,1,117,232,49,246,186,1,0,0,0,233,134,207,1,0,72,133,200,117,61,72,139,53,8,195,141,65,255,37,202,98,230,63,72,57,206,114,238,195,102,131,121],"offset":96}},"threadState":{"r13":{"value":140250395321280},"rax":{"value":3458773279473104953},"rflags":{"value":66050},"cpu":{"value":0},"r14":{"value":328},"rsi":{"value":2183946351},"r8":{"value":123},"cr2":{"value":8765652564056},"rdx":{"value":140250395321960},"r10":{"value":140250338820096},"r9":{"value":0},"r15":{"value":18446744069414584320},"rbx":{"value":140250395321296},"trap":{"value":14,"description":"(no mapping for user data read)"},"err":{"value":4},"r11":{"value":140250339335696},"rip":{"value":140703256333871,"matchesCrashFrame":1},"rbp":{"value":123145419740064},"rsp":{"value":123145419740040},"r12":{"value":4294967296},"rcx":{"value":8765652564024},"flavor":"x86_THREAD_STATE","rdi":{"value":140250440709792}},"queue":"com.apple.network.connections","frames":[{"imageOffset":40495,"symbol":"objc_release","symbolLocation":31,"imageIndex":9},{"imageOffset":141579,"imageIndex":10},{"imageOffset":1364038,"symbol":"_CFRelease","symbolLocation":244,"imageIndex":1},{"imageOffset":139063,"imageIndex":10},{"imageOffset":5716,"symbol":"_Block_release","symbolLocation":130,"imageIndex":11},{"imageOffset":1616309,"imageIndex":10},{"imageOffset":1609671,"imageIndex":10},{"imageOffset":5716,"symbol":"_Block_release","symbolLocation":130,"imageIndex":11},{"imageOffset":3076617,"symbol":"nw_proxy_deallocate_options","symbolLocation":25,"imageIndex":12},{"imageOffset":125084,"symbol":"-[NWConcrete_nw_protocol_options dealloc]","symbolLocation":44,"imageIndex":12},{"imageOffset":7741266,"symbol":"nw_array_dispose","symbolLocation":466,"imageIndex":12},{"imageOffset":126129,"symbol":"-[OS_nw_array dealloc]","symbolLocation":17,"imageIndex":12},{"imageOffset":120163,"symbol":"-[NWConcrete_nw_parameters .cxx_destruct]","symbolLocation":83,"imageIndex":12},{"imageOffset":71494,"symbol":"object_cxxDestructFromClass(objc_object*, objc_class*)","symbolLocation":83,"imageIndex":9},{"imageOffset":40838,"symbol":"objc_destructInstance","symbolLocation":94,"imageIndex":9},{"imageOffset":40733,"symbol":"_objc_rootDealloc","symbolLocation":62,"imageIndex":9},{"imageOffset":119453,"symbol":"-[NWConcrete_nw_parameters dealloc]","symbolLocation":93,"imageIndex":12},{"imageOffset":71494,"symbol":"object_cxxDestructFromClass(objc_object*, objc_class*)","symbolLocation":83,"imageIndex":9},{"imageOffset":40838,"symbol":"objc_destructInstance","symbolLocation":94,"imageIndex":9},{"imageOffset":40733,"symbol":"_objc_rootDealloc","symbolLocation":62,"imageIndex":9},{"imageOffset":1481655,"symbol":"-[NWConcrete_nw_path_evaluator dealloc]","symbolLocation":1111,"imageIndex":12},{"imageOffset":1489034,"symbol":"__nw_association_schedule_deactivation_block_invoke","symbolLocation":1322,"imageIndex":12},{"imageOffset":13079,"symbol":"_dispatch_client_callout","symbolLocation":8,"imageIndex":13},{"imageOffset":23932,"symbol":"_dispatch_continuation_pop","symbolLocation":453,"imageIndex":13},{"imageOffset":94728,"symbol":"_dispatch_source_invoke","symbolLocation":2179,"imageIndex":13},{"imageOffset":45302,"symbol":"_dispatch_workloop_invoke","symbolLocation":1987,"imageIndex":13},{"imageOffset":81646,"symbol":"_dispatch_workloop_worker_thread","symbolLocation":753,"imageIndex":13},{"imageOffset":12240,"symbol":"_pthread_wqthread","symbolLocation":326,"imageIndex":7},{"imageOffset":8023,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":7}]},{"id":61127,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":2394468,"imageIndex":10},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":14},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61146,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15249801,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15290543,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15292164,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15253051,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15290280,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15145590,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15149791,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15088226,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15088311,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":15},{"imageOffset":15087914,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15139469,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15113140,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15066222,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15079572,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15033378,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15033452,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":16},{"imageOffset":15033289,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15062255,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14676488,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14678362,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14703667,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15293183,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15304303,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15304489,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61147,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15249801,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15290543,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15292164,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15253051,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15290280,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15145590,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15149791,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15088226,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15088311,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":15},{"imageOffset":15087914,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15139469,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15113140,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15066222,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15079572,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15033378,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15033452,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":16},{"imageOffset":15033289,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15062255,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14676488,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14678362,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14703667,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15293183,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15304303,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15304489,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61148,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15249801,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15290543,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15292164,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15253051,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15290280,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15145590,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15149791,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15088035,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":467},{"imageOffset":15139469,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15113140,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15066222,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15079572,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15033378,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15033452,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":16},{"imageOffset":15033289,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15062255,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14676488,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14678362,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14703667,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15293183,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15304303,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15304489,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61149,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15249801,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15290543,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15292164,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15253051,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15290280,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15145590,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15149791,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15088035,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":467},{"imageOffset":15139469,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15113140,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15066222,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15079572,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15033378,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15033452,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":16},{"imageOffset":15033289,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15062255,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14676488,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14678362,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14703667,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15293183,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15304303,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15304489,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61150,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14713087,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14716878,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15293183,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15304303,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15304489,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61151,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14713087,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14716878,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15293183,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15304303,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15304489,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61152,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14713087,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14716878,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15293183,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15304303,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15304489,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61153,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":13},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":13},{"imageOffset":14713087,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14716878,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15293183,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15304303,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15304489,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61292,"name":"core","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":673217,"symbol":"mp_dispatch_queue_process","symbolLocation":369,"imageIndex":8},{"imageOffset":917272,"symbol":"mp_wait_events","symbolLocation":88,"imageIndex":8},{"imageOffset":930187,"symbol":"mp_idle","symbolLocation":91,"imageIndex":8},{"imageOffset":930296,"symbol":"idle_loop","symbolLocation":40,"imageIndex":8},{"imageOffset":892632,"symbol":"mp_play_files","symbolLocation":360,"imageIndex":8},{"imageOffset":782894,"symbol":"core_thread","symbolLocation":62,"imageIndex":8},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61297,"name":"*\/ytdl_hook","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":8},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":8},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":8},{"imageOffset":24086,"imageIndex":17}]},{"id":61298,"name":"*\/stats","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":8},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":8},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":8},{"imageOffset":24086,"imageIndex":17}]},{"id":61299,"name":"*\/console","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":8},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":8},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":8},{"imageOffset":24086,"imageIndex":17}]},{"id":61300,"name":"*\/auto_profiles","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":8},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":8},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":8},{"imageOffset":24086,"imageIndex":17}]},{"id":61303,"name":"worker","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":685181,"symbol":"worker_thread","symbolLocation":173,"imageIndex":8},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61339,"name":"AMCP Logging Spool","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":107238,"symbol":"caulk::mach::semaphore::wait_or_error()","symbolLocation":16,"imageIndex":18},{"imageOffset":8520,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":36,"imageIndex":18},{"imageOffset":7692,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*)","symbolLocation":41,"imageIndex":18},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":61408,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":61491,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":61492,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":61584,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":61585,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703257563136,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703258107904,
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
    "base" : 140703405965312,
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
    "base" : 140703302664192,
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
    "base" : 140707743219712,
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
    "base" : 4349415424,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 32784384,
    "uuid" : "9afc016a-8973-3667-a32e-3510292e4b2b",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4680585216,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703257792512,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4446281728,
    "size" : 2883584,
    "uuid" : "e355e4d8-dcc6-3439-90d2-abf0776cc6ac",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libmpv.2.dylib",
    "name" : "libmpv.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703256293376,
    "size" : 241664,
    "uuid" : "b36a2b52-68a9-3e44-b927-71c24be1272f",
    "path" : "\/usr\/lib\/libobjc.A.dylib",
    "name" : "libobjc.A.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703336112128,
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
    "base" : 140703254867968,
    "size" : 8192,
    "uuid" : "f44f0d7c-74fd-37fd-8267-8d3aec7e7fb8",
    "path" : "\/usr\/lib\/system\/libsystem_blocks.dylib",
    "name" : "libsystem_blocks.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703325687808,
    "size" : 10424320,
    "uuid" : "bab2b20a-67af-312c-9b68-f98e1930218e",
    "path" : "\/usr\/lib\/libnetwork.dylib",
    "name" : "libnetwork.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703256002560,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703273299968,
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
    "base" : 140703480893440,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703609909248,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4471021568,
    "size" : 425984,
    "uuid" : "790d1386-66cf-39c0-ab74-e7b60abbd7c9",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libluajit-5.1.2.dylib",
    "name" : "libluajit-5.1.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703403479040,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.audio.caulk",
    "size" : 139264,
    "uuid" : "f04b5c91-d0ec-33c6-8a81-b80a3ebf827f",
    "path" : "\/System\/Library\/PrivateFrameworks\/caulk.framework\/Versions\/A\/caulk",
    "name" : "caulk"
  },
  {
    "size" : 0,
    "source" : "A",
    "base" : 0,
    "uuid" : "00000000-0000-0000-0000-000000000000"
  }
],
  "sharedCache" : {
  "base" : 140703254532096,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=280.3M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=280.3M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               384K        3 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                            80K        9 \nCG raster data                     280K       20 \nColorSync                          232K       28 \nCoreAnimation                     1160K       68 \nCoreGraphics                        12K        2 \nCoreUI image data                 1764K       12 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nIOKit                             7940K        1 \nImage IO                          1084K        5 \nKernel Alloc Once                    8K        1 \nMALLOC                           162.4M      191 \nMALLOC guard page                   48K       11 \nMALLOC_LARGE (reserved)            384K        1         reserved VM address space (unallocated)\nOpenGL GLSL                        384K        5 \nSQLite page cache                 1344K       21 \nSTACK GUARD                       56.1M       27 \nStack                             21.2M       27 \nVM_ALLOCATE                       13.7M       47 \n__CTF                               756        1 \n__DATA                            55.4M      617 \n__DATA_CONST                      33.9M      422 \n__DATA_DIRTY                      1676K      209 \n__FONT_DATA                          4K        1 \n__GLSLBUILTINS                    5176K        1 \n__LINKEDIT                       708.0M       85 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           594.5M      621 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      342.1M       37 \nshared memory                     9992K       23 \n===========                     =======  ======= \nTOTAL                              2.1G     2550 \nTOTAL, minus reserved VM space     2.1G     2550 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.network.connections"
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
