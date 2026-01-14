-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [66285]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.86 (86)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [66162]
Responsible:           Electron [57391]
User ID:               501

Date/Time:             2026-01-14 16:05:11.0245 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA


Time Awake Since Boot: 12000 seconds

System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_INVALID_ADDRESS at 0x0000000800000000
Exception Codes:       0x0000000000000001, 0x0000000800000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 11 Segmentation fault: 11
Terminating Process:   exc handler [66285]

VM Region Info: 0x800000000 is not in any region.  Bytes after previous region: 29217427457  Bytes before following region: 123111077629952
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      MALLOC metadata             132317000-132817000    [ 5120K] rw-/rwx SM=PRV  
--->  GAP OF 0x6ffed58b6000 BYTES
      Stack Guard              7000080cd000-7000080ce000 [    4K] ---/rwx SM=NUL  

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   libsystem_platform.dylib      	    0x7ff81e8676b2 _platform_strlen + 18
1   libswiftCore.dylib            	    0x7ff82bd91b1b String.init(cString:) + 11
2   RedLemon                      	       0x10896430a MPVWrapper.handleMPVEvent(eventId:eventPtr:) + 6858 (MPVWrapper.swift:431)
3   RedLemon                      	       0x108962828 closure #1 in MPVWrapper.pollEvents() + 72 (MPVWrapper.swift:342)
4   RedLemon                      	       0x10898d148 partial apply for closure #1 in MPVWrapper.pollEvents() + 24
5   RedLemon                      	       0x107e2a5a4 (2) suspend resume partial function for static MainActor.run<A>(resultType:body:) + 84
6   RedLemon                      	       0x108962331 (2) await resume partial function for MPVWrapper.pollEvents() + 1 (MPVWrapper.swift:342)

Thread 1:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff81e81793a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff81e817ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81e91b29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81e919928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81e918d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff8214c5572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 2:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff81e81793a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff81e817ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81e91b29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81e919928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81e918d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff823547964 0x7ff8232ff000 + 2394468
6   Foundation                    	    0x7ff81f770724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 3:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff81e81c30e kevent + 10
1   RedLemon                      	       0x107cc4189 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x107cce0af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x107cce704 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x107cc4e3b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x107ccdfa8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x107caaa76 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x107cabadf partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x107c9ca62 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x107c9cab7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff82be2d72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x107c9c92a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x107ca928d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x107ca2bb4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x107c9746e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x107c9a894 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x107c8f422 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x107c8f46c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff83381ce7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x107c8f3c9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x107c964ef SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107c38208 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x107c3895a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x107c3ec33 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x107cceaff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x107cd166f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x107cd1729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff81e81c30e kevent + 10
1   RedLemon                      	       0x107cc4189 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x107cce0af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x107cce704 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x107cc4e3b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x107ccdfa8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x107caaa76 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x107cabadf partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x107c9ca62 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x107c9cab7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff82be2d72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x107c9c92a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x107ca928d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x107ca2bb4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x107c9746e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x107c9a894 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x107c8f422 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x107c8f46c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff83381ce7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x107c8f3c9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x107c964ef SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107c38208 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x107c3895a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x107c3ec33 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x107cceaff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x107cd166f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x107cd1729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff81e81c30e kevent + 10
1   RedLemon                      	       0x107cc4189 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x107cce0af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x107cce704 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x107cc4e3b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x107ccdfa8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x107caaa76 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x107cabadf partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x107c9ca62 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x107c9cab7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff82be2d72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x107c9c92a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x107ca928d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x107ca2bb4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x107c9746e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x107c9a894 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x107c8f422 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x107c8f46c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff83381ce7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x107c8f3c9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x107c964ef SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107c38208 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x107c3895a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x107c3ec33 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x107cceaff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x107cd166f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x107cd1729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff81e81c30e kevent + 10
1   RedLemon                      	       0x107cc4189 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x107cce0af closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x107cce704 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x107cc4e3b syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x107ccdfa8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x107caaa76 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x107cabadf partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x107c9ca62 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28)
9   RedLemon                      	       0x107c9cab7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff82be2d72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x107c9c92a Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27)
12  RedLemon                      	       0x107ca928d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
13  RedLemon                      	       0x107ca2bb4 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
14  RedLemon                      	       0x107c9746e closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
15  RedLemon                      	       0x107c9a894 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x107c8f422 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
17  RedLemon                      	       0x107c8f46c partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff83381ce7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x107c8f3c9 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
20  RedLemon                      	       0x107c964ef SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
21  RedLemon                      	       0x107c38208 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
22  RedLemon                      	       0x107c3895a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
23  RedLemon                      	       0x107c3ec33 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x107cceaff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x107cd166f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
26  RedLemon                      	       0x107cd1729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 7:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff81e817976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81e69c7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81e69cc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x107c410ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x107c41fce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x107cceaff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x107cd166f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x107cd1729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 8:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff81e817976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81e69c7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81e69cc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x107c410ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x107c41fce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x107cceaff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x107cd166f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x107cd1729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 9:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff81e817976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81e69c7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81e69cc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x107c410ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x107c41fce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x107cceaff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x107cd166f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x107cd1729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 10:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff81e817976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff81e69c7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff81e69cc9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x107c410ff NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x107c41fce closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x107cceaff thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x107cd166f closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x107cd1729 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 11:
0   libsystem_pthread.dylib       	    0x7ff81e84ff48 start_wqthread + 0

Thread 12:
0   libsystem_pthread.dylib       	    0x7ff81e84ff48 start_wqthread + 0

Thread 13:
0   libsystem_pthread.dylib       	    0x7ff81e84ff48 start_wqthread + 0

Thread 14:
0   libsystem_pthread.dylib       	    0x7ff81e84ff48 start_wqthread + 0

Thread 15:
0   libsystem_pthread.dylib       	    0x7ff81e84ff48 start_wqthread + 0

Thread 16:: com.apple.coremedia.rootQueue.47
0   libsystem_kernel.dylib        	    0x7ff81e81798e semaphore_timedwait_trap + 10
1   libdispatch.dylib             	    0x7ff81e69c848 _dispatch_sema4_timedwait + 72
2   libdispatch.dylib             	    0x7ff81e69cc75 _dispatch_semaphore_wait_slow + 58
3   libdispatch.dylib             	    0x7ff81e6ab8ef _dispatch_worker_thread + 308
4   libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 17:: AMCP Logging Spool
0   libsystem_kernel.dylib        	    0x7ff81e817976 semaphore_wait_trap + 10
1   caulk                         	    0x7ff8273582e6 caulk::mach::semaphore::wait_or_error() + 16
2   caulk                         	    0x7ff827340148 caulk::concurrent::details::worker_thread::run() + 36
3   caulk                         	    0x7ff82733fe0c void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*) + 41
4   libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15

Thread 18:
0   libsystem_pthread.dylib       	    0x7ff81e84ff48 start_wqthread + 0

Thread 19:
0   libsystem_pthread.dylib       	    0x7ff81e84ff48 start_wqthread + 0

Thread 20:
0   libsystem_pthread.dylib       	    0x7ff81e84ff48 start_wqthread + 0

Thread 21:: CVDisplayLink
0   libsystem_kernel.dylib        	    0x7ff81e81a3aa __psynch_cvwait + 10
1   libsystem_pthread.dylib       	    0x7ff81e854aa4 _pthread_cond_wait + 1302
2   CoreVideo                     	    0x7ff8260fbe60 CVDisplayLink::waitUntil(unsigned long long) + 370
3   CoreVideo                     	    0x7ff8260faddc CVDisplayLink::runIOThread() + 526
4   libsystem_pthread.dylib       	    0x7ff81e8544e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff81e84ff6b thread_start + 15


Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x0000000800000000  rbx: 0x0000000800000000  rcx: 0x0000000800000000  rdx: 0x0000000800000000
  rdi: 0x0000000800000000  rsi: 0x00007ff82bfbae00  rbp: 0x00007ff7b90c0df0  rsp: 0x00007ff7b90c0df0
   r8: 0x00007ff82c0b5b74   r9: 0x000000000000000f  r10: 0x00000000ffffff00  r11: 0x00007f8b3510d728
  r12: 0x0000000000000000  r13: 0x00007f8b390f4300  r14: 0x00007f8b3602ebc0  r15: 0x00007f8b3480d4b0
  rip: 0x00007ff81e8676b2  rfl: 0x0000000000010206  cr2: 0x0000000800000000
  
Logical CPU:     0
Error Code:      0x00000004 (no mapping for user data read)
Trap Number:     14

Thread 0 instruction stream:
  29 07 c5 fc 29 47 20 48-83 c7 40 48 83 ea 40 77  )...)G H..@H..@w
  ed c5 fc 11 04 17 c5 fc-11 44 17 20 c5 f8 77 5d  .........D. ..w]
  c3 48 89 34 17 48 83 ea-08 73 f6 48 83 c2 08 74  .H.4.H...s.H...t
  0b 40 88 74 17 ff 48 83-ea 01 75 f5 5d c3 90 90  .@.t..H...u.]...
  90 90 90 90 90 90 90 90-90 90 90 90 90 90 55 48  ..............UH
  89 e5 48 89 f9 48 89 fa-48 83 e7 f0 66 0f ef c0  ..H..H..H...f...
 [66]0f 74 07 66 0f d7 f0-48 83 e1 0f 48 83 c8 ff  f.t.f...H...H...	<==
  48 d3 e0 21 c6 74 17 0f-bc c6 48 29 d7 48 01 f8  H..!.t....H).H..
  5d c3 66 2e 0f 1f 84 00-00 00 00 00 66 90 48 83  ].f.........f.H.
  c7 10 66 0f ef c0 66 0f-74 07 66 0f d7 f0 85 f6  ..f...f.t.f.....
  74 ec eb d3 65 48 8b 0c-25 18 00 00 00 41 89 c8  t...eH..%....A..
  31 c0 f0 4c 0f b1 07 0f-85 de 1f 00 00 e9 00 00  1..L............

Binary Images:
    0x7ff81e866000 -     0x7ff81e86ffff libsystem_platform.dylib (*) <81a897b2-8752-3f99-833e-da16ffa9fa58> /usr/lib/system/libsystem_platform.dylib
    0x7ff82bd12000 -     0x7ff82c18bfff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
       0x106e3c000 -        0x1098a3fff com.redlemon.app (1.0.86) <b83bdbbe-f076-3f2c-b88e-dc76d0d29145> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
    0x7ff81e816000 -     0x7ff81e84dfff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff81e89b000 -     0x7ff81ed9dfff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff821319000 -     0x7ff8221a8fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff81e84e000 -     0x7ff81e859fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff8232ff000 -     0x7ff82378dfff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff81f718000 -     0x7ff81fad4fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff83381c000 -     0x7ff83381dfff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff81e699000 -     0x7ff81e6dffff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff82733e000 -     0x7ff82735ffff com.apple.audio.caulk (1.0) <f04b5c91-d0ec-33c6-8a81-b80a3ebf827f> /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk
    0x7ff8260f9000 -     0x7ff82614afff com.apple.CoreVideo (1.8) <fe89c8c7-c939-3115-afdb-7a6190835819> /System/Library/Frameworks/CoreVideo.framework/Versions/A/CoreVideo
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
Writable regions: Total=243.3M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=243.3M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               256K        2 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                            76K        8 
CG raster data                     164K       18 
ColorSync                          224K       27 
CoreAnimation                     1364K       22 
CoreGraphics                        12K        2 
CoreUI image data                 1272K        8 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
IOKit                             7940K        1 
Image IO                          1856K       17 
Kernel Alloc Once                    8K        1 
MALLOC                           127.3M      162 
MALLOC guard page                   48K       11 
MALLOC_LARGE (reserved)            384K        1         reserved VM address space (unallocated)
OpenGL GLSL                        384K        5 
SQLite page cache                 1088K       17 
STACK GUARD                       56.1M       22 
Stack                             18.7M       22 
VM_ALLOCATE                       13.5M       38 
__CTF                               756        1 
__DATA                            55.4M      607 
__DATA_CONST                      33.7M      416 
__DATA_DIRTY                      1662K      206 
__FONT_DATA                          4K        1 
__GLSLBUILTINS                    5176K        1 
__LINKEDIT                       731.0M       85 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           604.3M      615 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        13.6M       40 
mapped file                      348.9M       41 
shared memory                      9.8M       26 
===========                     =======  ======= 
TOTAL                              2.1G     2437 
TOTAL, minus reserved VM space     2.1G     2437 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2026-01-14 16:05:25.00 -0500","app_version":"1.0.86","slice_uuid":"b83bdbbe-f076-3f2c-b88e-dc76d0d29145","build_version":"86","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"AC714700-BCA8-4DBE-9651-4754483AF8B0","name":"RedLemon"}
{
  "uptime" : 12000,
  "procLaunch" : "2026-01-14 16:01:10.6057 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 12372537494286,
  "coalitionID" : 1777,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2026-01-14 16:05:11.0245 -0500",
  "incident" : "AC714700-BCA8-4DBE-9651-4754483AF8B0",
  "bug_type" : "309",
  "pid" : 66285,
  "procExitAbsTime" : 12612899058444,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.86","CFBundleVersion":"86","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 66162,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 57391,
  "responsibleProc" : "Electron",
  "sip" : "enabled",
  "vmRegionInfo" : "0x800000000 is not in any region.  Bytes after previous region: 29217427457  Bytes before following region: 123111077629952\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      MALLOC metadata             132317000-132817000    [ 5120K] rw-\/rwx SM=PRV  \n--->  GAP OF 0x6ffed58b6000 BYTES\n      Stack Guard              7000080cd000-7000080ce000 [    4K] ---\/rwx SM=NUL  ",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000800000000","rawCodes":[1,34359738368],"type":"EXC_BAD_ACCESS","signal":"SIGSEGV","subtype":"KERN_INVALID_ADDRESS at 0x0000000800000000"},
  "termination" : {"flags":0,"code":11,"namespace":"SIGNAL","indicator":"Segmentation fault: 11","byProc":"exc handler","byPid":66285},
  "vmregioninfo" : "0x800000000 is not in any region.  Bytes after previous region: 29217427457  Bytes before following region: 123111077629952\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      MALLOC metadata             132317000-132817000    [ 5120K] rw-\/rwx SM=PRV  \n--->  GAP OF 0x6ffed58b6000 BYTES\n      Stack Guard              7000080cd000-7000080ce000 [    4K] ---\/rwx SM=NUL  ",
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 0,
  "threads" : [{"triggered":true,"id":196821,"instructionState":{"instructionStream":{"bytes":[41,7,197,252,41,71,32,72,131,199,64,72,131,234,64,119,237,197,252,17,4,23,197,252,17,68,23,32,197,248,119,93,195,72,137,52,23,72,131,234,8,115,246,72,131,194,8,116,11,64,136,116,23,255,72,131,234,1,117,245,93,195,144,144,144,144,144,144,144,144,144,144,144,144,144,144,144,144,85,72,137,229,72,137,249,72,137,250,72,131,231,240,102,15,239,192,102,15,116,7,102,15,215,240,72,131,225,15,72,131,200,255,72,211,224,33,198,116,23,15,188,198,72,41,215,72,1,248,93,195,102,46,15,31,132,0,0,0,0,0,102,144,72,131,199,16,102,15,239,192,102,15,116,7,102,15,215,240,133,246,116,236,235,211,101,72,139,12,37,24,0,0,0,65,137,200,49,192,240,76,15,177,7,15,133,222,31,0,0,233,0,0],"offset":96}},"threadState":{"r13":{"value":140235934483200},"rax":{"value":34359738368},"rflags":{"value":66054},"cpu":{"value":0},"r14":{"value":140235883342784},"rsi":{"value":140703866531328,"symbolLocation":0,"symbol":"_swift_stdlib_strlen"},"r8":{"value":140703867558772,"symbolLocation":0,"symbol":"associated type descriptor for RawRepresentable.RawValue"},"cr2":{"value":34359738368},"rdx":{"value":34359738368},"r10":{"value":4294967040},"r9":{"value":15},"r15":{"value":140235858039984},"rbx":{"value":34359738368},"trap":{"value":14,"description":"(no mapping for user data read)"},"err":{"value":4},"r11":{"value":140235867477800},"rip":{"value":140703640745650,"matchesCrashFrame":1},"rbp":{"value":140701938224624},"rsp":{"value":140701938224624},"r12":{"value":0},"rcx":{"value":34359738368},"flavor":"x86_THREAD_STATE","rdi":{"value":34359738368}},"queue":"com.apple.main-thread","frames":[{"imageOffset":5810,"symbol":"_platform_strlen","symbolLocation":18,"imageIndex":0},{"imageOffset":523035,"symbol":"String.init(cString:)","symbolLocation":11,"imageIndex":1},{"imageOffset":28476170,"sourceLine":431,"sourceFile":"MPVWrapper.swift","symbol":"MPVWrapper.handleMPVEvent(eventId:eventPtr:)","imageIndex":2,"symbolLocation":6858},{"imageOffset":28469288,"sourceLine":342,"sourceFile":"MPVWrapper.swift","symbol":"closure #1 in MPVWrapper.pollEvents()","imageIndex":2,"symbolLocation":72},{"imageOffset":28643656,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in MPVWrapper.pollEvents()","symbolLocation":24,"imageIndex":2},{"imageOffset":16704932,"sourceFile":"<compiler-generated>","symbol":"(2) suspend resume partial function for static MainActor.run<A>(resultType:body:)","symbolLocation":84,"imageIndex":2},{"imageOffset":28468017,"sourceLine":342,"sourceFile":"MPVWrapper.swift","symbol":"(2) await resume partial function for MPVWrapper.pollEvents()","imageIndex":2,"symbolLocation":1}]},{"id":196872,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":3},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":4},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":4},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":4},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":197340,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":3},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":4},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":4},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":4},{"imageOffset":2394468,"imageIndex":7},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":8},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":197341,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":3},{"imageOffset":15237513,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":2},{"imageOffset":15278255,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":2,"symbolLocation":95},{"imageOffset":15279876,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":2},{"imageOffset":15240763,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":2,"symbolLocation":395},{"imageOffset":15277992,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":2,"symbolLocation":312},{"imageOffset":15133302,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":230},{"imageOffset":15137503,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":2},{"imageOffset":15075938,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":2,"symbolLocation":50},{"imageOffset":15076023,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":2},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":1},{"imageOffset":15075626,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":2,"symbolLocation":346},{"imageOffset":15127181,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":1053},{"imageOffset":15100852,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":100},{"imageOffset":15053934,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":2,"symbolLocation":158},{"imageOffset":15067284,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":2},{"imageOffset":15021090,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":2,"symbolLocation":34},{"imageOffset":15021164,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":2},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":9},{"imageOffset":15021001,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":2,"symbolLocation":57},{"imageOffset":15049967,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":2,"symbolLocation":591},{"imageOffset":14664200,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":2,"symbolLocation":856},{"imageOffset":14666074,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":2,"symbolLocation":282},{"imageOffset":14691379,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":2},{"imageOffset":15280895,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15292015,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":2,"symbolLocation":1007},{"imageOffset":15292201,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":197342,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":3},{"imageOffset":15237513,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":2},{"imageOffset":15278255,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":2,"symbolLocation":95},{"imageOffset":15279876,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":2},{"imageOffset":15240763,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":2,"symbolLocation":395},{"imageOffset":15277992,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":2,"symbolLocation":312},{"imageOffset":15133302,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":230},{"imageOffset":15137503,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":2},{"imageOffset":15075938,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":2,"symbolLocation":50},{"imageOffset":15076023,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":2},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":1},{"imageOffset":15075626,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":2,"symbolLocation":346},{"imageOffset":15127181,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":1053},{"imageOffset":15100852,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":100},{"imageOffset":15053934,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":2,"symbolLocation":158},{"imageOffset":15067284,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":2},{"imageOffset":15021090,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":2,"symbolLocation":34},{"imageOffset":15021164,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":2},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":9},{"imageOffset":15021001,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":2,"symbolLocation":57},{"imageOffset":15049967,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":2,"symbolLocation":591},{"imageOffset":14664200,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":2,"symbolLocation":856},{"imageOffset":14666074,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":2,"symbolLocation":282},{"imageOffset":14691379,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":2},{"imageOffset":15280895,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15292015,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":2,"symbolLocation":1007},{"imageOffset":15292201,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":197343,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":3},{"imageOffset":15237513,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":2},{"imageOffset":15278255,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":2,"symbolLocation":95},{"imageOffset":15279876,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":2},{"imageOffset":15240763,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":2,"symbolLocation":395},{"imageOffset":15277992,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":2,"symbolLocation":312},{"imageOffset":15133302,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":230},{"imageOffset":15137503,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":2},{"imageOffset":15075938,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":2,"symbolLocation":50},{"imageOffset":15076023,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":2},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":1},{"imageOffset":15075626,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":2,"symbolLocation":346},{"imageOffset":15127181,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":1053},{"imageOffset":15100852,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":100},{"imageOffset":15053934,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":2,"symbolLocation":158},{"imageOffset":15067284,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":2},{"imageOffset":15021090,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":2,"symbolLocation":34},{"imageOffset":15021164,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":2},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":9},{"imageOffset":15021001,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":2,"symbolLocation":57},{"imageOffset":15049967,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":2,"symbolLocation":591},{"imageOffset":14664200,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":2,"symbolLocation":856},{"imageOffset":14666074,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":2,"symbolLocation":282},{"imageOffset":14691379,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":2},{"imageOffset":15280895,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15292015,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":2,"symbolLocation":1007},{"imageOffset":15292201,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":197344,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":3},{"imageOffset":15237513,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":2},{"imageOffset":15278255,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":2,"symbolLocation":95},{"imageOffset":15279876,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":2},{"imageOffset":15240763,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":2,"symbolLocation":395},{"imageOffset":15277992,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":2,"symbolLocation":312},{"imageOffset":15133302,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":230},{"imageOffset":15137503,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":2},{"imageOffset":15075938,"sourceLine":28,"sourceFile":"SelectorGeneric.swift","symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":2,"symbolLocation":50},{"imageOffset":15076023,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":2},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":1},{"imageOffset":15075626,"sourceLine":27,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":2,"symbolLocation":346},{"imageOffset":15127181,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":1053},{"imageOffset":15100852,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":2,"symbolLocation":100},{"imageOffset":15053934,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":2,"symbolLocation":158},{"imageOffset":15067284,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":2},{"imageOffset":15021090,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":2,"symbolLocation":34},{"imageOffset":15021164,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":2},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":9},{"imageOffset":15021001,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":2,"symbolLocation":57},{"imageOffset":15049967,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":2,"symbolLocation":591},{"imageOffset":14664200,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":2,"symbolLocation":856},{"imageOffset":14666074,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":2,"symbolLocation":282},{"imageOffset":14691379,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":2},{"imageOffset":15280895,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15292015,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":2,"symbolLocation":1007},{"imageOffset":15292201,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":197345,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":10},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":10},{"imageOffset":14700799,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":2,"symbolLocation":143},{"imageOffset":14704590,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":2,"symbolLocation":222},{"imageOffset":15280895,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15292015,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":2,"symbolLocation":1007},{"imageOffset":15292201,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":197346,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":10},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":10},{"imageOffset":14700799,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":2,"symbolLocation":143},{"imageOffset":14704590,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":2,"symbolLocation":222},{"imageOffset":15280895,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15292015,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":2,"symbolLocation":1007},{"imageOffset":15292201,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":197347,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":10},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":10},{"imageOffset":14700799,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":2,"symbolLocation":143},{"imageOffset":14704590,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":2,"symbolLocation":222},{"imageOffset":15280895,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15292015,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":2,"symbolLocation":1007},{"imageOffset":15292201,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":197348,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":10},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":10},{"imageOffset":14700799,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":2,"symbolLocation":143},{"imageOffset":14704590,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":2,"symbolLocation":222},{"imageOffset":15280895,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15292015,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":2,"symbolLocation":1007},{"imageOffset":15292201,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":198107,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":6}]},{"id":198547,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":6}]},{"id":198970,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":6}]},{"id":198977,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":6}]},{"id":199090,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":6}]},{"id":199171,"name":"com.apple.coremedia.rootQueue.47","frames":[{"imageOffset":6542,"symbol":"semaphore_timedwait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":14408,"symbol":"_dispatch_sema4_timedwait","symbolLocation":72,"imageIndex":10},{"imageOffset":15477,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":58,"imageIndex":10},{"imageOffset":76015,"symbol":"_dispatch_worker_thread","symbolLocation":308,"imageIndex":10},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":199174,"name":"AMCP Logging Spool","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":107238,"symbol":"caulk::mach::semaphore::wait_or_error()","symbolLocation":16,"imageIndex":11},{"imageOffset":8520,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":36,"imageIndex":11},{"imageOffset":7692,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*)","symbolLocation":41,"imageIndex":11},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]},{"id":199351,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":6}]},{"id":199352,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":6}]},{"id":199353,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":6}]},{"id":199429,"name":"CVDisplayLink","frames":[{"imageOffset":17322,"symbol":"__psynch_cvwait","symbolLocation":10,"imageIndex":3},{"imageOffset":27300,"symbol":"_pthread_cond_wait","symbolLocation":1302,"imageIndex":6},{"imageOffset":11872,"symbol":"CVDisplayLink::waitUntil(unsigned long long)","symbolLocation":370,"imageIndex":12},{"imageOffset":7644,"symbol":"CVDisplayLink::runIOThread()","symbolLocation":526,"imageIndex":12},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":6},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":6}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703640739840,
    "size" : 40960,
    "uuid" : "81a897b2-8752-3f99-833e-da16ffa9fa58",
    "path" : "\/usr\/lib\/system\/libsystem_platform.dylib",
    "name" : "libsystem_platform.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703863742464,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4410556416,
    "CFBundleShortVersionString" : "1.0.86",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 44466176,
    "uuid" : "b83bdbbe-f076-3f2c-b88e-dc76d0d29145",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "86"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703640412160,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703640956928,
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
    "base" : 140703685513216,
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
    "base" : 140703640641536,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703718961152,
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
    "base" : 140703656148992,
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
    "base" : 140703992758272,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703638851584,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703786328064,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.audio.caulk",
    "size" : 139264,
    "uuid" : "f04b5c91-d0ec-33c6-8a81-b80a3ebf827f",
    "path" : "\/System\/Library\/PrivateFrameworks\/caulk.framework\/Versions\/A\/caulk",
    "name" : "caulk"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703767171072,
    "CFBundleShortVersionString" : "1.8",
    "CFBundleIdentifier" : "com.apple.CoreVideo",
    "size" : 335872,
    "uuid" : "fe89c8c7-c939-3115-afdb-7a6190835819",
    "path" : "\/System\/Library\/Frameworks\/CoreVideo.framework\/Versions\/A\/CoreVideo",
    "name" : "CoreVideo",
    "CFBundleVersion" : "480.1"
  },
  {
    "size" : 0,
    "source" : "A",
    "base" : 0,
    "uuid" : "00000000-0000-0000-0000-000000000000"
  }
],
  "sharedCache" : {
  "base" : 140703637381120,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=243.3M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=243.3M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               256K        2 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                            76K        8 \nCG raster data                     164K       18 \nColorSync                          224K       27 \nCoreAnimation                     1364K       22 \nCoreGraphics                        12K        2 \nCoreUI image data                 1272K        8 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nIOKit                             7940K        1 \nImage IO                          1856K       17 \nKernel Alloc Once                    8K        1 \nMALLOC                           127.3M      162 \nMALLOC guard page                   48K       11 \nMALLOC_LARGE (reserved)            384K        1         reserved VM address space (unallocated)\nOpenGL GLSL                        384K        5 \nSQLite page cache                 1088K       17 \nSTACK GUARD                       56.1M       22 \nStack                             18.7M       22 \nVM_ALLOCATE                       13.5M       38 \n__CTF                               756        1 \n__DATA                            55.4M      607 \n__DATA_CONST                      33.7M      416 \n__DATA_DIRTY                      1662K      206 \n__FONT_DATA                          4K        1 \n__GLSLBUILTINS                    5176K        1 \n__LINKEDIT                       731.0M       85 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           604.3M      615 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      348.9M       41 \nshared memory                      9.8M       26 \n===========                     =======  ======= \nTOTAL                              2.1G     2437 \nTOTAL, minus reserved VM space     2.1G     2437 \n",
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
