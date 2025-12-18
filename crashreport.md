Date/Time:        2025-12-17 19:00:41.615 -0500
End time:         2025-12-17 19:00:48.846 -0500
OS Version:       macOS 12.7.6 (Build 21H1320)
Architecture:     x86_64h
Report Version:   35.1
Incident Identifier: A98C24B4-1E32-4D66-B89B-69F59C6F98D7

Data Source:      Stackshots
Shared Cache:     246818C3-4B9F-3462-BCAF-FDF71975E5FE slid base address 0x7ff804432000, slide 0x4432000
Shared Cache:     762C6AE5-D4D0-3869-A17B-179CA01160AE slid base address 0x7ff81d596000, slide 0x1d596000

Command:          RedLemon
Path:             /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:       com.redlemon.app
Version:          1.0.14 (14)
Architecture:     x86_64
Parent:           bash [27378]
Responsible:      Electron (Antigravity) [584]
PID:              27952
Time Since Fork:  97s

Event:            hang
Duration:         7.23s
Duration Sampled: 4.90s (process was unresponsive for 2 seconds before sampling)
Steps:            49 (100ms sampling interval)

Hardware model:   MacBookPro12,1
Active cpus:      4
HW page size:     4096
VM page size:     4096
Boot args:        keepsyms=1 debug=0x100 -lilubetaall ipc_control_port_options=0 -nokcmismatchpanic

Time Awake Since Boot: 15434s
Time Since Wake:  4523s

Fan speed:        3092 rpm
Total CPU Time:   3.407s (8.0G cycles, 6.2G instructions, 1.31c/i)
Advisory levels:  Battery -> 3, User -> 2, ThermalPressure -> 1, Combined -> 2
Free disk space:  369.53 GB/476.74 GB, low space threshold 3072 MB

--------------------------------------------------
Timeline format: stacks are sorted chronologically
Use -i and -heavy to re-report with count sorting
--------------------------------------------------


Heaviest stack for the main thread of the target process:
  49  start + 462 (dyld + 21806) [0x115b4652e]
  49  RedLemon_main + 9 (RedLemonApp.swift in RedLemon + 17460153) [0x10772dbb9]
  49  static RedLemonApp.$main() + 35 (RedLemonApp.swift:31,1 in RedLemon + 17460019) [0x10772db33]
  49  static App.main() + 63 (SwiftUI + 6122591) [0x7ff9102c7c5f]
  49  runApp<A>(_:) + 164 (SwiftUI + 11396132) [0x7ff9107cf424]
  49  specialized runApp(_:) + 161 (SwiftUI + 508060) [0x7ff90fd6d09c]
  49  NSApplicationMain + 817 (AppKit + 14234) [0x7ff80721c79a]
  49  -[NSApplication run] + 586 (AppKit + 194584) [0x7ff807248818]
  49  -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394 (AppKit + 250214) [0x7ff807256166]
  49  _DPSNextEvent + 927 (AppKit + 256681) [0x7ff807257aa9]
  49  _BlockUntilNextEventMatchingListInModeWithFilter + 70 (HIToolbox + 188645) [0x7ff80d4cb0e5]
  49  ReceiveNextEventCommon + 283 (HIToolbox + 188947) [0x7ff80d4cb213]
  49  RunCurrentEventLoopInMode + 292 (HIToolbox + 189926) [0x7ff80d4cb5e6]
  49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c]
  49  __CFRunLoopRun + 840 (CoreFoundation + 518004) [0x7ff804819774]
  49  __CFRunLoopDoObservers + 543 (CoreFoundation + 520930) [0x7ff80481a2e2]
  49  __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23 (CoreFoundation + 521296) [0x7ff80481a450]
  49  ___NSRunLoopObserverCreateWithHandler_block_invoke + 41 (AppKit + 9383228) [0x7ff807b0bd3c]
  49  __62+[CATransaction(NSCATransaction) NS_setFlushesWithDisplayLink]_block_invoke + 285 (AppKit + 1748337) [0x7ff8073c3d71]
  37  CA::Transaction::commit() + 376 (QuartzCore + 10488) [0x7ff80b8ce8f8]
  37  CA::Transaction::run_commit_handlers(CATransactionPhase) + 98 (QuartzCore + 15338) [0x7ff80b8cfbea]
  37  NSDisplayCycleFlush + 921 (AppKit + 1087108) [0x7ff807322684]
  37  NSDisplayCycleObserverInvoke + 155 (AppKit + 1088247) [0x7ff807322af7]
  21  __NSWindowGetDisplayCycleObserverForLayout_block_invoke + 430 (AppKit + 1091692) [0x7ff80732386c]
  21  -[NSWindow(NSConstraintBasedLayout) layoutIfNeeded] + 251 (AppKit + 1092141) [0x7ff807323a2d]
  21  -[NSWindow(NSConstraintBasedLayout) _layoutViewTree] + 148 (AppKit + 606493) [0x7ff8072ad11d]
  21  -[NSView _layoutSubtreeIfNeededAndAllowTemporaryEngine:] + 1041 (AppKit + 607781) [0x7ff8072ad625]
  21  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261]
  12  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261]
  12  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261]
  12  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261]
  12  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261]
  12  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261]
  7   -[NSView _layoutSubtreeWithOldSize:] + 361 (AppKit + 610579) [0x7ff8072ae113]
  7   _NSViewLayout + 564 (AppKit + 611892) [0x7ff8072ae634]
  7   @objc NSHostingView.layout() + 21 (SwiftUI + 11442362) [0x7ff9107da8ba]
  7   NSHostingView.layout() + 287 (SwiftUI + 11441338) [0x7ff9107da4ba]
  7   +[NSAnimationContext runAnimationGroup:] + 55 (AppKit + 367947) [0x7ff807272d4b]
  7   thunk for @escaping @callee_guaranteed (@guaranteed NSAnimationContext) -> () + 40 (SwiftUI + 11430772) [0x7ff9107d7b74]
  7   partial apply for thunk for @callee_guaranteed (@guaranteed NSAnimationContext) -> () + 17 (SwiftUI + 11478852) [0x7ff9107e3744]
  7   closure #1 in NSHostingView.layout() + 126 (SwiftUI + 11441542) [0x7ff9107da586]
  7   ViewRendererHost.render(interval:updateDisplayList:) + 374 (SwiftUI + 11049777) [0x7ff91077ab31]
  5   closure #1 in ViewRendererHost.render(interval:updateDisplayList:) + 6794 (SwiftUI + 11139311) [0x7ff9107908ef]
  5   NSHostingView.renderDisplayList(_:asynchronously:time:nextTime:version:maxVersion:) + 284 (SwiftUI + 11468525) [0x7ff9107e0eed]
  5   closure #1 in NSHostingView.renderDisplayList(_:asynchronously:time:nextTime:version:maxVersion:) + 176 (SwiftUI + 11468914) [0x7ff9107e1072]
  5   DisplayList.ViewRenderer.render(rootView:from:time:nextTime:version:maxVersion:contentsScale:) + 110 (SwiftUI + 11389128) [0x7ff9107cd8c8]
  5   DisplayList.ViewUpdater.render(rootView:from:time:version:maxVersion:contentsScale:) + 791 (SwiftUI + 12829198) [0x7ff91092d20e]
  5   closure #1 in DisplayList.ViewUpdater.render(rootView:from:time:version:maxVersion:contentsScale:) + 446 (SwiftUI + 12829707) [0x7ff91092d40b]
  5   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757]
  5   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 683 (SwiftUI + 12835327) [0x7ff91092e9ff]
  5   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757]
  4   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 683 (SwiftUI + 12835327) [0x7ff91092e9ff]
  4   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757]
  2   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 1404 (SwiftUI + 12836048) [0x7ff91092ecd0]
  2   DisplayList.ViewUpdater.updateItemView(container:from:localState:) + 113 (SwiftUI + 12840938) [0x7ff91092ffea]
  1   DisplayList.ViewUpdater.ViewCache.update(item:state:tag:in:makeView:updateView:) + 963 (SwiftUI + 11352205) [0x7ff9107c488d]
  1   static DisplayList.ViewUpdater.Platform.updateItemView(_:item:state:) + 5075 (SwiftUI + 2139531) [0x7ff90fefb58b]
  1   -[CALayer setBackgroundColor:] + 48 (QuartzCore + 68648) [0x7ff80b8dcc28]
  1   CA::Layer::setter(unsigned int, _CAValueType, void const*) + 157 (QuartzCore + 34665) [0x7ff80b8d4769]
  1   CA::AttrList::get(unsigned int, _CAValueType, void*) const + 15 (QuartzCore + 14125) [0x7ff80b8cf72d]
 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f]
 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9]
 *1   ??? (kernel + 1113914) [0xffffff800031ff3a]
 *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147]
 *1   ??? (kernel + 607154) [0xffffff80002a43b2]
 *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb]


Process:          RedLemon [27952]
UUID:             70CFDCC9-8CE5-37C8-B428-9C01403E01D8
Path:             /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
Identifier:       com.redlemon.app
Version:          1.0.14 (14)
Shared Cache:     246818C3-4B9F-3462-BCAF-FDF71975E5FE slid base address 0x7ff804432000, slide 0x4432000
Architecture:     x86_64
Parent:           bash [27378]
Responsible:      Electron (Antigravity) [584]
UID:              501
Footprint:        60.25 GB
Pageins:          20 pages
Time Since Fork:  97s
Num samples:      49 (1-49)
CPU Time:         0.159s (280.9M cycles, 169.1M instructions, 1.66c/i)
Note:             Unresponsive for 2 seconds before sampling
Note:             5 idle work queue threads omitted

  Thread 0x2ca9e    DispatchQueue "com.apple.main-thread"(1)    49 samples (1-49)    priority 47 (base 47)    cpu time 0.091s (163.6M cycles, 121.9M instructions, 1.34c/i)
  <process frontmost, thread QoS user interactive (requested user interactive), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  49  start + 462 (dyld + 21806) [0x115b4652e] 1-49
    49  RedLemon_main + 9 (RedLemonApp.swift in RedLemon + 17460153) [0x10772dbb9] 1-49
      49  static RedLemonApp.$main() + 35 (RedLemonApp.swift:31,1 in RedLemon + 17460019) [0x10772db33] 1-49
        49  static App.main() + 63 (SwiftUI + 6122591) [0x7ff9102c7c5f] 1-49
          49  runApp<A>(_:) + 164 (SwiftUI + 11396132) [0x7ff9107cf424] 1-49
            49  specialized runApp(_:) + 161 (SwiftUI + 508060) [0x7ff90fd6d09c] 1-49
              49  NSApplicationMain + 817 (AppKit + 14234) [0x7ff80721c79a] 1-49
                49  -[NSApplication run] + 586 (AppKit + 194584) [0x7ff807248818] 1-49
                  49  -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394 (AppKit + 250214) [0x7ff807256166] 1-49
                    49  _DPSNextEvent + 927 (AppKit + 256681) [0x7ff807257aa9] 1-49
                      49  _BlockUntilNextEventMatchingListInModeWithFilter + 70 (HIToolbox + 188645) [0x7ff80d4cb0e5] 1-49
                        49  ReceiveNextEventCommon + 283 (HIToolbox + 188947) [0x7ff80d4cb213] 1-49
                          49  RunCurrentEventLoopInMode + 292 (HIToolbox + 189926) [0x7ff80d4cb5e6] 1-49
                            49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c] 1-49
                              49  __CFRunLoopRun + 840 (CoreFoundation + 518004) [0x7ff804819774] 1-49
                                49  __CFRunLoopDoObservers + 543 (CoreFoundation + 520930) [0x7ff80481a2e2] 1-49
                                  49  __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23 (CoreFoundation + 521296) [0x7ff80481a450] 1-49
                                    49  ___NSRunLoopObserverCreateWithHandler_block_invoke + 41 (AppKit + 9383228) [0x7ff807b0bd3c] 1-49
                                      49  __62+[CATransaction(NSCATransaction) NS_setFlushesWithDisplayLink]_block_invoke + 285 (AppKit + 1748337) [0x7ff8073c3d71] 1-49
                                        37  CA::Transaction::commit() + 376 (QuartzCore + 10488) [0x7ff80b8ce8f8] 1-37
                                          37  CA::Transaction::run_commit_handlers(CATransactionPhase) + 98 (QuartzCore + 15338) [0x7ff80b8cfbea] 1-37
                                            37  NSDisplayCycleFlush + 921 (AppKit + 1087108) [0x7ff807322684] 1-37
                                              37  NSDisplayCycleObserverInvoke + 155 (AppKit + 1088247) [0x7ff807322af7] 1-37
                                                16  __NSWindowGetDisplayCycleObserverForUpdateConstraints_block_invoke + 430 (AppKit + 1088741) [0x7ff807322ce5] 1-16
                                                  16  -[NSWindow(NSConstraintBasedLayout) updateConstraintsIfNeeded] + 253 (AppKit + 1089186) [0x7ff807322ea2] 1-16
                                                    16  __62-[NSWindow(NSConstraintBasedLayout) updateConstraintsIfNeeded]_block_invoke + 134 (AppKit + 1089406) [0x7ff807322f7e] 1-16
                                                      16  -[NSView updateConstraintsForSubtreeIfNeeded] + 229 (AppKit + 921890) [0x7ff8072fa122] 1-16
                                                        16  __45-[NSView updateConstraintsForSubtreeIfNeeded]_block_invoke + 48 (AppKit + 922449) [0x7ff8072fa351] 1-16
                                                          16  -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426 (AppKit + 923118) [0x7ff8072fa5ee] 1-16
                                                            16  -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426 (AppKit + 923118) [0x7ff8072fa5ee] 1-16
                                                              16  -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 198 (AppKit + 922890) [0x7ff8072fa50a] 1-16
                                                                16  -[NSISEngine withBehaviors:performModifications:] + 84 (CoreAutoLayout + 64755) [0x7ff80bedccf3] 1-16
                                                                  16  __82-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]_block_invoke + 269 (AppKit + 984570) [0x7ff8073095fa] 1-16
                                                                    16  -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426 (AppKit + 923118) [0x7ff8072fa5ee] 1-16
                                                                      16  -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426 (AppKit + 923118) [0x7ff8072fa5ee] 1-16
                                                                        16  -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426 (AppKit + 923118) [0x7ff8072fa5ee] 1-16
                                                                          11  -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 73 (AppKit + 922765) [0x7ff8072fa48d] 1-11
                                                                            11  @objc NSHostingView._willUpdateConstraintsForSubtree() + 21 (SwiftUI + 11440740) [0x7ff9107da264] 1-11
                                                                              11  NSHostingView._willUpdateConstraintsForSubtree() + 240 (SwiftUI + 11440387) [0x7ff9107da103] 1-11
                                                                                11  NSHostingView.SizeConstraints.update(from:) + 309 (SwiftUI + 11437269) [0x7ff9107d94d5] 1-11
                                                                                  11  NSHostingView.minSize() + 114 (SwiftUI + 11412566) [0x7ff9107d3456] 1-11
                                                                                    11  ViewRendererHost.sizeThatFits(_:) + 97 (SwiftUI + 11049377) [0x7ff91077a9a1] 1-11
                                                                                      11  protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1> + 25 (SwiftUI + 11168976) [0x7ff910797cd0] 1-11
                                                                                        11  ViewRendererHost.updateViewGraph<A>(body:) + 78 (SwiftUI + 11110623) [0x7ff9107898df] 1-11
                                                                                          11  closure #1 in ViewRendererHost.updateViewGraph<A>(body:) + 69 (SwiftUI + 11115688) [0x7ff91078aca8] 1-11
                                                                                            11  partial apply for closure #1 in ViewRendererHost.sizeThatFits(_:) + 43 (SwiftUI + 11177904) [0x7ff910799fb0] 1-11
                                                                                              11  closure #1 in ViewRendererHost.sizeThatFits(_:) + 47 (SwiftUI + 11140259) [0x7ff910790ca3] 1-11
                                                                                                2   ViewGraph.sizeThatFits(_:) + 220 (SwiftUI + 2625746) [0x7ff90ff720d2] 1-2
                                                                                                  2   ViewGraph.layoutComputer.getter + 102 (SwiftUI + 2650799) [0x7ff90ff782af] 1-2
                                                                                                    2   AGGraphGetValue + 289 (AttributeGraph + 141919) [0x7ff910bb3a5f] 1-2
                                                                                                      2   AG::Graph::value_ref(AG::AttributeID, AGSwiftMetadata const*, unsigned char&) + 155 (AttributeGraph + 48557) [0x7ff910b9cdad] 1-2
                                                                                                        2   AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421 (AttributeGraph + 23895) [0x7ff910b96d57] 1-2
                                                                                                          2   AG::Graph::UpdateStack::update() + 559 (AttributeGraph + 22359) [0x7ff910b96757] 1-2
                                                                                                            1   partial apply for implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 26 (SwiftUI + 1282570) [0x7ff90fe2a20a] 1
                                                                                                              1   __swift_instantiateGenericMetadata + 29 (SwiftUI + 912861) [0x7ff90fdcfddd] 1
                                                                                                                1   _swift_getGenericMetadata(swift::MetadataRequest, void const* const*, swift::TargetTypeContextDescriptor<swift::InProcess> const*) + 656 (libswiftCore.dylib + 3172048) [0x7ff811f186d0] 1
                                                                                                                  1   std::__1::pair<swift::HashMapElementWrapper<(anonymous namespace)::GenericCacheEntry>*, unsigned int> swift::ConcurrentReadableHashMap<swift::HashMapElementWrapper<(anonymous namespace)::GenericCacheEntry>, swift::StaticMutex>::find<swift::MetadataCacheKey>(swift::MetadataCacheKey const&, swift::ConcurrentReadableHashMap<swift::HashMapElementWrapper<(anonymous namespace)::GenericCacheEntry>, swift::StaticMutex>::IndexStorage, unsigned long, swift::HashMapElementWrapper<(anonymous namespace)::GenericCacheEntry>*) + 215 (libswiftCore.dylib + 3226727) [0x7ff811f25c67] 1
                                                                                                                   *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 1
                                                                                                                     *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 1
                                                                                                                       *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 1
                                                                                                                         *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 1
                                                                                                                           *1   ??? (kernel + 607154) [0xffffff80002a43b2] 1
                                                                                                                             *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 1
                                                                                                            1   partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 49 (SwiftUI + 8489188) [0x7ff9105098e4] 2
                                                                                                              1   specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 121 (SwiftUI + 8389782) [0x7ff9104f1496] 2
                                                                                                                1   specialized StatefulRule<>.updateLayoutComputer<A>(layout:environment:layoutComputers:) + 210 (SwiftUI + 7575862) [0x7ff91042a936] 2
                                                                                                                  1   specialized static LayoutComputerDelegate.update<A>(_:maybeInPlace:create:) + 128 (SwiftUI + 3696208) [0x7ff910077650] 2
                                                                                                                    1   swift_dynamicCastClass + 93 (libswiftCore.dylib + 3095277) [0x7ff811f05aed] 2
                                                                                                                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 2
                                                                                                                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 2
                                                                                                                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 2
                                                                                                                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 2
                                                                                                                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 2
                                                                                                                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 2
                                                                                                9   ViewGraph.sizeThatFits(_:) + 256 (SwiftUI + 2625782) [0x7ff90ff720f6] 3-11
                                                                                                  9   LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99 (SwiftUI + 5132403) [0x7ff9101d6073] 3-11
                                                                                                    9   UnaryLayoutEngine.sizeThatFits(_:) + 512 (SwiftUI + 9004374) [0x7ff910587556] 3-11
                                                                                                      9   closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69 (SwiftUI + 9004682) [0x7ff91058768a] 3-11
                                                                                                        9   protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _FlexFrameLayout + 46 (SwiftUI + 5121752) [0x7ff9101d36d8] 3-11
                                                                                                          9   _FlexFrameLayout.sizeThatFits(in:context:child:) + 501 (SwiftUI + 5120536) [0x7ff9101d3218] 3-11
                                                                                                            9   StackLayout.Storage.sizeThatFits(_:) + 124 (SwiftUI + 13017556) [0x7ff91095b1d4] 3-11
                                                                                                              9   StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386 (SwiftUI + 13017983) [0x7ff91095b37f] 3-11
                                                                                                                9   StackLayout.UnmanagedImplementation.placeChildren(in:) + 178 (SwiftUI + 13021166) [0x7ff91095bfee] 3-11
                                                                                                                  9   specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143 (SwiftUI + 13030937) [0x7ff91095e619] 3-11
                                                                                                                    9   specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 757 (SwiftUI + 13026274) [0x7ff91095d3e2] 3-11
                                                                                                                      9   StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 106 (SwiftUI + 13023223) [0x7ff91095c7f7] 3-11
                                                                                                                        9   StackLayout.Storage.sizeThatFits(_:) + 124 (SwiftUI + 13017556) [0x7ff91095b1d4] 3-11
                                                                                                                          9   StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386 (SwiftUI + 13017983) [0x7ff91095b37f] 3-11
                                                                                                                            9   StackLayout.UnmanagedImplementation.placeChildren(in:) + 178 (SwiftUI + 13021166) [0x7ff91095bfee] 3-11
                                                                                                                              9   specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143 (SwiftUI + 13030937) [0x7ff91095e619] 3-11
                                                                                                                                6   specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130 (SwiftUI + 13025647) [0x7ff91095d16f] 3-8
                                                                                                                                  6   StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 924 (SwiftUI + 13027371) [0x7ff91095d82b] 3-8
                                                                                                                                    6   LayoutComputer.Delegate.lengthThatFits(_:in:) + 51 (SwiftUI + 5131424) [0x7ff9101d5ca0] 3-8
                                                                                                                                      6   LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99 (SwiftUI + 5132403) [0x7ff9101d6073] 3-8
                                                                                                                                        6   UnaryLayoutEngine.sizeThatFits(_:) + 512 (SwiftUI + 9004374) [0x7ff910587556] 3-8
                                                                                                                                          6   closure #1 in UnaryLayoutEngine.sizeThatFits(_:) + 69 (SwiftUI + 9004682) [0x7ff91058768a] 3-8
                                                                                                                                            6   protocol witness for UnaryLayout.sizeThatFits(in:context:child:) in conformance _PaddingLayout + 49 (SwiftUI + 4148107) [0x7ff9100e5b8b] 3-8
                                                                                                                                              6   _PaddingLayout.sizeThatFits(in:context:child:) + 187 (SwiftUI + 4147298) [0x7ff9100e5862] 3-8
                                                                                                                                                6   StackLayout.Storage.sizeThatFits(_:) + 124 (SwiftUI + 13017556) [0x7ff91095b1d4] 3-8
                                                                                                                                                  6   StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386 (SwiftUI + 13017983) [0x7ff91095b37f] 3-8
                                                                                                                                                    6   StackLayout.UnmanagedImplementation.placeChildren(in:) + 178 (SwiftUI + 13021166) [0x7ff91095bfee] 3-8
                                                                                                                                                      6   specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143 (SwiftUI + 13030937) [0x7ff91095e619] 3-8
                                                                                                                                                        5   specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130 (SwiftUI + 13025647) [0x7ff91095d16f] 3-7
                                                                                                                                                          5   StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 924 (SwiftUI + 13027371) [0x7ff91095d82b] 3-7
                                                                                                                                                            5   LayoutComputer.Delegate.lengthThatFits(_:in:) + 51 (SwiftUI + 5131424) [0x7ff9101d5ca0] 3-7
                                                                                                                                                              5   StackLayout.Storage.sizeThatFits(_:) + 124 (SwiftUI + 13017556) [0x7ff91095b1d4] 3-7
                                                                                                                                                                5   StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386 (SwiftUI + 13017983) [0x7ff91095b37f] 3-7
                                                                                                                                                                  5   StackLayout.UnmanagedImplementation.placeChildren(in:) + 178 (SwiftUI + 13021166) [0x7ff91095bfee] 3-7
                                                                                                                                                                    5   specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143 (SwiftUI + 13030937) [0x7ff91095e619] 3-7
                                                                                                                                                                      1   specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 130 (SwiftUI + 13025647) [0x7ff91095d16f] 3
                                                                                                                                                                        1   StackLayout.UnmanagedImplementation.prioritize(_:proposedSize:) + 924 (SwiftUI + 13027371) [0x7ff91095d82b] 3
                                                                                                                                                                          1   LayoutComputer.Delegate.lengthThatFits(_:in:) + 51 (SwiftUI + 5131424) [0x7ff9101d5ca0] 3
                                                                                                                                                                            1   StackLayout.Storage.sizeThatFits(_:) + 124 (SwiftUI + 13017556) [0x7ff91095b1d4] 3
                                                                                                                                                                              1   StackLayout.UnmanagedImplementation.sizeThatFits(_:) + 386 (SwiftUI + 13017983) [0x7ff91095b37f] 3
                                                                                                                                                                                1   StackLayout.UnmanagedImplementation.placeChildren(in:) + 178 (SwiftUI + 13021166) [0x7ff91095bfee] 3
                                                                                                                                                                                  1   specialized StackLayout.UnmanagedImplementation.placeChildren1(in:minorProposalForChild:) + 143 (SwiftUI + 13030937) [0x7ff91095e619] 3
                                                                                                                                                                                    1   specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 757 (SwiftUI + 13026274) [0x7ff91095d3e2] 3
                                                                                                                                                                                      1   StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 217 (SwiftUI + 13023334) [0x7ff91095c866] 3
                                                                                                                                                                                        1   ViewDimensions.subscript.getter + 67 (SwiftUI + 11343513) [0x7ff9107c2699] 3
                                                                                                                                                                                          1   LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109 (SwiftUI + 5132699) [0x7ff9101d619b] 3
                                                                                                                                                                                            1   protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9 (SwiftUI + 9005243) [0x7ff9105878bb] 3
                                                                                                                                                                                              1   UnaryLayoutEngine.explicitAlignment(_:at:) + 292 (SwiftUI + 9004992) [0x7ff9105877c0] 3
                                                                                                                                                                                                1   StackLayout.Storage.explicitAlignment(_:at:) + 109 (SwiftUI + 13019731) [0x7ff91095ba53] 3
                                                                                                                                                                                                  1   StackLayout.UnmanagedImplementation.explicitAlignment(_:at:) + 693 (SwiftUI + 13020481) [0x7ff91095bd41] 3
                                                                                                                                                                                                    1   LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109 (SwiftUI + 5132699) [0x7ff9101d619b] 3
                                                                                                                                                                                                      1   protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9 (SwiftUI + 9005243) [0x7ff9105878bb] 3
                                                                                                                                                                                                        1   UnaryLayoutEngine.explicitAlignment(_:at:) + 137 (SwiftUI + 9004837) [0x7ff910587725] 3
                                                                                                                                                                                                          1   LayoutProxy.layoutComputer.getter + 98 (SwiftUI + 3097141) [0x7ff90ffe5235] 3
                                                                                                                                                                                                            1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 3
                                                                                                                                                                                                             *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 3
                                                                                                                                                                                                               *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 3
                                                                                                                                                                                                                 *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 3
                                                                                                                                                                                                                   *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 3
                                                                                                                                                                                                                     *1   ??? (kernel + 607154) [0xffffff80002a43b2] 3
                                                                                                                                                                                                                       *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 3
                                                                                                                                                                      4   specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 757 (SwiftUI + 13026274) [0x7ff91095d3e2] 4-7
                                                                                                                                                                        4   StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 217 (SwiftUI + 13023334) [0x7ff91095c866] 4-7
                                                                                                                                                                          4   ViewDimensions.subscript.getter + 67 (SwiftUI + 11343513) [0x7ff9107c2699] 4-7
                                                                                                                                                                            4   StackLayout.Storage.explicitAlignment(_:at:) + 109 (SwiftUI + 13019731) [0x7ff91095ba53] 4-7
                                                                                                                                                                              4   StackLayout.UnmanagedImplementation.explicitAlignment(_:at:) + 693 (SwiftUI + 13020481) [0x7ff91095bd41] 4-7
                                                                                                                                                                                4   LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109 (SwiftUI + 5132699) [0x7ff9101d619b] 4-7
                                                                                                                                                                                  4   protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9 (SwiftUI + 9005243) [0x7ff9105878bb] 4-7
                                                                                                                                                                                    4   UnaryLayoutEngine.explicitAlignment(_:at:) + 292 (SwiftUI + 9004992) [0x7ff9105877c0] 4-7
                                                                                                                                                                                      2   StackLayout.Storage.explicitAlignment(_:at:) + 109 (SwiftUI + 13019731) [0x7ff91095ba53] 4-5
                                                                                                                                                                                        2   StackLayout.UnmanagedImplementation.explicitAlignment(_:at:) + 693 (SwiftUI + 13020481) [0x7ff91095bd41] 4-5
                                                                                                                                                                                          2   LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109 (SwiftUI + 5132699) [0x7ff9101d619b] 4-5
                                                                                                                                                                                            2   protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9 (SwiftUI + 9005243) [0x7ff9105878bb] 4-5
                                                                                                                                                                                              2   UnaryLayoutEngine.explicitAlignment(_:at:) + 292 (SwiftUI + 9004992) [0x7ff9105877c0] 4-5
                                                                                                                                                                                                2   StackLayout.Storage.explicitAlignment(_:at:) + 109 (SwiftUI + 13019731) [0x7ff91095ba53] 4-5
                                                                                                                                                                                                  1   StackLayout.UnmanagedImplementation.explicitAlignment(_:at:) + 431 (SwiftUI + 13020219) [0x7ff91095bc3b] 4
                                                                                                                                                                                                    1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 4
                                                                                                                                                                                                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 4
                                                                                                                                                                                                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 4
                                                                                                                                                                                                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 4
                                                                                                                                                                                                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 4
                                                                                                                                                                                                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 4
                                                                                                                                                                                                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 4
                                                                                                                                                                                                  1   StackLayout.UnmanagedImplementation.explicitAlignment(_:at:) + 502 (SwiftUI + 13020290) [0x7ff91095bc82] 5
                                                                                                                                                                                                    1   ResolvedImageLayoutDelegate.sizeThatFits(_:) + 311 (SwiftUI + 3693007) [0x7ff9100769cf] 5
                                                                                                                                                                                                      1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 5
                                                                                                                                                                                                       *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 5
                                                                                                                                                                                                         *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 5
                                                                                                                                                                                                           *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 5
                                                                                                                                                                                                             *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 5
                                                                                                                                                                                                               *1   ??? (kernel + 607154) [0xffffff80002a43b2] 5
                                                                                                                                                                                                                 *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 5
                                                                                                                                                                                      2   LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109 (SwiftUI + 5132699) [0x7ff9101d619b] 6-7
                                                                                                                                                                                        2   protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9 (SwiftUI + 9005243) [0x7ff9105878bb] 6-7
                                                                                                                                                                                          1   UnaryLayoutEngine.explicitAlignment(_:at:) + 137 (SwiftUI + 9004837) [0x7ff910587725] 6
                                                                                                                                                                                            1   LayoutProxy.layoutComputer.getter + 98 (SwiftUI + 3097141) [0x7ff90ffe5235] 6
                                                                                                                                                                                              1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 6
                                                                                                                                                                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 6
                                                                                                                                                                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 6
                                                                                                                                                                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 6
                                                                                                                                                                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 6
                                                                                                                                                                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 6
                                                                                                                                                                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 6
                                                                                                                                                                                          1   UnaryLayoutEngine.explicitAlignment(_:at:) + 292 (SwiftUI + 9004992) [0x7ff9105877c0] 7
                                                                                                                                                                                            1   LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109 (SwiftUI + 5132699) [0x7ff9101d619b] 7
                                                                                                                                                                                              1   protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9 (SwiftUI + 9005243) [0x7ff9105878bb] 7
                                                                                                                                                                                                1   UnaryLayoutEngine.explicitAlignment(_:at:) + 292 (SwiftUI + 9004992) [0x7ff9105877c0] 7
                                                                                                                                                                                                  1   StackLayout.Storage.explicitAlignment(_:at:) + 109 (SwiftUI + 13019731) [0x7ff91095ba53] 7
                                                                                                                                                                                                    1   StackLayout.UnmanagedImplementation.explicitAlignment(_:at:) + 502 (SwiftUI + 13020290) [0x7ff91095bc82] 7
                                                                                                                                                                                                      1   ResolvedImageLayoutDelegate.sizeThatFits(_:) + 311 (SwiftUI + 3693007) [0x7ff9100769cf] 7
                                                                                                                                                                                                        1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 7
                                                                                                                                                                                                         *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 7
                                                                                                                                                                                                           *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 7
                                                                                                                                                                                                             *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 7
                                                                                                                                                                                                               *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 7
                                                                                                                                                                                                                 *1   ??? (kernel + 607154) [0xffffff80002a43b2] 7
                                                                                                                                                                                                                   *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 7
                                                                                                                                                        1   specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 757 (SwiftUI + 13026274) [0x7ff91095d3e2] 8
                                                                                                                                                          1   StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 217 (SwiftUI + 13023334) [0x7ff91095c866] 8
                                                                                                                                                            1   ViewDimensions.subscript.getter + 67 (SwiftUI + 11343513) [0x7ff9107c2699] 8
                                                                                                                                                              1   LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109 (SwiftUI + 5132699) [0x7ff9101d619b] 8
                                                                                                                                                                1   protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9 (SwiftUI + 9005243) [0x7ff9105878bb] 8
                                                                                                                                                                  1   UnaryLayoutEngine.explicitAlignment(_:at:) + 137 (SwiftUI + 9004837) [0x7ff910587725] 8
                                                                                                                                                                    1   LayoutProxy.layoutComputer.getter + 98 (SwiftUI + 3097141) [0x7ff90ffe5235] 8
                                                                                                                                                                      1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 8
                                                                                                                                                                       *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 8
                                                                                                                                                                         *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 8
                                                                                                                                                                           *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 8
                                                                                                                                                                             *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 8
                                                                                                                                                                               *1   ??? (kernel + 607154) [0xffffff80002a43b2] 8
                                                                                                                                                                                 *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 8
                                                                                                                                3   specialized StackLayout.UnmanagedImplementation.sizeChildrenGenerallyWithConcreteMajorProposal(in:minorProposalForChild:) + 757 (SwiftUI + 13026274) [0x7ff91095d3e2] 9-11
                                                                                                                                  3   StackLayout.UnmanagedImplementation.resize(_:proposal:proxy:) + 217 (SwiftUI + 13023334) [0x7ff91095c866] 9-11
                                                                                                                                    3   ViewDimensions.subscript.getter + 67 (SwiftUI + 11343513) [0x7ff9107c2699] 9-11
                                                                                                                                      3   LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109 (SwiftUI + 5132699) [0x7ff9101d619b] 9-11
                                                                                                                                        3   protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9 (SwiftUI + 9005243) [0x7ff9105878bb] 9-11
                                                                                                                                          3   UnaryLayoutEngine.explicitAlignment(_:at:) + 292 (SwiftUI + 9004992) [0x7ff9105877c0] 9-11
                                                                                                                                            3   LayoutComputer.EngineDelegate.explicitAlignment(_:at:) + 109 (SwiftUI + 5132699) [0x7ff9101d619b] 9-11
                                                                                                                                              3   protocol witness for LayoutEngineProtocol.explicitAlignment(_:at:) in conformance UnaryLayoutEngine<A> + 9 (SwiftUI + 9005243) [0x7ff9105878bb] 9-11
                                                                                                                                                1   UnaryLayoutEngine.explicitAlignment(_:at:) + 137 (SwiftUI + 9004837) [0x7ff910587725] 9
                                                                                                                                                  1   LayoutProxy.layoutComputer.getter + 98 (SwiftUI + 3097141) [0x7ff90ffe5235] 9
                                                                                                                                                    1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 9
                                                                                                                                                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 9
                                                                                                                                                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 9
                                                                                                                                                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 9
                                                                                                                                                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 9
                                                                                                                                                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 9
                                                                                                                                                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 9
                                                                                                                                                2   UnaryLayoutEngine.explicitAlignment(_:at:) + 292 (SwiftUI + 9004992) [0x7ff9105877c0] 10-11
                                                                                                                                                  2   StackLayout.Storage.explicitAlignment(_:at:) + 109 (SwiftUI + 13019731) [0x7ff91095ba53] 10-11
                                                                                                                                                    2   StackLayout.UnmanagedImplementation.explicitAlignment(_:at:) + 502 (SwiftUI + 13020290) [0x7ff91095bc82] 10-11
                                                                                                                                                      2   LayoutComputer.EngineDelegate.sizeThatFits(_:) + 99 (SwiftUI + 5132403) [0x7ff9101d6073] 10-11
                                                                                                                                                        2   ButtonLayoutComputer.Engine.sizeThatFits(_:) + 65 (SwiftUI + 6134722) [0x7ff9102cabc2] 10-11
                                                                                                                                                          2   NSButton.contentInsetsToAlignmentRect.getter + 107 (SwiftUI + 6133856) [0x7ff9102ca860] 10-11
                                                                                                                                                            2   -[NSButton _contentViewInsets] + 82 (AppKit + 4963196) [0x7ff8076d4b7c] 10-11
                                                                                                                                                              2   -[NSButtonCell _idealContentInsets:maximumContentInsets:forRect:inView:] + 345 (AppKit + 4974361) [0x7ff8076d7719] 10-11
                                                                                                                                                                2   -[NSAppearance _idealContentInsets:maximumContentInsets:forWidget:] + 259 (AppKit + 11616214) [0x7ff807d2cfd6] 10-11
                                                                                                                                                                  2   -[NSAppearance _copyMeasurements:context:options:requestedMeasurements:] + 161 (AppKit + 535932) [0x7ff80729bd7c] 10-11
                                                                                                                                                                    2   -[NSCompositeAppearance _callCoreUIWithBlock:options:requireBezelTintColor:] + 386 (AppKit + 298546) [0x7ff807261e32] 10-11
                                                                                                                                                                      2   __72-[NSAppearance _copyMeasurements:context:options:requestedMeasurements:]_block_invoke + 61 (AppKit + 536055) [0x7ff80729bdf7] 10-11
                                                                                                                                                                        2   CUICopyMeasurements + 166 (CoreUI + 38170) [0x7ff80bc3351a] 10-11
                                                                                                                                                                          2   CUIRenderer::CopyMeasurements(CGRect, CGContext*, __CFDictionary const*, __CFArray const*) + 261 (CoreUI + 38481) [0x7ff80bc33651] 10-11
                                                                                                                                                                            1   CUICoreThemeRenderer::CopyMeasurementsForRendition(CUIRenditionKey*, CUIDescriptor const*, __CFDictionary const*, __CFArray const*, __CFDictionary*) + 89 (CoreUI + 152273) [0x7ff80bc4f2d1] 10
                                                                                                                                                                              1   objc_msgSend + 41 (libobjc.A.dylib + 29225) [0x7ff8045e7229] 10
                                                                                                                                                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 10
                                                                                                                                                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 10
                                                                                                                                                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 10
                                                                                                                                                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 10
                                                                                                                                                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 10
                                                                                                                                                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 10
                                                                                                                                                                            1   CUICoreThemeRenderer::CopyMeasurementsForRendition(CUIRenditionKey*, CUIDescriptor const*, __CFDictionary const*, __CFArray const*, __CFDictionary*) + 144 (CoreUI + 152328) [0x7ff80bc4f308] 11
                                                                                                                                                                              1   objc_retain + 19 (libobjc.A.dylib + 28803) [0x7ff8045e7083] 11
                                                                                                                                                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 11
                                                                                                                                                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 11
                                                                                                                                                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 11
                                                                                                                                                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 11
                                                                                                                                                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 11
                                                                                                                                                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 11
                                                                          1   -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426 (AppKit + 923118) [0x7ff8072fa5ee] 12
                                                                            1   -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 1010 (AppKit + 923702) [0x7ff8072fa836] 12
                                                                             *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 12
                                                                               *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 12
                                                                                 *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 12
                                                                                   *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 12
                                                                                     *1   ??? (kernel + 607154) [0xffffff80002a43b2] 12
                                                                                       *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 12
                                                                          1   objc_msgSend + 23 (libobjc.A.dylib + 29207) [0x7ff8045e7217] 13
                                                                           *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 13
                                                                             *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 13
                                                                               *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 13
                                                                                 *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 13
                                                                                   *1   ??? (kernel + 607154) [0xffffff80002a43b2] 13
                                                                                     *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 13
                                                                          3   -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 426 (AppKit + 923118) [0x7ff8072fa5ee] 14-16
                                                                            1   -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 198 (AppKit + 922890) [0x7ff8072fa50a] 14
                                                                              1   -[NSISEngine withBehaviors:performModifications:] + 84 (CoreAutoLayout + 64755) [0x7ff80bedccf3] 14
                                                                                1   __82-[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:]_block_invoke + 269 (AppKit + 984570) [0x7ff8073095fa] 14
                                                                                  1   -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 849 (AppKit + 923541) [0x7ff8072fa795] 14
                                                                                    1   _NSViewUpdateConstraints + 95 (AppKit + 924275) [0x7ff8072faa73] 14
                                                                                      1   -[NSView updateConstraints] + 102 (AppKit + 924497) [0x7ff8072fab51] 14
                                                                                        1   objc_msgSend + 41 (libobjc.A.dylib + 29225) [0x7ff8045e7229] 14
                                                                                         *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 14
                                                                                           *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 14
                                                                                             *1   ??? (kernel + 1106893) [0xffffff800031e3cd] 14
                                                                                               *1   vm_fault_page + 2706 (kernel + 1124450) [0xffffff8000322862] 14
                                                                                                 *1   vm_compressor_pager_get + 187 (kernel + 1067963) [0xffffff8000314bbb] 14
                                                                                                   *1   vm_compressor_get + 243 (kernel + 1059779) [0xffffff8000312bc3] 14
                                                                                                     *1   ??? (kernel + 1060476) [0xffffff8000312e7c] 14
                                                                                                       *1   c_seg_swapin + 362 (kernel + 1054874) [0xffffff800031189a] 14
                                                                                                         *1   vm_swap_get + 251 (kernel + 1082235) [0xffffff800031837b] 14
                                                                                                           *1   vm_swapfile_io + 256 (kernel + 7270304) [0xffffff80008fefa0] 14
                                                                                                             *1   vnode_pagein + 1340 (kernel + 7246124) [0xffffff80008f912c] 14
                                                                                                               *1   apfs_pagein + 2014 (apfs + 424501) [0xffffff8003575a35] 14
                                                                                                                 *1   cluster_pagein + 21 (kernel + 3115845) [0xffffff8000508b45] 14
                                                                                                                   *1   cluster_pagein_ext + 286 (kernel + 3116142) [0xffffff8000508c6e] 14
                                                                                                                     *1   ??? (kernel + 3111656) [0xffffff8000507ae8] 14
                                                                                                                       *1   buf_biowait + 133 (kernel + 3073573) [0xffffff80004fe625] 14
                                                                                                                         *1   ??? (kernel + 6637228) [0xffffff80008646ac] 14
                                                                                                                           *1   lck_mtx_sleep + 110 (kernel + 518078) [0xffffff800028e7be] 14
                                                                                                                             *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 14
                                                                                                                               *1   ??? (kernel + 607154) [0xffffff80002a43b2] 14
                                                                                                                                 *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 14
                                                                            1   -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 849 (AppKit + 923541) [0x7ff8072fa795] 15
                                                                              1   _NSViewUpdateConstraints + 95 (AppKit + 924275) [0x7ff8072faa73] 15
                                                                                1   -[NSView updateConstraints] + 115 (AppKit + 924510) [0x7ff8072fab5e] 15
                                                                                  1   -[NSView(NSDeclarativeConstraintCreation) _updateDeclaredConstraints] + 88 (AppKit + 925887) [0x7ff8072fb0bf] 15
                                                                                    1   _NSSubclassOverridesSelector + 43 (AppKit + 95126) [0x7ff807230396] 15
                                                                                      1   class_getMethodImplementation + 59 (libobjc.A.dylib + 55103) [0x7ff8045ed73f] 15
                                                                                       *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 15
                                                                                         *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 15
                                                                                           *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 15
                                                                                             *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 15
                                                                                               *1   ??? (kernel + 607154) [0xffffff80002a43b2] 15
                                                                                                 *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 15
                                                                            1   -[NSView _updateConstraintsForSubtreeIfNeededCollectingViewsWithInvalidBaselines:] + 73 (AppKit + 922765) [0x7ff8072fa48d] 16
                                                                              1   @objc NSHostingView._willUpdateConstraintsForSubtree() + 21 (SwiftUI + 11440740) [0x7ff9107da264] 16
                                                                                1   NSHostingView._willUpdateConstraintsForSubtree() + 240 (SwiftUI + 11440387) [0x7ff9107da103] 16
                                                                                  1   NSHostingView.SizeConstraints.update(from:) + 309 (SwiftUI + 11437269) [0x7ff9107d94d5] 16
                                                                                    1   NSHostingView.minSize() + 114 (SwiftUI + 11412566) [0x7ff9107d3456] 16
                                                                                      1   ViewRendererHost.sizeThatFits(_:) + 97 (SwiftUI + 11049377) [0x7ff91077a9a1] 16
                                                                                        1   protocol witness for ViewGraphDelegate.updateViewGraph<A>(body:) in conformance NSHostingView<A1> + 25 (SwiftUI + 11168976) [0x7ff910797cd0] 16
                                                                                          1   ViewRendererHost.updateViewGraph<A>(body:) + 78 (SwiftUI + 11110623) [0x7ff9107898df] 16
                                                                                            1   closure #1 in ViewRendererHost.updateViewGraph<A>(body:) + 69 (SwiftUI + 11115688) [0x7ff91078aca8] 16
                                                                                              1   partial apply for closure #1 in ViewRendererHost.sizeThatFits(_:) + 43 (SwiftUI + 11177904) [0x7ff910799fb0] 16
                                                                                                1   closure #1 in ViewRendererHost.sizeThatFits(_:) + 47 (SwiftUI + 11140259) [0x7ff910790ca3] 16
                                                                                                  1   ViewGraph.sizeThatFits(_:) + 220 (SwiftUI + 2625746) [0x7ff90ff720d2] 16
                                                                                                    1   ViewGraph.layoutComputer.getter + 102 (SwiftUI + 2650799) [0x7ff90ff782af] 16
                                                                                                      1   AGGraphGetValue + 289 (AttributeGraph + 141919) [0x7ff910bb3a5f] 16
                                                                                                        1   AG::Graph::value_ref(AG::AttributeID, AGSwiftMetadata const*, unsigned char&) + 155 (AttributeGraph + 48557) [0x7ff910b9cdad] 16
                                                                                                          1   AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421 (AttributeGraph + 23895) [0x7ff910b96d57] 16
                                                                                                            1   AG::Graph::UpdateStack::update() + 559 (AttributeGraph + 22359) [0x7ff910b96757] 16
                                                                                                              1   specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 93 (SwiftUI + 8392392) [0x7ff9104f1ec8] 16
                                                                                                                1   specialized ViewBodyAccessor.updateBody(of:changed:) + 1599 (SwiftUI + 7663978) [0x7ff91044016a] 16
                                                                                                                  1   specialized AccessibilityStaticTextModifier.body(content:) + 934 (SwiftUI + 12333972) [0x7ff9108b4394] 16
                                                                                                                    1   specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:) + 38 (SwiftUI + 756683) [0x7ff90fda9bcb] 16
                                                                                                                      1   specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:) + 207 (SwiftUI + 774322) [0x7ff90fdae0b2] 16
                                                                                                                        1   swift_allocObject + 39 (libswiftCore.dylib + 3127127) [0x7ff811f0d757] 16
                                                                                                                          1   swift_slowAlloc + 40 (libswiftCore.dylib + 3126760) [0x7ff811f0d5e8] 16
                                                                                                                            1   _malloc_zone_malloc + 125 (libsystem_malloc.dylib + 121531) [0x7ff80458aabb] 16
                                                                                                                              1   szone_malloc_should_clear + 66 (libsystem_malloc.dylib + 10194) [0x7ff80456f7d2] 16
                                                                                                                                1   tiny_malloc_should_clear + 255 (libsystem_malloc.dylib + 14509) [0x7ff8045708ad] 16
                                                                                                                                  1   tiny_malloc_from_free_list + 163 (libsystem_malloc.dylib + 16019) [0x7ff804570e93] 16
                                                                                                                                   *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 16
                                                                                                                                     *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 16
                                                                                                                                       *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 16
                                                                                                                                         *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 16
                                                                                                                                           *1   ??? (kernel + 607154) [0xffffff80002a43b2] 16
                                                                                                                                             *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 16
                                                21  __NSWindowGetDisplayCycleObserverForLayout_block_invoke + 430 (AppKit + 1091692) [0x7ff80732386c] 17-37
                                                  21  -[NSWindow(NSConstraintBasedLayout) layoutIfNeeded] + 251 (AppKit + 1092141) [0x7ff807323a2d] 17-37
                                                    21  -[NSWindow(NSConstraintBasedLayout) _layoutViewTree] + 148 (AppKit + 606493) [0x7ff8072ad11d] 17-37
                                                      21  -[NSView _layoutSubtreeIfNeededAndAllowTemporaryEngine:] + 1041 (AppKit + 607781) [0x7ff8072ad625] 17-37
                                                        21  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261] 17-37
                                                          9   -[NSView _layoutSubtreeWithOldSize:] + 361 (AppKit + 610579) [0x7ff8072ae113] 17-25
                                                            9   _NSViewLayout + 564 (AppKit + 611892) [0x7ff8072ae634] 17-25
                                                              9   @objc NSHostingView.layout() + 21 (SwiftUI + 11442362) [0x7ff9107da8ba] 17-25
                                                                9   NSHostingView.layout() + 287 (SwiftUI + 11441338) [0x7ff9107da4ba] 17-25
                                                                  1   +[NSAnimationContext runAnimationGroup:] + 33 (AppKit + 367925) [0x7ff807272d35] 17
                                                                    1   +[CATransaction setValue:forKey:] + 114 (QuartzCore + 72976) [0x7ff80b8ddd10] 17
                                                                      1   CA::Transaction::set_value(unsigned int, _CAValueType, void const*) + 130 (QuartzCore + 12638) [0x7ff80b8cf15e] 17
                                                                        1   CA::AttrList::set(unsigned int, _CAValueType, void const*) + 271 (QuartzCore + 12939) [0x7ff80b8cf28b] 17
                                                                          1   _malloc_zone_malloc + 125 (libsystem_malloc.dylib + 121531) [0x7ff80458aabb] 17
                                                                            1   szone_malloc_should_clear + 66 (libsystem_malloc.dylib + 10194) [0x7ff80456f7d2] 17
                                                                              1   tiny_malloc_should_clear + 255 (libsystem_malloc.dylib + 14509) [0x7ff8045708ad] 17
                                                                                1   tiny_malloc_from_free_list + 221 (libsystem_malloc.dylib + 16077) [0x7ff804570ecd] 17
                                                                                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 17
                                                                                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 17
                                                                                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 17
                                                                                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 17
                                                                                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 17
                                                                                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 17
                                                                  8   +[NSAnimationContext runAnimationGroup:] + 55 (AppKit + 367947) [0x7ff807272d4b] 18-25
                                                                    8   thunk for @escaping @callee_guaranteed (@guaranteed NSAnimationContext) -> () + 40 (SwiftUI + 11430772) [0x7ff9107d7b74] 18-25
                                                                      8   partial apply for thunk for @callee_guaranteed (@guaranteed NSAnimationContext) -> () + 17 (SwiftUI + 11478852) [0x7ff9107e3744] 18-25
                                                                        8   closure #1 in NSHostingView.layout() + 126 (SwiftUI + 11441542) [0x7ff9107da586] 18-25
                                                                          8   ViewRendererHost.render(interval:updateDisplayList:) + 374 (SwiftUI + 11049777) [0x7ff91077ab31] 18-25
                                                                            8   closure #1 in ViewRendererHost.render(interval:updateDisplayList:) + 2065 (SwiftUI + 11134582) [0x7ff91078f676] 18-25
                                                                              8   ViewGraph.updateOutputs() + 266 (SwiftUI + 2648280) [0x7ff90ff778d8] 18-25
                                                                                8   AG::Subgraph::update(unsigned int) + 904 (AttributeGraph + 66398) [0x7ff910ba135e] 18-25
                                                                                  8   AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421 (AttributeGraph + 23895) [0x7ff910b96d57] 18-25
                                                                                    8   AG::Graph::UpdateStack::update() + 559 (AttributeGraph + 22359) [0x7ff910b96757] 18-25
                                                                                      1   partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 15 (SwiftUI + 8439947) [0x7ff9104fd88b] 18
                                                                                        1   specialized ShapeStyleResolver.updateValue() + 2487 (SwiftUI + 7810720) [0x7ff910463ea0] 18
                                                                                          1   PropertyList.Tracker.data.getter + 73 (SwiftUI + 1771940) [0x7ff90fea19a4] 18
                                                                                            1   swift_bridgeObjectRetain + 57 (libswiftCore.dylib + 3399385) [0x7ff811f4fed9] 18
                                                                                              1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 18
                                                                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 18
                                                                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 18
                                                                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 18
                                                                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 18
                                                                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 18
                                                                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 18
                                                                                      2   partial apply for implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 26 (SwiftUI + 1282570) [0x7ff90fe2a20a] 19-20
                                                                                        1   EnvironmentalViewChild.updateValue() + 213 (SwiftUI + 2966602) [0x7ff90ffc544a] 19
                                                                                          1   swift_getTupleTypeMetadata2 + 30 (libswiftCore.dylib + 3185950) [0x7ff811f1bd1e] 19
                                                                                            1   swift_getTupleTypeMetadata + 116 (libswiftCore.dylib + 3180148) [0x7ff811f1a674] 19
                                                                                              1   std::__1::pair<(anonymous namespace)::TupleCacheEntry*, swift::MetadataResponse> swift::LockingConcurrentMap<(anonymous namespace)::TupleCacheEntry, (anonymous namespace)::TupleCacheStorage>::getOrInsert<(anonymous namespace)::TupleCacheEntry::Key, swift::MetadataRequest&, swift::TargetValueWitnessTable<swift::InProcess> const*&>((anonymous namespace)::TupleCacheEntry::Key, swift::MetadataRequest&, swift::TargetValueWitnessTable<swift::InProcess> const*&) + 286 (libswiftCore.dylib + 3180990) [0x7ff811f1a9be] 19
                                                                                                1   std::__1::pair<swift::HashMapElementWrapper<(anonymous namespace)::TupleCacheEntry>*, unsigned int> swift::ConcurrentReadableHashMap<swift::HashMapElementWrapper<(anonymous namespace)::TupleCacheEntry>, swift::StaticMutex>::find<(anonymous namespace)::TupleCacheEntry::Key>((anonymous namespace)::TupleCacheEntry::Key const&, swift::ConcurrentReadableHashMap<swift::HashMapElementWrapper<(anonymous namespace)::TupleCacheEntry>, swift::StaticMutex>::IndexStorage, unsigned long, swift::HashMapElementWrapper<(anonymous namespace)::TupleCacheEntry>*) + 427 (libswiftCore.dylib + 3249323) [0x7ff811f2b4ab] 19
                                                                                                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 19
                                                                                                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 19
                                                                                                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 19
                                                                                                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 19
                                                                                                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 19
                                                                                                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 19
                                                                                        1   ShapeStyleResolver.updateValue() + 3045 (SwiftUI + 3392564) [0x7ff91002d434] 20
                                                                                          1   PropertyList.Tracker.hasDifferentUsedValues(_:) + 32 (SwiftUI + 1766066) [0x7ff90fea02b2] 20
                                                                                            1   os_unfair_lock_lock + 10 (libsystem_platform.dylib + 5971) [0x7ff804767753] 20
                                                                                             *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 20
                                                                                               *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 20
                                                                                                 *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 20
                                                                                                   *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 20
                                                                                                     *1   ??? (kernel + 607154) [0xffffff80002a43b2] 20
                                                                                                       *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 20
                                                                                      5   partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 15 (SwiftUI + 8439947) [0x7ff9104fd88b] 21-25
                                                                                        4   specialized ShapeStyleResolver.updateValue() + 2487 (SwiftUI + 7810720) [0x7ff910463ea0] 21-24
                                                                                          3   os_unfair_lock_lock + 10 (libsystem_platform.dylib + 5971) [0x7ff804767753] 21-23
                                                                                           *3   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 21-23
                                                                                             *3   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 21-23
                                                                                               *3   ??? (kernel + 1113914) [0xffffff800031ff3a] 21-23
                                                                                                 *3   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 21-23
                                                                                                   *3   ??? (kernel + 607154) [0xffffff80002a43b2] 21-23
                                                                                                     *3   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 21-23
                                                                                          1   PropertyList.Tracker.data.getter + 73 (SwiftUI + 1771940) [0x7ff90fea19a4] 24
                                                                                            1   swift_bridgeObjectRetain + 57 (libswiftCore.dylib + 3399385) [0x7ff811f4fed9] 24
                                                                                              1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 24
                                                                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 24
                                                                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 24
                                                                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 24
                                                                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 24
                                                                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 24
                                                                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 24
                                                                                        1   specialized ShapeStyleResolver.updateValue() + 215 (SwiftUI + 7808448) [0x7ff9104635c0] 25
                                                                                         *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 25
                                                                                           *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 25
                                                                                             *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 25
                                                                                               *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 25
                                                                                                 *1   ??? (kernel + 607154) [0xffffff80002a43b2] 25
                                                                                                   *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 25
                                                          12  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261] 26-37
                                                            12  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261] 26-37
                                                              12  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261] 26-37
                                                                12  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261] 26-37
                                                                  12  -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261] 26-37
                                                                    4   -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261] 26-29
                                                                      4   -[NSView _layoutSubtreeWithOldSize:] + 361 (AppKit + 610579) [0x7ff8072ae113] 26-29
                                                                        4   _NSViewLayout + 564 (AppKit + 611892) [0x7ff8072ae634] 26-29
                                                                          4   @objc NSHostingView.layout() + 21 (SwiftUI + 11442362) [0x7ff9107da8ba] 26-29
                                                                            4   NSHostingView.layout() + 287 (SwiftUI + 11441338) [0x7ff9107da4ba] 26-29
                                                                              4   +[NSAnimationContext runAnimationGroup:] + 55 (AppKit + 367947) [0x7ff807272d4b] 26-29
                                                                                4   thunk for @escaping @callee_guaranteed (@guaranteed NSAnimationContext) -> () + 40 (SwiftUI + 11430772) [0x7ff9107d7b74] 26-29
                                                                                  4   partial apply for thunk for @callee_guaranteed (@guaranteed NSAnimationContext) -> () + 17 (SwiftUI + 11478852) [0x7ff9107e3744] 26-29
                                                                                    4   closure #1 in NSHostingView.layout() + 126 (SwiftUI + 11441542) [0x7ff9107da586] 26-29
                                                                                      4   ViewRendererHost.render(interval:updateDisplayList:) + 374 (SwiftUI + 11049777) [0x7ff91077ab31] 26-29
                                                                                        2   closure #1 in ViewRendererHost.render(interval:updateDisplayList:) + 3465 (SwiftUI + 11135982) [0x7ff91078fbee] 26-27
                                                                                          2   ViewGraph.displayList() + 85 (SwiftUI + 2650632) [0x7ff90ff78208] 26-27
                                                                                            2   AGGraphGetValue + 289 (AttributeGraph + 141919) [0x7ff910bb3a5f] 26-27
                                                                                              2   AG::Graph::value_ref(AG::AttributeID, AGSwiftMetadata const*, unsigned char&) + 155 (AttributeGraph + 48557) [0x7ff910b9cdad] 26-27
                                                                                                2   AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421 (AttributeGraph + 23895) [0x7ff910b96d57] 26-27
                                                                                                  2   AG::Graph::UpdateStack::update() + 559 (AttributeGraph + 22359) [0x7ff910b96757] 26-27
                                                                                                    1   partial apply for implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 26 (SwiftUI + 1282570) [0x7ff90fe2a20a] 26
                                                                                                      1   ShapeStyledDisplayList.updateValue() + 1911 (SwiftUI + 474942) [0x7ff90fd64f3e] 26
                                                                                                        1   swift::_getWitnessTable(swift::TargetProtocolConformanceDescriptor<swift::InProcess> const*, swift::TargetMetadata<swift::InProcess> const*, void const* const*) + 400 (libswiftCore.dylib + 3210160) [0x7ff811f21bb0] 26
                                                                                                         *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 26
                                                                                                           *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 26
                                                                                                             *1   ??? (kernel + 1106893) [0xffffff800031e3cd] 26
                                                                                                               *1   vm_fault_page + 2706 (kernel + 1124450) [0xffffff8000322862] 26
                                                                                                                 *1   vm_compressor_pager_get + 187 (kernel + 1067963) [0xffffff8000314bbb] 26
                                                                                                                   *1   vm_compressor_get + 243 (kernel + 1059779) [0xffffff8000312bc3] 26
                                                                                                                     *1   ??? (kernel + 1060476) [0xffffff8000312e7c] 26
                                                                                                                       *1   c_seg_swapin + 362 (kernel + 1054874) [0xffffff800031189a] 26
                                                                                                                         *1   vm_swap_get + 251 (kernel + 1082235) [0xffffff800031837b] 26
                                                                                                                           *1   vm_swapfile_io + 256 (kernel + 7270304) [0xffffff80008fefa0] 26
                                                                                                                             *1   vnode_pagein + 1340 (kernel + 7246124) [0xffffff80008f912c] 26
                                                                                                                               *1   apfs_pagein + 2014 (apfs + 424501) [0xffffff8003575a35] 26
                                                                                                                                 *1   cluster_pagein + 21 (kernel + 3115845) [0xffffff8000508b45] 26
                                                                                                                                   *1   cluster_pagein_ext + 286 (kernel + 3116142) [0xffffff8000508c6e] 26
                                                                                                                                     *1   ??? (kernel + 3111656) [0xffffff8000507ae8] 26
                                                                                                                                       *1   buf_biowait + 133 (kernel + 3073573) [0xffffff80004fe625] 26
                                                                                                                                         *1   ??? (kernel + 6637228) [0xffffff80008646ac] 26
                                                                                                                                           *1   lck_mtx_sleep + 110 (kernel + 518078) [0xffffff800028e7be] 26
                                                                                                                                             *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 26
                                                                                                                                               *1   ??? (kernel + 607154) [0xffffff80002a43b2] 26
                                                                                                                                                 *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 26
                                                                                                    1   partial apply for specialized implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 15 (SwiftUI + 8470124) [0x7ff910504e6c] 27
                                                                                                      1   specialized ShapeStyledDisplayList.updateValue() + 859 (SwiftUI + 7531032) [0x7ff91041fa18] 27
                                                                                                        1   specialized ShapeStyle_RenderedShape.render(style:) + 587 (SwiftUI + 3358427) [0x7ff910024edb] 27
                                                                                                          1   ShapeStyle_RenderedShape.renderKeyedText(_:size:style:) + 73 (SwiftUI + 3570126) [0x7ff9100589ce] 27
                                                                                                            1   _objc_rootAllocWithZone + 49 (libobjc.A.dylib + 50737) [0x7ff8045ec631] 27
                                                                                                              1   _malloc_zone_calloc + 60 (libsystem_malloc.dylib + 121717) [0x7ff80458ab75] 27
                                                                                                                1   szone_malloc_should_clear + 66 (libsystem_malloc.dylib + 10194) [0x7ff80456f7d2] 27
                                                                                                                  1   tiny_malloc_should_clear + 255 (libsystem_malloc.dylib + 14509) [0x7ff8045708ad] 27
                                                                                                                    1   tiny_malloc_from_free_list + 340 (libsystem_malloc.dylib + 16196) [0x7ff804570f44] 27
                                                                                                                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 27
                                                                                                                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 27
                                                                                                                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 27
                                                                                                                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 27
                                                                                                                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 27
                                                                                                                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 27
                                                                                        2   closure #1 in ViewRendererHost.render(interval:updateDisplayList:) + 6794 (SwiftUI + 11139311) [0x7ff9107908ef] 28-29
                                                                                          2   NSHostingView.renderDisplayList(_:asynchronously:time:nextTime:version:maxVersion:) + 284 (SwiftUI + 11468525) [0x7ff9107e0eed] 28-29
                                                                                            2   closure #1 in NSHostingView.renderDisplayList(_:asynchronously:time:nextTime:version:maxVersion:) + 176 (SwiftUI + 11468914) [0x7ff9107e1072] 28-29
                                                                                              2   DisplayList.ViewRenderer.render(rootView:from:time:nextTime:version:maxVersion:contentsScale:) + 110 (SwiftUI + 11389128) [0x7ff9107cd8c8] 28-29
                                                                                                2   DisplayList.ViewUpdater.render(rootView:from:time:version:maxVersion:contentsScale:) + 791 (SwiftUI + 12829198) [0x7ff91092d20e] 28-29
                                                                                                  2   closure #1 in DisplayList.ViewUpdater.render(rootView:from:time:version:maxVersion:contentsScale:) + 446 (SwiftUI + 12829707) [0x7ff91092d40b] 28-29
                                                                                                    2   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757] 28-29
                                                                                                      2   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 683 (SwiftUI + 12835327) [0x7ff91092e9ff] 28-29
                                                                                                        2   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757] 28-29
                                                                                                          1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 1404 (SwiftUI + 12836048) [0x7ff91092ecd0] 28
                                                                                                            1   DisplayList.ViewUpdater.updateItemView(container:from:localState:) + 113 (SwiftUI + 12840938) [0x7ff91092ffea] 28
                                                                                                              1   DisplayList.ViewUpdater.ViewCache.update(item:state:tag:in:makeView:updateView:) + 95 (SwiftUI + 11351337) [0x7ff9107c4529] 28
                                                                                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 28
                                                                                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 28
                                                                                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 28
                                                                                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 28
                                                                                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 28
                                                                                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 28
                                                                                                          1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 683 (SwiftUI + 12835327) [0x7ff91092e9ff] 29
                                                                                                            1   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757] 29
                                                                                                              1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 1404 (SwiftUI + 12836048) [0x7ff91092ecd0] 29
                                                                                                                1   DisplayList.ViewUpdater.updateItemView(container:from:localState:) + 113 (SwiftUI + 12840938) [0x7ff91092ffea] 29
                                                                                                                  1   objc_retain + 19 (libobjc.A.dylib + 28803) [0x7ff8045e7083] 29
                                                                                                                   *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 29
                                                                                                                     *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 29
                                                                                                                       *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 29
                                                                                                                         *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 29
                                                                                                                           *1   ??? (kernel + 607154) [0xffffff80002a43b2] 29
                                                                                                                             *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 29
                                                                    7   -[NSView _layoutSubtreeWithOldSize:] + 361 (AppKit + 610579) [0x7ff8072ae113] 30-36
                                                                      7   _NSViewLayout + 564 (AppKit + 611892) [0x7ff8072ae634] 30-36
                                                                        7   @objc NSHostingView.layout() + 21 (SwiftUI + 11442362) [0x7ff9107da8ba] 30-36
                                                                          7   NSHostingView.layout() + 287 (SwiftUI + 11441338) [0x7ff9107da4ba] 30-36
                                                                            7   +[NSAnimationContext runAnimationGroup:] + 55 (AppKit + 367947) [0x7ff807272d4b] 30-36
                                                                              7   thunk for @escaping @callee_guaranteed (@guaranteed NSAnimationContext) -> () + 40 (SwiftUI + 11430772) [0x7ff9107d7b74] 30-36
                                                                                7   partial apply for thunk for @callee_guaranteed (@guaranteed NSAnimationContext) -> () + 17 (SwiftUI + 11478852) [0x7ff9107e3744] 30-36
                                                                                  7   closure #1 in NSHostingView.layout() + 126 (SwiftUI + 11441542) [0x7ff9107da586] 30-36
                                                                                    7   ViewRendererHost.render(interval:updateDisplayList:) + 374 (SwiftUI + 11049777) [0x7ff91077ab31] 30-36
                                                                                      2   closure #1 in ViewRendererHost.render(interval:updateDisplayList:) + 3465 (SwiftUI + 11135982) [0x7ff91078fbee] 30-31
                                                                                        2   ViewGraph.displayList() + 85 (SwiftUI + 2650632) [0x7ff90ff78208] 30-31
                                                                                          2   AGGraphGetValue + 289 (AttributeGraph + 141919) [0x7ff910bb3a5f] 30-31
                                                                                            2   AG::Graph::value_ref(AG::AttributeID, AGSwiftMetadata const*, unsigned char&) + 155 (AttributeGraph + 48557) [0x7ff910b9cdad] 30-31
                                                                                              2   AG::Graph::update_attribute(AG::data::ptr<AG::Node>, unsigned int) + 421 (AttributeGraph + 23895) [0x7ff910b96d57] 30-31
                                                                                                2   AG::Graph::UpdateStack::update() + 559 (AttributeGraph + 22359) [0x7ff910b96757] 30-31
                                                                                                  1   implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 115 (SwiftUI + 93196) [0x7ff90fd07c0c] 30
                                                                                                    1   dispatch thunk of Rule.value.getter + 7 (AttributeGraph + 156407) [0x7ff910bb72f7] 30
                                                                                                      1   protocol witness for Rule.value.getter in conformance DynamicPreferenceCombiner<A> + 23 (SwiftUI + 3059862) [0x7ff90ffdc096] 30
                                                                                                        1   DynamicPreferenceCombiner.value.getter + 703 (SwiftUI + 3059180) [0x7ff90ffdbdec] 30
                                                                                                          1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 30
                                                                                                           *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 30
                                                                                                             *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 30
                                                                                                               *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 30
                                                                                                                 *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 30
                                                                                                                   *1   ??? (kernel + 607154) [0xffffff80002a43b2] 30
                                                                                                                     *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 30
                                                                                                  1   implicit closure #2 in implicit closure #1 in closure #1 in closure #1 in Attribute.init<A>(_:) + 100 (SwiftUI + 93181) [0x7ff90fd07bfd] 31
                                                                                                    1   swift::metadataimpl::ValueWitnesses<swift::metadataimpl::BridgeObjectBox>::initializeWithCopy(swift::OpaqueValue*, swift::OpaqueValue*, swift::TargetMetadata<swift::InProcess> const*) + 17 (libswiftCore.dylib + 3143217) [0x7ff811f11631] 31
                                                                                                      1   swift_bridgeObjectRetain + 57 (libswiftCore.dylib + 3399385) [0x7ff811f4fed9] 31
                                                                                                        1   swift_retain + 45 (libswiftCore.dylib + 3130589) [0x7ff811f0e4dd] 31
                                                                                                         *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 31
                                                                                                           *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 31
                                                                                                             *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 31
                                                                                                               *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 31
                                                                                                                 *1   ??? (kernel + 607154) [0xffffff80002a43b2] 31
                                                                                                                   *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 31
                                                                                      5   closure #1 in ViewRendererHost.render(interval:updateDisplayList:) + 6794 (SwiftUI + 11139311) [0x7ff9107908ef] 32-36
                                                                                        5   NSHostingView.renderDisplayList(_:asynchronously:time:nextTime:version:maxVersion:) + 284 (SwiftUI + 11468525) [0x7ff9107e0eed] 32-36
                                                                                          5   closure #1 in NSHostingView.renderDisplayList(_:asynchronously:time:nextTime:version:maxVersion:) + 176 (SwiftUI + 11468914) [0x7ff9107e1072] 32-36
                                                                                            5   DisplayList.ViewRenderer.render(rootView:from:time:nextTime:version:maxVersion:contentsScale:) + 110 (SwiftUI + 11389128) [0x7ff9107cd8c8] 32-36
                                                                                              5   DisplayList.ViewUpdater.render(rootView:from:time:version:maxVersion:contentsScale:) + 791 (SwiftUI + 12829198) [0x7ff91092d20e] 32-36
                                                                                                5   closure #1 in DisplayList.ViewUpdater.render(rootView:from:time:version:maxVersion:contentsScale:) + 446 (SwiftUI + 12829707) [0x7ff91092d40b] 32-36
                                                                                                  5   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757] 32-36
                                                                                                    5   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 683 (SwiftUI + 12835327) [0x7ff91092e9ff] 32-36
                                                                                                      5   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757] 32-36
                                                                                                        1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 683 (SwiftUI + 12835327) [0x7ff91092e9ff] 32
                                                                                                          1   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757] 32
                                                                                                            1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 1404 (SwiftUI + 12836048) [0x7ff91092ecd0] 32
                                                                                                              1   DisplayList.ViewUpdater.updateItemView(container:from:localState:) + 113 (SwiftUI + 12840938) [0x7ff91092ffea] 32
                                                                                                                1   DisplayList.ViewUpdater.ViewCache.update(item:state:tag:in:makeView:updateView:) + 139 (SwiftUI + 11351381) [0x7ff9107c4555] 32
                                                                                                                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 32
                                                                                                                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 32
                                                                                                                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 32
                                                                                                                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 32
                                                                                                                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 32
                                                                                                                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 32
                                                                                                        1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 1404 (SwiftUI + 12836048) [0x7ff91092ecd0] 33
                                                                                                          1   DisplayList.ViewUpdater.updateItemView(container:from:localState:) + 113 (SwiftUI + 12840938) [0x7ff91092ffea] 33
                                                                                                            1   DisplayList.ViewUpdater.ViewCache.update(item:state:tag:in:makeView:updateView:) + 139 (SwiftUI + 11351381) [0x7ff9107c4555] 33
                                                                                                             *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 33
                                                                                                               *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 33
                                                                                                                 *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 33
                                                                                                                   *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 33
                                                                                                                     *1   ??? (kernel + 607154) [0xffffff80002a43b2] 33
                                                                                                                       *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 33
                                                                                                        3   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 683 (SwiftUI + 12835327) [0x7ff91092e9ff] 34-36
                                                                                                          3   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757] 34-36
                                                                                                            1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 683 (SwiftUI + 12835327) [0x7ff91092e9ff] 34
                                                                                                              1   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757] 34
                                                                                                                1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 1404 (SwiftUI + 12836048) [0x7ff91092ecd0] 34
                                                                                                                  1   DisplayList.ViewUpdater.updateItemView(container:from:localState:) + 113 (SwiftUI + 12840938) [0x7ff91092ffea] 34
                                                                                                                    1   DisplayList.ViewUpdater.ViewCache.update(item:state:tag:in:makeView:updateView:) + 122 (SwiftUI + 11351364) [0x7ff9107c4544] 34
                                                                                                                      1   specialized __RawDictionaryStorage.find<A>(_:hashValue:) + 59 (SwiftUI + 9586616) [0x7ff9106157b8] 34
                                                                                                                       *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 34
                                                                                                                         *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 34
                                                                                                                           *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 34
                                                                                                                             *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 34
                                                                                                                               *1   ??? (kernel + 607154) [0xffffff80002a43b2] 34
                                                                                                                                 *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 34
                                                                                                            1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 1404 (SwiftUI + 12836048) [0x7ff91092ecd0] 35
                                                                                                              1   DisplayList.ViewUpdater.updateItemView(container:from:localState:) + 113 (SwiftUI + 12840938) [0x7ff91092ffea] 35
                                                                                                                1   DisplayList.ViewUpdater.ViewCache.update(item:state:tag:in:makeView:updateView:) + 963 (SwiftUI + 11352205) [0x7ff9107c488d] 35
                                                                                                                  1   static DisplayList.ViewUpdater.Platform.updateItemView(_:item:state:) + 5075 (SwiftUI + 2139531) [0x7ff90fefb58b] 35
                                                                                                                    1   -[CALayer setBackgroundColor:] + 48 (QuartzCore + 68648) [0x7ff80b8dcc28] 35
                                                                                                                      1   CA::Layer::setter(unsigned int, _CAValueType, void const*) + 157 (QuartzCore + 34665) [0x7ff80b8d4769] 35
                                                                                                                        1   CA::AttrList::get(unsigned int, _CAValueType, void*) const + 15 (QuartzCore + 14125) [0x7ff80b8cf72d] 35
                                                                                                                         *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 35
                                                                                                                           *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 35
                                                                                                                             *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 35
                                                                                                                               *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 35
                                                                                                                                 *1   ??? (kernel + 607154) [0xffffff80002a43b2] 35
                                                                                                                                   *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 35
                                                                                                            1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 683 (SwiftUI + 12835327) [0x7ff91092e9ff] 36
                                                                                                              1   DisplayList.ViewUpdater.update(container:from:parentState:) + 426 (SwiftUI + 12830551) [0x7ff91092d757] 36
                                                                                                                1   DisplayList.ViewUpdater.updateInheritedView(container:from:parentState:) + 1404 (SwiftUI + 12836048) [0x7ff91092ecd0] 36
                                                                                                                  1   DisplayList.ViewUpdater.updateItemView(container:from:localState:) + 113 (SwiftUI + 12840938) [0x7ff91092ffea] 36
                                                                                                                    1   DisplayList.ViewUpdater.ViewCache.update(item:state:tag:in:makeView:updateView:) + 139 (SwiftUI + 11351381) [0x7ff9107c4555] 36
                                                                                                                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 36
                                                                                                                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 36
                                                                                                                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 36
                                                                                                                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 36
                                                                                                                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 36
                                                                                                                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 36
                                                                    1   -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261] 37
                                                                      1   -[NSView _layoutSubtreeWithOldSize:] + 695 (AppKit + 610913) [0x7ff8072ae261] 37
                                                                        1   -[NSView _layoutSubtreeWithOldSize:] + 344 (AppKit + 610562) [0x7ff8072ae102] 37
                                                                          1   -[NSISEngine performPendingChangeNotifications] + 82 (CoreAutoLayout + 42719) [0x7ff80bed76df] 37
                                                                            1   -[NSISEngine optimize] + 92 (CoreAutoLayout + 61913) [0x7ff80bedc1d9] 37
                                                                              1   -[NSISEngine _optimizeWithoutRebuilding] + 161 (CoreAutoLayout + 63265) [0x7ff80bedc721] 37
                                                                                1   _minimizeConstantInObjectiveRow + 81 (CoreAutoLayout + 57294) [0x7ff80bedafce] 37
                                                                                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 37
                                                                                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 37
                                                                                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 37
                                                                                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 37
                                                                                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 37
                                                                                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 37
                                        12  CA::Transaction::commit() + 777 (QuartzCore + 10889) [0x7ff80b8cea89] 38-49
                                          12  CA::Context::commit_transaction(CA::Transaction*, double, double*) + 640 (QuartzCore + 1544070) [0x7ff80ba44f86] 38-49
                                            12  CA::Layer::display_if_needed(CA::Transaction*) + 873 (QuartzCore + 136747) [0x7ff80b8ed62b] 38-49
                                              1   -[_NSViewBackingLayer display] + 32 (AppKit + 1109315) [0x7ff807327d43] 38
                                                1   invocation function for block in cons_CALayer_kCAValueWeakPointer(unsigned int, bool) + 56 (QuartzCore + 2273519) [0x7ff80baf70ef] 38
                                                  1   CA::Layer::getter(unsigned int, _CAValueType, void*) + 85 (QuartzCore + 46247) [0x7ff80b8d74a7] 38
                                                    1   CA::AttrList::get(unsigned int, _CAValueType, void*) const + 15 (QuartzCore + 14125) [0x7ff80b8cf72d] 38
                                                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 38
                                                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 38
                                                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 38
                                                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 38
                                                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 38
                                                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 38
                                              11  -[_NSViewBackingLayer display] + 554 (AppKit + 1109837) [0x7ff807327f4d] 39-49
                                                11  -[_NSBackingLayer display] + 462 (AppKit + 1677733) [0x7ff8073b29a5] 39-49
                                                  11  -[CALayer _display] + 2379 (QuartzCore + 140981) [0x7ff80b8ee6b5] 39-49
                                                    11  invocation function for block in CA::Layer::display_() + 53 (QuartzCore + 554429) [0x7ff80b9535bd] 39-49
                                                      3   CABackingStoreUpdate_ + 594 (QuartzCore + 145035) [0x7ff80b8ef68b] 39-41
                                                        3   -[NSView(NSLayerKitGlue) drawLayer:inContext:] + 386 (AppKit + 1678288) [0x7ff8073b2bd0] 39-41
                                                          3   CGDisplayListDrawInContextDelegate + 581 (CoreGraphics + 764485) [0x7ff809b7ca45] 39-41
                                                            3   CG::DisplayList::execute(CGContextDelegate*, CGRenderingState*, CGGStack*, CGRect const*, __CFDictionary const*) + 364 (CoreGraphics + 765174) [0x7ff809b7ccf6] 39-41
                                                              3   CG::DisplayList::executeEntries(std::__1::__wrap_iter<std::__1::unique_ptr<CG::DisplayListEntry const, std::__1::default_delete<CG::DisplayListEntry const> >*>, std::__1::__wrap_iter<std::__1::unique_ptr<CG::DisplayListEntry const, std::__1::default_delete<CG::DisplayListEntry const> >*>, CGContextDelegate*, CGRenderingState*, CGGStack*, CGRect const*, __CFDictionary const*, bool) + 281 (CoreGraphics + 4725163) [0x7ff809f439ab] 39-41
                                                                3   CG::DisplayListExecutor::drawDisplayList(CG::DisplayListEntryDisplayList const*) + 535 (CoreGraphics + 3994157) [0x7ff809e9122d] 39-41
                                                                  1   CGDisplayListDelegateDrawDisplayList + 952 (CoreGraphics + 893214) [0x7ff809b9c11e] 39
                                                                    1   CGContextBeginTransparencyLayerWithRect + 85 (CoreGraphics + 592921) [0x7ff809b52c19] 39
                                                                      1   ripc_BeginLayer + 1227 (CoreGraphics + 594956) [0x7ff809b5340c] 39
                                                                        1   RIPLayerCreate + 357 (CoreGraphics + 461378) [0x7ff809b32a42] 39
                                                                          1   _malloc_zone_calloc + 60 (libsystem_malloc.dylib + 121717) [0x7ff80458ab75] 39
                                                                            1   szone_malloc_should_clear + 109 (libsystem_malloc.dylib + 10237) [0x7ff80456f7fd] 39
                                                                              1   small_malloc_should_clear + 1277 (libsystem_malloc.dylib + 11728) [0x7ff80456fdd0] 39
                                                                                1   _platform_bzero$VARIANT$Haswell + 84 (libsystem_platform.dylib + 5716) [0x7ff804767654] 39
                                                                                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 39
                                                                                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 39
                                                                                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 39
                                                                                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 39
                                                                                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 39
                                                                                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 39
                                                                  1   CGDisplayListDelegateDrawDisplayList + 1078 (CoreGraphics + 893340) [0x7ff809b9c19c] 40
                                                                    1   CGContextEndTransparencyLayer + 53 (CoreGraphics + 598478) [0x7ff809b541ce] 40
                                                                      1   ripc_EndLayer + 1431 (CoreGraphics + 600046) [0x7ff809b547ee] 40
                                                                        1   ripc_RenderImage + 227 (CoreGraphics + 287275) [0x7ff809b0822b] 40
                                                                          1   RIPLayerBltImage + 1152 (CoreGraphics + 289148) [0x7ff809b0897c] 40
                                                                            1   ripl_Mark + 22 (CoreGraphics + 289194) [0x7ff809b089aa] 40
                                                                              1   argb32_image + 3693 (CoreGraphics + 292893) [0x7ff809b0981d] 40
                                                                                1   argb32_image_mark_image + 1101 (CoreGraphics + 619739) [0x7ff809b594db] 40
                                                                                  1   argb32_image_mark_argb32 + 1752 (CoreGraphics + 621619) [0x7ff809b59c33] 40
                                                                                   *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 40
                                                                                     *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 40
                                                                                       *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 40
                                                                                         *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 40
                                                                                           *1   ??? (kernel + 607154) [0xffffff80002a43b2] 40
                                                                                             *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 40
                                                                  1   CGDisplayListDelegateDrawDisplayList + 952 (CoreGraphics + 893214) [0x7ff809b9c11e] 41
                                                                    1   CGContextBeginTransparencyLayerWithRect + 85 (CoreGraphics + 592921) [0x7ff809b52c19] 41
                                                                      1   ripc_BeginLayer + 1227 (CoreGraphics + 594956) [0x7ff809b5340c] 41
                                                                        1   RIPLayerCreate + 357 (CoreGraphics + 461378) [0x7ff809b32a42] 41
                                                                          1   _malloc_zone_calloc + 60 (libsystem_malloc.dylib + 121717) [0x7ff80458ab75] 41
                                                                            1   szone_malloc_should_clear + 109 (libsystem_malloc.dylib + 10237) [0x7ff80456f7fd] 41
                                                                              1   small_malloc_should_clear + 1277 (libsystem_malloc.dylib + 11728) [0x7ff80456fdd0] 41
                                                                                1   _platform_bzero$VARIANT$Haswell + 84 (libsystem_platform.dylib + 5716) [0x7ff804767654] 41
                                                                                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 41
                                                                                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 41
                                                                                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 41
                                                                                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 41
                                                                                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 41
                                                                                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 41
                                                      2   CABackingStoreUpdate_ + 338 (QuartzCore + 144779) [0x7ff80b8ef58b] 42-43
                                                        2   CABackingStorePrepareUpdates_(CABackingStore*, unsigned long, unsigned long, unsigned int, unsigned int, unsigned int, unsigned long long, CA::GenericContext*, UpdateState*) + 2529 (QuartzCore + 147957) [0x7ff80b8f01f5] 42-43
                                                          2   CA::Render::Shmem::new_bitmap(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int) + 452 (QuartzCore + 151106) [0x7ff80b8f0e42] 42-43
                                                           *2   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 42-43
                                                             *2   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 42-43
                                                               *2   ??? (kernel + 1113914) [0xffffff800031ff3a] 42-43
                                                                 *2   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 42-43
                                                                   *2   ??? (kernel + 607154) [0xffffff80002a43b2] 42-43
                                                                     *2   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 42-43
                                                      1   CABackingStoreUpdate_ + 858 (QuartzCore + 145299) [0x7ff80b8ef793] 44
                                                        1   CABackingStoreReleaseImages(CABackingStore*) + 33 (QuartzCore + 155099) [0x7ff80b8f1ddb] 44
                                                          1   CA::Render::Image::finalize() + 263 (QuartzCore + 243209) [0x7ff80b907609] 44
                                                            1   CA::Render::Object::~Object() + 79 (QuartzCore + 209033) [0x7ff80b8ff089] 44
                                                              1   x_hash_table_remove_ptr + 48 (QuartzCore + 130036) [0x7ff80b8ebbf4] 44
                                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 44
                                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 44
                                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 44
                                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 44
                                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 44
                                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 44
                                                      3   CABackingStoreUpdate_ + 594 (QuartzCore + 145035) [0x7ff80b8ef68b] 45-47
                                                        2   -[NSView(NSLayerKitGlue) drawLayer:inContext:] + 386 (AppKit + 1678288) [0x7ff8073b2bd0] 45-46
                                                          2   CGDisplayListDrawInContextDelegate + 581 (CoreGraphics + 764485) [0x7ff809b7ca45] 45-46
                                                            2   CG::DisplayList::execute(CGContextDelegate*, CGRenderingState*, CGGStack*, CGRect const*, __CFDictionary const*) + 364 (CoreGraphics + 765174) [0x7ff809b7ccf6] 45-46
                                                              2   CG::DisplayList::executeEntries(std::__1::__wrap_iter<std::__1::unique_ptr<CG::DisplayListEntry const, std::__1::default_delete<CG::DisplayListEntry const> >*>, std::__1::__wrap_iter<std::__1::unique_ptr<CG::DisplayListEntry const, std::__1::default_delete<CG::DisplayListEntry const> >*>, CGContextDelegate*, CGRenderingState*, CGGStack*, CGRect const*, __CFDictionary const*, bool) + 281 (CoreGraphics + 4725163) [0x7ff809f439ab] 45-46
                                                                2   CG::DisplayListExecutor::drawDisplayList(CG::DisplayListEntryDisplayList const*) + 535 (CoreGraphics + 3994157) [0x7ff809e9122d] 45-46
                                                                  1   CGDisplayListDelegateDrawDisplayList + 1078 (CoreGraphics + 893340) [0x7ff809b9c19c] 45
                                                                    1   CGContextEndTransparencyLayer + 53 (CoreGraphics + 598478) [0x7ff809b541ce] 45
                                                                      1   ripc_EndLayer + 1431 (CoreGraphics + 600046) [0x7ff809b547ee] 45
                                                                        1   ripc_RenderImage + 227 (CoreGraphics + 287275) [0x7ff809b0822b] 45
                                                                          1   RIPLayerBltImage + 1152 (CoreGraphics + 289148) [0x7ff809b0897c] 45
                                                                            1   ripl_Mark + 22 (CoreGraphics + 289194) [0x7ff809b089aa] 45
                                                                              1   argb32_image + 3693 (CoreGraphics + 292893) [0x7ff809b0981d] 45
                                                                                1   argb32_image_mark_image + 1101 (CoreGraphics + 619739) [0x7ff809b594db] 45
                                                                                  1   argb32_image_mark_argb32 + 1752 (CoreGraphics + 621619) [0x7ff809b59c33] 45
                                                                                   *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 45
                                                                                     *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 45
                                                                                       *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 45
                                                                                         *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 45
                                                                                           *1   ??? (kernel + 607154) [0xffffff80002a43b2] 45
                                                                                             *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 45
                                                                  1   CGDisplayListDelegateDrawDisplayList + 952 (CoreGraphics + 893214) [0x7ff809b9c11e] 46
                                                                    1   CGContextBeginTransparencyLayerWithRect + 85 (CoreGraphics + 592921) [0x7ff809b52c19] 46
                                                                      1   ripc_BeginLayer + 1227 (CoreGraphics + 594956) [0x7ff809b5340c] 46
                                                                        1   RIPLayerCreate + 357 (CoreGraphics + 461378) [0x7ff809b32a42] 46
                                                                          1   _malloc_zone_calloc + 60 (libsystem_malloc.dylib + 121717) [0x7ff80458ab75] 46
                                                                            1   szone_malloc_should_clear + 109 (libsystem_malloc.dylib + 10237) [0x7ff80456f7fd] 46
                                                                              1   small_malloc_should_clear + 1277 (libsystem_malloc.dylib + 11728) [0x7ff80456fdd0] 46
                                                                                1   _platform_bzero$VARIANT$Haswell + 84 (libsystem_platform.dylib + 5716) [0x7ff804767654] 46
                                                                                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 46
                                                                                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 46
                                                                                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 46
                                                                                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 46
                                                                                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 46
                                                                                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 46
                                                        1   -[NSView(NSLayerKitGlue) drawLayer:inContext:] + 100 (AppKit + 1678002) [0x7ff8073b2ab2] 47
                                                          1   CG::DisplayList::createCGDisplayList(__CFDictionary const*, CGRect const&) + 43 (CoreGraphics + 4708501) [0x7ff809f3f895] 47
                                                            1   CGTypeCreateInstance + 35 (CoreGraphics + 11654) [0x7ff809ac4d86] 47
                                                              1   _CFRuntimeCreateInstance + 587 (CoreFoundation + 15603) [0x7ff80479ecf3] 47
                                                                1   _malloc_zone_malloc + 125 (libsystem_malloc.dylib + 121531) [0x7ff80458aabb] 47
                                                                  1   szone_malloc_should_clear + 66 (libsystem_malloc.dylib + 10194) [0x7ff80456f7d2] 47
                                                                    1   tiny_malloc_should_clear + 255 (libsystem_malloc.dylib + 14509) [0x7ff8045708ad] 47
                                                                      1   tiny_malloc_from_free_list + 340 (libsystem_malloc.dylib + 16196) [0x7ff804570f44] 47
                                                                       *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 47
                                                                         *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 47
                                                                           *1   ??? (kernel + 1106893) [0xffffff800031e3cd] 47
                                                                             *1   vm_fault_page + 2706 (kernel + 1124450) [0xffffff8000322862] 47
                                                                               *1   vm_compressor_pager_get + 187 (kernel + 1067963) [0xffffff8000314bbb] 47
                                                                                 *1   vm_compressor_get + 243 (kernel + 1059779) [0xffffff8000312bc3] 47
                                                                                   *1   ??? (kernel + 1060476) [0xffffff8000312e7c] 47
                                                                                     *1   c_seg_swapin + 362 (kernel + 1054874) [0xffffff800031189a] 47
                                                                                       *1   vm_swap_get + 251 (kernel + 1082235) [0xffffff800031837b] 47
                                                                                         *1   vm_swapfile_io + 256 (kernel + 7270304) [0xffffff80008fefa0] 47
                                                                                           *1   vnode_pagein + 1340 (kernel + 7246124) [0xffffff80008f912c] 47
                                                                                             *1   apfs_pagein + 2014 (apfs + 424501) [0xffffff8003575a35] 47
                                                                                               *1   cluster_pagein + 21 (kernel + 3115845) [0xffffff8000508b45] 47
                                                                                                 *1   cluster_pagein_ext + 286 (kernel + 3116142) [0xffffff8000508c6e] 47
                                                                                                   *1   ??? (kernel + 3111656) [0xffffff8000507ae8] 47
                                                                                                     *1   buf_biowait + 133 (kernel + 3073573) [0xffffff80004fe625] 47
                                                                                                       *1   ??? (kernel + 6637228) [0xffffff80008646ac] 47
                                                                                                         *1   lck_mtx_sleep + 110 (kernel + 518078) [0xffffff800028e7be] 47
                                                                                                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 47
                                                                                                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 47
                                                                                                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 47
                                                      1   CABackingStoreUpdate_ + 338 (QuartzCore + 144779) [0x7ff80b8ef58b] 48
                                                        1   CABackingStorePrepareUpdates_(CABackingStore*, unsigned long, unsigned long, unsigned int, unsigned int, unsigned int, unsigned long long, CA::GenericContext*, UpdateState*) + 2529 (QuartzCore + 147957) [0x7ff80b8f01f5] 48
                                                          1   CA::Render::Shmem::new_bitmap(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int) + 452 (QuartzCore + 151106) [0x7ff80b8f0e42] 48
                                                           *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 48
                                                             *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 48
                                                               *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 48
                                                                 *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 48
                                                                   *1   ??? (kernel + 607154) [0xffffff80002a43b2] 48
                                                                     *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 48
                                                      1   CABackingStoreUpdate_ + 594 (QuartzCore + 145035) [0x7ff80b8ef68b] 49
                                                        1   -[NSView(NSLayerKitGlue) drawLayer:inContext:] + 386 (AppKit + 1678288) [0x7ff8073b2bd0] 49
                                                          1   CGDisplayListDrawInContextDelegate + 581 (CoreGraphics + 764485) [0x7ff809b7ca45] 49
                                                            1   CG::DisplayList::execute(CGContextDelegate*, CGRenderingState*, CGGStack*, CGRect const*, __CFDictionary const*) + 364 (CoreGraphics + 765174) [0x7ff809b7ccf6] 49
                                                              1   CG::DisplayList::executeEntries(std::__1::__wrap_iter<std::__1::unique_ptr<CG::DisplayListEntry const, std::__1::default_delete<CG::DisplayListEntry const> >*>, std::__1::__wrap_iter<std::__1::unique_ptr<CG::DisplayListEntry const, std::__1::default_delete<CG::DisplayListEntry const> >*>, CGContextDelegate*, CGRenderingState*, CGGStack*, CGRect const*, __CFDictionary const*, bool) + 221 (CoreGraphics + 4725103) [0x7ff809f4396f] 49
                                                                1   CG::DisplayListExecutor::drawGlyphs(CG::DisplayListEntryGlyphs const*) + 732 (CoreGraphics + 781194) [0x7ff809b80b8a] 49
                                                                  1   CGContextDelegateDrawGlyphs + 376 (CoreGraphics + 305122) [0x7ff809b0c7e2] 49
                                                                    1   ripc_DrawGlyphs + 1779 (CoreGraphics + 307283) [0x7ff809b0d053] 49
                                                                      1   draw_glyph_bitmaps + 1191 (CoreGraphics + 308632) [0x7ff809b0d598] 49
                                                                        1   render_glyphs + 402 (CoreGraphics + 310857) [0x7ff809b0de49] 49
                                                                          1   render_glyph_list + 444 (CoreGraphics + 345767) [0x7ff809b166a7] 49
                                                                            1   RIPLayerBltGlyph + 5571 (CoreGraphics + 351620) [0x7ff809b17d84] 49
                                                                              1   argb32_mark + 2058 (CoreGraphics + 215892) [0x7ff809af6b54] 49
                                                                                1   CGSColorMaskCopyARGB8888 + 85 (CoreGraphics + 351867) [0x7ff809b17e7b] 49
                                                                                  1   CGSColorMaskCopyARGB8888_sse + 538 (CoreGraphics + 353435) [0x7ff809b1849b] 49
                                                                                   *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 49
                                                                                     *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 49
                                                                                       *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 49
                                                                                         *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 49
                                                                                           *1   ??? (kernel + 607154) [0xffffff80002a43b2] 49
                                                                                             *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 49

  Thread 0x2cb5c    DispatchQueue "com.apple.root.user-initiated-qos.cooperative"(18)    49 samples (1-49)    priority 37 (base 37)    cpu time 0.018s (31.8M cycles, 6.5M instructions, 4.92c/i)
  <process frontmost, thread QoS user initiated (requested user initiated), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  49  <truncated backtrace> 1-49
    49  start_wqthread + 15 (libsystem_pthread.dylib + 8023) [0x7ff80474ff57] 1-49
      49  _pthread_wqthread + 256 (libsystem_pthread.dylib + 12170) [0x7ff804750f8a] 1-49
        49  _dispatch_worker_thread2 + 160 (libdispatch.dylib + 78428) [0x7ff8045ac25c] 1-49
          49  _dispatch_root_queue_drain + 309 (libdispatch.dylib + 76448) [0x7ff8045abaa0] 1-49
            49  swift_job_runImpl(swift::Job*, swift::ExecutorRef) + 69 (libswift_Concurrency.dylib + 182197) [0x7ffb1dc557b5] 1-49
              49  swift::runJobInEstablishedExecutorContext(swift::Job*) + 68 (libswift_Concurrency.dylib + 179652) [0x7ffb1dc54dc4] 1-49
                1   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 1
                  1   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 1
                    1   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 1
                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 1
                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 1
                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 1
                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 1
                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 1
                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 1
                1   LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) + 491 (LobbyDataService.swift:65 in RedLemon + 26112315) [0x107f6e13b] 2
                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 2
                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 2
                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 2
                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 2
                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 2
                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 2
                2   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 3-4
                  2   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 3-4
                    2   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 3-4
                     *2   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 3-4
                       *2   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 3-4
                         *2   ??? (kernel + 1113914) [0xffffff800031ff3a] 3-4
                           *2   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 3-4
                             *2   ??? (kernel + 607154) [0xffffff80002a43b2] 3-4
                               *2   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 3-4
                2   LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) + 491 (LobbyDataService.swift:65 in RedLemon + 26112315) [0x107f6e13b] 5-6
                 *2   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 5-6
                   *2   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 5-6
                     *2   ??? (kernel + 1113914) [0xffffff800031ff3a] 5-6
                       *2   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 5-6
                         *2   ??? (kernel + 607154) [0xffffff80002a43b2] 5-6
                           *2   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 5-6
                1   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 7
                  1   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 7
                    1   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 7
                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 7
                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 7
                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 7
                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 7
                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 7
                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 7
                1   LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) + 491 (LobbyDataService.swift:65 in RedLemon + 26112315) [0x107f6e13b] 8
                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 8
                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 8
                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 8
                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 8
                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 8
                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 8
                1   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 9
                  1   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 9
                    1   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 9
                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 9
                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 9
                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 9
                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 9
                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 9
                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 9
                1   LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) + 491 (LobbyDataService.swift:65 in RedLemon + 26112315) [0x107f6e13b] 10
                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 10
                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 10
                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 10
                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 10
                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 10
                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 10
                5   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 11-15
                  5   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 11-15
                    5   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 11-15
                     *5   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 11-15
                       *5   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 11-15
                         *5   ??? (kernel + 1113914) [0xffffff800031ff3a] 11-15
                           *5   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 11-15
                             *5   ??? (kernel + 607154) [0xffffff80002a43b2] 11-15
                               *5   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 11-15
                2   LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) + 491 (LobbyDataService.swift:65 in RedLemon + 26112315) [0x107f6e13b] 16-17
                 *2   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 16-17
                   *2   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 16-17
                     *2   ??? (kernel + 1113914) [0xffffff800031ff3a] 16-17
                       *2   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 16-17
                         *2   ??? (kernel + 607154) [0xffffff80002a43b2] 16-17
                           *2   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 16-17
                3   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 18-20
                  3   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 18-20
                    3   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 18-20
                     *3   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 18-20
                       *3   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 18-20
                         *3   ??? (kernel + 1113914) [0xffffff800031ff3a] 18-20
                           *3   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 18-20
                             *3   ??? (kernel + 607154) [0xffffff80002a43b2] 18-20
                               *3   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 18-20
                1   LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) + 491 (LobbyDataService.swift:65 in RedLemon + 26112315) [0x107f6e13b] 21
                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 21
                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 21
                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 21
                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 21
                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 21
                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 21
                6   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 22-27
                  6   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 22-27
                    6   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 22-27
                     *6   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 22-27
                       *6   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 22-27
                         *6   ??? (kernel + 1113914) [0xffffff800031ff3a] 22-27
                           *6   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 22-27
                             *6   ??? (kernel + 607154) [0xffffff80002a43b2] 22-27
                               *6   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 22-27
                1   LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) + 491 (LobbyDataService.swift:65 in RedLemon + 26112315) [0x107f6e13b] 28
                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 28
                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 28
                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 28
                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 28
                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 28
                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 28
                1   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 29
                  1   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 29
                    1   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 29
                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 29
                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 29
                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 29
                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 29
                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 29
                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 29
                1   LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) + 491 (LobbyDataService.swift:65 in RedLemon + 26112315) [0x107f6e13b] 30
                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 30
                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 30
                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 30
                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 30
                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 30
                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 30
                2   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 31-32
                  2   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 31-32
                    2   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 31-32
                     *2   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 31-32
                       *2   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 31-32
                         *2   ??? (kernel + 1113914) [0xffffff800031ff3a] 31-32
                           *2   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 31-32
                             *2   ??? (kernel + 607154) [0xffffff80002a43b2] 31-32
                               *2   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 31-32
                4   LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) + 491 (LobbyDataService.swift:65 in RedLemon + 26112315) [0x107f6e13b] 33-36
                 *4   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 33-36
                   *4   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 33-36
                     *4   ??? (kernel + 1113914) [0xffffff800031ff3a] 33-36
                       *4   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 33-36
                         *4   ??? (kernel + 607154) [0xffffff80002a43b2] 33-36
                           *4   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 33-36
                8   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 37-44
                  8   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 37-44
                    8   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 37-44
                     *8   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 37-44
                       *8   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 37-44
                         *8   ??? (kernel + 1113914) [0xffffff800031ff3a] 37-44
                           *8   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 37-44
                             *8   ??? (kernel + 607154) [0xffffff80002a43b2] 37-44
                               *8   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 37-44
                4   LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) + 491 (LobbyDataService.swift:65 in RedLemon + 26112315) [0x107f6e13b] 45-48
                 *4   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 45-48
                   *4   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 45-48
                     *4   ??? (kernel + 1113914) [0xffffff800031ff3a] 45-48
                       *4   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 45-48
                         *4   ??? (kernel + 607154) [0xffffff80002a43b2] 45-48
                           *4   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 45-48
                1   protocol witness for LobbyDataService.createRoom(id:name:hostUserId:hostUsername:streamHash:imdbId:posterUrl:backdropUrl:season:episode:isPublic:unlockedStreamUrl:description:playlist:) in conformance SupabaseClient + 313 (<compiler-generated> in RedLemon + 26116569) [0x107f6f1d9] 49
                  1   swift_task_alloc + 65 (libswift_Concurrency.dylib + 198433) [0x7ffb1dc59721] 49
                    1   swift::StackAllocator<1000ul, &(swift::TaskAllocatorSlabMetadata)>::getSlabForAllocation(unsigned long) + 250 (libswift_Concurrency.dylib + 199738) [0x7ffb1dc59c3a] 49
                     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 49
                       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 49
                         *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 49
                           *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 49
                             *1   ??? (kernel + 607154) [0xffffff80002a43b2] 49
                               *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 49

  Thread 0x2cad3    Thread name "com.apple.NSEventThread"    49 samples (1-49)    priority 47 (base 47)    cpu time 0.017s (36.3M cycles, 10.3M instructions, 3.52c/i)
  <process frontmost, thread QoS user interactive (requested user interactive), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  49  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 1-49
    49  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 1-49
      49  _NSEventThread + 132 (AppKit + 1754482) [0x7ff8073c5572] 1-49
        49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c] 1-49
          7   __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 1-7
            7   __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 1-7
              7   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 1-7
               *7   ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 1-7
          2   __CFRunLoopRun + 2415 (CoreFoundation + 519579) [0x7ff804819d9b] 8-9
            2   __CFRunLoopDoSource1 + 619 (CoreFoundation + 526132) [0x7ff80481b734] 8-9
              2   __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 41 (CoreFoundation + 526420) [0x7ff80481b854] 8-9
                2   __CFMachPortPerform + 250 (CoreFoundation + 709808) [0x7ff8048484b0] 8-9
                  2   MessageHandler(__CFMachPort*, void*, long, void*) + 48 (HIToolbox + 241621) [0x7ff80d4d7fd5] 8-9
                    2   PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*) + 268 (HIToolbox + 241944) [0x7ff80d4d8118] 8-9
                      2   SLEventCreateNextEvent + 9 (SkyLight + 1163885) [0x7ff80983f26d] 8-9
                        2   SLSGetNextEventRecordInternal + 258 (SkyLight + 2952946) [0x7ff8099f3ef2] 8-9
                          2   CGSSnarfAndDispatchDatagrams + 152 (SkyLight + 40276) [0x7ff80972cd54] 8-9
                            2   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 8-9
                             *2   call_continuation + 46 (kernel + 37278) [0xffffff800021919e] 8-9
                               *2   ipc_mqueue_receive_continue + 128 (kernel + 301712) [0xffffff8000259a90] 8-9
                                 *2   mach_msg_receive_results + 699 (kernel + 370859) [0xffffff800026a8ab] 8-9
                                   *2   ipc_kmsg_copyout + 1928 (kernel + 293048) [0xffffff80002578b8] 8-9
                                     *2   ??? (kernel + 294144) [0xffffff8000257d00] 8-9
                                       *2   ??? (kernel + 1183282) [0xffffff8000330e32] 8-9
                                         *2   _bcopy + 11 (kernel + 36331) [0xffffff8000218deb] 8-9
                                           *2   ??? (kernel + 39568) [0xffffff8000219a90] 8-9
                                             *2   kernel_trap + 622 (kernel + 1818158) [0xffffff80003cbe2e] 8-9
                                               *2   ??? (kernel + 1113914) [0xffffff800031ff3a] 8-9
                                                 *2   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 8-9
                                                   *2   ??? (kernel + 607154) [0xffffff80002a43b2] 8-9
                                                     *2   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 8-9
          2   __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 10-11
            2   __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 10-11
              2   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 10-11
               *2   ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 10-11
          2   __CFRunLoopRun + 2415 (CoreFoundation + 519579) [0x7ff804819d9b] 12-13
            2   __CFRunLoopDoSource1 + 619 (CoreFoundation + 526132) [0x7ff80481b734] 12-13
              2   __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 41 (CoreFoundation + 526420) [0x7ff80481b854] 12-13
                2   __CFMachPortPerform + 250 (CoreFoundation + 709808) [0x7ff8048484b0] 12-13
                  2   MessageHandler(__CFMachPort*, void*, long, void*) + 48 (HIToolbox + 241621) [0x7ff80d4d7fd5] 12-13
                    2   PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*) + 268 (HIToolbox + 241944) [0x7ff80d4d8118] 12-13
                      2   SLEventCreateNextEvent + 9 (SkyLight + 1163885) [0x7ff80983f26d] 12-13
                        2   SLSGetNextEventRecordInternal + 258 (SkyLight + 2952946) [0x7ff8099f3ef2] 12-13
                          2   CGSSnarfAndDispatchDatagrams + 152 (SkyLight + 40276) [0x7ff80972cd54] 12-13
                            2   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 12-13
                             *1   ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] (blocked by turnstile waiting for WindowServer [157] after 2 hops) 12
                             *1   call_continuation + 46 (kernel + 37278) [0xffffff800021919e] 13
                               *1   ipc_mqueue_receive_continue + 128 (kernel + 301712) [0xffffff8000259a90] 13
                                 *1   mach_msg_receive_results + 699 (kernel + 370859) [0xffffff800026a8ab] 13
                                   *1   ipc_kmsg_copyout + 1928 (kernel + 293048) [0xffffff80002578b8] 13
                                     *1   ??? (kernel + 294144) [0xffffff8000257d00] 13
                                       *1   ??? (kernel + 1183282) [0xffffff8000330e32] 13
                                         *1   _bcopy + 11 (kernel + 36331) [0xffffff8000218deb] 13
                                           *1   ??? (kernel + 39568) [0xffffff8000219a90] 13
                                             *1   kernel_trap + 622 (kernel + 1818158) [0xffffff80003cbe2e] 13
                                               *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 13
                                                 *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 13
                                                   *1   ??? (kernel + 607154) [0xffffff80002a43b2] 13
                                                     *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 13
          1   __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 14
            1   __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 14
              1   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 14
               *1   ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 14
          3   __CFRunLoopRun + 2415 (CoreFoundation + 519579) [0x7ff804819d9b] 15-17
            3   __CFRunLoopDoSource1 + 619 (CoreFoundation + 526132) [0x7ff80481b734] 15-17
              3   __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 41 (CoreFoundation + 526420) [0x7ff80481b854] 15-17
                3   __CFMachPortPerform + 250 (CoreFoundation + 709808) [0x7ff8048484b0] 15-17
                  3   MessageHandler(__CFMachPort*, void*, long, void*) + 48 (HIToolbox + 241621) [0x7ff80d4d7fd5] 15-17
                    1   PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*) + 268 (HIToolbox + 241944) [0x7ff80d4d8118] 15
                      1   SLEventCreateNextEvent + 9 (SkyLight + 1163885) [0x7ff80983f26d] 15
                        1   SLSGetNextEventRecordInternal + 297 (SkyLight + 2952985) [0x7ff8099f3f19] 15
                          1   CGSEventLogEvent + 359 (SkyLight + 1222283) [0x7ff80984d68b] 15
                            1   (anonymous namespace)::MouseEventLog::getLogString() const + 156 (SkyLight + 1229602) [0x7ff80984f322] 15
                              1   std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >::basic_string<std::nullptr_t>(char const*) + 76 (SkyLight + 167580) [0x7ff80974be9c] 15
                                1   operator new(unsigned long) + 26 (libc++abi.dylib + 72026) [0x7ff80471195a] 15
                                  1   _malloc_zone_malloc + 125 (libsystem_malloc.dylib + 121531) [0x7ff80458aabb] 15
                                    1   szone_malloc_should_clear + 66 (libsystem_malloc.dylib + 10194) [0x7ff80456f7d2] 15
                                      1   tiny_malloc_should_clear + 255 (libsystem_malloc.dylib + 14509) [0x7ff8045708ad] 15
                                        1   tiny_malloc_from_free_list + 340 (libsystem_malloc.dylib + 16196) [0x7ff804570f44] 15
                                         *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 15
                                           *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 15
                                             *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 15
                                               *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 15
                                                 *1   ??? (kernel + 607154) [0xffffff80002a43b2] 15
                                                   *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 15
                    2   PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*) + 45 (HIToolbox + 241721) [0x7ff80d4d8039] 16-17
                      2   SLEventCreateNextEvent + 9 (SkyLight + 1163885) [0x7ff80983f26d] 16-17
                        2   SLSGetNextEventRecordInternal + 258 (SkyLight + 2952946) [0x7ff8099f3ef2] 16-17
                          2   CGSSnarfAndDispatchDatagrams + 152 (SkyLight + 40276) [0x7ff80972cd54] 16-17
                            2   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 16-17
                             *2   call_continuation + 46 (kernel + 37278) [0xffffff800021919e] 16-17
                               *2   ipc_mqueue_receive_continue + 128 (kernel + 301712) [0xffffff8000259a90] 16-17
                                 *2   mach_msg_receive_results + 699 (kernel + 370859) [0xffffff800026a8ab] 16-17
                                   *2   ipc_kmsg_copyout + 1928 (kernel + 293048) [0xffffff80002578b8] 16-17
                                     *2   ??? (kernel + 294144) [0xffffff8000257d00] 16-17
                                       *2   ??? (kernel + 1183282) [0xffffff8000330e32] 16-17
                                         *2   _bcopy + 11 (kernel + 36331) [0xffffff8000218deb] 16-17
                                           *2   ??? (kernel + 39568) [0xffffff8000219a90] 16-17
                                             *2   kernel_trap + 622 (kernel + 1818158) [0xffffff80003cbe2e] 16-17
                                               *2   ??? (kernel + 1113914) [0xffffff800031ff3a] 16-17
                                                 *2   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 16-17
                                                   *2   ??? (kernel + 607154) [0xffffff80002a43b2] 16-17
                                                     *2   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 16-17
          19  __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 18-36
            19  __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 18-36
              19  mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 18-36
               *19  ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 18-36
          1   __CFRunLoopRun + 2415 (CoreFoundation + 519579) [0x7ff804819d9b] 37
            1   __CFRunLoopDoSource1 + 619 (CoreFoundation + 526132) [0x7ff80481b734] 37
              1   __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 41 (CoreFoundation + 526420) [0x7ff80481b854] 37
                1   __CFMachPortPerform + 250 (CoreFoundation + 709808) [0x7ff8048484b0] 37
                  1   MessageHandler(__CFMachPort*, void*, long, void*) + 48 (HIToolbox + 241621) [0x7ff80d4d7fd5] 37
                    1   PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*) + 268 (HIToolbox + 241944) [0x7ff80d4d8118] 37
                      1   SLEventCreateNextEvent + 9 (SkyLight + 1163885) [0x7ff80983f26d] 37
                        1   SLSGetNextEventRecordInternal + 258 (SkyLight + 2952946) [0x7ff8099f3ef2] 37
                          1   CGSSnarfAndDispatchDatagrams + 152 (SkyLight + 40276) [0x7ff80972cd54] 37
                            1   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 37
                             *1   call_continuation + 46 (kernel + 37278) [0xffffff800021919e] 37
                               *1   ipc_mqueue_receive_continue + 128 (kernel + 301712) [0xffffff8000259a90] 37
                                 *1   mach_msg_receive_results + 699 (kernel + 370859) [0xffffff800026a8ab] 37
                                   *1   ipc_kmsg_copyout + 1928 (kernel + 293048) [0xffffff80002578b8] 37
                                     *1   ??? (kernel + 294144) [0xffffff8000257d00] 37
                                       *1   ??? (kernel + 1183282) [0xffffff8000330e32] 37
                                         *1   _bcopy + 11 (kernel + 36331) [0xffffff8000218deb] 37
                                           *1   ??? (kernel + 39568) [0xffffff8000219a90] 37
                                             *1   kernel_trap + 622 (kernel + 1818158) [0xffffff80003cbe2e] 37
                                               *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 37
                                                 *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 37
                                                   *1   ??? (kernel + 607154) [0xffffff80002a43b2] 37
                                                     *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 37
          3   __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 38-40
            3   __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 38-40
              3   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 38-40
               *3   ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 38-40
          1   __CFRunLoopRun + 2415 (CoreFoundation + 519579) [0x7ff804819d9b] 41
            1   __CFRunLoopDoSource1 + 619 (CoreFoundation + 526132) [0x7ff80481b734] 41
              1   __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 41 (CoreFoundation + 526420) [0x7ff80481b854] 41
                1   __CFMachPortPerform + 250 (CoreFoundation + 709808) [0x7ff8048484b0] 41
                  1   MessageHandler(__CFMachPort*, void*, long, void*) + 48 (HIToolbox + 241621) [0x7ff80d4d7fd5] 41
                    1   PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*) + 268 (HIToolbox + 241944) [0x7ff80d4d8118] 41
                      1   SLEventCreateNextEvent + 9 (SkyLight + 1163885) [0x7ff80983f26d] 41
                        1   SLSGetNextEventRecordInternal + 258 (SkyLight + 2952946) [0x7ff8099f3ef2] 41
                          1   CGSSnarfAndDispatchDatagrams + 152 (SkyLight + 40276) [0x7ff80972cd54] 41
                            1   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 41
                             *1   call_continuation + 46 (kernel + 37278) [0xffffff800021919e] 41
                               *1   ipc_mqueue_receive_continue + 128 (kernel + 301712) [0xffffff8000259a90] 41
                                 *1   mach_msg_receive_results + 699 (kernel + 370859) [0xffffff800026a8ab] 41
                                   *1   ipc_kmsg_copyout + 1928 (kernel + 293048) [0xffffff80002578b8] 41
                                     *1   ??? (kernel + 294144) [0xffffff8000257d00] 41
                                       *1   ??? (kernel + 1183282) [0xffffff8000330e32] 41
                                         *1   _bcopy + 11 (kernel + 36331) [0xffffff8000218deb] 41
                                           *1   ??? (kernel + 39568) [0xffffff8000219a90] 41
                                             *1   kernel_trap + 622 (kernel + 1818158) [0xffffff80003cbe2e] 41
                                               *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 41
                                                 *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 41
                                                   *1   ??? (kernel + 607154) [0xffffff80002a43b2] 41
                                                     *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 41
          2   __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 42-43
            2   __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 42-43
              2   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 42-43
               *2   ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 42-43
          1   __CFRunLoopRun + 2415 (CoreFoundation + 519579) [0x7ff804819d9b] 44
            1   __CFRunLoopDoSource1 + 619 (CoreFoundation + 526132) [0x7ff80481b734] 44
              1   __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 41 (CoreFoundation + 526420) [0x7ff80481b854] 44
                1   __CFMachPortPerform + 250 (CoreFoundation + 709808) [0x7ff8048484b0] 44
                  1   MessageHandler(__CFMachPort*, void*, long, void*) + 48 (HIToolbox + 241621) [0x7ff80d4d7fd5] 44
                    1   PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*) + 268 (HIToolbox + 241944) [0x7ff80d4d8118] 44
                      1   SLEventCreateNextEvent + 9 (SkyLight + 1163885) [0x7ff80983f26d] 44
                        1   SLSGetNextEventRecordInternal + 258 (SkyLight + 2952946) [0x7ff8099f3ef2] 44
                          1   CGSSnarfAndDispatchDatagrams + 152 (SkyLight + 40276) [0x7ff80972cd54] 44
                            1   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 44
                             *1   call_continuation + 46 (kernel + 37278) [0xffffff800021919e] 44
                               *1   ipc_mqueue_receive_continue + 128 (kernel + 301712) [0xffffff8000259a90] 44
                                 *1   mach_msg_receive_results + 699 (kernel + 370859) [0xffffff800026a8ab] 44
                                   *1   ipc_kmsg_copyout + 1928 (kernel + 293048) [0xffffff80002578b8] 44
                                     *1   ??? (kernel + 294144) [0xffffff8000257d00] 44
                                       *1   ??? (kernel + 1183282) [0xffffff8000330e32] 44
                                         *1   _bcopy + 11 (kernel + 36331) [0xffffff8000218deb] 44
                                           *1   ??? (kernel + 39568) [0xffffff8000219a90] 44
                                             *1   kernel_trap + 622 (kernel + 1818158) [0xffffff80003cbe2e] 44
                                               *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 44
                                                 *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 44
                                                   *1   ??? (kernel + 607154) [0xffffff80002a43b2] 44
                                                     *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 44
          2   __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 45-46
            2   __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 45-46
              2   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 45-46
               *2   ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 45-46
          2   __CFRunLoopRun + 2415 (CoreFoundation + 519579) [0x7ff804819d9b] 47-48
            2   __CFRunLoopDoSource1 + 619 (CoreFoundation + 526132) [0x7ff80481b734] 47-48
              2   __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 41 (CoreFoundation + 526420) [0x7ff80481b854] 47-48
                2   __CFMachPortPerform + 250 (CoreFoundation + 709808) [0x7ff8048484b0] 47-48
                  2   MessageHandler(__CFMachPort*, void*, long, void*) + 48 (HIToolbox + 241621) [0x7ff80d4d7fd5] 47-48
                    2   PullEventsFromWindowServerOnConnection(unsigned int, unsigned char, __CFMachPortBoost*) + 268 (HIToolbox + 241944) [0x7ff80d4d8118] 47-48
                      2   SLEventCreateNextEvent + 9 (SkyLight + 1163885) [0x7ff80983f26d] 47-48
                        2   SLSGetNextEventRecordInternal + 258 (SkyLight + 2952946) [0x7ff8099f3ef2] 47-48
                          2   CGSSnarfAndDispatchDatagrams + 152 (SkyLight + 40276) [0x7ff80972cd54] 47-48
                            2   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 47-48
                             *2   call_continuation + 46 (kernel + 37278) [0xffffff800021919e] 47-48
                               *2   ipc_mqueue_receive_continue + 128 (kernel + 301712) [0xffffff8000259a90] 47-48
                                 *2   mach_msg_receive_results + 699 (kernel + 370859) [0xffffff800026a8ab] 47-48
                                   *2   ipc_kmsg_copyout + 1928 (kernel + 293048) [0xffffff80002578b8] 47-48
                                     *2   ??? (kernel + 294144) [0xffffff8000257d00] 47-48
                                       *2   ??? (kernel + 1183282) [0xffffff8000330e32] 47-48
                                         *2   _bcopy + 11 (kernel + 36331) [0xffffff8000218deb] 47-48
                                           *2   ??? (kernel + 39568) [0xffffff8000219a90] 47-48
                                             *2   kernel_trap + 622 (kernel + 1818158) [0xffffff80003cbe2e] 47-48
                                               *2   ??? (kernel + 1113914) [0xffffff800031ff3a] 47-48
                                                 *2   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 47-48
                                                   *2   ??? (kernel + 607154) [0xffffff80002a43b2] 47-48
                                                     *2   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 47-48
          1   __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 49
            1   __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 49
              1   mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 49
               *1   ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 49

  Thread 0x2caea    Thread name "com.apple.NSURLConnectionLoader"    49 samples (1-49)    priority 31 (base 31)
  <process frontmost, thread QoS default (requested default), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  49  <truncated backtrace> 1-49
    49  mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 1-49
     *49  ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 1-49

  Thread 0x2caf9    Thread name "NIO-SGLTN-0-#0"    49 samples (1-49)    priority 31 (base 31)    cpu time 0.004s (6.5M cycles, 3.0M instructions, 2.14c/i)
  <process frontmost, thread QoS default (requested default), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  20  <truncated backtrace> 1-20
    19  kevent + 10 (libsystem_kernel.dylib + 25358) [0x7ff80471c30e] 1-19
     *19  ??? (kernel + 6418176) [0xffffff800082ef00] 1-19
    1   kevent + 20 (libsystem_kernel.dylib + 25368) [0x7ff80471c318] 20
     *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 20
       *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 20
         *1   ??? (kernel + 1105088) [0xffffff800031dcc0] 20
           *1   vm_compressor_pager_get + 187 (kernel + 1067963) [0xffffff8000314bbb] 20
             *1   vm_compressor_get + 243 (kernel + 1059779) [0xffffff8000312bc3] 20
               *1   ??? (kernel + 1060985) [0xffffff8000313079] 20
                 *1   WKdm_decompress_new + 583 (kernel + 4935) [0xffffff8000101347] (running) 20
  29  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 21-49
    29  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 21-49
      29  @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9 (<compiler-generated> in RedLemon + 15293033) [0x10751ca69] 21-49
        29  closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116,13 in RedLemon + 15292847) [0x10751c9af] 21-49
          29  thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15 (<compiler-generated> in RedLemon + 15281727) [0x107519e3f] 21-49
            29  partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51 (<compiler-generated> in RedLemon + 14692211) [0x107489f73] 21-49
              29  closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111,41 in RedLemon + 14666906) [0x107483c9a] 21-49
                29  static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93,22 in RedLemon + 14665032) [0x107483548] 21-49
                  29  SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652,17 in RedLemon + 15050799) [0x1074e182f] 21-49
                    29  withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26,16 in RedLemon + 15021833) [0x1074da709] 21-49
                      29  autoreleasepool<A>(invoking:) + 44 (libswiftObjectiveC.dylib + 3708) [0x7ff81971ce7c] 21-49
                        29  partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28 (<compiler-generated> in RedLemon + 15021996) [0x1074da7ac] 21-49
                          29  closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27,13 in RedLemon + 15021922) [0x1074da762] 21-49
                            29  partial apply for closure #2 in SelectableEventLoop.run() + 20 (<compiler-generated> in RedLemon + 15068116) [0x1074e5bd4] 21-49
                              29  closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653,36 in RedLemon + 15054766) [0x1074e27ae] 21-49
                                29  Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288,18 in RedLemon + 15101684) [0x1074edef4] 21-49
                                  29  Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211,34 in RedLemon + 15128013) [0x1074f45cd] 21-49
                                    29  Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31,24 in RedLemon + 15076579) [0x1074e7ce3] 21-49
                                      29  partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15 (<compiler-generated> in RedLemon + 15138335) [0x1074f6e1f] 21-49
                                        29  closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212,28 in RedLemon + 15134134) [0x1074f5db6] 21-49
                                          29  static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910,20 in RedLemon + 15278824) [0x1075192e8] 21-49
                                            29  syscall<A>(blocking:where:_:) + 395 (System.swift:247,23 in RedLemon + 15241595) [0x10751017b] 21-49
                                              29  partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36 (<compiler-generated> in RedLemon + 15280708) [0x107519a44] 21-49
                                                29  closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911,13 in RedLemon + 15279087) [0x1075193ef] 21-49
                                                  29  kevent + 10 (libsystem_kernel.dylib + 25358) [0x7ff80471c30e] 21-49
                                                   *29  ??? (kernel + 6418176) [0xffffff800082ef00] 21-49

  Thread 0x2cafa    Thread name "NIO-SGLTN-0-#1"    49 samples (1-49)    priority 31 (base 31)    cpu time 0.002s (3.5M cycles, 1248.1K instructions, 2.79c/i)
  <process frontmost, thread QoS default (requested default), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  49  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 1-49
    49  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 1-49
      49  @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9 (<compiler-generated> in RedLemon + 15293033) [0x10751ca69] 1-49
        49  closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116,13 in RedLemon + 15292847) [0x10751c9af] 1-49
          49  thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15 (<compiler-generated> in RedLemon + 15281727) [0x107519e3f] 1-49
            49  partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51 (<compiler-generated> in RedLemon + 14692211) [0x107489f73] 1-49
              49  closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111,41 in RedLemon + 14666906) [0x107483c9a] 1-49
                49  static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93,22 in RedLemon + 14665032) [0x107483548] 1-49
                  49  SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652,17 in RedLemon + 15050799) [0x1074e182f] 1-49
                    49  withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26,16 in RedLemon + 15021833) [0x1074da709] 1-49
                      49  autoreleasepool<A>(invoking:) + 44 (libswiftObjectiveC.dylib + 3708) [0x7ff81971ce7c] 1-49
                        49  partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28 (<compiler-generated> in RedLemon + 15021996) [0x1074da7ac] 1-49
                          49  closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27,13 in RedLemon + 15021922) [0x1074da762] 1-49
                            49  partial apply for closure #2 in SelectableEventLoop.run() + 20 (<compiler-generated> in RedLemon + 15068116) [0x1074e5bd4] 1-49
                              49  closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653,36 in RedLemon + 15054766) [0x1074e27ae] 1-49
                                49  Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288,18 in RedLemon + 15101684) [0x1074edef4] 1-49
                                  49  Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211,34 in RedLemon + 15128013) [0x1074f45cd] 1-49
                                    49  Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27,24 in RedLemon + 15076458) [0x1074e7c6a] 1-49
                                      49  withUnsafePointer<A, B>(to:_:) + 12 (libswiftCore.dylib + 1161004) [0x7ff811d2d72c] 1-49
                                        49  partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39 (<compiler-generated> in RedLemon + 15076855) [0x1074e7df7] 1-49
                                          49  closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28,21 in RedLemon + 15076770) [0x1074e7da2] 1-49
                                            49  partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15 (<compiler-generated> in RedLemon + 15138335) [0x1074f6e1f] 1-49
                                              49  closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212,28 in RedLemon + 15134134) [0x1074f5db6] 1-49
                                                49  static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910,20 in RedLemon + 15278824) [0x1075192e8] 1-49
                                                  49  syscall<A>(blocking:where:_:) + 395 (System.swift:247,23 in RedLemon + 15241595) [0x10751017b] 1-49
                                                    49  partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36 (<compiler-generated> in RedLemon + 15280708) [0x107519a44] 1-49
                                                      49  closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911,13 in RedLemon + 15279087) [0x1075193ef] 1-49
                                                        49  kevent + 10 (libsystem_kernel.dylib + 25358) [0x7ff80471c30e] 1-49
                                                         *49  ??? (kernel + 6418176) [0xffffff800082ef00] 1-49

  Thread 0x2cafb    Thread name "NIO-SGLTN-0-#2"    49 samples (1-49)    priority 31 (base 31)    cpu time <0.001s (1163.1K cycles, 602.7K instructions, 1.93c/i)
  <process frontmost, thread QoS default (requested default), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  25  <truncated backtrace> 1-25
    25  kevent + 10 (libsystem_kernel.dylib + 25358) [0x7ff80471c30e] 1-25
     *25  ??? (kernel + 6418176) [0xffffff800082ef00] 1-25
  24  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 26-49
    24  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 26-49
      24  @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9 (<compiler-generated> in RedLemon + 15293033) [0x10751ca69] 26-49
        24  closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116,13 in RedLemon + 15292847) [0x10751c9af] 26-49
          24  thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15 (<compiler-generated> in RedLemon + 15281727) [0x107519e3f] 26-49
            24  partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51 (<compiler-generated> in RedLemon + 14692211) [0x107489f73] 26-49
              24  closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111,41 in RedLemon + 14666906) [0x107483c9a] 26-49
                24  static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93,22 in RedLemon + 14665032) [0x107483548] 26-49
                  24  SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652,17 in RedLemon + 15050799) [0x1074e182f] 26-49
                    24  withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26,16 in RedLemon + 15021833) [0x1074da709] 26-49
                      24  autoreleasepool<A>(invoking:) + 44 (libswiftObjectiveC.dylib + 3708) [0x7ff81971ce7c] 26-49
                        24  partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28 (<compiler-generated> in RedLemon + 15021996) [0x1074da7ac] 26-49
                          24  closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27,13 in RedLemon + 15021922) [0x1074da762] 26-49
                            24  partial apply for closure #2 in SelectableEventLoop.run() + 20 (<compiler-generated> in RedLemon + 15068116) [0x1074e5bd4] 26-49
                              24  closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653,36 in RedLemon + 15054766) [0x1074e27ae] 26-49
                                24  Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288,18 in RedLemon + 15101684) [0x1074edef4] 26-49
                                  24  Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211,34 in RedLemon + 15128013) [0x1074f45cd] 26-49
                                    24  Optional.withUnsafeOptionalPointer<A>(_:) + 467 (SelectorGeneric.swift:31,24 in RedLemon + 15076579) [0x1074e7ce3] 26-49
                                      24  partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15 (<compiler-generated> in RedLemon + 15138335) [0x1074f6e1f] 26-49
                                        24  closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212,28 in RedLemon + 15134134) [0x1074f5db6] 26-49
                                          24  static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910,20 in RedLemon + 15278824) [0x1075192e8] 26-49
                                            24  syscall<A>(blocking:where:_:) + 395 (System.swift:247,23 in RedLemon + 15241595) [0x10751017b] 26-49
                                              24  partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36 (<compiler-generated> in RedLemon + 15280708) [0x107519a44] 26-49
                                                24  closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911,13 in RedLemon + 15279087) [0x1075193ef] 26-49
                                                  24  kevent + 10 (libsystem_kernel.dylib + 25358) [0x7ff80471c30e] 26-49
                                                   *24  ??? (kernel + 6418176) [0xffffff800082ef00] 26-49

  Thread 0x2cafc    Thread name "NIO-SGLTN-0-#3"    49 samples (1-49)    priority 31 (base 31)    cpu time 0.003s (4.2M cycles, 2.1M instructions, 2.02c/i)
  <process frontmost, thread QoS default (requested default), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  25  <truncated backtrace> 1-25
    25  kevent + 10 (libsystem_kernel.dylib + 25358) [0x7ff80471c30e] 1-25
     *25  ??? (kernel + 6418176) [0xffffff800082ef00] 1-25
  24  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 26-49
    24  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 26-49
      24  @objc closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 9 (<compiler-generated> in RedLemon + 15293033) [0x10751ca69] 26-49
        24  closure #1 in static ThreadOpsPosix.run(handle:args:detachThread:) + 1007 (ThreadPosix.swift:116,13 in RedLemon + 15292847) [0x10751c9af] 26-49
          24  thunk for @escaping @callee_guaranteed (@guaranteed NIOThread) -> () + 15 (<compiler-generated> in RedLemon + 15281727) [0x107519e3f] 26-49
            24  partial apply for closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 51 (<compiler-generated> in RedLemon + 14692211) [0x107489f73] 26-49
              24  closure #1 in static MultiThreadedEventLoopGroup.setupThreadAndEventLoop(name:parentGroup:selectorFactory:initializer:) + 282 (MultiThreadedEventLoopGroup.swift:111,41 in RedLemon + 14666906) [0x107483c9a] 26-49
                24  static MultiThreadedEventLoopGroup.runTheLoop(thread:parentGroup:canEventLoopBeShutdownIndividually:selectorFactory:initializer:_:) + 856 (MultiThreadedEventLoopGroup.swift:93,22 in RedLemon + 14665032) [0x107483548] 26-49
                  1   SelectableEventLoop.run() + 656 (SelectableEventLoop.swift:676,33 in RedLemon + 15050864) [0x1074e1870] 26
                    1   SelectableEventLoop.runLoop() + 847 (SelectableEventLoop.swift:587,22 in RedLemon + 15049471) [0x1074e12ff] 26
                      1   SelectableEventLoop.run(_:) + 107 (SelectableEventLoop.swift:436,9 in RedLemon + 15043579) [0x1074dfbfb] 26
                        1   withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26,16 in RedLemon + 15021833) [0x1074da709] 26
                          1   autoreleasepool<A>(invoking:) + 44 (libswiftObjectiveC.dylib + 3708) [0x7ff81971ce7c] 26
                            1   partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28 (<compiler-generated> in RedLemon + 15021996) [0x1074da7ac] 26
                              1   closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27,13 in RedLemon + 15021922) [0x1074da762] 26
                                1   partial apply for closure #1 in SelectableEventLoop.run(_:) + 20 (<compiler-generated> in RedLemon + 15074132) [0x1074e7354] 26
                                  1   closure #1 in SelectableEventLoop.run(_:) + 146 (SelectableEventLoop.swift:439,17 in RedLemon + 15043762) [0x1074dfcb2] 26
                                    1   closure #1 in ChannelCollector.initiateShutdown(promise:) + 50 (QuiescingHelper.swift:172,22 in RedLemon + 11017922) [0x107108ec2] 26
                                      1   ChannelCollector.initiateShutdown0(promise:) + 1265 (QuiescingHelper.swift:143,27 in RedLemon + 11016529) [0x107108951] 26
                                        1   ChannelOutboundInvoker.close(mode:file:line:) + 195 (ChannelInvoker.swift:154,9 in RedLemon + 10149699) [0x107034f43] 26
                                          1   protocol witness for ChannelOutboundInvoker.close(mode:promise:) in conformance BaseSocketChannel<A1> + 69 (<compiler-generated> in RedLemon + 14377205) [0x10743d0f5] 26
                                            1   Channel.close(mode:promise:) + 101 (Channel.swift:197,18 in RedLemon + 10117877) [0x10702d2f5] 26
                                              1   ChannelPipeline.close(mode:promise:) + 179 (ChannelPipeline.swift:727,13 in RedLemon + 10195939) [0x1070403e3] 26
                                                1   ChannelPipeline.close0(mode:promise:) + 152 (ChannelPipeline.swift:827,30 in RedLemon + 10196264) [0x107040528] 26
                                                  1   ChannelHandlerContext.invokeClose(mode:promise:) + 439 (ChannelPipeline.swift:1858,24 in RedLemon + 10202743) [0x107041e77] 26
                                                    1   ChannelHandlerContext.invokeClose(mode:promise:) + 439 (ChannelPipeline.swift:1858,24 in RedLemon + 10202743) [0x107041e77] 26
                                                      1   ChannelHandlerContext.invokeClose(mode:promise:) + 320 (ChannelPipeline.swift:1856,29 in RedLemon + 10202624) [0x107041e00] 26
                                                       *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 26
                                                         *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 26
                                                           *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 26
                                                             *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 26
                                                               *1   ??? (kernel + 607154) [0xffffff80002a43b2] 26
                                                                 *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 26
                  23  SelectableEventLoop.run() + 591 (SelectableEventLoop.swift:652,17 in RedLemon + 15050799) [0x1074e182f] 27-49
                    23  withAutoReleasePool<A>(_:) + 57 (SelectableEventLoop.swift:26,16 in RedLemon + 15021833) [0x1074da709] 27-49
                      23  autoreleasepool<A>(invoking:) + 44 (libswiftObjectiveC.dylib + 3708) [0x7ff81971ce7c] 27-49
                        23  partial apply for closure #1 in withAutoReleasePool<A>(_:) + 28 (<compiler-generated> in RedLemon + 15021996) [0x1074da7ac] 27-49
                          23  closure #1 in withAutoReleasePool<A>(_:) + 34 (SelectableEventLoop.swift:27,13 in RedLemon + 15021922) [0x1074da762] 27-49
                            23  partial apply for closure #2 in SelectableEventLoop.run() + 20 (<compiler-generated> in RedLemon + 15068116) [0x1074e5bd4] 27-49
                              23  closure #2 in SelectableEventLoop.run() + 158 (SelectableEventLoop.swift:653,36 in RedLemon + 15054766) [0x1074e27ae] 27-49
                                23  Selector.whenReady(strategy:onLoopBegin:_:) + 100 (SelectorGeneric.swift:288,18 in RedLemon + 15101684) [0x1074edef4] 27-49
                                  23  Selector.whenReady0(strategy:onLoopBegin:_:) + 1053 (SelectorKqueue.swift:211,34 in RedLemon + 15128013) [0x1074f45cd] 27-49
                                    23  Optional.withUnsafeOptionalPointer<A>(_:) + 346 (SelectorGeneric.swift:27,24 in RedLemon + 15076458) [0x1074e7c6a] 27-49
                                      23  withUnsafePointer<A, B>(to:_:) + 12 (libswiftCore.dylib + 1161004) [0x7ff811d2d72c] 27-49
                                        23  partial apply for closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 39 (<compiler-generated> in RedLemon + 15076855) [0x1074e7df7] 27-49
                                          23  closure #1 in Optional.withUnsafeOptionalPointer<A>(_:) + 50 (SelectorGeneric.swift:28,21 in RedLemon + 15076770) [0x1074e7da2] 27-49
                                            23  partial apply for closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 15 (<compiler-generated> in RedLemon + 15138335) [0x1074f6e1f] 27-49
                                              23  closure #1 in Selector.whenReady0(strategy:onLoopBegin:_:) + 230 (SelectorKqueue.swift:212,28 in RedLemon + 15134134) [0x1074f5db6] 27-49
                                                23  static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 312 (System.swift:910,20 in RedLemon + 15278824) [0x1075192e8] 27-49
                                                  23  syscall<A>(blocking:where:_:) + 395 (System.swift:247,23 in RedLemon + 15241595) [0x10751017b] 27-49
                                                    23  partial apply for closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 36 (<compiler-generated> in RedLemon + 15280708) [0x107519a44] 27-49
                                                      23  closure #1 in static KQueue.kevent(kq:changelist:nchanges:eventlist:nevents:timeout:) + 95 (System.swift:911,13 in RedLemon + 15279087) [0x1075193ef] 27-49
                                                        23  kevent + 10 (libsystem_kernel.dylib + 25358) [0x7ff80471c30e] 27-49
                                                         *23  ??? (kernel + 6418176) [0xffffff800082ef00] 27-49

  Thread 0x2cafd    Thread name "TP-#0"    23 samples (1-23)    priority 31 (base 31)
  <process frontmost, thread QoS default (requested default), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  23  <truncated backtrace> 1-23
    23  semaphore_wait_trap + 10 (libsystem_kernel.dylib + 6518) [0x7ff804717976] 1-23
     *23  ??? (kernel + 663488) [0xffffff80002b1fc0] 1-23

  Thread 0x2cafe    Thread name "TP-#1"    23 samples (1-23)    priority 31 (base 31)
  <process frontmost, thread QoS default (requested default), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  23  <truncated backtrace> 1-23
    23  semaphore_wait_trap + 10 (libsystem_kernel.dylib + 6518) [0x7ff804717976] 1-23
     *23  ??? (kernel + 663488) [0xffffff80002b1fc0] 1-23

  Thread 0x2caff    Thread name "TP-#2"    23 samples (1-23)    priority 31 (base 31)
  <process frontmost, thread QoS default (requested default), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  23  <truncated backtrace> 1-23
    23  semaphore_wait_trap + 10 (libsystem_kernel.dylib + 6518) [0x7ff804717976] 1-23
     *23  ??? (kernel + 663488) [0xffffff80002b1fc0] 1-23

  Thread 0x2cb00    Thread name "TP-#3"    23 samples (1-23)    priority 31 (base 31)
  <process frontmost, thread QoS default (requested default), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  23  <truncated backtrace> 1-23
    23  semaphore_wait_trap + 10 (libsystem_kernel.dylib + 6518) [0x7ff804717976] 1-23
     *23  ??? (kernel + 663488) [0xffffff80002b1fc0] 1-23

  Thread 0x2cc34    DispatchQueue "com.apple.root.user-initiated-qos.cooperative"(18)    13 samples (21-33)    priority 37 (base 37)    cpu time 0.020s (29.7M cycles, 21.6M instructions, 1.37c/i)
  <Thread in another stack for 20 samples, process frontmost, thread QoS user initiated (requested user initiated), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  13  start_wqthread + 15 (libsystem_pthread.dylib + 8023) [0x7ff80474ff57] 21-33
    13  _pthread_wqthread + 256 (libsystem_pthread.dylib + 12170) [0x7ff804750f8a] 21-33
      13  _dispatch_worker_thread2 + 160 (libdispatch.dylib + 78428) [0x7ff8045ac25c] 21-33
        13  _dispatch_root_queue_drain + 309 (libdispatch.dylib + 76448) [0x7ff8045abaa0] 21-33
          13  swift_job_runImpl(swift::Job*, swift::ExecutorRef) + 69 (libswift_Concurrency.dylib + 182197) [0x7ffb1dc557b5] 21-33
            13  swift::runJobInEstablishedExecutorContext(swift::Job*) + 68 (libswift_Concurrency.dylib + 179652) [0x7ffb1dc54dc4] 21-33
              12  (7) suspend resume partial function for HTTPServer.start() + 166 (HTTPServer.swift:50,15 in RedLemon + 31154038) [0x10843cf76] 21-32
                12  $defer #1 () in HTTPServer.start() + 43 (HTTPServer.swift:50,21 in RedLemon + 31154491) [0x10843d13b] 21-32
                  1   Application.shutdown() + 179 (Application.swift:235,14 in RedLemon + 32851507) [0x1085db633] 21
                    1   Application.logger.getter + 79 (Application.swift:37,26 in RedLemon + 32837519) [0x1085d7f8f] 21
                      1   NIOLockedValueBox.withLockedValue<A>(_:) + 108 (NIOLockedValueBox.swift:38,34 in RedLemon + 9117852) [0x106f3909c] 21
                        1   LockStorage.withLockedValue<A>(_:) + 46 (NIOLock.swift in RedLemon + 9116110) [0x106f389ce] 21
                         *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 21
                           *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 21
                             *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 21
                               *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 21
                                 *1   ??? (kernel + 607154) [0xffffff80002a43b2] 21
                                   *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 21
                  1   __swift_instantiateConcreteTypeFromMangledName + 89 (<compiler-generated> in RedLemon + 172281) [0x1066b10f9] 22
                    1   swift_getTypeByMangledNameInContext + 171 (libswiftCore.dylib + 3288811) [0x7ff811f34eeb] 22
                      1   swift_getTypeByMangledName + 477 (libswiftCore.dylib + 3288253) [0x7ff811f34cbd] 22
                        1   swift_getTypeByMangledNameImpl(swift::MetadataRequest, __swift::__runtime::llvm::StringRef, void const* const*, std::__1::function<swift::TargetMetadata<swift::InProcess> const* (unsigned int, unsigned int)>, std::__1::function<swift::TargetWitnessTable<swift::InProcess> const* (swift::TargetMetadata<swift::InProcess> const*, unsigned int)>) + 1002 (libswiftCore.dylib + 3299210) [0x7ff811f3778a] 22
                          1   swift_getTypeByMangledNode + 477 (libswiftCore.dylib + 3297389) [0x7ff811f3706d] 22
                            1   swift_getTypeByMangledNodeImpl(swift::MetadataRequest, swift::Demangle::__runtime::Demangler&, swift::Demangle::__runtime::Node*, void const* const*, std::__1::function<swift::TargetMetadata<swift::InProcess> const* (unsigned int, unsigned int)>, std::__1::function<swift::TargetWitnessTable<swift::InProcess> const* (swift::TargetMetadata<swift::InProcess> const*, unsigned int)>) + 493 (libswiftCore.dylib + 3297949) [0x7ff811f3729d] 22
                              1   swift::Demangle::__runtime::TypeDecoder<(anonymous namespace)::DecodedMetadataBuilder>::decodeMangledType(swift::Demangle::__runtime::Node*, unsigned int, bool) + 21499 (libswiftCore.dylib + 3322267) [0x7ff811f3d19b] 22
                                1   __swift_instantiateGenericMetadata + 29 (libswiftCore.dylib + 3013485) [0x7ff811ef1b6d] 22
                                  1   _swift_getGenericMetadata(swift::MetadataRequest, void const* const*, swift::TargetTypeContextDescriptor<swift::InProcess> const*) + 418 (libswiftCore.dylib + 3171810) [0x7ff811f185e2] 22
                                   *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 22
                                     *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 22
                                       *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 22
                                         *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 22
                                           *1   ??? (kernel + 607154) [0xffffff80002a43b2] 22
                                             *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 22
                  2   Application.shutdown() + 822 (Application.swift:238,44 in RedLemon + 32852150) [0x1085db8b6] 23-24
                    2   Sequence.forEach(_:) + 413 (libswiftCore.dylib + 733197) [0x7ff811cc500d] 23-24
                      2   partial apply for closure #1 in Application.shutdown() + 15 (<compiler-generated> in RedLemon + 32854575) [0x1085dc22f] 23-24
                        2   closure #1 in Application.shutdown() + 84 (Application.swift:238,57 in RedLemon + 32854548) [0x1085dc214] 23-24
                          2   protocol witness for LifecycleHandler.shutdown(_:) in conformance Application.Core.LifecycleHandler + 9 (<compiler-generated> in RedLemon + 33232569) [0x1086386b9] 23-24
                            2   Application.Core.LifecycleHandler.shutdown(_:) + 52 (Core.swift:98,45 in RedLemon + 33232324) [0x1086385c4] 23-24
                              2   NIOThreadPool.syncShutdownGracefully() + 25 (NIOThreadPool.swift:353,18 in RedLemon + 14711257) [0x10748e9d9] 23-24
                                1   NIOThreadPool._syncShutdownGracefully() + 546 (NIOThreadPool.swift:360,14 in RedLemon + 14711842) [0x10748ec22] 23
                                  1   NIOThreadPool.shutdownGracefully(_:) + 186 (NIOThreadPool.swift:333,14 in RedLemon + 14710058) [0x10748e52a] 23
                                    1   NIOThreadPool.shutdownGracefully(queue:_:) + 88 (NIOThreadPool.swift:86,14 in RedLemon + 14693224) [0x10748a368] 23
                                      1   NIOThreadPool._shutdownGracefully(queue:_:) + 534 (NIOThreadPool.swift:97,39 in RedLemon + 14693782) [0x10748a596] 23
                                        1   NIOLock.withLock<A>(_:) + 93 (NIOLock.swift:237,20 in RedLemon + 9116957) [0x106f38d1d] 23
                                          1   partial apply for closure #2 in NIOThreadPool._shutdownGracefully(queue:_:) + 20 (<compiler-generated> in RedLemon + 14717924) [0x1074903e4] 23
                                            1   lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A> + 81 (<compiler-generated> in RedLemon + 236977) [0x1066c0db1] 23
                                              1   swift::_getWitnessTable(swift::TargetProtocolConformanceDescriptor<swift::InProcess> const*, swift::TargetMetadata<swift::InProcess> const*, void const* const*) + 438 (libswiftCore.dylib + 3210198) [0x7ff811f21bd6] 23
                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 23
                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 23
                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 23
                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 23
                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 23
                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 23
                                1   NIOThreadPool._syncShutdownGracefully() + 570 (NIOThreadPool.swift:368,22 in RedLemon + 14711866) [0x10748ec3a] 24
                                  1   _swift_dispatch_block_wait + 30 (libswiftDispatch.dylib + 55699) [0x7ff81735b993] 24
                                    1   dispatch_block_wait + 202 (libdispatch.dylib + 26382) [0x7ff80459f70e] 24
                                      1   _dispatch_group_wait_slow + 43 (libdispatch.dylib + 15765) [0x7ff80459cd95] 24
                                        1   __ulock_wait + 10 (libsystem_kernel.dylib + 12458) [0x7ff8047190aa] 24
                                         *1   ??? (kernel + 6798096) [0xffffff800088bb10] 24
                  6   Application.shutdown() + 1274 (Application.swift:242,22 in RedLemon + 32852602) [0x1085dba7a] 25-30
                    6   Storage.shutdown() + 214 (Storage.swift:101,29 in RedLemon + 34600070) [0x108786486] 25-30
                      6   Sequence.forEach(_:) + 413 (libswiftCore.dylib + 733197) [0x7ff811cc500d] 25-30
                        6   partial apply for closure #1 in Storage.shutdown() + 16 (<compiler-generated> in RedLemon + 34600256) [0x108786540] 25-30
                          6   closure #1 in Storage.shutdown() + 105 (Storage.swift:102,16 in RedLemon + 34600217) [0x108786519] 25-30
                            6   protocol witness for AnyStorageValue.shutdown(logger:) in conformance Storage.Value<A> + 9 (<compiler-generated> in RedLemon + 34594409) [0x108784e69] 25-30
                              6   Storage.Value.shutdown(logger:) + 236 (Storage.swift:16,36 in RedLemon + 34593388) [0x108784a6c] 25-30
                                2   partial apply for thunk for @escaping @callee_guaranteed @Sendable (@guaranteed ServeCommand) -> (@error @owned Error) + 20 (<compiler-generated> in RedLemon + 34178884) [0x10871f744] 25-26
                                  2   thunk for @escaping @callee_guaranteed @Sendable (@guaranteed ServeCommand) -> (@error @owned Error) + 18 (<compiler-generated> in RedLemon + 34178770) [0x10871f6d2] 25-26
                                    2   closure #1 in Application.Servers.command.getter + 34 (Application+Servers.swift:60,24 in RedLemon + 34178738) [0x10871f6b2] 25-26
                                      2   ServeCommand.shutdown() + 343 (ServeCommand.swift:111,20 in RedLemon + 33004055) [0x108600a17] 25-26
                                        2   protocol witness for Server.shutdown() in conformance HTTPServer + 16 (<compiler-generated> in RedLemon + 33762272) [0x1086b9be0] 25-26
                                          1   HTTPServer.shutdown() + 473 (HTTPServer.swift:375,28 in RedLemon + 33759289) [0x1086b9039] 25
                                            1   HTTPServerConnection.close(timeout:) + 102 (HTTPServer.swift:499,28 in RedLemon + 33760470) [0x1086b94d6] 25
                                              1   swift_unknownObjectRetain + 32 (libswiftCore.dylib + 3398848) [0x7ff811f4fcc0] 25
                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 25
                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 25
                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 25
                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 25
                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 25
                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 25
                                          1   HTTPServer.shutdown() + 535 (HTTPServer.swift:375,79 in RedLemon + 33759351) [0x1086b9077] 26
                                            1   EventLoopFuture.wait(file:line:) + 74 (EventLoopFuture.swift:997,25 in RedLemon + 10486506) [0x1070872ea] 26
                                              1   EventLoopFuture._wait(file:line:) + 797 (EventLoopFuture.swift:1012,14 in RedLemon + 10487341) [0x10708762d] 26
                                                1   ConditionLock.lock(whenValue:) + 342 (lock.swift:192,24 in RedLemon + 9151702) [0x106f414d6] 26
                                                  1   NIOLock.withLockPrimitive<A>(_:) + 101 (NIOLock.swift:218,34 in RedLemon + 9116789) [0x106f38c75] 26
                                                    1   LockStorage.withLockPrimitive<A>(_:) + 90 (NIOLock.swift:163,18 in RedLemon + 9115930) [0x106f3891a] 26
                                                      1   ManagedBuffer.withUnsafeMutablePointerToElements<A>(_:) + 47 (libswiftCore.dylib + 1162447) [0x7ff811d2dccf] 26
                                                        1   partial apply for closure #1 in LockStorage.withLockPrimitive<A>(_:) + 39 (<compiler-generated> in RedLemon + 9117287) [0x106f38e67] 26
                                                          1   closure #1 in LockStorage.withLockPrimitive<A>(_:) + 50 (NIOLock.swift:164,24 in RedLemon + 9116018) [0x106f38972] 26
                                                            1   partial apply for closure #1 in ConditionLock.lock(whenValue:) + 15 (<compiler-generated> in RedLemon + 9156431) [0x106f4274f] 26
                                                              1   closure #1 in ConditionLock.lock(whenValue:) + 116 (lock.swift:197,27 in RedLemon + 9151908) [0x106f415a4] 26
                                                                1   __psynch_cvwait + 10 (libsystem_kernel.dylib + 17322) [0x7ff80471a3aa] 26
                                                                 *1   psynch_cvcontinue + 0 (pthread + 20825) [0xffffff800376f159] 26
                                4   partial apply for thunk for @escaping @callee_guaranteed @Sendable (@guaranteed HTTPClient) -> (@error @owned Error) + 20 (<compiler-generated> in RedLemon + 33322612) [0x10864e674] 27-30
                                  4   thunk for @escaping @callee_guaranteed @Sendable (@guaranteed HTTPClient) -> (@error @owned Error) + 18 (<compiler-generated> in RedLemon + 33318642) [0x10864d6f2] 27-30
                                    4   closure #1 in closure #1 in Application.HTTP.Client.shared.getter + 38 (Application+HTTP+Client.swift:32,28 in RedLemon + 33318582) [0x10864d6b6] 27-30
                                      4   HTTPClient.syncShutdown() + 35 (HTTPClient.swift:174,18 in RedLemon + 2192643) [0x10689e503] 27-30
                                        1   __swift_instantiateConcreteTypeFromMangledName + 89 (<compiler-generated> in RedLemon + 172281) [0x1066b10f9] 27
                                          1   swift_getTypeByMangledNameInContext + 171 (libswiftCore.dylib + 3288811) [0x7ff811f34eeb] 27
                                            1   swift_getTypeByMangledName + 477 (libswiftCore.dylib + 3288253) [0x7ff811f34cbd] 27
                                              1   swift_getTypeByMangledNameImpl(swift::MetadataRequest, __swift::__runtime::llvm::StringRef, void const* const*, std::__1::function<swift::TargetMetadata<swift::InProcess> const* (unsigned int, unsigned int)>, std::__1::function<swift::TargetWitnessTable<swift::InProcess> const* (swift::TargetMetadata<swift::InProcess> const*, unsigned int)>) + 1002 (libswiftCore.dylib + 3299210) [0x7ff811f3778a] 27
                                                1   swift_getTypeByMangledNode + 477 (libswiftCore.dylib + 3297389) [0x7ff811f3706d] 27
                                                  1   swift_getTypeByMangledNodeImpl(swift::MetadataRequest, swift::Demangle::__runtime::Demangler&, swift::Demangle::__runtime::Node*, void const* const*, std::__1::function<swift::TargetMetadata<swift::InProcess> const* (unsigned int, unsigned int)>, std::__1::function<swift::TargetWitnessTable<swift::InProcess> const* (swift::TargetMetadata<swift::InProcess> const*, unsigned int)>) + 493 (libswiftCore.dylib + 3297949) [0x7ff811f3729d] 27
                                                    1   swift::Demangle::__runtime::TypeDecoder<(anonymous namespace)::DecodedMetadataBuilder>::decodeMangledType(swift::Demangle::__runtime::Node*, unsigned int, bool) + 21499 (libswiftCore.dylib + 3322267) [0x7ff811f3d19b] 27
                                                      1   __swift_instantiateGenericMetadata + 42 (<compiler-generated> in RedLemon + 43050) [0x10669182a] 27
                                                        1   _swift_getGenericMetadata(swift::MetadataRequest, void const* const*, swift::TargetTypeContextDescriptor<swift::InProcess> const*) + 1928 (libswiftCore.dylib + 3173320) [0x7ff811f18bc8] 27
                                                          1   type metadata completion function for UnsafeMutableTransferBox + 124 (<compiler-generated> in RedLemon + 2790540) [0x10693048c] 27
                                                            1   _swift_initClassMetadataImpl(swift::TargetClassMetadata<swift::InProcess>*, swift::ClassLayoutFlags, unsigned long, swift::TypeLayout const* const*, unsigned long*, bool) + 3232 (libswiftCore.dylib + 3191520) [0x7ff811f1d2e0] 27
                                                              1   _platform_memmove$VARIANT$Haswell + 77 (libsystem_platform.dylib + 4525) [0x7ff8047671ad] 27
                                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 27
                                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 27
                                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 27
                                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 27
                                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 27
                                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 27
                                        3   HTTPClient.syncShutdown(requiresCleanClose:) + 895 (HTTPClient.swift:198,14 in RedLemon + 2193583) [0x10689e8af] 28-30
                                          3   HTTPClient.shutdown(requiresCleanClose:queue:_:) + 539 (HTTPClient.swift:254,26 in RedLemon + 2196779) [0x10689f52b] 28-30
                                            3   HTTPConnectionPool.Manager.shutdown(promise:) + 597 (HTTPConnectionPool+Manager.swift:121,30 in RedLemon + 1617893) [0x106811fe5] 28-30
                                              3   Sequence.forEach(_:) + 413 (libswiftCore.dylib + 733197) [0x7ff811cc500d] 28-30
                                                3   closure #2 in HTTPConnectionPool.Manager.shutdown(promise:) + 34 (HTTPConnectionPool+Manager.swift:122,26 in RedLemon + 1618866) [0x1068123b2] 28-30
                                                  3   HTTPConnectionPool.shutdown() + 304 (HTTPConnectionPool.swift:85,14 in RedLemon + 1632448) [0x1068158c0] 28-30
                                                    3   HTTPConnectionPool.modifyStateAndRunActions(_:) + 167 (HTTPConnectionPool.swift:211,46 in RedLemon + 1631975) [0x1068156e7] 28-30
                                                      3   NIOLock.withLock<A>(_:) + 93 (NIOLock.swift:237,20 in RedLemon + 9116957) [0x106f38d1d] 28-30
                                                        3   partial apply for closure #1 in HTTPConnectionPool.modifyStateAndRunActions(_:) + 24 (<compiler-generated> in RedLemon + 1700456) [0x106826268] 28-30
                                                          3   closure #1 in HTTPConnectionPool.modifyStateAndRunActions(_:) + 175 (HTTPConnectionPool.swift:212,38 in RedLemon + 1638623) [0x1068170df] 28-30
                                                            3   closure #1 in HTTPConnectionPool.shutdown() + 38 (HTTPConnectionPool.swift:85,44 in RedLemon + 1632566) [0x106815936] 28-30
                                                              3   HTTPConnectionPool.StateMachine.shutdown() + 74 (HTTPConnectionPool+StateMachine.swift:298,31 in RedLemon + 2084378) [0x106883e1a] 28-30
                                                                3   HTTPConnectionPool.StateMachine.HTTPVersionState.modify<A>(http1:http2:) + 1538 (HTTPConnectionPool+StateMachine.swift:85,35 in RedLemon + 2059218) [0x10687dbd2] 28-30
                                                                  3   closure #1 in HTTPConnectionPool.StateMachine.shutdown() + 38 (HTTPConnectionPool+StateMachine.swift:299,23 in RedLemon + 2084534) [0x106883eb6] 28-30
                                                                    2   HTTPConnectionPool.HTTP1StateMachine.shutdown() + 203 (HTTPConnectionPool+HTTP1StateMachine.swift:365,49 in RedLemon + 1907995) [0x106858d1b] 28-29
                                                                      1   lazy protocol witness table accessor for type [EventLoopID : CircularBuffer<HTTPConnectionPool.Request>] and conformance [A : B] + 43 (<compiler-generated> in RedLemon + 2039467) [0x106878eab] 28
                                                                        1   swift::_getWitnessTable(swift::TargetProtocolConformanceDescriptor<swift::InProcess> const*, swift::TargetMetadata<swift::InProcess> const*, void const* const*) + 516 (libswiftCore.dylib + 3210276) [0x7ff811f21c24] 28
                                                                          1   std::__1::pair<swift::HashMapElementWrapper<(anonymous namespace)::WitnessTableCacheEntry>*, unsigned int> swift::ConcurrentReadableHashMap<swift::HashMapElementWrapper<(anonymous namespace)::WitnessTableCacheEntry>, swift::StaticMutex>::find<swift::TargetMetadata<swift::InProcess> const*>(swift::TargetMetadata<swift::InProcess> const* const&, swift::ConcurrentReadableHashMap<swift::HashMapElementWrapper<(anonymous namespace)::WitnessTableCacheEntry>, swift::StaticMutex>::IndexStorage, unsigned long, swift::HashMapElementWrapper<(anonymous namespace)::WitnessTableCacheEntry>*) + 325 (libswiftCore.dylib + 3276293) [0x7ff811f31e05] 28
                                                                           *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 28
                                                                             *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 28
                                                                               *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 28
                                                                                 *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 28
                                                                                   *1   ??? (kernel + 607154) [0xffffff80002a43b2] 28
                                                                                     *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 28
                                                                      1   HTTPConnectionPool.RequestQueue.removeAll() + 185 (HTTPConnectionPool+RequestQueue.swift:122,43 in RedLemon + 2047993) [0x10687aff9] 29
                                                                        1   Sequence.flatMap<A>(_:) + 664 (libswiftCore.dylib + 1450344) [0x7ff811d74168] 29
                                                                          1   __swift_instantiateCanonicalPrespecializedGenericMetadata + 32 (libswiftCore.dylib + 3013536) [0x7ff811ef1ba0] 29
                                                                            1   _swift_getGenericMetadata(swift::MetadataRequest, void const* const*, swift::TargetTypeContextDescriptor<swift::InProcess> const*) + 656 (libswiftCore.dylib + 3172048) [0x7ff811f186d0] 29
                                                                              1   std::__1::pair<swift::HashMapElementWrapper<(anonymous namespace)::GenericCacheEntry>*, unsigned int> swift::ConcurrentReadableHashMap<swift::HashMapElementWrapper<(anonymous namespace)::GenericCacheEntry>, swift::StaticMutex>::find<swift::MetadataCacheKey>(swift::MetadataCacheKey const&, swift::ConcurrentReadableHashMap<swift::HashMapElementWrapper<(anonymous namespace)::GenericCacheEntry>, swift::StaticMutex>::IndexStorage, unsigned long, swift::HashMapElementWrapper<(anonymous namespace)::GenericCacheEntry>*) + 215 (libswiftCore.dylib + 3226727) [0x7ff811f25c67] 29
                                                                               *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 29
                                                                                 *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 29
                                                                                   *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 29
                                                                                     *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 29
                                                                                       *1   ??? (kernel + 607154) [0xffffff80002a43b2] 29
                                                                                         *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 29
                                                                    1   lazy protocol witness table accessor for type [HTTPConnectionPool.Connection] and conformance [A] + 43 (<compiler-generated> in RedLemon + 1701083) [0x1068264db] 30
                                                                      1   swift::_getWitnessTable(swift::TargetProtocolConformanceDescriptor<swift::InProcess> const*, swift::TargetMetadata<swift::InProcess> const*, void const* const*) + 516 (libswiftCore.dylib + 3210276) [0x7ff811f21c24] 30
                                                                        1   std::__1::pair<swift::HashMapElementWrapper<(anonymous namespace)::WitnessTableCacheEntry>*, unsigned int> swift::ConcurrentReadableHashMap<swift::HashMapElementWrapper<(anonymous namespace)::WitnessTableCacheEntry>, swift::StaticMutex>::find<swift::TargetMetadata<swift::InProcess> const*>(swift::TargetMetadata<swift::InProcess> const* const&, swift::ConcurrentReadableHashMap<swift::HashMapElementWrapper<(anonymous namespace)::WitnessTableCacheEntry>, swift::StaticMutex>::IndexStorage, unsigned long, swift::HashMapElementWrapper<(anonymous namespace)::WitnessTableCacheEntry>*) + 325 (libswiftCore.dylib + 3276293) [0x7ff811f31e05] 30
                                                                         *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 30
                                                                           *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 30
                                                                             *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 30
                                                                               *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 30
                                                                                 *1   ??? (kernel + 607154) [0xffffff80002a43b2] 30
                                                                                   *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 30
                  2   Application.shutdown() + 1336 (Application.swift:243,9 in RedLemon + 32852664) [0x1085dbab8] 31-32
                    2   Application.storage.setter + 142 (Application.swift:27,27 in RedLemon + 32836734) [0x1085d7c7e] 31-32
                      2   NIOLockedValueBox.withLockedValue<A>(_:) + 108 (NIOLockedValueBox.swift:38,34 in RedLemon + 9117852) [0x106f3909c] 31-32
                        2   LockStorage.withLockedValue<A>(_:) + 90 (NIOLock.swift:170,18 in RedLemon + 9116154) [0x106f389fa] 31-32
                          2   ManagedBuffer.withUnsafeMutablePointers<A>(_:) + 57 (libswiftCore.dylib + 1162377) [0x7ff811d2dc89] 31-32
                            2   partial apply for closure #1 in LockStorage.withLockedValue<A>(_:) + 39 (<compiler-generated> in RedLemon + 9117335) [0x106f38e97] 31-32
                              2   closure #1 in LockStorage.withLockedValue<A>(_:) + 120 (NIOLock.swift:173,24 in RedLemon + 9116312) [0x106f38a98] 31-32
                                2   partial apply for closure #1 in Application.storage.setter + 16 (<compiler-generated> in RedLemon + 32837040) [0x1085d7db0] 31-32
                                  2   closure #1 in Application.storage.setter + 77 (Application.swift:27,48 in RedLemon + 32836877) [0x1085d7d0d] 31-32
                                    2   outlined assign with take of Storage + 30 (<compiler-generated> in RedLemon + 32857934) [0x1085dcf4e] 31-32
                                      2   _swift_release_dealloc + 16 (libswiftCore.dylib + 3134560) [0x7ff811f0f460] 31-32
                                        2   _DictionaryStorage.__deallocating_deinit + 9 (libswiftCore.dylib + 676841) [0x7ff811cb73e9] 31-32
                                          2   _DictionaryStorage.deinit + 589 (libswiftCore.dylib + 676797) [0x7ff811cb73bd] 31-32
                                            2   swift_arrayDestroy + 59 (libswiftCore.dylib + 3088939) [0x7ff811f0422b] 31-32
                                              2   destroy for Storage.Value + 35 (<compiler-generated> in RedLemon + 34602403) [0x108786da3] 31-32
                                                2   _swift_release_dealloc + 16 (libswiftCore.dylib + 3134560) [0x7ff811f0f460] 31-32
                                                  1   Routes.__deallocating_deinit + 25 (Routes.swift in RedLemon + 34129881) [0x1087137d9] 31
                                                    1   Routes.deinit + 36 (Routes.swift in RedLemon + 34129812) [0x108713794] 31
                                                      1   outlined destroy of NIOLockedValueBox<Routes.SendableBox> + 20 (<compiler-generated> in RedLemon + 34129844) [0x1087137b4] 31
                                                        1   _swift_release_dealloc + 16 (libswiftCore.dylib + 3134560) [0x7ff811f0f460] 31
                                                          1   LockStorage.__deallocating_deinit + 44 (NIOLock.swift in RedLemon + 9115804) [0x106f3889c] 31
                                                            1   LockStorage.deinit + 93 (NIOLock.swift:159,5 in RedLemon + 9115693) [0x106f3882d] 31
                                                              1   ManagedBuffer.deinit + 26 (libswiftCore.dylib + 255562) [0x7ff811c5064a] 31
                                                                1   destroy for Routes.SendableBox + 12 (<compiler-generated> in RedLemon + 34130220) [0x10871392c] 31
                                                                  1   _swift_release_dealloc + 16 (libswiftCore.dylib + 3134560) [0x7ff811f0f460] 31
                                                                    1   _ContiguousArrayStorage.__deallocating_deinit + 42 (libswiftCore.dylib + 508010) [0x7ff811c8e06a] 31
                                                                      1   swift_arrayDestroy + 59 (libswiftCore.dylib + 3088939) [0x7ff811f0422b] 31
                                                                        1   swift_release + 42 (libswiftCore.dylib + 3129722) [0x7ff811f0e17a] 31
                                                                         *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 31
                                                                           *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 31
                                                                             *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 31
                                                                               *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 31
                                                                                 *1   ??? (kernel + 607154) [0xffffff80002a43b2] 31
                                                                                   *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 31
                                                  1   ServeCommand.__deallocating_deinit + 25 (ServeCommand.swift in RedLemon + 33005417) [0x108600f69] 32
                                                    1   ServeCommand.deinit + 202 (ServeCommand.swift:120,5 in RedLemon + 33005226) [0x108600eaa] 32
                                                      1   outlined destroy of NIOLockedValueBox<ServeCommand.SendableBox> + 20 (<compiler-generated> in RedLemon + 33005380) [0x108600f44] 32
                                                        1   _swift_release_dealloc + 16 (libswiftCore.dylib + 3134560) [0x7ff811f0f460] 32
                                                          1   LockStorage.__deallocating_deinit + 44 (NIOLock.swift in RedLemon + 9115804) [0x106f3889c] 32
                                                            1   LockStorage.deinit + 93 (NIOLock.swift:159,5 in RedLemon + 9115693) [0x106f3882d] 32
                                                              1   ManagedBuffer.deinit + 26 (libswiftCore.dylib + 255562) [0x7ff811c5064a] 32
                                                                1   destroy for ServeCommand.SendableBox + 73 (<compiler-generated> in RedLemon + 33008297) [0x108601aa9] 32
                                                                  1   __swift_destroy_boxed_opaque_existential_1 + 52 (<compiler-generated> in RedLemon + 964356) [0x106772704] 32
                                                                    1   _swift_release_dealloc + 16 (libswiftCore.dylib + 3134560) [0x7ff811f0f460] 32
                                                                      1   HTTPServer.__deallocating_deinit + 25 (HTTPServer.swift in RedLemon + 33762057) [0x1086b9b09] 32
                                                                        1   HTTPServer.deinit + 293 (HTTPServer.swift:391,5 in RedLemon + 33761717) [0x1086b99b5] 32
                                                                          1   __swift_destroy_boxed_opaque_existential_1 + 70 (<compiler-generated> in RedLemon + 964374) [0x106772716] 32
                                                                            1   _swift_release_dealloc + 16 (libswiftCore.dylib + 3134560) [0x7ff811f0f460] 32
                                                                              1   ??? (RedLemon + 34027493) [0x1086fa7e5] 32
                                                                                1   _swift_release_dealloc + 16 (libswiftCore.dylib + 3134560) [0x7ff811f0f460] 32
                                                                                  1   TrieRouter.__deallocating_deinit + 37 (TrieRouter.swift in RedLemon + 32601829) [0x10859e6e5] 32
                                                                                    1   TrieRouter.deinit + 70 (TrieRouter.swift in RedLemon + 32601782) [0x10859e6b6] 32
                                                                                      1   outlined destroy of Logger + 17 (<compiler-generated> in RedLemon + 979793) [0x106776351] 32
                                                                                        1   __swift_destroy_boxed_opaque_existential_1 + 70 (<compiler-generated> in RedLemon + 964374) [0x106772716] 32
                                                                                          1   _swift_release_dealloc + 16 (libswiftCore.dylib + 3134560) [0x7ff811f0f460] 32
                                                                                            1   (anonymous namespace)::destroyGenericBox(swift::HeapObject*) + 27 (libswiftCore.dylib + 3138539) [0x7ff811f103eb] 32
                                                                                              1   destroy for ConsoleLogger + 103 (<compiler-generated> in RedLemon + 7767527) [0x106def5e7] 32
                                                                                                1   swift_release + 42 (libswiftCore.dylib + 3129722) [0x7ff811f0e17a] 32
                                                                                                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 32
                                                                                                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 32
                                                                                                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 32
                                                                                                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 32
                                                                                                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 32
                                                                                                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 32
              1   (3) suspend resume partial function for closure #1 in RedLemonApp.startServer() + 320 (RedLemonApp.swift:189,21 in RedLemon + 17452128) [0x10772bc60] 33
                1   NSLog(_:_:) + 363 (libswiftFoundation.dylib + 627707) [0x7ff815fe53fb] 33
                  1   _NSLogv + 97 (Foundation + 1181960) [0x7ff805738908] 33
                    1   _CFLogvEx3 + 264 (CoreFoundation + 598142) [0x7ff80482d07e] 33
                      1   _CFLogvEx2Predicate + 352 (CoreFoundation + 598926) [0x7ff80482d38e] 33
                        1   _populateBanner + 109 (CoreFoundation + 599161) [0x7ff80482d479] 33
                          1   localtime_r + 41 (libsystem_c.dylib + 38758) [0x7ff804627766] 33
                            1   tzsetwall_basic + 55 (libsystem_c.dylib + 39491) [0x7ff804627a43] 33
                              1   notify_check_tz + 32 (libsystem_c.dylib + 39899) [0x7ff804627bdb] 33
                                1   notify_check + 59 (libsystem_notify.dylib + 6060) [0x7ff8071bc7ac] 33
                                 *1   hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 33
                                   *1   user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 33
                                     *1   ??? (kernel + 1113914) [0xffffff800031ff3a] 33
                                       *1   thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 33
                                         *1   ??? (kernel + 607154) [0xffffff80002a43b2] 33
                                           *1   machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 33

  Thread 0x2ce72    DispatchQueue "io.swiftnio.NIOThreadPool.shutdownGracefully"(1283)    1 sample (24)    priority 37 (base 37)    cpu time <0.001s (829.1K cycles, 232.1K instructions, 3.57c/i)
  <DispatchQueue not seen for 23 samples, process frontmost, thread QoS user initiated (requested user initiated), process unclamped, process received importance donation from WindowServer [157], IO tier 0>
  1  start_wqthread + 15 (libsystem_pthread.dylib + 8023) [0x7ff80474ff57] 24
    1  _pthread_wqthread + 326 (libsystem_pthread.dylib + 12240) [0x7ff804750fd0] 24
      1  _dispatch_workloop_worker_thread + 753 (libdispatch.dylib + 81646) [0x7ff8045aceee] 24
        1  _dispatch_lane_invoke + 366 (libdispatch.dylib + 40445) [0x7ff8045a2dfd] 24
          1  _dispatch_lane_serial_drain + 955 (libdispatch.dylib + 37938) [0x7ff8045a2432] 24
            1  _dispatch_client_callout + 8 (libdispatch.dylib + 13079) [0x7ff80459c317] 24
              1  _dispatch_call_block_and_release + 12 (libdispatch.dylib + 8396) [0x7ff80459b0cc] 24
                1  thunk for @escaping @callee_guaranteed () -> () + 40 (<compiler-generated> in RedLemon + 2194360) [0x10689ebb8] 24
                  1  closure #3 in NIOThreadPool._shutdownGracefully(queue:_:) + 80 (NIOThreadPool.swift:121,27 in RedLemon + 14697328) [0x10748b370] 24
                    1  Sequence.forEach(_:) + 413 (libswiftCore.dylib + 733197) [0x7ff811cc500d] 24
                      1  closure #1 in closure #3 in NIOThreadPool._shutdownGracefully(queue:_:) + 34 (NIOThreadPool.swift:121,40 in RedLemon + 14697394) [0x10748b3b2] 24
                        1  NIOThread.join() + 29 (Thread.swift:78,25 in RedLemon + 15281261) [0x107519c6d] 24
                          1  static ThreadOpsPosix.joinThread(_:) + 66 (ThreadPosix.swift:142,19 in RedLemon + 15293458) [0x10751cc12] 24
                            1  _pthread_join + 124 (libsystem_pthread.dylib + 31659) [0x7ff804755bab] 24
                             *1  hndl_alltraps + 223 (kernel + 39327) [0xffffff800021999f] 24
                               *1  user_trap + 697 (kernel + 1820633) [0xffffff80003cc7d9] 24
                                 *1  ??? (kernel + 1113914) [0xffffff800031ff3a] 24
                                   *1  thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 24
                                     *1  ??? (kernel + 607154) [0xffffff80002a43b2] 24
                                       *1  machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 24

  Binary Images:
           0x106687000 -        0x108caefff  com.redlemon.app 1.0.14 (14)                       <70CFDCC9-8CE5-37C8-B428-9C01403E01D8>         /Users/USER/Desktop/*/RedLemon.app/Contents/MacOS/RedLemon
           0x115b41000 -        0x115bc4fff  dyld (960)                                         <EEA022BB-A6AB-3CD1-8AC1-54CE8CFD3333>         /usr/lib/dyld
        0x7ff80456d000 -     0x7ff804598fff  libsystem_malloc.dylib (374.120.1)                 <0FF21147-73CD-36DC-99E9-606217A75B77>         /usr/lib/system/libsystem_malloc.dylib
        0x7ff804599000 -     0x7ff8045dffff  libdispatch.dylib (1325.120.2)                     <37860D89-D337-3140-8973-AC199ACBC361>         /usr/lib/system/libdispatch.dylib
        0x7ff8045e0000 -     0x7ff80461afff  libobjc.A.dylib (841.13.1)                         <B36A2B52-68A9-3E44-B927-71C24BE1272F>         /usr/lib/libobjc.A.dylib
        0x7ff80461e000 -     0x7ff8046a6fff  libsystem_c.dylib (1507.100.9.700.1)               <202D7260-EA46-3956-A471-19C9BCF45274>         /usr/lib/system/libsystem_c.dylib
        0x7ff804700000 -     0x7ff804715fff  libc++abi.dylib (1300.36)                          <69AC868B-1157-364A-984A-5EF26973F661>         /usr/lib/libc++abi.dylib
        0x7ff804716000 -     0x7ff80474dfff  libsystem_kernel.dylib (8020.240.18.709.2)         <2FE67E94-4A5E-3506-9E02-502F7270F7EF>         /usr/lib/system/libsystem_kernel.dylib
        0x7ff80474e000 -     0x7ff804759fff  libsystem_pthread.dylib (486.100.11.701.1)         <5A5F7316-85B7-315E-BAF3-76211EE65604>         /usr/lib/system/libsystem_pthread.dylib
        0x7ff804766000 -     0x7ff80476ffff  libsystem_platform.dylib (273.100.5)               <81A897B2-8752-3F99-833E-DA16FFA9FA58>         /usr/lib/system/libsystem_platform.dylib
        0x7ff80479b000 -     0x7ff804c9dfff  com.apple.CoreFoundation 6.9 (1866)                <FDD28505-5456-3C40-A5BA-7890B064DB39>         /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
        0x7ff805618000 -     0x7ff8059d4fff  com.apple.Foundation 6.9 (1866)                    <61133096-D5F9-34BD-94B1-1E526EA018B1>         /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
        0x7ff8071bb000 -     0x7ff8071c9fff  libsystem_notify.dylib (301)                       <5288F538-A9BB-384F-B273-8E84D54422D6>         /usr/lib/system/libsystem_notify.dylib
        0x7ff807219000 -     0x7ff8080a8fff  com.apple.AppKit 6.9 (2113.65.150)                 <5DD484CF-ED6A-3633-B42E-6518AEECD5B9>         /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
        0x7ff809723000 -     0x7ff809ac1fff  com.apple.SkyLight 1.600.0 (688.1)                 <02F1D11D-315C-3BBE-934A-D58BA3CEDBE5>         /System/Library/PrivateFrameworks/SkyLight.framework/Versions/A/SkyLight
        0x7ff809ac2000 -     0x7ff80a18dfff  com.apple.CoreGraphics 2.0 (1557.8.1)              <1C6BD849-A624-3812-B6B2-5E0F3138768C>         /System/Library/Frameworks/CoreGraphics.framework/Versions/A/CoreGraphics
        0x7ff80b8cc000 -     0x7ff80bbdefff  com.apple.QuartzCore 1.11 (964.39)                 <5CA19B57-9C18-302F-A989-BB743CD76E00>         /System/Library/Frameworks/QuartzCore.framework/Versions/A/QuartzCore
        0x7ff80bc2a000 -     0x7ff80bd6ffff  com.apple.coreui 2.1 (738.1)                       <63D6F61D-B342-3798-B46C-92D9862661AA>         /System/Library/PrivateFrameworks/CoreUI.framework/Versions/A/CoreUI
        0x7ff80becd000 -     0x7ff80bf14fff  com.apple.CoreAutoLayout 1.0 (28)                  <EF921E7B-1FC5-391A-9722-5C77E9168810>         /System/Library/PrivateFrameworks/CoreAutoLayout.framework/Versions/A/CoreAutoLayout
        0x7ff80d49d000 -     0x7ff80d790fff  com.apple.HIToolbox 2.1.1 (1114.1)                 <913D3D2E-4E4C-3907-98FE-8F4ABD551297>         /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
        0x7ff811c12000 -     0x7ff81208bfff  libswiftCore.dylib (5.6.0.323.35)                  <222D44BB-076B-3BE8-A051-CDDFC2B961DC>         /usr/lib/swift/libswiftCore.dylib
        0x7ff815f4c000 -     0x7ff816299fff  libswiftFoundation.dylib (74)                      <1F21009F-9AA8-36C0-9ABE-87DB68540481>         /usr/lib/swift/libswiftFoundation.dylib
        0x7ff81734e000 -     0x7ff817363fff  libswiftDispatch.dylib (11)                        <37D5AF28-32F7-36C7-A0AA-FC566F736FC9>         /usr/lib/swift/libswiftDispatch.dylib
        0x7ff81971c000 -     0x7ff81971dfff  libswiftObjectiveC.dylib (3)                       <AD175D32-3DBA-3E98-BED0-F37AEDD82FF6>         /usr/lib/swift/libswiftObjectiveC.dylib
        0x7ff90fcf1000 -     0x7ff910b90fff  com.apple.SwiftUI 3.5.2 (3.5.2)                    <4270A4C3-E15F-3953-8F17-ABB3B351219F>         /System/Library/Frameworks/SwiftUI.framework/Versions/A/SwiftUI
        0x7ff910b91000 -     0x7ff910bc7fff  com.apple.AttributeGraph 3.2.1 (3.2.1)             <E9337C46-2775-39DC-AE3D-14CCF80D629F>         /System/Library/PrivateFrameworks/AttributeGraph.framework/Versions/A/AttributeGraph
        0x7ffb1dc29000 -     0x7ffb1dc68fff  libswift_Concurrency.dylib (5.6.0.323.35)          <01D2F741-2F1E-33C9-9B51-ABB5C07E6914>         /usr/lib/swift/libswift_Concurrency.dylib
   *0xffffff8000100000 - 0xffffff800019ffff  kernel (8020.240.18.709.2)                         <AAF3C70C-3331-335A-96FB-D338CFE178F0>__HIB    /System/Library/Kernels/kernel
   *0xffffff8000210000 - 0xffffff8000c0ffff  kernel (8020.240.18.709.2)                         <AAF3C70C-3331-335A-96FB-D338CFE178F0>__TEXT   /System/Library/Kernels/kernel
   *0xffffff800350e000 - 0xffffff800369ffff  com.apple.filesystems.apfs 1934.141.2 (1934.141.2) <64862B54-9509-39A8-9C32-5FAD0713ED61>         /System/Library/Extensions/apfs.kext/Contents/MacOS/apfs
   *0xffffff800376a000 - 0xffffff8003771fff  com.apple.kec.pthread 1.0 (1)                      <92617A12-391A-3204-B426-E85ACA975B7D>         /System/Library/Extensions/pthread.kext/Contents/MacOS/pthread


Process:          accountsd [407]
UUID:             C1340540-1B9D-398A-819F-6C3B7F23DE45
Path:             /System/Library/Frameworks/Accounts.framework/Versions/A/Support/accountsd
Codesigning ID:   com.apple.accountsd
Shared Cache:     246818C3-4B9F-3462-BCAF-FDF71975E5FE slid base address 0x7ff804432000, slide 0x4432000
Architecture:     x86_64
Parent:           launchd [1]
UID:              501
Sudden Term:      Tracked (allows idle exit)
Footprint:        5716 KB
Time Since Fork:  31676s
Num samples:      49 (1-49)
Note:             1 idle work queue thread omitted

  Thread 0xa79    DispatchQueue "com.apple.main-thread"(1)    49 samples (1-49)    priority 4 (base 4)
  <thread QoS background (requested default), process sudden termination clean, thread darwinbg, process darwinbg, IO tier 2>
  49  start + 462 (dyld + 21806) [0x11a7f852e] 1-49
    49  ??? (accountsd + 13165) [0x10af5636d] 1-49
      49  -[NSRunLoop(NSRunLoop) run] + 76 (Foundation + 959911) [0x7ff8057025a7] 1-49
        49  -[NSRunLoop(NSRunLoop) runMode:beforeDate:] + 216 (Foundation + 392026) [0x7ff805677b5a] 1-49
          49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c] 1-49
            49  __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 1-49
              49  __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 1-49
                49  <patched truncated backtrace> 1-49
                  49  mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 1-49
                   *49  ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 1-49

  Binary Images:
           0x10af53000 -        0x10af5efff  accountsd (863)                            <C1340540-1B9D-398A-819F-6C3B7F23DE45>  /System/Library/Frameworks/Accounts.framework/Versions/A/Support/accountsd
           0x11a7f3000 -        0x11a876fff  dyld (960)                                 <EEA022BB-A6AB-3CD1-8AC1-54CE8CFD3333>  /usr/lib/dyld
        0x7ff804716000 -     0x7ff80474dfff  libsystem_kernel.dylib (8020.240.18.709.2) <2FE67E94-4A5E-3506-9E02-502F7270F7EF>  /usr/lib/system/libsystem_kernel.dylib
        0x7ff80479b000 -     0x7ff804c9dfff  com.apple.CoreFoundation 6.9 (1866)        <FDD28505-5456-3C40-A5BA-7890B064DB39>  /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
        0x7ff805618000 -     0x7ff8059d4fff  com.apple.Foundation 6.9 (1866)            <61133096-D5F9-34BD-94B1-1E526EA018B1>  /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
   *0xffffff8000210000 - 0xffffff8000c0ffff  kernel (8020.240.18.709.2)                 <AAF3C70C-3331-335A-96FB-D338CFE178F0>  /System/Library/Kernels/kernel


Process:          adid [422]
UUID:             EEE799AA-AEAB-3BF1-AC79-C58000DAAC3A
Path:             /System/Library/PrivateFrameworks/CoreADI.framework/Versions/A/adid
Codesigning ID:   com.apple.adid
Shared Cache:     246818C3-4B9F-3462-BCAF-FDF71975E5FE slid base address 0x7ff804432000, slide 0x4432000
Architecture:     x86_64
Parent:           launchd [1]
UID:              265
Sudden Term:      Tracked (allows idle exit)
Footprint:        792 KB
Time Since Fork:  31675s
Num samples:      49 (1-49)
Note:             1 idle work queue thread omitted

  Thread 0xafb    49 samples (1-49)    priority 4 (base 4)
  <thread QoS background (requested default), process sudden termination clean, thread darwinbg, process darwinbg, IO tier 2>
  49  start + 462 (dyld + 21806) [0x10957252e] 1-49
    49  ??? (adid + 535708) [0x10044dc9c] 1-49
      49  CFRunLoopRun + 40 (CoreFoundation + 1072427) [0x7ff8048a0d2b] 1-49
        49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c] 1-49
          49  __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 1-49
            49  __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 1-49
              49  <patched truncated backtrace> 1-49
                49  mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 1-49
                 *49  ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 1-49

  Binary Images:
           0x1003cb000 -        0x100596fff  adid (6)                                   <EEE799AA-AEAB-3BF1-AC79-C58000DAAC3A>  /System/Library/PrivateFrameworks/CoreADI.framework/Versions/A/adid
           0x10956d000 -        0x1095f0fff  dyld (960)                                 <EEA022BB-A6AB-3CD1-8AC1-54CE8CFD3333>  /usr/lib/dyld
        0x7ff804716000 -     0x7ff80474dfff  libsystem_kernel.dylib (8020.240.18.709.2) <2FE67E94-4A5E-3506-9E02-502F7270F7EF>  /usr/lib/system/libsystem_kernel.dylib
        0x7ff80479b000 -     0x7ff804c9dfff  com.apple.CoreFoundation 6.9 (1866)        <FDD28505-5456-3C40-A5BA-7890B064DB39>  /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
   *0xffffff8000210000 - 0xffffff8000c0ffff  kernel (8020.240.18.709.2)                 <AAF3C70C-3331-335A-96FB-D338CFE178F0>  /System/Library/Kernels/kernel


Process:          adprivacyd [532]
UUID:             8570D105-5CD8-3A65-8D7A-332C2DD53D77
Path:             /usr/libexec/adprivacyd
Shared Cache:     246818C3-4B9F-3462-BCAF-FDF71975E5FE slid base address 0x7ff804432000, slide 0x4432000
Architecture:     x86_64
Parent:           launchd [1]
UID:              501
Sudden Term:      Tracked (allows idle exit)
Footprint:        3416 KB
Time Since Fork:  31663s
Num samples:      49 (1-49)
CPU Time:         <0.001s (324.1K cycles, 109.6K instructions, 2.96c/i)
Note:             1 idle work queue thread omitted

  Thread 0xfd0    49 samples (1-49)    priority 4 (base 4)
  <thread QoS background (requested default), process sudden termination clean, thread darwinbg, process darwinbg, IO tier 2>
  49  _dispatch_sig_thread + 49 (libdispatch.dylib + 83959) [0x7ff8045ad7f7] 1-49
    49  <patched truncated backtrace> 1-49
      49  __sigsuspend_nocancel + 10 (libsystem_kernel.dylib + 29074) [0x7ff80471d192] 1-49
       *49  ??? (kernel + 6637776) [0xffffff80008648d0] 1-49

  Thread 0x1238    Thread name "com.apple.NSURLConnectionLoader"    49 samples (1-49)    priority 4 (base 4)
  <thread QoS background (requested default), process sudden termination clean, thread darwinbg, process darwinbg, IO tier 2>
  49  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 1-49
    49  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 1-49
      49  __NSThread__start__ + 1009 (Foundation + 362276) [0x7ff805670724] 1-49
        49  ??? (CFNetwork + 2394468) [0x7ff809447964] 1-49
          49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c] 1-49
            49  __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 1-49
              49  __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 1-49
                49  <patched truncated backtrace> 1-49
                  49  mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 1-49
                   *49  ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 1-49

  Binary Images:
           0x109c01000 -                ???  adprivacyd                                 <8570D105-5CD8-3A65-8D7A-332C2DD53D77>  /usr/libexec/adprivacyd
        0x7ff804599000 -     0x7ff8045dffff  libdispatch.dylib (1325.120.2)             <37860D89-D337-3140-8973-AC199ACBC361>  /usr/lib/system/libdispatch.dylib
        0x7ff804716000 -     0x7ff80474dfff  libsystem_kernel.dylib (8020.240.18.709.2) <2FE67E94-4A5E-3506-9E02-502F7270F7EF>  /usr/lib/system/libsystem_kernel.dylib
        0x7ff80474e000 -     0x7ff804759fff  libsystem_pthread.dylib (486.100.11.701.1) <5A5F7316-85B7-315E-BAF3-76211EE65604>  /usr/lib/system/libsystem_pthread.dylib
        0x7ff80479b000 -     0x7ff804c9dfff  com.apple.CoreFoundation 6.9 (1866)        <FDD28505-5456-3C40-A5BA-7890B064DB39>  /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
        0x7ff805618000 -     0x7ff8059d4fff  com.apple.Foundation 6.9 (1866)            <61133096-D5F9-34BD-94B1-1E526EA018B1>  /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
        0x7ff8091ff000 -     0x7ff80968dfff  com.apple.CFNetwork 1335.5 (1335.5)        <1498EC5D-CBE9-352B-8B10-030E042445C5>  /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
   *0xffffff8000210000 - 0xffffff8000c0ffff  kernel (8020.240.18.709.2)                 <AAF3C70C-3331-335A-96FB-D338CFE178F0>  /System/Library/Kernels/kernel


Process:          AirPlayUIAgent [449]
UUID:             5183869C-CA28-3490-B3A9-76A582B97776
Path:             /System/Library/CoreServices/AirPlayUIAgent.app/Contents/MacOS/AirPlayUIAgent
Identifier:       com.apple.AirPlayUIAgent
Version:          2.0 (620.8.2)
Build Version:    131
Project Name:     AirPlay
Source Version:   620008002000000
Shared Cache:     246818C3-4B9F-3462-BCAF-FDF71975E5FE slid base address 0x7ff804432000, slide 0x4432000
Architecture:     x86_64
Parent:           launchd [1]
UID:              501
Sudden Term:      Tracked
Footprint:        3188 KB
Time Since Fork:  31673s
Num samples:      49 (1-49)
Note:             1 idle work queue thread omitted

  Thread 0xbc6    49 samples (1-49)    priority 46 (base 46)
  <thread QoS user interactive (requested user interactive), process sudden termination clean, IO tier 0>
  49  start + 462 (dyld + 21806) [0x11029052e] 1-49
    49  NSApplicationMain + 817 (AppKit + 14234) [0x7ff80721c79a] 1-49
      49  -[NSApplication run] + 586 (AppKit + 194584) [0x7ff807248818] 1-49
        49  -[NSApplication(NSEvent) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1394 (AppKit + 250214) [0x7ff807256166] 1-49
          49  _DPSNextEvent + 927 (AppKit + 256681) [0x7ff807257aa9] 1-49
            49  _BlockUntilNextEventMatchingListInModeWithFilter + 70 (HIToolbox + 188645) [0x7ff80d4cb0e5] 1-49
              49  ReceiveNextEventCommon + 594 (HIToolbox + 189258) [0x7ff80d4cb34a] 1-49
                49  RunCurrentEventLoopInMode + 292 (HIToolbox + 189926) [0x7ff80d4cb5e6] 1-49
                  49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c] 1-49
                    49  __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 1-49
                      49  __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 1-49
                        49  <patched truncated backtrace> 1-49
                          49  mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 1-49
                           *49  ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 1-49

  Thread 0xbed    Thread name "com.apple.NSEventThread"    49 samples (1-49)    priority 46 (base 46)
  <thread QoS user interactive (requested user interactive), process sudden termination clean, IO tier 0>
  49  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 1-49
    49  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 1-49
      49  _NSEventThread + 132 (AppKit + 1754482) [0x7ff8073c5572] 1-49
        49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c] 1-49
          49  __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 1-49
            49  __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 1-49
              49  <patched truncated backtrace> 1-49
                49  mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 1-49
                 *49  ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 1-49

  Binary Images:
           0x104f4c000 -        0x104f5ffff  com.apple.AirPlayUIAgent 2.0 (620.8.2)     <5183869C-CA28-3490-B3A9-76A582B97776>  /System/Library/CoreServices/AirPlayUIAgent.app/Contents/MacOS/AirPlayUIAgent
           0x11028b000 -        0x11030efff  dyld (960)                                 <EEA022BB-A6AB-3CD1-8AC1-54CE8CFD3333>  /usr/lib/dyld
        0x7ff804716000 -     0x7ff80474dfff  libsystem_kernel.dylib (8020.240.18.709.2) <2FE67E94-4A5E-3506-9E02-502F7270F7EF>  /usr/lib/system/libsystem_kernel.dylib
        0x7ff80474e000 -     0x7ff804759fff  libsystem_pthread.dylib (486.100.11.701.1) <5A5F7316-85B7-315E-BAF3-76211EE65604>  /usr/lib/system/libsystem_pthread.dylib
        0x7ff80479b000 -     0x7ff804c9dfff  com.apple.CoreFoundation 6.9 (1866)        <FDD28505-5456-3C40-A5BA-7890B064DB39>  /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
        0x7ff807219000 -     0x7ff8080a8fff  com.apple.AppKit 6.9 (2113.65.150)         <5DD484CF-ED6A-3633-B42E-6518AEECD5B9>  /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
        0x7ff80d49d000 -     0x7ff80d790fff  com.apple.HIToolbox 2.1.1 (1114.1)         <913D3D2E-4E4C-3907-98FE-8F4ABD551297>  /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
   *0xffffff8000210000 - 0xffffff8000c0ffff  kernel (8020.240.18.709.2)                 <AAF3C70C-3331-335A-96FB-D338CFE178F0>  /System/Library/Kernels/kernel


Process:          AirPlayXPCHelper [153]
UUID:             4271DEBC-1FCB-3A2F-8911-75066128352F
Path:             /usr/libexec/AirPlayXPCHelper
Shared Cache:     246818C3-4B9F-3462-BCAF-FDF71975E5FE slid base address 0x7ff804432000, slide 0x4432000
Architecture:     x86_64
Parent:           launchd [1]
UID:              0
Footprint:        1584 KB
Time Since Fork:  31711s
Num samples:      49 (1-49)
Note:             1 idle work queue thread omitted

  Thread 0x415    Thread name "AMCP Logging Spool"    49 samples (1-49)    priority 19 (base 19)
  <thread QoS utility (requested utility), IO tier 1>
  49  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 1-49
    49  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 1-49
      49  void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*) + 41 (caulk + 7692) [0x7ff80d23fe0c] 1-49
        49  caulk::concurrent::details::worker_thread::run() + 36 (caulk + 8520) [0x7ff80d240148] 1-49
          49  <patched truncated backtrace> 1-49
            49  semaphore_wait_trap + 10 (libsystem_kernel.dylib + 6518) [0x7ff804717976] 1-49
             *49  ??? (kernel + 663488) [0xffffff80002b1fc0] 1-49

  Thread 0x508    49 samples (1-49)    priority 55 (base 55)
  <IO tier 0>
  49  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 1-49
    49  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 1-49
      49  void* caulk::thread_proxy<std::__1::tuple<caulk::thread::attributes, void (caulk::concurrent::details::worker_thread::*)(), std::__1::tuple<caulk::concurrent::details::worker_thread*> > >(void*) + 41 (caulk + 7692) [0x7ff80d23fe0c] 1-49
        49  caulk::concurrent::details::worker_thread::run() + 36 (caulk + 8520) [0x7ff80d240148] 1-49
          49  <patched truncated backtrace> 1-49
            49  semaphore_wait_trap + 10 (libsystem_kernel.dylib + 6518) [0x7ff804717976] 1-49
             *49  ??? (kernel + 663488) [0xffffff80002b1fc0] 1-49

  Thread 0x50a    49 samples (1-49)    priority 31 (base 31)
  <thread QoS default (requested default), IO tier 0>
  49  _dispatch_sig_thread + 49 (libdispatch.dylib + 83959) [0x7ff8045ad7f7] 1-49
    49  <patched truncated backtrace> 1-49
      49  __sigsuspend_nocancel + 10 (libsystem_kernel.dylib + 29074) [0x7ff80471d192] 1-49
       *49  ??? (kernel + 6637776) [0xffffff80008648d0] 1-49

  Binary Images:
           0x10a5ee000 -                ???  AirPlayXPCHelper                           <4271DEBC-1FCB-3A2F-8911-75066128352F>  /usr/libexec/AirPlayXPCHelper
        0x7ff804599000 -     0x7ff8045dffff  libdispatch.dylib (1325.120.2)             <37860D89-D337-3140-8973-AC199ACBC361>  /usr/lib/system/libdispatch.dylib
        0x7ff804716000 -     0x7ff80474dfff  libsystem_kernel.dylib (8020.240.18.709.2) <2FE67E94-4A5E-3506-9E02-502F7270F7EF>  /usr/lib/system/libsystem_kernel.dylib
        0x7ff80474e000 -     0x7ff804759fff  libsystem_pthread.dylib (486.100.11.701.1) <5A5F7316-85B7-315E-BAF3-76211EE65604>  /usr/lib/system/libsystem_pthread.dylib
        0x7ff80d23e000 -     0x7ff80d25ffff  com.apple.audio.caulk 1.0 (92)             <F04B5C91-D0EC-33C6-8A81-B80A3EBF827F>  /System/Library/PrivateFrameworks/caulk.framework/Versions/A/caulk
   *0xffffff8000210000 - 0xffffff8000c0ffff  kernel (8020.240.18.709.2)                 <AAF3C70C-3331-335A-96FB-D338CFE178F0>  /System/Library/Kernels/kernel


Process:          airportd [207]
UUID:             B6B87295-480A-3924-89DB-CC6B5EA2E44F
Path:             /usr/libexec/airportd
Codesigning ID:   com.apple.airport.airportd
Shared Cache:     246818C3-4B9F-3462-BCAF-FDF71975E5FE slid base address 0x7ff804432000, slide 0x4432000
Architecture:     x86_64
Parent:           launchd [1]
UID:              0
Sudden Term:      Tracked
Footprint:        10.14 MB
Pageins:          3 pages
Time Since Fork:  31709s
Num samples:      49 (1-49)
CPU Time:         0.011s (29.8M cycles, 23.5M instructions, 1.27c/i)
Note:             6 idle work queue threads omitted

  Thread 0x3f5    DispatchQueue "com.apple.main-thread"(1)    49 samples (1-49)    priority 31 (base 31)    cpu time 0.002s (4.7M cycles, 1574.7K instructions, 2.99c/i)
  <thread QoS default (requested default), process sudden termination dirty, process unclamped, process received importance donation from AirPlayXPCHelper [153], process received importance donation from WiFiAgent [473], IO tier 0>
  49  start + 462 (dyld + 21806) [0x105ce852e] 1-49
    49  ??? (airportd + 490548) [0x1030c3c34] 1-49
      49  -[NSRunLoop(NSRunLoop) run] + 76 (Foundation + 959911) [0x7ff8057025a7] 1-49
        49  -[NSRunLoop(NSRunLoop) runMode:beforeDate:] + 216 (Foundation + 392026) [0x7ff805677b5a] 1-49
          49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c] 1-49
            49  __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 1-49
              49  __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 1-49
                49  mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 1-49
                 *49  ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 1-49

  Thread 0x76e    DispatchQueue "com.apple.wifi.temp_log"(141)    49 samples (1-49)    priority 31 (base 31)    cpu time <0.001s (1044.5K cycles, 332.1K instructions, 3.14c/i)
  <thread QoS default (requested default), process sudden termination dirty, process unclamped, process received importance donation from AirPlayXPCHelper [153], process received importance donation from WiFiAgent [473], IO tier 0>
  49  start_wqthread + 15 (libsystem_pthread.dylib + 8023) [0x7ff80474ff57] 1-49
    49  _pthread_wqthread + 326 (libsystem_pthread.dylib + 12240) [0x7ff804750fd0] 1-49
      49  _dispatch_workloop_worker_thread + 753 (libdispatch.dylib + 81646) [0x7ff8045aceee] 1-49
        49  _dispatch_lane_invoke + 417 (libdispatch.dylib + 40496) [0x7ff8045a2e30] 1-49
          49  _dispatch_lane_serial_drain + 672 (libdispatch.dylib + 37655) [0x7ff8045a2317] 1-49
            49  _dispatch_client_callout + 8 (libdispatch.dylib + 13079) [0x7ff80459c317] 1-49
              49  _dispatch_call_block_and_release + 12 (libdispatch.dylib + 8396) [0x7ff80459b0cc] 1-49
                49  <patched truncated backtrace> 1-49
                  49  ??? (airportd + 621872) [0x1030e3d30] 1-49
                    49  CFReadStreamRead + 248 (CoreFoundation + 754392) [0x7ff8048532d8] 1-49
                      49  fileRead + 45 (CoreFoundation + 851832) [0x7ff80486af78] 1-49
                        49  read + 10 (libsystem_kernel.dylib + 9082) [0x7ff80471837a] 1-49
                         *49  hndl_unix_scall64 + 22 (kernel + 41558) [0xffffff800021a256] 1-49
                           *49  unix_syscall64 + 507 (kernel + 7826251) [0xffffff8000986b4b] 1-49
                             *49  read + 160 (kernel + 6760976) [0xffffff8000882a10] 1-49
                               *49  ??? (kernel + 6761522) [0xffffff8000882c32] 1-49
                                 *49  ??? (kernel + 3381280) [0xffffff8000549820] 1-49
                                   *49  ??? (kernel + 3386034) [0xffffff800054aab2] 1-49
                                     *49  spec_read + 886 (kernel + 3493782) [0xffffff8000564f96] 1-49
                                       *49  cdev_read + 357 (IO80211FamilyLegacy + 770710) [0xffffff80020fa296] 1-49
                                         *49  thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 1-49
                                           *49  ??? (kernel + 607154) [0xffffff80002a43b2] 1-49
                                             *49  machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 1-49

  Thread 0x762    49 samples (1-49)    priority 31 (base 31)
  <thread QoS default (requested default), process sudden termination dirty, process unclamped, process received importance donation from AirPlayXPCHelper [153], process received importance donation from WiFiAgent [473], IO tier 0>
  49  start_wqthread + 15 (libsystem_pthread.dylib + 8023) [0x7ff80474ff57] 1-49
    49  _pthread_wqthread + 326 (libsystem_pthread.dylib + 12240) [0x7ff804750fd0] 1-49
      49  _dispatch_workloop_worker_thread + 753 (libdispatch.dylib + 81646) [0x7ff8045aceee] 1-49
        49  _dispatch_lane_invoke + 417 (libdispatch.dylib + 40496) [0x7ff8045a2e30] 1-49
          49  _dispatch_lane_serial_drain + 672 (libdispatch.dylib + 37655) [0x7ff8045a2317] 1-49
            49  _dispatch_client_callout + 8 (libdispatch.dylib + 13079) [0x7ff80459c317] 1-49
              49  _dispatch_call_block_and_release + 12 (libdispatch.dylib + 8396) [0x7ff80459b0cc] 1-49
                49  ??? (airportd + 620474) [0x1030e37ba] 1-49
                  49  CFReadStreamRead + 248 (CoreFoundation + 754392) [0x7ff8048532d8] 1-49
                    49  fileRead + 45 (CoreFoundation + 851832) [0x7ff80486af78] 1-49
                      49  <patched truncated backtrace> 1-49
                        49  read + 10 (libsystem_kernel.dylib + 9082) [0x7ff80471837a] 1-49
                         *49  hndl_unix_scall64 + 22 (kernel + 41558) [0xffffff800021a256] 1-49
                           *49  unix_syscall64 + 507 (kernel + 7826251) [0xffffff8000986b4b] 1-49
                             *49  read + 160 (kernel + 6760976) [0xffffff8000882a10] 1-49
                               *49  ??? (kernel + 6761522) [0xffffff8000882c32] 1-49
                                 *49  ??? (kernel + 3381280) [0xffffff8000549820] 1-49
                                   *49  ??? (kernel + 3386034) [0xffffff800054aab2] 1-49
                                     *49  spec_read + 886 (kernel + 3493782) [0xffffff8000564f96] 1-49
                                       *49  cdev_read + 357 (IO80211FamilyLegacy + 770710) [0xffffff80020fa296] 1-49
                                         *49  thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 1-49
                                           *49  ??? (kernel + 607154) [0xffffff80002a43b2] 1-49
                                             *49  machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 1-49

  Thread 0x76b    Thread name "com.apple.CFSocket.private"    49 samples (1-49)    priority 31 (base 31)
  <thread QoS default (requested default), process sudden termination dirty, process unclamped, process received importance donation from AirPlayXPCHelper [153], process received importance donation from WiFiAgent [473], IO tier 0>
  49  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 1-49
    49  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 1-49
      49  __select + 10 (libsystem_kernel.dylib + 40218) [0x7ff80471fd1a] 1-49
       *49  ??? (kernel + 6637776) [0xffffff80008648d0] 1-49

  Thread 0x76c    49 samples (1-49)    priority 31 (base 31)
  <thread QoS default (requested default), process sudden termination dirty, process unclamped, process received importance donation from AirPlayXPCHelper [153], process received importance donation from WiFiAgent [473], IO tier 0>
  49  start_wqthread + 15 (libsystem_pthread.dylib + 8023) [0x7ff80474ff57] 1-49
    49  _pthread_wqthread + 326 (libsystem_pthread.dylib + 12240) [0x7ff804750fd0] 1-49
      49  _dispatch_workloop_worker_thread + 753 (libdispatch.dylib + 81646) [0x7ff8045aceee] 1-49
        49  _dispatch_lane_invoke + 417 (libdispatch.dylib + 40496) [0x7ff8045a2e30] 1-49
          49  _dispatch_lane_serial_drain + 672 (libdispatch.dylib + 37655) [0x7ff8045a2317] 1-49
            49  _dispatch_client_callout + 8 (libdispatch.dylib + 13079) [0x7ff80459c317] 1-49
              49  _dispatch_call_block_and_release + 12 (libdispatch.dylib + 8396) [0x7ff80459b0cc] 1-49
                49  ??? (airportd + 620873) [0x1030e3949] 1-49
                  49  CFReadStreamRead + 248 (CoreFoundation + 754392) [0x7ff8048532d8] 1-49
                    49  fileRead + 45 (CoreFoundation + 851832) [0x7ff80486af78] 1-49
                      49  <patched truncated backtrace> 1-49
                        49  read + 10 (libsystem_kernel.dylib + 9082) [0x7ff80471837a] 1-49
                         *49  hndl_unix_scall64 + 22 (kernel + 41558) [0xffffff800021a256] 1-49
                           *49  unix_syscall64 + 507 (kernel + 7826251) [0xffffff8000986b4b] 1-49
                             *49  read + 160 (kernel + 6760976) [0xffffff8000882a10] 1-49
                               *49  ??? (kernel + 6761522) [0xffffff8000882c32] 1-49
                                 *49  ??? (kernel + 3381280) [0xffffff8000549820] 1-49
                                   *49  ??? (kernel + 3386034) [0xffffff800054aab2] 1-49
                                     *49  spec_read + 886 (kernel + 3493782) [0xffffff8000564f96] 1-49
                                       *49  cdev_read + 357 (IO80211FamilyLegacy + 770710) [0xffffff80020fa296] 1-49
                                         *49  thread_block_reason + 199 (kernel + 598343) [0xffffff80002a2147] 1-49
                                           *49  ??? (kernel + 607154) [0xffffff80002a43b2] 1-49
                                             *49  machine_switch_context + 219 (kernel + 1790411) [0xffffff80003c51cb] 1-49

  Binary Images:
           0x10304c000 -        0x103293fff  airportd (1817.1)                                      <B6B87295-480A-3924-89DB-CC6B5EA2E44F>  /usr/libexec/airportd
           0x105ce3000 -        0x105d66fff  dyld (960)                                             <EEA022BB-A6AB-3CD1-8AC1-54CE8CFD3333>  /usr/lib/dyld
        0x7ff804599000 -     0x7ff8045dffff  libdispatch.dylib (1325.120.2)                         <37860D89-D337-3140-8973-AC199ACBC361>  /usr/lib/system/libdispatch.dylib
        0x7ff804716000 -     0x7ff80474dfff  libsystem_kernel.dylib (8020.240.18.709.2)             <2FE67E94-4A5E-3506-9E02-502F7270F7EF>  /usr/lib/system/libsystem_kernel.dylib
        0x7ff80474e000 -     0x7ff804759fff  libsystem_pthread.dylib (486.100.11.701.1)             <5A5F7316-85B7-315E-BAF3-76211EE65604>  /usr/lib/system/libsystem_pthread.dylib
        0x7ff80479b000 -     0x7ff804c9dfff  com.apple.CoreFoundation 6.9 (1866)                    <FDD28505-5456-3C40-A5BA-7890B064DB39>  /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
        0x7ff805618000 -     0x7ff8059d4fff  com.apple.Foundation 6.9 (1866)                        <61133096-D5F9-34BD-94B1-1E526EA018B1>  /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
   *0xffffff8000210000 - 0xffffff8000c0ffff  kernel (8020.240.18.709.2)                             <AAF3C70C-3331-335A-96FB-D338CFE178F0>  /System/Library/Kernels/kernel
   *0xffffff800203e000 - 0xffffff800219efff  com.apple.iokit.IO80211FamilyLegacy 12.0 (1200.12.2b1) <195DD638-5F27-3347-BF5B-98C3CE654A96>  /System/Library/Extensions/IO80211FamilyLegacy.kext/Contents/MacOS/IO80211FamilyLegacy


Process:          akd [416]
UUID:             1EFE8384-8CC5-3EAE-B437-A3EF2B92E0C8
Path:             /System/Library/PrivateFrameworks/AuthKit.framework/Versions/A/Support/akd
Codesigning ID:   com.apple.akd
Shared Cache:     246818C3-4B9F-3462-BCAF-FDF71975E5FE slid base address 0x7ff804432000, slide 0x4432000
Architecture:     x86_64
Parent:           launchd [1]
UID:              501
Sudden Term:      Tracked (allows idle exit)
Footprint:        3800 KB
Time Since Fork:  31675s
Num samples:      49 (1-49)
Note:             1 idle work queue thread omitted

  Thread 0xac6    49 samples (1-49)    priority 4 (base 4)
  <thread QoS background (requested default), process sudden termination clean, thread darwinbg, process darwinbg, IO tier 2>
  49  start + 462 (dyld + 21806) [0x10c9ee52e] 1-49
    49  ??? (akd + 224011) [0x103efab0b] 1-49
      49  -[NSRunLoop(NSRunLoop) run] + 76 (Foundation + 959911) [0x7ff8057025a7] 1-49
        49  -[NSRunLoop(NSRunLoop) runMode:beforeDate:] + 216 (Foundation + 392026) [0x7ff805677b5a] 1-49
          49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c] 1-49
            49  __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 1-49
              49  __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 1-49
                49  <patched truncated backtrace> 1-49
                  49  mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 1-49
                   *49  ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 1-49

  Thread 0xf46    Thread name "com.apple.NSURLConnectionLoader"    49 samples (1-49)    priority 4 (base 4)
  <thread QoS background (requested default), process sudden termination clean, thread darwinbg, process darwinbg, IO tier 2>
  49  thread_start + 15 (libsystem_pthread.dylib + 8043) [0x7ff80474ff6b] 1-49
    49  _pthread_start + 125 (libsystem_pthread.dylib + 25825) [0x7ff8047544e1] 1-49
      49  __NSThread__start__ + 1009 (Foundation + 362276) [0x7ff805670724] 1-49
        49  ??? (CFNetwork + 2394468) [0x7ff809447964] 1-49
          49  CFRunLoopRunSpecific + 562 (CoreFoundation + 515436) [0x7ff804818d6c] 1-49
            49  __CFRunLoopRun + 1276 (CoreFoundation + 518440) [0x7ff804819928] 1-49
              49  __CFRunLoopServiceMachPort + 319 (CoreFoundation + 524957) [0x7ff80481b29d] 1-49
                49  <patched truncated backtrace> 1-49
                  49  mach_msg_trap + 10 (libsystem_kernel.dylib + 6458) [0x7ff80471793a] 1-49
                   *49  ipc_mqueue_receive_continue + 0 (kernel + 301584) [0xffffff8000259a10] 1-49

  Binary Images:
           0x103ec4000 -        0x104007fff  akd (408.1.0.14)                           <1EFE8384-8CC5-3EAE-B437-A3EF2B92E0C8>  /System/Library/PrivateFrameworks/AuthKit.framework/Versions/A/Support/akd
           0x10c9e9000 -        0x10ca6cfff  dyld (960)                                 <EEA022BB-A6AB-3CD1-8AC1-54CE8CFD3333>  /usr/lib/dyld
        0x7ff804716000 -     0x7ff80474dfff  libsystem_kernel.dylib (8020.240.18.709.2) <2FE67E94-4A5E-3506-9E02-502F7270F7EF>  /usr/lib/system/libsystem_kernel.dylib
        0x7ff80474e000 -     0x7ff804759fff  libsystem_pthread.dylib (486.100.11.701.1) <5A5F7316-85B7-315E-BAF3-76211EE65604>  /usr/lib/system/libsystem_pthread.dylib
        0x7ff80479b000 -     0x7ff804c9dfff  com.apple.CoreFoundation 6.9 (1866)        <FDD28505-5456-3C40-A5BA-7890B064DB39>  /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
        0x7ff805618000 -     0x7ff8059d4fff  com.apple.Foundation 6.9 (1866)            <61133096-D5F9-34BD-94B1-1E526EA018B1>  /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
        0x7ff8091ff000 -     0x7ff80968dfff  com.apple.CFNetwork 1335.5 (1335.5)        <1498EC5D-CBE9-352B-8B10-030E042445C5>  /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
   *0xffffff8000210000 - 0xffffff8000c0ffff  kernel (8020.240.18.709.2)                 <AAF3C70C-3331-335A-96FB-D338CFE178F0>  /System/Library/Kernels/kernel


Process:          amfid [201]
UUID:             ECE7CAD3-12E2-32F3-BA91-34F24B1AC493
Path:             /usr/libexec/amfid

