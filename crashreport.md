-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [25336]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [23796]
Responsible:           Terminal [23117]
User ID:               501

Date/Time:             2025-11-27 16:39:57.6906 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        24F646B6-E55A-DF4C-178D-891130B3FBCE

Sleep/Wake UUID:       9B537CC1-0468-44B5-9873-27AC6206ECD6

Time Awake Since Boot: 10000 seconds
Time Since Wake:       10645 seconds

System Integrity Protection: enabled

Crashed Thread:        42  Dispatch queue: com.apple.network.connections

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_INVALID_ADDRESS at 0x00007fc19e3180a8
Exception Codes:       0x0000000000000001, 0x00007fc19e3180a8
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 11 Segmentation fault: 11
Terminating Process:   exc handler [25336]

VM Region Info: 0x7fc19e3180a8 is not in any region.  Bytes after previous region: 17324210372777  Bytes before following region: 8300429144
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      Stack                    700002c1a000-700002c9c000 [  520K] rw-/rwx SM=PRV  thread 49
--->  GAP OF 0xfc38a264000 BYTES
      MALLOC_LARGE             7fc38cf00000-7fc38cf41000 [  260K] rw-/rwx SM=PRV

Thread 0::  Dispatch queue: com.apple.main-thread
0   CoreFoundation                	    0x7ff81a6ea670 __CFStringHash + 170
1   CoreFoundation                	    0x7ff81a727482 CFSetGetValue + 88
2   CoreFoundation                	    0x7ff81a82cb6f __CFRunLoopCopyMode + 174
3   CoreFoundation                	    0x7ff81a77a18b CFRunLoopRemoveTimer + 127
4   CoreFoundation                	    0x7ff81a77a016 CFRunLoopTimerInvalidate + 375
5   HIToolbox                     	    0x7ff8234570c3 __59-[IMKInputSessionXPCInvocation invocationInterruptXPCReply]_block_invoke + 266
6   CoreFoundation                	    0x7ff81a760c41 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 12
7   CoreFoundation                	    0x7ff81a760aec __CFRunLoopDoBlocks + 445
8   CoreFoundation                	    0x7ff81a75fe5d __CFRunLoopRun + 2609
9   CoreFoundation                	    0x7ff81a75ed6c CFRunLoopRunSpecific + 562
10  HIToolbox                     	    0x7ff8234561b3 -[IMKInputSessionXPCInvocation invocationAwaitXPCReply] + 743
11  HIToolbox                     	    0x7ff823457ac7 -[IMKInputSession deactivate] + 1364
12  HIToolbox                     	    0x7ff823457566 IMKInputSessionDeactivate + 36
13  HIToolbox                     	    0x7ff823457532 DeactivateInputMethodInstance + 58
14  HIToolbox                     	    0x7ff823457434 utDeactivateAllSelectedIMInDocIterator + 82
15  CoreFoundation                	    0x7ff81a725d77 CFArrayApplyFunction + 67
16  HIToolbox                     	    0x7ff823430267 utDeactivateAllSelectedIMInDoc + 132
17  HIToolbox                     	    0x7ff82342fc0f MyDeactivateTSMDocument + 364
18  HIToolbox                     	    0x7ff823485297 CallDeferredFullScreenDeactivateTickle + 51
19  CoreFoundation                	    0x7ff81a779e99 __CFRUNLOOP_IS_CALLING_OUT_TO_A_TIMER_CALLBACK_FUNCTION__ + 20
20  CoreFoundation                	    0x7ff81a779988 __CFRunLoopDoTimer + 923
21  CoreFoundation                	    0x7ff81a7794f8 __CFRunLoopDoTimers + 307
22  CoreFoundation                	    0x7ff81a75fc06 __CFRunLoopRun + 2010
23  CoreFoundation                	    0x7ff81a75ed6c CFRunLoopRunSpecific + 562
24  HIToolbox                     	    0x7ff8234115e6 RunCurrentEventLoopInMode + 292
25  HIToolbox                     	    0x7ff82341134a ReceiveNextEventCommon + 594
26  HIToolbox                     	    0x7ff8234110e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
27  AppKit                        	    0x7ff81d19daa9 _DPSNextEvent + 927
28  AppKit                        	    0x7ff81d19c166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
29  AppKit                        	    0x7ff81d18e818 -[NSApplication run] + 586
30  AppKit                        	    0x7ff81d16279a NSApplicationMain + 817
31  SwiftUI                       	    0x7ff925cb309c specialized runApp(_:) + 161
32  SwiftUI                       	    0x7ff926715424 runApp<A>(_:) + 164
33  SwiftUI                       	    0x7ff92620dc5f static App.main() + 63
34  RedLemon                      	       0x10f5b8b73 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
35  RedLemon                      	       0x10f5b8bf9 RedLemon_main + 9
36  dyld                          	       0x11628b52e start + 462

Thread 1:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff81a65d93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff81a65dca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81a76129d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81a75f928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81a75ed6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff81d30b572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 2:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff81a65d93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff81a65dca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81a76129d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81a75f928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81a75ed6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff81f38d964 0x7ff81f145000 + 2394468
6   Foundation                    	    0x7ff81b5b6724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 3:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff81a66230e kevent + 10
1   RedLemon                      	       0x10f391a89 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10f39b9af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10f39c004 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10f39273b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10f39b8a8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10f378376 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10f3793df partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10f36a362 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10f36a3b7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff827c7372c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10f36a22a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10f376b8d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10f3704b4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10f364d6e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10f368194 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10f35cd22 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10f35cd6c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82f662e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10f35ccc9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10f363def SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10f305b08 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10f30625a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10f30c533 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10f39c3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10f39ef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10f39f029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff81a66230e kevent + 10
1   RedLemon                      	       0x10f391a89 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10f39b9af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10f39c004 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10f39273b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10f39b8a8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10f378376 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10f3793df partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10f36a362 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10f36a3b7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff827c7372c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10f36a22a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10f376b8d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10f3704b4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10f364d6e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10f368194 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10f35cd22 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10f35cd6c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82f662e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10f35ccc9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10f363def SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10f305b08 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10f30625a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10f30c533 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10f39c3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10f39ef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10f39f029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff81a66230e kevent + 10
1   RedLemon                      	       0x10f391a89 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10f39b9af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10f39c004 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10f39273b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10f39b8a8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10f378376 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10f3793df partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10f36a362 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10f36a3b7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff827c7372c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10f36a22a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10f376b8d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10f3704b4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10f364d6e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10f368194 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10f35cd22 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10f35cd6c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82f662e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10f35ccc9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10f363def SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10f305b08 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10f30625a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10f30c533 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10f39c3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10f39ef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10f39f029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff81a66230e kevent + 10
1   RedLemon                      	       0x10f391a89 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10f39b9af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10f39c004 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10f39273b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10f39b8a8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10f378376 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10f3793df partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10f36a362 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10f36a3b7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff827c7372c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10f36a22a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10f376b8d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10f3704b4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10f364d6e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10f368194 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10f35cd22 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10f35cd6c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82f662e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10f35ccc9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10f363def SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10f305b08 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10f30625a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10f30c533 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10f39c3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10f39ef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10f39f029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 7:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff81a65d976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81a4e27ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81a4e2c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10f30e9ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10f30f8ce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10f39c3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10f39ef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10f39f029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 8:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff81a65d976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81a4e27ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81a4e2c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10f30e9ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10f30f8ce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10f39c3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10f39ef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10f39f029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 9:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff81a65d976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81a4e27ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81a4e2c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10f30e9ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10f30f8ce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10f39c3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10f39ef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10f39f029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 10:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff81a65d976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81a4e27ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81a4e2c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10f30e9ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10f30f8ce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10f39c3ff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10f39ef6f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10f39f029 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 11:: core
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1141ec5c1 mp_dispatch_queue_process + 369
3   libmpv.2.dylib                	       0x114227f18 mp_wait_events + 88
4   libmpv.2.dylib                	       0x11422b18b mp_idle + 91
5   libmpv.2.dylib                	       0x11422b1f8 idle_loop + 40
6   libmpv.2.dylib                	       0x114221ed8 mp_play_files + 360
7   libmpv.2.dylib                	       0x11420722e core_thread + 62
8   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 12:: */ytdl_hook
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 13:: */stats
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 14:: */console
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 15:: */auto_profiles
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 16:: worker
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1141ef47d worker_thread + 173
3   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
4   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 17:: AMCP Logging Spool
0   libsystem_kernel.dylib        	    0x7ff81a65d976 semaphore_wait_trap + 10
1   caulk                         	    0x7ff82319e2e6 caulk::mach::semaphore::wait_or_error() + 16
2   caulk                         	    0x7ff823186148 caulk::concurrent::details::worker_thread::run() + 36
3   caulk                         	    0x7ff823185e0c void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*) + 41
4   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 18:: core
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1141ec5c1 mp_dispatch_queue_process + 369
3   libmpv.2.dylib                	       0x114227f18 mp_wait_events + 88
4   libmpv.2.dylib                	       0x11422b18b mp_idle + 91
5   libmpv.2.dylib                	       0x11422b1f8 idle_loop + 40
6   libmpv.2.dylib                	       0x114221ed8 mp_play_files + 360
7   libmpv.2.dylib                	       0x11420722e core_thread + 62
8   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 19:: */ytdl_hook
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 20:: */stats
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 21:: */console
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 22:: */auto_profiles
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 23:: worker
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1141ef47d worker_thread + 173
3   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
4   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 24:: core
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1141ec5c1 mp_dispatch_queue_process + 369
3   libmpv.2.dylib                	       0x114227f18 mp_wait_events + 88
4   libmpv.2.dylib                	       0x11422b18b mp_idle + 91
5   libmpv.2.dylib                	       0x11422b1f8 idle_loop + 40
6   libmpv.2.dylib                	       0x114221ed8 mp_play_files + 360
7   libmpv.2.dylib                	       0x11420722e core_thread + 62
8   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 25:: */ytdl_hook
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 26:: */stats
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 27:: */console
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 28:: */auto_profiles
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 29:: worker
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1141ef47d worker_thread + 173
3   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
4   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 30:
0   libsystem_pthread.dylib       	    0x7ff81a695f48 start_wqthread + 0

Thread 31:: core
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1141ec5c1 mp_dispatch_queue_process + 369
3   libmpv.2.dylib                	       0x114227f18 mp_wait_events + 88
4   libmpv.2.dylib                	       0x11422b18b mp_idle + 91
5   libmpv.2.dylib                	       0x11422b1f8 idle_loop + 40
6   libmpv.2.dylib                	       0x114221ed8 mp_play_files + 360
7   libmpv.2.dylib                	       0x11420722e core_thread + 62
8   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 32:: */ytdl_hook
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 33:: */stats
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 34:: */console
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 35:: */auto_profiles
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 36:: worker
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1141ef47d worker_thread + 173
3   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
4   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 37::  Dispatch queue: com.apple.NSXPCConnection.user.endpoint
0   libobjc.A.dylib               	    0x7ff81a54c4c7 _object_remove_associations + 808
1   libobjc.A.dylib               	    0x7ff81a52ff99 objc_destructInstance + 113
2   libdispatch.dylib             	    0x7ff81a4e16cd _dispatch_dispose + 107
3   libdispatch.dylib             	    0x7ff81a4fc5e0 _dispatch_mach_msg_async_reply_invoke + 398
4   libdispatch.dylib             	    0x7ff81a4e81cd _dispatch_lane_serial_drain + 342
5   libdispatch.dylib             	    0x7ff81a4e8e30 _dispatch_lane_invoke + 417
6   libdispatch.dylib             	    0x7ff81a4f2eee _dispatch_workloop_worker_thread + 753
7   libsystem_pthread.dylib       	    0x7ff81a696fd0 _pthread_wqthread + 326
8   libsystem_pthread.dylib       	    0x7ff81a695f57 start_wqthread + 15

Thread 38:
0   libsystem_pthread.dylib       	    0x7ff81a695f48 start_wqthread + 0

Thread 39:
0   libsystem_pthread.dylib       	    0x7ff81a695f48 start_wqthread + 0

Thread 40::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x114206a1f wait_wakeup + 255
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   RedLemon                      	       0x10f9fb603 (3) suspend resume partial function for MPVWrapper.pollEvents() + 259 (MPVWrapper.swift:184)
5   RedLemon                      	       0x10f9f9f21 (2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:) + 1 (MPVWrapper.swift:106)

Thread 41::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x114206a1f wait_wakeup + 255
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   RedLemon                      	       0x10f9fb603 (3) suspend resume partial function for MPVWrapper.pollEvents() + 259 (MPVWrapper.swift:184)
5   RedLemon                      	       0x10f9f9f21 (2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:) + 1 (MPVWrapper.swift:106)

Thread 42 Crashed::  Dispatch queue: com.apple.network.connections
0   libnetwork.dylib              	    0x7ff81ece71bd nw_protocol_implementation_read + 429
1   libnetwork.dylib              	    0x7ff81ecd95a4 nw_protocol_implementation_input_available + 84
2   libnetwork.dylib              	    0x7ff81ec38e0d nw_channel_add_input_frames + 8941
3   libnetwork.dylib              	    0x7ff81ec36a85 nw_channel_update_input_source + 437
4   libnetwork.dylib              	    0x7ff81ec35d06 __nw_channel_create_block_invoke.22 + 86
5   libdispatch.dylib             	    0x7ff81a4e2317 _dispatch_client_callout + 8
6   libdispatch.dylib             	    0x7ff81a4e4d7c _dispatch_continuation_pop + 453
7   libdispatch.dylib             	    0x7ff81a4f6208 _dispatch_source_invoke + 2179
8   libdispatch.dylib             	    0x7ff81a4ea0f6 _dispatch_workloop_invoke + 1987
9   libdispatch.dylib             	    0x7ff81a4f2eee _dispatch_workloop_worker_thread + 753
10  libsystem_pthread.dylib       	    0x7ff81a696fd0 _pthread_wqthread + 326
11  libsystem_pthread.dylib       	    0x7ff81a695f57 start_wqthread + 15

Thread 43:
0   libsystem_pthread.dylib       	    0x7ff81a695f48 start_wqthread + 0

Thread 44:: core
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1141ec63e mp_dispatch_queue_process + 494
3   libmpv.2.dylib                	       0x114227f18 mp_wait_events + 88
4   libmpv.2.dylib                	       0x11422b18b mp_idle + 91
5   libmpv.2.dylib                	       0x11422b1f8 idle_loop + 40
6   libmpv.2.dylib                	       0x114221ed8 mp_play_files + 360
7   libmpv.2.dylib                	       0x11420722e core_thread + 62
8   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 45:: */ytdl_hook
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 46:: */stats
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 47:: */console
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 48:: */auto_profiles
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1142069a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x11429d8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x1158e5e16 0x1158e0000 + 24086

Thread 49:: worker
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1141ef47d worker_thread + 173
3   libsystem_pthread.dylib       	    0x7ff81a69a4e1 _pthread_start + 125
4   libsystem_pthread.dylib       	    0x7ff81a695f6b thread_start + 15

Thread 50::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libsystem_kernel.dylib        	    0x7ff81a6603aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81a69aa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x114206a1f wait_wakeup + 255
3   libmpv.2.dylib                	       0x1142074c8 mpv_wait_event + 584
4   RedLemon                      	       0x10f9fb603 (3) suspend resume partial function for MPVWrapper.pollEvents() + 259 (MPVWrapper.swift:184)
5   RedLemon                      	       0x10f9f9f21 (2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:) + 1 (MPVWrapper.swift:106)


Thread 42 crashed with X86 Thread State (64-bit):
  rax: 0x00007fc19e317f60  rbx: 0x00006000021e3a10  rcx: 0x00007fc39e1b7420  rdx: 0x063dfff85bdc5975
  rdi: 0x00007fc39e1b7210  rsi: 0x00006000021e3a10  rbp: 0x00007000019aa570  rsp: 0x00007000019aa470
   r8: 0x0000000000000000   r9: 0x00000000000003f7  r10: 0x000000012207ef80  r11: 0x000000012283f000
  r12: 0x00007ff81a52d070  r13: 0x00006000021e3a10  r14: 0x00007fc39e1b7210  r15: 0x00007ff81a52fe10
  rip: 0x00007ff81ece71bd  rfl: 0x0000000000010202  cr2: 0x00007fc19e3180a8

Logical CPU:     1
Error Code:      0x00000004 (no mapping for user data read)
Trap Number:     14

Thread 42 instruction stream:
  0b 07 00 00 48 8d 88 10-02 00 00 48 89 4d a0 48  ....H......H.M.H
  05 b2 02 00 00 48 89 45-b8 41 8a 86 b0 02 00 00  .....H.E.A......
  4c 8b 25 bc 70 b4 3b 4c-8b 3d ad 70 b4 3b 4c 89  L.%.p.;L.=.p.;L.
  75 98 eb 17 66 2e 0f 1f-84 00 00 00 00 00 0f 1f  u...f...........
  44 00 00 85 d2 0f 84 96-06 00 00 24 f7 41 88 86  D..........$.A..
  b0 02 00 00 41 80 8e af-02 00 00 08 49 8b 46 08  ....A.......I.F.
 [48]8b 80 48 01 00 00 48-85 c0 74 05 4c 89 f7 ff  H..H...H..t.L...	<==
  d0 48 8b 55 a8 4c 89 f7-4c 89 ee e8 13 0c 00 00  .H.U.L..L.......
  89 45 c8 4c 89 f7 e8 f8-bb fb ff 49 83 be 10 02  .E.L.......I....
  00 00 00 0f 84 7b 04 00-00 41 f6 86 b1 02 00 00  .....{...A......
  20 75 0d 80 3d 92 13 28-3d 00 0f 85 f7 04 00 00   u..=..(=.......
  49 8b be 40 01 00 00 48-8d 0d 01 cc 44 00 48 85  I..@...H....D.H.

Binary Images:
    0x7ff81a6e1000 -     0x7ff81abe3fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff8233e3000 -     0x7ff8236d6fff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff81d15f000 -     0x7ff81dfeefff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff925c37000 -     0x7ff926ad6fff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x10e507000 -        0x110446fff com.redlemon.app (1.0.14) <bb6d423e-bc1a-3e93-8e35-ff3888d8484f> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x116286000 -        0x1162f1fff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff81a65c000 -     0x7ff81a693fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff81a694000 -     0x7ff81a69ffff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff81f145000 -     0x7ff81f5d3fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff81b55e000 -     0x7ff81b91afff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff827b58000 -     0x7ff827fd1fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff82f662000 -     0x7ff82f663fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff81a4df000 -     0x7ff81a525fff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
       0x114148000 -        0x114407fff libmpv.2.dylib (*) <e355e4d8-dcc6-3439-90d2-abf0776cc6ac> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libmpv.2.dylib
       0x1158e0000 -        0x115947fff libluajit-5.1.2.dylib (*) <790d1386-66cf-39c0-ab74-e7b60abbd7c9> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libluajit-5.1.2.dylib
    0x7ff823184000 -     0x7ff8231a5fff com.apple.audio.caulk (1.0) <f04b5c91-d0ec-33c6-8a81-b80a3ebf827f> /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk
    0x7ff81a526000 -     0x7ff81a560fff libobjc.A.dylib (*) <b36a2b52-68a9-3e44-b927-71c24be1272f> /usr/lib/libobjc.A.dylib
    0x7ff81e754000 -     0x7ff81f144fff libnetwork.dylib (*) <bab2b20a-67af-312c-9b68-f98e1930218e> /usr/lib/libnetwork.dylib
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
Writable regions: Total=775.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=775.0M(100%)

                                VIRTUAL   REGION
REGION TYPE                        SIZE    COUNT (non-coalesced)
===========                     =======  =======
Accelerate framework               384K        3
Activity Tracing                   256K        1
CG backing stores                  528K        4
CG image                            52K       10
CG raster data                      24K        2
ColorSync                          228K       27
CoreAnimation                      196K       21
CoreGraphics                        12K        2
CoreUI image data                  496K        8
Foundation                          40K        2
IOKit                             7940K        1
Image IO                           364K        4
Kernel Alloc Once                    8K        1
MALLOC                           284.8M      201
MALLOC guard page                   48K       11
MALLOC_LARGE (reserved)           1920K        5         reserved VM address space (unallocated)
MALLOC_NANO (reserved)           384.0M        1         reserved VM address space (unallocated)
OpenGL GLSL                        384K        5
SQLite page cache                 1152K       18
STACK GUARD                       56.2M       51
Stack                             33.4M       51
VM_ALLOCATE                       19.7M      101
__CTF                               756        1
__DATA                            55.4M      612
__DATA_CONST                      33.9M      423
__DATA_DIRTY                      1676K      209
__FONT_DATA                          4K        1
__GLSLBUILTINS                    5176K        1
__LINKEDIT                       707.9M       85
__OBJC_RO                         82.9M        1
__OBJC_RW                         3200K        2
__TEXT                           594.4M      621
__UNICODE                          592K        1
dyld private memory               1024K        1
libnetwork                        17.9M      104
mapped file                      365.0M       38
shared memory                      9.8M       28
===========                     =======  =======
TOTAL                              2.6G     2658
TOTAL, minus reserved VM space     2.2G     2658



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-11-27 16:40:07.00 -0500","app_version":"1.0.14","slice_uuid":"bb6d423e-bc1a-3e93-8e35-ff3888d8484f","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"62CD8815-5DF5-4ADF-BA0D-C2E337B61F31","name":"RedLemon"}
{
  "uptime" : 10000,
  "procLaunch" : "2025-11-27 16:13:01.5513 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookAir7,1",
  "procStartAbsTime" : 9325958062698,
  "coalitionID" : 2313,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-11-27 16:39:57.6906 -0500",
  "incident" : "62CD8815-5DF5-4ADF-BA0D-C2E337B61F31",
  "bug_type" : "309",
  "pid" : 25336,
  "procExitAbsTime" : 10941926671168,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"DE7DE55C-FAC2-51DA-92D1-22902ED1697D","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 23796,
  "coalitionName" : "com.apple.Terminal",
  "crashReporterKey" : "24F646B6-E55A-DF4C-178D-891130B3FBCE",
  "responsiblePid" : 23117,
  "responsibleProc" : "Terminal",
  "wakeTime" : 10645,
  "sleepWakeUUID" : "9B537CC1-0468-44B5-9873-27AC6206ECD6",
  "sip" : "enabled",
  "vmRegionInfo" : "0x7fc19e3180a8 is not in any region.  Bytes after previous region: 17324210372777  Bytes before following region: 8300429144\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      Stack                    700002c1a000-700002c9c000 [  520K] rw-\/rwx SM=PRV  thread 49\n--->  GAP OF 0xfc38a264000 BYTES\n      MALLOC_LARGE             7fc38cf00000-7fc38cf41000 [  260K] rw-\/rwx SM=PRV  ",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x00007fc19e3180a8","rawCodes":[1,140469559460008],"type":"EXC_BAD_ACCESS","signal":"SIGSEGV","subtype":"KERN_INVALID_ADDRESS at 0x00007fc19e3180a8"},
  "termination" : {"flags":0,"code":11,"namespace":"SIGNAL","indicator":"Segmentation fault: 11","byProc":"exc handler","byPid":25336},
  "vmregioninfo" : "0x7fc19e3180a8 is not in any region.  Bytes after previous region: 17324210372777  Bytes before following region: 8300429144\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      Stack                    700002c1a000-700002c9c000 [  520K] rw-\/rwx SM=PRV  thread 49\n--->  GAP OF 0xfc38a264000 BYTES\n      MALLOC_LARGE             7fc38cf00000-7fc38cf41000 [  260K] rw-\/rwx SM=PRV  ",
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 42,
  "threads" : [{"id":118958,"queue":"com.apple.main-thread","frames":[{"imageOffset":38512,"symbol":"__CFStringHash","symbolLocation":170,"imageIndex":0},{"imageOffset":287874,"symbol":"CFSetGetValue","symbolLocation":88,"imageIndex":0},{"imageOffset":1358703,"symbol":"__CFRunLoopCopyMode","symbolLocation":174,"imageIndex":0},{"imageOffset":627083,"symbol":"CFRunLoopRemoveTimer","symbolLocation":127,"imageIndex":0},{"imageOffset":626710,"symbol":"CFRunLoopTimerInvalidate","symbolLocation":375,"imageIndex":0},{"imageOffset":475331,"symbol":"__59-[IMKInputSessionXPCInvocation invocationInterruptXPCReply]_block_invoke","symbolLocation":266,"imageIndex":1},{"imageOffset":523329,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__","symbolLocation":12,"imageIndex":0},{"imageOffset":522988,"symbol":"__CFRunLoopDoBlocks","symbolLocation":445,"imageIndex":0},{"imageOffset":519773,"symbol":"__CFRunLoopRun","symbolLocation":2609,"imageIndex":0},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":0},{"imageOffset":471475,"symbol":"-[IMKInputSessionXPCInvocation invocationAwaitXPCReply]","symbolLocation":743,"imageIndex":1},{"imageOffset":477895,"symbol":"-[IMKInputSession deactivate]","symbolLocation":1364,"imageIndex":1},{"imageOffset":476518,"symbol":"IMKInputSessionDeactivate","symbolLocation":36,"imageIndex":1},{"imageOffset":476466,"symbol":"DeactivateInputMethodInstance","symbolLocation":58,"imageIndex":1},{"imageOffset":476212,"symbol":"utDeactivateAllSelectedIMInDocIterator","symbolLocation":82,"imageIndex":1},{"imageOffset":281975,"symbol":"CFArrayApplyFunction","symbolLocation":67,"imageIndex":0},{"imageOffset":316007,"symbol":"utDeactivateAllSelectedIMInDoc","symbolLocation":132,"imageIndex":1},{"imageOffset":314383,"symbol":"MyDeactivateTSMDocument","symbolLocation":364,"imageIndex":1},{"imageOffset":664215,"symbol":"CallDeferredFullScreenDeactivateTickle","symbolLocation":51,"imageIndex":1},{"imageOffset":626329,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_A_TIMER_CALLBACK_FUNCTION__","symbolLocation":20,"imageIndex":0},{"imageOffset":625032,"symbol":"__CFRunLoopDoTimer","symbolLocation":923,"imageIndex":0},{"imageOffset":623864,"symbol":"__CFRunLoopDoTimers","symbolLocation":307,"imageIndex":0},{"imageOffset":519174,"symbol":"__CFRunLoopRun","symbolLocation":2010,"imageIndex":0},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":0},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":1},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":1},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":1},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":2},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":2},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":2},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":2},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":3},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":3},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":3},{"imageOffset":17505139,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":4,"symbolLocation":35},{"imageOffset":17505273,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":4},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":5}]},{"id":119031,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":6},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":0},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":0},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":0},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119057,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":6},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":0},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":0},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":0},{"imageOffset":2394468,"imageIndex":8},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":9},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119058,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":6},{"imageOffset":15248009,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":4},{"imageOffset":15288751,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":95},{"imageOffset":15290372,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":4},{"imageOffset":15251259,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":4,"symbolLocation":395},{"imageOffset":15288488,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":312},{"imageOffset":15143798,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":230},{"imageOffset":15147999,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":4},{"imageOffset":15086434,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":50},{"imageOffset":15086519,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":4},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":10},{"imageOffset":15086122,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":346},{"imageOffset":15137677,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":1053},{"imageOffset":15111348,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":100},{"imageOffset":15064430,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":4,"symbolLocation":158},{"imageOffset":15077780,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":4},{"imageOffset":15031586,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":34},{"imageOffset":15031660,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":4},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":11},{"imageOffset":15031497,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":57},{"imageOffset":15060463,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":4,"symbolLocation":591},{"imageOffset":14674696,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":4,"symbolLocation":856},{"imageOffset":14676570,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":4,"symbolLocation":282},{"imageOffset":14701875,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":4},{"imageOffset":15291391,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15302511,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15302697,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119059,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":6},{"imageOffset":15248009,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":4},{"imageOffset":15288751,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":95},{"imageOffset":15290372,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":4},{"imageOffset":15251259,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":4,"symbolLocation":395},{"imageOffset":15288488,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":312},{"imageOffset":15143798,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":230},{"imageOffset":15147999,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":4},{"imageOffset":15086434,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":50},{"imageOffset":15086519,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":4},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":10},{"imageOffset":15086122,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":346},{"imageOffset":15137677,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":1053},{"imageOffset":15111348,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":100},{"imageOffset":15064430,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":4,"symbolLocation":158},{"imageOffset":15077780,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":4},{"imageOffset":15031586,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":34},{"imageOffset":15031660,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":4},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":11},{"imageOffset":15031497,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":57},{"imageOffset":15060463,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":4,"symbolLocation":591},{"imageOffset":14674696,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":4,"symbolLocation":856},{"imageOffset":14676570,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":4,"symbolLocation":282},{"imageOffset":14701875,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":4},{"imageOffset":15291391,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15302511,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15302697,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119060,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":6},{"imageOffset":15248009,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":4},{"imageOffset":15288751,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":95},{"imageOffset":15290372,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":4},{"imageOffset":15251259,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":4,"symbolLocation":395},{"imageOffset":15288488,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":312},{"imageOffset":15143798,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":230},{"imageOffset":15147999,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":4},{"imageOffset":15086434,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":50},{"imageOffset":15086519,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":4},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":10},{"imageOffset":15086122,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":346},{"imageOffset":15137677,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":1053},{"imageOffset":15111348,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":100},{"imageOffset":15064430,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":4,"symbolLocation":158},{"imageOffset":15077780,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":4},{"imageOffset":15031586,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":34},{"imageOffset":15031660,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":4},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":11},{"imageOffset":15031497,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":57},{"imageOffset":15060463,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":4,"symbolLocation":591},{"imageOffset":14674696,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":4,"symbolLocation":856},{"imageOffset":14676570,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":4,"symbolLocation":282},{"imageOffset":14701875,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":4},{"imageOffset":15291391,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15302511,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15302697,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119061,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":6},{"imageOffset":15248009,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":4},{"imageOffset":15288751,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":95},{"imageOffset":15290372,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":4},{"imageOffset":15251259,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":4,"symbolLocation":395},{"imageOffset":15288488,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":4,"symbolLocation":312},{"imageOffset":15143798,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":230},{"imageOffset":15147999,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":4},{"imageOffset":15086434,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":50},{"imageOffset":15086519,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":4},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":10},{"imageOffset":15086122,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":4,"symbolLocation":346},{"imageOffset":15137677,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":1053},{"imageOffset":15111348,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":4,"symbolLocation":100},{"imageOffset":15064430,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":4,"symbolLocation":158},{"imageOffset":15077780,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":4},{"imageOffset":15031586,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":34},{"imageOffset":15031660,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":4},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":11},{"imageOffset":15031497,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":4,"symbolLocation":57},{"imageOffset":15060463,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":4,"symbolLocation":591},{"imageOffset":14674696,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":4,"symbolLocation":856},{"imageOffset":14676570,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":4,"symbolLocation":282},{"imageOffset":14701875,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":4},{"imageOffset":15291391,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15302511,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15302697,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119062,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14711295,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":4,"symbolLocation":143},{"imageOffset":14715086,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":4,"symbolLocation":222},{"imageOffset":15291391,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15302511,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15302697,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119063,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14711295,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":4,"symbolLocation":143},{"imageOffset":14715086,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":4,"symbolLocation":222},{"imageOffset":15291391,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15302511,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15302697,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119064,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14711295,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":4,"symbolLocation":143},{"imageOffset":14715086,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":4,"symbolLocation":222},{"imageOffset":15291391,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15302511,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15302697,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119065,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14711295,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":4,"symbolLocation":143},{"imageOffset":14715086,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":4,"symbolLocation":222},{"imageOffset":15291391,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":4},{"imageOffset":15302511,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":4,"symbolLocation":1007},{"imageOffset":15302697,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119805,"name":"core","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":673217,"symbol":"mp_dispatch_queue_process","symbolLocation":369,"imageIndex":13},{"imageOffset":917272,"symbol":"mp_wait_events","symbolLocation":88,"imageIndex":13},{"imageOffset":930187,"symbol":"mp_idle","symbolLocation":91,"imageIndex":13},{"imageOffset":930296,"symbol":"idle_loop","symbolLocation":40,"imageIndex":13},{"imageOffset":892632,"symbol":"mp_play_files","symbolLocation":360,"imageIndex":13},{"imageOffset":782894,"symbol":"core_thread","symbolLocation":62,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119816,"name":"*\/ytdl_hook","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":119817,"name":"*\/stats","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":119818,"name":"*\/console","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":119819,"name":"*\/auto_profiles","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":119845,"name":"worker","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":685181,"symbol":"worker_thread","symbolLocation":173,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":119852,"name":"AMCP Logging Spool","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":6},{"imageOffset":107238,"symbol":"caulk::mach::semaphore::wait_or_error()","symbolLocation":16,"imageIndex":15},{"imageOffset":8520,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":36,"imageIndex":15},{"imageOffset":7692,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*)","symbolLocation":41,"imageIndex":15},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":123125,"name":"core","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":673217,"symbol":"mp_dispatch_queue_process","symbolLocation":369,"imageIndex":13},{"imageOffset":917272,"symbol":"mp_wait_events","symbolLocation":88,"imageIndex":13},{"imageOffset":930187,"symbol":"mp_idle","symbolLocation":91,"imageIndex":13},{"imageOffset":930296,"symbol":"idle_loop","symbolLocation":40,"imageIndex":13},{"imageOffset":892632,"symbol":"mp_play_files","symbolLocation":360,"imageIndex":13},{"imageOffset":782894,"symbol":"core_thread","symbolLocation":62,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":123128,"name":"*\/ytdl_hook","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123129,"name":"*\/stats","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123130,"name":"*\/console","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123131,"name":"*\/auto_profiles","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123134,"name":"worker","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":685181,"symbol":"worker_thread","symbolLocation":173,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":123501,"name":"core","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":673217,"symbol":"mp_dispatch_queue_process","symbolLocation":369,"imageIndex":13},{"imageOffset":917272,"symbol":"mp_wait_events","symbolLocation":88,"imageIndex":13},{"imageOffset":930187,"symbol":"mp_idle","symbolLocation":91,"imageIndex":13},{"imageOffset":930296,"symbol":"idle_loop","symbolLocation":40,"imageIndex":13},{"imageOffset":892632,"symbol":"mp_play_files","symbolLocation":360,"imageIndex":13},{"imageOffset":782894,"symbol":"core_thread","symbolLocation":62,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":123502,"name":"*\/ytdl_hook","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123503,"name":"*\/stats","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123504,"name":"*\/console","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123505,"name":"*\/auto_profiles","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123518,"name":"worker","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":685181,"symbol":"worker_thread","symbolLocation":173,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":123789,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":123906,"name":"core","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":673217,"symbol":"mp_dispatch_queue_process","symbolLocation":369,"imageIndex":13},{"imageOffset":917272,"symbol":"mp_wait_events","symbolLocation":88,"imageIndex":13},{"imageOffset":930187,"symbol":"mp_idle","symbolLocation":91,"imageIndex":13},{"imageOffset":930296,"symbol":"idle_loop","symbolLocation":40,"imageIndex":13},{"imageOffset":892632,"symbol":"mp_play_files","symbolLocation":360,"imageIndex":13},{"imageOffset":782894,"symbol":"core_thread","symbolLocation":62,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":123907,"name":"*\/ytdl_hook","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123908,"name":"*\/stats","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123909,"name":"*\/console","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123910,"name":"*\/auto_profiles","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":123920,"name":"worker","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":685181,"symbol":"worker_thread","symbolLocation":173,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":126899,"queue":"com.apple.NSXPCConnection.user.endpoint","frames":[{"imageOffset":156871,"symbol":"_object_remove_associations","symbolLocation":808,"imageIndex":16},{"imageOffset":40857,"symbol":"objc_destructInstance","symbolLocation":113,"imageIndex":16},{"imageOffset":9933,"symbol":"_dispatch_dispose","symbolLocation":107,"imageIndex":12},{"imageOffset":120288,"symbol":"_dispatch_mach_msg_async_reply_invoke","symbolLocation":398,"imageIndex":12},{"imageOffset":37325,"symbol":"_dispatch_lane_serial_drain","symbolLocation":342,"imageIndex":12},{"imageOffset":40496,"symbol":"_dispatch_lane_invoke","symbolLocation":417,"imageIndex":12},{"imageOffset":81646,"symbol":"_dispatch_workloop_worker_thread","symbolLocation":753,"imageIndex":12},{"imageOffset":12240,"symbol":"_pthread_wqthread","symbolLocation":326,"imageIndex":7},{"imageOffset":8023,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":7}]},{"id":128085,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":128258,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":128309,"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780831,"symbol":"wait_wakeup","symbolLocation":255,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":21972483,"sourceLine":184,"sourceFile":"MPVWrapper.swift","symbol":"(3) suspend resume partial function for MPVWrapper.pollEvents()","imageIndex":4,"symbolLocation":259},{"imageOffset":21966625,"sourceLine":106,"sourceFile":"MPVWrapper.swift","symbol":"(2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:)","imageIndex":4,"symbolLocation":1}]},{"id":128429,"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780831,"symbol":"wait_wakeup","symbolLocation":255,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":21972483,"sourceLine":184,"sourceFile":"MPVWrapper.swift","symbol":"(3) suspend resume partial function for MPVWrapper.pollEvents()","imageIndex":4,"symbolLocation":259},{"imageOffset":21966625,"sourceLine":106,"sourceFile":"MPVWrapper.swift","symbol":"(2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:)","imageIndex":4,"symbolLocation":1}]},{"triggered":true,"id":128468,"instructionState":{"instructionStream":{"bytes":[11,7,0,0,72,141,136,16,2,0,0,72,137,77,160,72,5,178,2,0,0,72,137,69,184,65,138,134,176,2,0,0,76,139,37,188,112,180,59,76,139,61,173,112,180,59,76,137,117,152,235,23,102,46,15,31,132,0,0,0,0,0,15,31,68,0,0,133,210,15,132,150,6,0,0,36,247,65,136,134,176,2,0,0,65,128,142,175,2,0,0,8,73,139,70,8,72,139,128,72,1,0,0,72,133,192,116,5,76,137,247,255,208,72,139,85,168,76,137,247,76,137,238,232,19,12,0,0,137,69,200,76,137,247,232,248,187,251,255,73,131,190,16,2,0,0,0,15,132,123,4,0,0,65,246,134,177,2,0,0,32,117,13,128,61,146,19,40,61,0,15,133,247,4,0,0,73,139,190,64,1,0,0,72,141,13,1,204,68,0,72,133],"offset":96}},"threadState":{"r13":{"value":105553151801872},"rax":{"value":140469559459680},"rflags":{"value":66050},"cpu":{"value":1},"r14":{"value":140478147949072},"rsi":{"value":105553151801872},"r8":{"value":0},"cr2":{"value":140469559460008},"rdx":{"value":449796979965057397},"r10":{"value":4865912704},"r9":{"value":1015},"r15":{"value":140703570263568,"symbolLocation":0,"symbol":"objc_release"},"rbx":{"value":105553151801872},"trap":{"value":14,"description":"(no mapping for user data read)"},"err":{"value":4},"r11":{"value":4874039296},"rip":{"value":140703645462973,"matchesCrashFrame":1},"rbp":{"value":123145329223024},"rsp":{"value":123145329222768},"r12":{"value":140703570251888,"symbolLocation":0,"symbol":"objc_retain"},"rcx":{"value":140478147949600},"flavor":"x86_THREAD_STATE","rdi":{"value":140478147949072}},"queue":"com.apple.network.connections","frames":[{"imageOffset":5845437,"symbol":"nw_protocol_implementation_read","symbolLocation":429,"imageIndex":17},{"imageOffset":5789092,"symbol":"nw_protocol_implementation_input_available","symbolLocation":84,"imageIndex":17},{"imageOffset":5131789,"symbol":"nw_channel_add_input_frames","symbolLocation":8941,"imageIndex":17},{"imageOffset":5122693,"symbol":"nw_channel_update_input_source","symbolLocation":437,"imageIndex":17},{"imageOffset":5119238,"symbol":"__nw_channel_create_block_invoke.22","symbolLocation":86,"imageIndex":17},{"imageOffset":13079,"symbol":"_dispatch_client_callout","symbolLocation":8,"imageIndex":12},{"imageOffset":23932,"symbol":"_dispatch_continuation_pop","symbolLocation":453,"imageIndex":12},{"imageOffset":94728,"symbol":"_dispatch_source_invoke","symbolLocation":2179,"imageIndex":12},{"imageOffset":45302,"symbol":"_dispatch_workloop_invoke","symbolLocation":1987,"imageIndex":12},{"imageOffset":81646,"symbol":"_dispatch_workloop_worker_thread","symbolLocation":753,"imageIndex":12},{"imageOffset":12240,"symbol":"_pthread_wqthread","symbolLocation":326,"imageIndex":7},{"imageOffset":8023,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":7}]},{"id":128482,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":128519,"name":"core","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":673342,"symbol":"mp_dispatch_queue_process","symbolLocation":494,"imageIndex":13},{"imageOffset":917272,"symbol":"mp_wait_events","symbolLocation":88,"imageIndex":13},{"imageOffset":930187,"symbol":"mp_idle","symbolLocation":91,"imageIndex":13},{"imageOffset":930296,"symbol":"idle_loop","symbolLocation":40,"imageIndex":13},{"imageOffset":892632,"symbol":"mp_play_files","symbolLocation":360,"imageIndex":13},{"imageOffset":782894,"symbol":"core_thread","symbolLocation":62,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":128522,"name":"*\/ytdl_hook","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":128523,"name":"*\/stats","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":128524,"name":"*\/console","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":128525,"name":"*\/auto_profiles","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":13},{"imageOffset":24086,"imageIndex":14}]},{"id":128537,"name":"worker","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":685181,"symbol":"worker_thread","symbolLocation":173,"imageIndex":13},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":128648,"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":6},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780831,"symbol":"wait_wakeup","symbolLocation":255,"imageIndex":13},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":13},{"imageOffset":21972483,"sourceLine":184,"sourceFile":"MPVWrapper.swift","symbol":"(3) suspend resume partial function for MPVWrapper.pollEvents()","imageIndex":4,"symbolLocation":259},{"imageOffset":21966625,"sourceLine":106,"sourceFile":"MPVWrapper.swift","symbol":"(2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:)","imageIndex":4,"symbolLocation":1}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703572037632,
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
    "base" : 140703719895040,
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
    "base" : 140703616593920,
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
    "base" : 140708057149440,
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
    "base" : 4535119872,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 32768000,
    "uuid" : "bb6d423e-bc1a-3e93-8e35-ff3888d8484f",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4666712064,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703571492864,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703571722240,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703650041856,
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
    "base" : 140703587229696,
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
    "base" : 140703794823168,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703923838976,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703569932288,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4631855104,
    "size" : 2883584,
    "uuid" : "e355e4d8-dcc6-3439-90d2-abf0776cc6ac",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libmpv.2.dylib",
    "name" : "libmpv.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4656594944,
    "size" : 425984,
    "uuid" : "790d1386-66cf-39c0-ab74-e7b60abbd7c9",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libluajit-5.1.2.dylib",
    "name" : "libluajit-5.1.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703717408768,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.audio.caulk",
    "size" : 139264,
    "uuid" : "f04b5c91-d0ec-33c6-8a81-b80a3ebf827f",
    "path" : "\/System\/Library\/PrivateFrameworks\/caulk.framework\/Versions\/A\/caulk",
    "name" : "caulk"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703570223104,
    "size" : 241664,
    "uuid" : "b36a2b52-68a9-3e44-b927-71c24be1272f",
    "path" : "\/usr\/lib\/libobjc.A.dylib",
    "name" : "libobjc.A.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703639617536,
    "size" : 10424320,
    "uuid" : "bab2b20a-67af-312c-9b68-f98e1930218e",
    "path" : "\/usr\/lib\/libnetwork.dylib",
    "name" : "libnetwork.dylib"
  },
  {
    "size" : 0,
    "source" : "A",
    "base" : 0,
    "uuid" : "00000000-0000-0000-0000-000000000000"
  }
],
  "sharedCache" : {
  "base" : 140703568461824,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=775.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=775.0M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               384K        3 \nActivity Tracing                   256K        1 \nCG backing stores                  528K        4 \nCG image                            52K       10 \nCG raster data                      24K        2 \nColorSync                          228K       27 \nCoreAnimation                      196K       21 \nCoreGraphics                        12K        2 \nCoreUI image data                  496K        8 \nFoundation                          40K        2 \nIOKit                             7940K        1 \nImage IO                           364K        4 \nKernel Alloc Once                    8K        1 \nMALLOC                           284.8M      201 \nMALLOC guard page                   48K       11 \nMALLOC_LARGE (reserved)           1920K        5         reserved VM address space (unallocated)\nMALLOC_NANO (reserved)           384.0M        1         reserved VM address space (unallocated)\nOpenGL GLSL                        384K        5 \nSQLite page cache                 1152K       18 \nSTACK GUARD                       56.2M       51 \nStack                             33.4M       51 \nVM_ALLOCATE                       19.7M      101 \n__CTF                               756        1 \n__DATA                            55.4M      612 \n__DATA_CONST                      33.9M      423 \n__DATA_DIRTY                      1676K      209 \n__FONT_DATA                          4K        1 \n__GLSLBUILTINS                    5176K        1 \n__LINKEDIT                       707.9M       85 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           594.4M      621 \n__UNICODE                          592K        1 \ndyld private memory               1024K        1 \nlibnetwork                        17.9M      104 \nmapped file                      365.0M       38 \nshared memory                      9.8M       28 \n===========                     =======  ======= \nTOTAL                              2.6G     2658 \nTOTAL, minus reserved VM space     2.2G     2658 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.network.connections"
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
