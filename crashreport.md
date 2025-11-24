-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [7814]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [7711]
Responsible:           Electron [623]
User ID:               501

Date/Time:             2025-11-24 07:54:28.2724 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA


Time Awake Since Boot: 1100 seconds

System Integrity Protection: enabled

Crashed Thread:        12  Dispatch queue: com.apple.network.connections

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_INVALID_ADDRESS at 0x0000000000000020
Exception Codes:       0x0000000000000001, 0x0000000000000020
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 11 Segmentation fault: 11
Terminating Process:   exc handler [7814]

VM Region Info: 0x20 is not in any region.  Bytes before following region: 140737487744992
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      UNUSED SPACE AT START
--->  
      VM_ALLOCATE              7ffffff6b000-7ffffff6c000 [    4K] r-x/r-x SM=ALI  

Thread 0::  Dispatch queue: com.apple.main-thread
0   libsystem_kernel.dylib        	    0x7ff818acf93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff818acfca8 mach_msg + 56
2   CoreFoundation                	    0x7ff818bd329d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff818bd1928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff818bd0d6c CFRunLoopRunSpecific + 562
5   HIToolbox                     	    0x7ff8218835e6 RunCurrentEventLoopInMode + 292
6   HIToolbox                     	    0x7ff82188334a ReceiveNextEventCommon + 594
7   HIToolbox                     	    0x7ff8218830e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
8   AppKit                        	    0x7ff81b60faa9 _DPSNextEvent + 927
9   AppKit                        	    0x7ff81b60e166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
10  AppKit                        	    0x7ff81b600818 -[NSApplication run] + 586
11  AppKit                        	    0x7ff81b5d479a NSApplicationMain + 817
12  SwiftUI                       	    0x7ff92412509c specialized runApp(_:) + 161
13  SwiftUI                       	    0x7ff924b87424 runApp<A>(_:) + 164
14  SwiftUI                       	    0x7ff92467fc5f static App.main() + 63
15  RedLemon                      	       0x10dbfb123 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
16  RedLemon                      	       0x10dbfb1a9 RedLemon_main + 9
17  dyld                          	       0x11fe1152e start + 462

Thread 1:
0   libsystem_pthread.dylib       	    0x7ff818b07f48 start_wqthread + 0

Thread 2:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff818acf93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff818acfca8 mach_msg + 56
2   CoreFoundation                	    0x7ff818bd329d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff818bd1928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff818bd0d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff81b77d572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff818b0c4e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff818b07f6b thread_start + 15

Thread 3:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff818acf93a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff818acfca8 mach_msg + 56
2   CoreFoundation                	    0x7ff818bd329d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff818bd1928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff818bd0d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff81d7ff964 0x7ff81d5b7000 + 2394468
6   Foundation                    	    0x7ff819a28724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff818b0c4e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff818b07f6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff818ad430e kevent + 10
1   RedLemon                      	       0x10d9e2209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10d9ec12f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10d9ec784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10d9e2ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10d9ec028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10d9c8af6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10d9c9b5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10d9baae2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10d9bab37 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff8260e572c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10d9ba9aa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10d9c730d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10d9c0c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10d9b54ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10d9b8914 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10d9ad4a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10d9ad4ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82dad4e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10d9ad449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10d9b456f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10d956288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10d9569da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10d95ccb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10d9ecb7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10d9ef6ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10d9ef7a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff818b0c4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff818b07f6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff818ad430e kevent + 10
1   RedLemon                      	       0x10d9e2209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10d9ec12f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10d9ec784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10d9e2ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10d9ec028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10d9c8af6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10d9c9b5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10d9baae2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10d9bab37 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff8260e572c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10d9ba9aa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10d9c730d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10d9c0c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10d9b54ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10d9b8914 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10d9ad4a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10d9ad4ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82dad4e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10d9ad449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10d9b456f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10d956288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10d9569da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10d95ccb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10d9ecb7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10d9ef6ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10d9ef7a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff818b0c4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff818b07f6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff818ad430e kevent + 10
1   RedLemon                      	       0x10d9e2209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10d9ec12f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10d9ec784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10d9e2ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10d9ec028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10d9c8af6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10d9c9b5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10d9baa23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10d9c730d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10d9c0c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10d9b54ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10d9b8914 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10d9ad4a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10d9ad4ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82dad4e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10d9ad449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10d9b456f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10d956288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10d9569da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10d95ccb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10d9ecb7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10d9ef6ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10d9ef7a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff818b0c4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff818b07f6b thread_start + 15

Thread 7:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff818ad430e kevent + 10
1   RedLemon                      	       0x10d9e2209 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10d9ec12f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10d9ec784 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10d9e2ebb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10d9ec028 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10d9c8af6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10d9c9b5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10d9baae2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x10d9bab37 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff8260e572c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10d9ba9aa Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x10d9c730d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x10d9c0c34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x10d9b54ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x10d9b8914 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10d9ad4a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x10d9ad4ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82dad4e7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10d9ad449 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x10d9b456f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x10d956288 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x10d9569da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x10d95ccb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10d9ecb7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10d9ef6ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x10d9ef7a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff818b0c4e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff818b07f6b thread_start + 15

Thread 8:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff818acf976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8189547ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff818954c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10d95f17f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10d96004e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10d9ecb7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10d9ef6ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10d9ef7a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff818b0c4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff818b07f6b thread_start + 15

Thread 9:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff818acf976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8189547ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff818954c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10d95f17f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10d96004e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10d9ecb7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10d9ef6ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10d9ef7a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff818b0c4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff818b07f6b thread_start + 15

Thread 10:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff818acf976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8189547ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff818954c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10d95f17f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10d96004e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10d9ecb7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10d9ef6ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10d9ef7a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff818b0c4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff818b07f6b thread_start + 15

Thread 11:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff818acf976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8189547ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff818954c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10d95f17f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10d96004e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10d9ecb7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10d9ef6ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10d9ef7a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff818b0c4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff818b07f6b thread_start + 15

Thread 12 Crashed::  Dispatch queue: com.apple.network.connections
0   libobjc.A.dylib               	    0x7ff8189a1e2f objc_release + 31
1   CFNetwork                     	    0x7ff81d5d990b 0x7ff81d5b7000 + 141579
2   CoreFoundation                	    0x7ff818ca0046 _CFRelease + 244
3   CFNetwork                     	    0x7ff81d5d8f37 0x7ff81d5b7000 + 139063
4   libsystem_blocks.dylib        	    0x7ff81883d654 _Block_release + 130
5   CFNetwork                     	    0x7ff81d7419b5 0x7ff81d5b7000 + 1616309
6   CFNetwork                     	    0x7ff81d73ffc7 0x7ff81d5b7000 + 1609671
7   libsystem_blocks.dylib        	    0x7ff81883d654 _Block_release + 130
8   libnetwork.dylib              	    0x7ff81ceb5209 nw_proxy_deallocate_options + 25
9   libnetwork.dylib              	    0x7ff81cbe489c -[NWConcrete_nw_protocol_options dealloc] + 44
10  libnetwork.dylib              	    0x7ff81d327f52 nw_array_dispose + 466
11  libnetwork.dylib              	    0x7ff81cbe4cb1 -[OS_nw_array dealloc] + 17
12  libnetwork.dylib              	    0x7ff81cbe3563 -[NWConcrete_nw_parameters .cxx_destruct] + 83
13  libobjc.A.dylib               	    0x7ff8189a9746 object_cxxDestructFromClass(objc_object*, objc_class*) + 83
14  libobjc.A.dylib               	    0x7ff8189a1f86 objc_destructInstance + 94
15  libobjc.A.dylib               	    0x7ff8189a1f1d _objc_rootDealloc + 62
16  libnetwork.dylib              	    0x7ff81cbe329d -[NWConcrete_nw_parameters dealloc] + 93
17  libobjc.A.dylib               	    0x7ff8189a9746 object_cxxDestructFromClass(objc_object*, objc_class*) + 83
18  libobjc.A.dylib               	    0x7ff8189a1f86 objc_destructInstance + 94
19  libobjc.A.dylib               	    0x7ff8189a1f1d _objc_rootDealloc + 62
20  libnetwork.dylib              	    0x7ff81cd2fbb7 -[NWConcrete_nw_path_evaluator dealloc] + 1111
21  libnetwork.dylib              	    0x7ff81cd3188a __nw_association_schedule_deactivation_block_invoke + 1322
22  libdispatch.dylib             	    0x7ff818954317 _dispatch_client_callout + 8
23  libdispatch.dylib             	    0x7ff818956d7c _dispatch_continuation_pop + 453
24  libdispatch.dylib             	    0x7ff818968208 _dispatch_source_invoke + 2179
25  libdispatch.dylib             	    0x7ff81895c0f6 _dispatch_workloop_invoke + 1987
26  libdispatch.dylib             	    0x7ff818964eee _dispatch_workloop_worker_thread + 753
27  libsystem_pthread.dylib       	    0x7ff818b08fd0 _pthread_wqthread + 326
28  libsystem_pthread.dylib       	    0x7ff818b07f57 start_wqthread + 15

Thread 13:
0   libsystem_pthread.dylib       	    0x7ff818b07f48 start_wqthread + 0


Thread 12 crashed with X86 Thread State (64-bit):
  rax: 0xa000000000000000  rbx: 0x00007fcd21282370  rcx: 0x0000000000000000  rdx: 0x00007fcd21282608
  rdi: 0x00007fcd203d4150  rsi: 0x0000000002d38e26  rbp: 0x000070000fbe23a0  rsp: 0x000070000fbe2388
   r8: 0x0000000000002020   r9: 0x0000000000000004  r10: 0x00007fcd20300000  r11: 0x00007fcd2037d790
  r12: 0x0000000100000000  r13: 0x00007fcd21282360  r14: 0x0000000000000149  r15: 0xffffffff00000000
  rip: 0x00007ff8189a1e2f  rfl: 0x0000000000010246  cr2: 0x0000000000000020
  
Logical CPU:     2
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
    0x7ff818ace000 -     0x7ff818b05fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff818b53000 -     0x7ff819055fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff821855000 -     0x7ff821b48fff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff81b5d1000 -     0x7ff81c460fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff9240a9000 -     0x7ff924f48fff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
       0x10cb58000 -        0x10e9bbfff com.redlemon.app (1.0.14) <4d6acfb5-abf0-3dbb-a1a0-c540a09d427d> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x11fe0c000 -        0x11fe77fff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff818b06000 -     0x7ff818b11fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff81d5b7000 -     0x7ff81da45fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff8199d0000 -     0x7ff819d8cfff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff825fca000 -     0x7ff826443fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff82dad4000 -     0x7ff82dad5fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff818951000 -     0x7ff818997fff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff818998000 -     0x7ff8189d2fff libobjc.A.dylib (*) <b36a2b52-68a9-3e44-b927-71c24be1272f> /usr/lib/libobjc.A.dylib
    0x7ff81883c000 -     0x7ff81883dfff libsystem_blocks.dylib (*) <f44f0d7c-74fd-37fd-8267-8d3aec7e7fb8> /usr/lib/system/libsystem_blocks.dylib
    0x7ff81cbc6000 -     0x7ff81d5b6fff libnetwork.dylib (*) <bab2b20a-67af-312c-9b68-f98e1930218e> /usr/lib/libnetwork.dylib
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
Writable regions: Total=238.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=238.0M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               384K        3 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                           304K        9 
CG raster data                      68K        8 
ColorSync                          228K       27 
CoreAnimation                      804K       23 
CoreGraphics                        12K        2 
CoreServices                       176K        1 
CoreUI image data                 1072K        8 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
Image IO                          1084K        5 
Kernel Alloc Once                    8K        1 
MALLOC                           128.8M      101 
MALLOC guard page                   48K       11 
SQLite page cache                 1024K       16 
STACK GUARD                       56.1M       14 
Stack                             14.6M       14 
VM_ALLOCATE                       12.1M       15 
__CTF                               756        1 
__DATA                            55.0M      599 
__DATA_CONST                      33.3M      409 
__DATA_DIRTY                      1651K      203 
__FONT_DATA                          4K        1 
__LINKEDIT                       706.1M       83 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           582.7M      608 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        13.6M       40 
mapped file                      335.0M       32 
shared memory                     9988K       22 
===========                     =======  ======= 
TOTAL                              2.0G     2270 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-11-24 07:54:45.00 -0500","app_version":"1.0.14","slice_uuid":"4d6acfb5-abf0-3dbb-a1a0-c540a09d427d","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"794A222F-BA1B-4C96-BB45-B16C1F7AD895","name":"RedLemon"}
{
  "uptime" : 1100,
  "procLaunch" : "2025-11-24 07:53:14.3719 -0500",
  "procRole" : "Background",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 1106556643926,
  "coalitionID" : 744,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-11-24 07:54:28.2724 -0500",
  "incident" : "794A222F-BA1B-4C96-BB45-B16C1F7AD895",
  "bug_type" : "309",
  "pid" : 7814,
  "procExitAbsTime" : 1180454614166,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7764A360-03CF-556A-8DDE-8EE8ACAE3933","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 7711,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 623,
  "responsibleProc" : "Electron",
  "sip" : "enabled",
  "vmRegionInfo" : "0x20 is not in any region.  Bytes before following region: 140737487744992\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      UNUSED SPACE AT START\n--->  \n      VM_ALLOCATE              7ffffff6b000-7ffffff6c000 [    4K] r-x\/r-x SM=ALI  ",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000020","rawCodes":[1,32],"type":"EXC_BAD_ACCESS","signal":"SIGSEGV","subtype":"KERN_INVALID_ADDRESS at 0x0000000000000020"},
  "termination" : {"flags":0,"code":11,"namespace":"SIGNAL","indicator":"Segmentation fault: 11","byProc":"exc handler","byPid":7814},
  "vmregioninfo" : "0x20 is not in any region.  Bytes before following region: 140737487744992\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      UNUSED SPACE AT START\n--->  \n      VM_ALLOCATE              7ffffff6b000-7ffffff6c000 [    4K] r-x\/r-x SM=ALI  ",
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 12,
  "threads" : [{"id":23398,"queue":"com.apple.main-thread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":2},{"imageOffset":189258,"symbol":"ReceiveNextEventCommon","symbolLocation":594,"imageIndex":2},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":2},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":3},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":3},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":3},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":3},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":4},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":4},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":4},{"imageOffset":17445155,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":5,"symbolLocation":35},{"imageOffset":17445289,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":5},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":6}]},{"id":23413,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":23428,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":23444,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":0},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":1},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":1},{"imageOffset":2394468,"imageIndex":8},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":9},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":23465,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15245833,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15286575,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15288196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15249083,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15286312,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15141622,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15145823,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15084258,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15084343,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":10},{"imageOffset":15083946,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15135501,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15109172,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15062254,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15075604,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15029410,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15029484,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":11},{"imageOffset":15029321,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15058287,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14672520,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14674394,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14699699,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15289215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15300335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15300521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":23466,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15245833,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15286575,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15288196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15249083,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15286312,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15141622,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15145823,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15084258,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15084343,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":10},{"imageOffset":15083946,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15135501,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15109172,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15062254,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15075604,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15029410,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15029484,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":11},{"imageOffset":15029321,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15058287,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14672520,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14674394,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14699699,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15289215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15300335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15300521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":23467,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15245833,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15286575,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15288196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15249083,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15286312,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15141622,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15145823,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15084067,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":467},{"imageOffset":15135501,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15109172,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15062254,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15075604,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15029410,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15029484,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":11},{"imageOffset":15029321,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15058287,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14672520,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14674394,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14699699,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15289215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15300335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15300521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":23468,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":0},{"imageOffset":15245833,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":5},{"imageOffset":15286575,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":95},{"imageOffset":15288196,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":5},{"imageOffset":15249083,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":5,"symbolLocation":395},{"imageOffset":15286312,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":5,"symbolLocation":312},{"imageOffset":15141622,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":230},{"imageOffset":15145823,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":5},{"imageOffset":15084258,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":50},{"imageOffset":15084343,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":5},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":10},{"imageOffset":15083946,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":5,"symbolLocation":346},{"imageOffset":15135501,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":1053},{"imageOffset":15109172,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":5,"symbolLocation":100},{"imageOffset":15062254,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":5,"symbolLocation":158},{"imageOffset":15075604,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":5},{"imageOffset":15029410,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":34},{"imageOffset":15029484,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":5},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":11},{"imageOffset":15029321,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":5,"symbolLocation":57},{"imageOffset":15058287,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":5,"symbolLocation":591},{"imageOffset":14672520,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":5,"symbolLocation":856},{"imageOffset":14674394,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":5,"symbolLocation":282},{"imageOffset":14699699,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":5},{"imageOffset":15289215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15300335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15300521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":23470,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14709119,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14712910,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15289215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15300335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15300521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":23471,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14709119,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14712910,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15289215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15300335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15300521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":23472,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14709119,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14712910,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15289215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15300335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15300521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":23473,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":12},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":12},{"imageOffset":14709119,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":5,"symbolLocation":143},{"imageOffset":14712910,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":5,"symbolLocation":222},{"imageOffset":15289215,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":5},{"imageOffset":15300335,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":5,"symbolLocation":1007},{"imageOffset":15300521,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"triggered":true,"id":23621,"instructionState":{"instructionStream":{"bytes":[72,137,194,72,193,234,55,116,52,72,137,194,72,1,202,114,18,240,72,15,177,23,116,37,168,1,117,228,49,246,233,120,211,1,0,49,246,233,231,129,0,0,72,185,248,255,255,255,255,127,0,0,72,33,200,246,64,28,1,116,223,72,137,248,195,72,133,255,116,118,137,248,131,224,1,72,133,192,117,108,72,139,7,72,185,248,255,255,255,255,127,0,0,72,33,193,72,139,81,32,246,194,4,116,84,168,1,116,114,72,185,0,0,0,0,0,0,128,0,72,186,0,0,0,0,0,0,0,1,72,57,200,114,54,72,137,198,72,41,214,114,23,240,72,15,177,55,116,34,168,1,117,232,49,246,186,1,0,0,0,233,134,207,1,0,72,133,200,117,61,72,139,53,8,195,141,65,255,37,202,98,230,63,72,57,206,114,238,195,102,131,121],"offset":96}},"threadState":{"r13":{"value":140519001301856},"rax":{"value":11529215046068469760},"rflags":{"value":66118},"cpu":{"value":2},"r14":{"value":329},"rsi":{"value":47418918},"r8":{"value":8224},"cr2":{"value":32},"rdx":{"value":140519001302536},"r10":{"value":140518985039872},"r9":{"value":4},"r15":{"value":18446744069414584320},"rbx":{"value":140519001301872},"trap":{"value":14,"description":"(no mapping for user data read)"},"err":{"value":4},"r11":{"value":140518985553808},"rip":{"value":140703541370415,"matchesCrashFrame":1},"rbp":{"value":123145566430112},"rsp":{"value":123145566430088},"r12":{"value":4294967296},"rcx":{"value":0},"flavor":"x86_THREAD_STATE","rdi":{"value":140518985908560}},"queue":"com.apple.network.connections","frames":[{"imageOffset":40495,"symbol":"objc_release","symbolLocation":31,"imageIndex":13},{"imageOffset":141579,"imageIndex":8},{"imageOffset":1364038,"symbol":"_CFRelease","symbolLocation":244,"imageIndex":1},{"imageOffset":139063,"imageIndex":8},{"imageOffset":5716,"symbol":"_Block_release","symbolLocation":130,"imageIndex":14},{"imageOffset":1616309,"imageIndex":8},{"imageOffset":1609671,"imageIndex":8},{"imageOffset":5716,"symbol":"_Block_release","symbolLocation":130,"imageIndex":14},{"imageOffset":3076617,"symbol":"nw_proxy_deallocate_options","symbolLocation":25,"imageIndex":15},{"imageOffset":125084,"symbol":"-[NWConcrete_nw_protocol_options dealloc]","symbolLocation":44,"imageIndex":15},{"imageOffset":7741266,"symbol":"nw_array_dispose","symbolLocation":466,"imageIndex":15},{"imageOffset":126129,"symbol":"-[OS_nw_array dealloc]","symbolLocation":17,"imageIndex":15},{"imageOffset":120163,"symbol":"-[NWConcrete_nw_parameters .cxx_destruct]","symbolLocation":83,"imageIndex":15},{"imageOffset":71494,"symbol":"object_cxxDestructFromClass(objc_object*, objc_class*)","symbolLocation":83,"imageIndex":13},{"imageOffset":40838,"symbol":"objc_destructInstance","symbolLocation":94,"imageIndex":13},{"imageOffset":40733,"symbol":"_objc_rootDealloc","symbolLocation":62,"imageIndex":13},{"imageOffset":119453,"symbol":"-[NWConcrete_nw_parameters dealloc]","symbolLocation":93,"imageIndex":15},{"imageOffset":71494,"symbol":"object_cxxDestructFromClass(objc_object*, objc_class*)","symbolLocation":83,"imageIndex":13},{"imageOffset":40838,"symbol":"objc_destructInstance","symbolLocation":94,"imageIndex":13},{"imageOffset":40733,"symbol":"_objc_rootDealloc","symbolLocation":62,"imageIndex":13},{"imageOffset":1481655,"symbol":"-[NWConcrete_nw_path_evaluator dealloc]","symbolLocation":1111,"imageIndex":15},{"imageOffset":1489034,"symbol":"__nw_association_schedule_deactivation_block_invoke","symbolLocation":1322,"imageIndex":15},{"imageOffset":13079,"symbol":"_dispatch_client_callout","symbolLocation":8,"imageIndex":12},{"imageOffset":23932,"symbol":"_dispatch_continuation_pop","symbolLocation":453,"imageIndex":12},{"imageOffset":94728,"symbol":"_dispatch_source_invoke","symbolLocation":2179,"imageIndex":12},{"imageOffset":45302,"symbol":"_dispatch_workloop_invoke","symbolLocation":1987,"imageIndex":12},{"imageOffset":81646,"symbol":"_dispatch_workloop_worker_thread","symbolLocation":753,"imageIndex":12},{"imageOffset":12240,"symbol":"_pthread_wqthread","symbolLocation":326,"imageIndex":7},{"imageOffset":8023,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":7}]},{"id":24083,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703542599680,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703543144448,
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
    "base" : 140703691001856,
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
    "base" : 140703587700736,
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
    "base" : 140708028256256,
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
    "base" : 4508188672,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 31866880,
    "uuid" : "4d6acfb5-abf0-3dbb-a1a0-c540a09d427d",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4829790208,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703542829056,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703621148672,
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
    "base" : 140703558336512,
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
    "base" : 140703765929984,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703894945792,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703541039104,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703541329920,
    "size" : 241664,
    "uuid" : "b36a2b52-68a9-3e44-b927-71c24be1272f",
    "path" : "\/usr\/lib\/libobjc.A.dylib",
    "name" : "libobjc.A.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703539904512,
    "size" : 8192,
    "uuid" : "f44f0d7c-74fd-37fd-8267-8d3aec7e7fb8",
    "path" : "\/usr\/lib\/system\/libsystem_blocks.dylib",
    "name" : "libsystem_blocks.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703610724352,
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
  "base" : 140703539568640,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=238.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=238.0M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               384K        3 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                           304K        9 \nCG raster data                      68K        8 \nColorSync                          228K       27 \nCoreAnimation                      804K       23 \nCoreGraphics                        12K        2 \nCoreServices                       176K        1 \nCoreUI image data                 1072K        8 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nImage IO                          1084K        5 \nKernel Alloc Once                    8K        1 \nMALLOC                           128.8M      101 \nMALLOC guard page                   48K       11 \nSQLite page cache                 1024K       16 \nSTACK GUARD                       56.1M       14 \nStack                             14.6M       14 \nVM_ALLOCATE                       12.1M       15 \n__CTF                               756        1 \n__DATA                            55.0M      599 \n__DATA_CONST                      33.3M      409 \n__DATA_DIRTY                      1651K      203 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       706.1M       83 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           582.7M      608 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      335.0M       32 \nshared memory                     9988K       22 \n===========                     =======  ======= \nTOTAL                              2.0G     2270 \n",
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
