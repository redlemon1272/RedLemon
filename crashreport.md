-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               RedLemon [55825]
Path:                  /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:            com.redlemon.app
Version:               1.0.153 (153)
Code Type:             X86-64 (Native)
Parent Process:        launchd [1]
User ID:               501

Date/Time:             2026-01-25 13:29:19.7130 -0500
OS Version:            macOS 12.7.6 (21H1320)
Report Version:        12
Anonymous UUID:        C28F189C-26A5-9231-FF60-5D500339B5DA


Time Awake Since Boot: 16000 seconds

System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace SIGNAL, Code 4 Illegal instruction: 4
Terminating Process:   exc handler [55825]

Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   SwiftUI                       	    0x7ff921feff26 validateDimension #1 (min:ideal:max:) in NSView.intrinsicLayoutTraits() + 224
1   SwiftUI                       	    0x7ff921fef398 NSView.intrinsicLayoutTraits() + 99
2   SwiftUI                       	    0x7ff921fef283 PlatformViewHost.updateLayoutTraits() + 266
3   SwiftUI                       	    0x7ff9220d5dea closure #1 in ViewLeafView.layoutTraits() + 146
4   SwiftUI                       	    0x7ff9220d5d45 ViewLeafView.layoutTraits() + 43
5   SwiftUI                       	    0x7ff9220d5bf9 closure #1 in ViewLeafView.sizeThatFits(in:) + 143
6   SwiftUI                       	    0x7ff9220d5a85 ViewLeafView.sizeThatFits(in:) + 185
7   SwiftUI                       	    0x7ff9219bd6a8 closure #1 in LeafLayoutEngine.sizeThatFits(_:) + 55
8   SwiftUI                       	    0x7ff9219bd582 LeafLayoutEngine.sizeThatFits(_:) + 411
9   SwiftUI                       	    0x7ff921b74073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
10  SwiftUI                       	    0x7ff921b7e67f AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:) + 53
11  SwiftUI                       	    0x7ff921b7e7b6 protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine + 47
12  SwiftUI                       	    0x7ff921b74073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
13  SwiftUI                       	    0x7ff921b7e67f AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:) + 53
14  SwiftUI                       	    0x7ff921b7e7b6 protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine + 47
15  SwiftUI                       	    0x7ff921b74073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
16  SwiftUI                       	    0x7ff921b73ca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
17  SwiftUI                       	    0x7ff9222fbaf1 StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 1634
18  SwiftUI                       	    0x7ff9222fb16f specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130
19  SwiftUI                       	    0x7ff9222fc619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
20  SwiftUI                       	    0x7ff9222f9fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
21  SwiftUI                       	    0x7ff9222f937f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
22  SwiftUI                       	    0x7ff9222f91d4 StackLayout.Storage.sizeThatFits(_:) + 124
23  SwiftUI                       	    0x7ff921b73ca0 LayoutComputer.Delegate.lengthThatFits(_:in:) + 51
24  SwiftUI                       	    0x7ff9222fbaf1 StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 1634
25  SwiftUI                       	    0x7ff9222fb16f specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130
26  SwiftUI                       	    0x7ff9222fc619 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143
27  SwiftUI                       	    0x7ff9222f9fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
28  SwiftUI                       	    0x7ff9222f937f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
29  SwiftUI                       	    0x7ff9222f91d4 StackLayout.Storage.sizeThatFits(_:) + 124
30  SwiftUI                       	    0x7ff921b7085b _FrameLayout.sizeThatFits(in:context:child:) + 188
31  SwiftUI                       	    0x7ff921b70b49 protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FrameLayout + 49
32  SwiftUI                       	    0x7ff921f2568a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
33  SwiftUI                       	    0x7ff921f25556 UnaryLayoutEngine.sizeThatFits(_:) + 512
34  SwiftUI                       	    0x7ff921b74073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
35  SwiftUI                       	    0x7ff921b71218 _FlexFrameLayout.sizeThatFits(in:context:child:) + 501
36  SwiftUI                       	    0x7ff921b716d8 protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout + 46
37  SwiftUI                       	    0x7ff921f2568a closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69
38  SwiftUI                       	    0x7ff921f25556 UnaryLayoutEngine.sizeThatFits(_:) + 512
39  SwiftUI                       	    0x7ff921b74073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
40  SwiftUI                       	    0x7ff9222fa7f7 StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106
41  SwiftUI                       	    0x7ff9222fabb7 specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:) + 167
42  SwiftUI                       	    0x7ff9222fc5f3 specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 105
43  SwiftUI                       	    0x7ff9222f9fee StackLayout.UnmanagedImplementation.placeChildren(in:) + 178
44  SwiftUI                       	    0x7ff9222f937f StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386
45  SwiftUI                       	    0x7ff9222f91d4 StackLayout.Storage.sizeThatFits(_:) + 124
46  SwiftUI                       	    0x7ff921937d49 static ScrollViewUtilities.sizeThatFits(in:contentComputer:axes:) + 214
47  SwiftUI                       	    0x7ff921edc0c9 closure #1 in SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:) + 196
48  SwiftUI                       	    0x7ff921edbeef SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:) + 470
49  SwiftUI                       	    0x7ff921b74073 LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99
50  SwiftUI                       	    0x7ff9219832ca LayoutProxy.finallyPlaced(at:in:layoutDirection:) + 117
51  SwiftUI                       	    0x7ff921f7cb1a closure #1 in _LayoutEngine.childGeometries(at:origin:) + 422
52  SwiftUI                       	    0x7ff921f7c872 _LayoutEngine.childGeometries(at:origin:) + 325
53  SwiftUI                       	    0x7ff921b74115 LayoutComputer.EngineDelegate.childGeometries(at:origin:) + 121
54  SwiftUI                       	    0x7ff9217b0a9e specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 223
55  AttributeGraph                	    0x7ff922534757 AG::Graph::UpdateStack::update() + 559
56  AttributeGraph                	    0x7ff922534d57 AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421
57  AttributeGraph                	    0x7ff92253f35e AG::Subgraph::update(unsigned int) + 904
58  SwiftUI                       	    0x7ff9222c24ab GraphHost.flushTransactions() + 495
59  SwiftUI                       	    0x7ff9222c3304 closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:) + 15
60  SwiftUI                       	    0x7ff9219176aa partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:) + 17
61  SwiftUI                       	    0x7ff922128ca8 closure #1 in ViewRendererHost.updateViewGraph<A>(body:) + 69
62  SwiftUI                       	    0x7ff9221278df ViewRendererHost.updateViewGraph<A>(body:) + 78
63  SwiftUI                       	    0x7ff922135cd0 protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1> + 25
64  SwiftUI                       	    0x7ff9219102a4 ViewGraphDelegate.updateGraph<A>(body:) + 55
65  SwiftUI                       	    0x7ff9219175e3 protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1> + 25
66  SwiftUI                       	    0x7ff9222c32e0 closure #1 in GraphHost.init(data:) + 122
67  SwiftUI                       	    0x7ff921918e3c thunk for @escaping @callee_guaranteed () -> () + 12
68  SwiftUI                       	    0x7ff9221a825b partial apply for thunk for @escaping @callee_guaranteed () -> () + 17
69  SwiftUI                       	    0x7ff9221a5b20 static NSRunLoop.flushObservers() + 118
70  SwiftUI                       	    0x7ff9221a81d8 closure #1 in closure #1 in static NSRunLoop.addObserver(_:) + 16
71  SwiftUI                       	    0x7ff9221a2716 specialized thunk for @callee_guaranteed () -> (@error @owned Error) + 14
72  libswiftObjectiveC.dylib      	    0x7ff82b0bae7c autoreleasepool<A>(invoking:) + 44
73  SwiftUI                       	    0x7ff9221a81c0 closure #1 in static NSRunLoop.addObserver(_:) + 35
74  SwiftUI                       	    0x7ff9221a8205 @objc closure #1 in static NSRunLoop.addObserver(_:) + 43
75  CoreFoundation                	    0x7ff8161b8450 __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
76  CoreFoundation                	    0x7ff8161b82e2 __CFRunLoopDoObservers + 543
77  CoreFoundation                	    0x7ff8161b6de0 CFRunLoopRunSpecific + 678
78  HIToolbox                     	    0x7ff81ee695e6 RunCurrentEventLoopInMode + 292
79  HIToolbox                     	    0x7ff81ee69213 ReceiveNextEventCommon + 283
80  HIToolbox                     	    0x7ff81ee690e5 _BlockUntilNextEventMatchingListInModeWithFilter + 70
81  AppKit                        	    0x7ff818bf5aa9 _DPSNextEvent + 927
82  AppKit                        	    0x7ff818bf4166 -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394
83  AppKit                        	    0x7ff818be6818 -[NSApplication run] + 586
84  AppKit                        	    0x7ff818bba79a NSApplicationMain + 817
85  SwiftUI                       	    0x7ff92170b09c specialized runApp(_:) + 161
86  SwiftUI                       	    0x7ff92216d424 runApp<A>(_:) + 164
87  SwiftUI                       	    0x7ff921c65c5f static App.main() + 63
88  RedLemon                      	       0x103b6b9d3 static RedLemonApp.$main() + 35 (RedLemonApp.swift:31)
89  RedLemon                      	       0x103b6ba59 RedLemon_main + 9
90  dyld                          	       0x10c98c52e start + 462

Thread 1:
0   libsystem_pthread.dylib       	    0x7ff8160edf48 start_wqthread + 0

Thread 2:
0   libsystem_pthread.dylib       	    0x7ff8160edf48 start_wqthread + 0

Thread 3:
0   libsystem_pthread.dylib       	    0x7ff8160edf48 start_wqthread + 0

Thread 4:
0   libsystem_pthread.dylib       	    0x7ff8160edf48 start_wqthread + 0

Thread 5:
0   libsystem_pthread.dylib       	    0x7ff8160edf48 start_wqthread + 0

Thread 6:
0   libsystem_pthread.dylib       	    0x7ff8160edf48 start_wqthread + 0

Thread 7:
0   libsystem_pthread.dylib       	    0x7ff8160edf48 start_wqthread + 0

Thread 8:: com.apple.NSEventThread
0   CoreFoundation                	    0x7ff816182e41 CFSetCreateCopy + 15
1   CoreFoundation                	    0x7ff816182cdf CFRunLoopAddTimer + 393
2   HIToolbox                     	    0x7ff81ee761fe PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*) + 498
3   HIToolbox                     	    0x7ff81ee75fd5 MessageHandler(__CFMachPort*, void*, long, void*) + 48
4   CoreFoundation                	    0x7ff8161e64b0 __CFMachPortPerform + 250
5   CoreFoundation                	    0x7ff8161b9854 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 41
6   CoreFoundation                	    0x7ff8161b9734 __CFRunLoopDoSource1 + 619
7   CoreFoundation                	    0x7ff8161b7d9b __CFRunLoopRun + 2415
8   CoreFoundation                	    0x7ff8161b6d6c CFRunLoopRunSpecific + 562
9   AppKit                        	    0x7ff818d63572 _NSEventThread + 132
10  libsystem_pthread.dylib       	    0x7ff8160f24e1 _pthread_start + 125
11  libsystem_pthread.dylib       	    0x7ff8160edf6b thread_start + 15


Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x031dfff857dc5501  rbx: 0x00007faf9094c1d0  rcx: 0x0080000000000000  rdx: 0x0100000000000000
  rdi: 0x00007faf9094c1d0  rsi: 0x021dfff857dc5531  rbp: 0x00007ff7bd4e95d0  rsp: 0x00007ff7bd4e9570
   r8: 0x0000000000000010   r9: 0x0f0f0f0f0f0f0f0f  r10: 0x00007ff8576d8d38  r11: 0x00007ff816fe7c50
  r12: 0x00007ff7bd4e95e0  r13: 0x00007faf9094c1d0  r14: 0x00007ff7bd4e95f0  r15: 0x00007ff7bd4e9670
  rip: 0x00007ff921feff26  rfl: 0x0000000000010203  cr2: 0x0000000000000000
  
Logical CPU:     0
Error Code:      0x00000000 
Trap Number:     6

Thread 0 instruction stream:
  16 a7 32 00 73 0a 66 0f-2e c4 76 56 31 c0 eb 0d  ..2.s.f...vV1...
  66 0f 2e c4 76 4c 66 0f-2e c6 0f 97 c0 66 0f 2e  f...vLf......f..
  ee 72 3d 66 0f 2e e6 72-39 66 0f 2e ec 0f 93 c1  .r=f...r9f......
  20 c8 3c 01 75 2c 66 0f-28 c6 66 0f 28 cc 66 0f   .<.u,f.(.f.(.f.
  28 d5 e8 39 ca a3 ff 0f-28 45 d0 0f 28 4d c0 0f  (..9....(E..(M..
  28 55 b0 48 83 c4 40 5b-41 5d 41 5e 41 5f 5d c3  (U.H..@[A]A^A_].
 [0f]0b 4c 8d 6d a0 49 83-65 00 00 48 b8 00 00 00  ..L.m.I.e..H....	<==
  00 00 00 00 e0 49 89 45-08 6a 67 5f e8 59 68 32  .....I.E.jg_.Yh2
  00 41 0f 10 45 00 41 0f-11 45 00 48 8b 35 c8 1c  .A..E.A..E.H.5..
  f4 36 48 89 df e8 00 78-32 00 48 89 c7 e8 40 78  .6H....x2.H...@x
  32 00 48 89 c3 48 89 c7-e8 db 5f 32 00 49 89 c6  2.H..H...._2.I..
  49 89 d7 48 89 df ff 15-16 87 09 38 4c 8d 6d a0  I..H.......8L.m.

Binary Images:
    0x7ff92168f000 -     0x7ff92252efff com.apple.SwiftUI (3.5.2) <4270a4c3-e15f-3953-8f17-abb3b351219f> /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
    0x7ff92252f000 -     0x7ff922565fff com.apple.AttributeGraph (3.2.1) <e9337c46-2775-39dc-ae3d-14ccf80d629f> /System/Library/PrivateFrameworks/AttributeGraph.framework/Versions/A/AttributeGraph
    0x7ff82b0ba000 -     0x7ff82b0bbfff libswiftObjectiveC.dylib (*) <ad175d32-3dba-3e98-bed0-f37aedd82ff6> /usr/lib/swift/libswiftObjectiveC.dylib
    0x7ff816139000 -     0x7ff81663bfff com.apple.CoreFoundation (6.9) <fdd28505-5456-3c40-a5ba-7890b064db39> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7ff81ee3b000 -     0x7ff81f12efff com.apple.HIToolbox (2.1.1) <913d3d2e-4e4c-3907-98fe-8f4abd551297> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7ff818bb7000 -     0x7ff819a46fff com.apple.AppKit (6.9) <5dd484cf-ed6a-3633-b42e-6518aeecd5b9> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
       0x102a13000 -        0x10573efff com.redlemon.app (1.0.153) <3730e0c8-1330-31b1-837e-4b98fdfd31da> /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
       0x10c987000 -        0x10c9f2fff dyld (*) <eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333> /usr/lib/dyld
    0x7ff8160ec000 -     0x7ff8160f7fff libsystem_pthread.dylib (*) <5a5f7316-85b7-315e-baf3-76211ee65604> /usr/lib/system/libsystem_pthread.dylib

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
Writable regions: Total=124.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=124.0M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Accelerate framework               256K        2 
Activity Tracing                   256K        1 
CG backing stores                 1920K        4 
CG image                            40K        3 
CG raster data                      76K        9 
ColorSync                          220K       26 
CoreAnimation                      360K       18 
CoreGraphics                         4K        1 
CoreServices                       176K        1 
CoreUI image data                  824K        7 
Dispatch continuations            32.0M        1 
Foundation                          16K        1 
Image IO                           256K        1 
Kernel Alloc Once                    8K        1 
MALLOC                            53.1M       38 
MALLOC guard page                   48K       10 
MALLOC_LARGE (reserved)             68K        1         reserved VM address space (unallocated)
SQLite page cache                  128K        2 
STACK GUARD                       56.0M        9 
Stack                             12.1M        9 
VM_ALLOCATE                       1088K       14 
__CTF                               756        1 
__DATA                            54.5M      596 
__DATA_CONST                      33.2M      401 
__DATA_DIRTY                      1650K      201 
__FONT_DATA                          4K        1 
__LINKEDIT                       735.6M       81 
__OBJC_RO                         82.9M        1 
__OBJC_RW                         3200K        2 
__TEXT                           593.6M      600 
__UNICODE                          592K        1 
dyld private memory               1024K        1 
libnetwork                         128K        8 
mapped file                      164.8M       30 
shared memory                      776K       18 
===========                     =======  ======= 
TOTAL                              1.8G     2101 
TOTAL, minus reserved VM space     1.8G     2101 



-----------
Full Report
-----------

{"app_name":"RedLemon","timestamp":"2026-01-25 13:29:20.00 -0500","app_version":"1.0.153","slice_uuid":"3730e0c8-1330-31b1-837e-4b98fdfd31da","build_version":"153","platform":1,"bundleID":"com.redlemon.app","share_with_app_devs":0,"is_first_party":0,"bug_type":"309","os_version":"macOS 12.7.6 (21H1320)","incident_id":"7DED2A66-40C7-481A-9882-17182D00517C","name":"RedLemon"}
{
  "uptime" : 16000,
  "procLaunch" : "2026-01-25 13:29:18.6341 -0500",
  "procRole" : "Foreground",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro12,1",
  "procStartAbsTime" : 16607620567706,
  "coalitionID" : 2593,
  "osVersion" : {
    "train" : "macOS 12.7.6",
    "build" : "21H1320",
    "releaseType" : "User"
  },
  "captureTime" : "2026-01-25 13:29:19.7130 -0500",
  "incident" : "7DED2A66-40C7-481A-9882-17182D00517C",
  "bug_type" : "309",
  "pid" : 55825,
  "procExitAbsTime" : 16608569993362,
  "cpuType" : "X86-64",
  "procName" : "RedLemon",
  "procPath" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
  "bundleInfo" : {"CFBundleShortVersionString":"1.0.153","CFBundleVersion":"153","CFBundleIdentifier":"com.redlemon.app"},
  "storeInfo" : {"deviceIdentifierForVendor":"7507F017-DDD6-5FDF-B711-BDBB2B3F58A9","thirdParty":true},
  "parentProc" : "launchd",
  "parentPid" : 1,
  "coalitionName" : "com.redlemon.app",
  "crashReporterKey" : "C28F189C-26A5-9231-FF60-5D500339B5DA",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000001, 0x0000000000000000","rawCodes":[1,0],"type":"EXC_BAD_INSTRUCTION","signal":"SIGILL"},
  "termination" : {"flags":0,"code":4,"namespace":"SIGNAL","indicator":"Illegal instruction: 4","byProc":"exc handler","byPid":55825},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 0,
  "threads" : [{"triggered":true,"id":265440,"instructionState":{"instructionStream":{"bytes":[22,167,50,0,115,10,102,15,46,196,118,86,49,192,235,13,102,15,46,196,118,76,102,15,46,198,15,151,192,102,15,46,238,114,61,102,15,46,230,114,57,102,15,46,236,15,147,193,32,200,60,1,117,44,102,15,40,198,102,15,40,204,102,15,40,213,232,57,202,163,255,15,40,69,208,15,40,77,192,15,40,85,176,72,131,196,64,91,65,93,65,94,65,95,93,195,15,11,76,141,109,160,73,131,101,0,0,72,184,0,0,0,0,0,0,0,224,73,137,69,8,106,103,95,232,89,104,50,0,65,15,16,69,0,65,15,17,69,0,72,139,53,200,28,244,54,72,137,223,232,0,120,50,0,72,137,199,232,64,120,50,0,72,137,195,72,137,199,232,219,95,50,0,73,137,198,73,137,215,72,137,223,255,21,22,135,9,56,76,141,109,160],"offset":96}},"threadState":{"r13":{"value":140392021672400},"rax":{"value":224616998529422593},"rflags":{"value":66051},"cpu":{"value":0},"r14":{"value":140702009693680},"rsi":{"value":152559404491494705},"r8":{"value":16},"cr2":{"value":0},"rdx":{"value":72057594037927936},"r10":{"value":140704595414328,"symbolLocation":0,"symbol":"OBJC_METACLASS_$_NSThread"},"r9":{"value":1085102592571150095},"r15":{"value":140702009693808},"rbx":{"value":140392021672400},"trap":{"value":6},"err":{"value":0},"r11":{"value":140703514393680,"symbolLocation":0,"symbol":"+[NSThread isMainThread]"},"rip":{"value":140707993943846,"matchesCrashFrame":1},"rbp":{"value":140702009693648},"rsp":{"value":140702009693552},"r12":{"value":140702009693664},"rcx":{"value":36028797018963968},"flavor":"x86_THREAD_STATE","rdi":{"value":140392021672400}},"queue":"com.apple.main-thread","frames":[{"imageOffset":9834278,"symbol":"validateDimension #1 (min:ideal:max:) in NSView.intrinsicLayoutTraits()","symbolLocation":224,"imageIndex":0},{"imageOffset":9831320,"symbol":"NSView.intrinsicLayoutTraits()","symbolLocation":99,"imageIndex":0},{"imageOffset":9831043,"symbol":"PlatformViewHost.updateLayoutTraits()","symbolLocation":266,"imageIndex":0},{"imageOffset":10776042,"symbol":"closure #1 in ViewLeafView.layoutTraits()","symbolLocation":146,"imageIndex":0},{"imageOffset":10775877,"symbol":"ViewLeafView.layoutTraits()","symbolLocation":43,"imageIndex":0},{"imageOffset":10775545,"symbol":"closure #1 in ViewLeafView.sizeThatFits(in:)","symbolLocation":143,"imageIndex":0},{"imageOffset":10775173,"symbol":"ViewLeafView.sizeThatFits(in:)","symbolLocation":185,"imageIndex":0},{"imageOffset":3335848,"symbol":"closure #1 in LeafLayoutEngine.sizeThatFits(_:)","symbolLocation":55,"imageIndex":0},{"imageOffset":3335554,"symbol":"LeafLayoutEngine.sizeThatFits(_:)","symbolLocation":411,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5174911,"symbol":"AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:)","symbolLocation":53,"imageIndex":0},{"imageOffset":5175222,"symbol":"protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine","symbolLocation":47,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5174911,"symbol":"AlignmentModifiedLayoutComputer.LayoutEngine.sizeThatFits(_:)","symbolLocation":53,"imageIndex":0},{"imageOffset":5175222,"symbol":"protocol witness for LayoutEngineProtocol.sizeThatFits(_:) in conformance AlignmentModifiedLayoutComputer.LayoutEngine","symbolLocation":47,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":13028081,"symbol":"StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:)","symbolLocation":1634,"imageIndex":0},{"imageOffset":13025647,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":130,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":5131424,"symbol":"LayoutComputer.Delegate.lengthThatFits(_:in:)","symbolLocation":51,"imageIndex":0},{"imageOffset":13028081,"symbol":"StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:)","symbolLocation":1634,"imageIndex":0},{"imageOffset":13025647,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:)","symbolLocation":130,"imageIndex":0},{"imageOffset":13030937,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":143,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":5118043,"symbol":"_FrameLayout.sizeThatFits(in:context:child:)","symbolLocation":188,"imageIndex":0},{"imageOffset":5118793,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FrameLayout","symbolLocation":49,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":5120536,"symbol":"_FlexFrameLayout.sizeThatFits(in:context:child:)","symbolLocation":501,"imageIndex":0},{"imageOffset":5121752,"symbol":"protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout","symbolLocation":46,"imageIndex":0},{"imageOffset":9004682,"symbol":"closure #1 in UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":69,"imageIndex":0},{"imageOffset":9004374,"symbol":"UnaryLayoutEngine.sizeThatFits(_:)","symbolLocation":512,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":13023223,"symbol":"StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:)","symbolLocation":106,"imageIndex":0},{"imageOffset":13024183,"symbol":"specialized StackLayout.UnmanagedImplementation.sizeChildrenIdeally(in:minorProposalForChild:)","symbolLocation":167,"imageIndex":0},{"imageOffset":13030899,"symbol":"specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:)","symbolLocation":105,"imageIndex":0},{"imageOffset":13021166,"symbol":"StackLayout.UnmanagedImplementation.placeChildren(in:)","symbolLocation":178,"imageIndex":0},{"imageOffset":13017983,"symbol":"StackLayout.UnmanagedImplementation.sizeThatFits(_:)","symbolLocation":386,"imageIndex":0},{"imageOffset":13017556,"symbol":"StackLayout.Storage.sizeThatFits(_:)","symbolLocation":124,"imageIndex":0},{"imageOffset":2788681,"symbol":"static ScrollViewUtilities.sizeThatFits(in:contentComputer:axes:)","symbolLocation":214,"imageIndex":0},{"imageOffset":8704201,"symbol":"closure #1 in SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:)","symbolLocation":196,"imageIndex":0},{"imageOffset":8703727,"symbol":"SystemScrollViewLayoutComputer.Engine.sizeThatFits(_:)","symbolLocation":470,"imageIndex":0},{"imageOffset":5132403,"symbol":"LayoutComputer.EngineDelegate.sizeThatFits(_:)","symbolLocation":99,"imageIndex":0},{"imageOffset":3097290,"symbol":"LayoutProxy.finallyPlaced(at:in:layoutDirection:)","symbolLocation":117,"imageIndex":0},{"imageOffset":9362202,"symbol":"closure #1 in _LayoutEngine.childGeometries(at:origin:)","symbolLocation":422,"imageIndex":0},{"imageOffset":9361522,"symbol":"_LayoutEngine.childGeometries(at:origin:)","symbolLocation":325,"imageIndex":0},{"imageOffset":5132565,"symbol":"LayoutComputer.EngineDelegate.childGeometries(at:origin:)","symbolLocation":121,"imageIndex":0},{"imageOffset":1186462,"symbol":"specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:)","symbolLocation":223,"imageIndex":0},{"imageOffset":22359,"symbol":"AG::Graph::UpdateStack::update()","symbolLocation":559,"imageIndex":1},{"imageOffset":23895,"symbol":"AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int)","symbolLocation":421,"imageIndex":1},{"imageOffset":66398,"symbol":"AG::Subgraph::update(unsigned int)","symbolLocation":904,"imageIndex":1},{"imageOffset":12793003,"symbol":"GraphHost.flushTransactions()","symbolLocation":495,"imageIndex":0},{"imageOffset":12796676,"symbol":"closure #1 in closure #1 in closure #1 in GraphHost.asyncTransaction<A>(_:mutation:style:mayDeferUpdate:)","symbolLocation":15,"imageIndex":0},{"imageOffset":2655914,"symbol":"partial apply for closure #1 in ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":17,"imageIndex":0},{"imageOffset":11115688,"symbol":"closure #1 in ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":69,"imageIndex":0},{"imageOffset":11110623,"symbol":"ViewRendererHost.updateViewGraph<A>(body:)","symbolLocation":78,"imageIndex":0},{"imageOffset":11168976,"symbol":"protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":0},{"imageOffset":2626212,"symbol":"ViewGraphDelegate.updateGraph<A>(body:)","symbolLocation":55,"imageIndex":0},{"imageOffset":2655715,"symbol":"protocol witness for GraphDelegate.updateGraph<A>(body:) in conformance NSHostingView<A1>","symbolLocation":25,"imageIndex":0},{"imageOffset":12796640,"symbol":"closure #1 in GraphHost.init(data:)","symbolLocation":122,"imageIndex":0},{"imageOffset":2661948,"symbol":"thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":12,"imageIndex":0},{"imageOffset":11637339,"symbol":"partial apply for thunk for @escaping @callee_guaranteed () -> ()","symbolLocation":17,"imageIndex":0},{"imageOffset":11627296,"symbol":"static NSRunLoop.flushObservers()","symbolLocation":118,"imageIndex":0},{"imageOffset":11637208,"symbol":"closure #1 in closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":16,"imageIndex":0},{"imageOffset":11613974,"symbol":"specialized thunk for @callee_guaranteed () -> (@error @owned Error)","symbolLocation":14,"imageIndex":0},{"imageOffset":3708,"symbol":"autoreleasepool<A>(invoking:)","symbolLocation":44,"imageIndex":2},{"imageOffset":11637184,"symbol":"closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":35,"imageIndex":0},{"imageOffset":11637253,"symbol":"@objc closure #1 in static NSRunLoop.addObserver(_:)","symbolLocation":43,"imageIndex":0},{"imageOffset":521296,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__","symbolLocation":23,"imageIndex":3},{"imageOffset":520930,"symbol":"__CFRunLoopDoObservers","symbolLocation":543,"imageIndex":3},{"imageOffset":515552,"symbol":"CFRunLoopRunSpecific","symbolLocation":678,"imageIndex":3},{"imageOffset":189926,"symbol":"RunCurrentEventLoopInMode","symbolLocation":292,"imageIndex":4},{"imageOffset":188947,"symbol":"ReceiveNextEventCommon","symbolLocation":283,"imageIndex":4},{"imageOffset":188645,"symbol":"_BlockUntilNextEventMatchingListInModeWithFilter","symbolLocation":70,"imageIndex":4},{"imageOffset":256681,"symbol":"_DPSNextEvent","symbolLocation":927,"imageIndex":5},{"imageOffset":250214,"symbol":"-[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:]","symbolLocation":1394,"imageIndex":5},{"imageOffset":194584,"symbol":"-[NSApplication run]","symbolLocation":586,"imageIndex":5},{"imageOffset":14234,"symbol":"NSApplicationMain","symbolLocation":817,"imageIndex":5},{"imageOffset":508060,"symbol":"specialized runApp(_:)","symbolLocation":161,"imageIndex":0},{"imageOffset":11396132,"symbol":"runApp<A>(_:)","symbolLocation":164,"imageIndex":0},{"imageOffset":6122591,"symbol":"static App.main()","symbolLocation":63,"imageIndex":0},{"imageOffset":18188755,"sourceLine":31,"sourceFile":"RedLemonApp.swift","symbol":"static RedLemonApp.$main()","imageIndex":6,"symbolLocation":35},{"imageOffset":18188889,"sourceFile":"RedLemonApp.swift","symbol":"RedLemon_main","symbolLocation":9,"imageIndex":6},{"imageOffset":21806,"symbol":"start","symbolLocation":462,"imageIndex":7}]},{"id":265486,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":265487,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":265488,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":265489,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":265490,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":265497,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":265498,"frames":[{"imageOffset":8008,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":8}]},{"id":265525,"name":"com.apple.NSEventThread","frames":[{"imageOffset":302657,"symbol":"CFSetCreateCopy","symbolLocation":15,"imageIndex":3},{"imageOffset":302303,"symbol":"CFRunLoopAddTimer","symbolLocation":393,"imageIndex":3},{"imageOffset":242174,"symbol":"PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*)","symbolLocation":498,"imageIndex":4},{"imageOffset":241621,"symbol":"MessageHandler(__CFMachPort*, void*, long, void*)","symbolLocation":48,"imageIndex":4},{"imageOffset":709808,"symbol":"__CFMachPortPerform","symbolLocation":250,"imageIndex":3},{"imageOffset":526420,"symbol":"__CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__","symbolLocation":41,"imageIndex":3},{"imageOffset":526132,"symbol":"__CFRunLoopDoSource1","symbolLocation":619,"imageIndex":3},{"imageOffset":519579,"symbol":"__CFRunLoopRun","symbolLocation":2415,"imageIndex":3},{"imageOffset":515436,"symbol":"CFRunLoopRunSpecific","symbolLocation":562,"imageIndex":3},{"imageOffset":1754482,"symbol":"_NSEventThread","symbolLocation":132,"imageIndex":5},{"imageOffset":25825,"symbol":"_pthread_start","symbolLocation":125,"imageIndex":8},{"imageOffset":8043,"symbol":"thread_start","symbolLocation":15,"imageIndex":8}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140707984109568,
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
    "base" : 140707999444992,
    "CFBundleShortVersionString" : "3.2.1",
    "CFBundleIdentifier" : "com.apple.AttributeGraph",
    "size" : 225280,
    "uuid" : "e9337c46-2775-39dc-ae3d-14ccf80d629f",
    "path" : "\/System\/Library\/PrivateFrameworks\/AttributeGraph.framework\/Versions\/A\/AttributeGraph",
    "name" : "AttributeGraph",
    "CFBundleVersion" : "3.2.1"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703850799104,
    "size" : 8192,
    "uuid" : "ad175d32-3dba-3e98-bed0-f37aedd82ff6",
    "path" : "\/usr\/lib\/swift\/libswiftObjectiveC.dylib",
    "name" : "libswiftObjectiveC.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703498997760,
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
    "base" : 140703646855168,
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
    "base" : 140703543554048,
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
    "base" : 4339085312,
    "CFBundleShortVersionString" : "1.0.153",
    "CFBundleIdentifier" : "com.redlemon.app",
    "size" : 47366144,
    "uuid" : "3730e0c8-1330-31b1-837e-4b98fdfd31da",
    "path" : "\/Users\/USER\/Desktop\/*\/RedLemon.app\/Contents\/MacOS\/RedLemon",
    "name" : "RedLemon",
    "CFBundleVersion" : "153"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4506284032,
    "size" : 442368,
    "uuid" : "eea022bb-a6ab-3cd1-8ac1-54ce8cfd3333",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703498682368,
    "size" : 49152,
    "uuid" : "5a5f7316-85b7-315e-baf3-76211ee65604",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703495421952,
  "size" : 19331678208,
  "uuid" : "246818c3-4b9f-3462-bcaf-fdf71975e5fe"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=1.3G resident=0K(0%) swapped_out_or_unallocated=1.3G(100%)\nWritable regions: Total=124.0M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=124.0M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nAccelerate framework               256K        2 \nActivity Tracing                   256K        1 \nCG backing stores                 1920K        4 \nCG image                            40K        3 \nCG raster data                      76K        9 \nColorSync                          220K       26 \nCoreAnimation                      360K       18 \nCoreGraphics                         4K        1 \nCoreServices                       176K        1 \nCoreUI image data                  824K        7 \nDispatch continuations            32.0M        1 \nFoundation                          16K        1 \nImage IO                           256K        1 \nKernel Alloc Once                    8K        1 \nMALLOC                            53.1M       38 \nMALLOC guard page                   48K       10 \nMALLOC_LARGE (reserved)             68K        1         reserved VM address space (unallocated)\nSQLite page cache                  128K        2 \nSTACK GUARD                       56.0M        9 \nStack                             12.1M        9 \nVM_ALLOCATE                       1088K       14 \n__CTF                               756        1 \n__DATA                            54.5M      596 \n__DATA_CONST                      33.2M      401 \n__DATA_DIRTY                      1650K      201 \n__FONT_DATA                          4K        1 \n__LINKEDIT                       735.6M       81 \n__OBJC_RO                         82.9M        1 \n__OBJC_RW                         3200K        2 \n__TEXT                           593.6M      600 \n__UNICODE                          592K        1 \ndyld private memory               1024K        1 \nlibnetwork                         128K        8 \nmapped file                      164.8M       30 \nshared memory                      776K       18 \n===========                     =======  ======= \nTOTAL                              1.8G     2101 \nTOTAL, minus reserved VM space     1.8G     2101 \n",
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

