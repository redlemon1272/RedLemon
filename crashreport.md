-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [53913]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.14 (14)
Code Type:             X86-64 (Native)
Parent Process:        Exited process [53594]
Responsible:           Electron [608]
User ID:               501

Date/Time:             2025-12-05 15:05:45.9766 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA


Time Awake Since Boot: 10000 seconds

System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 4 Illegal instruction: 4
Terminating Process:   exc handler [53913]

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   libswiftCore.dylib            	    0x7ff80ff50245 _assertionFailure(_:_:file:line:flags:) + 421
1   SwiftUI                       	    0x7ff90ebe6b43 ListStyleDataSource.deleteCell(forRow:) + 759
2   SwiftUI                       	    0x7ff90e069fca closure #1 in closure #2 in NSTableViewListCoordinator.tableView(_:rowActionsForRow:edge:) + 119
3   SwiftUI                       	    0x7ff90e286e3c thunk for @escaping @callee_guaranteed () -> () + 12
4   SwiftUI                       	    0x7ff90e06e617 partial apply for thunk for @escaping @callee_guaranteed () -> () + 17
5   SwiftUI                       	    0x7ff90e973a1b static Update.end() + 520
6   SwiftUI                       	    0x7ff90e069ee8 closure #2 in NSTableViewListCoordinator.tableView(_:rowActionsForRow:edge:) + 343
7   SwiftUI                       	    0x7ff90e06e461 partial apply for closure #2 in NSTableViewListCoordinator.tableView(_:rowActionsForRow:edge:) + 94
8   SwiftUI                       	    0x7ff90e464904 thunk for @escaping @callee_guaranteed (@guaranteed NSTableViewRowAction, @unowned Int) -> () + 57
9   AppKit                        	    0x7ff805f10430 -[NSTableRowData _actionButtonClicked:] + 293
10  AppKit                        	    0x7ff805767c6a -[NSApplication(NSResponder) sendAction:to:from:] + 288
11  AppKit                        	    0x7ff805767b10 -[NSControl sendAction:to:] + 86
12  AppKit                        	    0x7ff805aac136 -[NSTableViewActionButton mouseDown:] + 349
13  AppKit                        	    0x7ff805761761 -[NSWindow(NSEventRouting) _handleMouseDownEvent:isDelayedEvent:] + 4859
14  AppKit                        	    0x7ff8056d5922 -[NSWindow(NSEventRouting) _reallySendEvent:isDelayedEvent:] + 2582
15  AppKit                        	    0x7ff8056d4cf2 -[NSWindow(NSEventRouting) sendEvent:] + 352
16  AppKit                        	    0x7ff8056d30c8 -[NSApplication(NSEvent) sendEvent:] + 352
17  AppKit                        	    0x7ff80598bf0a -[NSApplication _handleEvent:] + 65
18  AppKit                        	    0x7ff80555483d -[NSApplication run] + 623
19  AppKit                        	    0x7ff80552879a NSApplicationMain + 817
20  SwiftUI                       	    0x7ff90e07909c specialized runApp(_:) + 161
21  SwiftUI                       	    0x7ff90eadb424 runApp<A>(_:) + 164
22  SwiftUI                       	    0x7ff90e5d3c5f static App.main() + 63
23  RedLemon                      	       0x10f5bc6f3 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
24  RedLemon                      	       0x10f5bc779 RedLemon_main + 9
25  dyld                          	       0x120d2852e start + 462

Thread 1:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	    0x7ff802a2393a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff802a23ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff802b2729d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff802b25928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff802b24d6c CFRunLoopRunSpecific + 562
5   AppKit                        	    0x7ff8056d1572 _NSEventThread + 132
6   libsystem_pthread.dylib       	    0x7ff802a604e1 _pthread_start + 125
7   libsystem_pthread.dylib       	    0x7ff802a5bf6b thread_start + 15

Thread 2:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	    0x7ff802a2393a mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff802a23ca8 mach_msg + 56
2   CoreFoundation                	    0x7ff802b2729d __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff802b25928 __CFRunLoopRun + 1276
4   CoreFoundation                	    0x7ff802b24d6c CFRunLoopRunSpecific + 562
5   CFNetwork                     	    0x7ff807753964 0x7ff80750b000 + 2394468
6   Foundation                    	    0x7ff80397c724 __NSThread__start__ + 1009
7   libsystem_pthread.dylib       	    0x7ff802a604e1 _pthread_start + 125
8   libsystem_pthread.dylib       	    0x7ff802a5bf6b thread_start + 15

Thread 3:: NIO-SGLTN-0-#0
0   libsystem_kernel.dylib        	    0x7ff802a2830e kevent + 10
1   RedLemon                      	       0x10f38d009 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10f396f2f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10f397584 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10f38dcbb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10f396e28 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10f3738f6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10f37495f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10f365823 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10f37210d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10f36ba34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10f3602ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10f363714 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10f3582a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10f3582ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff817a28e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10f358249 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10f35f36f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10f301088 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10f3017da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10f307ab3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10f39797f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10f39a4ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10f39a5a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff802a604e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff802a5bf6b thread_start + 15

Thread 4:: NIO-SGLTN-0-#1
0   libsystem_kernel.dylib        	    0x7ff802a2830e kevent + 10
1   RedLemon                      	       0x10f38d009 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10f396f2f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10f397584 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10f38dcbb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10f396e28 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10f3738f6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10f37495f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10f365823 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10f37210d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10f36ba34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10f3602ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10f363714 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10f3582a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10f3582ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff817a28e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10f358249 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10f35f36f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10f301088 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10f3017da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10f307ab3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10f39797f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10f39a4ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10f39a5a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff802a604e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff802a5bf6b thread_start + 15

Thread 5:: NIO-SGLTN-0-#2
0   libsystem_kernel.dylib        	    0x7ff802a2830e kevent + 10
1   RedLemon                      	       0x10f38d009 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10f396f2f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10f397584 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10f38dcbb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10f396e28 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10f3738f6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10f37495f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10f365823 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10f37210d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10f36ba34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10f3602ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10f363714 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10f3582a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10f3582ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff817a28e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10f358249 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10f35f36f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10f301088 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10f3017da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10f307ab3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10f39797f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10f39a4ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10f39a5a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff802a604e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff802a5bf6b thread_start + 15

Thread 6:: NIO-SGLTN-0-#3
0   libsystem_kernel.dylib        	    0x7ff802a2830e kevent + 10
1   RedLemon                      	       0x10f38d009 @nonobjc kevent(_:_:_:_:_:_:) + 9
2   RedLemon                      	       0x10f396f2f closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911)
3   RedLemon                      	       0x10f397584 partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36
4   RedLemon                      	       0x10f38dcbb syscall<A>(blocking:where:_:) + 395 (System.swift:247)
5   RedLemon                      	       0x10f396e28 static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910)
6   RedLemon                      	       0x10f3738f6 closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212)
7   RedLemon                      	       0x10f37495f partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15
8   RedLemon                      	       0x10f365823 Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31)
9   RedLemon                      	       0x10f37210d Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211)
10  RedLemon                      	       0x10f36ba34 Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288)
11  RedLemon                      	       0x10f3602ee closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653)
12  RedLemon                      	       0x10f363714 partial apply for closure #2 in SelectableEventLoop.run() + 20
13  RedLemon                      	       0x10f3582a2 closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27)
14  RedLemon                      	       0x10f3582ec partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28
15  libswiftObjectiveC.dylib      	    0x7ff817a28e7c autoreleasepool<A>(invoking:) + 44
16  RedLemon                      	       0x10f358249 withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26)
17  RedLemon                      	       0x10f35f36f SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652)
18  RedLemon                      	       0x10f301088 static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93)
19  RedLemon                      	       0x10f3017da closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111)
20  RedLemon                      	       0x10f307ab3 partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51
21  RedLemon                      	       0x10f39797f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
22  RedLemon                      	       0x10f39a4ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
23  RedLemon                      	       0x10f39a5a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
24  libsystem_pthread.dylib       	    0x7ff802a604e1 _pthread_start + 125
25  libsystem_pthread.dylib       	    0x7ff802a5bf6b thread_start + 15

Thread 7:: TP-#0
0   libsystem_kernel.dylib        	    0x7ff802a23976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8028a87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff8028a8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10f309f7f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10f30ae4e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10f39797f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10f39a4ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10f39a5a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff802a604e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff802a5bf6b thread_start + 15

Thread 8:: TP-#1
0   libsystem_kernel.dylib        	    0x7ff802a23976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8028a87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff8028a8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10f309f7f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10f30ae4e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10f39797f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10f39a4ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10f39a5a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff802a604e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff802a5bf6b thread_start + 15

Thread 9:: TP-#2
0   libsystem_kernel.dylib        	    0x7ff802a23976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8028a87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff8028a8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10f309f7f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10f30ae4e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10f39797f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10f39a4ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10f39a5a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff802a604e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff802a5bf6b thread_start + 15

Thread 10:: TP-#3
0   libsystem_kernel.dylib        	    0x7ff802a23976 semaphore_wait_trap + 10
1   libdispatch.dylib             	    0x7ff8028a87ce _dispatch_sema4_wait + 16
2   libdispatch.dylib             	    0x7ff8028a8c9d _dispatch_semaphore_wait_slow + 98
3   RedLemon                      	       0x10f309f7f NIOThreadPool.process(identifier:) + 143 (NIOThreadPool.swift:186)
4   RedLemon                      	       0x10f30ae4e closure #3 in NIOThreadPool._start(threadNamePrefix:) + 222 (NIOThreadPool.swift:252)
5   RedLemon                      	       0x10f39797f thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15
6   RedLemon                      	       0x10f39a4ef closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116)
7   RedLemon                      	       0x10f39a5a9 @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9
8   libsystem_pthread.dylib       	    0x7ff802a604e1 _pthread_start + 125
9   libsystem_pthread.dylib       	    0x7ff802a5bf6b thread_start + 15

Thread 11:
0   libsystem_pthread.dylib       	    0x7ff802a5bf48 start_wqthread + 0

Thread 12:
0   libsystem_pthread.dylib       	    0x7ff802a5bf48 start_wqthread + 0

Thread 13:
0   libsystem_pthread.dylib       	    0x7ff802a5bf48 start_wqthread + 0

Thread 14:
0   libsystem_pthread.dylib       	    0x7ff802a5bf48 start_wqthread + 0

Thread 15:
0   libsystem_pthread.dylib       	    0x7ff802a5bf48 start_wqthread + 0


Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x0000000200000003  rbx: 0x00007ff90ed50100  rcx: 0xfffffffe00000000  rdx: 0x0000000000000003
  rdi: 0x00007fe22fa71428  rsi: 0x0000000017bf4306  rbp: 0x00007ff7b19fa3f0  rsp: 0x00007ff7b19fa3a0
   r8: 0x000000000000b167   r9: 0x0000000000000008  r10: 0x00007fe233c00000  r11: 0x0000000000000000
  r12: 0x000000000000004f  r13: 0x000000000000011d  r14: 0x00007fe22fa71420  r15: 0x000000000000000b
  rip: 0x00007ff80ff50245  rfl: 0x0000000000010246  cr2: 0x0000000000000000
  
Logical CPU:     1
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
    0x7ff80ff1e000 -     0x7ff810397fff libswiftCore.dylib (*) <222d44bb-076b-3be8-a051-cddfc2b961dc> /usr/lib/swift/libswiftCore.dylib
    0x7ff90dffd000 -     0x7ff90ee9cfff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
    0x7ff805525000 -     0x7ff8063b4fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x10e504000 -        0x110517fff com.redlemon.app (1.0.14) <dec39f41-ef33-3683-960c-011627f29de1> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x120d23000 -        0x120d8efff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff802a22000 -     0x7ff802a59fff libsystem_kernel.dylib (*) <2fe67e94-4a5e-3506-9e02-502f7270f7ef> /usr/lib/system/libsystem_kernel.dylib
    0x7ff802aa7000 -     0x7ff802fa9fff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff802a5a000 -     0x7ff802a65fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib
    0x7ff80750b000 -     0x7ff807999fff com.apple.CFNetwork (1335.5) <1498ec5d-cbe9-352b-8b10-030e042445c5> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7ff803924000 -     0x7ff803ce0fff com.apple.Foundation (6.9) <61133096-d5f9-34bd-94b1-1e526ea018b1> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7ff817a28000 -     0x7ff817a29fff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff8028a5000 -     0x7ff8028ebfff libdispatch.dylib (*) <37860d89-d337-3140-8973-ac199acbc361> /usr/lib/system/libdispatch.dylib

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
Writable regions: Total=178.1M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=178.1M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               512K        4 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                           328K       13 
CG raster data                     228K       13 
ColorSync                          232K       28 
CoreAnimation                     5468K      180 
CoreGraphics                        12K        2 
CoreUI image data                 2552K       19 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
IOKit                             7940K        1 
Image IO                           256K        1 
Kernel Alloc Once                    8K        1 
MALLOC                            81.1M       90 
MALLOC guard page                   48K       11 
SQLite page cache                  192K        3 
STACK GUARD                       56.1M       16 
Stack                             15.6M       16 
VM_ALLOCATE                       3144K       17 
__CTF                               756        1 
__DATA                            55.0M      599 
__DATA_CONST                      33.3M      408 
__DATA_DIRTY                      1651K      203 
__FONT_DATA                          4K        1 
__LINKEDIT                       708.9M       83 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           583.5M      606 
__UNICODE                          592K        1 
dyld private memory               1024K        3 
libnetwork                        13.6M       40 
mapped file                      156.8M       30 
shared memory                     2820K       19 
===========                     =======  ======= 
TOTAL                              1.8G     2419 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2025-12-05 15:05:49.00 -0500","app_version":"1.0.14","slice_uuid":"dec39f41-ef33-3683-960c-011627f29de1","build_version":"14","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"8F72725F-DDD2-4D7B-91B8-6B2D8DF80811","name":"RedLemon"}
{
  "uptime" : 10000,
  "procLaunch" : "2025-12-05 14:51:02.4863 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 9664941980420,
  "coalitionID" : 714,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2025-12-05 15:05:45.9766 -0500",
  "incident" : "8F72725F-DDD2-4D7B-91B8-6B2D8DF80811",
  "bug_type" : "309",
  "pid" : 53913,
  "procExitAbsTime" : 10548369684936,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.14","CFBundleVersion":"14","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "Exited process",
  "parentPid" : 53594,
  "coalitionName" : "com.google.antigravity",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "responsiblePid" : 608,
  "responsibleProc" : "Electron",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_INSTRUCTION","signal":"SIGILL"},
  "termination" : {"flags":0,"code":4,"namespace":"SIGNAL","indicator":"Illegal instruction: 4","byProc":"exc handler","byPid":53913},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 0,
  "threads" : [{"triggered":true,"id":199372,"instructionState":{"instructionStream":{"bytes":[0,0,72,184,0,0,0,0,0,0,0,16,73,133,196,15,132,192,1,0,0,72,131,192,255,76,137,247,72,33,199,72,131,199,32,72,184,255,255,255,255,255,255,0,0,73,33,196,72,131,236,8,68,15,182,69,24,76,137,230,72,139,85,208,72,139,77,16,73,137,217,139,69,40,80,65,85,65,87,232,23,18,0,0,72,131,196,32,76,137,247,232,251,188,48,0,15,11,72,131,236,8,72,141,5,142,177,65,0,72,141,61,91,172,65,0,72,141,13,112,175,65,0,190,11,0,0,0,65,184,57,0,0,0,186,2,0,0,0,65,185,2,0,0,0,106,1,104,148,0,0,0,106,2,106,24,80,232,185,2,0,0,72,131,236,8,72,141,5,110,172,65,0,72,141,61,27,172,65,0,72,141,13,48,172,65,0,190,11,0,0,0],"offset":96}},"threadState":{"r13":{"value":285},"rax":{"value":8589934595},"rflags":{"value":66118},"cpu":{"value":1},"r14":{"value":140609438815264},"rsi":{"value":398410502},"r8":{"value":45415},"cr2":{"value":0},"rdx":{"value":3},"r10":{"value":140609507557376},"r9":{"value":8},"r15":{"value":11},"rbx":{"value":140707672424704},"trap":{"value":6},"err":{"value":0},"r11":{"value":0},"rip":{"value":140703396332101,"matchesCrashFrame":1},"rbp":{"value":140701813679088},"rsp":{"value":140701813679008},"r12":{"value":79},"rcx":{"value":18446744065119617024},"flavor":"x86_THREAD_STATE","rdi":{"value":140609438815272}},"queue":"com.apple.main-thread","frames":[{"imageOffset":205381,"symbol":"_assertionFailure(_:_:file:line:flags:)","symbolLocation":421,"imageIndex":0},{"imageOffset":12491587,"symbol":"ListStyleDataSource.deleteCell(forRow:)","symbolLocation":759,"imageIndex":1},{"imageOffset":446410,"symbol":"closure #1 in closure #2 in NSTableViewListCoordinator.tableView(_:rowActionsForRow:edge:)","symbolLocation":119,"imageIndex":1},{"imageOffset":2661948,"symbol":"thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":12,"imageIndex":1},{"imageOffset":464407,"symbol":"partial apply for thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":17,"imageIndex":1},{"imageOffset":9923099,"symbol":"static Update.end()","symbolLocation":520,"imageIndex":1},{"imageOffset":446184,"symbol":"closure #2 in NSTableViewListCoordinator.tableView(_:rowActionsForRow:edge:)","symbolLocation":343,"imageIndex":1},{"imageOffset":463969,"symbol":"partial apply for closure #2 in NSTableViewListCoordinator.tableView(_:rowActionsForRow:edge:)","symbolLocation":94,"imageIndex":1},{"imageOffset":4618500,"symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NSTableViewRowAction, @unowned Int) -> ()","symbolLocation":57,"imageIndex":1},{"imageOffset":10400816,"symbol":"-[NSTableRowData _actionButtonClicked:]","symbolLocation":293,"imageIndex":2},{"imageOffset":2370666,"symbol":"-[NSApplication(NSResponder) sendAction:to:from:]","symbolLocation":288,"imageIndex":2},{"imageOffset":2370320,"symbol":"-[NSControl sendAction:to:]","symbolLocation":86,"imageIndex":2},{"imageOffset":5796150,"symbol":"-[NSTableViewActionButton mouseDown:]","symbolLocation":349,"imageIndex":2},{"imageOffset":2344801,"symbol":"-[NSWindow(NSEventRouting) _handleMouseDownEvent:isDelayedEvent:]","symbolLocation":4859,"imageIndex":2},{"imageOffset":1771810,"symbol":"-[NSWindow(NSEventRouting) _reallySendEvent:isDelayedEvent:]","symbolLocation":2582,"imageIndex":2},{"imageOffset":1768690,"symbol":"-[NSWindow(NSEventRouting) sendEvent:]","symbolLocation":352,"imageIndex":2},{"imageOffset":1761480,"symbol":"-[NSApplication(NSEvent) sendEvent:]","symbolLocation":352,"imageIndex":2},{"imageOffset":4615946,"symbol":"-[NSApplication _handleEvent:]","symbolLocation":65,"imageIndex":2},{"imageOffset":194621,"symbol":"-[NSApplication run]","symbolLocation":623,"imageIndex":2},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":2},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":1},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":1},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":1},{"imageOffset":17532659,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":3,"symbolLocation":35},{"imageOffset":17532793,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":3},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":4}]},{"id":199420,"name":"com.apple.NSEventThread","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":5},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":5},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":6},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":6},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":6},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":2},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":199432,"name":"com.apple.NSURLConnectionLoader","frames":[{"imageOffset":6458,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":5},{"imageOffset":7336,"symbol":"mach_msg","symbolLocation":56,"imageIndex":5},{"imageOffset":524957,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":6},{"imageOffset":518440,"symbol":"__CFRunLoopRun","symbolLocation":1276,"imageIndex":6},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":6},{"imageOffset":2394468,"imageIndex":8},{"imageOffset":362276,"symbol":"__NSThread__start__","symbolLocation":1009,"imageIndex":9},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":199443,"name":"NIO-SGLTN-0-#0","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":5},{"imageOffset":15241225,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":3},{"imageOffset":15281967,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":3,"symbolLocation":95},{"imageOffset":15283588,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":3},{"imageOffset":15244475,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":3,"symbolLocation":395},{"imageOffset":15281704,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":3,"symbolLocation":312},{"imageOffset":15137014,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":230},{"imageOffset":15141215,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":3},{"imageOffset":15079459,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":3,"symbolLocation":467},{"imageOffset":15130893,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":1053},{"imageOffset":15104564,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":100},{"imageOffset":15057646,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":3,"symbolLocation":158},{"imageOffset":15070996,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":3},{"imageOffset":15024802,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":3,"symbolLocation":34},{"imageOffset":15024876,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":3},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":10},{"imageOffset":15024713,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":3,"symbolLocation":57},{"imageOffset":15053679,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":3,"symbolLocation":591},{"imageOffset":14667912,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":3,"symbolLocation":856},{"imageOffset":14669786,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":3,"symbolLocation":282},{"imageOffset":14695091,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":3},{"imageOffset":15284607,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":3},{"imageOffset":15295727,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":3,"symbolLocation":1007},{"imageOffset":15295913,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":199444,"name":"NIO-SGLTN-0-#1","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":5},{"imageOffset":15241225,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":3},{"imageOffset":15281967,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":3,"symbolLocation":95},{"imageOffset":15283588,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":3},{"imageOffset":15244475,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":3,"symbolLocation":395},{"imageOffset":15281704,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":3,"symbolLocation":312},{"imageOffset":15137014,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":230},{"imageOffset":15141215,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":3},{"imageOffset":15079459,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":3,"symbolLocation":467},{"imageOffset":15130893,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":1053},{"imageOffset":15104564,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":100},{"imageOffset":15057646,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":3,"symbolLocation":158},{"imageOffset":15070996,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":3},{"imageOffset":15024802,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":3,"symbolLocation":34},{"imageOffset":15024876,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":3},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":10},{"imageOffset":15024713,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":3,"symbolLocation":57},{"imageOffset":15053679,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":3,"symbolLocation":591},{"imageOffset":14667912,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":3,"symbolLocation":856},{"imageOffset":14669786,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":3,"symbolLocation":282},{"imageOffset":14695091,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":3},{"imageOffset":15284607,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":3},{"imageOffset":15295727,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":3,"symbolLocation":1007},{"imageOffset":15295913,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":199445,"name":"NIO-SGLTN-0-#2","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":5},{"imageOffset":15241225,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":3},{"imageOffset":15281967,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":3,"symbolLocation":95},{"imageOffset":15283588,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":3},{"imageOffset":15244475,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":3,"symbolLocation":395},{"imageOffset":15281704,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":3,"symbolLocation":312},{"imageOffset":15137014,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":230},{"imageOffset":15141215,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":3},{"imageOffset":15079459,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":3,"symbolLocation":467},{"imageOffset":15130893,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":1053},{"imageOffset":15104564,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":100},{"imageOffset":15057646,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":3,"symbolLocation":158},{"imageOffset":15070996,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":3},{"imageOffset":15024802,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":3,"symbolLocation":34},{"imageOffset":15024876,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":3},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":10},{"imageOffset":15024713,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":3,"symbolLocation":57},{"imageOffset":15053679,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":3,"symbolLocation":591},{"imageOffset":14667912,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":3,"symbolLocation":856},{"imageOffset":14669786,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":3,"symbolLocation":282},{"imageOffset":14695091,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":3},{"imageOffset":15284607,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":3},{"imageOffset":15295727,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":3,"symbolLocation":1007},{"imageOffset":15295913,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":199446,"name":"NIO-SGLTN-0-#3","frames":[{"imageOffset":25358,"symbol":"kevent","symbolLocation":10,"imageIndex":5},{"imageOffset":15241225,"sourceFile":"<compiler-generated>","symbol":"@nonobjc kevent(_:_:_:_:_:_:)","symbolLocation":9,"imageIndex":3},{"imageOffset":15281967,"sourceLine":911,"sourceFile":"System.swift","symbol":"closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":3,"symbolLocation":95},{"imageOffset":15283588,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","symbolLocation":36,"imageIndex":3},{"imageOffset":15244475,"sourceLine":247,"sourceFile":"System.swift","symbol":"syscall<A>(blocking:where:_:)","imageIndex":3,"symbolLocation":395},{"imageOffset":15281704,"sourceLine":910,"sourceFile":"System.swift","symbol":"static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:)","imageIndex":3,"symbolLocation":312},{"imageOffset":15137014,"sourceLine":212,"sourceFile":"SelectorKqueue.swift","symbol":"closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":230},{"imageOffset":15141215,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:)","symbolLocation":15,"imageIndex":3},{"imageOffset":15079459,"sourceLine":31,"sourceFile":"SelectorGeneric.swift","symbol":"Optional.withUnsafeOptionalPointer<A>(_:)","imageIndex":3,"symbolLocation":467},{"imageOffset":15130893,"sourceLine":211,"sourceFile":"SelectorKqueue.swift","symbol":"Selector.whenReady0(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":1053},{"imageOffset":15104564,"sourceLine":288,"sourceFile":"SelectorGeneric.swift","symbol":"Selector.whenReady(strategy:onLoopBegin:_:)","imageIndex":3,"symbolLocation":100},{"imageOffset":15057646,"sourceLine":653,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #2 in SelectableEventLoop.run()","imageIndex":3,"symbolLocation":158},{"imageOffset":15070996,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #2 in SelectableEventLoop.run()","symbolLocation":20,"imageIndex":3},{"imageOffset":15024802,"sourceLine":27,"sourceFile":"SelectableEventLoop.swift","symbol":"closure #1 in withAutoReleasePool<A>(_:)","imageIndex":3,"symbolLocation":34},{"imageOffset":15024876,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in withAutoReleasePool<A>(_:)","symbolLocation":28,"imageIndex":3},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":10},{"imageOffset":15024713,"sourceLine":26,"sourceFile":"SelectableEventLoop.swift","symbol":"withAutoReleasePool<A>(_:)","imageIndex":3,"symbolLocation":57},{"imageOffset":15053679,"sourceLine":652,"sourceFile":"SelectableEventLoop.swift","symbol":"SelectableEventLoop.run()","imageIndex":3,"symbolLocation":591},{"imageOffset":14667912,"sourceLine":93,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:)","imageIndex":3,"symbolLocation":856},{"imageOffset":14669786,"sourceLine":111,"sourceFile":"MultiThreadedEventLoopGroup.swift","symbol":"closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","imageIndex":3,"symbolLocation":282},{"imageOffset":14695091,"sourceFile":"<compiler-generated>","symbol":"partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:)","symbolLocation":51,"imageIndex":3},{"imageOffset":15284607,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":3},{"imageOffset":15295727,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":3,"symbolLocation":1007},{"imageOffset":15295913,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":199447,"name":"TP-#0","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":5},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":11},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":11},{"imageOffset":14704511,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":3,"symbolLocation":143},{"imageOffset":14708302,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":3,"symbolLocation":222},{"imageOffset":15284607,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":3},{"imageOffset":15295727,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":3,"symbolLocation":1007},{"imageOffset":15295913,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":199448,"name":"TP-#1","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":5},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":11},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":11},{"imageOffset":14704511,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":3,"symbolLocation":143},{"imageOffset":14708302,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":3,"symbolLocation":222},{"imageOffset":15284607,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":3},{"imageOffset":15295727,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":3,"symbolLocation":1007},{"imageOffset":15295913,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":199449,"name":"TP-#2","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":5},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":11},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":11},{"imageOffset":14704511,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":3,"symbolLocation":143},{"imageOffset":14708302,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":3,"symbolLocation":222},{"imageOffset":15284607,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":3},{"imageOffset":15295727,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":3,"symbolLocation":1007},{"imageOffset":15295913,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":199450,"name":"TP-#3","frames":[{"imageOffset":6518,"symbol":"semaphore_wait_trap","symbolLocation":10,"imageIndex":5},{"imageOffset":14286,"symbol":"_dispatch_sema4_wait","symbolLocation":16,"imageIndex":11},{"imageOffset":15517,"symbol":"_dispatch_semaphore_wait_slow","symbolLocation":98,"imageIndex":11},{"imageOffset":14704511,"sourceLine":186,"sourceFile":"NIOThreadPool.swift","symbol":"NIOThreadPool.process(identifier:)","imageIndex":3,"symbolLocation":143},{"imageOffset":14708302,"sourceLine":252,"sourceFile":"NIOThreadPool.swift","symbol":"closure #3 in NIOThreadPool._start(threadNamePrefix:)","imageIndex":3,"symbolLocation":222},{"imageOffset":15284607,"sourceFile":"<compiler-generated>","symbol":"thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> ()","symbolLocation":15,"imageIndex":3},{"imageOffset":15295727,"sourceLine":116,"sourceFile":"ThreadPosix.swift","symbol":"closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","imageIndex":3,"symbolLocation":1007},{"imageOffset":15295913,"sourceFile":"<compiler-generated>","symbol":"@objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:)","symbolLocation":9,"imageIndex":3},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":7},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":7}]},{"id":204939,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":204940,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":204992,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":205355,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]},{"id":205356,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":7}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703396126720,
    "size" : 4694016,
    "uuid" : "222d44bb-076b-3be8-a051-cddfc2b961dc",
    "path" : "\/usr\/lib\/swift\/libswiftCore.dylib",
    "name" : "libswiftCore.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140707658452992,
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
    "base" : 140703217897472,
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
    "base" : 4535107584,
    "CFBundleShortVersionString" : "1.0.14",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 33636352,
    "uuid" : "dec39f41-ef33-3683-960c-011627f29de1",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "14"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4845613056,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703172796416,
    "size" : 229376,
    "uuid" : "2fe67e94-4a5e-3506-9e02-502f7270f7ef",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703173341184,
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
    "base" : 140703173025792,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703251345408,
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
    "base" : 140703188533248,
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
    "base" : 140703525142528,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703171235840,
    "size" : 290816,
    "uuid" : "37860d89-d337-3140-8973-ac199acbc361",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703169765376,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=178.1M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=178.1M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               512K        4 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                           328K       13 \nCG raster data                     228K       13 \nColorSync                          232K       28 \nCoreAnimation                     5468K      180 \nCoreGraphics                        12K        2 \nCoreUI image data                 2552K       19 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nIOKit                             7940K        1 \nImage IO                           256K        1 \nKernel Alloc Once                    8K        1 \nMALLOC                            81.1M       90 \nMALLOC guard page                   48K       11 \nSQLite page cache                  192K        3 \nSTACK GUARD                       56.1M       16 \nStack                             15.6M       16 \nVM_ALLOCATE                       3144K       17 \n__CTF                               756        1 \n__DATA                            55.0M      599 \n__DATA_CONST                      33.3M      408 \n__DATA_DIRTY                      1651K      203 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       708.9M       83 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           583.5M      606 \n__UNICODE                          592K        1 \ndyld private memory               1024K        3 \nlibnetwork                        13.6M       40 \nmapped file                      156.8M       30 \nshared memory                     2820K       19 \n===========                     =======  ======= \nTOTAL                              1.8G     2419 \n",
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

