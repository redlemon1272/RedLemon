-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [10463]
Path:                  /Applications/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.185 (185)
Code Type:             X86-64 (Native)
Parent Process:        launchd [1]
User ID:               501

Date/Time:             2026-02-02 01:34:53.3186 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        24F646B6-E55A-DF4C-178D-891130B3FBCE


Time Awake Since Boot: 49000 seconds

System Integrity Protection: enabled

Crashed Thread:        14  Dispatch queue: com.apple.root.user-initiated-qos.cooperative

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_INVALID_ADDRESS at 0x0000000000000000
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 11 Segmentation fault: 11
Terminating Process:   exc handler [10463]

VM Region Info: 0 is not in any region.  Bytes before following region: 4473327616
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      UNUSED SPACE AT START
--->
      __TEXT                      10aa19000-10d841000    [ 46.2M] r-x/r-x SM=COW  ...acOS/RedLemon

Thread 0::  Dispatch queue: com.apple.main-thread
0   CoreFoundation                	    0x7ff8101992ef __CFCalendarCreateUCalendar + 96
1   CoreFoundation                	    0x7ff8102878cd _CFCalendarInitialize + 649
2   CoreFoundation                	    0x7ff810199064 _CFCalendarCreate + 133
3   CoreFoundation                	    0x7ff8101a072f CFCalendarCreateWithIdentifier + 39
4   CoreFoundation                	    0x7ff8101b5cd2 __CreateCFDateFormatter + 195
5   CoreFoundation                	    0x7ff8101fc4a5 CFDateFormatterCreateISO8601Formatter + 95
6   Foundation                    	    0x7ff81104de87 -[NSISO8601DateFormatter init] + 148
7   RedLemon                      	       0x10c1506a3 @nonobjc NSISO8601DateFormatter.init() + 19
8   RedLemon                      	       0x10c14c34f NSISO8601DateFormatter.__allocating_init() + 31
9   RedLemon                      	       0x10cd90d96 SocialService.recalculateUserActivity(userId:) + 1750
10  RedLemon                      	       0x10cd8fdae SocialService.handlePresenceJoin(mapKey:metadata:) + 1630
11  RedLemon                      	       0x10cd8cb43 (1) suspend resume partial function for closure #1 in closure #1 in SocialService.setupPresenceChannel(userId:username:) + 387
12  RedLemon                      	       0x10cdc0071 (1) await resume partial function for partial apply for closure #1 in closure #1 in SocialService.setupPresenceChannel(userId:username:) + 1

Thread 1:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff81007993a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff810079ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81017d29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81017b928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81017ad6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff812d27572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 2:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff81007993a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff810079ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff81017d29d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff81017b928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff81017ad6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff814da9964 0x7ff814b61000 + 2394468
6   Foundation                    	    0x7ff810fd2724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 3:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff81007e30e kevent + 10
1   RedLemon                      	       0x10b8a20c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10b8abfef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95
3   RedLemon                      	       0x10b8ac644 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10b8a2d7b syscall<A>(blocking:where:_:) + 395
5   RedLemon                      	       0x10b8abee8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312
6   RedLemon                      	       0x10b8889b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230
7   RedLemon                      	       0x10b889a1f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10b87a8e3 Optional.withUnsafeOptionalPointer<A>(_:) + 467
9   RedLemon                      	       0x10b8871cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053
10  RedLemon                      	       0x10b880af4 Selector.whenReady(strategy:onLoopBegin:_:) + 100
11  RedLemon                      	       0x10b8753ae closure #2 in SelectableEventLoop.run() + 158
12  RedLemon                      	       0x10b8787d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10b86d362 closure #1 in withAutoReleasePool<A>(_:) + 34
14  RedLemon                      	       0x10b86d3ac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82507ee7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10b86d309 withAutoReleasePool<A>(_:) + 57
17  RedLemon                      	       0x10b87442f SelectableEventLoop.run() + 591
18  RedLemon                      	       0x10b816148 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856
19  RedLemon                      	       0x10b81689a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282
20  RedLemon                      	       0x10b81cb73 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10b8aca3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10b8af5af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007
23  RedLemon                      	       0x10b8af669 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff81007e30e kevent + 10
1   RedLemon                      	       0x10b8a20c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10b8abfef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95
3   RedLemon                      	       0x10b8ac644 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10b8a2d7b syscall<A>(blocking:where:_:) + 395
5   RedLemon                      	       0x10b8abee8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312
6   RedLemon                      	       0x10b8889b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230
7   RedLemon                      	       0x10b889a1f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10b87a9a2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50
9   RedLemon                      	       0x10b87a9f7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81d68f72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10b87a86a Optional.withUnsafeOptionalPointer<A>(_:) + 346
12  RedLemon                      	       0x10b8871cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053
13  RedLemon                      	       0x10b880af4 Selector.whenReady(strategy:onLoopBegin:_:) + 100
14  RedLemon                      	       0x10b8753ae closure #2 in SelectableEventLoop.run() + 158
15  RedLemon                      	       0x10b8787d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10b86d362 closure #1 in withAutoReleasePool<A>(_:) + 34
17  RedLemon                      	       0x10b86d3ac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82507ee7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10b86d309 withAutoReleasePool<A>(_:) + 57
20  RedLemon                      	       0x10b87442f SelectableEventLoop.run() + 591
21  RedLemon                      	       0x10b816148 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856
22  RedLemon                      	       0x10b81689a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282
23  RedLemon                      	       0x10b81cb73 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10b8aca3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10b8af5af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007
26  RedLemon                      	       0x10b8af669 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff81007e30e kevent + 10
1   RedLemon                      	       0x10b8a20c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10b8abfef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95
3   RedLemon                      	       0x10b8ac644 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10b8a2d7b syscall<A>(blocking:where:_:) + 395
5   RedLemon                      	       0x10b8abee8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312
6   RedLemon                      	       0x10b8889b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230
7   RedLemon                      	       0x10b889a1f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10b87a9a2 closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50
9   RedLemon                      	       0x10b87a9f7 partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39
10  libswiftCore.dylib            	    0x7ff81d68f72c withUnsafePointer<A, B>(to:_:) + 12
11  RedLemon                      	       0x10b87a86a Optional.withUnsafeOptionalPointer<A>(_:) + 346
12  RedLemon                      	       0x10b8871cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053
13  RedLemon                      	       0x10b880af4 Selector.whenReady(strategy:onLoopBegin:_:) + 100
14  RedLemon                      	       0x10b8753ae closure #2 in SelectableEventLoop.run() + 158
15  RedLemon                      	       0x10b8787d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
16  RedLemon                      	       0x10b86d362 closure #1 in withAutoReleasePool<A>(_:) + 34
17  RedLemon                      	       0x10b86d3ac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
18  libswiftObjectiveC.dylib      	    0x7ff82507ee7c autoreleasepool<A>(invoking:) + 44
19  RedLemon                      	       0x10b86d309 withAutoReleasePool<A>(_:) + 57
20  RedLemon                      	       0x10b87442f SelectableEventLoop.run() + 591
21  RedLemon                      	       0x10b816148 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856
22  RedLemon                      	       0x10b81689a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282
23  RedLemon                      	       0x10b81cb73 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
24  RedLemon                      	       0x10b8aca3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
25  RedLemon                      	       0x10b8af5af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007
26  RedLemon                      	       0x10b8af669 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
27  libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
28  libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff81007e30e kevent + 10
1   RedLemon                      	       0x10b8a20c9 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10b8abfef closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95
3   RedLemon                      	       0x10b8ac644 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10b8a2d7b syscall<A>(blocking:where:_:) + 395
5   RedLemon                      	       0x10b8abee8 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312
6   RedLemon                      	       0x10b8889b6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230
7   RedLemon                      	       0x10b889a1f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10b87a8e3 Optional.withUnsafeOptionalPointer<A>(_:) + 467
9   RedLemon                      	       0x10b8871cd Selector.whenReady0(strategy:onLoopBegin:_:) + 1053
10  RedLemon                      	       0x10b880af4 Selector.whenReady(strategy:onLoopBegin:_:) + 100
11  RedLemon                      	       0x10b8753ae closure #2 in SelectableEventLoop.run() + 158
12  RedLemon                      	       0x10b8787d4 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10b86d362 closure #1 in withAutoReleasePool<A>(_:) + 34
14  RedLemon                      	       0x10b86d3ac partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff82507ee7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10b86d309 withAutoReleasePool<A>(_:) + 57
17  RedLemon                      	       0x10b87442f SelectableEventLoop.run() + 591
18  RedLemon                      	       0x10b816148 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856
19  RedLemon                      	       0x10b81689a closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282
20  RedLemon                      	       0x10b81cb73 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10b8aca3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10b8af5af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007
23  RedLemon                      	       0x10b8af669 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 7:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff810079976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80fefe7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80fefec9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10b81f03f NIOThreadPool.process(identifier:) + 143
4   RedLemon                      	       0x10b81ff0e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222
5   RedLemon                      	       0x10b8aca3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10b8af5af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007
7   RedLemon                      	       0x10b8af669 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 8:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff810079976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80fefe7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80fefec9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10b81f03f NIOThreadPool.process(identifier:) + 143
4   RedLemon                      	       0x10b81ff0e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222
5   RedLemon                      	       0x10b8aca3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10b8af5af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007
7   RedLemon                      	       0x10b8af669 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 9:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff810079976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80fefe7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80fefec9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10b81f03f NIOThreadPool.process(identifier:) + 143
4   RedLemon                      	       0x10b81ff0e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222
5   RedLemon                      	       0x10b8aca3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10b8af5af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007
7   RedLemon                      	       0x10b8af669 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 10:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff810079976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff80fefe7ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff80fefec9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10b81f03f NIOThreadPool.process(identifier:) + 143
4   RedLemon                      	       0x10b81ff0e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222
5   RedLemon                      	       0x10b8aca3f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10b8af5af closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007
7   RedLemon                      	       0x10b8af669 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 11:: AMCP Logging Spool
0   libsystem_kernel.dylib        	    0x7ff810079976 semaphore_wait_trap + 10
1   caulk                         	    0x7ff818bba2e6 caulk::mach::semaphore::wait_or_error() + 16
2   caulk                         	    0x7ff818ba2148 caulk::concurrent::details::worker_thread::run() + 36
3   caulk                         	    0x7ff818ba1e0c void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*) + 41
4   libsystem_pthread.dylib       	    0x7ff8100b64e1 _pthread_start + 125
5   libsystem_pthread.dylib       	    0x7ff8100b1f6b thread_start + 15

Thread 12:
0   libsystem_pthread.dylib       	    0x7ff8100b1f48 start_wqthread + 0

Thread 13:
0   libsystem_pthread.dylib       	    0x7ff8100b1f48 start_wqthread + 0

Thread 14 Crashed::  Dispatch queue: com.apple.root.user-initiated-qos.cooperative
0   libmpv.2.dylib                	       0x11345d309 mpv_wait_event + 137
1   RedLemon                      	       0x10c760a77 (3) suspend resume partial function for MPVWrapper.pollEvents() + 439
2   RedLemon                      	       0x10c749681 (2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:) + 1

Thread 15:
0   libsystem_pthread.dylib       	    0x7ff8100b1f48 start_wqthread + 0

Thread 16:
0   libsystem_pthread.dylib       	    0x7ff8100b1f48 start_wqthread + 0

Thread 17:
0   libsystem_pthread.dylib       	    0x7ff8100b1f48 start_wqthread + 0

Thread 18:
0   libsystem_pthread.dylib       	    0x7ff8100b1f48 start_wqthread + 0


Thread 14 crashed with X86 Thread State (64-bit):
  rax: 0x00000531da52eb98  rbx: 0x00007fa8701cf090  rcx: 0x0000000005f5e100  rdx: 0x00000531da52eb98
  rdi: 0xffffface2ba2f568  rsi: 0x00007fffffe00050  rbp: 0x0000700010195c90  rsp: 0x0000700010195c50
   r8: 0x0000000000000001   r9: 0x80000000ffffffff  r10: 0xfffffffe00000000  r11: 0x0000000000000246
  r12: 0x00000531da52eb98  r13: 0x00007fa8632cb268  r14: 0x00007fa8632cb1e0  r15: 0x0000000000000000
  rip: 0x000000011345d309  rfl: 0x0000000000010213  cr2: 0x0000000000000000

Logical CPU:     3
Error Code:      0x00000006 (no mapping for user data write)
Trap Number:     14

Thread 14 instruction stream:
  6e 0b 00 41 80 be c0 01-00 00 00 75 0c 49 8b 46  n..A.......u.I.F
  50 48 8b 38 e8 fe 0c 02-00 41 c6 86 c0 01 00 00  PH.8.....A......
  01 66 0f 57 c0 66 0f 28-4d c0 66 0f 28 d1 f2 0f  .f.W.f.(M.f.(...
  c2 d0 01 f2 0f 10 05 e4-0f 0c 00 66 0f 54 c2 66  ...........f.T.f
  0f 55 d1 66 0f 56 d0 66-0f 29 55 c0 e8 e6 9b 08  .U.f.V.f.)U.....
  00 48 89 c7 0f 28 45 c0-e8 2a 9c 08 00 49 89 c4  .H...(E..*...I..
 [49]c7 07 00 00 00 00 49-c7 47 08 00 00 00 00 49  I......I.G.....I	<==
  c7 47 10 00 00 00 00 4c-89 ff e8 48 a3 08 00 31  .G.....L...H...1
  c0 41 80 be 68 01 00 00-00 4c 0f 45 e0 41 80 be  .A..h....L.E.A..
  90 01 00 00 00 41 8b 86-80 01 00 00 74 09 85 c0  .....A......t...
  75 0d e9 1e 03 00 00 85-c0 0f 84 c8 00 00 00 49  u..............I
  8b 86 70 01 00 00 48 85-c0 0f 84 b8 00 00 00 49  ..p...H........I

Binary Images:
    0x7ff8100fd000 -     0x7ff8105fffff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff810f7a000 -     0x7ff811336fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
       0x10aa19000 -        0x10d840fff com.redlemon.app (1.0.185) <9fb7b00a-0a08-3fd0-93a9-1dbf0a0d2f12> /Applications/RedLemon.app/Contents/MacOS/RedLemon
    0x7ff810078000 -     0x7ff8100affff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff812b7b000 -     0x7ff813a0afff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7ff8100b0000 -     0x7ff8100bbfff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff814b61000 -     0x7ff814feffff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff82507e000 -     0x7ff82507ffff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff81d574000 -     0x7ff81d9edfff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff80fefb000 -     0x7ff80ff41fff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib
    0x7ff818ba0000 -     0x7ff818bc1fff com.apple.audio.caulk (1.0) <f04b5c91-d0ec-33c6-8a81-b80a3ebf827f> /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk
       0x11339e000 -        0x11365dfff libmpv.2.dylib (*) <e355e4d8-dcc6-3439-90d2-abf0776cc6ac> /Applications/RedLemon.app/Contents/Frameworks/libmpv.2.dylib

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
Writable regions: Total=890.6M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=890.6M(100%)

                                VIRTUAL   REGION
REGION TYPE                        SIZE    COUNT (non-coalesced)
===========                     =======  =======
Accelerate framework               384K        3
Activity Tracing                   256K        1
CG backing stores                  528K        4
CG image                           132K       10
CG raster data                      80K        5
ColorSync                          236K       28
CoreAnimation                      804K       43
CoreGraphics                        12K        2
CoreUI image data                  532K       10
Foundation                          16K        1
IOKit                             7940K        1
Image IO                          10.2M       12
Kernel Alloc Once                   12K        2
MALLOC                           813.5M      296
MALLOC guard page                   48K       10
MALLOC_LARGE (reserved)           1024K        1         reserved VM address space (unallocated)
OpenGL GLSL                        384K        5
SQLite page cache                  640K       10
STACK GUARD                       56.1M       19
Stack                             17.1M       19
VM_ALLOCATE                       11.9M      119
__CTF                               756        1
__DATA                            55.5M      609
__DATA_CONST                      33.7M      416
__DATA_DIRTY                      1658K      205
__FONT_DATA                          4K        1
__GLSLBUILTINS                    5176K        1
__LINKEDIT                       738.0M       85
__OBJC_RO                         82.9M        1
__OBJC_RW                         3200K        2
__TEXT                           608.0M      615
__UNICODE                          592K        1
dyld private memory               1024K        1
libnetwork                        15.6M       56
mapped file                      347.0M       36
shared memory                     2844K       23
===========                     =======  =======
TOTAL                              2.8G     2654
TOTAL, minus reserved VM space     2.7G     2654



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2026-02-02 01:34:59.00 -0500","app_version":"1.0.185","slice_uuid":"9fb7b00a-0a08-3fd0-93a9-1dbf0a0d2f12","build_version":"185","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"B9D137C2-FB26-4769-BE0A-BCCE9A5E6B45","name":"RedLemon"}
{
  "uptime" : 49000,
  "procLaunch" : "2026-02-01 23:58:43.2091 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookAir7,1",
  "procStartAbsTime" : 43532257104002,
  "coalitionID" : 1288,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2026-02-02 01:34:53.3186 -0500",
  "incident" : "B9D137C2-FB26-4769-BE0A-BCCE9A5E6B45",
  "bug_type" : "309",
  "pid" : 10463,
  "procExitAbsTime" : 49302041351376,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Applications\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.185","CFBundleVersion":"185","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"DE7DE55C-FAC2-51DA-92D1-22902ED1697D","thirdParty":true},
  "parentProc" : "launchd",
  "parentPid" : 1,
  "coalitionName" : "com.redlemon.app",
  "crashReporterKey" : "24F646B6-E55A-DF4C-178D-891130B3FBCE",
  "sip" : "enabled",
  "vmRegionInfo" : "0 is not in any region.  Bytes before following region: 4473327616\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      UNUSED SPACE AT START\n--->  \n      __TEXT                      10aa19000-10d841000    [ 46.2M] r-x\/r-x SM=COW  ...acOS\/RedLemon",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_ACCESS","signal":"SIGSEGV","subtype":"KERN_INVALID_ADDRESS at 0x0000000000000000"},
  "termination" : {"flags":0,"code":11,"namespace":"SIGNAL","indicator":"Segmentation fault: 11","byProc":"exc handler","byPid":10463},
  "vmregioninfo" : "0 is not in any region.  Bytes before following region: 4473327616\n      REGION TYPE                    START - END         [ VSIZE] PRT\/MAX SHRMOD  REGION DETAIL\n      UNUSED SPACE AT START\n--->  \n      __TEXT                      10aa19000-10d841000    [ 46.2M] r-x\/r-x SM=COW  ...acOS\/RedLemon",
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 14,
  "threads" : [{"id":242215,"queue":"com.apple.main-thread","frames":[{"imageOffset":639727,"symbol":"__CFCalendarCreateUCalendar","symbolLocation":96,"imageIndex":0},{"imageOffset":1616077,"symbol":"_CFCalendarInitialize","symbolLocation":649,"imageIndex":0},{"imageOffset":639076,"symbol":"_CFCalendarCreate","symbolLocation":133,"imageIndex":0},{"imageOffset":669487,"symbol":"CFCalendarCreateWithIdentifier","symbolLocation":39,"imageIndex":0},{"imageOffset":756946,"symbol":"__CreateCFDateFormatter","symbolLocation":195,"imageIndex":0},{"imageOffset":1045669,"symbol":"CFDateFormatterCreateISO8601Formatter","symbolLocation":95,"imageIndex":0},{"imageOffset":867975,"symbol":"-[NSISO8601DateFormatter init]","symbolLocation":148,"imageIndex":1},{"imageOffset":24344227,"symbol":"@nonobjc NSISO8601DateFormatter.init()","symbolLocation":19,"imageIndex":2},{"imageOffset":24326991,"symbol":"NSISO8601DateFormatter.__allocating_init()","symbolLocation":31,"imageIndex":2},{"imageOffset":37191062,"symbol":"SocialService.recalculateUserActivity(userId:)","symbolLocation":1750,"imageIndex":2},{"imageOffset":37186990,"symbol":"SocialService.handlePresenceJoin(mapKey:metadata:)","symbolLocation":1630,"imageIndex":2},{"imageOffset":37174083,"symbol":"(1) suspend resume partial function for closure #1 in closure #1 in SocialService.setupPresenceChannel(userId:username:)","symbolLocation":387,"imageIndex":2},{"imageOffset":37384305,"symbol":"(1) await resume partial function for partial apply for closure #1 in closure #1 in SocialService.setupPresenceChannel(userId:username:)","symbolLocation":1,"imageIndex":2}]},{"id":242270,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":3},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":0},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":0},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":0},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":4},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":242285,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":3},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":0},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":0},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":0},{"imageOffset":2394468,"imageIndex":6},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":1},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":242288,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":3},{"imageOffset":15241417,"symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":2},{"imageOffset":15282159,"symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":95,"imageIndex":2},{"imageOffset":15283780,"symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":2},{"imageOffset":15244667,"symbol":"syscall<A>(blocking:where:_:)","symbolLocation":395,"imageIndex":2},{"imageOffset":15281896,"symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":312,"imageIndex":2},{"imageOffset":15137206,"symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":230,"imageIndex":2},{"imageOffset":15141407,"symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":2},{"imageOffset":15079651,"symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":467,"imageIndex":2},{"imageOffset":15131085,"symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":1053,"imageIndex":2},{"imageOffset":15104756,"symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","symbolLocation":100,"imageIndex":2},{"imageOffset":15057838,"symbol":"closure #2 in SelectableEventLoop.run()","symbolLocation":158,"imageIndex":2},{"imageOffset":15071188,"symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":2},{"imageOffset":15024994,"symbol":"closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":34,"imageIndex":2},{"imageOffset":15025068,"symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":2},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":7},{"imageOffset":15024905,"symbol":"withAutoReleasePool<A>(_:)","symbolLocation":57,"imageIndex":2},{"imageOffset":15053871,"symbol":"SelectableEventLoop.run()","symbolLocation":591,"imageIndex":2},{"imageOffset":14668104,"symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","symbolLocation":856,"imageIndex":2},{"imageOffset":14669978,"symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":282,"imageIndex":2},{"imageOffset":14695283,"symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":2},{"imageOffset":15284799,"symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15295919,"symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":1007,"imageIndex":2},{"imageOffset":15296105,"symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":242289,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":3},{"imageOffset":15241417,"symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":2},{"imageOffset":15282159,"symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":95,"imageIndex":2},{"imageOffset":15283780,"symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":2},{"imageOffset":15244667,"symbol":"syscall<A>(blocking:where:_:)","symbolLocation":395,"imageIndex":2},{"imageOffset":15281896,"symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":312,"imageIndex":2},{"imageOffset":15137206,"symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":230,"imageIndex":2},{"imageOffset":15141407,"symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":2},{"imageOffset":15079842,"symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":50,"imageIndex":2},{"imageOffset":15079927,"symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":2},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":8},{"imageOffset":15079530,"symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":346,"imageIndex":2},{"imageOffset":15131085,"symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":1053,"imageIndex":2},{"imageOffset":15104756,"symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","symbolLocation":100,"imageIndex":2},{"imageOffset":15057838,"symbol":"closure #2 in SelectableEventLoop.run()","symbolLocation":158,"imageIndex":2},{"imageOffset":15071188,"symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":2},{"imageOffset":15024994,"symbol":"closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":34,"imageIndex":2},{"imageOffset":15025068,"symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":2},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":7},{"imageOffset":15024905,"symbol":"withAutoReleasePool<A>(_:)","symbolLocation":57,"imageIndex":2},{"imageOffset":15053871,"symbol":"SelectableEventLoop.run()","symbolLocation":591,"imageIndex":2},{"imageOffset":14668104,"symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","symbolLocation":856,"imageIndex":2},{"imageOffset":14669978,"symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":282,"imageIndex":2},{"imageOffset":14695283,"symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":2},{"imageOffset":15284799,"symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15295919,"symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":1007,"imageIndex":2},{"imageOffset":15296105,"symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":242290,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":3},{"imageOffset":15241417,"symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":2},{"imageOffset":15282159,"symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":95,"imageIndex":2},{"imageOffset":15283780,"symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":2},{"imageOffset":15244667,"symbol":"syscall<A>(blocking:where:_:)","symbolLocation":395,"imageIndex":2},{"imageOffset":15281896,"symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":312,"imageIndex":2},{"imageOffset":15137206,"symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":230,"imageIndex":2},{"imageOffset":15141407,"symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":2},{"imageOffset":15079842,"symbol":"closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":50,"imageIndex":2},{"imageOffset":15079927,"symbol":"partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":39,"imageIndex":2},{"imageOffset":1161004,"symbol":"withUnsafePointer<A, B>(to:_:)","symbolLocation":12,"imageIndex":8},{"imageOffset":15079530,"symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":346,"imageIndex":2},{"imageOffset":15131085,"symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":1053,"imageIndex":2},{"imageOffset":15104756,"symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","symbolLocation":100,"imageIndex":2},{"imageOffset":15057838,"symbol":"closure #2 in SelectableEventLoop.run()","symbolLocation":158,"imageIndex":2},{"imageOffset":15071188,"symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":2},{"imageOffset":15024994,"symbol":"closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":34,"imageIndex":2},{"imageOffset":15025068,"symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":2},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":7},{"imageOffset":15024905,"symbol":"withAutoReleasePool<A>(_:)","symbolLocation":57,"imageIndex":2},{"imageOffset":15053871,"symbol":"SelectableEventLoop.run()","symbolLocation":591,"imageIndex":2},{"imageOffset":14668104,"symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","symbolLocation":856,"imageIndex":2},{"imageOffset":14669978,"symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":282,"imageIndex":2},{"imageOffset":14695283,"symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":2},{"imageOffset":15284799,"symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15295919,"symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":1007,"imageIndex":2},{"imageOffset":15296105,"symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":242291,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":3},{"imageOffset":15241417,"symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":2},{"imageOffset":15282159,"symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":95,"imageIndex":2},{"imageOffset":15283780,"symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":2},{"imageOffset":15244667,"symbol":"syscall<A>(blocking:where:_:)","symbolLocation":395,"imageIndex":2},{"imageOffset":15281896,"symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":312,"imageIndex":2},{"imageOffset":15137206,"symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":230,"imageIndex":2},{"imageOffset":15141407,"symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":2},{"imageOffset":15079651,"symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","symbolLocation":467,"imageIndex":2},{"imageOffset":15131085,"symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":1053,"imageIndex":2},{"imageOffset":15104756,"symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","symbolLocation":100,"imageIndex":2},{"imageOffset":15057838,"symbol":"closure #2 in SelectableEventLoop.run()","symbolLocation":158,"imageIndex":2},{"imageOffset":15071188,"symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":2},{"imageOffset":15024994,"symbol":"closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":34,"imageIndex":2},{"imageOffset":15025068,"symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":2},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":7},{"imageOffset":15024905,"symbol":"withAutoReleasePool<A>(_:)","symbolLocation":57,"imageIndex":2},{"imageOffset":15053871,"symbol":"SelectableEventLoop.run()","symbolLocation":591,"imageIndex":2},{"imageOffset":14668104,"symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","symbolLocation":856,"imageIndex":2},{"imageOffset":14669978,"symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":282,"imageIndex":2},{"imageOffset":14695283,"symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":2},{"imageOffset":15284799,"symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15295919,"symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":1007,"imageIndex":2},{"imageOffset":15296105,"symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":242292,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14704703,"symbol":"NIOThreadPool.process(identifier:)","symbolLocation":143,"imageIndex":2},{"imageOffset":14708494,"symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","symbolLocation":222,"imageIndex":2},{"imageOffset":15284799,"symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15295919,"symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":1007,"imageIndex":2},{"imageOffset":15296105,"symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":242293,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14704703,"symbol":"NIOThreadPool.process(identifier:)","symbolLocation":143,"imageIndex":2},{"imageOffset":14708494,"symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","symbolLocation":222,"imageIndex":2},{"imageOffset":15284799,"symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15295919,"symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":1007,"imageIndex":2},{"imageOffset":15296105,"symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":242294,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14704703,"symbol":"NIOThreadPool.process(identifier:)","symbolLocation":143,"imageIndex":2},{"imageOffset":14708494,"symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","symbolLocation":222,"imageIndex":2},{"imageOffset":15284799,"symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15295919,"symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":1007,"imageIndex":2},{"imageOffset":15296105,"symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":242295,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":9},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":9},{"imageOffset":14704703,"symbol":"NIOThreadPool.process(identifier:)","symbolLocation":143,"imageIndex":2},{"imageOffset":14708494,"symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","symbolLocation":222,"imageIndex":2},{"imageOffset":15284799,"symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":2},{"imageOffset":15295919,"symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":1007,"imageIndex":2},{"imageOffset":15296105,"symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":242693,"name":"AMCP Logging Spool","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":3},{"imageOffset":107238,"symbol":"caulk::mach::semaphore::wait_or_error()","symbolLocation":16,"imageIndex":10},{"imageOffset":8520,"symbol":"caulk::concurrent::details::worker_thread::run()","symbolLocation":36,"imageIndex":10},{"imageOffset":7692,"symbol":"void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*)","symbolLocation":41,"imageIndex":10},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":5},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":5}]},{"id":273765,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"id":273900,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"triggered":true,"id":273987,"instructionState":{"instructionStream":{"bytes":[110,11,0,65,128,190,192,1,0,0,0,117,12,73,139,70,80,72,139,56,232,254,12,2,0,65,198,134,192,1,0,0,1,102,15,87,192,102,15,40,77,192,102,15,40,209,242,15,194,208,1,242,15,16,5,228,15,12,0,102,15,84,194,102,15,85,209,102,15,86,208,102,15,41,85,192,232,230,155,8,0,72,137,199,15,40,69,192,232,42,156,8,0,73,137,196,73,199,7,0,0,0,0,73,199,71,8,0,0,0,0,73,199,71,16,0,0,0,0,76,137,255,232,72,163,8,0,49,192,65,128,190,104,1,0,0,0,76,15,69,224,65,128,190,144,1,0,0,0,65,139,134,128,1,0,0,116,9,133,192,117,13,233,30,3,0,0,133,192,15,132,200,0,0,0,73,139,134,112,1,0,0,72,133,192,15,132,184,0,0,0,73],"offset":96}},"threadState":{"r13":{"value":140361195106920},"rax":{"value":5711674403736},"rflags":{"value":66067},"cpu":{"value":3},"r14":{"value":140361195106784},"rsi":{"value":140737486258256},"r8":{"value":1},"cr2":{"value":0},"rdx":{"value":5711674403736},"r10":{"value":18446744065119617024},"r9":{"value":9223372041149743103},"r15":{"value":0},"rbx":{"value":140361412178064},"trap":{"value":14,"description":"(no mapping for user data write)"},"err":{"value":6},"r11":{"value":582},"rip":{"value":4618310409,"matchesCrashFrame":1},"rbp":{"value":123145572408464},"rsp":{"value":123145572408400},"r12":{"value":5711674403736},"rcx":{"value":100000000},"flavor":"x86_THREAD_STATE","rdi":{"value":18446738362135147880}},"queue":"com.apple.root.user-initiated-qos.cooperative","frames":[{"imageOffset":783113,"symbol":"mpv_wait_event","symbolLocation":137,"imageIndex":11},{"imageOffset":30702199,"symbol":"(3) suspend resume partial function for MPVWrapper.pollEvents()","symbolLocation":439,"imageIndex":2},{"imageOffset":30606977,"symbol":"(2) await resume partial function for closure #1 in MPVWrapper.setupVideo(in:)","symbolLocation":1,"imageIndex":2}]},{"id":274079,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"id":274145,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"id":274277,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]},{"id":274278,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":5}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703398088704,
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
    "base" : 140703413280768,
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
    "base" : 4473327616,
    "CFBundleShortVersionString" : "1.0.185",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 48398336,
    "uuid" : "9fb7b00a-0a08-3fd0-93a9-1dbf0a0d2f12",
    "path" : "\/Applications\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "185"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703397543936,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703442644992,
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
    "base" : 140703397773312,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703476092928,
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
    "base" : 140703749890048,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703620874240,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703395983360,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703543459840,
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
    "base" : 4617527296,
    "size" : 2883584,
    "uuid" : "e355e4d8-dcc6-3439-90d2-abf0776cc6ac",
    "path" : "\/Applications\/RedLemon.app\/Contents\/Frameworks\/libmpv.2.dylib",
    "name" : "libmpv.2.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703394512896,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=890.6M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=890.6M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               384K        3 \nActivity Tracing                   256K        1 \nCG backing stores                  528K        4 \nCG image                           132K       10 \nCG raster data                      80K        5 \nColorSync                          236K       28 \nCoreAnimation                      804K       43 \nCoreGraphics                        12K        2 \nCoreUI image data                  532K       10 \nFoundation                          16K        1 \nIOKit                             7940K        1 \nImage IO                          10.2M       12 \nKernel Alloc Once                   12K        2 \nMALLOC                           813.5M      296 \nMALLOC guard page                   48K       10 \nMALLOC_LARGE (reserved)           1024K        1         reserved VM address space (unallocated)\nOpenGL GLSL                        384K        5 \nSQLite page cache                  640K       10 \nSTACK GUARD                       56.1M       19 \nStack                             17.1M       19 \nVM_ALLOCATE                       11.9M      119 \n__CTF                               756        1 \n__DATA                            55.5M      609 \n__DATA_CONST                      33.7M      416 \n__DATA_DIRTY                      1658K      205 \n__FONT_DATA                          4K        1 \n__GLSLBUILTINS                    5176K        1 \n__LINKEDIT                       738.0M       85 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           608.0M      615 \n__UNICODE                          592K        1 \ndyld private memory               1024K        1 \nlibnetwork                        15.6M       56 \nmapped file                      347.0M       36 \nshared memory                     2844K       23 \n===========                     =======  ======= \nTOTAL                              2.8G     2654 \nTOTAL, minus reserved VM space     2.7G     2654 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.root.user-initiated-qos.cooperative"
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
