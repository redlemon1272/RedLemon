-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [5121]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [4831]
Responsible:           Electron [519]
User ID:               501

Date/Time:             2025-11-17 10:10:45.0176 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA


Time Awake Since Boot: 1400 seconds

System Integrity Protection: enabled

Crashed Thread:        1  Dispatch queue: com.apple.root.default-qos.cooperative

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_INVALID_ADDRESS at 0x000000000000001c
Exception Codes:       0x0000000000000001, 0x000000000000001c
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 11 Segmentation fault: 11
Terminating Process:   exc handler [5121]

VM Region Info: 0x1c is not in any region.  Bytes before following region: 140737487405028
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      UNUSED SPACE AT START
--->
      VM_ALLOCATE              7ffffff18000-7ffffff19000 [    4K] r-x/r-x SM=ALI

Thread 0::  Dispatch queue: com.apple.main-thread
0   libsystem_kernel.dylib        	    0x7ff81a6d193a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff81a6d1ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81a7d529d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81a7d3928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81a7d2d6c CFRunLoopRunSpecific + 562
5   HIToolbox                     	    0x7ff8234855e6 RunCurrentEventLoopInMode + 292
6   HIToolbox                     	    0x7ff82348534a ReceiveNextEventCommon + 594
7   HIToolbox                     	    0x7ff8234850e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
8   AppKit                        	    0x7ff81d211aa9 _DPSNextEvent + 927
9   AppKit                        	    0x7ff81d210166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
10  AppKit                        	    0x7ff81d202818 -[NSApplication run] + 586
11  AppKit                        	    0x7ff81d1d679a NSApplicationMain + 817
12  SwiftUI                       	    0x7ff925d2709c specialized runApp(_:) + 161
13  SwiftUI                       	    0x7ff926789424 runApp<A>(_:) + 164
14  SwiftUI                       	    0x7ff926281c5f static App.main() + 63
15  RedLemon                      	       0x1072f6cc3 static RedLemonApp.$main() + 35 (RedLemonApp.swift:30)
16  RedLemon                      	       0x1072f6d49 RedLemon_main + 9
17  dyld                          	       0x11721252e start + 462

Thread 1 Crashed::  Dispatch queue: com.apple.root.default-qos.cooperative
0   libobjc.A.dylib               	    0x7ff81a5c156a objc_opt_respondsToSelector + 27
1   Foundation                    	    0x7ff81b5ddee5 _NSDescriptionWithStringProxyFunc + 41
2   CoreFoundation                	    0x7ff81a78619b __CFStringAppendFormatCore + 9471
3   CoreFoundation                	    0x7ff81a8b6374 _CFStringCreateWithFormatAndArgumentsReturningMetadata + 162
4   CoreFoundation                	    0x7ff81a783c8c _CFStringCreateWithFormatAndArgumentsAux2 + 21
5   libsystem_trace.dylib         	    0x7ff81a4888ad _os_log_impl_dynamic + 221
6   libsystem_trace.dylib         	    0x7ff81a48459f _os_log_with_args_impl + 512
7   CoreFoundation                	    0x7ff81a7e702f _CFLogvEx3 + 185
8   Foundation                    	    0x7ff81b6f2908 _NSLogv + 97
9   libswiftFoundation.dylib      	    0x7ff82bf9f3fb NSLog(_:_:) + 363
10  RedLemon                      	       0x10788f582 RealDebridClient.selectEpisodeFile(files:season:episode:) + 11042 (RealDebridClient.swift:378)
11  RedLemon                      	       0x10787ae2e (7) suspend resume partial function for RealDebridClient._rdUnlock(infoHash:fileIdx:token:maxPolls:season:episode:) + 1870 (RealDebridClient.swift:176)
12  RedLemon                      	       0x107875a01 (1) await resume partial function for closure #2 in RealDebridClient.unlock(infoHash:fileIdx:token:maxPolls:season:episode:) + 1 (RealDebridClient.swift:94)
13  RedLemon                      	       0x107875dd1 (1) await resume partial function for partial apply for closure #2 in RealDebridClient.unlock(infoHash:fileIdx:token:maxPolls:season:episode:) + 1

Thread 2:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff81a6d193a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff81a6d1ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81a7d529d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81a7d3928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81a7d2d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff81d37f572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff81a70e4e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff81a709f6b thread_start + 15

Thread 3:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff81a6d193a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff81a6d1ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81a7d529d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81a7d3928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81a7d2d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff81f401964 0x7ff81f1b9000 + 2394468
6   Foundation                    	    0x7ff81b62a724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff81a70e4e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff81a709f6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff81a6d630e kevent + 10
1   RedLemon                      	       0x1070bfac9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x1070c99ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x1070ca044 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x1070c077b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x1070c98e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x1070a63b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x1070a741f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x1070983a2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x1070983f7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff827ce772c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10709826a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x1070a4bcd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10709e4f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x107092dae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x1070961d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10708ad62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10708adac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82f6d6e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10708ad09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x107091e2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107033b48 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10703429a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10703a573 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x1070ca43f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x1070ccfaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x1070cd069 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81a70e4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81a709f6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff81a6d630e kevent + 10
1   RedLemon                      	       0x1070bfac9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x1070c99ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x1070ca044 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x1070c077b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x1070c98e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x1070a63b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x1070a741f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x1070983a2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x1070983f7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff827ce772c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10709826a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x1070a4bcd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10709e4f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x107092dae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x1070961d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10708ad62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10708adac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82f6d6e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10708ad09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x107091e2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107033b48 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10703429a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10703a573 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x1070ca43f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x1070ccfaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x1070cd069 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81a70e4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81a709f6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff81a6d630e kevent + 10
1   RedLemon                      	       0x1070bfac9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x1070c99ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x1070ca044 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x1070c077b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x1070c98e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x1070a63b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x1070a741f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x1070983a2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x1070983f7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff827ce772c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10709826a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x1070a4bcd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10709e4f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x107092dae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x1070961d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10708ad62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10708adac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82f6d6e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10708ad09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x107091e2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107033b48 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10703429a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10703a573 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x1070ca43f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x1070ccfaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x1070cd069 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81a70e4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81a709f6b thread_start + 15

Thread 7:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff81a6d630e kevent + 10
1   RedLemon                      	       0x1070bfac9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x1070c99ef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x1070ca044 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x1070c077b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x1070c98e8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x1070a63b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x1070a741f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x1070982e3 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x1070a4bcd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10709e4f4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x107092dae closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x1070961d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10708ad62 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10708adac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82f6d6e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10708ad09 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x107091e2f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x107033b48 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10703429a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10703a573 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x1070ca43f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x1070ccfaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x1070cd069 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff81a70e4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff81a709f6b thread_start + 15

Thread 8:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff81a6d1976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81a5567ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81a556c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10703ca3f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10703d90e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x1070ca43f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x1070ccfaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x1070cd069 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81a70e4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a709f6b thread_start + 15

Thread 9:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff81a6d1976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81a5567ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81a556c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10703ca3f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10703d90e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x1070ca43f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x1070ccfaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x1070cd069 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81a70e4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a709f6b thread_start + 15

Thread 10:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff81a6d1976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81a5567ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81a556c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10703ca3f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10703d90e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x1070ca43f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x1070ccfaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x1070cd069 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81a70e4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a709f6b thread_start + 15

Thread 11:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff81a6d1976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81a5567ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81a556c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10703ca3f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10703d90e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x1070ca43f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x1070ccfaf closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x1070cd069 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81a70e4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a709f6b thread_start + 15

Thread 12::  Dispatch queue: com.apple.CFNetwork.CacheDB-write
0   libsystem_kernel.dylib        	    0x7ff81a6d449a guarded_pwrite_np + 10
1   libsqlite3.dylib              	    0x7ff820beccb2 seekAndWrite + 162
2   libsqlite3.dylib              	    0x7ff820b9a0d1 unixWrite + 161
3   libsqlite3.dylib              	    0x7ff820bf5402 pagerWalFrames + 2018
4   libsqlite3.dylib              	    0x7ff820b998e0 sqlite3PagerCommitPhaseOne + 416
5   libsqlite3.dylib              	    0x7ff820b81b5d sqlite3BtreeCommitPhaseOne + 125
6   libsqlite3.dylib              	    0x7ff820b45b7b sqlite3VdbeHalt + 2283
7   libsqlite3.dylib              	    0x7ff820b7af99 sqlite3VdbeExec + 63193
8   libsqlite3.dylib              	    0x7ff820b6ac70 sqlite3_step + 1808
9   libsqlite3.dylib              	    0x7ff820b242b9 sqlite3_exec + 265
10  CFNetwork                     	    0x7ff81f3776c1 0x7ff81f1b9000 + 1828545
11  CFNetwork                     	    0x7ff81f2cbb79 0x7ff81f1b9000 + 1125241
12  libdispatch.dylib             	    0x7ff81a5633c0 _dispatch_block_async_invoke2 + 83
13  libdispatch.dylib             	    0x7ff81a556317 _dispatch_client_callout + 8
14  libdispatch.dylib             	    0x7ff81a55c317 _dispatch_lane_serial_drain + 672
15  libdispatch.dylib             	    0x7ff81a55ce30 _dispatch_lane_invoke + 417
16  libdispatch.dylib             	    0x7ff81a566eee _dispatch_workloop_worker_thread + 753
17  libsystem_pthread.dylib       	    0x7ff81a70afd0 _pthread_wqthread + 326
18  libsystem_pthread.dylib       	    0x7ff81a709f57 start_wqthread + 15

Thread 13:
0   libsystem_pthread.dylib       	    0x7ff81a709f48 start_wqthread + 0

Thread 14:
0   libsystem_pthread.dylib       	    0x7ff81a709f48 start_wqthread + 0

Thread 15:
0   libsystem_pthread.dylib       	    0x7ff81a709f48 start_wqthread + 0

Thread 16:
0   libsystem_pthread.dylib       	    0x7ff81a709f48 start_wqthread + 0

Thread 17:
0   libsystem_pthread.dylib       	    0x7ff81a709f48 start_wqthread + 0

Thread 18:
0   libsystem_pthread.dylib       	    0x7ff81a709f48 start_wqthread + 0

Thread 19:
0   libsystem_pthread.dylib       	    0x7ff81a709f48 start_wqthread + 0


Thread 1 crashed with X86 Thread State (64-bit):
  rax: 0x00007ff834b77753  rbx: 0x000070000ba2c010  rcx: 0x00007ff85be3b298  rdx: 0x0000000000000000
  rdi: 0x0000000000000007  rsi: 0x00007ff834b77753  rbp: 0x000070000ba2bd80  rsp: 0x000070000ba2bd48
   r8: 0x000070000ba2c010   r9: 0x0000000000000000  r10: 0x00000000000000f0  r11: 0x00000f8b975bdf16
  r12: 0x0000000000000000  r13: 0x0000000000000007  r14: 0x00007ff85d424b30  r15: 0x00007f8ba2f81aa0
  rip: 0x00007ff81a5c156a  rfl: 0x0000000000010293  cr2: 0x000000000000001c

Logical CPU:     2
Error Code:      0x00000004 (no mapping for user data read)
Trap Number:     14

Thread 1 instruction stream:
  1c 66 85 c9 79 15 0f ba-e1 0e 73 1d e8 e5 50 fe  .f..y.....s...P.
  ff 48 89 c7 48 8d 05 6b-ec 8b 41 48 8b 30 5d ff  .H..H..k..AH.0].
  25 21 8c e4 3f 31 ff eb-f2 48 8b 35 be eb 8b 41  %!..?1...H.5...A
  ff 15 10 8c e4 3f eb d9-90 90 90 90 90 90 90 90  .....?..........
  90 90 90 90 90 48 85 ff-74 25 48 89 f0 40 f6 c7  .....H..t%H..@..
  01 75 1f 48 ba f8 ff ff-ff ff 7f 00 00 48 23 17  .u.H.........H#.
 [66]83 7a 1c 00 79 40 48-89 c6 e9 6b 62 fe ff 31  f.z..y@H...kb..1	<==
  c0 c3 89 f9 83 e1 0f 48-8d 15 38 9e 87 41 48 8b  .......H..8..AH.
  14 ca 48 8d 0d 05 9d 87-41 48 39 ca 75 d2 48 89  ..H.....AH9.u.H.
  f9 48 d1 e9 81 e1 f8 07-00 00 48 8d 15 95 9e 87  .H........H.....
  41 48 8b 14 0a eb b9 48-8b 35 a8 eb 8b 41 48 89  AH.....H.5...AH.
  c2 ff 25 8f 8b e4 3f 55-48 89 e5 48 8d 3d b4 e2  ..%...?UH..H.=..

Binary Images:
    0x7ff81a6d0000 -     0x7ff81a707fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff81a755000 -     0x7ff81ac57fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff823457000 -     0x7ff82374afff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff81d1d3000 -     0x7ff81e062fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff925cab000 -     0x7ff926b4afff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x106238000 -        0x107e83fff com.redlemon.app (1.0.14) <0c60e64e-c283-3da0-8922-b02d7ac57b1d> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x11720d000 -        0x117278fff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff81a59a000 -     0x7ff81a5d4fff libobjc.A.dylib (*) <b36a2b52-68a9-3e44-b927-71c24be1272f> /usr/lib/libobjc.A.dylib
    0x7ff81b5d2000 -     0x7ff81b98efff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff81a47c000 -     0x7ff81a494fff libsystem_trace.dylib (*) <707e7930-370d-393f-aeb0-949e48a6e19c> /usr/lib/system/libsystem_trace.dylib
    0x7ff82bf06000 -     0x7ff82c253fff libswiftFoundation.dylib (*) <1f21009f-9aa8-36c0-9abe-87db68540481> /usr/lib/swift/libswiftFoundation.dylib
    0x7ff81a708000 -     0x7ff81a713fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff81f1b9000 -     0x7ff81f647fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff827bcc000 -     0x7ff828045fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff82f6d6000 -     0x7ff82f6d7fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff81a553000 -     0x7ff81a599fff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff820b1a000 -     0x7ff820ce5fff libsqlite3.dylib (*) <1c02a98a-18ab-3282-87a8-3264836b6e64> /usr/lib/libsqlite3.dylib
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
Writable regions: Total=211.3M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=211.3M(100%)

                                VIRTUAL   REGION
REGION TYPE                        SIZE    COUNT (non-coalesced)
===========                     =======  =======
Accelerate framework               512K        4
Activity Tracing                   256K        1
CG backing stores                 1920K        4
CG image                            88K        6
CG raster data                     108K       10
ColorSync                          224K       27
CoreAnimation                      560K       27
CoreGraphics                        12K        2
CoreServices                       180K        1
CoreUI image data                  824K        6
Dispatch continuations            32.0M        1
Foundation                          16K        1
Image IO                          2028K       10
Kernel Alloc Once                    8K        1
MALLOC                            98.9M      110
MALLOC guard page                   48K       11
SQLite page cache                 1536K       24
STACK GUARD                       56.1M       20
Stack                             17.6M       21
VM_ALLOCATE                       12.1M       15
__CTF                               756        1
__DATA                            54.9M      598
__DATA_CONST                      33.2M      408
__DATA_DIRTY                      1650K      202
__FONT_DATA                          4K        1
__LINKEDIT                       702.2M       83
__OBJC_RO                         82.9M        1
__OBJC_RW                         3200K        2
__TEXT                           580.5M      607
__UNICODE                          592K        1
dyld private memory               1024K        3
libnetwork                        13.6M       40
mapped file                      408.3M       33
shared memory                     9988K       22
===========                     =======  =======
TOTAL                              2.1G     2304



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-11-17 10:11:03.00 -0500","app_version":"1.0.14","slice_uuid":"0c60e64e-c283-3da0-8922-b02d7ac57b1d","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"6DC382FC-B57D-4D18-BD78-9502084CABEC","name":"RedLemon"}
{
  "uptime" : 1400,
  "procLaunch" : "2025-11-17 10:10:10.4626 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 1368677284234,
  "coalitionID" : 624,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-11-17 10:10:45.0176 -0500",
  "incident" : "6DC382FC-B57D-4D18-BD78-9502084CABEC",
  "bug_type" : "309",
  "pid" : 5121,
  "procExitAbsTime" : 1403007136509,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 4831,
  "coalitionName" : "com.microsoft.VSCode",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 519,
  "responsibleProc" : "Electron",
  "sip" : "enabled",
  "vmRegionInfo" : "0x1c is not in any region.  Bytes before following region: 140737487405028\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      UNUSED SPACE AT START\n--->  \n      VM_ALLOCATE              7ffffff18000-7ffffff19000 [    4K] r-x\/r-x SM=ALI  ",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x000000000000001c","rawCodes":[1,28],"type":"EXC_BAD_ACCESS","signal":"SIGSEGV","subtype":"KERN_INVALID_ADDRESS at 0x000000000000001c"},
  "termination" : {"flags":0,"code":11,"namespace":"SIGNAL","indicator":"Segmentation fault: 11","byProc":"exc handler","byPid":5121},
  "vmregioninfo" : "0x1c is not in any region.  Bytes before following region: 140737487405028\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      UNUSED SPACE AT START\n--->  \n      VM_ALLOCATE              7ffffff18000-7ffffff19000 [    4K] r-x\/r-x SM=ALI  ",
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 1,
  "threads" : [{"id":25654,"queue":"com.apple.main-thread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":2},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":2},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":2},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":3},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":3},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":3},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":3},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":4},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":4},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":4},{"imageOffset":17558723,"sourceLine":30,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":5,"symbolLocation":35},{"imageOffset":17558857,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":5},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":6}]},{"triggered":true,"id":25668,"instructionState":{"instructionStream":{"bytes":[28,102,133,201,121,21,15,186,225,14,115,29,232,229,80,254,255,72,137,199,72,141,5,107,236,139,65,72,139,48,93,255,37,33,140,228,63,49,255,235,242,72,139,53,190,235,139,65,255,21,16,140,228,63,235,217,144,144,144,144,144,144,144,144,144,144,144,144,144,72,133,255,116,37,72,137,240,64,246,199,1,117,31,72,186,248,255,255,255,255,127,0,0,72,35,23,102,131,122,28,0,121,64,72,137,198,233,107,98,254,255,49,192,195,137,249,131,225,15,72,141,21,56,158,135,65,72,139,20,202,72,141,13,5,157,135,65,72,57,202,117,210,72,137,249,72,209,233,129,225,248,7,0,0,72,141,21,149,158,135,65,72,139,20,10,235,185,72,139,53,168,235,139,65,72,137,194,255,37,143,139,228,63,85,72,137,229,72,141,61,180,226],"offset":96}},"threadState":{"r13":{"value":7},"rax":{"value":140704013055827,"objc-selector":"_dynamicContextEvaluation:patternString:"},"rflags":{"value":66195},"cpu":{"value":2},"r14":{"value":140704693242672},"rsi":{"value":140704013055827,"objc-selector":"_dynamicContextEvaluation:patternString:"},"r8":{"value":123145497526288},"cr2":{"value":28},"rdx":{"value":0},"r10":{"value":240},"r9":{"value":0},"r15":{"value":140237711350432},"rbx":{"value":123145497526288},"trap":{"value":14,"description":"(no mapping for user data read)"},"err":{"value":4},"r11":{"value":17092214251286},"rip":{"value":140703570859370,"matchesCrashFrame":1},"rbp":{"value":123145497525632},"rsp":{"value":123145497525576},"r12":{"value":0},"rcx":{"value":140704670266008,"symbolLocation":0,"symbol":"OBJC_CLASS_$___NSUnrecognizedTaggedPointer"},"flavor":"x86_THREAD_STATE","rdi":{"value":7}},"queue":"com.apple.root.default-qos.cooperative","frames":[{"imageOffset":161130,"symbol":"objc_opt_respondsToSelector","symbolLocation":27,"imageIndex":7},{"imageOffset":48869,"symbol":"_NSDescriptionWithStringProxyFunc","symbolLocation":41,"imageIndex":8},{"imageOffset":201115,"symbol":"__CFStringAppendFormatCore","symbolLocation":9471,"imageIndex":1},{"imageOffset":1446772,"symbol":"_CFStringCreateWithFormatAndArgumentsReturningMetadata","symbolLocation":162,"imageIndex":1},{"imageOffset":191628,"symbol":"_CFStringCreateWithFormatAndArgumentsAux2","symbolLocation":21,"imageIndex":1},{"imageOffset":51373,"symbol":"_os_log_impl_dynamic","symbolLocation":221,"imageIndex":9},{"imageOffset":34207,"symbol":"_os_log_with_args_impl","symbolLocation":512,"imageIndex":9},{"imageOffset":598063,"symbol":"_CFLogvEx3","symbolLocation":185,"imageIndex":1},{"imageOffset":1181960,"symbol":"_NSLogv","symbolLocation":97,"imageIndex":8},{"imageOffset":627707,"symbol":"NSLog(_:_:)","symbolLocation":363,"imageIndex":10},{"imageOffset":23426434,"sourceLine":378,"sourceFile":"RealDebridClient.swift","symbol":"RealDebridClient.selectEpisodeFile(files:season:episode:)","imageIndex":5,"symbolLocation":11042},{"imageOffset":23342638,"sourceLine":176,"sourceFile":"RealDebridClient.swift","symbol":"(7) suspend resume partial function for RealDebridClient._rdUnlock(infoHash:fileIdx:token:maxPolls:season:episode:)","imageIndex":5,"symbolLocation":1870},{"imageOffset":23321089,"sourceLine":94,"sourceFile":"RealDebridClient.swift","symbol":"(1) await resume partial function for closure #2 in RealDebridClient.unlock(infoHash:fileIdx:token:maxPolls:season:episode:)","imageIndex":5,"symbolLocation":1},{"imageOffset":23322065,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for partial apply for closure #2 in RealDebridClient.unlock(infoHash:fileIdx:token:maxPolls:season:episode:)","symbolLocation":1,"imageIndex":5}]},{"id":25715,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":25750,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":2394468,"imageIndex":12},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":8},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":25772,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15235785,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15276527,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15278148,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15239035,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15276264,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15131574,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15135775,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15074210,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15074295,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":13},{"imageOffset":15073898,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15125453,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15099124,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15052206,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15065556,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15019362,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15019436,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":14},{"imageOffset":15019273,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15048239,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14662472,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14664346,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14689651,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15279167,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15290287,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15290473,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":25773,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15235785,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15276527,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15278148,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15239035,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15276264,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15131574,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15135775,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15074210,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15074295,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":13},{"imageOffset":15073898,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15125453,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15099124,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15052206,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15065556,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15019362,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15019436,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":14},{"imageOffset":15019273,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15048239,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14662472,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14664346,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14689651,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15279167,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15290287,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15290473,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":25774,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15235785,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15276527,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15278148,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15239035,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15276264,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15131574,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15135775,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15074210,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15074295,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":13},{"imageOffset":15073898,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15125453,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15099124,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15052206,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15065556,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15019362,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15019436,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":14},{"imageOffset":15019273,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15048239,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14662472,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14664346,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14689651,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15279167,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15290287,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15290473,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":25775,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15235785,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15276527,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15278148,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15239035,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15276264,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15131574,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15135775,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15074019,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":467},{"imageOffset":15125453,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15099124,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15052206,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15065556,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15019362,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15019436,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":14},{"imageOffset":15019273,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15048239,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14662472,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14664346,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14689651,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15279167,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15290287,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15290473,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":25776,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":15},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":15},{"imageOffset":14699071,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14702862,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15279167,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15290287,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15290473,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":25777,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":15},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":15},{"imageOffset":14699071,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14702862,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15279167,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15290287,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15290473,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":25778,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":15},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":15},{"imageOffset":14699071,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14702862,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15279167,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15290287,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15290473,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":25779,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":15},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":15},{"imageOffset":14699071,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14702862,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15279167,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15290287,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15290473,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":11},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":11}]},{"id":26153,"queue":"com.apple.CFNetwork.CacheDB-write","frames":[{"imageOffset":17562,"symbol":"guarded_pwrite_np","symbolLocation":10,"imageIndex":0},{"imageOffset":863410,"symbol":"seekAndWrite","symbolLocation":162,"imageIndex":16},{"imageOffset":524497,"symbol":"unixWrite","symbolLocation":161,"imageIndex":16},{"imageOffset":898050,"symbol":"pagerWalFrames","symbolLocation":2018,"imageIndex":16},{"imageOffset":522464,"symbol":"sqlite3PagerCommitPhaseOne","symbolLocation":416,"imageIndex":16},{"imageOffset":424797,"symbol":"sqlite3BtreeCommitPhaseOne","symbolLocation":125,"imageIndex":16},{"imageOffset":179067,"symbol":"sqlite3VdbeHalt","symbolLocation":2283,"imageIndex":16},{"imageOffset":397209,"symbol":"sqlite3VdbeExec","symbolLocation":63193,"imageIndex":16},{"imageOffset":330864,"symbol":"sqlite3_step","symbolLocation":1808,"imageIndex":16},{"imageOffset":41657,"symbol":"sqlite3_exec","symbolLocation":265,"imageIndex":16},{"imageOffset":1828545,"imageIndex":12},{"imageOffset":1125241,"imageIndex":12},{"imageOffset":66496,"symbol":"_dispatch_block_async_invoke2","symbolLocation":83,"imageIndex":15},{"imageOffset":13079,"symbol":"_dispatch_client_callout","symbolLocation":8,"imageIndex":15},{"imageOffset":37655,"symbol":"_dispatch_lane_serial_drain","symbolLocation":672,"imageIndex":15},{"imageOffset":40496,"symbol":"_dispatch_lane_invoke","symbolLocation":417,"imageIndex":15},{"imageOffset":81646,"symbol":"_dispatch_workloop_worker_thread","symbolLocation":753,"imageIndex":15},{"imageOffset":12240,"symbol":"_pthread_wqthread","symbolLocation":326,"imageIndex":11},{"imageOffset":8023,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":11}]},{"id":26154,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]},{"id":26245,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]},{"id":26309,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]},{"id":26539,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]},{"id":26540,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]},{"id":26541,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]},{"id":26542,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":11}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703571968000,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703572512768,
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
    "base" : 140703720370176,
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
    "base" : 140703617069056,
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
    "base" : 140708057624576,
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
    "base" : 4397957120,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 29671424,
    "uuid" : "0c60e64e-c283-3da0-8922-b02d7ac57b1d",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4682993664,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703570698240,
    "size" : 241664,
    "uuid" : "b36a2b52-68a9-3e44-b927-71c24be1272f",
    "path" : "\/usr\/lib\/libobjc.A.dylib",
    "name" : "libobjc.A.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703587704832,
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
    "base" : 140703569526784,
    "size" : 102400,
    "uuid" : "707e7930-370d-393f-aeb0-949e48a6e19c",
    "path" : "\/usr\/lib\/system\/libsystem_trace.dylib",
    "name" : "libsystem_trace.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703865790464,
    "size" : 3465216,
    "uuid" : "1f21009f-9aa8-36c0-9abe-87db68540481",
    "path" : "\/usr\/lib\/swift\/libswiftFoundation.dylib",
    "name" : "libswiftFoundation.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703572197376,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703650516992,
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
    "base" : 140703795298304,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703924314112,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703570407424,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703677128704,
    "size" : 1884160,
    "uuid" : "1c02a98a-18ab-3282-87a8-3264836b6e64",
    "path" : "\/usr\/lib\/libsqlite3.dylib",
    "name" : "libsqlite3.dylib"
  },
  {
    "size" : 0,
    "source" : "A",
    "base" : 0,
    "uuid" : "00000000-0000-0000-0000-000000000000"
  }
],
  "sharedCache" : {
  "base" : 140703568936960,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=211.3M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=211.3M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               512K        4 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                            88K        6 \nCG raster data                     108K       10 \nColorSync                          224K       27 \nCoreAnimation                      560K       27 \nCoreGraphics                        12K        2 \nCoreServices                       180K        1 \nCoreUI image data                  824K        6 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nImage IO                          2028K       10 \nKernel Alloc Once                    8K        1 \nMALLOC                            98.9M      110 \nMALLOC guard page                   48K       11 \nSQLite page cache                 1536K       24 \nSTACK GUARD                       56.1M       20 \nStack                             17.6M       21 \nVM_ALLOCATE                       12.1M       15 \n__CTF                               756        1 \n__DATA                            54.9M      598 \n__DATA_CONST                      33.2M      408 \n__DATA_DIRTY                      1650K      202 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       702.2M       83 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           580.5M      607 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      408.3M       33 \nshared memory                     9988K       22 \n===========                     =======  ======= \nTOTAL                              2.1G     2304 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.root.default-qos.cooperative"
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



















