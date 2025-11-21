-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [23258]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [23119]
Responsible:           Electron [496]
User ID:               501

Date/Time:             2025-11-20 19:51:51.7588 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        24F646B6-E55A-DF4C-178D-891130B3FBCE

Sleep/Wake UUID:       3C8B07A7-DCCC-448C-8431-1DE27EDFCBA5

Time Awake Since Boot: 12000 seconds
Time Since Wake:       399 seconds

System Integrity Protection: enabled

Crashed Thread:        12  Dispatch queue: com.apple.network.connections

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_INVALID_ADDRESS at 0x000007fd949b2f70
Exception Codes:       0x0000000000000001, 0x000007fd949b2f70
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 11 Segmentation fault: 11
Terminating Process:   exc handler [23258]

VM Region Info: 0x7fd949b2f70 is not in any region.  Bytes after previous region: 8780262879089  Bytes before following region: 114359820648592
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      VM_ALLOCATE                 144270000-144280000    [   64K] r-x/rwx SM=PRV
--->  GAP OF 0x6ffec8efb000 BYTES
      Stack Guard              70000d17b000-70000d17c000 [    4K] ---/rwx SM=NUL

Thread 0::  Dispatch queue: com.apple.main-thread
0   libsystem_kernel.dylib        	    0x7ff802c5293a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff802c52ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff802d5629d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff802d54928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff802d53d6c CFRunLoopRunSpecific + 562
5   HIToolbox                     	    0x7ff80ba065e6 RunCurrentEventLoopInMode + 292
6   HIToolbox                     	    0x7ff80ba0634a ReceiveNextEventCommon + 594
7   HIToolbox                     	    0x7ff80ba060e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
8   AppKit                        	    0x7ff805792aa9 _DPSNextEvent + 927
9   AppKit                        	    0x7ff805791166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
10  AppKit                        	    0x7ff805783818 -[NSApplication run] + 586
11  AppKit                        	    0x7ff80575779a NSApplicationMain + 817
12  SwiftUI                       	    0x7ff90e2a809c specialized runApp(_:) + 161
13  SwiftUI                       	    0x7ff90ed0a424 runApp<A>(_:) + 164
14  SwiftUI                       	    0x7ff90e802c5f static App.main() + 63
15  RedLemon                      	       0x10bcf4243 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
16  RedLemon                      	       0x10bcf42c9 RedLemon_main + 9
17  dyld                          	       0x1123f652e start + 462

Thread 1:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff802c5293a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff802c52ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff802d5629d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff802d54928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff802d53d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff805900572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 2:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff802c5293a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff802c52ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff802d5629d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff802d54928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff802d53d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff807982964 0x7ff80773a000 + 2394468
6   Foundation                    	    0x7ff803bab724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 3:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff802c5730e kevent + 10
1   RedLemon                      	       0x10bae8e09 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10baf2d2f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10baf3384 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10bae9abb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10baf2c28 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10bacf6f6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10bad075f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10bac1623 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10bacdf0d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10bac7834 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10babc0ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10babf514 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10bab40a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10bab40ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff817c57e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10bab4049 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10babb16f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10ba5ce88 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10ba5d5da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10ba638b3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10baf377f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10baf62ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10baf63a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff802c5730e kevent + 10
1   RedLemon                      	       0x10bae8e09 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10baf2d2f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10baf3384 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10bae9abb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10baf2c28 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10bacf6f6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10bad075f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10bac16e2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10bac1737 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81026872c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10bac15aa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10bacdf0d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10bac7834 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10babc0ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10babf514 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10bab40a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10bab40ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff817c57e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10bab4049 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10babb16f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10ba5ce88 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10ba5d5da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10ba638b3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10baf377f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10baf62ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10baf63a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff802c5730e kevent + 10
1   RedLemon                      	       0x10bae8e09 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10baf2d2f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10baf3384 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10bae9abb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10baf2c28 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10bacf6f6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10bad075f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10bac1623 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10bacdf0d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10bac7834 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10babc0ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10babf514 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10bab40a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10bab40ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff817c57e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10bab4049 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10babb16f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10ba5ce88 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10ba5d5da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10ba638b3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10baf377f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10baf62ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10baf63a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff802c5730e kevent + 10
1   RedLemon                      	       0x10bae8e09 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10baf2d2f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10baf3384 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10bae9abb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10baf2c28 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10bacf6f6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10bad075f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10bac16e2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10bac1737 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81026872c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10bac15aa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10bacdf0d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10bac7834 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10babc0ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10babf514 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10bab40a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10bab40ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff817c57e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10bab4049 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10babb16f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10ba5ce88 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10ba5d5da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10ba638b3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10baf377f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10baf62ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10baf63a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 7:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff802c52976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff802ad77ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff802ad7c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10ba65d7f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10ba66c4e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10baf377f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10baf62ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10baf63a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 8:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff802c52976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff802ad77ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff802ad7c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10ba65d7f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10ba66c4e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10baf377f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10baf62ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10baf63a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 9:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff802c52976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff802ad77ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff802ad7c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10ba65d7f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10ba66c4e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10baf377f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10baf62ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10baf63a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 10:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff802c52976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff802ad77ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff802ad7c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10ba65d7f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10ba66c4e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10baf377f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10baf62ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10baf63a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 11:
0   libsystem_pthread.dylib       	    0x7ff802c8af48 start_wqthread + 0

Thread 12 Crashed::  Dispatch queue: com.apple.network.connections
0   libobjc.A.dylib               	    0x7ff802b24e2f objc_release + 31
1   CFNetwork                     	    0x7ff80775c90b 0x7ff80773a000 + 141579
2   CoreFoundation                	    0x7ff802e23046 _CFRelease + 244
3   CFNetwork                     	    0x7ff80775bf37 0x7ff80773a000 + 139063
4   libsystem_blocks.dylib        	    0x7ff8029c0654 _Block_release + 130
5   CFNetwork                     	    0x7ff8078c49b5 0x7ff80773a000 + 1616309
6   CFNetwork                     	    0x7ff8078c2fc7 0x7ff80773a000 + 1609671
7   libsystem_blocks.dylib        	    0x7ff8029c0654 _Block_release + 130
8   libnetwork.dylib              	    0x7ff807038209 nw_proxy_deallocate_options + 25
9   libnetwork.dylib              	    0x7ff806d6789c -[NWConcrete_nw_protocol_options dealloc] + 44
10  libnetwork.dylib              	    0x7ff8074aaf52 nw_array_dispose + 466
11  libnetwork.dylib              	    0x7ff806d67cb1 -[OS_nw_array dealloc] + 17
12  libnetwork.dylib              	    0x7ff806d66563 -[NWConcrete_nw_parameters .cxx_destruct] + 83
13  libobjc.A.dylib               	    0x7ff802b2c746 object_cxxDestructFromClass(objc_object*, objc_class*) + 83
14  libobjc.A.dylib               	    0x7ff802b24f86 objc_destructInstance + 94
15  libobjc.A.dylib               	    0x7ff802b24f1d _objc_rootDealloc + 62
16  libnetwork.dylib              	    0x7ff806d6629d -[NWConcrete_nw_parameters dealloc] + 93
17  libobjc.A.dylib               	    0x7ff802b2c746 object_cxxDestructFromClass(objc_object*, objc_class*) + 83
18  libobjc.A.dylib               	    0x7ff802b24f86 objc_destructInstance + 94
19  libobjc.A.dylib               	    0x7ff802b24f1d _objc_rootDealloc + 62
20  libnetwork.dylib              	    0x7ff806eb2bb7 -[NWConcrete_nw_path_evaluator dealloc] + 1111
21  libnetwork.dylib              	    0x7ff806eb488a __nw_association_schedule_deactivation_block_invoke + 1322
22  libdispatch.dylib             	    0x7ff802ad7317 _dispatch_client_callout + 8
23  libdispatch.dylib             	    0x7ff802ad9d7c _dispatch_continuation_pop + 453
24  libdispatch.dylib             	    0x7ff802aeb208 _dispatch_source_invoke + 2179
25  libdispatch.dylib             	    0x7ff802adf0f6 _dispatch_workloop_invoke + 1987
26  libdispatch.dylib             	    0x7ff802ae7eee _dispatch_workloop_worker_thread + 753
27  libsystem_pthread.dylib       	    0x7ff802c8bfd0 _pthread_wqthread + 326
28  libsystem_pthread.dylib       	    0x7ff802c8af57 start_wqthread + 15

Thread 13:
0   libsystem_pthread.dylib       	    0x7ff802c8af48 start_wqthread + 0

Thread 14::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libsystem_kernel.dylib        	    0x7ff802c553aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff802c8fa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x110235a1f wait_wakeup + 255
3   libmpv.2.dylib                	       0x1102364c8 mpv_wait_event + 584
4   RedLemon                      	       0x10c02a793 (3) suspend resume partial function for MPVWrapper.pollEvents() + 259 (MPVWrapper.swift:242)
5   RedLemon                      	       0x10c027a31 (2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:) + 1 (MPVWrapper.swift:111)

Thread 15:: core
0   libsystem_kernel.dylib        	    0x7ff802c553aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff802c8fa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x11021b5c1 mp_dispatch_queue_process + 369
3   libmpv.2.dylib                	       0x110256f18 mp_wait_events + 88
4   libmpv.2.dylib                	       0x11025a18b mp_idle + 91
5   libmpv.2.dylib                	       0x11025a1f8 idle_loop + 40
6   libmpv.2.dylib                	       0x110250ed8 mp_play_files + 360
7   libmpv.2.dylib                	       0x11023622e core_thread + 62
8   libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 16:: */ytdl_hook
0   libsystem_kernel.dylib        	    0x7ff802c553aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff802c8fa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1102359a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1102364c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x1102cc8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x111914e16 0x11190f000 + 24086

Thread 17:: */stats
0   libsystem_kernel.dylib        	    0x7ff802c553aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff802c8fa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1102359a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1102364c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x1102cc8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x111914e16 0x11190f000 + 24086

Thread 18:: */console
0   libsystem_kernel.dylib        	    0x7ff802c553aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff802c8fa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1102359a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1102364c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x1102cc8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x111914e16 0x11190f000 + 24086

Thread 19:: */auto_profiles
0   libsystem_kernel.dylib        	    0x7ff802c553aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff802c8fa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x1102359a6 wait_wakeup + 134
3   libmpv.2.dylib                	       0x1102364c8 mpv_wait_event + 584
4   libmpv.2.dylib                	       0x1102cc8e7 script_raw_wait_event + 103
5   libluajit-5.1.2.dylib         	       0x111914e16 0x11190f000 + 24086

Thread 20:: worker
0   libsystem_kernel.dylib        	    0x7ff802c553aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff802c8fa6f _pthread_cond_wait + 1249
2   libmpv.2.dylib                	       0x11021e47d worker_thread + 173
3   libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
4   libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 21:: AMCP Logging Spool
0   libsystem_kernel.dylib        	    0x7ff802c52976 semaphore_wait_trap + 10
1   caulk                         	    0x7ff80b7932e6 caulk::mach::semaphore::wait_or_error() + 16
2   caulk                         	    0x7ff80b77b148 caulk::concurrent::details::worker_thread::run() + 36
3   caulk                         	    0x7ff80b77ae0c void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*) + 41
4   libsystem_pthread.dylib       	    0x7ff802c8f4e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff802c8af6b thread_start + 15

Thread 22:
0   libsystem_pthread.dylib       	    0x7ff802c8af48 start_wqthread + 0


Thread 12 crashed with X86 Thread State (64-bit):
  rax: 0xf00007fd949b2f55  rbx: 0x00007fd949ad13a0  rcx: 0x000007fd949b2f50  rdx: 0x00007fd949ad1638
  rdi: 0x00007fd949b73960  rsi: 0x00000000cab05489  rbp: 0x000070000d27e3a0  rsp: 0x000070000d27e388
   r8: 0x0000000000004344   r9: 0x0000000000000000  r10: 0x00007fd947000000  r11: 0x00007fd9470e00a0
  r12: 0x0000000100000000  r13: 0x00007fd949ad1390  r14: 0x000000000000014b  r15: 0xffffffff00000000
  rip: 0x00007ff802b24e2f  rfl: 0x0000000000010206  cr2: 0x000007fd949b2f70

Logical CPU:     0
Error Code:      0x00000004 (no mapping for user data read)
Trap Number:     14

Thread 12 instruction stream:
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
    0x7ff802c51000 -     0x7ff802c88fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff802cd6000 -     0x7ff8031d8fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff80b9d8000 -     0x7ff80bccbfff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff805754000 -     0x7ff8065e3fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff90e22c000 -     0x7ff90f0cbfff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x10ac5e000 -        0x10c945fff com.redlemon.app (1.0.14) <e05c0a8e-8108-3573-bfcb-c907cbfca0ee> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x1123f1000 -        0x11245cfff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff802c89000 -     0x7ff802c94fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff80773a000 -     0x7ff807bc8fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff803b53000 -     0x7ff803f0ffff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff817c57000 -     0x7ff817c58fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff81014d000 -     0x7ff8105c6fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff802ad4000 -     0x7ff802b1afff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff802b1b000 -     0x7ff802b55fff libobjc.A.dylib (*) <b36a2b52-68a9-3e44-b927-71c24be1272f> /usr/lib/libobjc.A.dylib
    0x7ff8029bf000 -     0x7ff8029c0fff libsystem_blocks.dylib (*) <f44f0d7c-74fd-37fd-8267-8d3aec7e7fb8> /usr/lib/system/libsystem_blocks.dylib
    0x7ff806d49000 -     0x7ff807739fff libnetwork.dylib (*) <bab2b20a-67af-312c-9b68-f98e1930218e> /usr/lib/libnetwork.dylib
       0x110177000 -        0x110436fff libmpv.2.dylib (*) <e355e4d8-dcc6-3439-90d2-abf0776cc6ac> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libmpv.2.dylib
       0x11190f000 -        0x111976fff libluajit-5.1.2.dylib (*) <790d1386-66cf-39c0-ab74-e7b60abbd7c9> /Users/USER/Desktop/*/RedLemon.app/Contents/Frameworks/libluajit-5.1.2.dylib
    0x7ff80b779000 -     0x7ff80b79afff com.apple.audio.caulk (1.0) <f04b5c91-d0ec-33c6-8a81-b80a3ebf827f> /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk
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
Writable regions: Total=240.3M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=240.3M(100%)

                                VIRTUAL   REGION
REGION TYPE                        SIZE    COUNT (non-coalesced)
===========                     =======  =======
Accelerate framework               512K        4
Activity Tracing                   256K        1
CG backing stores                  528K        4
CG image                          1488K       23
CG raster data                       8K        1
ColorSync                          232K       28
CoreAnimation                     2240K      401
CoreGraphics                        12K        2
CoreUI image data                  576K       10
Dispatch continuations            32.0M        1
Foundation                          40K        2
IOKit                             7940K        1
Image IO                          2528K        9
Kernel Alloc Once                    8K        1
MALLOC                           122.6M      199
MALLOC guard page                   48K        9
MALLOC_LARGE (reserved)            384K        1         reserved VM address space (unallocated)
OpenGL GLSL                        384K        5
SQLite page cache                 1472K       23
STACK GUARD                       56.1M       23
Stack                             19.2M       23
VM_ALLOCATE                       13.6M       45
__CTF                               756        1
__DATA                            55.3M      612
__DATA_CONST                      33.8M      422
__DATA_DIRTY                      1675K      208
__FONT_DATA                          4K        1
__GLSLBUILTINS                    5176K        1
__LINKEDIT                       703.1M       85
__OBJC_RO                         82.9M        1
__OBJC_RW                         3200K        2
__TEXT                           592.0M      620
__UNICODE                          592K        1
dyld private memory               1024K        3
libnetwork                        13.6M       40
mapped file                      370.4M       42
shared memory                     9988K       22
===========                     =======  =======
TOTAL                              2.1G     2877
TOTAL, minus reserved VM space     2.1G     2877



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-11-20 19:52:03.00 -0500","app_version":"1.0.14","slice_uuid":"e05c0a8e-8108-3573-bfcb-c907cbfca0ee","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"FE0A907B-CDE0-4A85-8E22-423D582CC00C","name":"RedLemon"}
{
  "uptime" : 12000,
  "procLaunch" : "2025-11-20 19:47:10.1987 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookAir7,1",
  "procStartAbsTime" : 11800410211886,
  "coalitionID" : 537,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-11-20 19:51:51.7588 -0500",
  "incident" : "FE0A907B-CDE0-4A85-8E22-423D582CC00C",
  "bug_type" : "309",
  "pid" : 23258,
  "procExitAbsTime" : 12081626523865,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"DE7DE55C-FAC2-51DA-92D1-22902ED1697D","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 23119,
  "coalitionName" : "com.microsoft.VSCode",
  "crashReporterKey" : "24F646B6-E55A-DF4C-178D-891130B3FBCE",
  "responsiblePid" : 496,
  "responsibleProc" : "Electron",
  "wakeTime" : 399,
  "sleepWakeUUID" : "3C8B07A7-DCCC-448C-8431-1DE27EDFCBA5",
  "sip" : "enabled",
  "vmRegionInfo" : "0x7fd949b2f70 is not in any region.  Bytes after previous region: 8780262879089  Bytes before following region: 114359820648592\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      VM_ALLOCATE                 144270000-144280000    [   64K] r-x\/rwx SM=PRV  \n--->  GAP OF 0x6ffec8efb000 BYTES\n      Stack Guard              70000d17b000-70000d17c000 [    4K] ---\/rwx SM=NUL  ",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x000007fd949b2f70","rawCodes":[1,8785701318512],"type":"EXC_BAD_ACCESS","signal":"SIGSEGV","subtype":"KERN_INVALID_ADDRESS at 0x000007fd949b2f70"},
  "termination" : {"flags":0,"code":11,"namespace":"SIGNAL","indicator":"Segmentation fault: 11","byProc":"exc handler","byPid":23258},
  "vmregioninfo" : "0x7fd949b2f70 is not in any region.  Bytes after previous region: 8780262879089  Bytes before following region: 114359820648592\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      VM_ALLOCATE                 144270000-144280000    [   64K] r-x\/rwx SM=PRV  \n--->  GAP OF 0x6ffec8efb000 BYTES\n      Stack Guard              70000d17b000-70000d17c000 [    4K] ---\/rwx SM=NUL  ",
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 12,
  "threads" : [{"id":143031,"queue":"com.apple.main-thread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":2},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":2},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":2},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":3},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":3},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":3},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":3},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":4},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":4},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":4},{"imageOffset":17392195,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":5,"symbolLocation":35},{"imageOffset":17392329,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":5},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":6}]},{"id":143140,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":143155,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":2394468,"imageIndex":8},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":9},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":143169,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15248905,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15289647,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15291268,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15252155,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15289384,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15144694,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15148895,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15087139,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":467},{"imageOffset":15138573,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15112244,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15065326,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15078676,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15032482,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15032556,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":10},{"imageOffset":15032393,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15061359,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14675592,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14677466,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14702771,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15292287,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15303407,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15303593,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":143170,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15248905,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15289647,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15291268,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15252155,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15289384,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15144694,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15148895,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15087330,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15087415,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15087018,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15138573,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15112244,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15065326,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15078676,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15032482,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15032556,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":10},{"imageOffset":15032393,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15061359,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14675592,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14677466,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14702771,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15292287,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15303407,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15303593,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":143171,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15248905,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15289647,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15291268,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15252155,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15289384,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15144694,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15148895,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15087139,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":467},{"imageOffset":15138573,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15112244,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15065326,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15078676,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15032482,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15032556,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":10},{"imageOffset":15032393,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15061359,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14675592,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14677466,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14702771,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15292287,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15303407,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15303593,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":143172,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15248905,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15289647,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15291268,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15252155,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15289384,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15144694,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15148895,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15087330,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15087415,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":11},{"imageOffset":15087018,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15138573,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15112244,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15065326,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15078676,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15032482,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15032556,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":10},{"imageOffset":15032393,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15061359,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14675592,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14677466,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14702771,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15292287,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15303407,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15303593,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":143173,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14712191,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14715982,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15292287,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15303407,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15303593,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":143174,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14712191,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14715982,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15292287,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15303407,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15303593,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":143175,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14712191,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14715982,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15292287,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15303407,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15303593,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":143176,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14712191,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14715982,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15292287,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15303407,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15303593,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":144430,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"triggered":true,"id":144462,"instructionState":{"instructionStream":{"bytes":[72,137,194,72,193,234,55,116,52,72,137,194,72,1,202,114,18,240,72,15,177,23,116,37,168,1,117,228,49,246,233,120,211,1,0,49,246,233,231,129,0,0,72,185,248,255,255,255,255,127,0,0,72,33,200,246,64,28,1,116,223,72,137,248,195,72,133,255,116,118,137,248,131,224,1,72,133,192,117,108,72,139,7,72,185,248,255,255,255,255,127,0,0,72,33,193,72,139,81,32,246,194,4,116,84,168,1,116,114,72,185,0,0,0,0,0,0,128,0,72,186,0,0,0,0,0,0,0,1,72,57,200,114,54,72,137,198,72,41,214,114,23,240,72,15,177,55,116,34,168,1,117,232,49,246,186,1,0,0,0,233,134,207,1,0,72,133,200,117,61,72,139,53,8,195,141,65,255,37,202,98,230,63,72,57,206,114,238,195,102,131,121],"offset":96}},"threadState":{"r13":{"value":140571220710288},"rax":{"value":17293831354804023125},"rflags":{"value":66054},"cpu":{"value":0},"r14":{"value":331},"rsi":{"value":3400553609},"r8":{"value":17220},"cr2":{"value":8785701318512},"rdx":{"value":140571220710968},"r10":{"value":140571175813120},"r9":{"value":0},"r15":{"value":18446744069414584320},"rbx":{"value":140571220710304},"trap":{"value":14,"description":"(no mapping for user data read)"},"err":{"value":4},"r11":{"value":140571176730784},"rip":{"value":140703173856815,"matchesCrashFrame":1},"rbp":{"value":123145523028896},"rsp":{"value":123145523028872},"r12":{"value":4294967296},"rcx":{"value":8785701318480},"flavor":"x86_THREAD_STATE","rdi":{"value":140571221375328}},"queue":"com.apple.network.connections","frames":[{"imageOffset":40495,"symbol":"objc_release","symbolLocation":31,"imageIndex":13},{"imageOffset":141579,"imageIndex":8},{"imageOffset":1364038,"symbol":"_CFRelease","symbolLocation":244,"imageIndex":1},{"imageOffset":139063,"imageIndex":8},{"imageOffset":5716,"symbol":"_Block_release","symbolLocation":130,"imageIndex":14},{"imageOffset":1616309,"imageIndex":8},{"imageOffset":1609671,"imageIndex":8},{"imageOffset":5716,"symbol":"_Block_release","symbolLocation":130,"imageIndex":14},{"imageOffset":3076617,"symbol":"nw_proxy_deallocate_options","symbolLocation":25,"imageIndex":15},{"imageOffset":125084,"symbol":"-[NWConcrete_nw_protocol_options dealloc]","symbolLocation":44,"imageIndex":15},{"imageOffset":7741266,"symbol":"nw_array_dispose","symbolLocation":466,"imageIndex":15},{"imageOffset":126129,"symbol":"-[OS_nw_array dealloc]","symbolLocation":17,"imageIndex":15},{"imageOffset":120163,"symbol":"-[NWConcrete_nw_parameters .cxx_destruct]","symbolLocation":83,"imageIndex":15},{"imageOffset":71494,"symbol":"object_cxxDestructFromClass(objc_object*, objc_class*)","symbolLocation":83,"imageIndex":13},{"imageOffset":40838,"symbol":"objc_destructInstance","symbolLocation":94,"imageIndex":13},{"imageOffset":40733,"symbol":"_objc_rootDealloc","symbolLocation":62,"imageIndex":13},{"imageOffset":119453,"symbol":"-[NWConcrete_nw_parameters dealloc]","symbolLocation":93,"imageIndex":15},{"imageOffset":71494,"symbol":"object_cxxDestructFromClass(objc_object*, objc_class*)","symbolLocation":83,"imageIndex":13},{"imageOffset":40838,"symbol":"objc_destructInstance","symbolLocation":94,"imageIndex":13},{"imageOffset":40733,"symbol":"_objc_rootDealloc","symbolLocation":62,"imageIndex":13},{"imageOffset":1481655,"symbol":"-[NWConcrete_nw_path_evaluator dealloc]","symbolLocation":1111,"imageIndex":15},{"imageOffset":1489034,"symbol":"__nw_association_schedule_deactivation_block_invoke","symbolLocation":1322,"imageIndex":15},{"imageOffset":13079,"symbol":"_dispatch_client_callout","symbolLocation":8,"imageIndex":12},{"imageOffset":23932,"symbol":"_dispatch_continuation_pop","symbolLocation":453,"imageIndex":12},{"imageOffset":94728,"symbol":"_dispatch_source_invoke","symbolLocation":2179,"imageIndex":12},{"imageOffset":45302,"symbol":"_dispatch_workloop_invoke","symbolLocation":1987,"imageIndex":12},{"imageOffset":81646,"symbol":"_dispatch_workloop_worker_thread","symbolLocation":753,"imageIndex":12},{"imageOffset":12240,"symbol":"_pthread_wqthread","symbolLocation":326,"imageIndex":7},{"imageOffset":8023,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":7}]},{"id":144499,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":144500,"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780831,"symbol":"wait_wakeup","symbolLocation":255,"imageIndex":16},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":16},{"imageOffset":20760467,"sourceLine":242,"sourceFile":"MPVWrapper.swift","symbol":"(3) suspend resume partial function for MPVWrapper.pollEvents()","imageIndex":5,"symbolLocation":259},{"imageOffset":20748849,"sourceLine":111,"sourceFile":"MPVWrapper.swift","symbol":"(2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:)","imageIndex":5,"symbolLocation":1}]},{"id":144564,"name":"core","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":673217,"symbol":"mp_dispatch_queue_process","symbolLocation":369,"imageIndex":16},{"imageOffset":917272,"symbol":"mp_wait_events","symbolLocation":88,"imageIndex":16},{"imageOffset":930187,"symbol":"mp_idle","symbolLocation":91,"imageIndex":16},{"imageOffset":930296,"symbol":"idle_loop","symbolLocation":40,"imageIndex":16},{"imageOffset":892632,"symbol":"mp_play_files","symbolLocation":360,"imageIndex":16},{"imageOffset":782894,"symbol":"core_thread","symbolLocation":62,"imageIndex":16},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":144570,"name":"*\/ytdl_hook","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":16},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":16},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":16},{"imageOffset":24086,"imageIndex":17}]},{"id":144571,"name":"*\/stats","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":16},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":16},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":16},{"imageOffset":24086,"imageIndex":17}]},{"id":144572,"name":"*\/console","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":16},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":16},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":16},{"imageOffset":24086,"imageIndex":17}]},{"id":144573,"name":"*\/auto_profiles","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":780710,"symbol":"wait_wakeup","symbolLocation":134,"imageIndex":16},{"imageOffset":783560,"symbol":"mpv_wait_event","symbolLocation":584,"imageIndex":16},{"imageOffset":1399015,"symbol":"script_raw_wait_event","symbolLocation":103,"imageIndex":16},{"imageOffset":24086,"imageIndex":17}]},{"id":144585,"name":"worker","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":0},{"imageOffset":27247,"symbol":"_pthread_cond_wait","symbolLocation":1249,"imageIndex":7},{"imageOffset":685181,"symbol":"worker_thread","symbolLocation":173,"imageIndex":16},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":144623,"name":"AMCP Logging Spool","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":107238,"symbol":"caulk::mach::semaphore::wait_or_error()","symbolLocation":16,"imageIndex":18},{"imageOffset":8520,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":36,"imageIndex":18},{"imageOffset":7692,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*)","symbolLocation":41,"imageIndex":18},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":144759,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703175086080,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703175630848,
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
    "base" : 140703323488256,
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
    "base" : 140703220187136,
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
    "base" : 140707660742656,
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
    "base" : 4475707392,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 30310400,
    "uuid" : "e05c0a8e-8108-3573-bfcb-c907cbfca0ee",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4601090048,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703175315456,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703253635072,
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
    "base" : 140703190822912,
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
    "base" : 140703527432192,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703398416384,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703173525504,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703173816320,
    "size" : 241664,
    "uuid" : "b36a2b52-68a9-3e44-b927-71c24be1272f",
    "path" : "\/usr\/lib\/libobjc.A.dylib",
    "name" : "libobjc.A.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703172390912,
    "size" : 8192,
    "uuid" : "f44f0d7c-74fd-37fd-8267-8d3aec7e7fb8",
    "path" : "\/usr\/lib\/system\/libsystem_blocks.dylib",
    "name" : "libsystem_blocks.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703243210752,
    "size" : 10424320,
    "uuid" : "bab2b20a-67af-312c-9b68-f98e1930218e",
    "path" : "\/usr\/lib\/libnetwork.dylib",
    "name" : "libnetwork.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4564938752,
    "size" : 2883584,
    "uuid" : "e355e4d8-dcc6-3439-90d2-abf0776cc6ac",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libmpv.2.dylib",
    "name" : "libmpv.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4589678592,
    "size" : 425984,
    "uuid" : "790d1386-66cf-39c0-ab74-e7b60abbd7c9",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/Frameworks\/libluajit-5.1.2.dylib",
    "name" : "libluajit-5.1.2.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703321001984,
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
  "base" : 140703172055040,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=240.3M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=240.3M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               512K        4 \nActivity Tracing                   256K        1 \nCG backing stores                  528K        4 \nCG image                          1488K       23 \nCG raster data                       8K        1 \nColorSync                          232K       28 \nCoreAnimation                     2240K      401 \nCoreGraphics                        12K        2 \nCoreUI image data                  576K       10 \nDispatch continuations            32.0M        1 \nFoundation                          40K        2 \nIOKit                             7940K        1 \nImage IO                          2528K        9 \nKernel Alloc Once                    8K        1 \nMALLOC                           122.6M      199 \nMALLOC guard page                   48K        9 \nMALLOC_LARGE (reserved)            384K        1         reserved VM address space (unallocated)\nOpenGL GLSL                        384K        5 \nSQLite page cache                 1472K       23 \nSTACK GUARD                       56.1M       23 \nStack                             19.2M       23 \nVM_ALLOCATE                       13.6M       45 \n__CTF                               756        1 \n__DATA                            55.3M      612 \n__DATA_CONST                      33.8M      422 \n__DATA_DIRTY                      1675K      208 \n__FONT_DATA                          4K        1 \n__GLSLBUILTINS                    5176K        1 \n__LINKEDIT                       703.1M       85 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           592.0M      620 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      370.4M       42 \nshared memory                     9988K       22 \n===========                     =======  ======= \nTOTAL                              2.1G     2877 \nTOTAL, minus reserved VM space     2.1G     2877 \n",
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



















