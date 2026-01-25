-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [5143]
Path:                  /Applications/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.147 (147)
Code Type:             X86-64 (Native)
Parent Process:        launchd [1]
User ID:               501

Date/Time:             2026-01-24 21:04:25.8314 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA


Time Awake Since Boot: 35000 seconds

System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 4 Illegal instruction: 4
Terminating Process:   exc handler [5143]

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   libswiftCore.dylib            	    0x7ff81a03d245 _assertionFailure(_:_:file:line:flags:) + 421
1   RedLemon                      	       0x10cedbea9 closure #1 in LoggingSystem.FactoryBox.replaceFactory(_:validate:) + 585 (Logging.swift:754)
2   RedLemon                      	       0x10ceeba0c partial apply for closure #1 in LoggingSystem.FactoryBox.replaceFactory(_:validate:) + 28
3   RedLemon                      	       0x10ced82e4 ReadWriteLock.withWriterLock<A>(_:) + 84 (Locks.swift:273)
4   RedLemon                      	       0x10cedb413 LoggingSystem.FactoryBox.replaceFactory(_:validate:) + 179 (Logging.swift:753)
5   RedLemon                      	       0x10cedb2bc static LoggingSystem.bootstrap(_:) + 124 (Logging.swift:679)
6   RedLemon                      	       0x10ee58aa1 static LoggingSystem.bootstrap(from:_:) + 113 (LoggingSystem+Environment.swift:9)
7   RedLemon                      	       0x10ee58de6 static LoggingSystem.bootstrap(from:) + 38 (LoggingSystem+Environment.swift:13)
8   RedLemon                      	       0x10eb43583 HTTPServer.init() + 291 (HTTPServer.swift:17)
9   RedLemon                      	       0x10eb4342c HTTPServer.__allocating_init() + 44
10  RedLemon                      	       0x10d7b826b (1) suspend resume partial function for RedLemonApp.startServer() + 603 (RedLemonApp.swift:253)
11  RedLemon                      	       0x10d7ad701 (12) await resume partial function for closure #1 in closure #1 in RedLemonApp.body.getter + 1 (RedLemonApp.swift:94)
12  RedLemon                      	       0x10d7bdf31 (1) await resume partial function for partial apply for closure #1 in closure #1 in RedLemonApp.body.getter + 1

Thread 1:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff80cb1093a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80cb10ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80cc1429d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80cc12928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80cc11d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff80f7be572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff80cb4d4e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff80cb48f6b thread_start + 15

Thread 2:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff80cb1093a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff80cb10ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff80cc1429d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff80cc12928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff80cc11d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff811840964 0x7ff8115f8000 + 2394468
6   Foundation                    	    0x7ff80da69724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff80cb4d4e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff80cb48f6b thread_start + 15

Thread 3:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff80cb1530e kevent + 10
1   RedLemon                      	       0x10d4ee409 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10d4f832f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10d4f8984 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10d4ef0bb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10d4f8228 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10d4d4cf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10d4d5d5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10d4c6c23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10d4d350d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10d4cce34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10d4c16ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10d4c4b14 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10d4b96a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10d4b96ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff821b15e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10d4b9649 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10d4c076f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10d462488 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10d462bda closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10d468eb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10d4f8d7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10d4fb8ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10d4fb9a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80cb4d4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80cb48f6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff80cb1530e kevent + 10
1   RedLemon                      	       0x10d4ee409 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10d4f832f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10d4f8984 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10d4ef0bb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10d4f8228 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10d4d4cf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10d4d5d5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10d4c6c23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10d4d350d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10d4cce34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10d4c16ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10d4c4b14 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10d4b96a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10d4b96ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff821b15e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10d4b9649 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10d4c076f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10d462488 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10d462bda closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10d468eb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10d4f8d7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10d4fb8ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10d4fb9a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80cb4d4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80cb48f6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff80cb1530e kevent + 10
1   RedLemon                      	       0x10d4ee409 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10d4f832f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10d4f8984 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10d4ef0bb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10d4f8228 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10d4d4cf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10d4d5d5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10d4c6c23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10d4d350d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10d4cce34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10d4c16ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10d4c4b14 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10d4b96a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10d4b96ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff821b15e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10d4b9649 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10d4c076f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10d462488 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10d462bda closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10d468eb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10d4f8d7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10d4fb8ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10d4fb9a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80cb4d4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80cb48f6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff80cb1530e kevent + 10
1   RedLemon                      	       0x10d4ee409 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10d4f832f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10d4f8984 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10d4ef0bb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10d4f8228 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10d4d4cf6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10d4d5d5f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10d4c6c23 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10d4d350d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10d4cce34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10d4c16ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10d4c4b14 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10d4b96a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10d4b96ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff821b15e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10d4b9649 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10d4c076f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10d462488 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10d462bda closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10d468eb3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10d4f8d7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10d4fb8ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10d4fb9a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff80cb4d4e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff80cb48f6b thread_start + 15

Thread 7:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff80cb10976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c9957ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c995c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10d46b37f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10d46c24e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10d4f8d7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10d4fb8ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10d4fb9a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80cb4d4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80cb48f6b thread_start + 15

Thread 8:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff80cb10976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c9957ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c995c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10d46b37f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10d46c24e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10d4f8d7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10d4fb8ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10d4fb9a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80cb4d4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80cb48f6b thread_start + 15

Thread 9:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff80cb10976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c9957ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c995c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10d46b37f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10d46c24e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10d4f8d7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10d4fb8ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10d4fb9a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80cb4d4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80cb48f6b thread_start + 15

Thread 10:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff80cb10976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80c9957ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80c995c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10d46b37f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10d46c24e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10d4f8d7f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10d4fb8ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10d4fb9a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff80cb4d4e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff80cb48f6b thread_start + 15

Thread 11:
0   libsystem_pthread.dylib       	    0x7ff80cb48f48 start_wqthread + 0

Thread 12:
0   libsystem_pthread.dylib       	    0x7ff80cb48f48 start_wqthread + 0

Thread 13::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libswiftCore.dylib            	    0x7ff81a348cc0 swift_unknownObjectRetain + 32
1   libswiftFoundation.dylib      	    0x7ff81e3d9182 specialized static Dictionary._conditionallyBridgeFromObjectiveC(_:result:) + 466
2   libswiftCore.dylib            	    0x7ff81a303e39 _tryCastFromClassToObjCBridgeable(swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, void*, swift::TargetMetadata<swift::InProcess> const*&, swift::TargetMetadata<swift::InProcess> const*&, bool, bool, _ObjectiveCBridgeableWitnessTable const*, swift::TargetMetadata<swift::InProcess> const*) + 153
3   libswiftCore.dylib            	    0x7ff81a302a41 tryCast(swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::TargetMetadata<swift::InProcess> const*&, swift::TargetMetadata<swift::InProcess> const*&, bool, bool) + 2273
4   libswiftCore.dylib            	    0x7ff81a302602 tryCast(swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::TargetMetadata<swift::InProcess> const*&, swift::TargetMetadata<swift::InProcess> const*&, bool, bool) + 1186
5   libswiftCore.dylib            	    0x7ff81a302602 tryCast(swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::TargetMetadata<swift::InProcess> const*&, swift::TargetMetadata<swift::InProcess> const*&, bool, bool) + 1186
6   libswiftCore.dylib            	    0x7ff81a30202c swift_dynamicCast + 156
7   libswiftFoundation.dylib      	    0x7ff81e4a467e __JSONDecoder.container<A>(keyedBy:) + 446
8   libswiftFoundation.dylib      	    0x7ff81e4a4ba0 protocol witness for Decoder.container<A>(keyedBy:) in conformance __JSONDecoder + 16
9   libswiftCore.dylib            	    0x7ff81a2cf668 dispatch thunk of Decoder.container<A>(keyedBy:) + 8
10  RedLemon                      	       0x10ea0971b MediaItem.init(from:) + 347
11  RedLemon                      	       0x10ea0a9f0 protocol witness for Decodable.init(from:) in conformance MediaItem + 32
12  libswiftCore.dylib            	    0x7ff81a2cf5e7 dispatch thunk of Decodable.init(from:) + 7
13  libswiftFoundation.dylib      	    0x7ff81e349ebd _JSONUnkeyedDecodingContainer.decode<A>(_:) + 2493
14  libswiftFoundation.dylib      	    0x7ff81e4ad769 protocol witness for UnkeyedDecodingContainer.decode<A>(_:) in conformance _JSONUnkeyedDecodingContainer + 9
15  libswiftCore.dylib            	    0x7ff81a06901d Array<A>.init(from:) + 365
16  libswiftCore.dylib            	    0x7ff81a0690d6 protocol witness for Decodable.init(from:) in conformance <A> [A] + 22
17  libswiftCore.dylib            	    0x7ff81a2cf5e7 dispatch thunk of Decodable.init(from:) + 7
18  libswiftFoundation.dylib      	    0x7ff81e4b063e __JSONDecoder.unbox_(_:as:) + 1262
19  libswiftFoundation.dylib      	    0x7ff81e4a9e1b _JSONKeyedDecodingContainer.decode<A>(_:forKey:) + 571
20  libswiftFoundation.dylib      	    0x7ff81e4abe9d protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance _JSONKeyedDecodingContainer<A> + 45
21  libswiftFoundation.dylib      	    0x7ff81e349108 protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance _JSONKeyedDecodingContainer<A> + 24
22  libswiftCore.dylib            	    0x7ff81a05e719 _KeyedDecodingContainerBox.decode<A, B>(_:forKey:) + 249
23  libswiftCore.dylib            	    0x7ff81a0552a7 KeyedDecodingContainer.decode<A>(_:forKey:) + 39
24  RedLemon                      	       0x10ece5f77 EventsConfigData.init(from:) + 359
25  RedLemon                      	       0x10ece65a7 protocol witness for Decodable.init(from:) in conformance EventsConfigData + 23
26  libswiftCore.dylib            	    0x7ff81a2cf5e7 dispatch thunk of Decodable.init(from:) + 7
27  libswiftFoundation.dylib      	    0x7ff81e4b063e __JSONDecoder.unbox_(_:as:) + 1262
28  libswiftFoundation.dylib      	    0x7ff81e4a9e1b _JSONKeyedDecodingContainer.decode<A>(_:forKey:) + 571
29  libswiftFoundation.dylib      	    0x7ff81e4abe9d protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance _JSONKeyedDecodingContainer<A> + 45
30  libswiftFoundation.dylib      	    0x7ff81e349108 protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance _JSONKeyedDecodingContainer<A> + 24
31  libswiftCore.dylib            	    0x7ff81a05e719 _KeyedDecodingContainerBox.decode<A, B>(_:forKey:) + 249
32  libswiftCore.dylib            	    0x7ff81a0552a7 KeyedDecodingContainer.decode<A>(_:forKey:) + 39
33  RedLemon                      	       0x10ece4726 SupabaseEventsConfig.init(from:) + 918
34  RedLemon                      	       0x10ece4e5f protocol witness for Decodable.init(from:) in conformance SupabaseEventsConfig + 15
35  libswiftCore.dylib            	    0x7ff81a2cf5e7 dispatch thunk of Decodable.init(from:) + 7
36  libswiftFoundation.dylib      	    0x7ff81e349ebd _JSONUnkeyedDecodingContainer.decode<A>(_:) + 2493
37  libswiftFoundation.dylib      	    0x7ff81e4ad769 protocol witness for UnkeyedDecodingContainer.decode<A>(_:) in conformance _JSONUnkeyedDecodingContainer + 9
38  libswiftCore.dylib            	    0x7ff81a06901d Array<A>.init(from:) + 365
39  libswiftCore.dylib            	    0x7ff81a0690d6 protocol witness for Decodable.init(from:) in conformance <A> [A] + 22
40  libswiftCore.dylib            	    0x7ff81a2cf5e7 dispatch thunk of Decodable.init(from:) + 7
41  libswiftFoundation.dylib      	    0x7ff81e4b063e __JSONDecoder.unbox_(_:as:) + 1262
42  libswiftFoundation.dylib      	    0x7ff81e4a4105 JSONDecoder.decode<A>(_:from:) + 1061
43  libswiftFoundation.dylib      	    0x7ff81e347e1f dispatch thunk of JSONDecoder.decode<A>(_:from:) + 15
44  RedLemon                      	       0x10ecdb91d (3) suspend resume partial function for EventsConfigService.fetchFromSupabase(type:) + 1453 (EventsConfigService.swift:313)
45  RedLemon                      	       0x10ecd6ff1 (2) await resume partial function for EventsConfigService.fetchConfig(type:) + 1 (EventsConfigService.swift:217)
46  RedLemon                      	       0x10ecccf61 (2) await resume partial function for EventsConfigService.fetchMovieEventsConfig() + 1 (EventsConfigService.swift:25)
47  RedLemon                      	       0x10e8f5f81 (2) await resume partial function for SocialService.validateRoomJoinability(userId:roomId:) + 1 (SocialService.swift:300)
48  RedLemon                      	       0x10e8f5931 (2) await resume partial function for closure #3 in SocialService.recalculateUserActivity(userId:) + 1 (SocialService.swift:278)

Thread 14:
0   libsystem_pthread.dylib       	    0x7ff80cb48f48 start_wqthread + 0

Thread 15:
0   libsystem_pthread.dylib       	    0x7ff80cb48f48 start_wqthread + 0

Thread 16:
0   libsystem_pthread.dylib       	    0x7ff80cb48f48 start_wqthread + 0

Thread 17:
0   libsystem_pthread.dylib       	    0x7ff80cb48f48 start_wqthread + 0

Thread 18:
0   libsystem_pthread.dylib       	    0x7ff80cb48f48 start_wqthread + 0


Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x00000000e9e18043  rbx: 0x000000010efd1330  rcx: 0x00000000e9e18043  rdx: 0x00000000ea0188c2
  rdi: 0x800000010eff3b90  rsi: 0x000060000296bc50  rbp: 0x00007ff7b3896180  rsp: 0x00007ff7b3896130
   r8: 0x0000000000003c50   r9: 0x0000000000000050  r10: 0x00000000000007fb  r11: 0x00000000000000cb
  r12: 0x0000000000000038  r13: 0x00000000000002f2  r14: 0x800000010eff3b90  r15: 0x0000000000000013
  rip: 0x00007ff81a03d245  rfl: 0x0000000000010286  cr2: 0x0000000000000000
  
Logical CPU:     0
Error Code:      0x00000000 
Trap Number:     6

Thread 0 instruction stream:
  00 00 48 b8 00 00 00 00-00 00 00 10 49 85 c4 0f  ..H.........I...
  84 c0 01 00 00 48 83 c0-ff 4c 89 f7 48 21 c7 48  .....H...L..H!.H
  83 c7 20 48 b8 ff ff ff-ff ff ff 00 00 49 21 c4  .. H.........I!.
  48 83 ec 08 44 0f b6 45-18 4c 89 e6 48 8b 55 d0  H...D..E.L..H.U.
  48 8b 4d 10 49 89 d9 8b-45 28 50 41 55 41 57 e8  H.M.I...E(PAUAW.
  17 12 00 00 48 83 c4 20-4c 89 f7 e8 fb bc 30 00  ....H.. L.....0.
 [0f]0b 48 83 ec 08 48 8d-05 8e b1 41 00 48 8d 3d  ..H...H....A.H.=	<==
  5b ac 41 00 48 8d 0d 70-af 41 00 be 0b 00 00 00  [.A.H..p.A......
  41 b8 39 00 00 00 ba 02-00 00 00 41 b9 02 00 00  A.9........A....
  00 6a 01 68 94 00 00 00-6a 02 6a 18 50 e8 b9 02  .j.h....j.j.P...
  00 00 48 83 ec 08 48 8d-05 6e ac 41 00 48 8d 3d  ..H...H..n.A.H.=
  1b ac 41 00 48 8d 0d 30-ac 41 00 be 0b 00 00 00  ..A.H..0.A......

Binary Images:
    0x7ff81a00b000 -     0x7ff81a484fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
       0x10c667000 -        0x10f36afff com.redlemon.app (1.0.147) <c23574f1-3270-3413-ab94-cbec6ec3bf86> /Applications/RedLemon.app/Contents/MacOS/RedLemon
    0x7ff80cb0f000 -     0x7ff80cb46fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff80cb94000 -     0x7ff80d096fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff80f612000 -     0x7ff8104a1fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff80cb47000 -     0x7ff80cb52fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff8115f8000 -     0x7ff811a86fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff80da11000 -     0x7ff80ddcdfff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff821b15000 -     0x7ff821b16fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff80c992000 -     0x7ff80c9d8fff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff81e345000 -     0x7ff81e692fff libswiftFoundation.dylib (*) <1f21009f-9aa8-36c0-9abe-87db68540481> /usr/lib/swift/libswiftFoundation.dylib

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
Writable regions: Total=677.2M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=677.2M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               384K        3 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                           308K       11 
CG raster data                     212K       14 
ColorSync                          232K       28 
CoreAnimation                     1812K       45 
CoreGraphics                        12K        2 
CoreUI image data                  788K        7 
Foundation                          16K        1 
IOKit                             7940K        1 
Image IO                          2200K        3 
Kernel Alloc Once                    8K        1 
MALLOC                           356.9M      101 
MALLOC guard page                   48K       10 
MALLOC_NANO (reserved)           256.0M        1         reserved VM address space (unallocated)
SQLite page cache                  320K        5 
STACK GUARD                       56.1M       19 
Stack                             17.1M       19 
VM_ALLOCATE                       3808K       15 
__CTF                               756        1 
__DATA                            55.2M      608 
__DATA_CONST                      33.5M      413 
__DATA_DIRTY                      1669K      207 
__FONT_DATA                          4K        1 
__LINKEDIT                       735.5M       82 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           597.8M      612 
__UNICODE                          592K        1 
dyld private memory               1024K        1 
libnetwork                        14.8M       56 
mapped file                      164.4M       33 
shared memory                     2824K       20 
===========                     =======  ======= 
TOTAL                              2.3G     2329 
TOTAL, minus reserved VM space     2.1G     2329 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2026-01-24 21:04:51.00 -0500","app_version":"1.0.147","slice_uuid":"c23574f1-3270-3413-ab94-cbec6ec3bf86","build_version":"147","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"33B0CF8B-C1EB-4909-A955-EF992F62C682","name":"RedLemon"}
{
  "uptime" : 35000,
  "procLaunch" : "2026-01-24 21:00:40.1379 -0500",
  "procRole" : "Background",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 35037056791734,
  "coalitionID" : 4333,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2026-01-24 21:04:25.8314 -0500",
  "incident" : "33B0CF8B-C1EB-4909-A955-EF992F62C682",
  "bug_type" : "309",
  "pid" : 5143,
  "procExitAbsTime" : 35262671150853,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Applications\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.147","CFBundleVersion":"147","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "launchd",
  "parentPid" : 1,
  "coalitionName" : "com.redlemon.app",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_INSTRUCTION","signal":"SIGILL"},
  "termination" : {"flags":0,"code":4,"namespace":"SIGNAL","indicator":"Illegal instruction: 4","byProc":"exc handler","byPid":5143},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 0,
  "threads" : [{"triggered":true,"id":564723,"instructionState":{"instructionStream":{"bytes":[0,0,72,184,0,0,0,0,0,0,0,16,73,133,196,15,132,192,1,0,0,72,131,192,255,76,137,247,72,33,199,72,131,199,32,72,184,255,255,255,255,255,255,0,0,73,33,196,72,131,236,8,68,15,182,69,24,76,137,230,72,139,85,208,72,139,77,16,73,137,217,139,69,40,80,65,85,65,87,232,23,18,0,0,72,131,196,32,76,137,247,232,251,188,48,0,15,11,72,131,236,8,72,141,5,142,177,65,0,72,141,61,91,172,65,0,72,141,13,112,175,65,0,190,11,0,0,0,65,184,57,0,0,0,186,2,0,0,0,65,185,2,0,0,0,106,1,104,148,0,0,0,106,2,106,24,80,232,185,2,0,0,72,131,236,8,72,141,5,110,172,65,0,72,141,61,27,172,65,0,72,141,13,48,172,65,0,190,11,0,0,0],"offset":96}},"threadState":{"r13":{"value":754},"rax":{"value":3923869763},"rflags":{"value":66182},"cpu":{"value":0},"r14":{"value":9223372041401351056},"rsi":{"value":105553159699536},"r8":{"value":15440},"cr2":{"value":0},"rdx":{"value":3925969090},"r10":{"value":2043},"r9":{"value":80},"r15":{"value":19},"rbx":{"value":4546433840},"trap":{"value":6},"err":{"value":0},"r11":{"value":203},"rip":{"value":140703565075013,"matchesCrashFrame":1},"rbp":{"value":140701845774720},"rsp":{"value":140701845774640},"r12":{"value":56},"rcx":{"value":3923869763},"flavor":"x86_THREAD_STATE","rdi":{"value":9223372041401351056}},"queue":"com.apple.main-thread","frames":[{"imageOffset":205381,"symbol":"_assertionFailure(_:_:file:line:flags:)","symbolLocation":421,"imageIndex":0},{"imageOffset":8867497,"sourceLine":754,"sourceFile":"Logging.swift","symbol":"closure #1 in LoggingSystem.FactoryBox.replaceFactory(_:validate:)","imageIndex":1,"symbolLocation":585},{"imageOffset":8931852,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in LoggingSystem.FactoryBox.replaceFactory(_:validate:)","symbolLocation":28,"imageIndex":1},{"imageOffset":8852196,"sourceLine":273,"sourceFile":"Locks.swift","symbol":"ReadWriteLock.withWriterLock<A>(_:)","imageIndex":1,"symbolLocation":84},{"imageOffset":8864787,"sourceLine":753,"sourceFile":"Logging.swift","symbol":"LoggingSystem.FactoryBox.replaceFactory(_:validate:)","imageIndex":1,"symbolLocation":179},{"imageOffset":8864444,"sourceLine":679,"sourceFile":"Logging.swift","symbol":"static LoggingSystem.bootstrap(_:)","imageIndex":1,"symbolLocation":124},{"imageOffset":41884321,"sourceLine":9,"sourceFile":"LoggingSystem+Environment.swift","symbol":"static LoggingSystem.bootstrap(from:_:)","imageIndex":1,"symbolLocation":113},{"imageOffset":41885158,"sourceLine":13,"sourceFile":"LoggingSystem+Environment.swift","symbol":"static LoggingSystem.bootstrap(from:)","imageIndex":1,"symbolLocation":38},{"imageOffset":38651267,"sourceLine":17,"sourceFile":"HTTPServer.swift","symbol":"HTTPServer.init()","imageIndex":1,"symbolLocation":291},{"imageOffset":38650924,"sourceFile":"HTTPServer.swift","symbol":"HTTPServer.__allocating_init()","symbolLocation":44,"imageIndex":1},{"imageOffset":18158187,"sourceLine":253,"sourceFile":"RedLemonApp.swift","symbol":"(1) suspend resume partial function for RedLemonApp.startServer()","imageIndex":1,"symbolLocation":603},{"imageOffset":18114305,"sourceLine":94,"sourceFile":"RedLemonApp.swift","symbol":"(12) await resume partial function for closure #1 in closure #1 in RedLemonApp.body.getter","imageIndex":1,"symbolLocation":1},{"imageOffset":18181937,"sourceFile":"<compiler-generated>","symbol":"(1) await resume partial function for partial apply for closure #1 in closure #1 in RedLemonApp.body.getter","symbolLocation":1,"imageIndex":1}]},{"id":564784,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":2},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":2},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":3},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":564831,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":2},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":2},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":3},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":2394468,"imageIndex":6},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":7},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":564832,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":2},{"imageOffset":15234057,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":1},{"imageOffset":15274799,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":95},{"imageOffset":15276420,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":1},{"imageOffset":15237307,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":1,"symbolLocation":395},{"imageOffset":15274536,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":312},{"imageOffset":15129846,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":230},{"imageOffset":15134047,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":1},{"imageOffset":15072291,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":1,"symbolLocation":467},{"imageOffset":15123725,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":1053},{"imageOffset":15097396,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":100},{"imageOffset":15050478,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":1,"symbolLocation":158},{"imageOffset":15063828,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":1},{"imageOffset":15017634,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":34},{"imageOffset":15017708,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":1},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":8},{"imageOffset":15017545,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":57},{"imageOffset":15046511,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":1,"symbolLocation":591},{"imageOffset":14660744,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":1,"symbolLocation":856},{"imageOffset":14662618,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":1,"symbolLocation":282},{"imageOffset":14687923,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":1},{"imageOffset":15277439,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288559,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288745,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":564833,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":2},{"imageOffset":15234057,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":1},{"imageOffset":15274799,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":95},{"imageOffset":15276420,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":1},{"imageOffset":15237307,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":1,"symbolLocation":395},{"imageOffset":15274536,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":312},{"imageOffset":15129846,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":230},{"imageOffset":15134047,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":1},{"imageOffset":15072291,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":1,"symbolLocation":467},{"imageOffset":15123725,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":1053},{"imageOffset":15097396,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":100},{"imageOffset":15050478,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":1,"symbolLocation":158},{"imageOffset":15063828,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":1},{"imageOffset":15017634,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":34},{"imageOffset":15017708,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":1},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":8},{"imageOffset":15017545,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":57},{"imageOffset":15046511,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":1,"symbolLocation":591},{"imageOffset":14660744,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":1,"symbolLocation":856},{"imageOffset":14662618,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":1,"symbolLocation":282},{"imageOffset":14687923,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":1},{"imageOffset":15277439,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288559,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288745,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":564834,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":2},{"imageOffset":15234057,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":1},{"imageOffset":15274799,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":95},{"imageOffset":15276420,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":1},{"imageOffset":15237307,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":1,"symbolLocation":395},{"imageOffset":15274536,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":312},{"imageOffset":15129846,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":230},{"imageOffset":15134047,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":1},{"imageOffset":15072291,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":1,"symbolLocation":467},{"imageOffset":15123725,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":1053},{"imageOffset":15097396,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":100},{"imageOffset":15050478,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":1,"symbolLocation":158},{"imageOffset":15063828,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":1},{"imageOffset":15017634,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":34},{"imageOffset":15017708,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":1},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":8},{"imageOffset":15017545,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":57},{"imageOffset":15046511,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":1,"symbolLocation":591},{"imageOffset":14660744,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":1,"symbolLocation":856},{"imageOffset":14662618,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":1,"symbolLocation":282},{"imageOffset":14687923,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":1},{"imageOffset":15277439,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288559,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288745,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":564835,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":2},{"imageOffset":15234057,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":1},{"imageOffset":15274799,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":95},{"imageOffset":15276420,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":1},{"imageOffset":15237307,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":1,"symbolLocation":395},{"imageOffset":15274536,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":1,"symbolLocation":312},{"imageOffset":15129846,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":230},{"imageOffset":15134047,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":1},{"imageOffset":15072291,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":1,"symbolLocation":467},{"imageOffset":15123725,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":1053},{"imageOffset":15097396,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":1,"symbolLocation":100},{"imageOffset":15050478,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":1,"symbolLocation":158},{"imageOffset":15063828,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":1},{"imageOffset":15017634,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":34},{"imageOffset":15017708,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":1},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":8},{"imageOffset":15017545,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":1,"symbolLocation":57},{"imageOffset":15046511,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":1,"symbolLocation":591},{"imageOffset":14660744,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":1,"symbolLocation":856},{"imageOffset":14662618,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":1,"symbolLocation":282},{"imageOffset":14687923,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":1},{"imageOffset":15277439,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288559,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288745,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":564836,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":2},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14697343,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":1,"symbolLocation":143},{"imageOffset":14701134,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":1,"symbolLocation":222},{"imageOffset":15277439,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288559,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288745,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":564837,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":2},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14697343,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":1,"symbolLocation":143},{"imageOffset":14701134,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":1,"symbolLocation":222},{"imageOffset":15277439,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288559,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288745,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":564838,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":2},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14697343,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":1,"symbolLocation":143},{"imageOffset":14701134,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":1,"symbolLocation":222},{"imageOffset":15277439,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288559,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288745,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":564839,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":2},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14697343,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":1,"symbolLocation":143},{"imageOffset":14701134,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":1,"symbolLocation":222},{"imageOffset":15277439,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":1},{"imageOffset":15288559,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":1,"symbolLocation":1007},{"imageOffset":15288745,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":566473,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"id":566543,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"id":566550,"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":3398848,"symbol":"swift_unknownObjectRetain","symbolLocation":32,"imageIndex":0},{"imageOffset":606594,"symbol":"specialized static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)","symbolLocation":466,"imageIndex":10},{"imageOffset":3116601,"symbol":"_tryCastFromClassToObjCBridgeable(swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, void*, swift::TargetMetadata<swift::InProcess> const*&, swift::TargetMetadata<swift::InProcess> const*&, bool, bool, _ObjectiveCBridgeableWitnessTable const*, swift::TargetMetadata<swift::InProcess> const*)","symbolLocation":153,"imageIndex":0},{"imageOffset":3111489,"symbol":"tryCast(swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::TargetMetadata<swift::InProcess> const*&, swift::TargetMetadata<swift::InProcess> const*&, bool, bool)","symbolLocation":2273,"imageIndex":0},{"imageOffset":3110402,"symbol":"tryCast(swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::TargetMetadata<swift::InProcess> const*&, swift::TargetMetadata<swift::InProcess> const*&, bool, bool)","symbolLocation":1186,"imageIndex":0},{"imageOffset":3110402,"symbol":"tryCast(swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*, swift::TargetMetadata<swift::InProcess> const*&, swift::TargetMetadata<swift::InProcess> const*&, bool, bool)","symbolLocation":1186,"imageIndex":0},{"imageOffset":3108908,"symbol":"swift_dynamicCast","symbolLocation":156,"imageIndex":0},{"imageOffset":1439358,"symbol":"__JSONDecoder.container<A>(keyedBy:)","symbolLocation":446,"imageIndex":10},{"imageOffset":1440672,"symbol":"protocol witness for Decoder.container<A>(keyedBy:) in conformance __JSONDecoder","symbolLocation":16,"imageIndex":10},{"imageOffset":2901608,"symbol":"dispatch thunk of Decoder.container<A>(keyedBy:)","symbolLocation":8,"imageIndex":0},{"imageOffset":37365531,"sourceFile":"<compiler-generated>","symbol":"MediaItem.init(from:)","symbolLocation":347,"imageIndex":1},{"imageOffset":37370352,"sourceFile":"<compiler-generated>","symbol":"protocol witness for Decodable.init(from:) in conformance MediaItem","symbolLocation":32,"imageIndex":1},{"imageOffset":2901479,"symbol":"dispatch thunk of Decodable.init(from:)","symbolLocation":7,"imageIndex":0},{"imageOffset":20157,"symbol":"_JSONUnkeyedDecodingContainer.decode<A>(_:)","symbolLocation":2493,"imageIndex":10},{"imageOffset":1476457,"symbol":"protocol witness for UnkeyedDecodingContainer.decode<A>(_:) in conformance _JSONUnkeyedDecodingContainer","symbolLocation":9,"imageIndex":10},{"imageOffset":385053,"symbol":"Array<A>.init(from:)","symbolLocation":365,"imageIndex":0},{"imageOffset":385238,"symbol":"protocol witness for Decodable.init(from:) in conformance <A> [A]","symbolLocation":22,"imageIndex":0},{"imageOffset":2901479,"symbol":"dispatch thunk of Decodable.init(from:)","symbolLocation":7,"imageIndex":0},{"imageOffset":1488446,"symbol":"__JSONDecoder.unbox_(_:as:)","symbolLocation":1262,"imageIndex":10},{"imageOffset":1461787,"symbol":"_JSONKeyedDecodingContainer.decode<A>(_:forKey:)","symbolLocation":571,"imageIndex":10},{"imageOffset":1470109,"symbol":"protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance _JSONKeyedDecodingContainer<A>","symbolLocation":45,"imageIndex":10},{"imageOffset":16648,"symbol":"protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance _JSONKeyedDecodingContainer<A>","symbolLocation":24,"imageIndex":10},{"imageOffset":341785,"symbol":"_KeyedDecodingContainerBox.decode<A, B>(_:forKey:)","symbolLocation":249,"imageIndex":0},{"imageOffset":303783,"symbol":"KeyedDecodingContainer.decode<A>(_:forKey:)","symbolLocation":39,"imageIndex":0},{"imageOffset":40365943,"sourceFile":"<compiler-generated>","symbol":"EventsConfigData.init(from:)","symbolLocation":359,"imageIndex":1},{"imageOffset":40367527,"sourceFile":"<compiler-generated>","symbol":"protocol witness for Decodable.init(from:) in conformance EventsConfigData","symbolLocation":23,"imageIndex":1},{"imageOffset":2901479,"symbol":"dispatch thunk of Decodable.init(from:)","symbolLocation":7,"imageIndex":0},{"imageOffset":1488446,"symbol":"__JSONDecoder.unbox_(_:as:)","symbolLocation":1262,"imageIndex":10},{"imageOffset":1461787,"symbol":"_JSONKeyedDecodingContainer.decode<A>(_:forKey:)","symbolLocation":571,"imageIndex":10},{"imageOffset":1470109,"symbol":"protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance _JSONKeyedDecodingContainer<A>","symbolLocation":45,"imageIndex":10},{"imageOffset":16648,"symbol":"protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance _JSONKeyedDecodingContainer<A>","symbolLocation":24,"imageIndex":10},{"imageOffset":341785,"symbol":"_KeyedDecodingContainerBox.decode<A, B>(_:forKey:)","symbolLocation":249,"imageIndex":0},{"imageOffset":303783,"symbol":"KeyedDecodingContainer.decode<A>(_:forKey:)","symbolLocation":39,"imageIndex":0},{"imageOffset":40359718,"sourceFile":"<compiler-generated>","symbol":"SupabaseEventsConfig.init(from:)","symbolLocation":918,"imageIndex":1},{"imageOffset":40361567,"sourceFile":"<compiler-generated>","symbol":"protocol witness for Decodable.init(from:) in conformance SupabaseEventsConfig","symbolLocation":15,"imageIndex":1},{"imageOffset":2901479,"symbol":"dispatch thunk of Decodable.init(from:)","symbolLocation":7,"imageIndex":0},{"imageOffset":20157,"symbol":"_JSONUnkeyedDecodingContainer.decode<A>(_:)","symbolLocation":2493,"imageIndex":10},{"imageOffset":1476457,"symbol":"protocol witness for UnkeyedDecodingContainer.decode<A>(_:) in conformance _JSONUnkeyedDecodingContainer","symbolLocation":9,"imageIndex":10},{"imageOffset":385053,"symbol":"Array<A>.init(from:)","symbolLocation":365,"imageIndex":0},{"imageOffset":385238,"symbol":"protocol witness for Decodable.init(from:) in conformance <A> [A]","symbolLocation":22,"imageIndex":0},{"imageOffset":2901479,"symbol":"dispatch thunk of Decodable.init(from:)","symbolLocation":7,"imageIndex":0},{"imageOffset":1488446,"symbol":"__JSONDecoder.unbox_(_:as:)","symbolLocation":1262,"imageIndex":10},{"imageOffset":1437957,"symbol":"JSONDecoder.decode<A>(_:from:)","symbolLocation":1061,"imageIndex":10},{"imageOffset":11807,"symbol":"dispatch thunk of JSONDecoder.decode<A>(_:from:)","symbolLocation":15,"imageIndex":10},{"imageOffset":40323357,"sourceLine":313,"sourceFile":"EventsConfigService.swift","symbol":"(3) suspend resume partial function for EventsConfigService.fetchFromSupabase(type:)","imageIndex":1,"symbolLocation":1453},{"imageOffset":40304625,"sourceLine":217,"sourceFile":"EventsConfigService.swift","symbol":"(2) await resume partial function for EventsConfigService.fetchConfig(type:)","imageIndex":1,"symbolLocation":1},{"imageOffset":40263521,"sourceLine":25,"sourceFile":"EventsConfigService.swift","symbol":"(2) await resume partial function for EventsConfigService.fetchMovieEventsConfig()","imageIndex":1,"symbolLocation":1},{"imageOffset":36237185,"sourceLine":300,"sourceFile":"SocialService.swift","symbol":"(2) await resume partial function for SocialService.validateRoomJoinability(userId:roomId:)","imageIndex":1,"symbolLocation":1},{"imageOffset":36235569,"sourceLine":278,"sourceFile":"SocialService.swift","symbol":"(2) await resume partial function for closure #3 in SocialService.recalculateUserActivity(userId:)","imageIndex":1,"symbolLocation":1}]},{"id":566551,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"id":566633,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"id":566656,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"id":566657,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"id":566658,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703564869632,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4503007232,
    "CFBundleShortVersionString" : "1.0.147",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 47202304,
    "uuid" : "c23574f1-3270-3413-ab94-cbec6ec3bf86",
    "path" : "\/Applications\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "147"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703341539328,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703342084096,
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
    "base" : 140703386640384,
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
    "base" : 140703341768704,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703420088320,
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
    "base" : 140703357276160,
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
    "base" : 140703693885440,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703339978752,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703635361792,
    "size" : 3465216,
    "uuid" : "1f21009f-9aa8-36c0-9abe-87db68540481",
    "path" : "\/usr\/lib\/swift\/libswiftFoundation.dylib",
    "name" : "libswiftFoundation.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703338508288,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=677.2M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=677.2M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               384K        3 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                           308K       11 \nCG raster data                     212K       14 \nColorSync                          232K       28 \nCoreAnimation                     1812K       45 \nCoreGraphics                        12K        2 \nCoreUI image data                  788K        7 \nFoundation                          16K        1 \nIOKit                             7940K        1 \nImage IO                          2200K        3 \nKernel Alloc Once                    8K        1 \nMALLOC                           356.9M      101 \nMALLOC guard page                   48K       10 \nMALLOC_NANO (reserved)           256.0M        1         reserved VM address space (unallocated)\nSQLite page cache                  320K        5 \nSTACK GUARD                       56.1M       19 \nStack                             17.1M       19 \nVM_ALLOCATE                       3808K       15 \n__CTF                               756        1 \n__DATA                            55.2M      608 \n__DATA_CONST                      33.5M      413 \n__DATA_DIRTY                      1669K      207 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       735.5M       82 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           597.8M      612 \n__UNICODE                          592K        1 \ndyld private memory               1024K        1 \nlibnetwork                        14.8M       56 \nmapped file                      164.4M       33 \nshared memory                     2824K       20 \n===========                     =======  ======= \nTOTAL                              2.3G     2329 \nTOTAL, minus reserved VM space     2.1G     2329 \n",
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
