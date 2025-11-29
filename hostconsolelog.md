default	15:51:30.010520-0500	runningboardd	Assertion did invalidate due to timeout: 174-140-1868 (target:[anon<RedLemon>(501):8572])
default	15:51:30.123435-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:30.123486-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:30.123562-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:31.042128-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "frontmost:8572" ID:174-140-1880 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	15:51:31.045741-0500	runningboardd	Assertion 174-140-1880 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:31.070660-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "notification:8572" ID:174-140-1881 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	15:51:31.070837-0500	runningboardd	Assertion 174-140-1881 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:31.071098-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:31.071146-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:31.076838-0500	runningboardd	[anon<RedLemon>(501):8572] Set darwin role to: UserInteractiveFocal
default	15:51:31.078950-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:31.079809-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:31.081175-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:31.081281-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:31.565054-0500	RedLemon	tcp_input [C6.1.1:3] flags=[F.] seq=780864107, ack=2604900584, win=8 state=ESTABLISHED rcv_nxt=780864107, snd_una=2604900584
default	15:51:31.565120-0500	RedLemon	nw_protocol_tcp_log_summary [C6.1.1:3]
	[48D39400-772E-4D59-9D51-28104D1D5B1A <private>:60081<-><private>:443]
	Init: 1, Conn_Time: 14.135ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/1, TS: 1
	rtt_cache: process, rtt_upd: 7, rtt: 31.937ms, rtt_var: 19.875ms rtt_nc: 28.156ms, rtt_var_nc: 21.062ms base rtt: 11ms
	ACKs-compressed: 0, ACKs delayed: 257 delayed ACKs sent: 0
default	15:51:31.566226-0500	RedLemon	Connection 6: read-side closed
default	15:51:31.566270-0500	RedLemon	Connection 6: read-side closed
default	15:51:31.566303-0500	RedLemon	Connection 6: read-side closed
default	15:51:31.566644-0500	RedLemon	Connection 6: cleaning up
default	15:51:31.566796-0500	RedLemon	[C6 0E663BE7-E4E0-49BC-BF39-A988E198F6B1 Hostname#204e95ef:443 quic-connection, url hash: a51a5177, definite, attribution: developer] cancel
default	15:51:31.566962-0500	RedLemon	[C6 0E663BE7-E4E0-49BC-BF39-A988E198F6B1 Hostname#204e95ef:443 quic-connection, url hash: a51a5177, definite, attribution: developer] cancelled
	[C6.1.1 0670C083-31A9-4E01-8F94-1A474E628664 2607:fea8:995b:fd00:e143:eb11:f54f:69d1.60081<->IPv6#29739f0d.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 15.312s, DNS @0.000s took 0.055s, TCP @0.056s took 0.014s, TLS 1.3 took 0.033s
	bytes in/out: 2002971/1095, packets in/out: 304/194, rtt: 0.031s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:51:31.567450-0500	RedLemon	nw_flow_disconnected [C6.1.1 IPv6#29739f0d.443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:51:31.567641-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C6] reporting state cancelled
default	15:51:31.568072-0500	RedLemon	tcp_output [C6.1.1:3] flags=[FP.] seq=2604900623, ack=780864108, win=57360 state=LAST_ACK rcv_nxt=780864108, snd_una=2604900584
error	15:51:31.585201-0500	RedLemon	tcp_input [C6.1.1:3] flags=[R.] seq=780864108, ack=2604900623, win=8 state=LAST_ACK rcv_nxt=780864108, snd_una=2604900584
error	15:51:31.585736-0500	RedLemon	tcp_input [C6.1.1:3] flags=[R] seq=780864108, ack=0, win=0 state=CLOSED rcv_nxt=780864108, snd_una=2604900584
error	15:51:31.586700-0500	RedLemon	tcp_input [C6.1.1:3] flags=[R] seq=780864108, ack=0, win=0 state=CLOSED rcv_nxt=780864108, snd_una=2604900584
default	15:51:32.324655-0500	RedLemon	🎬 Creating Watch Party for: Frankenstein
default	15:51:32.325198-0500	RedLemon	   Type: movie (No Season/Episode)
default	15:51:32.326797-0500	RedLemon	   Quality: 1080p
default	15:51:32.327630-0500	RedLemon	Task <55EFB44B-C69E-4FBE-8D97-6B045D116117>.<136> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:32.328090-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5B5484EA-2B57-45D5-A87E-BF63FF39D697] (reporting strategy default)> on Task <55EFB44B-C69E-4FBE-8D97-6B045D116117>.<136> was not selected for reporting
default	15:51:32.329348-0500	RedLemon	Task <55EFB44B-C69E-4FBE-8D97-6B045D116117>.<136> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:32.329698-0500	RedLemon	Task <55EFB44B-C69E-4FBE-8D97-6B045D116117>.<136> now using Connection 3
default	15:51:32.333986-0500	RedLemon	0x7fbf970d6198 ID=44 Task <55EFB44B-C69E-4FBE-8D97-6B045D116117>.<136> sent request, body S 315
default	15:51:32.419399-0500	RedLemon	0x7fbf970d6198 ID=44 Task <55EFB44B-C69E-4FBE-8D97-6B045D116117>.<136> received response, status 201 content U
default	15:51:32.420454-0500	RedLemon	Task <55EFB44B-C69E-4FBE-8D97-6B045D116117>.<136> response ended
default	15:51:32.420958-0500	RedLemon	Task <55EFB44B-C69E-4FBE-8D97-6B045D116117>.<136> done using Connection 3
default	15:51:32.421104-0500	RedLemon	Task <55EFB44B-C69E-4FBE-8D97-6B045D116117>.<136> summary for task success {transaction_duration_ms=92, response_status=201, connection=3, reused=1, request_start_ms=1, request_duration_ms=4, response_start_ms=90, response_duration_ms=1, request_bytes=489, response_bytes=961, cache_hit=false}
default	15:51:32.422416-0500	RedLemon	Task <55EFB44B-C69E-4FBE-8D97-6B045D116117>.<136> finished successfully
default	15:51:32.633964-0500	RedLemon	✅ Room created: BPWN
default	15:51:32.634589-0500	RedLemon	Task <682C9ED9-733E-43CF-BBD0-FC58C638E424>.<137> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:32.635554-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A4486F59-2C3F-423D-ADC4-E11141D8EA7F] (reporting strategy default)> on Task <682C9ED9-733E-43CF-BBD0-FC58C638E424>.<137> was not selected for reporting
default	15:51:32.638945-0500	RedLemon	Task <682C9ED9-733E-43CF-BBD0-FC58C638E424>.<137> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:32.639269-0500	RedLemon	Task <682C9ED9-733E-43CF-BBD0-FC58C638E424>.<137> now using Connection 3
default	15:51:32.645639-0500	RedLemon	0x7fbf93accbb8 ID=48 Task <682C9ED9-733E-43CF-BBD0-FC58C638E424>.<137> sent request, body S 82
default	15:51:32.875329-0500	RedLemon	0x7fbf93accbb8 ID=48 Task <682C9ED9-733E-43CF-BBD0-FC58C638E424>.<137> received response, status 201 content U
default	15:51:32.876024-0500	RedLemon	Task <682C9ED9-733E-43CF-BBD0-FC58C638E424>.<137> response ended
default	15:51:32.876498-0500	RedLemon	Task <682C9ED9-733E-43CF-BBD0-FC58C638E424>.<137> done using Connection 3
default	15:51:32.876885-0500	RedLemon	Task <682C9ED9-733E-43CF-BBD0-FC58C638E424>.<137> summary for task success {transaction_duration_ms=238, response_status=201, connection=3, reused=1, request_start_ms=0, request_duration_ms=6, response_start_ms=236, response_duration_ms=1, request_bytes=496, response_bytes=779, cache_hit=false}
default	15:51:32.877094-0500	RedLemon	Task <682C9ED9-733E-43CF-BBD0-FC58C638E424>.<137> finished successfully
default	15:51:32.878014-0500	RedLemon	✅ Host joined room in database
default	15:51:32.879693-0500	RedLemon	Task <BED5034E-FBF5-4508-9420-CD1EF3651B3E>.<2> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	15:51:32.880805-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [33AFE82B-B560-42B9-BE8A-F504F4167B78] (reporting strategy default)> on Task <BED5034E-FBF5-4508-9420-CD1EF3651B3E>.<2> was not selected for reporting
default	15:51:32.881678-0500	RedLemon	Task <BED5034E-FBF5-4508-9420-CD1EF3651B3E>.<2> now using Connection 9
default	15:51:32.882147-0500	RedLemon	Task <BED5034E-FBF5-4508-9420-CD1EF3651B3E>.<2> sent request, body N 0
default	15:51:32.932081-0500	RedLemon	Task <BED5034E-FBF5-4508-9420-CD1EF3651B3E>.<2> received response, status 200 content K
default	15:51:32.935868-0500	RedLemon	Task <BED5034E-FBF5-4508-9420-CD1EF3651B3E>.<2> response ended
default	15:51:32.936005-0500	RedLemon	Task <BED5034E-FBF5-4508-9420-CD1EF3651B3E>.<2> done using Connection 9
default	15:51:32.940633-0500	RedLemon	Task <BED5034E-FBF5-4508-9420-CD1EF3651B3E>.<2> summary for task success {transaction_duration_ms=59, response_status=200, connection=9, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=50, response_duration_ms=8, request_bytes=244, response_bytes=2612, cache_hit=false}
default	15:51:32.940947-0500	RedLemon	Task <BED5034E-FBF5-4508-9420-CD1EF3651B3E>.<2> finished successfully
default	15:51:32.941227-0500	RedLemon	📡 Raw metadata response length: 2510 bytes
default	15:51:32.941782-0500	RedLemon	❌ Raw response DOES NOT contain 'videos' field
default	15:51:32.944322-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	15:51:34.111099-0500	RedLemon	Task <F36F8CA9-227E-454C-A059-FCDDE1D5F2D7>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:34.111557-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A03558CC-6DCA-4804-BEAC-1B6039D18017] (reporting strategy default)> on Task <F36F8CA9-227E-454C-A059-FCDDE1D5F2D7>.<1> was not selected for reporting
default	15:51:34.113013-0500	RedLemon	Connection 12: enabling TLS
default	15:51:34.113058-0500	RedLemon	Connection 12: starting, TC(0x0)
default	15:51:34.113115-0500	RedLemon	[C12 21500B9E-B8D6-4CF6-B250-6DCBA0480657 Hostname#83875299:443 tcp, url hash: 7e95af77, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{40B9562B-E771-436E-AD0D-53B77C2D4F55}{(null)}{Y}{2} (private), proc: F2A35C62-84F6-3E68-B0C5-C12BFC414E01] start
default	15:51:34.113204-0500	RedLemon	[C12 Hostname#83875299:443 initial path ((null))] event: path:start @0.000s
default	15:51:34.113600-0500	RedLemon	[C12 Hostname#83875299:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: F3340D8B-098B-49BA-9534-A6BBFE7E584C
default	15:51:34.113801-0500	RedLemon	[C12 Hostname#83875299:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:51:34.113843-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C12] reporting state preparing
default	15:51:34.114291-0500	RedLemon	Task <F36F8CA9-227E-454C-A059-FCDDE1D5F2D7>.<1> setting up Connection 12
default	15:51:34.114434-0500	mDNSResponder	[R1755] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: '4awTpijcN9wOnZUl0kdtUw=='>, options: 0x8 {use-failover}, client pid: 8572 (RedLemon)
default	15:51:34.118395-0500	mDNSResponder	[R1755] getaddrinfo stop -- hostname: <mask.hash: '4awTpijcN9wOnZUl0kdtUw=='>, client pid: 8572 (RedLemon)
default	15:51:34.118779-0500	RedLemon	nw_endpoint_resolver_update [C12 Hostname#83875299:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#00b48693:443
default	15:51:34.119096-0500	RedLemon	nw_endpoint_resolver_update [C12 Hostname#83875299:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#39dbc85c:443
default	15:51:34.119319-0500	RedLemon	[C12 Hostname#83875299:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.006s
default	15:51:34.120984-0500	RedLemon	[C12.1 IPv4#00b48693:443 initial path ((null))] event: path:start @0.007s
default	15:51:34.123537-0500	RedLemon	[C12.1 IPv4#00b48693:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.010s, uuid: 0DEF14AE-2C06-437B-8A2E-7DFDC480619D
default	15:51:34.123817-0500	RedLemon	[C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.010s
default	15:51:34.124938-0500	RedLemon	[C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.011s
default	15:51:34.128758-0500	RedLemon	[C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.015s
default	15:51:34.128917-0500	RedLemon	tcp_output [C12.1:3] flags=[SEC] seq=295366497, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=295366497
default	15:51:34.148788-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:51:34.149107-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D40152DA-66A1-4F87-A68E-3BF2A1B1482E] (reporting strategy default)> on Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> was not selected for reporting
default	15:51:34.149847-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:34.149918-0500	RedLemon	Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:51:34.150141-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	15:51:34.150527-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [05A0DEDB-10DA-49B2-A1B6-6ECE9ECF95BD] (reporting strategy default)> on Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> was not selected for reporting
default	15:51:34.151051-0500	RedLemon	Connection 13: enabling TLS
default	15:51:34.151262-0500	RedLemon	Connection 13: starting, TC(0x0)
default	15:51:34.151387-0500	RedLemon	[C13 35213D18-9069-46DB-8F8E-9D84976BBB5C Hostname#204e95ef:443 quic-connection, url hash: eff720ee, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{90BB7D89-C425-446F-823D-960A5F622A3F}{(null)}{Y}{2} (private), proc: F2A35C62-84F6-3E68-B0C5-C12BFC414E01] start
default	15:51:34.151525-0500	RedLemon	[C13 Hostname#204e95ef:443 initial path ((null))] event: path:start @0.000s
default	15:51:34.151742-0500	RedLemon	[C13 Hostname#204e95ef:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: BB699D09-2703-4FCB-BE64-B45524FC2573
default	15:51:34.151987-0500	RedLemon	[C13 Hostname#204e95ef:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	15:51:34.152030-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C13] reporting state preparing
default	15:51:34.152405-0500	RedLemon	[C13.1 Hostname#204e95ef:443 initial path ((null))] event: path:start @0.000s
default	15:51:34.152637-0500	RedLemon	[C13.1 Hostname#204e95ef:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: F81E92BC-B70F-43A0-9B0E-70C793A33895
default	15:51:34.153251-0500	mDNSResponder	[R1756] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'dOPQzL8GmJFEha6imJVFwg=='>, options: 0x8 {use-failover}, client pid: 8572 (RedLemon)
default	15:51:34.152853-0500	RedLemon	[C13.1 Hostname#204e95ef:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	15:51:34.153042-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> setting up Connection 13
default	15:51:34.153265-0500	RedLemon	Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:34.153361-0500	RedLemon	Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> waiting for setup of Connection 13
default	15:51:34.153563-0500	RedLemon	tcp_input [C12.1:3] flags=[S.E] seq=2805649983, ack=295366498, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=295366497
default	15:51:34.153701-0500	RedLemon	nw_flow_connected [C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:51:34.154220-0500	RedLemon	[C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.040s
default	15:51:34.154392-0500	RedLemon	[C12 Hostname#83875299:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.041s
default	15:51:34.155812-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C12.1:2][0x7fbf962d87d0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:51:34.155945-0500	RedLemon	boringssl_context_info_handler(2028) [C12.1:2][0x7fbf962d87d0] Client handshake started
default	15:51:34.156147-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS client enter_early_data
default	15:51:34.156420-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS client read_server_hello
default	15:51:34.162276-0500	mDNSResponder	[R1756] getaddrinfo stop -- hostname: <mask.hash: 'dOPQzL8GmJFEha6imJVFwg=='>, client pid: 8572 (RedLemon)
default	15:51:34.165693-0500	RedLemon	nw_endpoint_resolver_update [C13.1 Hostname#204e95ef:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#29739f0d.443
default	15:51:34.165865-0500	RedLemon	nw_endpoint_resolver_update [C13.1 Hostname#204e95ef:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#c514a6d2:443
default	15:51:34.166138-0500	RedLemon	[C13.1 Hostname#204e95ef:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.014s
default	15:51:34.166460-0500	RedLemon	[C13.1.1 IPv6#29739f0d.443 initial path ((null))] event: path:start @0.015s
default	15:51:34.166760-0500	RedLemon	[C13.1.1 IPv6#29739f0d.443 waiting path (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.015s, uuid: 0670C083-31A9-4E01-8F94-1A474E628664
default	15:51:34.168962-0500	RedLemon	[C13.1.1 IPv6#29739f0d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.017s
default	15:51:34.171835-0500	RedLemon	[C13.1.1 IPv6#29739f0d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.020s
default	15:51:34.173146-0500	RedLemon	[C13.1.1 IPv6#29739f0d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.021s
default	15:51:34.173377-0500	RedLemon	tcp_output [C13.1.1:3] flags=[S] seq=1848503077, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1848503077
default	15:51:34.180964-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:51:34.181200-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client read_server_hello
default	15:51:34.182174-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:51:34.184580-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client read_certificate_request
default	15:51:34.184665-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client read_server_certificate
default	15:51:34.184750-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:51:34.186052-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C12.1:2][0x7fbf962d87d0] Performing external trust evaluation
default	15:51:34.186388-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C12.1:2][0x7fbf962d87d0] Asyncing for external verify block
default	15:51:34.186846-0500	RedLemon	Connection 12: asked to evaluate TLS Trust
default	15:51:34.187292-0500	RedLemon	Task <F36F8CA9-227E-454C-A059-FCDDE1D5F2D7>.<1> auth completion disp=1 cred=0x0
default	15:51:34.191324-0500	RedLemon	tcp_input [C13.1.1:3] flags=[S.] seq=1936875107, ack=1848503078, win=31416 state=SYN_SENT rcv_nxt=0, snd_una=1848503077
default	15:51:34.191562-0500	RedLemon	nw_flow_connected [C13.1.1 IPv6#29739f0d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:51:34.191972-0500	RedLemon	[C13.1.1 IPv6#29739f0d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.040s
default	15:51:34.192121-0500	RedLemon	[C13.1 Hostname#204e95ef:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.040s
default	15:51:34.192182-0500	RedLemon	[C13 Hostname#204e95ef:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.040s
default	15:51:34.192764-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C13.1.1:2][0x7fbf962e89c0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:51:34.193003-0500	RedLemon	boringssl_context_info_handler(2028) [C13.1.1:2][0x7fbf962e89c0] Client handshake started
default	15:51:34.193207-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS client enter_early_data
default	15:51:34.193356-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS client read_server_hello
default	15:51:34.203120-0500	RedLemon	Connection 12: TLS Trust result 0
default	15:51:34.203192-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C12.1:2][0x7fbf962d87d0] Returning from external verify block with result: true
default	15:51:34.203286-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C12.1:2][0x7fbf962d87d0] Certificate verification result: OK
default	15:51:34.203938-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client read_server_finished
default	15:51:34.204090-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:51:34.204135-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:51:34.204176-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:51:34.204216-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:51:34.204360-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS 1.3 client done
default	15:51:34.204552-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS client finish_client_handshake
default	15:51:34.204602-0500	RedLemon	boringssl_context_info_handler(2045) [C12.1:2][0x7fbf962d87d0] Client handshake state: TLS client done
default	15:51:34.204644-0500	RedLemon	boringssl_context_info_handler(2034) [C12.1:2][0x7fbf962d87d0] Client handshake done
default	15:51:34.205601-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C12.1:2][0x7fbf962d87d0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(50ms) flight_time(27ms) rtt(24ms) write_stalls(0) read_stalls(7)]
default	15:51:34.205780-0500	RedLemon	nw_flow_connected [C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2853746719)
default	15:51:34.206156-0500	RedLemon	[C12.1 IPv4#00b48693:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.092s
default	15:51:34.206620-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C12] reporting state ready
default	15:51:34.206856-0500	RedLemon	[C12 Hostname#83875299:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.093s
default	15:51:34.207356-0500	RedLemon	[C12.1 IPv4#00b48693:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.094s
default	15:51:34.207436-0500	RedLemon	[C12 Hostname#83875299:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.094s
default	15:51:34.207761-0500	RedLemon	Connection 12: connected successfully
default	15:51:34.207808-0500	RedLemon	Connection 12: TLS handshake complete
default	15:51:34.208204-0500	RedLemon	Connection 12: ready C(N) E(N)
default	15:51:34.208982-0500	RedLemon	Task <F36F8CA9-227E-454C-A059-FCDDE1D5F2D7>.<1> now using Connection 12
default	15:51:34.209151-0500	RedLemon	Connection 12: received viability advisory(Y)
default	15:51:34.209465-0500	RedLemon	Task <F36F8CA9-227E-454C-A059-FCDDE1D5F2D7>.<1> sent request, body N 0
default	15:51:34.211694-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:51:34.211785-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client read_server_hello
default	15:51:34.212155-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:51:34.212558-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client read_certificate_request
default	15:51:34.212827-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client read_server_certificate
default	15:51:34.212928-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:51:34.214464-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C13.1.1:2][0x7fbf962e89c0] Performing external trust evaluation
default	15:51:34.214624-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C13.1.1:2][0x7fbf962e89c0] Asyncing for external verify block
default	15:51:34.215029-0500	RedLemon	Connection 13: asked to evaluate TLS Trust
default	15:51:34.215594-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> auth completion disp=1 cred=0x0
default	15:51:34.226651-0500	RedLemon	Connection 13: TLS Trust result 0
default	15:51:34.226764-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C13.1.1:2][0x7fbf962e89c0] Returning from external verify block with result: true
default	15:51:34.226865-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C13.1.1:2][0x7fbf962e89c0] Certificate verification result: OK
default	15:51:34.227713-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client read_server_finished
default	15:51:34.228056-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:51:34.228100-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:51:34.228140-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:51:34.228178-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:51:34.228326-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS 1.3 client done
default	15:51:34.228620-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS client finish_client_handshake
default	15:51:34.228671-0500	RedLemon	boringssl_context_info_handler(2045) [C13.1.1:2][0x7fbf962e89c0] Client handshake state: TLS client done
default	15:51:34.228712-0500	RedLemon	boringssl_context_info_handler(2034) [C13.1.1:2][0x7fbf962e89c0] Client handshake done
default	15:51:34.229546-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C13.1.1:2][0x7fbf962e89c0] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(36ms) flight_time(19ms) rtt(18ms) write_stalls(0) read_stalls(6)]
default	15:51:34.230216-0500	RedLemon	nw_flow_connected [C13.1.1 IPv6#29739f0d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2853746719)
default	15:51:34.230874-0500	RedLemon	[C13.1.1 IPv6#29739f0d.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.079s
default	15:51:34.231949-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C13] reporting state ready
default	15:51:34.232774-0500	RedLemon	[C13.1 Hostname#204e95ef:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.081s
default	15:51:34.232844-0500	RedLemon	[C13 Hostname#204e95ef:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.081s
default	15:51:34.233217-0500	RedLemon	[C13.1.1 IPv6#29739f0d.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.081s
default	15:51:34.233433-0500	RedLemon	[C13.1 Hostname#204e95ef:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.081s
default	15:51:34.234532-0500	RedLemon	[C13 Hostname#204e95ef:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.082s
default	15:51:34.234813-0500	RedLemon	Connection 13: connected successfully
default	15:51:34.235220-0500	RedLemon	Connection 13: TLS handshake complete
default	15:51:34.235533-0500	RedLemon	Connection 13: ready C(N) E(N)
default	15:51:34.236200-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> now using Connection 13
default	15:51:34.236407-0500	RedLemon	Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> now using Connection 13
default	15:51:34.236552-0500	RedLemon	Connection 13: received viability advisory(Y)
default	15:51:34.236723-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> sent request, body N 0
default	15:51:34.236896-0500	RedLemon	Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> sent request, body N 0
default	15:51:34.271070-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> received response, status 200 content K
default	15:51:34.272398-0500	RedLemon	Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> received response, status 200 content K
default	15:51:34.298403-0500	RedLemon	Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> done using Connection 13
default	15:51:34.298858-0500	RedLemon	Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> response ended
default	15:51:34.300347-0500	RedLemon	Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> summary for task success {transaction_duration_ms=149, response_status=200, connection=13, reused=1, request_start_ms=85, request_duration_ms=0, response_start_ms=121, response_duration_ms=26, request_bytes=36, response_bytes=63220, cache_hit=false}
default	15:51:34.300548-0500	RedLemon	Task <94F72526-35EB-4F95-9CF1-C92C896CFA92>.<139> finished successfully
default	15:51:34.307372-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> done using Connection 13
default	15:51:34.307600-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> response ended
default	15:51:34.308321-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> summary for task success {transaction_duration_ms=158, response_status=200, connection=13, protocol="h2", domain_lookup_duration_ms=13, connect_duration_ms=58, secure_connection_duration_ms=36, private_relay=false, request_start_ms=87, request_duration_ms=0, response_start_ms=121, response_duration_ms=36, request_bytes=128, response_bytes=118508, cache_hit=false}
default	15:51:34.308454-0500	RedLemon	Task <AEF4758C-0575-40E0-9ACD-364BF14A6E87>.<138> finished successfully
default	15:51:34.343157-0500	RedLemon	Task <F36F8CA9-227E-454C-A059-FCDDE1D5F2D7>.<1> received response, status 101 content U
default	15:51:34.343560-0500	RedLemon	Task <F36F8CA9-227E-454C-A059-FCDDE1D5F2D7>.<1> response ended
default	15:51:34.343615-0500	RedLemon	Task <F36F8CA9-227E-454C-A059-FCDDE1D5F2D7>.<1> done using Connection 12
default	15:51:34.344242-0500	RedLemon	[C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.231s
default	15:51:34.344289-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C12] reporting state preparing
default	15:51:34.344371-0500	RedLemon	[C12 Hostname#83875299:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.231s
default	15:51:34.344516-0500	RedLemon	[C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.231s
default	15:51:34.344575-0500	RedLemon	[C12 Hostname#83875299:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.231s
default	15:51:34.344650-0500	RedLemon	nw_flow_connected [C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:51:34.344783-0500	RedLemon	[C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.231s
default	15:51:34.344841-0500	RedLemon	[C12 Hostname#83875299:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.231s
default	15:51:34.344959-0500	RedLemon	nw_flow_connected [C12.1 IPv4#00b48693:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2853746719)
default	15:51:34.345257-0500	RedLemon	[C12.1 IPv4#00b48693:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.232s
default	15:51:34.345300-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C12] reporting state ready
default	15:51:34.345365-0500	RedLemon	[C12 Hostname#83875299:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.232s
default	15:51:34.370729-0500	RedLemon	Task <CB4E26FA-078E-41E1-8CC9-400390597FA7>.<140> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:34.371412-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F7ABD88D-3FB3-4F62-8D18-8E14C6D09D3F] (reporting strategy default)> on Task <CB4E26FA-078E-41E1-8CC9-400390597FA7>.<140> was not selected for reporting
default	15:51:34.372147-0500	RedLemon	Task <CB4E26FA-078E-41E1-8CC9-400390597FA7>.<140> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:34.372466-0500	RedLemon	Task <CB4E26FA-078E-41E1-8CC9-400390597FA7>.<140> now using Connection 3
default	15:51:34.373565-0500	RedLemon	0x7fbf96ac6ba8 ID=52 Task <CB4E26FA-078E-41E1-8CC9-400390597FA7>.<140> sent request, body N 0
default	15:51:34.439872-0500	RedLemon	0x7fbf96ac6ba8 ID=52 Task <CB4E26FA-078E-41E1-8CC9-400390597FA7>.<140> received response, status 200 content U
default	15:51:34.440301-0500	RedLemon	Task <CB4E26FA-078E-41E1-8CC9-400390597FA7>.<140> response ended
default	15:51:34.440754-0500	RedLemon	Task <CB4E26FA-078E-41E1-8CC9-400390597FA7>.<140> done using Connection 3
default	15:51:34.440944-0500	RedLemon	Task <CB4E26FA-078E-41E1-8CC9-400390597FA7>.<140> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=67, response_duration_ms=1, request_bytes=512, response_bytes=793, cache_hit=false}
default	15:51:34.441200-0500	RedLemon	Task <CB4E26FA-078E-41E1-8CC9-400390597FA7>.<140> finished successfully
default	15:51:34.442574-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1884 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:34.442827-0500	runningboardd	Assertion 174-8572-1884 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:34.443056-0500	RedLemon	Task <86E3898C-67A0-4582-8D3C-56BEA7600E1E>.<141> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:34.443547-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AE87FE46-4FC5-4806-9DAC-416D9345F850] (reporting strategy default)> on Task <86E3898C-67A0-4582-8D3C-56BEA7600E1E>.<141> was not selected for reporting
default	15:51:34.445673-0500	RedLemon	Task <86E3898C-67A0-4582-8D3C-56BEA7600E1E>.<141> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:34.445986-0500	RedLemon	Task <86E3898C-67A0-4582-8D3C-56BEA7600E1E>.<141> now using Connection 3
default	15:51:34.447168-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:34.447071-0500	RedLemon	0x7fbf93a70b98 ID=56 Task <86E3898C-67A0-4582-8D3C-56BEA7600E1E>.<141> sent request, body N 0
default	15:51:34.447433-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:34.447710-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:34.456788-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1885 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:34.457010-0500	runningboardd	Assertion 174-114-1885 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:34.457855-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:34.457909-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:34.457957-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:34.515223-0500	RedLemon	0x7fbf93a70b98 ID=56 Task <86E3898C-67A0-4582-8D3C-56BEA7600E1E>.<141> received response, status 200 content U
default	15:51:34.515790-0500	RedLemon	Task <86E3898C-67A0-4582-8D3C-56BEA7600E1E>.<141> response ended
default	15:51:34.516246-0500	RedLemon	Task <86E3898C-67A0-4582-8D3C-56BEA7600E1E>.<141> done using Connection 3
default	15:51:34.516493-0500	RedLemon	Task <86E3898C-67A0-4582-8D3C-56BEA7600E1E>.<141> summary for task success {transaction_duration_ms=72, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=1, response_start_ms=70, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:51:34.516762-0500	RedLemon	Task <86E3898C-67A0-4582-8D3C-56BEA7600E1E>.<141> finished successfully
default	15:51:35.544305-0500	runningboardd	Invalidating assertion 174-8572-1884 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:35.723184-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:35.723233-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:35.723681-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:35.737262-0500	runningboardd	Invalidating assertion 174-114-1885 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:35.904546-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:35.904715-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:35.904791-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:36.133814-0500	runningboardd	Assertion did invalidate due to timeout: 174-140-1881 (target:[anon<RedLemon>(501):8572])
default	15:51:36.285645-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:36.285695-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:36.285742-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:36.534535-0500	RedLemon	Task <F2CB830F-BC2D-4220-893E-E264757DB808>.<142> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:36.534991-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [59F81945-239F-40F8-AABE-041498CD7C3F] (reporting strategy default)> on Task <F2CB830F-BC2D-4220-893E-E264757DB808>.<142> was not selected for reporting
default	15:51:36.535808-0500	RedLemon	Task <F2CB830F-BC2D-4220-893E-E264757DB808>.<142> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:36.536094-0500	RedLemon	Task <F2CB830F-BC2D-4220-893E-E264757DB808>.<142> now using Connection 3
default	15:51:36.537883-0500	RedLemon	0x7fbf9770f8a8 ID=60 Task <F2CB830F-BC2D-4220-893E-E264757DB808>.<142> sent request, body N 0
default	15:51:36.602404-0500	RedLemon	0x7fbf9770f8a8 ID=60 Task <F2CB830F-BC2D-4220-893E-E264757DB808>.<142> received response, status 200 content U
default	15:51:36.603081-0500	RedLemon	Task <F2CB830F-BC2D-4220-893E-E264757DB808>.<142> response ended
default	15:51:36.603712-0500	RedLemon	Task <F2CB830F-BC2D-4220-893E-E264757DB808>.<142> done using Connection 3
default	15:51:36.603980-0500	RedLemon	Task <F2CB830F-BC2D-4220-893E-E264757DB808>.<142> summary for task success {transaction_duration_ms=68, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=66, response_duration_ms=1, request_bytes=512, response_bytes=794, cache_hit=true}
default	15:51:36.604413-0500	RedLemon	Task <F2CB830F-BC2D-4220-893E-E264757DB808>.<142> finished successfully
default	15:51:36.605531-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1886 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:36.605660-0500	RedLemon	Task <9291A14E-FAFF-4601-B663-1A0D27949DF7>.<143> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:36.605779-0500	runningboardd	Assertion 174-8572-1886 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:36.606107-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1986E26A-6AF6-4E80-9F8C-9E7174BE8C99] (reporting strategy default)> on Task <9291A14E-FAFF-4601-B663-1A0D27949DF7>.<143> was not selected for reporting
default	15:51:36.607450-0500	RedLemon	Task <9291A14E-FAFF-4601-B663-1A0D27949DF7>.<143> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:36.607754-0500	RedLemon	Task <9291A14E-FAFF-4601-B663-1A0D27949DF7>.<143> now using Connection 3
default	15:51:36.609153-0500	RedLemon	0x7fbf96ac6ba8 ID=64 Task <9291A14E-FAFF-4601-B663-1A0D27949DF7>.<143> sent request, body N 0
default	15:51:36.610476-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:36.610642-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:36.610948-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:36.618385-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1887 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:36.618638-0500	runningboardd	Assertion 174-114-1887 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:36.619728-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:36.619776-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:36.619812-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:36.664686-0500	RedLemon	0x7fbf96ac6ba8 ID=64 Task <9291A14E-FAFF-4601-B663-1A0D27949DF7>.<143> received response, status 200 content U
default	15:51:36.665689-0500	RedLemon	Task <9291A14E-FAFF-4601-B663-1A0D27949DF7>.<143> response ended
default	15:51:36.666121-0500	RedLemon	Task <9291A14E-FAFF-4601-B663-1A0D27949DF7>.<143> done using Connection 3
default	15:51:36.666591-0500	RedLemon	Task <9291A14E-FAFF-4601-B663-1A0D27949DF7>.<143> summary for task success {transaction_duration_ms=60, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=57, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:51:36.667193-0500	RedLemon	Task <9291A14E-FAFF-4601-B663-1A0D27949DF7>.<143> finished successfully
default	15:51:36.686681-0500	RedLemon	Connection 11: read-side closed
default	15:51:36.686867-0500	RedLemon	Connection 11: cleaning up
default	15:51:36.686939-0500	RedLemon	[C11 FB91ECAB-3200-4755-9336-DB2FC90289EC Hostname#204e95ef:443 quic-connection, url hash: 0740ec8c, definite, attribution: developer] cancel
default	15:51:36.687079-0500	RedLemon	[C11 FB91ECAB-3200-4755-9336-DB2FC90289EC Hostname#204e95ef:443 quic-connection, url hash: 0740ec8c, definite, attribution: developer] cancelled
	[C11.1.1 0670C083-31A9-4E01-8F94-1A474E628664 2607:fea8:995b:fd00:e143:eb11:f54f:69d1.60083<->IPv6#29739f0d.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 16.398s, DNS @0.000s took 0.000s, TCP @0.001s took 0.019s, TLS 1.3 took 0.039s
	bytes in/out: 4004/932, packets in/out: 15/16, rtt: 0.032s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:51:36.687544-0500	RedLemon	nw_protocol_tcp_log_summary [C11.1.1:3]
	[7FB891D0-1DE0-4FF6-921D-788AF3DBFAA6 <private>:60083<-><private>:443]
	Init: 1, Conn_Time: 18.932ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 6, rtt: 32.375ms, rtt_var: 25.000ms rtt_nc: 30.312ms, rtt_var_nc: 25.312ms base rtt: 11ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:51:36.687649-0500	RedLemon	nw_flow_disconnected [C11.1.1 IPv6#29739f0d.443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:51:36.687983-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C11] reporting state cancelled
default	15:51:36.688085-0500	RedLemon	tcp_input [C11.1.1:3] flags=[F.] seq=1502204792, ack=466835727, win=8 state=ESTABLISHED rcv_nxt=1502204792, snd_una=466835727
default	15:51:36.688184-0500	RedLemon	tcp_output [C11.1.1:3] flags=[F.] seq=466835790, ack=1502204793, win=2048 state=LAST_ACK rcv_nxt=1502204793, snd_una=466835727
default	15:51:36.699897-0500	RedLemon	tcp_output [C11.1.1:3] flags=[FP.] seq=466835727, ack=1502204793, win=2048 state=LAST_ACK rcv_nxt=1502204793, snd_una=466835727
default	15:51:37.718858-0500	runningboardd	Invalidating assertion 174-8572-1886 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:37.856096-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:37.856489-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:37.856645-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:37.868314-0500	runningboardd	Invalidating assertion 174-114-1887 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:38.044750-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:38.044810-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:38.044859-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:38.759576-0500	RedLemon	Task <0D92B292-73CC-4AFF-B207-355978679151>.<144> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:38.760046-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [65C44E09-DB0C-485F-B8DA-94CAE62F1426] (reporting strategy default)> on Task <0D92B292-73CC-4AFF-B207-355978679151>.<144> was not selected for reporting
default	15:51:38.760827-0500	RedLemon	Task <0D92B292-73CC-4AFF-B207-355978679151>.<144> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:38.761136-0500	RedLemon	Task <0D92B292-73CC-4AFF-B207-355978679151>.<144> now using Connection 3
default	15:51:38.762801-0500	RedLemon	0x7fbf93a70b98 ID=68 Task <0D92B292-73CC-4AFF-B207-355978679151>.<144> sent request, body N 0
default	15:51:38.828813-0500	RedLemon	0x7fbf93a70b98 ID=68 Task <0D92B292-73CC-4AFF-B207-355978679151>.<144> received response, status 200 content U
default	15:51:38.829483-0500	RedLemon	Task <0D92B292-73CC-4AFF-B207-355978679151>.<144> response ended
default	15:51:38.829926-0500	RedLemon	Task <0D92B292-73CC-4AFF-B207-355978679151>.<144> done using Connection 3
default	15:51:38.830624-0500	RedLemon	Task <0D92B292-73CC-4AFF-B207-355978679151>.<144> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=68, response_duration_ms=1, request_bytes=512, response_bytes=793, cache_hit=false}
default	15:51:38.831197-0500	RedLemon	Task <0D92B292-73CC-4AFF-B207-355978679151>.<144> finished successfully
default	15:51:38.832468-0500	RedLemon	Task <89ED7C26-1445-49C2-8705-453C5130FE82>.<145> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:38.833467-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D415B02B-7462-45D8-89A4-8638430903A1] (reporting strategy default)> on Task <89ED7C26-1445-49C2-8705-453C5130FE82>.<145> was not selected for reporting
default	15:51:38.835911-0500	RedLemon	Task <89ED7C26-1445-49C2-8705-453C5130FE82>.<145> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:38.836189-0500	RedLemon	Task <89ED7C26-1445-49C2-8705-453C5130FE82>.<145> now using Connection 3
default	15:51:38.837301-0500	RedLemon	0x7fbf96273288 ID=72 Task <89ED7C26-1445-49C2-8705-453C5130FE82>.<145> sent request, body N 0
default	15:51:38.837620-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1888 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:38.837873-0500	runningboardd	Assertion 174-8572-1888 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:38.838702-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:38.838762-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:38.838813-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:38.844413-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1889 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:38.844990-0500	runningboardd	Assertion 174-114-1889 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:38.848216-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:38.848268-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:38.848589-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:38.888834-0500	RedLemon	0x7fbf96273288 ID=72 Task <89ED7C26-1445-49C2-8705-453C5130FE82>.<145> received response, status 200 content U
default	15:51:38.889265-0500	RedLemon	Task <89ED7C26-1445-49C2-8705-453C5130FE82>.<145> response ended
default	15:51:38.889565-0500	RedLemon	Task <89ED7C26-1445-49C2-8705-453C5130FE82>.<145> done using Connection 3
default	15:51:38.889724-0500	RedLemon	Task <89ED7C26-1445-49C2-8705-453C5130FE82>.<145> summary for task success {transaction_duration_ms=54, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=53, response_duration_ms=0, request_bytes=524, response_bytes=842, cache_hit=true}
default	15:51:38.890383-0500	RedLemon	Task <89ED7C26-1445-49C2-8705-453C5130FE82>.<145> finished successfully
default	15:51:39.934487-0500	runningboardd	Invalidating assertion 174-8572-1888 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:40.088346-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:40.088409-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:40.088459-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:40.124862-0500	runningboardd	Invalidating assertion 174-114-1889 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:40.287782-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:40.287834-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:40.287878-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:41.050811-0500	RedLemon	Task <59B11823-853A-4C96-A0AE-C7D87DFA671B>.<146> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:41.051294-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [23C7FFCA-4B4C-4A9C-8D5C-16D1B0B9CCC4] (reporting strategy default)> on Task <59B11823-853A-4C96-A0AE-C7D87DFA671B>.<146> was not selected for reporting
default	15:51:41.052243-0500	RedLemon	Task <59B11823-853A-4C96-A0AE-C7D87DFA671B>.<146> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:41.052630-0500	RedLemon	Task <59B11823-853A-4C96-A0AE-C7D87DFA671B>.<146> now using Connection 3
default	15:51:41.055561-0500	RedLemon	0x7fbf93a70b98 ID=76 Task <59B11823-853A-4C96-A0AE-C7D87DFA671B>.<146> sent request, body N 0
default	15:51:41.112936-0500	RedLemon	0x7fbf93a70b98 ID=76 Task <59B11823-853A-4C96-A0AE-C7D87DFA671B>.<146> received response, status 200 content U
default	15:51:41.113562-0500	RedLemon	Task <59B11823-853A-4C96-A0AE-C7D87DFA671B>.<146> response ended
default	15:51:41.113996-0500	RedLemon	Task <59B11823-853A-4C96-A0AE-C7D87DFA671B>.<146> done using Connection 3
default	15:51:41.114492-0500	RedLemon	Task <59B11823-853A-4C96-A0AE-C7D87DFA671B>.<146> summary for task success {transaction_duration_ms=62, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=2, response_start_ms=61, response_duration_ms=1, request_bytes=512, response_bytes=793, cache_hit=true}
default	15:51:41.114778-0500	RedLemon	Task <59B11823-853A-4C96-A0AE-C7D87DFA671B>.<146> finished successfully
default	15:51:41.115972-0500	RedLemon	Task <F810EEB8-D290-4065-B364-8C626F51EC36>.<147> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:41.116417-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [38D17EE8-3368-4871-8E58-12FAFF845C23] (reporting strategy default)> on Task <F810EEB8-D290-4065-B364-8C626F51EC36>.<147> was not selected for reporting
default	15:51:41.117604-0500	RedLemon	Task <F810EEB8-D290-4065-B364-8C626F51EC36>.<147> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:41.117918-0500	RedLemon	Task <F810EEB8-D290-4065-B364-8C626F51EC36>.<147> now using Connection 3
default	15:51:41.120733-0500	RedLemon	0x7fbf96273288 ID=80 Task <F810EEB8-D290-4065-B364-8C626F51EC36>.<147> sent request, body N 0
default	15:51:41.122539-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1890 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:41.122839-0500	runningboardd	Assertion 174-8572-1890 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:41.128168-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:41.128468-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:41.128707-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:41.134923-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1891 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:41.135663-0500	runningboardd	Assertion 174-114-1891 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:41.139528-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:41.139594-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:41.139647-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:41.187602-0500	RedLemon	0x7fbf96273288 ID=80 Task <F810EEB8-D290-4065-B364-8C626F51EC36>.<147> received response, status 200 content U
default	15:51:41.189862-0500	RedLemon	Task <F810EEB8-D290-4065-B364-8C626F51EC36>.<147> response ended
default	15:51:41.190831-0500	RedLemon	Task <F810EEB8-D290-4065-B364-8C626F51EC36>.<147> done using Connection 3
default	15:51:41.191117-0500	RedLemon	Task <F810EEB8-D290-4065-B364-8C626F51EC36>.<147> summary for task success {transaction_duration_ms=74, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=70, response_duration_ms=3, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:51:41.191335-0500	RedLemon	Task <F810EEB8-D290-4065-B364-8C626F51EC36>.<147> finished successfully
default	15:51:42.240869-0500	runningboardd	Invalidating assertion 174-8572-1890 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:42.251974-0500	RedLemon	📥 Received Realtime message: 'LOBBY_JOIN' from lemontom in room BPWN
default	15:51:42.252177-0500	RedLemon	👋 Host received: Guest 'lemontom' joined room BPWN
default	15:51:42.252372-0500	RedLemon	   Guest ID: 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E, Total participants: 2
default	15:51:42.252639-0500	RedLemon	👥 Room status after join: 2 participants, 0 ready
default	15:51:42.390397-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:42.390444-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:42.390491-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:42.402802-0500	runningboardd	Invalidating assertion 174-114-1891 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:42.520634-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:42.520721-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:42.520950-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:43.403381-0500	RedLemon	Task <CCF03AFB-B4A2-4F69-B784-4B865C10FABC>.<148> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:43.404148-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5FB54B1B-6FBE-4ACB-8CE4-A6DB05A61196] (reporting strategy default)> on Task <CCF03AFB-B4A2-4F69-B784-4B865C10FABC>.<148> was not selected for reporting
default	15:51:43.405113-0500	RedLemon	Task <CCF03AFB-B4A2-4F69-B784-4B865C10FABC>.<148> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:43.405437-0500	RedLemon	Task <CCF03AFB-B4A2-4F69-B784-4B865C10FABC>.<148> now using Connection 3
default	15:51:43.412693-0500	RedLemon	0x7fbf93abfe88 ID=84 Task <CCF03AFB-B4A2-4F69-B784-4B865C10FABC>.<148> sent request, body N 0
default	15:51:43.478426-0500	RedLemon	0x7fbf93abfe88 ID=84 Task <CCF03AFB-B4A2-4F69-B784-4B865C10FABC>.<148> received response, status 200 content U
default	15:51:43.479012-0500	RedLemon	Task <CCF03AFB-B4A2-4F69-B784-4B865C10FABC>.<148> response ended
default	15:51:43.479446-0500	RedLemon	Task <CCF03AFB-B4A2-4F69-B784-4B865C10FABC>.<148> done using Connection 3
default	15:51:43.480091-0500	RedLemon	Task <CCF03AFB-B4A2-4F69-B784-4B865C10FABC>.<148> summary for task success {transaction_duration_ms=75, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=7, response_start_ms=73, response_duration_ms=1, request_bytes=512, response_bytes=837, cache_hit=true}
default	15:51:43.480304-0500	RedLemon	Task <CCF03AFB-B4A2-4F69-B784-4B865C10FABC>.<148> finished successfully
default	15:51:43.482353-0500	RedLemon	Task <C170238C-B765-4EF3-9CE1-A12A88EC2F5F>.<149> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:43.484040-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [49048164-F3D7-4918-9E96-720E071E2E5F] (reporting strategy default)> on Task <C170238C-B765-4EF3-9CE1-A12A88EC2F5F>.<149> was not selected for reporting
default	15:51:43.485671-0500	RedLemon	Task <C170238C-B765-4EF3-9CE1-A12A88EC2F5F>.<149> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:43.485960-0500	RedLemon	Task <C170238C-B765-4EF3-9CE1-A12A88EC2F5F>.<149> now using Connection 3
default	15:51:43.488149-0500	RedLemon	0x7fbf92fac178 ID=88 Task <C170238C-B765-4EF3-9CE1-A12A88EC2F5F>.<149> sent request, body N 0
default	15:51:43.490842-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1892 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:43.491267-0500	runningboardd	Assertion 174-8572-1892 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:43.496244-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:43.496419-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:43.496592-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:43.503668-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1893 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:43.504113-0500	runningboardd	Assertion 174-114-1893 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:43.507671-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:43.507901-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:43.508042-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:43.543512-0500	RedLemon	0x7fbf92fac178 ID=88 Task <C170238C-B765-4EF3-9CE1-A12A88EC2F5F>.<149> received response, status 200 content U
default	15:51:43.544225-0500	RedLemon	Task <C170238C-B765-4EF3-9CE1-A12A88EC2F5F>.<149> response ended
default	15:51:43.544660-0500	RedLemon	Task <C170238C-B765-4EF3-9CE1-A12A88EC2F5F>.<149> done using Connection 3
default	15:51:43.545484-0500	RedLemon	Task <C170238C-B765-4EF3-9CE1-A12A88EC2F5F>.<149> summary for task success {transaction_duration_ms=60, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=2, response_start_ms=58, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:51:43.545900-0500	RedLemon	Task <C170238C-B765-4EF3-9CE1-A12A88EC2F5F>.<149> finished successfully
default	15:51:43.548026-0500	RedLemon	Task <57015FC5-4A70-444E-A694-09A4C33B9E59>.<150> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:43.548839-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C4332D75-F214-44DC-A09A-1F3246666085] (reporting strategy default)> on Task <57015FC5-4A70-444E-A694-09A4C33B9E59>.<150> was not selected for reporting
default	15:51:43.550746-0500	RedLemon	Task <57015FC5-4A70-444E-A694-09A4C33B9E59>.<150> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:43.551278-0500	RedLemon	Task <57015FC5-4A70-444E-A694-09A4C33B9E59>.<150> now using Connection 3
default	15:51:43.552544-0500	RedLemon	0x7fbf93abfe88 ID=92 Task <57015FC5-4A70-444E-A694-09A4C33B9E59>.<150> sent request, body N 0
default	15:51:43.618938-0500	RedLemon	0x7fbf93abfe88 ID=92 Task <57015FC5-4A70-444E-A694-09A4C33B9E59>.<150> received response, status 200 content U
default	15:51:43.620564-0500	RedLemon	Task <57015FC5-4A70-444E-A694-09A4C33B9E59>.<150> response ended
default	15:51:43.621356-0500	RedLemon	Task <57015FC5-4A70-444E-A694-09A4C33B9E59>.<150> done using Connection 3
default	15:51:43.621666-0500	RedLemon	Task <57015FC5-4A70-444E-A694-09A4C33B9E59>.<150> summary for task success {transaction_duration_ms=72, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=68, response_duration_ms=3, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:51:43.622234-0500	RedLemon	Task <57015FC5-4A70-444E-A694-09A4C33B9E59>.<150> finished successfully
default	15:51:43.939598-0500	RedLemon	🎬 Host: Starting movie for 2 participants
default	15:51:43.974390-0500	RedLemon	Task <B2D3B715-3849-4358-9590-72579B35C7FA>.<151> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:43.981174-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [41802297-B805-4541-ADC2-41EF706FEA3B] (reporting strategy default)> on Task <B2D3B715-3849-4358-9590-72579B35C7FA>.<151> was not selected for reporting
default	15:51:43.982562-0500	RedLemon	Task <B2D3B715-3849-4358-9590-72579B35C7FA>.<151> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:43.983030-0500	RedLemon	Task <B2D3B715-3849-4358-9590-72579B35C7FA>.<151> now using Connection 3
default	15:51:43.990636-0500	RedLemon	✅ Host: Successfully broadcast LOBBY_START_COUNTDOWN via Realtime
default	15:51:43.990797-0500	RedLemon	📡 Realtime delivery confirmed for 2 guests
default	15:51:43.992686-0500	RedLemon	0x7fbf93abfe88 ID=96 Task <B2D3B715-3849-4358-9590-72579B35C7FA>.<151> sent request, body S 80
default	15:51:44.017529-0500	RedLemon	📥 Received Realtime message: 'LOBBY_START_COUNTDOWN' from Host in room BPWN
default	15:51:44.057900-0500	RedLemon	0x7fbf93abfe88 ID=96 Task <B2D3B715-3849-4358-9590-72579B35C7FA>.<151> received response, status 200 content U
default	15:51:44.058401-0500	RedLemon	Task <B2D3B715-3849-4358-9590-72579B35C7FA>.<151> response ended
default	15:51:44.059228-0500	RedLemon	Task <B2D3B715-3849-4358-9590-72579B35C7FA>.<151> done using Connection 3
default	15:51:44.059609-0500	RedLemon	Task <B2D3B715-3849-4358-9590-72579B35C7FA>.<151> summary for task success {transaction_duration_ms=77, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=9, response_start_ms=75, response_duration_ms=1, request_bytes=504, response_bytes=959, cache_hit=false}
default	15:51:44.061657-0500	RedLemon	Task <B2D3B715-3849-4358-9590-72579B35C7FA>.<151> finished successfully
default	15:51:44.062063-0500	RedLemon	✅ Host: Set room playback state in database as fallback
default	15:51:44.062335-0500	RedLemon	💾 Database delivery confirmed for start signal
default	15:51:44.618206-0500	runningboardd	Invalidating assertion 174-8572-1892 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:44.796109-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:44.796315-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:44.796519-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:44.801333-0500	runningboardd	Invalidating assertion 174-114-1893 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:44.970895-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:44.970943-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:44.970990-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:45.760225-0500	RedLemon	Task <D0D0FBF4-3B9A-41AB-9957-EB9BDC9F0BE1>.<152> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:45.760823-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5AC9C600-5EE1-4FDB-9C52-4C3F80E57812] (reporting strategy default)> on Task <D0D0FBF4-3B9A-41AB-9957-EB9BDC9F0BE1>.<152> was not selected for reporting
default	15:51:45.761785-0500	RedLemon	Task <D0D0FBF4-3B9A-41AB-9957-EB9BDC9F0BE1>.<152> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:45.762114-0500	RedLemon	Task <D0D0FBF4-3B9A-41AB-9957-EB9BDC9F0BE1>.<152> now using Connection 3
default	15:51:45.763997-0500	RedLemon	0x7fbf96273288 ID=100 Task <D0D0FBF4-3B9A-41AB-9957-EB9BDC9F0BE1>.<152> sent request, body N 0
default	15:51:45.824692-0500	RedLemon	0x7fbf96273288 ID=100 Task <D0D0FBF4-3B9A-41AB-9957-EB9BDC9F0BE1>.<152> received response, status 200 content U
default	15:51:45.825105-0500	RedLemon	Task <D0D0FBF4-3B9A-41AB-9957-EB9BDC9F0BE1>.<152> response ended
default	15:51:45.825825-0500	RedLemon	Task <D0D0FBF4-3B9A-41AB-9957-EB9BDC9F0BE1>.<152> done using Connection 3
default	15:51:45.826667-0500	RedLemon	Task <D0D0FBF4-3B9A-41AB-9957-EB9BDC9F0BE1>.<152> summary for task success {transaction_duration_ms=65, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=63, response_duration_ms=1, request_bytes=512, response_bytes=835, cache_hit=true}
default	15:51:45.826913-0500	RedLemon	Task <D0D0FBF4-3B9A-41AB-9957-EB9BDC9F0BE1>.<152> finished successfully
default	15:51:45.828821-0500	RedLemon	Task <7FB23F8D-34B7-4A25-9C28-5BB5DFEC1FCC>.<153> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:45.829534-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AECAB297-CD69-4867-A170-A0DC5FA4EFEA] (reporting strategy default)> on Task <7FB23F8D-34B7-4A25-9C28-5BB5DFEC1FCC>.<153> was not selected for reporting
default	15:51:45.830498-0500	RedLemon	Task <7FB23F8D-34B7-4A25-9C28-5BB5DFEC1FCC>.<153> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:45.830804-0500	RedLemon	Task <7FB23F8D-34B7-4A25-9C28-5BB5DFEC1FCC>.<153> now using Connection 3
default	15:51:45.832452-0500	RedLemon	0x7fbf939c4218 ID=104 Task <7FB23F8D-34B7-4A25-9C28-5BB5DFEC1FCC>.<153> sent request, body N 0
default	15:51:45.835841-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1895 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:45.836030-0500	runningboardd	Assertion 174-8572-1895 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:45.837382-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:45.837438-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:45.837533-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:45.839293-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1896 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:45.839463-0500	runningboardd	Assertion 174-114-1896 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:45.840959-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:45.841047-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:45.841110-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:45.892268-0500	RedLemon	0x7fbf939c4218 ID=104 Task <7FB23F8D-34B7-4A25-9C28-5BB5DFEC1FCC>.<153> received response, status 200 content U
default	15:51:45.893562-0500	RedLemon	Task <7FB23F8D-34B7-4A25-9C28-5BB5DFEC1FCC>.<153> response ended
default	15:51:45.894031-0500	RedLemon	Task <7FB23F8D-34B7-4A25-9C28-5BB5DFEC1FCC>.<153> done using Connection 3
default	15:51:45.894393-0500	RedLemon	Task <7FB23F8D-34B7-4A25-9C28-5BB5DFEC1FCC>.<153> summary for task success {transaction_duration_ms=64, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=62, response_duration_ms=2, request_bytes=524, response_bytes=841, cache_hit=true}
default	15:51:45.894702-0500	RedLemon	Task <7FB23F8D-34B7-4A25-9C28-5BB5DFEC1FCC>.<153> finished successfully
default	15:51:45.897214-0500	RedLemon	Task <D403635C-7EB3-44E9-A000-6401257262F8>.<154> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:45.897672-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [341E2845-E664-474D-9A86-1116B266507B] (reporting strategy default)> on Task <D403635C-7EB3-44E9-A000-6401257262F8>.<154> was not selected for reporting
default	15:51:45.898524-0500	RedLemon	Task <D403635C-7EB3-44E9-A000-6401257262F8>.<154> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:45.898828-0500	RedLemon	Task <D403635C-7EB3-44E9-A000-6401257262F8>.<154> now using Connection 3
default	15:51:45.899869-0500	RedLemon	0x7fbf96273288 ID=108 Task <D403635C-7EB3-44E9-A000-6401257262F8>.<154> sent request, body N 0
default	15:51:45.973057-0500	RedLemon	0x7fbf96273288 ID=108 Task <D403635C-7EB3-44E9-A000-6401257262F8>.<154> received response, status 200 content U
default	15:51:45.973475-0500	RedLemon	Task <D403635C-7EB3-44E9-A000-6401257262F8>.<154> response ended
default	15:51:45.973906-0500	RedLemon	Task <D403635C-7EB3-44E9-A000-6401257262F8>.<154> done using Connection 3
default	15:51:45.974088-0500	RedLemon	Task <D403635C-7EB3-44E9-A000-6401257262F8>.<154> summary for task success {transaction_duration_ms=76, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=74, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:51:45.974355-0500	RedLemon	Task <D403635C-7EB3-44E9-A000-6401257262F8>.<154> finished successfully
default	15:51:46.937822-0500	runningboardd	Invalidating assertion 174-8572-1895 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:47.034025-0500	RedLemon	🎬 Host: Launching player for Frankenstein
default	15:51:47.034328-0500	RedLemon	   Quality: 1080p
default	15:51:47.034466-0500	RedLemon	   Mode: watchParty
default	15:51:47.034533-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	15:51:47.086330-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:47.089246-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:47.089303-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:47.095232-0500	runningboardd	Invalidating assertion 174-114-1896 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:47.162306-0500	RedLemon	🖼️ Loading background art: https://images.metahub.space/background/medium/tt1312221/img
default	15:51:47.163403-0500	RedLemon	⏳ Background art loading...
default	15:51:47.163719-0500	RedLemon	🎨 Loading logo: https://images.metahub.space/logo/medium/tt1312221/img
default	15:51:47.164498-0500	RedLemon	⏳ Logo loading...
default	15:51:47.204869-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:47.204921-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:47.204972-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:47.223479-0500	RedLemon	Task <E4240B3D-777D-4750-8051-BFED42EA1B98>.<155> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:51:47.224224-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [471E9425-FF9A-478E-B2B6-A8107C6EF917] (reporting strategy default)> on Task <E4240B3D-777D-4750-8051-BFED42EA1B98>.<155> was not selected for reporting
default	15:51:47.225507-0500	RedLemon	Task <E4240B3D-777D-4750-8051-BFED42EA1B98>.<155> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:47.225907-0500	RedLemon	Task <E4240B3D-777D-4750-8051-BFED42EA1B98>.<155> now using Connection 13
default	15:51:47.226665-0500	RedLemon	Task <E4240B3D-777D-4750-8051-BFED42EA1B98>.<155> sent request, body N 0
default	15:51:47.226917-0500	RedLemon	Task <24312FD9-3123-4049-B640-CFC5DA77C0B1>.<156> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:51:47.227521-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F358665C-8994-454E-A1F6-F38F42D5FB7F] (reporting strategy default)> on Task <24312FD9-3123-4049-B640-CFC5DA77C0B1>.<156> was not selected for reporting
default	15:51:47.228144-0500	RedLemon	Task <24312FD9-3123-4049-B640-CFC5DA77C0B1>.<156> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:47.228351-0500	RedLemon	Task <24312FD9-3123-4049-B640-CFC5DA77C0B1>.<156> now using Connection 13
default	15:51:47.228553-0500	RedLemon	Task <24312FD9-3123-4049-B640-CFC5DA77C0B1>.<156> sent request, body N 0
default	15:51:47.244894-0500	RedLemon	Task <E4240B3D-777D-4750-8051-BFED42EA1B98>.<155> received response, status 200 content K
default	15:51:47.246649-0500	RedLemon	Task <E4240B3D-777D-4750-8051-BFED42EA1B98>.<155> done using Connection 13
default	15:51:47.248112-0500	RedLemon	Task <E4240B3D-777D-4750-8051-BFED42EA1B98>.<155> response ended
default	15:51:47.249989-0500	RedLemon	Task <E4240B3D-777D-4750-8051-BFED42EA1B98>.<155> summary for task success {transaction_duration_ms=25, response_status=200, connection=13, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=20, response_duration_ms=3, request_bytes=36, response_bytes=63076, cache_hit=false}
default	15:51:47.250138-0500	RedLemon	Task <E4240B3D-777D-4750-8051-BFED42EA1B98>.<155> finished successfully
default	15:51:47.280997-0500	RedLemon	✅ Logo loaded successfully
default	15:51:47.282730-0500	RedLemon	Task <24312FD9-3123-4049-B640-CFC5DA77C0B1>.<156> received response, status 200 content K
default	15:51:47.283797-0500	RedLemon	Task <24312FD9-3123-4049-B640-CFC5DA77C0B1>.<156> done using Connection 13
default	15:51:47.284025-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	15:51:47.284209-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	15:51:47.284215-0500	RedLemon	Task <93B18897-D6F5-46CF-9F40-EC0BE726F2E5>.<157> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:47.284360-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	15:51:47.284847-0500	RedLemon	Task <E6B24DA2-98FF-4E29-9CE4-B8F09CA5B100>.<3> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	15:51:47.286623-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [81362F2F-B241-4C7B-9BEC-9C93B194E362] (reporting strategy default)> on Task <93B18897-D6F5-46CF-9F40-EC0BE726F2E5>.<157> was not selected for reporting
default	15:51:47.287436-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8A0C1A74-530E-4A3E-AC02-658C9D213310] (reporting strategy default)> on Task <E6B24DA2-98FF-4E29-9CE4-B8F09CA5B100>.<3> was not selected for reporting
default	15:51:47.288132-0500	RedLemon	Task <24312FD9-3123-4049-B640-CFC5DA77C0B1>.<156> response ended
default	15:51:47.288700-0500	RedLemon	Task <E6B24DA2-98FF-4E29-9CE4-B8F09CA5B100>.<3> now using Connection 9
default	15:51:47.302082-0500	RedLemon	Task <93B18897-D6F5-46CF-9F40-EC0BE726F2E5>.<157> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	15:51:47.303613-0500	RedLemon	Task <93B18897-D6F5-46CF-9F40-EC0BE726F2E5>.<157> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:47.304274-0500	RedLemon	Task <93B18897-D6F5-46CF-9F40-EC0BE726F2E5>.<157> now using Connection 3
default	15:51:47.304708-0500	RedLemon	Task <24312FD9-3123-4049-B640-CFC5DA77C0B1>.<156> summary for task success {transaction_duration_ms=76, response_status=200, connection=13, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=54, response_duration_ms=5, request_bytes=41, response_bytes=117928, cache_hit=false}
default	15:51:47.305017-0500	RedLemon	Task <24312FD9-3123-4049-B640-CFC5DA77C0B1>.<156> finished successfully
default	15:51:47.310826-0500	RedLemon	⚠️ Lobby: Failed to poll participants: Error Domain=NSURLErrorDomain Code=-999 "cancelled" UserInfo={NSErrorFailingURLStringKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/room_participants?room_id=eq.BPWN&select=*, NSErrorFailingURLKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/room_participants?room_id=eq.BPWN&select=*, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <93B18897-D6F5-46CF-9F40-EC0BE726F2E5>.<157>"
), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <93B18897-D6F5-46CF-9F40-EC0BE726F2E5>.<157>, NSLocalizedDescription=cancelled}
default	15:51:47.311445-0500	RedLemon	✅ Background art loaded successfully
default	15:51:47.313522-0500	RedLemon	Task <93B18897-D6F5-46CF-9F40-EC0BE726F2E5>.<157> done using Connection 3
default	15:51:47.315735-0500	RedLemon	Task <E6B24DA2-98FF-4E29-9CE4-B8F09CA5B100>.<3> sent request, body N 0
default	15:51:47.334568-0500	RedLemon	0x7fbf93a15298 ID=112 Task <93B18897-D6F5-46CF-9F40-EC0BE726F2E5>.<157> sent request, body N 0
default	15:51:47.348689-0500	RedLemon	Task <087EA0B8-4D62-4F20-A5E2-324E1E357CE2>.<158> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:47.348783-0500	RedLemon	Task <C5C2AD22-6AA4-4A1B-9408-D9359B55AF50>.<160> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:47.348778-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:47.348977-0500	RedLemon	Task <DE92242A-ACFE-48CD-8572-C9F3018789A6>.<161> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:47.350969-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [93DF7C6E-FDF3-4CF8-B91C-B3D792879559] (reporting strategy default)> on Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> was not selected for reporting
default	15:51:47.350627-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A2B6435F-ECF3-40C8-A670-599407790D37] (reporting strategy default)> on Task <087EA0B8-4D62-4F20-A5E2-324E1E357CE2>.<158> was not selected for reporting
default	15:51:47.351695-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E03985FE-51FC-451A-8DCE-59B67BDDE394] (reporting strategy default)> on Task <DE92242A-ACFE-48CD-8572-C9F3018789A6>.<161> was not selected for reporting
default	15:51:47.352139-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [543A519D-020E-4570-911C-47C80819D8EC] (reporting strategy default)> on Task <C5C2AD22-6AA4-4A1B-9408-D9359B55AF50>.<160> was not selected for reporting
default	15:51:47.361661-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:47.361989-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	15:51:47.362489-0500	RedLemon	Connection 14: enabling TLS
default	15:51:47.362531-0500	RedLemon	Connection 14: starting, TC(0x0)
default	15:51:47.362587-0500	RedLemon	[C14 F8A00166-F956-4425-912D-5C032E250652 Hostname#cc2f46d4:443 quic-connection, url hash: ccdffc4c, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{90BB7D89-C425-446F-823D-960A5F622A3F}{(null)}{Y}{2} (private), proc: F2A35C62-84F6-3E68-B0C5-C12BFC414E01] start
default	15:51:47.362683-0500	RedLemon	[C14 Hostname#cc2f46d4:443 initial path ((null))] event: path:start @0.000s
default	15:51:47.364073-0500	RedLemon	[C14 Hostname#cc2f46d4:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: F5679C9E-E915-4785-808E-05D1ABD936C2
default	15:51:47.364662-0500	RedLemon	[C14 Hostname#cc2f46d4:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.001s
default	15:51:47.364723-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C14] reporting state preparing
default	15:51:47.365154-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 initial path ((null))] event: path:start @0.002s
default	15:51:47.365540-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.002s, uuid: 42E0FA53-A2E8-410D-8F0A-402002B77A13
default	15:51:47.365977-0500	mDNSResponder	[R1757] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'f1sHzVcJqTCJl3J8hK/U6g=='>, options: 0x8 {use-failover}, client pid: 8572 (RedLemon)
default	15:51:47.365748-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.003s
default	15:51:47.365963-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> setting up Connection 14
default	15:51:47.374762-0500	RedLemon	Task <DE92242A-ACFE-48CD-8572-C9F3018789A6>.<161> summary for task success {transaction_duration_ms=14, response_status=200, cache_hit=true}
default	15:51:47.381454-0500	RedLemon	Task <DE92242A-ACFE-48CD-8572-C9F3018789A6>.<161> finished successfully
default	15:51:47.381544-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_alternative @0.018s
default	15:51:47.381886-0500	RedLemon	Task <087EA0B8-4D62-4F20-A5E2-324E1E357CE2>.<158> summary for task success {transaction_duration_ms=21, response_status=200, cache_hit=true}
default	15:51:47.381957-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#59484bc1.443
default	15:51:47.382107-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#e264860f.443
default	15:51:47.382111-0500	RedLemon	Task <087EA0B8-4D62-4F20-A5E2-324E1E357CE2>.<158> finished successfully
default	15:51:47.382306-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#cca10403:443
default	15:51:47.382320-0500	RedLemon	Task <C5C2AD22-6AA4-4A1B-9408-D9359B55AF50>.<160> summary for task success {transaction_duration_ms=21, response_status=200, cache_hit=true}
default	15:51:47.382461-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#b0ea87ff.443
default	15:51:47.382632-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#0add3092:443
default	15:51:47.382673-0500	RedLemon	Task <C5C2AD22-6AA4-4A1B-9408-D9359B55AF50>.<160> finished successfully
default	15:51:47.382915-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#f6877565:443
default	15:51:47.383122-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.020s
default	15:51:47.383800-0500	RedLemon	[C14.1.1 IPv6#59484bc1.443 initial path ((null))] event: path:start @0.021s
default	15:51:47.384339-0500	RedLemon	[C14.1.1 IPv6#59484bc1.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.021s, uuid: BDF2EB9B-9C9B-4556-83A0-05D18B62E937
default	15:51:47.384565-0500	RedLemon	[C14.1.1 IPv6#59484bc1.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.021s
default	15:51:47.385246-0500	RedLemon	[C14.1.1 IPv6#59484bc1.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.022s
default	15:51:47.386209-0500	RedLemon	[C14.1.1 IPv6#59484bc1.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.023s
default	15:51:47.386441-0500	RedLemon	tcp_output [C14.1.1:3] flags=[S] seq=2109340840, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2109340840
default	15:51:47.387470-0500	RedLemon	Task <88F5353B-9028-4B6C-8739-8DD3582AA09B>.<162> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:47.387924-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [34BFF9EA-4718-43D7-9010-B13612BB2D64] (reporting strategy default)> on Task <88F5353B-9028-4B6C-8739-8DD3582AA09B>.<162> was not selected for reporting
default	15:51:47.387902-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1897 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:47.388427-0500	runningboardd	Assertion 174-8572-1897 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:47.390284-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:47.390466-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:47.391501-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:47.394452-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1898 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:47.394797-0500	RedLemon	Task <88F5353B-9028-4B6C-8739-8DD3582AA09B>.<162> summary for task success {transaction_duration_ms=6, response_status=200, cache_hit=true}
default	15:51:47.395020-0500	RedLemon	Task <88F5353B-9028-4B6C-8739-8DD3582AA09B>.<162> finished successfully
default	15:51:47.399627-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_alternative @0.036s
default	15:51:47.400161-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#e264860f.443
default	15:51:47.400335-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#cca10403:443
default	15:51:47.400492-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#b0ea87ff.443
default	15:51:47.400643-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#0add3092:443
default	15:51:47.400785-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#f6877565:443
default	15:51:47.400994-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.038s
default	15:51:47.406995-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#e264860f.443
default	15:51:47.407167-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#b0ea87ff.443
default	15:51:47.407337-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#cca10403:443
default	15:51:47.407501-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#f6877565:443
default	15:51:47.407659-0500	RedLemon	nw_endpoint_resolver_update [C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#0add3092:443
default	15:51:47.407880-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.045s
default	15:51:47.407946-0500	RedLemon	tcp_input [C14.1.1:3] flags=[S.] seq=1102649756, ack=2109340841, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2109340840
default	15:51:47.408041-0500	RedLemon	nw_flow_connected [C14.1.1 IPv6#59484bc1.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:51:47.408411-0500	RedLemon	[C14.1.1 IPv6#59484bc1.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.045s
default	15:51:47.408917-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.046s
default	15:51:47.409003-0500	RedLemon	[C14 Hostname#cc2f46d4:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.046s
default	15:51:47.409879-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C14.1.1:2][0x7fbf939c4f10] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:51:47.410013-0500	RedLemon	boringssl_context_info_handler(2028) [C14.1.1:2][0x7fbf939c4f10] Client handshake started
default	15:51:47.410275-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS client enter_early_data
default	15:51:47.410424-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS client read_server_hello
default	15:51:47.411875-0500	runningboardd	Assertion 174-114-1898 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:47.406188-0500	mDNSResponder	[R1757] getaddrinfo stop -- hostname: <mask.hash: 'f1sHzVcJqTCJl3J8hK/U6g=='>, client pid: 8572 (RedLemon)
default	15:51:47.413480-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:47.413533-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:47.413587-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:47.432977-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:51:47.433073-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client read_server_hello
default	15:51:47.433680-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:51:47.436526-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client read_certificate_request
default	15:51:47.436602-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client read_server_certificate
default	15:51:47.436676-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:51:47.437139-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C14.1.1:2][0x7fbf939c4f10] Performing external trust evaluation
default	15:51:47.437323-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C14.1.1:2][0x7fbf939c4f10] Asyncing for external verify block
default	15:51:47.437556-0500	RedLemon	Connection 14: asked to evaluate TLS Trust
default	15:51:47.437963-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> auth completion disp=1 cred=0x0
default	15:51:47.448157-0500	RedLemon	Connection 14: TLS Trust result 0
default	15:51:47.448225-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C14.1.1:2][0x7fbf939c4f10] Returning from external verify block with result: true
default	15:51:47.448314-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C14.1.1:2][0x7fbf939c4f10] Certificate verification result: OK
default	15:51:47.448720-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client read_server_finished
default	15:51:47.448805-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:51:47.448826-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:51:47.448844-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client send_client_certificate
default	15:51:47.448863-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client complete_second_flight
default	15:51:47.448962-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS 1.3 client done
default	15:51:47.449361-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS client finish_client_handshake
default	15:51:47.449482-0500	RedLemon	boringssl_context_info_handler(2045) [C14.1.1:2][0x7fbf939c4f10] Client handshake state: TLS client done
default	15:51:47.449584-0500	RedLemon	boringssl_context_info_handler(2034) [C14.1.1:2][0x7fbf939c4f10] Client handshake done
default	15:51:47.450380-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C14.1.1:2][0x7fbf939c4f10] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(40ms) flight_time(25ms) rtt(22ms) write_stalls(0) read_stalls(7)]
default	15:51:47.450571-0500	RedLemon	nw_flow_connected [C14.1.1 IPv6#59484bc1.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2853746719)
default	15:51:47.451159-0500	RedLemon	[C14.1.1 IPv6#59484bc1.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.088s
default	15:51:47.451312-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C14] reporting state ready
default	15:51:47.451466-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.088s
default	15:51:47.451613-0500	RedLemon	[C14 Hostname#cc2f46d4:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.088s
default	15:51:47.451847-0500	RedLemon	[C14.1.1 IPv6#59484bc1.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.089s
default	15:51:47.452003-0500	RedLemon	[C14.1 Hostname#cc2f46d4:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.089s
default	15:51:47.452068-0500	RedLemon	[C14 Hostname#cc2f46d4:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.089s
default	15:51:47.452398-0500	RedLemon	Connection 14: connected successfully
default	15:51:47.452464-0500	RedLemon	Connection 14: TLS handshake complete
default	15:51:47.452763-0500	RedLemon	Connection 14: ready C(N) E(N)
default	15:51:47.453344-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> now using Connection 14
default	15:51:47.453460-0500	RedLemon	Connection 14: received viability advisory(Y)
default	15:51:47.453591-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> sent request, body N 0
default	15:51:47.655961-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> received response, status 200 content U
default	15:51:47.871942-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> done using Connection 14
default	15:51:47.872437-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> response ended
default	15:51:47.872648-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> summary for task success {transaction_duration_ms=515, response_status=200, connection=14, protocol="h2", domain_lookup_duration_ms=17, connect_duration_ms=65, secure_connection_duration_ms=40, private_relay=false, request_start_ms=96, request_duration_ms=0, response_start_ms=298, response_duration_ms=216, request_bytes=569, response_bytes=6939, cache_hit=true}
default	15:51:47.872868-0500	RedLemon	Task <3627556D-9A39-48BF-B6A0-4074D65696F2>.<159> finished successfully
default	15:51:47.907042-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 207
default	15:51:47.907270-0500	RedLemon	   INPUT[0]: Frankenstein.2025.2160p.NF.WEB-DL.HDR.MULTi.DDP5.1.Atmos.H265-BEN.THE.MEN
👤 542 💾 36.27 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇷🇺 / 🇮🇹 / 🇵🇹 / 🇪🇸 / 🇫🇷 / 🇩🇪 / 🇮🇳 / 🇵🇱 / 🇺🇦 | 2160p | torrentio
default	15:51:47.907406-0500	RedLemon	   INPUT[1]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:51:47.907715-0500	RedLemon	   INPUT[2]: Frankenstein.2025.2160p.NF.WEB-DL.DV.P5.ENG.LATINO.DDP5.1.Atmos.MP4.H265-BTM
👤 109 💾 22.86 GB ⚙️ ThePirateBay
Multi Audio / 🇬🇧 / 🇲🇽 | 2160p | torrentio
default	15:51:47.907877-0500	RedLemon	   INPUT[3]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	15:51:47.908008-0500	RedLemon	   INPUT[4]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:51:47.908130-0500	RedLemon	   INPUT[5]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
default	15:51:47.908449-0500	RedLemon	   INPUT[6]: Frankenstein (2025) [MULTi] [2160p] [NF] [WEB-DL] [HDR] [H265] [DDP5.1.Atmos-K83] [Lektor PL i Napisy PL]
👤 18 💾 21.81 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 2160p | torrentio
default	15:51:47.908575-0500	RedLemon	   INPUT[7]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	15:51:47.918873-0500	RedLemon	   INPUT[8]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	15:51:47.919019-0500	RedLemon	   INPUT[9]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	15:51:47.919158-0500	RedLemon	   INPUT[10]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	15:51:47.919291-0500	RedLemon	   INPUT[11]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:51:47.955964-0500	RedLemon	   INPUT[12]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	15:51:47.956137-0500	RedLemon	   INPUT[13]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.DV.H.265-SNAKE
👤 35 💾 3 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.956260-0500	RedLemon	   INPUT[14]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.956377-0500	RedLemon	   INPUT[15]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.HDR.H.265-SNAKE
👤 12 💾 4.19 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.956496-0500	RedLemon	   INPUT[16]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	15:51:47.956614-0500	RedLemon	   INPUT[17]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.956742-0500	RedLemon	   INPUT[18]: Frankenstein.2025.1080p.WEB.h264-ETHEL
👤 175 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.957087-0500	RedLemon	   INPUT[19]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:51:47.957423-0500	RedLemon	   INPUT[20]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:51:47.957590-0500	RedLemon	   INPUT[21]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:51:47.957727-0500	RedLemon	   INPUT[22]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:51:47.958111-0500	RedLemon	   INPUT[23]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.958230-0500	RedLemon	   INPUT[24]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
👤 122 💾 5.98 GB ⚙️ 1337x | 1080p | torrentio
default	15:51:47.958359-0500	RedLemon	   INPUT[25]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:51:47.959287-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	15:51:47.959511-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.81 GB ⚙️ YTS | 1080p | torrentio
default	15:51:47.968883-0500	RedLemon	   INPUT[28]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	15:51:47.969971-0500	RedLemon	   INPUT[29]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.970141-0500	RedLemon	   INPUT[30]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	15:51:47.989106-0500	RedLemon	   INPUT[31]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.989295-0500	RedLemon	   INPUT[32]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.989722-0500	RedLemon	   INPUT[33]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:51:47.989878-0500	RedLemon	   INPUT[34]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	15:51:47.990102-0500	RedLemon	   INPUT[35]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	15:51:47.990268-0500	RedLemon	   INPUT[36]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	15:51:47.990417-0500	RedLemon	   INPUT[37]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	15:51:47.990562-0500	RedLemon	   INPUT[38]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:51:47.990709-0500	RedLemon	   INPUT[39]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	15:51:47.990849-0500	RedLemon	   INPUT[40]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:51:47.990967-0500	RedLemon	   INPUT[41]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.991086-0500	RedLemon	   INPUT[42]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	15:51:47.991229-0500	RedLemon	   INPUT[43]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:51:47.991410-0500	RedLemon	   INPUT[44]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:51:47.991575-0500	RedLemon	   INPUT[45]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	15:51:47.991724-0500	RedLemon	   INPUT[46]: Frankenstein (2025) [MULTi] [1080p] [NF] [WEB-DL] [H264] [DDP5.1.Atmos-K83[ [Lektor PL i Napisy PL]
👤 9 💾 6.66 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 1080p | torrentio
default	15:51:47.992233-0500	RedLemon	   INPUT[47]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:51:47.993557-0500	RedLemon	   INPUT[48]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:51:47.993999-0500	RedLemon	   INPUT[49]: Frankenstein.2025.WEB-DL.1080p-Dual-Lat
👤 7 💾 6.8 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:51:47.994219-0500	RedLemon	   INPUT[50]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	15:51:47.994358-0500	RedLemon	   INPUT[51]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.994493-0500	RedLemon	   INPUT[52]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:51:47.994627-0500	RedLemon	   INPUT[53]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.994755-0500	RedLemon	   INPUT[54]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	15:51:47.994885-0500	RedLemon	   INPUT[55]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:51:47.995004-0500	RedLemon	   INPUT[56]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.995132-0500	RedLemon	   INPUT[57]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:51:47.995261-0500	RedLemon	   INPUT[58]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	15:51:47.995397-0500	RedLemon	   INPUT[59]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	15:51:47.995517-0500	RedLemon	   INPUT[60]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	15:51:47.995630-0500	RedLemon	   INPUT[61]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	15:51:47.995749-0500	RedLemon	   INPUT[62]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:51:47.995878-0500	RedLemon	   INPUT[63]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	15:51:47.996000-0500	RedLemon	   INPUT[64]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:51:47.996371-0500	RedLemon	   INPUT[65]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	15:51:47.996539-0500	RedLemon	   INPUT[66]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	15:51:47.996850-0500	RedLemon	   INPUT[67]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:51:47.997018-0500	RedLemon	   INPUT[68]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	15:51:47.997168-0500	RedLemon	   INPUT[69]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:51:47.997309-0500	RedLemon	   INPUT[70]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	15:51:47.997452-0500	RedLemon	   INPUT[71]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	15:51:47.997600-0500	RedLemon	   INPUT[72]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	15:51:47.997742-0500	RedLemon	   INPUT[73]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	15:51:47.997912-0500	RedLemon	   INPUT[74]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	15:51:47.998096-0500	RedLemon	   INPUT[75]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	15:51:47.998239-0500	RedLemon	   INPUT[76]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	15:51:47.998366-0500	RedLemon	   INPUT[77]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	15:51:47.998495-0500	RedLemon	   INPUT[78]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	15:51:47.998675-0500	RedLemon	   INPUT[79]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	15:51:47.998853-0500	RedLemon	   INPUT[80]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	15:51:47.999031-0500	RedLemon	   INPUT[81]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:51:47.999213-0500	RedLemon	   INPUT[82]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	15:51:47.999423-0500	RedLemon	   INPUT[83]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	15:51:48.999862-0500	RedLemon	   INPUT[84]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	15:51:48.000202-0500	RedLemon	   INPUT[85]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	15:51:48.000421-0500	RedLemon	   INPUT[86]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:51:48.000663-0500	RedLemon	   INPUT[87]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	15:51:48.000958-0500	RedLemon	   INPUT[88]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	15:51:48.001245-0500	RedLemon	   INPUT[89]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	15:51:48.001535-0500	RedLemon	   INPUT[90]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	15:51:48.001781-0500	RedLemon	   INPUT[91]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	15:51:48.002063-0500	RedLemon	   INPUT[92]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	15:51:48.002441-0500	RedLemon	   INPUT[93]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	15:51:48.002887-0500	RedLemon	   INPUT[94]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	15:51:48.003300-0500	RedLemon	   INPUT[95]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	15:51:48.003592-0500	RedLemon	   INPUT[96]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	15:51:48.003788-0500	RedLemon	   INPUT[97]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	15:51:48.003976-0500	RedLemon	   INPUT[98]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	15:51:48.004154-0500	RedLemon	   INPUT[99]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	15:51:48.004345-0500	RedLemon	   INPUT[100]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	15:51:48.004882-0500	RedLemon	   INPUT[101]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	15:51:48.005141-0500	RedLemon	   INPUT[102]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	15:51:48.005341-0500	RedLemon	   INPUT[103]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	15:51:48.005528-0500	RedLemon	   INPUT[104]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	15:51:48.005723-0500	RedLemon	   INPUT[105]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	15:51:48.005896-0500	RedLemon	   INPUT[106]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	15:51:48.006064-0500	RedLemon	   INPUT[107]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	15:51:48.006228-0500	RedLemon	   INPUT[108]: FRANKENSTEIN mkv | Unknown | zilean
default	15:51:48.006395-0500	RedLemon	   INPUT[109]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	15:51:48.006572-0500	RedLemon	   INPUT[110]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	15:51:48.006740-0500	RedLemon	   INPUT[111]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	15:51:48.006905-0500	RedLemon	   INPUT[112]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	15:51:48.007155-0500	RedLemon	   INPUT[113]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	15:51:48.007554-0500	RedLemon	   INPUT[114]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	15:51:48.007922-0500	RedLemon	   INPUT[115]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	15:51:48.008140-0500	RedLemon	   INPUT[116]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	15:51:48.008320-0500	RedLemon	   INPUT[117]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	15:51:48.008888-0500	RedLemon	   INPUT[118]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	15:51:48.009699-0500	RedLemon	   INPUT[119]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	15:51:48.010267-0500	RedLemon	   INPUT[120]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	15:51:48.010519-0500	RedLemon	   INPUT[121]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	15:51:48.010739-0500	RedLemon	   INPUT[122]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	15:51:48.010987-0500	RedLemon	   INPUT[123]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	15:51:48.011202-0500	RedLemon	   INPUT[124]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	15:51:48.011395-0500	RedLemon	   INPUT[125]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	15:51:48.011576-0500	RedLemon	   INPUT[126]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	15:51:48.011759-0500	RedLemon	   INPUT[127]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	15:51:48.011935-0500	RedLemon	   INPUT[128]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	15:51:48.012101-0500	RedLemon	   INPUT[129]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	15:51:48.012270-0500	RedLemon	   INPUT[130]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	15:51:48.012438-0500	RedLemon	   INPUT[131]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	15:51:48.012599-0500	RedLemon	   INPUT[132]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	15:51:48.012779-0500	RedLemon	   INPUT[133]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	15:51:48.012952-0500	RedLemon	   INPUT[134]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	15:51:48.013113-0500	RedLemon	   INPUT[135]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	15:51:48.013286-0500	RedLemon	   INPUT[136]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	15:51:48.013458-0500	RedLemon	   INPUT[137]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	15:51:48.013628-0500	RedLemon	   INPUT[138]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	15:51:48.013801-0500	RedLemon	   INPUT[139]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	15:51:48.013972-0500	RedLemon	   INPUT[140]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	15:51:48.014141-0500	RedLemon	   INPUT[141]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
default	15:51:48.014319-0500	RedLemon	   INPUT[142]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	15:51:48.014497-0500	RedLemon	   INPUT[143]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	15:51:48.014673-0500	RedLemon	   INPUT[144]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	15:51:48.014844-0500	RedLemon	   INPUT[145]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	15:51:48.015014-0500	RedLemon	   INPUT[146]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	15:51:48.015187-0500	RedLemon	   INPUT[147]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	15:51:48.015718-0500	RedLemon	   INPUT[148]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	15:51:48.015918-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.016099-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.016298-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.016458-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.016601-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.016712-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.016969-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.017096-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.017210-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.017421-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.017661-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.017822-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.018063-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.018296-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.018487-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.018651-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.018764-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.018874-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.018981-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.019085-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.019186-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.019288-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.019388-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.019488-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.019581-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.020840-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	15:51:48.021033-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.021147-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.021253-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.021653-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.021929-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.023736-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.024203-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.024492-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.026628-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.027050-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.027214-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.027504-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.027949-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.028413-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.028624-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.030555-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.032282-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.032875-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.034097-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.035334-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.035999-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.036391-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.036716-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.037781-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 1080p | 1080p | comet
default	15:51:48.037955-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	15:51:48.038427-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 720p | 720p | comet
default	15:51:48.038686-0500	RedLemon	   INPUT[201]: [RD⚡] Comet 720p | 720p | comet
default	15:51:48.038892-0500	RedLemon	   INPUT[202]: [RD⚡] Comet 480p | 480p | comet
default	15:51:48.039324-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	15:51:48.039577-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	15:51:48.040044-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	15:51:48.040299-0500	RedLemon	   INPUT[206]: [RD⚡] Comet unknown | unknown | comet
default	15:51:48.040587-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	15:51:48.041589-0500	RedLemon	Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:48.043199-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E1DE8AA2-CF64-43E1-BE7C-999F289492CA] (reporting strategy default)> on Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> was not selected for reporting
default	15:51:48.044994-0500	RedLemon	Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:48.045394-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	15:51:48.045845-0500	RedLemon	Connection 15: enabling TLS
default	15:51:48.045887-0500	RedLemon	Connection 15: starting, TC(0x0)
default	15:51:48.045945-0500	RedLemon	[C15 E5764720-D930-480E-97A9-33513BB51F46 Hostname#b2955b41:443 quic-connection, url hash: fb5c59d4, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{90BB7D89-C425-446F-823D-960A5F622A3F}{(null)}{Y}{2} (private), proc: F2A35C62-84F6-3E68-B0C5-C12BFC414E01] start
default	15:51:48.046039-0500	RedLemon	[C15 Hostname#b2955b41:443 initial path ((null))] event: path:start @0.000s
default	15:51:48.046456-0500	RedLemon	[C15 Hostname#b2955b41:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: E1EC1672-8B83-4A8D-A514-3075CA902098
default	15:51:48.046648-0500	RedLemon	[C15 Hostname#b2955b41:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	15:51:48.046689-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C15] reporting state preparing
default	15:51:48.047066-0500	RedLemon	[C15.1 Hostname#b2955b41:443 initial path ((null))] event: path:start @0.001s
default	15:51:48.047518-0500	RedLemon	[C15.1 Hostname#b2955b41:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: 96BF542F-2F5F-4E43-AB7E-5128FD31DCB5
default	15:51:48.047744-0500	RedLemon	[C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	15:51:48.048028-0500	mDNSResponder	[R1758] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: '9i/Fwt+MkPMfnlIoEYH4yQ=='>, options: 0x8 {use-failover}, client pid: 8572 (RedLemon)
default	15:51:48.048314-0500	RedLemon	Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> setting up Connection 15
default	15:51:48.051285-0500	RedLemon	nw_endpoint_resolver_update [C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#3bcd49a0.443
default	15:51:48.051420-0500	RedLemon	nw_endpoint_resolver_update [C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#3e8bdc91:443
default	15:51:48.051645-0500	RedLemon	[C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.005s
default	15:51:48.051925-0500	RedLemon	[C15.1.1 IPv6#3bcd49a0.443 initial path ((null))] event: path:start @0.005s
default	15:51:48.052462-0500	RedLemon	[C15.1.1 IPv6#3bcd49a0.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.006s, uuid: E3221F6D-CDA6-4F0C-8CA0-0912431AD732
default	15:51:48.052830-0500	RedLemon	[C15.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.006s
default	15:51:48.053726-0500	RedLemon	[C15.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.007s
default	15:51:48.055289-0500	RedLemon	nw_protocol_instance_ignore_future_path_changes [C15.1.1:2] Ignoring future path changes for protocol
default	15:51:48.055599-0500	RedLemon	quic_initialize_block_invoke [C15.1.1:2] [-484501ec62d12c55] created QUIC connection (spin bit enabled)
default	15:51:48.056619-0500	RedLemon	[C15.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.010s
default	15:51:48.058885-0500	RedLemon	quic_crypto_new_flow [C15.1.1:2] [-484501ec62d12c55] TLS stream is: [C16]
default	15:51:48.058993-0500	RedLemon	[C16 F8BA239C-4555-4226-A225-ADE98081D94F IPv6#3bcd49a0.443 quic-connection, url hash: fb5c59d4, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{90BB7D89-C425-446F-823D-960A5F622A3F}{(null)}{Y}{2} (private), proc: F2A35C62-84F6-3E68-B0C5-C12BFC414E01, no transport] start
default	15:51:48.059128-0500	RedLemon	[C16 IPv6#3bcd49a0.443 initial socket-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:start @0.000s
default	15:51:48.059309-0500	RedLemon	[C16 IPv6#3bcd49a0.443 waiting socket-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: E3221F6D-CDA6-4F0C-8CA0-0912431AD732
default	15:51:48.059623-0500	RedLemon	[C16 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.000s
default	15:51:48.059669-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C16] reporting state preparing
default	15:51:48.059864-0500	RedLemon	nw_flow_connected [C16 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (quic-connection)
default	15:51:48.060033-0500	RedLemon	[C16 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.000s
default	15:51:48.060429-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C16:1][0x7fbf96a5d840] TLS configured [min_version(0x0304) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:51:48.060559-0500	RedLemon	boringssl_context_info_handler(2028) [C16:1][0x7fbf96a5d840] Client handshake started
default	15:51:48.060766-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS client enter_early_data
default	15:51:48.061007-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS client read_server_hello
default	15:51:48.061358-0500	RedLemon	[C16 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.002s
default	15:51:48.071294-0500	RedLemon	nw_endpoint_resolver_update [C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#3e8bdc91:443
default	15:51:48.071561-0500	RedLemon	[C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.025s
default	15:51:48.077167-0500	RedLemon	nw_endpoint_resolver_update [C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#3e8bdc91:443
default	15:51:48.077383-0500	RedLemon	[C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.031s
error	15:51:48.080188-0500	RedLemon	quic_packet_parser_inner [C15.1.1:2] [-015429574cce0edd325434579bce15944a7a07b0] SH fixed bit is zero
default	15:51:48.080761-0500	mDNSResponder	[R1758] getaddrinfo stop -- hostname: <mask.hash: '9i/Fwt+MkPMfnlIoEYH4yQ=='>, client pid: 8572 (RedLemon)
default	15:51:48.081598-0500	RedLemon	nw_endpoint_resolver_update [C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#3e8bdc91:443
default	15:51:48.081836-0500	RedLemon	[C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.035s
default	15:51:48.084512-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:51:48.084608-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client read_server_hello
default	15:51:48.085166-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client read_encrypted_extensions
error	15:51:48.085550-0500	RedLemon	quic_packet_parser_inner [C15.1.1:2] [-015429574cce0edd325434579bce15944a7a07b0] SH fixed bit is zero
default	15:51:48.085778-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client read_certificate_request
default	15:51:48.086054-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client read_server_certificate
default	15:51:48.086133-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:51:48.086612-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C16:1][0x7fbf96a5d840] Performing external trust evaluation
default	15:51:48.086805-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C16:1][0x7fbf96a5d840] Asyncing for external verify block
default	15:51:48.087568-0500	RedLemon	Connection 15: asked to evaluate TLS Trust
default	15:51:48.087898-0500	RedLemon	Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> auth completion disp=1 cred=0x0
default	15:51:48.098725-0500	RedLemon	Connection 15: TLS Trust result 0
default	15:51:48.098798-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C16:1][0x7fbf96a5d840] Returning from external verify block with result: true
default	15:51:48.099174-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C16:1][0x7fbf96a5d840] Certificate verification result: OK
default	15:51:48.099844-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client read_server_finished
default	15:51:48.099997-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:51:48.100055-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:51:48.100491-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client send_client_certificate
default	15:51:48.100678-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client complete_second_flight
default	15:51:48.101227-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS 1.3 client done
default	15:51:48.101368-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS client finish_client_handshake
default	15:51:48.101429-0500	RedLemon	boringssl_context_info_handler(2045) [C16:1][0x7fbf96a5d840] Client handshake state: TLS client done
default	15:51:48.101473-0500	RedLemon	boringssl_context_info_handler(2034) [C16:1][0x7fbf96a5d840] Client handshake done
default	15:51:48.102421-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C16:1][0x7fbf96a5d840] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h3) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(41ms) flight_time(25ms) rtt(24ms) write_stalls(0) read_stalls(4)]
default	15:51:48.102807-0500	RedLemon	nw_flow_connected [C16 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (tls)
default	15:51:48.103178-0500	RedLemon	[C16 IPv6#3bcd49a0.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.044s
default	15:51:48.103909-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C16] reporting state ready
default	15:51:48.103981-0500	RedLemon	[C16 IPv6#3bcd49a0.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.044s
default	15:51:48.105515-0500	RedLemon	quic_pmtud_restart [C15.1.1:2] [-015429574cce0edd325434579bce15944a7a07b0] PMTUD enabled, max PMTU: 1398, header size: 48, current PMTU 1248
default	15:51:48.105667-0500	RedLemon	quic_crypto_tls_ready_inner [C15.1.1:2] [-015429574cce0edd325434579bce15944a7a07b0] QUIC connection established in 48.846 ms, RTT 19.231 ms
default	15:51:48.105747-0500	RedLemon	nw_flow_connected [C15.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (quic-connection)
default	15:51:48.105973-0500	RedLemon	[C15.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.059s
default	15:51:48.106117-0500	RedLemon	[C15.1 Hostname#b2955b41:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.060s
default	15:51:48.106182-0500	RedLemon	[C15 Hostname#b2955b41:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.060s
default	15:51:48.106401-0500	RedLemon	nw_flow_connected [C15.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2853746719)
default	15:51:48.106847-0500	RedLemon	[C15.1.1 IPv6#3bcd49a0.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.060s
default	15:51:48.107224-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C15] reporting state ready
default	15:51:48.107397-0500	RedLemon	[C15.1 Hostname#b2955b41:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.061s
default	15:51:48.107460-0500	RedLemon	[C15 Hostname#b2955b41:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.061s
default	15:51:48.108824-0500	RedLemon	[C15.1.1 IPv6#3bcd49a0.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.062s
default	15:51:48.109246-0500	RedLemon	[C15.1 Hostname#b2955b41:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.063s
default	15:51:48.109313-0500	RedLemon	[C15 Hostname#b2955b41:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.063s
default	15:51:48.109568-0500	RedLemon	Connection 15: connected successfully
default	15:51:48.109623-0500	RedLemon	Connection 15: TLS handshake complete
default	15:51:48.109901-0500	RedLemon	Connection 15: ready C(N) E(N)
default	15:51:48.111426-0500	RedLemon	Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> now using Connection 15
default	15:51:48.112555-0500	RedLemon	Connection 15: received viability advisory(Y)
default	15:51:48.112613-0500	RedLemon	0x7fbf96299308 ID=0 Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> sent request, body N 0
default	15:51:48.114346-0500	RedLemon	boringssl_context_new_session_handler(1336) [C16:1][0x7fbf96a5d840] Asyncing for session update block
default	15:51:48.114779-0500	RedLemon	boringssl_context_new_session_handler(1336) [C16:1][0x7fbf96a5d840] Asyncing for session update block
default	15:51:48.118447-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C16:1][0x7fbf96a5d840] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h3) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(41ms) flight_time(25ms) rtt(24ms) write_stalls(0) read_stalls(4)]
default	15:51:48.118581-0500	RedLemon	nw_flow_connected [C16 IPv6#3bcd49a0.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (tls)
default	15:51:48.120703-0500	RedLemon	boringssl_context_new_session_handler_block_invoke(1339) [C16:1][0x7fbf96a5d840] Returning from session update block
default	15:51:48.123383-0500	RedLemon	boringssl_context_new_session_handler_block_invoke(1339) [C16:1][0x7fbf96a5d840] Returning from session update block
default	15:51:48.123667-0500	RedLemon	quic_stream_create_inbound [C15.1.1:2] [-015429574cce0edd325434579bce15944a7a07b0] creating inbound stream 3
default	15:51:48.124705-0500	RedLemon	quic_stream_create_inbound [C15.1.1:2] [-015429574cce0edd325434579bce15944a7a07b0] creating inbound stream 7
default	15:51:48.125277-0500	RedLemon	quic_stream_create_inbound [C15.1.1:2] [-015429574cce0edd325434579bce15944a7a07b0] creating inbound stream 11
default	15:51:48.127716-0500	RedLemon	quic_stream_create_inbound [C15.1.1:2] [-015429574cce0edd325434579bce15944a7a07b0] creating inbound stream 15
default	15:51:48.270369-0500	RedLemon	0x7fbf96299308 ID=0 Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> received response, status 200 content K
default	15:51:48.271035-0500	RedLemon	Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> response ended
default	15:51:48.271509-0500	RedLemon	Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> done using Connection 15
default	15:51:48.271780-0500	RedLemon	Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> summary for task success {transaction_duration_ms=228, response_status=200, connection=15, protocol="h3", domain_lookup_duration_ms=4, connect_duration_ms=50, secure_connection_duration_ms=48, private_relay=false, request_start_ms=67, request_duration_ms=1, response_start_ms=226, response_duration_ms=1, request_bytes=166, response_bytes=1380, cache_hit=true}
default	15:51:48.272281-0500	RedLemon	Task <6AB48199-F14C-41E1-A1BC-1CDE06C97DF0>.<163> finished successfully
default	15:51:48.277560-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	15:51:48.277811-0500	RedLemon	✅ Filtered to 4 English subtitles
default	15:51:48.278270-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	15:51:48.278774-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	15:51:48.279912-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.280558-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.280755-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.281213-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.281502-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.282046-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.282294-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.282980-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.283200-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.284040-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.284243-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.284780-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.285170-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.285334-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.285834-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.286185-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.286863-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.287420-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.288348-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.288955-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.289203-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.289403-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.290019-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.290183-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.290709-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.291034-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.292347-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.292768-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.292977-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.293628-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.293931-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.294565-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.294708-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.295114-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.295294-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.295882-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.296344-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.296471-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.296904-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.297152-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.297353-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.297821-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.297938-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.298636-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.298856-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.299375-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.299556-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.300065-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.300198-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.301058-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.301322-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.302412-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.302803-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.303154-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.303524-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.303966-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.304585-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.305047-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.305223-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.305834-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.306298-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.306449-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.306864-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.307125-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.307374-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.307917-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.308054-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.309142-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.309530-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.310444-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.310707-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.310972-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.311583-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.311709-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.312367-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.312731-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.312939-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.313369-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.313548-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.313922-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.314114-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.314274-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.314702-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.314907-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.315650-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.315859-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.316257-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.316445-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.316617-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.317182-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.317428-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.317893-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.318120-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.318511-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.318703-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.318876-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.319297-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.319502-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.320072-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.320259-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.321060-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.321271-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.321444-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.321902-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.322135-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.322350-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.322770-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.322946-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.323088-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.323451-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.323647-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.324054-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.324263-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.325289-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.326031-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.326381-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.327136-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.327573-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.327756-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.328188-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.328401-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.328839-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.329037-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.329179-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.329546-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.329731-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.329912-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.330322-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.330517-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.330941-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.331151-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.331293-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.331648-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.331815-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.331974-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.332701-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.333040-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.333520-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.333705-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.333846-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.334414-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.334666-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.335547-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.336246-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.337137-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.337506-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.338149-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.338722-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.338943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.339129-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.339607-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.339867-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.340070-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.340591-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.340745-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.340876-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.341495-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.341759-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.342194-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.342441-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.343218-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.344377-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.344687-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.345341-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.345576-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.345825-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.346281-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.346538-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.347204-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.347420-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.347961-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.348103-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.348202-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.349261-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.349658-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.349955-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.350765-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.351241-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.351475-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.352118-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.352518-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.352963-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.353123-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.353432-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.353610-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.353745-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.354115-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.354372-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.355021-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.355346-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.355972-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.356331-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.356657-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.357192-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.357351-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.357566-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.358072-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.358288-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.359142-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.359591-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.359776-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.360552-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.360783-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.361532-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.361732-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.362132-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.362315-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.362462-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.362929-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.363250-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.363864-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.364023-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.364629-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.364860-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.365031-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.366187-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.366379-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.366592-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.367676-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.367959-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.370786-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.371061-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.371499-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.371670-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.371810-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.372416-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.372611-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.373743-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.373979-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.374110-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.376524-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.378060-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.378472-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.379364-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.379760-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.380364-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.380692-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.380889-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.381551-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.381798-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.382289-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.382565-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.383286-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.383500-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.384227-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.384438-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.384699-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.385426-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.385691-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.385890-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.386310-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.386516-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.386651-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.387017-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.387192-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.387351-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.388008-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.388556-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.389286-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.389498-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.389641-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.390122-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.390309-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.390480-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.390923-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.391169-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.391356-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.392900-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.393304-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.393575-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.394454-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.394789-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.395292-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.395556-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.395751-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.396315-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.396558-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.397063-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.397265-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.397430-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.397893-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.398145-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.398349-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.398888-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.399122-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.399260-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.400177-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.400465-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.401247-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.403532-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.404161-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.405138-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.405915-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.406125-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.406929-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.407115-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.407737-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.408819-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.409646-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.411139-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.411701-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.411876-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.412621-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.412825-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.413460-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.414088-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.415033-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.415656-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.416452-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.417295-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.418256-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.418968-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.419240-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.419519-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.420413-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.420923-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.421576-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.422013-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.422214-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.423415-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.424050-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.424422-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.425285-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.426729-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.426908-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.428332-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.428514-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.428931-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.429517-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.429939-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.430713-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.431210-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.431865-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.432760-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.432977-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.434041-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.434662-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.435224-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.436546-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.436748-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.437140-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.437731-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.437907-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.438688-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.439476-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.440027-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.440819-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.441042-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.441183-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.442878-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.443147-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.444304-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.445179-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.445435-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.445846-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.446588-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.447038-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.447590-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.448051-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.448467-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.449148-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.450071-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.451122-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.451649-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.451977-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.452713-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.453269-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.453954-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.454458-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.454895-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.456043-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.456264-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.457175-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.458101-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.458808-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.459384-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.459599-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.460433-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.460669-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.461107-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.462317-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.462521-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.463262-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.463799-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.464046-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.464454-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.465060-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.465615-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.466345-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.466825-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.467170-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.471947-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.472511-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.473189-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.473432-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.478117-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.478560-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.479104-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.480189-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.480684-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.481251-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.481556-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.481758-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.482696-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.482893-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.483259-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.484704-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.485419-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.485876-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.486498-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.486896-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.494607-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.505662-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.505906-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.506700-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.506932-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.507308-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.507950-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.508188-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.509675-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.510163-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.510984-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.512151-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.512429-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.512922-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.513710-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.513873-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.514707-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.515188-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.516097-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.516287-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.517324-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.519226-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.519457-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.520469-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.521598-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.523597-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.524988-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.525243-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.526989-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.529266-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.530044-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.530284-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.530463-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.531254-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.531739-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.532615-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.533938-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.534403-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.537420-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.537708-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.538888-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.539525-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.540023-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.542141-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.544146-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.545892-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.546093-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.546741-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.546988-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.547563-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.548177-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.549010-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.549242-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.549801-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.550364-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.551927-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.552174-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.552846-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.553422-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.553693-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.554476-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.554656-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.556760-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.556996-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.558070-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.558769-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.559353-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.560084-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.560312-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.560847-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.563677-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.564558-0500	runningboardd	Invalidating assertion 174-8572-1897 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:48.564461-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.565387-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.565954-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.566121-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.566728-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.566960-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.568584-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.569969-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.570125-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.570210-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.570417-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.570508-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.570588-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.570781-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.571295-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.571543-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.571645-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.571715-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.571888-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.571974-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.572050-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.572379-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.572722-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.573978-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.574218-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.574316-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.574525-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.576802-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.578980-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.580415-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.580621-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.581340-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.581548-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.583976-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.584371-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.584480-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.584708-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.584847-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.584947-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.585841-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.586589-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.586823-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.588517-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.588815-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.589350-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.590220-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.590873-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.591041-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.591655-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.592264-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.592458-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.593086-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.593614-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.593734-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.593975-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.594099-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.594194-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.595251-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.595366-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.595633-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.597516-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.597795-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.597914-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.598012-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.598246-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.598407-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.599025-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.599163-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.599391-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.599497-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.599675-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.599764-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.599833-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.601744-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.601958-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.602600-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.603971-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.604187-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.604825-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.605180-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.605499-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.606338-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.607527-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.609127-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.609304-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.610105-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.610390-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.611803-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.612031-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.614341-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.614767-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.614938-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.617345-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.617563-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.617918-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.618092-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.618441-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.618577-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.618900-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.619045-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.619358-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.619535-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.620589-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.621248-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.621428-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.621995-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.622200-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.622853-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.623244-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.623400-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.623747-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.624358-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.624783-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.624924-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.627091-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.627270-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.627940-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.628159-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.634229-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.634419-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.635814-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.638300-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:51:48.638459-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:51:48.638576-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.638803-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.638889-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.639070-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.639153-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.639774-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.639934-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.640219-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.640357-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.640474-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.640748-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.640885-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.641006-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.641802-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.641936-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.642131-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.642222-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.643321-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.643714-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.644416-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.644579-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.645123-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.645313-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.645670-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.646150-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.646267-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.646461-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.646569-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.646770-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.646850-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.647025-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.648585-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.649843-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.649996-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.650669-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.652335-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.652688-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.652781-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.652861-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.653039-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.653141-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.653316-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.653407-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.653716-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.654450-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.654622-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.654987-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.655437-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.655971-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.656346-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.656492-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.656812-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.657123-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.658551-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.659565-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.659780-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.660978-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.661139-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.661366-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.661556-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.661645-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.662575-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.662745-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.663007-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.663216-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.663310-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.663500-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.663603-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.664773-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.664942-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.665534-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.665998-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.666610-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.666822-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.667145-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.667292-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.668729-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.669420-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.669608-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.669734-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.670088-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.670269-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.670659-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.670814-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.671159-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.671310-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.671664-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.671875-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.672420-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.672744-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.674420-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.676079-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.676302-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.676935-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.680968-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.681103-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.684324-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.684462-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.685062-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.685235-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.685482-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.685565-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.685750-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.685832-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.686003-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.687318-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.687952-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.688107-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.688426-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.688563-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.688875-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.689042-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.689331-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.693995-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.694232-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.695101-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.695225-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.695307-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.695739-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.695914-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.696333-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.696487-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.696604-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.697002-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.697150-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.697280-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.697854-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.697987-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.698180-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.698256-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.698416-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.698494-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.698652-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.699067-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.699393-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.699558-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.700283-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.702059-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.702368-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.703433-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.703809-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.703980-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.704528-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.704684-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.705024-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.705177-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.705502-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.705662-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.706015-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.706455-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.706816-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.706969-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.707506-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.707694-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.708106-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.708252-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.708369-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.709449-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.709630-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.709783-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.710644-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.710798-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.710993-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.711081-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.711149-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.711308-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.711388-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.712251-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.712501-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.712624-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.713308-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.713488-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.713607-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.713915-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.714049-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.714175-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.714637-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.714826-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.715387-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.715498-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.715706-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.715965-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.716449-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.716660-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.718894-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.719110-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.719249-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.719688-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.719875-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.720338-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.720551-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.721009-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.721189-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.721326-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.722840-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.723181-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.723356-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.727386-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.727655-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.728027-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.728179-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.728287-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.729477-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:48.729526-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:48.729572-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:48.731152-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.731323-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.732970-0500	runningboardd	Invalidating assertion 174-114-1898 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:48.732968-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.736772-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.736982-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.737936-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.739694-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.739824-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.740057-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.740149-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.740227-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.740416-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.740516-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.741235-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.741369-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.741666-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.743768-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.745090-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.745333-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.745713-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.747020-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.747173-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.747499-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.748162-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.749440-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.749613-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.749838-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.749943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.750020-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.751734-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.751966-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.752321-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.752710-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.757474-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.758094-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.758275-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.758394-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.759510-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.759633-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.759721-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.759922-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.760030-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.760852-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.761032-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.761523-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.762788-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.762943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.763041-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.763401-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.763686-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.764020-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.764261-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.764666-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.764822-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.765327-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.765508-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.766025-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.766132-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.766324-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.766407-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.766582-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.766680-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.766863-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.770864-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.771493-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.771615-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.771823-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.771930-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.772109-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.772196-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.772263-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.774069-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.774245-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.774606-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.774996-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.776525-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.777100-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.777205-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.777394-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.777481-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.777659-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.777765-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.780832-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.782013-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.783973-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.784362-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.784532-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.784920-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.785037-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.785402-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.785528-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.786463-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.789829-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.790339-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.790586-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.790734-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.790966-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.791059-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.791145-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.791570-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.791771-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.792758-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.792937-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.793237-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.794127-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.794488-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.794910-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.795864-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.796109-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.796509-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.796688-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.797177-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.797343-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.797662-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.798115-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.798470-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.798938-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.799117-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.799242-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.799567-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.799707-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.799834-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.800657-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.800868-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.803967-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.804158-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.804465-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.804825-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.804980-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.805232-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.805841-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.806037-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.806463-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.806993-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.807387-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.808356-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.808546-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.809287-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.809614-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.809818-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.810344-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.810509-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.812057-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.813715-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.813883-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.814337-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.814973-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.815155-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.816066-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.816531-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.816679-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.820044-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.820352-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.820486-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.821074-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.821283-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.821841-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.822019-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.822150-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.822477-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.822623-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.822753-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.823417-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.830852-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.834556-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.834709-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.834815-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.835165-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.835292-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.835410-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.838473-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.839272-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.839778-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.840018-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.840248-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.840785-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.841073-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.841794-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.845210-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.845464-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.847032-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.847907-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.849086-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.849662-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.849984-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.850701-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.851111-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.851300-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.851722-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.851892-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.852013-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.853012-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.853256-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.853455-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.855078-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.858850-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.859488-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.860011-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.860148-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.860821-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.861176-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.861330-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.861799-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.861927-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.862179-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.862268-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.862337-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.862550-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.862631-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.863486-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.865344-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.865767-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.866231-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.866348-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.866477-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.867211-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.867424-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.867554-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.872296-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.872492-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.872725-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.872826-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.872901-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.873075-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.873157-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.874325-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.874737-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.877695-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.878032-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.878143-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.878349-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.878441-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.878629-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.878751-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.881211-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.881791-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.882800-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.883115-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.883861-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.884093-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.886189-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.886380-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.894054-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.895062-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.899173-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.899516-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.900537-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.901936-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.902399-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.902592-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.904089-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.904294-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.904774-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.905344-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.905756-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.905927-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.906277-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.906457-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.907016-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.907159-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.907468-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.907660-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.908463-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.909584-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.909868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.909960-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.911314-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.911479-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.911803-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.911972-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.912307-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.912431-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.912723-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.912864-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.913176-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.913757-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.914141-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.914268-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.915510-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:48.914922-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.915571-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:48.915076-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.915621-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:48.916297-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.917054-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.917701-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.917864-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.919368-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.919548-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.920773-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.921034-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.921854-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.922913-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.923806-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.924092-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.927839-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.928320-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.928970-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.929121-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.929548-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.929932-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.930882-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.931324-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.932012-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.932909-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.934480-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.934654-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.934957-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.935331-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.935703-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.935846-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.936172-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.936347-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.938059-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.938221-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.941252-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.943267-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.943826-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.944125-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.944911-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.945174-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.945641-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.945812-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.946154-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.946271-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.946484-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.946593-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.946801-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.946878-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.947052-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.948106-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.948501-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.948662-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.950392-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.950723-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.952055-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.952214-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.952537-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.952713-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.953689-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.953864-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.954206-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.954364-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.955061-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.955291-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.956016-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.956163-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.956387-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.957267-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.957807-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.958738-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.959230-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.959389-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.960130-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.960319-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.961143-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.961347-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.961713-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.961909-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.963040-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.963176-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.963390-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.963495-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.963695-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.963771-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.963937-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.965059-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.966243-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.966756-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.967447-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.967683-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.970076-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.970371-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.970774-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.970967-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.971757-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.971920-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.973701-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.973953-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.974983-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.975270-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.977618-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.977830-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.978380-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.978635-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.979031-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.979290-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.980622-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.980792-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.981937-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.982367-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.983043-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.983207-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:48.983990-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:48.984944-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:48.985584-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.986090-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:48.986556-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:48.987173-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:48.987394-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:48.987660-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.000884-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.001110-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.001446-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.001605-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.001719-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.002012-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.002161-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.011997-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.012460-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.013004-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.014364-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.014553-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.014791-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.015341-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.015500-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.015635-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.015948-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.016269-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.016860-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.017080-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.017211-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.018717-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.018898-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.019026-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.019356-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.019512-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.019829-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.019990-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.020241-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.022058-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.022250-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.022511-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.023175-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.023370-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.023710-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.024451-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.025166-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.026107-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.026246-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.026340-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.026621-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.026794-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.027163-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.027654-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.027791-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.028117-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.028255-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.028382-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.028686-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.028831-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.030755-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.030929-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.031050-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.031348-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.031483-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.031610-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.032246-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.032385-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.032588-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.032680-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.032749-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.032911-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.032990-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.033637-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.035332-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.035552-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.037008-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.037244-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.038405-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.038693-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.038794-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.038877-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.039066-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.039169-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.039347-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.040033-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.040165-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.040746-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.040937-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.041765-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.042920-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.043076-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.043309-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.043404-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.043473-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.043638-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.043716-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.044532-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.046710-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.046916-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.047261-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.047418-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.047538-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.047838-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.047974-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.048098-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.048625-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.048758-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.048955-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.049046-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.049117-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.049280-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.049360-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.049904-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.050705-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.050913-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.051270-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.051785-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.051903-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.052119-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.052205-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.052280-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.052459-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.054599-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.055162-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.055324-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.055444-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.055732-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.055866-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.055990-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.056572-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.056775-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.057329-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.057586-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.057713-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.062587-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.062762-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.063160-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.063534-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.063704-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.065184-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.065346-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.065455-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.065747-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.065881-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.066009-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.066749-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.066950-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.070545-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.070760-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.070894-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.071244-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.071393-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.071527-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.072195-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.075018-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.076577-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.076785-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.076905-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.077771-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.077944-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.079015-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.079416-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.079596-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.079940-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.080096-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.080637-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.081054-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.081222-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.081373-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.082037-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.082351-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.083707-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.083929-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.084395-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.084747-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.084901-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.085026-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.086333-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.086802-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.096741-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.096923-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.097038-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.097309-0500	RedLemon	    📺 Resolution match: 1080p
default	15:51:49.097439-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.097882-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.098400-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.098540-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.098762-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.098845-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.099317-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.099479-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.100599-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.101308-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.104716-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.104939-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.105319-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.107076-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.107507-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.107690-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.108035-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.108170-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.108500-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.123289-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.123732-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.123907-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.124260-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.124389-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.128484-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.134666-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.135040-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.135202-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.135529-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.135658-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.135970-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.136126-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.136471-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.136667-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.137047-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.137185-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.137516-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.137701-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.140645-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.140846-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.143826-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.156750-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.158061-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.159109-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.159604-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.160571-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.161056-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:51:49.161761-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:49.162017-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:51:49.162111-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:49.162497-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:51:49.163324-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:51:49.163460-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 207
default	15:51:49.163567-0500	RedLemon	   OUTPUT[0]: Frankenstein.2025.2160p.NF.WEB-DL.HDR.MULTi.DDP5.1.Atmos.H265-BEN.THE.MEN
👤 542 💾 36.27 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇷🇺 / 🇮🇹 / 🇵🇹 / 🇪🇸 / 🇫🇷 / 🇩🇪 / 🇮🇳 / 🇵🇱 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	15:51:49.163651-0500	RedLemon	   OUTPUT[1]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:51:49.163729-0500	RedLemon	   OUTPUT[2]: Frankenstein.2025.2160p.NF.WEB-DL.DV.P5.ENG.LATINO.DDP5.1.Atmos.MP4.H265-BTM
👤 109 💾 22.86 GB ⚙️ ThePirateBay
Multi Audio / 🇬🇧 / 🇲🇽 | 2160p | torrentio | Subtitles: 3
default	15:51:49.163815-0500	RedLemon	   OUTPUT[3]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	15:51:49.163891-0500	RedLemon	   OUTPUT[4]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:51:49.167337-0500	RedLemon	   OUTPUT[5]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	15:51:49.167545-0500	RedLemon	   OUTPUT[6]: Frankenstein (2025) [MULTi] [2160p] [NF] [WEB-DL] [HDR] [H265] [DDP5.1.Atmos-K83] [Lektor PL i Napisy PL]
👤 18 💾 21.81 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 2160p | torrentio | Subtitles: 3
default	15:51:49.167674-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	15:51:49.167798-0500	RedLemon	   OUTPUT[8]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	15:51:49.167915-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	15:51:49.168047-0500	RedLemon	   OUTPUT[10]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	15:51:49.168175-0500	RedLemon	   OUTPUT[11]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:51:49.171614-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	15:51:49.171788-0500	RedLemon	   OUTPUT[13]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.DV.H.265-SNAKE
👤 35 💾 3 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.171941-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.172080-0500	RedLemon	   OUTPUT[15]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.HDR.H.265-SNAKE
👤 12 💾 4.19 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.172216-0500	RedLemon	   OUTPUT[16]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	15:51:49.172446-0500	RedLemon	   OUTPUT[17]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.172574-0500	RedLemon	   OUTPUT[18]: Frankenstein.2025.1080p.WEB.h264-ETHEL
👤 175 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.172883-0500	RedLemon	   OUTPUT[19]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:51:49.173028-0500	RedLemon	   OUTPUT[20]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:51:49.173408-0500	RedLemon	   OUTPUT[21]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:51:49.176814-0500	RedLemon	   OUTPUT[22]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:51:49.177412-0500	RedLemon	   OUTPUT[23]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.177941-0500	RedLemon	   OUTPUT[24]: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
👤 122 💾 5.98 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:51:49.178132-0500	RedLemon	   OUTPUT[25]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:51:49.178277-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	15:51:49.178412-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.81 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	15:51:49.178546-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	15:51:49.178903-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.179054-0500	RedLemon	   OUTPUT[30]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:51:49.179141-0500	RedLemon	   OUTPUT[31]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.179217-0500	RedLemon	   OUTPUT[32]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.179291-0500	RedLemon	   OUTPUT[33]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:51:49.179368-0500	RedLemon	   OUTPUT[34]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:51:49.179442-0500	RedLemon	   OUTPUT[35]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:51:49.179512-0500	RedLemon	   OUTPUT[36]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	15:51:49.179584-0500	RedLemon	   OUTPUT[37]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:51:49.179655-0500	RedLemon	   OUTPUT[38]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:51:49.179728-0500	RedLemon	   OUTPUT[39]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:51:49.179799-0500	RedLemon	   OUTPUT[40]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:51:49.179927-0500	RedLemon	   OUTPUT[41]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 5.98 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.180464-0500	RedLemon	   OUTPUT[42]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:51:49.180735-0500	RedLemon	   OUTPUT[43]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:51:49.181184-0500	RedLemon	   OUTPUT[44]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:51:49.181935-0500	RedLemon	   OUTPUT[45]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:51:49.183419-0500	RedLemon	   OUTPUT[46]: Frankenstein (2025) [MULTi] [1080p] [NF] [WEB-DL] [H264] [DDP5.1.Atmos-K83[ [Lektor PL i Napisy PL]
👤 9 💾 6.66 GB ⚙️ BestTorrents
Multi Audio / 🇬🇧 / 🇵🇱 | 1080p | torrentio | Subtitles: 3
default	15:51:49.184051-0500	RedLemon	   OUTPUT[47]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:51:49.184228-0500	RedLemon	   OUTPUT[48]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:51:49.184356-0500	RedLemon	   OUTPUT[49]: Frankenstein.2025.WEB-DL.1080p-Dual-Lat
👤 7 💾 6.8 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:51:49.184479-0500	RedLemon	   OUTPUT[50]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:51:49.184601-0500	RedLemon	   OUTPUT[51]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.184729-0500	RedLemon	   OUTPUT[52]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:51:49.184845-0500	RedLemon	   OUTPUT[53]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.184962-0500	RedLemon	   OUTPUT[54]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	15:51:49.185091-0500	RedLemon	   OUTPUT[55]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:51:49.185209-0500	RedLemon	   OUTPUT[56]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.185333-0500	RedLemon	   OUTPUT[57]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:51:49.185661-0500	RedLemon	   OUTPUT[58]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:51:49.186194-0500	RedLemon	   OUTPUT[59]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	15:51:49.186718-0500	RedLemon	   OUTPUT[60]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	15:51:49.186841-0500	RedLemon	   OUTPUT[61]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	15:51:49.186923-0500	RedLemon	   OUTPUT[62]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:51:49.187002-0500	RedLemon	   OUTPUT[63]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	15:51:49.187077-0500	RedLemon	   OUTPUT[64]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:51:49.187151-0500	RedLemon	   OUTPUT[65]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	15:51:49.187223-0500	RedLemon	   OUTPUT[66]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	15:51:49.188147-0500	RedLemon	   OUTPUT[67]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:51:49.188628-0500	RedLemon	   OUTPUT[68]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	15:51:49.188796-0500	RedLemon	   OUTPUT[69]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:51:49.188926-0500	RedLemon	   OUTPUT[70]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	15:51:49.189110-0500	RedLemon	   OUTPUT[71]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:51:49.189261-0500	RedLemon	   OUTPUT[72]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:51:49.192812-0500	RedLemon	   OUTPUT[73]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:51:49.192959-0500	RedLemon	   OUTPUT[74]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:51:49.193049-0500	RedLemon	   OUTPUT[75]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	15:51:49.193130-0500	RedLemon	   OUTPUT[76]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:51:49.193200-0500	RedLemon	   OUTPUT[77]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	15:51:49.193270-0500	RedLemon	   OUTPUT[78]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	15:51:49.193449-0500	RedLemon	   OUTPUT[79]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.193625-0500	RedLemon	   OUTPUT[80]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.193784-0500	RedLemon	   OUTPUT[81]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.193943-0500	RedLemon	   OUTPUT[82]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:51:49.194458-0500	RedLemon	   OUTPUT[83]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.194715-0500	RedLemon	   OUTPUT[84]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.195259-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:51:49.195483-0500	RedLemon	   OUTPUT[86]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.195678-0500	RedLemon	   OUTPUT[87]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.195902-0500	RedLemon	   OUTPUT[88]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.196232-0500	RedLemon	   OUTPUT[89]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.196435-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.196618-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.196827-0500	RedLemon	   OUTPUT[92]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:51:49.197213-0500	RedLemon	   OUTPUT[93]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.197388-0500	RedLemon	   OUTPUT[94]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	15:51:49.199964-0500	RedLemon	   OUTPUT[95]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.200428-0500	RedLemon	   OUTPUT[96]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.200664-0500	RedLemon	   OUTPUT[97]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	15:51:49.201069-0500	RedLemon	   OUTPUT[98]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:51:49.201598-0500	RedLemon	   OUTPUT[99]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	15:51:49.201764-0500	RedLemon	   OUTPUT[100]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.202105-0500	RedLemon	   OUTPUT[101]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.202332-0500	RedLemon	   OUTPUT[102]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	15:51:49.203023-0500	RedLemon	   OUTPUT[103]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	15:51:49.203190-0500	RedLemon	   OUTPUT[104]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.203303-0500	RedLemon	   OUTPUT[105]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	15:51:49.203700-0500	RedLemon	   OUTPUT[106]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	15:51:49.206543-0500	RedLemon	   OUTPUT[107]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	15:51:49.207231-0500	RedLemon	   OUTPUT[108]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	15:51:49.207468-0500	RedLemon	   OUTPUT[109]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	15:51:49.207669-0500	RedLemon	   OUTPUT[110]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.208690-0500	RedLemon	   OUTPUT[111]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	15:51:49.209139-0500	RedLemon	   OUTPUT[112]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	15:51:49.209309-0500	RedLemon	   OUTPUT[113]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.209465-0500	RedLemon	   OUTPUT[114]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:51:49.209625-0500	RedLemon	   OUTPUT[115]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.210113-0500	RedLemon	   OUTPUT[116]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	15:51:49.210966-0500	RedLemon	   OUTPUT[117]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.211159-0500	RedLemon	   OUTPUT[118]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	15:51:49.211322-0500	RedLemon	   OUTPUT[119]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.211477-0500	RedLemon	   OUTPUT[120]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.211641-0500	RedLemon	   OUTPUT[121]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	15:51:49.212239-0500	RedLemon	   OUTPUT[122]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.212424-0500	RedLemon	   OUTPUT[123]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	15:51:49.212579-0500	RedLemon	   OUTPUT[124]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	15:51:49.213012-0500	RedLemon	   OUTPUT[125]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	15:51:49.214740-0500	RedLemon	   OUTPUT[126]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.215156-0500	RedLemon	   OUTPUT[127]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.215426-0500	RedLemon	   OUTPUT[128]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.215806-0500	RedLemon	   OUTPUT[129]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	15:51:49.216023-0500	RedLemon	   OUTPUT[130]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	15:51:49.216226-0500	RedLemon	   OUTPUT[131]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	15:51:49.216463-0500	RedLemon	   OUTPUT[132]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	15:51:49.216706-0500	RedLemon	   OUTPUT[133]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	15:51:49.217470-0500	RedLemon	   OUTPUT[134]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.217592-0500	RedLemon	   OUTPUT[135]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	15:51:49.217701-0500	RedLemon	   OUTPUT[136]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.217803-0500	RedLemon	   OUTPUT[137]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.217900-0500	RedLemon	   OUTPUT[138]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	15:51:49.217993-0500	RedLemon	   OUTPUT[139]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	15:51:49.218086-0500	RedLemon	   OUTPUT[140]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	15:51:49.218177-0500	RedLemon	   OUTPUT[141]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	15:51:49.218270-0500	RedLemon	   OUTPUT[142]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	15:51:49.218359-0500	RedLemon	   OUTPUT[143]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.218451-0500	RedLemon	   OUTPUT[144]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.218548-0500	RedLemon	   OUTPUT[145]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	15:51:49.220467-0500	RedLemon	   OUTPUT[146]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	15:51:49.221843-0500	RedLemon	   OUTPUT[147]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	15:51:49.222090-0500	RedLemon	   OUTPUT[148]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	15:51:49.223228-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.223493-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.223573-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.223640-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.223702-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.223762-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.223819-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.224611-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.224750-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.224873-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.224988-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.225101-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.227180-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.227328-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.227449-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.227560-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.227668-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.228265-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.228355-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.228425-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.228488-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.228549-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.228606-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.229010-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.229767-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.230099-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:51:49.230833-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.230988-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.231103-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.231209-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.231311-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.231414-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.231518-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.231620-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.231715-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.231811-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.231905-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.232001-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.232096-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.232191-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.232285-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.232379-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.233269-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.233441-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.233809-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.234304-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.234651-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.235193-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.235579-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.235702-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:51:49.235816-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:51:49.235924-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:51:49.236027-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:51:49.236133-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	15:51:49.236254-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:51:49.236366-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:51:49.236469-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:51:49.236572-0500	RedLemon	   OUTPUT[206]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:51:49.741017-0500	RedLemon	Task <E6B24DA2-98FF-4E29-9CE4-B8F09CA5B100>.<3> received response, status 200 content K
default	15:51:49.741810-0500	RedLemon	Task <E6B24DA2-98FF-4E29-9CE4-B8F09CA5B100>.<3> response ended
default	15:51:49.741890-0500	RedLemon	Task <E6B24DA2-98FF-4E29-9CE4-B8F09CA5B100>.<3> done using Connection 9
default	15:51:49.742114-0500	RedLemon	Task <E6B24DA2-98FF-4E29-9CE4-B8F09CA5B100>.<3> summary for task success {transaction_duration_ms=2454, response_status=200, connection=9, reused=1, request_start_ms=27, request_duration_ms=0, response_start_ms=2453, response_duration_ms=1, request_bytes=277, response_bytes=20492, cache_hit=false}
default	15:51:49.742423-0500	RedLemon	Task <E6B24DA2-98FF-4E29-9CE4-B8F09CA5B100>.<3> finished successfully
default	15:51:49.753751-0500	RedLemon	Task <4E6E2552-8CD5-4DE3-9081-AD1A8E58D49A>.<164> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:49.754190-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8C2F9C15-1448-4338-BC6C-2F52A15F339E] (reporting strategy default)> on Task <4E6E2552-8CD5-4DE3-9081-AD1A8E58D49A>.<164> was not selected for reporting
default	15:51:49.755748-0500	RedLemon	Connection 17: starting, TC(0x0)
default	15:51:49.755825-0500	RedLemon	[C17 89B5AFC4-E0D4-460A-A66F-DCA399C095B1 127.0.0.1:47253 tcp, url hash: 52ab954c, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{90BB7D89-C425-446F-823D-960A5F622A3F}{(null)}{Y}{2} (private), proc: F2A35C62-84F6-3E68-B0C5-C12BFC414E01] start
default	15:51:49.755924-0500	RedLemon	[C17 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	15:51:49.756201-0500	RedLemon	[C17 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), interface: lo0)] event: path:satisfied @0.000s, uuid: C9346439-03CD-4109-A644-14731EA641DE
default	15:51:49.756865-0500	RedLemon	[C17 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), interface: lo0)] event: flow:start_connect @0.000s
default	15:51:49.756910-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C17] reporting state preparing
default	15:51:49.757157-0500	RedLemon	Task <4E6E2552-8CD5-4DE3-9081-AD1A8E58D49A>.<164> setting up Connection 17
default	15:51:49.757639-0500	RedLemon	nw_socket_handle_socket_event [C17:2] Socket received CONNECTED event
default	15:51:49.757771-0500	RedLemon	nw_flow_connected [C17 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	15:51:49.757951-0500	RedLemon	[C17 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.002s
default	15:51:49.758050-0500	RedLemon	nw_flow_connected [C17 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-2853746719)
default	15:51:49.758399-0500	RedLemon	[C17 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.002s
default	15:51:49.759299-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C17] reporting state ready
default	15:51:49.759388-0500	RedLemon	[C17 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.003s
default	15:51:49.759464-0500	RedLemon	Connection 17: connected successfully
default	15:51:49.759562-0500	RedLemon	Connection 17: ready C(N) E(N)
default	15:51:49.759780-0500	RedLemon	Task <4E6E2552-8CD5-4DE3-9081-AD1A8E58D49A>.<164> now using Connection 17
default	15:51:49.760168-0500	RedLemon	Connection 17: received viability advisory(Y)
default	15:51:49.762253-0500	RedLemon	Task <4E6E2552-8CD5-4DE3-9081-AD1A8E58D49A>.<164> sent request, body S 90
default	15:51:49.767539-0500	RedLemon	🔓 Unlock request: infoHash=50a4c9c42abe..., fileIdx=0
default	15:51:49.768395-0500	RedLemon	✅ Token found, attempting unlock...
default	15:51:49.770739-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:49.771234-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F27536CC-69A1-42F3-AA32-9D0EF80AB278] (reporting strategy default)> on Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> was not selected for reporting
default	15:51:49.772552-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:49.772888-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	15:51:49.773346-0500	RedLemon	Connection 18: enabling TLS
default	15:51:49.773386-0500	RedLemon	Connection 18: starting, TC(0x0)
default	15:51:49.773442-0500	RedLemon	[C18 D53836F8-0DFE-4F22-BFD1-18CA3C2C3215 Hostname#199a033c:443 quic-connection, url hash: 12f6340e, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{90BB7D89-C425-446F-823D-960A5F622A3F}{(null)}{Y}{2} (private), proc: F2A35C62-84F6-3E68-B0C5-C12BFC414E01] start
default	15:51:49.773535-0500	RedLemon	[C18 Hostname#199a033c:443 initial path ((null))] event: path:start @0.000s
default	15:51:49.773989-0500	RedLemon	[C18 Hostname#199a033c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 830E2DC3-7CFD-4F94-AFF2-97108DBDF1E6
default	15:51:49.774508-0500	RedLemon	[C18 Hostname#199a033c:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	15:51:49.774580-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C18] reporting state preparing
default	15:51:49.774935-0500	RedLemon	[C18.1 Hostname#199a033c:443 initial path ((null))] event: path:start @0.001s
default	15:51:49.780692-0500	RedLemon	[C18.1 Hostname#199a033c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.007s, uuid: 3F2B02B4-C3A0-48C7-8ABE-9CD9686347B2
default	15:51:49.780965-0500	RedLemon	[C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.007s
default	15:51:49.781173-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> setting up Connection 18
default	15:51:49.781274-0500	mDNSResponder	[R1759] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'YvUIV3orAzkBrkkk9tx76w=='>, options: 0x8 {use-failover}, client pid: 8572 (RedLemon)
default	15:51:49.802479-0500	RedLemon	nw_endpoint_resolver_update [C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#1274a9ff.443
default	15:51:49.802755-0500	RedLemon	nw_endpoint_resolver_update [C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#384d667c.443
default	15:51:49.802922-0500	RedLemon	nw_endpoint_resolver_update [C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#a86d1126:443
default	15:51:49.803215-0500	RedLemon	nw_endpoint_resolver_update [C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#17ecea7e:443
default	15:51:49.803447-0500	RedLemon	[C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.029s
default	15:51:49.803734-0500	RedLemon	[C18.1.1 IPv6#1274a9ff.443 initial path ((null))] event: path:start @0.030s
default	15:51:49.804234-0500	RedLemon	[C18.1.1 IPv6#1274a9ff.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.030s, uuid: CD3EA301-2864-413A-B904-565889E224DD
default	15:51:49.804477-0500	RedLemon	[C18.1.1 IPv6#1274a9ff.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.030s
default	15:51:49.805367-0500	RedLemon	[C18.1.1 IPv6#1274a9ff.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.031s
default	15:51:49.806518-0500	RedLemon	[C18.1.1 IPv6#1274a9ff.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.033s
default	15:51:49.806854-0500	RedLemon	tcp_output [C18.1.1:3] flags=[S] seq=2980632020, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2980632020
default	15:51:49.808322-0500	mDNSResponder	[R1759] getaddrinfo stop -- hostname: <mask.hash: 'YvUIV3orAzkBrkkk9tx76w=='>, client pid: 8572 (RedLemon)
default	15:51:49.809073-0500	RedLemon	nw_endpoint_resolver_update [C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#384d667c.443
default	15:51:49.809205-0500	RedLemon	nw_endpoint_resolver_update [C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#17ecea7e:443
default	15:51:49.809329-0500	RedLemon	nw_endpoint_resolver_update [C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#a86d1126:443
default	15:51:49.809542-0500	RedLemon	[C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.036s
default	15:51:49.916251-0500	RedLemon	tcp_input [C18.1.1:3] flags=[S.] seq=1055015467, ack=2980632021, win=64800 state=SYN_SENT rcv_nxt=0, snd_una=2980632020
default	15:51:49.916476-0500	RedLemon	nw_flow_connected [C18.1.1 IPv6#1274a9ff.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:51:49.916793-0500	RedLemon	[C18.1.1 IPv6#1274a9ff.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.143s
default	15:51:49.917083-0500	RedLemon	[C18.1 Hostname#199a033c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.143s
default	15:51:49.917123-0500	RedLemon	[C18 Hostname#199a033c:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.143s
default	15:51:49.917674-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C18.1.1:2][0x7fbf939e0f60] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:51:49.917798-0500	RedLemon	boringssl_context_info_handler(2028) [C18.1.1:2][0x7fbf939e0f60] Client handshake started
default	15:51:49.917992-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS client enter_early_data
default	15:51:49.918135-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS client read_server_hello
default	15:51:50.053149-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:51:50.089860-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client read_server_hello
default	15:51:50.107878-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:51:50.121594-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client read_certificate_request
default	15:51:50.122092-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client read_server_certificate
default	15:51:50.122199-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:51:50.123045-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C18.1.1:2][0x7fbf939e0f60] Performing external trust evaluation
default	15:51:50.123205-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C18.1.1:2][0x7fbf939e0f60] Asyncing for external verify block
default	15:51:50.125842-0500	RedLemon	Connection 18: asked to evaluate TLS Trust
default	15:51:50.126997-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> auth completion disp=1 cred=0x0
default	15:51:50.134147-0500	RedLemon	Connection 18: TLS Trust result 0
default	15:51:50.134326-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C18.1.1:2][0x7fbf939e0f60] Returning from external verify block with result: true
default	15:51:50.134428-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C18.1.1:2][0x7fbf939e0f60] Certificate verification result: OK
default	15:51:50.135068-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client read_server_finished
default	15:51:50.135462-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:51:50.135602-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:51:50.136425-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client send_client_certificate
default	15:51:50.136468-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client complete_second_flight
default	15:51:50.136631-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS 1.3 client done
default	15:51:50.137264-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS client finish_client_handshake
default	15:51:50.137331-0500	RedLemon	boringssl_context_info_handler(2045) [C18.1.1:2][0x7fbf939e0f60] Client handshake state: TLS client done
default	15:51:50.137376-0500	RedLemon	boringssl_context_info_handler(2034) [C18.1.1:2][0x7fbf939e0f60] Client handshake done
default	15:51:50.138345-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C18.1.1:2][0x7fbf939e0f60] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0804) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(220ms) flight_time(178ms) rtt(136ms) write_stalls(0) read_stalls(4)]
default	15:51:50.138536-0500	RedLemon	nw_flow_connected [C18.1.1 IPv6#1274a9ff.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2853746719)
default	15:51:50.138957-0500	RedLemon	[C18.1.1 IPv6#1274a9ff.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.365s
default	15:51:50.139107-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C18] reporting state ready
default	15:51:50.139252-0500	RedLemon	[C18.1 Hostname#199a033c:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.365s
default	15:51:50.139312-0500	RedLemon	[C18 Hostname#199a033c:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.365s
default	15:51:50.139538-0500	RedLemon	[C18.1.1 IPv6#1274a9ff.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.366s
default	15:51:50.139679-0500	RedLemon	[C18.1 Hostname#199a033c:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.366s
default	15:51:50.139738-0500	RedLemon	[C18 Hostname#199a033c:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.366s
default	15:51:50.139880-0500	RedLemon	Connection 18: connected successfully
default	15:51:50.139935-0500	RedLemon	Connection 18: TLS handshake complete
default	15:51:50.140223-0500	RedLemon	Connection 18: ready C(N) E(N)
default	15:51:50.140724-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> now using Connection 18
default	15:51:50.140957-0500	RedLemon	Connection 18: received viability advisory(Y)
default	15:51:50.141511-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> sent request, body S 291
default	15:51:50.480554-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> received response, status 201 content U
default	15:51:50.483760-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> done using Connection 18
default	15:51:50.483973-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> response ended
default	15:51:50.484121-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> summary for task success {transaction_duration_ms=712, response_status=201, connection=18, protocol="h2", domain_lookup_duration_ms=22, connect_duration_ms=332, secure_connection_duration_ms=220, private_relay=false, request_start_ms=369, request_duration_ms=0, response_start_ms=708, response_duration_ms=3, request_bytes=508, response_bytes=196, cache_hit=false}
default	15:51:50.484363-0500	RedLemon	Task <979A73FF-FD51-4CAF-822D-E8F472863574>.<165> finished successfully
default	15:51:50.484749-0500	RedLemon	Task <17083C34-A114-4D66-B38E-051FC6EDBA8D>.<166> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:50.485214-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AE06B959-5DCC-468A-B344-5998556997B7] (reporting strategy default)> on Task <17083C34-A114-4D66-B38E-051FC6EDBA8D>.<166> was not selected for reporting
default	15:51:50.486195-0500	RedLemon	Task <17083C34-A114-4D66-B38E-051FC6EDBA8D>.<166> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:50.486943-0500	RedLemon	Task <17083C34-A114-4D66-B38E-051FC6EDBA8D>.<166> now using Connection 18
default	15:51:50.487365-0500	RedLemon	Task <17083C34-A114-4D66-B38E-051FC6EDBA8D>.<166> sent request, body N 0
default	15:51:50.646418-0500	RedLemon	Task <17083C34-A114-4D66-B38E-051FC6EDBA8D>.<166> received response, status 200 content U
default	15:51:50.646658-0500	RedLemon	Task <17083C34-A114-4D66-B38E-051FC6EDBA8D>.<166> done using Connection 18
default	15:51:50.646914-0500	RedLemon	Task <17083C34-A114-4D66-B38E-051FC6EDBA8D>.<166> response ended
default	15:51:50.647141-0500	RedLemon	Task <17083C34-A114-4D66-B38E-051FC6EDBA8D>.<166> summary for task success {transaction_duration_ms=161, response_status=200, connection=18, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=160, response_duration_ms=0, request_bytes=97, response_bytes=532, cache_hit=false}
default	15:51:50.647392-0500	RedLemon	Task <17083C34-A114-4D66-B38E-051FC6EDBA8D>.<166> finished successfully
default	15:51:50.649288-0500	RedLemon	Task <25CDF76A-C047-4A22-89FA-322938D2B586>.<167> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:50.649957-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [87382921-1FFE-45A3-B6A2-D5E541F26B39] (reporting strategy default)> on Task <25CDF76A-C047-4A22-89FA-322938D2B586>.<167> was not selected for reporting
default	15:51:50.651355-0500	RedLemon	Task <25CDF76A-C047-4A22-89FA-322938D2B586>.<167> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:50.651774-0500	RedLemon	Task <25CDF76A-C047-4A22-89FA-322938D2B586>.<167> now using Connection 18
default	15:51:50.652940-0500	RedLemon	Task <25CDF76A-C047-4A22-89FA-322938D2B586>.<167> sent request, body S 7
default	15:51:50.706597-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1899 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:50.712743-0500	runningboardd	Assertion 174-8572-1899 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:50.733414-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:50.733478-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:50.733526-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:50.767951-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1900 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:50.768124-0500	runningboardd	Assertion 174-114-1900 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:50.772098-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:50.772159-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:50.772208-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:51.095320-0500	RedLemon	Task <25CDF76A-C047-4A22-89FA-322938D2B586>.<167> received response, status 204 content U
default	15:51:51.095511-0500	RedLemon	Task <25CDF76A-C047-4A22-89FA-322938D2B586>.<167> done using Connection 18
default	15:51:51.095849-0500	RedLemon	Task <25CDF76A-C047-4A22-89FA-322938D2B586>.<167> response ended
default	15:51:51.096021-0500	RedLemon	Task <25CDF76A-C047-4A22-89FA-322938D2B586>.<167> summary for task success {transaction_duration_ms=445, response_status=204, connection=18, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=444, response_duration_ms=0, request_bytes=123, response_bytes=48, cache_hit=false}
default	15:51:51.096276-0500	RedLemon	Task <25CDF76A-C047-4A22-89FA-322938D2B586>.<167> finished successfully
default	15:51:51.097003-0500	RedLemon	Task <D0938A55-F046-4092-8B8F-78042A096B00>.<168> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:51.097460-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [59EA1523-955F-43FE-8D0A-E9178E0F3CA9] (reporting strategy default)> on Task <D0938A55-F046-4092-8B8F-78042A096B00>.<168> was not selected for reporting
default	15:51:51.098318-0500	RedLemon	Task <D0938A55-F046-4092-8B8F-78042A096B00>.<168> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:51.098534-0500	RedLemon	Task <D0938A55-F046-4092-8B8F-78042A096B00>.<168> now using Connection 18
default	15:51:51.098771-0500	RedLemon	Task <D0938A55-F046-4092-8B8F-78042A096B00>.<168> sent request, body N 0
default	15:51:51.256212-0500	RedLemon	Task <D0938A55-F046-4092-8B8F-78042A096B00>.<168> received response, status 200 content U
default	15:51:51.256345-0500	RedLemon	Task <D0938A55-F046-4092-8B8F-78042A096B00>.<168> done using Connection 18
default	15:51:51.256633-0500	RedLemon	Task <D0938A55-F046-4092-8B8F-78042A096B00>.<168> response ended
default	15:51:51.256836-0500	RedLemon	Task <D0938A55-F046-4092-8B8F-78042A096B00>.<168> summary for task success {transaction_duration_ms=159, response_status=200, connection=18, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=158, response_duration_ms=0, request_bytes=97, response_bytes=578, cache_hit=true}
default	15:51:51.257119-0500	RedLemon	Task <D0938A55-F046-4092-8B8F-78042A096B00>.<168> finished successfully
default	15:51:51.257927-0500	RedLemon	Task <B256BC15-5EB4-4D1A-AB7E-76F5041EFBEA>.<169> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:51:51.258888-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B36F04CB-5E93-4021-964A-95DBA17978BB] (reporting strategy default)> on Task <B256BC15-5EB4-4D1A-AB7E-76F5041EFBEA>.<169> was not selected for reporting
default	15:51:51.262029-0500	RedLemon	Task <B256BC15-5EB4-4D1A-AB7E-76F5041EFBEA>.<169> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:51.262244-0500	RedLemon	Task <B256BC15-5EB4-4D1A-AB7E-76F5041EFBEA>.<169> now using Connection 18
default	15:51:51.262974-0500	RedLemon	Task <B256BC15-5EB4-4D1A-AB7E-76F5041EFBEA>.<169> sent request, body S 47
default	15:51:51.594870-0500	RedLemon	Task <B256BC15-5EB4-4D1A-AB7E-76F5041EFBEA>.<169> received response, status 200 content U
default	15:51:51.595065-0500	RedLemon	Task <B256BC15-5EB4-4D1A-AB7E-76F5041EFBEA>.<169> done using Connection 18
default	15:51:51.595331-0500	RedLemon	Task <B256BC15-5EB4-4D1A-AB7E-76F5041EFBEA>.<169> response ended
default	15:51:51.595746-0500	RedLemon	Task <B256BC15-5EB4-4D1A-AB7E-76F5041EFBEA>.<169> summary for task success {transaction_duration_ms=336, response_status=200, connection=18, reused=1, request_start_ms=2, request_duration_ms=0, response_start_ms=334, response_duration_ms=1, request_bytes=150, response_bytes=538, cache_hit=true}
default	15:51:51.596026-0500	RedLemon	Task <B256BC15-5EB4-4D1A-AB7E-76F5041EFBEA>.<169> finished successfully
default	15:51:51.597299-0500	RedLemon	✅ Unlocked successfully: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX.mkv
default	15:51:51.598551-0500	RedLemon	Task <4E6E2552-8CD5-4DE3-9081-AD1A8E58D49A>.<164> received response, status 200 content K
default	15:51:51.598921-0500	RedLemon	Task <4E6E2552-8CD5-4DE3-9081-AD1A8E58D49A>.<164> response ended
default	15:51:51.599004-0500	RedLemon	Task <4E6E2552-8CD5-4DE3-9081-AD1A8E58D49A>.<164> done using Connection 17
default	15:51:51.599436-0500	RedLemon	Task <4E6E2552-8CD5-4DE3-9081-AD1A8E58D49A>.<164> summary for task success {transaction_duration_ms=1844, response_status=200, connection=17, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=2, secure_connection_duration_ms=0, private_relay=false, request_start_ms=5, request_duration_ms=1, response_start_ms=1843, response_duration_ms=0, request_bytes=372, response_bytes=376, cache_hit=true}
default	15:51:51.599693-0500	RedLemon	Task <4E6E2552-8CD5-4DE3-9081-AD1A8E58D49A>.<164> finished successfully
default	15:51:51.600234-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	15:51:51.600681-0500	RedLemon	Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:51.600708-0500	RedLemon	Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:51.600775-0500	RedLemon	Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:51.602016-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [25A0A48B-849B-474D-AB70-372936A6D1F8] (reporting strategy default)> on Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> was not selected for reporting
default	15:51:51.602727-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [675A9556-04DC-47BE-BC38-68CEB17D9892] (reporting strategy default)> on Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> was not selected for reporting
default	15:51:51.602854-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [262E6FA2-6E31-44E1-9DE0-031097793762] (reporting strategy default)> on Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> was not selected for reporting
default	15:51:51.605340-0500	RedLemon	Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:51.605716-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	15:51:51.606168-0500	RedLemon	Connection 19: enabling TLS
default	15:51:51.606242-0500	RedLemon	Connection 19: starting, TC(0x0)
default	15:51:51.606324-0500	RedLemon	[C19 C8A923AE-325D-4E40-8B71-F968CC92DBB8 Hostname#a1d66c0d:443 quic-connection, url hash: 31da3055, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{90BB7D89-C425-446F-823D-960A5F622A3F}{(null)}{Y}{2} (private), proc: F2A35C62-84F6-3E68-B0C5-C12BFC414E01] start
default	15:51:51.606426-0500	RedLemon	[C19 Hostname#a1d66c0d:443 initial path ((null))] event: path:start @0.000s
default	15:51:51.606857-0500	RedLemon	[C19 Hostname#a1d66c0d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 61F6D687-791A-4597-8298-EEB768FA38B3
default	15:51:51.607062-0500	RedLemon	[C19 Hostname#a1d66c0d:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	15:51:51.607109-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C19] reporting state preparing
default	15:51:51.607497-0500	RedLemon	[C19.1 Hostname#a1d66c0d:443 initial path ((null))] event: path:start @0.001s
default	15:51:51.608206-0500	RedLemon	[C19.1 Hostname#a1d66c0d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: 4F5914FF-521A-4C7F-A450-CF2D8031A279
default	15:51:51.608455-0500	RedLemon	[C19.1 Hostname#a1d66c0d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.002s
default	15:51:51.608989-0500	RedLemon	Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> setting up Connection 19
default	15:51:51.608681-0500	mDNSResponder	[R1760] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'VkU6jUPj8QTibCrwfcJdZQ=='>, options: 0x8 {use-failover}, client pid: 8572 (RedLemon)
default	15:51:51.609450-0500	RedLemon	Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:51.609558-0500	RedLemon	Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> waiting for setup of Connection 19
default	15:51:51.609627-0500	RedLemon	Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:51.609704-0500	RedLemon	Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> waiting for setup of Connection 19
default	15:51:51.613775-0500	RedLemon	nw_endpoint_resolver_update [C19.1 Hostname#a1d66c0d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#3bcd49a0.443
default	15:51:51.613898-0500	RedLemon	nw_endpoint_resolver_update [C19.1 Hostname#a1d66c0d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#3e8bdc91:443
default	15:51:51.614106-0500	RedLemon	[C19.1 Hostname#a1d66c0d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.007s
default	15:51:51.614484-0500	RedLemon	[C19.1.1 IPv6#3bcd49a0.443 initial path ((null))] event: path:start @0.008s
default	15:51:51.615283-0500	RedLemon	[C19.1.1 IPv6#3bcd49a0.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.008s, uuid: 301324B5-1D77-4B73-B23E-910DC6540F5C
default	15:51:51.615694-0500	RedLemon	[C19.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.009s
default	15:51:51.616610-0500	RedLemon	[C19.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.010s
default	15:51:51.620696-0500	RedLemon	nw_protocol_instance_ignore_future_path_changes [C19.1.1:2] Ignoring future path changes for protocol
default	15:51:51.620795-0500	RedLemon	quic_initialize_block_invoke [C19.1.1:2] [-d1de6a82533c6641] created QUIC connection (spin bit disabled)
default	15:51:51.621753-0500	RedLemon	[C19.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.015s
default	15:51:51.623567-0500	RedLemon	quic_crypto_new_flow [C19.1.1:2] [-d1de6a82533c6641] TLS stream is: [C20]
default	15:51:51.623626-0500	RedLemon	[C20 3B11BA86-CDDA-40C3-B56A-3C32073422D5 IPv6#3bcd49a0.443 quic-connection, url hash: 31da3055, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{90BB7D89-C425-446F-823D-960A5F622A3F}{(null)}{Y}{2} (private), proc: F2A35C62-84F6-3E68-B0C5-C12BFC414E01, no transport] start
default	15:51:51.623761-0500	RedLemon	[C20 IPv6#3bcd49a0.443 initial socket-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:start @0.000s
default	15:51:51.623888-0500	RedLemon	[C20 IPv6#3bcd49a0.443 waiting socket-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 301324B5-1D77-4B73-B23E-910DC6540F5C
default	15:51:51.624152-0500	RedLemon	[C20 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.000s
default	15:51:51.624196-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C20] reporting state preparing
default	15:51:51.624351-0500	RedLemon	nw_flow_connected [C20 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (quic-connection)
default	15:51:51.624418-0500	RedLemon	[C20 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.000s
default	15:51:51.624799-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C20:1][0x7fbf96a155c0] TLS configured [min_version(0x0304) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:51:51.624944-0500	RedLemon	boringssl_context_info_handler(2028) [C20:1][0x7fbf96a155c0] Client handshake started
default	15:51:51.625149-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS client enter_early_data
default	15:51:51.625619-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS client read_server_hello
default	15:51:51.638173-0500	RedLemon	nw_endpoint_resolver_update [C19.1 Hostname#a1d66c0d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#3e8bdc91:443
default	15:51:51.638437-0500	RedLemon	[C19.1 Hostname#a1d66c0d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.032s
default	15:51:51.639641-0500	mDNSResponder	[R1760] getaddrinfo stop -- hostname: <mask.hash: 'VkU6jUPj8QTibCrwfcJdZQ=='>, client pid: 8572 (RedLemon)
default	15:51:51.640163-0500	RedLemon	nw_endpoint_resolver_update [C19.1 Hostname#a1d66c0d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#3e8bdc91:443
default	15:51:51.640523-0500	RedLemon	[C19.1 Hostname#a1d66c0d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.034s
error	15:51:51.643296-0500	RedLemon	quic_packet_parser_inner [C19.1.1:2] [-014c017ca5605604874f107c2460b293fbb5f808] SH fixed bit is zero
default	15:51:51.649245-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:51:51.649410-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client read_server_hello
default	15:51:51.649965-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client read_encrypted_extensions
error	15:51:51.650160-0500	RedLemon	quic_packet_parser_inner [C19.1.1:2] [-014c017ca5605604874f107c2460b293fbb5f808] SH fixed bit is zero
default	15:51:51.650595-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client read_certificate_request
default	15:51:51.650892-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client read_server_certificate
default	15:51:51.650985-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:51:51.651473-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C20:1][0x7fbf96a155c0] Performing external trust evaluation
default	15:51:51.651669-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C20:1][0x7fbf96a155c0] Asyncing for external verify block
default	15:51:51.652059-0500	RedLemon	Connection 19: asked to evaluate TLS Trust
default	15:51:51.652389-0500	RedLemon	Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> auth completion disp=1 cred=0x0
default	15:51:51.667937-0500	RedLemon	Connection 19: TLS Trust result 0
default	15:51:51.668010-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C20:1][0x7fbf96a155c0] Returning from external verify block with result: true
default	15:51:51.668102-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C20:1][0x7fbf96a155c0] Certificate verification result: OK
default	15:51:51.668730-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client read_server_finished
default	15:51:51.668941-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:51:51.668989-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:51:51.669028-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:51:51.669064-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:51:51.669898-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS 1.3 client done
default	15:51:51.670095-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS client finish_client_handshake
default	15:51:51.670181-0500	RedLemon	boringssl_context_info_handler(2045) [C20:1][0x7fbf96a155c0] Client handshake state: TLS client done
default	15:51:51.670209-0500	RedLemon	boringssl_context_info_handler(2034) [C20:1][0x7fbf96a155c0] Client handshake done
default	15:51:51.670814-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C20:1][0x7fbf96a155c0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h3) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(46ms) flight_time(25ms) rtt(24ms) write_stalls(0) read_stalls(4)]
default	15:51:51.670932-0500	RedLemon	nw_flow_connected [C20 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (tls)
default	15:51:51.671166-0500	RedLemon	[C20 IPv6#3bcd49a0.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.047s
default	15:51:51.671447-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C20] reporting state ready
default	15:51:51.671518-0500	RedLemon	[C20 IPv6#3bcd49a0.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.047s
default	15:51:51.673568-0500	RedLemon	quic_pmtud_restart [C19.1.1:2] [-014c017ca5605604874f107c2460b293fbb5f808] PMTUD enabled, max PMTU: 1398, header size: 48, current PMTU 1248
default	15:51:51.673669-0500	RedLemon	quic_crypto_tls_ready_inner [C19.1.1:2] [-014c017ca5605604874f107c2460b293fbb5f808] QUIC connection established in 51.671 ms, RTT 17.757 ms
default	15:51:51.673751-0500	RedLemon	nw_flow_connected [C19.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (quic-connection)
default	15:51:51.674067-0500	RedLemon	[C19.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.067s
default	15:51:51.674263-0500	RedLemon	[C19.1 Hostname#a1d66c0d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.067s
default	15:51:51.674465-0500	RedLemon	[C19 Hostname#a1d66c0d:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.068s
default	15:51:51.674637-0500	RedLemon	nw_flow_connected [C19.1.1 IPv6#3bcd49a0.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2853746719)
default	15:51:51.675441-0500	RedLemon	[C19.1.1 IPv6#3bcd49a0.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.069s
default	15:51:51.676074-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C19] reporting state ready
default	15:51:51.676481-0500	RedLemon	[C19.1 Hostname#a1d66c0d:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.070s
default	15:51:51.676556-0500	RedLemon	[C19 Hostname#a1d66c0d:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.070s
default	15:51:51.676788-0500	RedLemon	[C19.1.1 IPv6#3bcd49a0.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.070s
default	15:51:51.676960-0500	RedLemon	[C19.1 Hostname#a1d66c0d:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.070s
default	15:51:51.677030-0500	RedLemon	[C19 Hostname#a1d66c0d:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.070s
default	15:51:51.677505-0500	RedLemon	Connection 19: connected successfully
default	15:51:51.677798-0500	RedLemon	Connection 19: TLS handshake complete
default	15:51:51.679928-0500	RedLemon	Connection 19: ready C(N) E(N)
default	15:51:51.682102-0500	RedLemon	Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> now using Connection 19
default	15:51:51.683859-0500	RedLemon	Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> now using Connection 19
default	15:51:51.685322-0500	RedLemon	Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> now using Connection 19
default	15:51:51.686302-0500	RedLemon	Connection 19: received viability advisory(Y)
default	15:51:51.686378-0500	RedLemon	0x7fbf973d1db8 ID=0 Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> sent request, body N 0
default	15:51:51.686434-0500	RedLemon	0x7fbf939ead28 ID=4 Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> sent request, body N 0
default	15:51:51.686481-0500	RedLemon	0x7fbf977e1f48 ID=8 Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> sent request, body N 0
default	15:51:51.687134-0500	RedLemon	boringssl_context_new_session_handler(1336) [C20:1][0x7fbf96a155c0] Asyncing for session update block
default	15:51:51.687597-0500	RedLemon	boringssl_context_new_session_handler(1336) [C20:1][0x7fbf96a155c0] Asyncing for session update block
default	15:51:51.687777-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C20:1][0x7fbf96a155c0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h3) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(46ms) flight_time(25ms) rtt(24ms) write_stalls(0) read_stalls(4)]
default	15:51:51.687902-0500	RedLemon	nw_flow_connected [C20 IPv6#3bcd49a0.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (tls)
default	15:51:51.688186-0500	RedLemon	quic_stream_create_inbound [C19.1.1:2] [-014c017ca5605604874f107c2460b293fbb5f808] creating inbound stream 3
default	15:51:51.689184-0500	RedLemon	quic_stream_create_inbound [C19.1.1:2] [-014c017ca5605604874f107c2460b293fbb5f808] creating inbound stream 7
default	15:51:51.691220-0500	RedLemon	boringssl_context_new_session_handler_block_invoke(1339) [C20:1][0x7fbf96a155c0] Returning from session update block
default	15:51:51.693473-0500	RedLemon	boringssl_context_new_session_handler_block_invoke(1339) [C20:1][0x7fbf96a155c0] Returning from session update block
default	15:51:51.693975-0500	RedLemon	quic_stream_create_inbound [C19.1.1:2] [-014c017ca5605604874f107c2460b293fbb5f808] creating inbound stream 11
default	15:51:51.700905-0500	RedLemon	quic_stream_create_inbound [C19.1.1:2] [-014c017ca5605604874f107c2460b293fbb5f808] creating inbound stream 15
default	15:51:51.778840-0500	runningboardd	Invalidating assertion 174-8572-1899 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:51.954482-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:51.954538-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:51.954626-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:51.956188-0500	runningboardd	Invalidating assertion 174-114-1900 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:51.976726-0500	RedLemon	0x7fbf977e1f48 ID=8 Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> received response, status 200 content U
default	15:51:51.977247-0500	RedLemon	0x7fbf973d1db8 ID=0 Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> received response, status 200 content U
default	15:51:51.978872-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1901 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:51.979207-0500	runningboardd	Assertion 174-8572-1901 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:51.980506-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:51.980552-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:51.980597-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:51.983154-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1902 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:51.983331-0500	runningboardd	Assertion 174-114-1902 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:51.987931-0500	RedLemon	0x7fbf939ead28 ID=4 Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> received response, status 200 content K
default	15:51:51.994951-0500	RedLemon	Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> response ended
default	15:51:51.995374-0500	RedLemon	Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> done using Connection 19
default	15:51:51.995629-0500	RedLemon	Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> summary for task success {transaction_duration_ms=390, response_status=200, connection=19, reused=1, request_start_ms=78, request_duration_ms=2, response_start_ms=382, response_duration_ms=7, request_bytes=112, response_bytes=3279, cache_hit=true}
default	15:51:51.995861-0500	RedLemon	Task <F86E79A8-7EE1-4FB8-A73F-8BF0BFC6C158>.<172> finished successfully
default	15:51:52.039859-0500	RedLemon	Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> response ended
default	15:51:52.040270-0500	RedLemon	Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> done using Connection 19
default	15:51:52.040545-0500	RedLemon	Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> summary for task success {transaction_duration_ms=434, response_status=200, connection=19, reused=1, request_start_ms=79, request_duration_ms=1, response_start_ms=370, response_duration_ms=64, request_bytes=112, response_bytes=39901, cache_hit=true}
default	15:51:52.041019-0500	RedLemon	Task <06C55D36-441D-41F0-ABC3-A38E4C7B0811>.<171> finished successfully
default	15:51:52.049284-0500	RedLemon	Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> response ended
default	15:51:52.049752-0500	RedLemon	Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> done using Connection 19
default	15:51:52.049974-0500	RedLemon	Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> summary for task success {transaction_duration_ms=447, response_status=200, connection=19, protocol="h3", domain_lookup_duration_ms=5, connect_duration_ms=54, secure_connection_duration_ms=51, private_relay=false, request_start_ms=79, request_duration_ms=4, response_start_ms=374, response_duration_ms=72, request_bytes=112, response_bytes=91146, cache_hit=true}
default	15:51:52.050465-0500	RedLemon	Task <0E2F5F26-49DD-48E9-ADEB-AE8B2C0CF0FE>.<170> finished successfully
default	15:51:52.106611-0500	RedLemon	🎬🎬🎬 MPVPlayerView INIT called - streamURL: https://chi4-4.download.real-debrid.com/d/4CHAP3VHT7MKE106/F, subtitles: 3
default	15:51:52.173413-0500	RedLemon	✅ Stream ready, starting playback...
default	15:51:52.173607-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	15:51:52.173981-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7fbf93f27450>
default	15:51:52.174171-0500	RedLemon	   Is fullscreen: 0
default	15:51:52.174401-0500	RedLemon	   ✅ WindowManager: Toggling fullscreen ON
default	15:51:52.415973-0500	RedLemon	🖼️ Setting up MPV with native macOS video output...
default	15:51:52.443881-0500	RedLemon	✅ MPV initialized with native GPU rendering
default	15:51:52.456341-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task starting
default	15:51:52.456556-0500	RedLemon	🎉 Starting watch party sync - Room: BPWN, Host: YES
default	15:51:52.457099-0500	RedLemon	🎉 Watch Party Mode ENABLED. isInWatchParty = YES
default	15:51:52.512072-0500	runningboardd	Invalidating assertion 174-171-1846 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	15:51:52.529799-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.WindowServer(88)>:171] with description <RBSAssertionDescriptor| "AppVisible" ID:174-171-1906 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:52.529989-0500	runningboardd	Assertion 174-171-1906 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:52.535180-0500	RedLemon	🔄 Starting chat polling for room: BPWN
default	15:51:52.535773-0500	RedLemon	✅ Watch party sync started successfully - isInWatchParty is now TRUE
default	15:51:52.536948-0500	RedLemon	🎬🎬🎬 About to call loadStream - isInWatchParty: YES
default	15:51:52.537120-0500	RedLemon	🎬🎬🎬 Subtitles: 3
default	15:51:52.537398-0500	RedLemon	🎬🎬🎬 LOADSTREAM CALLED - streamTitle: Frankenstein
default	15:51:52.537589-0500	RedLemon	🎬🎬🎬 streamURL: https://chi4-4.download.real-debrid.com/d/4CHAP3VHT7MKE106/F
default	15:51:52.537708-0500	RedLemon	🎬🎬🎬 subtitles: 3
default	15:51:52.538513-0500	RedLemon	🎬 MPV loadVideo called with URL: https://chi4-4.download.real-debrid.com/d/4CHAP3VHT7MKE106/Frankenstein%202025%201080p%20NF%20WEB-DL, autoplay: false
default	15:51:52.538721-0500	RedLemon	⏸️ Loading in paused mode (watch party)
default	15:51:52.538851-0500	RedLemon	🔗 URL: https://chi4-4.download.real-debrid.com/d/4CHAP3VHT7MKE106/Frankenstein%202025%201080p%20NF%20WEB-DL%20DDP5%201%20Atmos%20H%20264-FLUX.mkv
default	15:51:52.538995-0500	RedLemon	🎬 MPV executing: loadfile "https://chi4-4.download.real-debrid.com/d/4CHAP3VHT7MKE106/Frankenstein%202025%201080p%20NF%20WEB-DL%20DDP5%201%20Atmos%20H%20264-FLUX.mkv"
default	15:51:52.539347-0500	RedLemon	🎬 MPV loadfile result: 0
default	15:51:52.545562-0500	RedLemon	✅ MPV loadfile succeeded, immediately paused for watch party
default	15:51:52.545875-0500	RedLemon	✅ Subtitles already downloaded, loading as additional options...
default	15:51:52.546238-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task completed
default	15:51:52.548825-0500	mDNSResponder	[R1761] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8QCB12s8AQmmN/JWxb5wSw=='>, Addr) START PID[8572](RedLemon)
default	15:51:52.549487-0500	mDNSResponder	[R1762] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8QCB12s8AQmmN/JWxb5wSw=='>, AAAA) START PID[8572](RedLemon)
default	15:51:52.564699-0500	RedLemon	Task <1473BB9E-20D5-4168-BD0D-A115EB491B96>.<173> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:52.565237-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A2801BB7-FB3B-482A-850A-3396C2E49E34] (reporting strategy default)> on Task <1473BB9E-20D5-4168-BD0D-A115EB491B96>.<173> was not selected for reporting
default	15:51:52.566909-0500	RedLemon	Task <1473BB9E-20D5-4168-BD0D-A115EB491B96>.<173> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:52.567312-0500	RedLemon	Task <1473BB9E-20D5-4168-BD0D-A115EB491B96>.<173> now using Connection 3
default	15:51:52.568290-0500	RedLemon	📝 Loading external subtitle 1 (Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_AC0A3498-D057-4AEF-B094-98BC92F0A4F2/Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA.srt
default	15:51:52.568475-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_AC0A3498-D057-4
default	15:51:52.571073-0500	RedLemon	0x7fbf977651d8 ID=116 Task <1473BB9E-20D5-4168-BD0D-A115EB491B96>.<173> sent request, body N 0
default	15:51:52.578243-0500	mDNSResponder	[R1761] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'a+ZGcP2TnfAKHAs9CPXCKw=='>, Addr) STOP PID[8572](RedLemon)
default	15:51:52.578351-0500	mDNSResponder	[R1762] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'a+ZGcP2TnfAKHAs9CPXCKw=='>, AAAA) STOP PID[8572](RedLemon)
default	15:51:52.657008-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:51:52.657192-0500	RedLemon	📝 Loading external subtitle 2 (Frankenstein (2025) eng): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_4D191E9C-9ECC-434A-8C6C-BE3AE0C0D865/Frankenstein (2025) eng.srt
default	15:51:52.657368-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_4D191E9C-9ECC-4
default	15:51:52.674917-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:51:52.675086-0500	RedLemon	📝 Loading external subtitle 3 (Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_49B7EDE5-313D-46F9-9E35-16642BC03781/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.eng.srt
default	15:51:52.675257-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_49B7EDE5-313D-4
default	15:51:52.680260-0500	RedLemon	0x7fbf977651d8 ID=116 Task <1473BB9E-20D5-4168-BD0D-A115EB491B96>.<173> received response, status 200 content K
default	15:51:52.680907-0500	RedLemon	Task <1473BB9E-20D5-4168-BD0D-A115EB491B96>.<173> response ended
default	15:51:52.681772-0500	RedLemon	Task <1473BB9E-20D5-4168-BD0D-A115EB491B96>.<173> done using Connection 3
default	15:51:52.681998-0500	RedLemon	Task <1473BB9E-20D5-4168-BD0D-A115EB491B96>.<173> summary for task success {transaction_duration_ms=116, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=3, response_start_ms=114, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=false}
default	15:51:52.682270-0500	RedLemon	Task <1473BB9E-20D5-4168-BD0D-A115EB491B96>.<173> finished successfully
default	15:51:52.689997-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:51:52.690213-0500	RedLemon	ℹ️ External subtitles loaded as additional options (embedded subs take priority)
default	15:51:52.776544-0500	RedLemon	Task <44551C25-4971-4AE8-8B9D-63474E558466>.<174> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:51:52.777832-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [273B2BB8-AA0A-4895-A750-3757B5F81347] (reporting strategy default)> on Task <44551C25-4971-4AE8-8B9D-63474E558466>.<174> was not selected for reporting
default	15:51:52.778620-0500	RedLemon	Task <44551C25-4971-4AE8-8B9D-63474E558466>.<174> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:52.778825-0500	RedLemon	Task <44551C25-4971-4AE8-8B9D-63474E558466>.<174> now using Connection 13
default	15:51:52.779525-0500	RedLemon	Task <44551C25-4971-4AE8-8B9D-63474E558466>.<174> sent request, body N 0
default	15:51:52.800328-0500	RedLemon	Task <44551C25-4971-4AE8-8B9D-63474E558466>.<174> received response, status 200 content K
default	15:51:52.806684-0500	RedLemon	Task <44551C25-4971-4AE8-8B9D-63474E558466>.<174> done using Connection 13
default	15:51:52.807100-0500	RedLemon	Task <44551C25-4971-4AE8-8B9D-63474E558466>.<174> response ended
default	15:51:52.808152-0500	RedLemon	Task <44551C25-4971-4AE8-8B9D-63474E558466>.<174> summary for task success {transaction_duration_ms=29, response_status=200, connection=13, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=21, response_duration_ms=7, request_bytes=41, response_bytes=117949, cache_hit=false}
default	15:51:52.808295-0500	RedLemon	Task <44551C25-4971-4AE8-8B9D-63474E558466>.<174> finished successfully
default	15:51:53.057008-0500	runningboardd	Invalidating assertion 174-171-1906 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	15:51:53.057919-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.WindowServer(88)>:171] with description <RBSAssertionDescriptor| "AppVisible" ID:174-171-1909 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:53.058250-0500	runningboardd	Assertion 174-171-1909 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:53.135934-0500	runningboardd	Invalidating assertion 174-8572-1901 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:53.165179-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:53.165293-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:53.165627-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:53.167551-0500	runningboardd	Invalidating assertion 174-114-1902 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:53.211291-0500	mDNSResponder	[R1763] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8QCB12s8AQmmN/JWxb5wSw=='>, Addr) START PID[8572](RedLemon)
default	15:51:53.212100-0500	mDNSResponder	[R1764] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8QCB12s8AQmmN/JWxb5wSw=='>, AAAA) START PID[8572](RedLemon)
default	15:51:53.213177-0500	mDNSResponder	[R1763] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'a+ZGcP2TnfAKHAs9CPXCKw=='>, Addr) STOP PID[8572](RedLemon)
default	15:51:53.213270-0500	mDNSResponder	[R1764] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'a+ZGcP2TnfAKHAs9CPXCKw=='>, AAAA) STOP PID[8572](RedLemon)
default	15:51:53.277124-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:53.277586-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:53.277928-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:53.703950-0500	RedLemon	🖱️ Mouse: x=681/1366 y=81/768 | Exit: 0 Controls: 1 Chat: 0
default	15:51:53.753703-0500	RedLemon	🖱️ Mouse: x=682/1366 y=74/768 | Exit: 0 Controls: 1 Chat: 0
default	15:51:54.377370-0500	RedLemon	🖱️ Mouse: x=681/1366 y=0/768 | Exit: 0 Controls: 1 Chat: 0
default	15:51:54.535768-0500	RedLemon	Task <9E6A81DA-245C-486D-BF9D-E71F3DE92908>.<175> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:54.536937-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2D81FEDE-5C6C-49D2-916C-CF613D0347E1] (reporting strategy default)> on Task <9E6A81DA-245C-486D-BF9D-E71F3DE92908>.<175> was not selected for reporting
default	15:51:54.538281-0500	RedLemon	Task <9E6A81DA-245C-486D-BF9D-E71F3DE92908>.<175> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:54.538597-0500	RedLemon	Task <9E6A81DA-245C-486D-BF9D-E71F3DE92908>.<175> now using Connection 3
default	15:51:54.539937-0500	RedLemon	0x7fbf97abfaa8 ID=120 Task <9E6A81DA-245C-486D-BF9D-E71F3DE92908>.<175> sent request, body N 0
default	15:51:54.566479-0500	mDNSResponder	[R1765] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8QCB12s8AQmmN/JWxb5wSw=='>, Addr) START PID[8572](RedLemon)
default	15:51:54.567373-0500	mDNSResponder	[R1766] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8QCB12s8AQmmN/JWxb5wSw=='>, AAAA) START PID[8572](RedLemon)
default	15:51:54.568440-0500	mDNSResponder	[R1765] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'a+ZGcP2TnfAKHAs9CPXCKw=='>, Addr) STOP PID[8572](RedLemon)
default	15:51:54.568538-0500	mDNSResponder	[R1766] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'a+ZGcP2TnfAKHAs9CPXCKw=='>, AAAA) STOP PID[8572](RedLemon)
default	15:51:54.624229-0500	RedLemon	0x7fbf97abfaa8 ID=120 Task <9E6A81DA-245C-486D-BF9D-E71F3DE92908>.<175> received response, status 200 content K
default	15:51:54.625710-0500	RedLemon	Task <9E6A81DA-245C-486D-BF9D-E71F3DE92908>.<175> response ended
default	15:51:54.626281-0500	RedLemon	Task <9E6A81DA-245C-486D-BF9D-E71F3DE92908>.<175> done using Connection 3
default	15:51:54.626744-0500	RedLemon	Task <9E6A81DA-245C-486D-BF9D-E71F3DE92908>.<175> summary for task success {transaction_duration_ms=89, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=86, response_duration_ms=2, request_bytes=530, response_bytes=665, cache_hit=false}
default	15:51:54.626962-0500	RedLemon	Task <9E6A81DA-245C-486D-BF9D-E71F3DE92908>.<175> finished successfully
default	15:51:54.630695-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1911 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:54.630960-0500	runningboardd	Assertion 174-8572-1911 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:54.631836-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:54.631887-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:54.631937-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:54.634542-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1912 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:54.634777-0500	runningboardd	Assertion 174-114-1912 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:54.635710-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:54.635763-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:54.635813-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:55.068833-0500	RedLemon	🔍 MPV track-list/count: 3
default	15:51:55.069199-0500	RedLemon	🔍 Track 0 type: sub
default	15:51:55.069437-0500	RedLemon	✅ Found subtitle track: ID=1, lang=en, title=Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:51:55.069677-0500	RedLemon	🔍 Track 1 type: sub
default	15:51:55.069854-0500	RedLemon	✅ Found subtitle track: ID=2, lang=en, title=Frankenstein (2025) eng
default	15:51:55.070012-0500	RedLemon	🔍 Track 2 type: sub
default	15:51:55.070204-0500	RedLemon	✅ Found subtitle track: ID=3, lang=en, title=Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:51:55.070355-0500	RedLemon	📊 Total subtitle tracks found: 4 (including Off if needed)
default	15:51:55.245445-0500	RedLemon	 HALPlugInManagement::RegisterPlugIns: skipping in-process plug-ins
error	15:51:55.245524-0500	RedLemon	AddInstanceForFactory: No factory registered for id <CFUUID 0x7fbf9622c3e0> F8BB1C28-BAE8-11D6-9C31-00039315CD46
default	15:51:55.334492-0500	RedLemon	                AUHAL.cpp:386   AUHAL: (0x7fbf95083e40) Listening to HAL system property 1682929012
default	15:51:55.334666-0500	RedLemon	                AUHAL.cpp:397   AUHAL: (0x7fbf95083e40) Selecting device 49 from constructor
default	15:51:55.334728-0500	RedLemon	                AUHAL.cpp:570   SelectDevice: -> (0x7fbf95083e40)
default	15:51:55.334774-0500	RedLemon	                AUHAL.cpp:627   SelectDevice: (0x7fbf95083e40) not already running
default	15:51:55.334811-0500	RedLemon	                AUHAL.cpp:702   SelectDevice: (0x7fbf95083e40) nothing to teardown
default	15:51:55.334846-0500	RedLemon	                AUHAL.cpp:706   SelectDevice: (0x7fbf95083e40) connecting device 49
default	15:51:55.336405-0500	RedLemon	                AUHAL.cpp:3107  IsDeviceUsable: (0x7fbf95083e40) Device ID: 49 (Input:No | Output:Yes): true
default	15:51:55.336805-0500	RedLemon	                AUHAL.cpp:716   SelectDevice: (0x7fbf95083e40) created ioproc 0xa for device 49
default	15:51:55.336867-0500	RedLemon	                AUHAL.cpp:1452  UpdateStreamFormats: -> (0x7fbf95083e40)
default	15:51:55.337182-0500	RedLemon	                AUHAL.cpp:1516  UpdateStreamFormats:
  output stream 0 [0x32]:  2 ch,  44100 Hz, Float32, interleaved
default	15:51:55.337294-0500	RedLemon	                AUHAL.cpp:1527  UpdateStreamFormats: 1 output streams; not all mono
default	15:51:55.337349-0500	RedLemon	                AUHAL.cpp:1537  UpdateStreamFormats:
  Output render format:  2 ch,  44100 Hz, Float32, interleaved
default	15:51:55.337400-0500	RedLemon	                AUHAL.cpp:1527  UpdateStreamFormats: 0 input streams; not all mono
default	15:51:55.337671-0500	RedLemon	                AUHAL.cpp:1602  UpdateStreamFormats: AUHAL(0x7fbf95083e40) Calling PropertyChanged() for kAudioUnitProperty_StreamFormat, Scope:Output, Bus:Output
default	15:51:55.337764-0500	RedLemon	                AUHAL.cpp:1615  UpdateStreamFormats: <-
default	15:51:55.338700-0500	RedLemon	                AUHAL.cpp:820   SelectDevice: (0x7fbf95083e40) removing 0 device listeners from device 0
default	15:51:55.338738-0500	RedLemon	                AUHAL.cpp:829   SelectDevice: (0x7fbf95083e40) adding 6 device listeners to device 49
default	15:51:55.339159-0500	RedLemon	                AUHAL.cpp:820   SelectDevice: (0x7fbf95083e40) removing 0 device delegate listeners from device 0
default	15:51:55.339241-0500	RedLemon	                AUHAL.cpp:829   SelectDevice: (0x7fbf95083e40) adding 0 device delegate listeners to device 49
default	15:51:55.339287-0500	RedLemon	                AUHAL.cpp:842   SelectDevice: <- (0x7fbf95083e40)
default	15:51:55.340009-0500	RedLemon	                AUHAL.cpp:1711  SetStreamUsage: Output stream enables: Stream 0 is ENABLED
default	15:51:55.343204-0500	RedLemon	Registered notify signal com.apple.caulk.alloc.audiodump (0)
default	15:51:55.344383-0500	RedLemon	                AUHAL.cpp:1711  SetStreamUsage: Output stream enables: Stream 0 is ENABLED
default	15:51:55.344559-0500	RedLemon	                AUHAL.cpp:2060  SetProperty: (0x7fbf95083e40) caller requesting device change from 49 to 49
default	15:51:55.344624-0500	RedLemon	                AUHAL.cpp:570   SelectDevice: -> (0x7fbf95083e40)
default	15:51:55.344667-0500	RedLemon	                AUHAL.cpp:613   SelectDevice: <- (0x7fbf95083e40) exiting with nothing to do
default	15:51:55.598406-0500	mDNSResponder	[R1767] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8QCB12s8AQmmN/JWxb5wSw=='>, Addr) START PID[8572](RedLemon)
default	15:51:55.599659-0500	mDNSResponder	[R1768] DNSServiceQueryRecord(1D000, 0, <mask.hash: '8QCB12s8AQmmN/JWxb5wSw=='>, AAAA) START PID[8572](RedLemon)
default	15:51:55.601756-0500	mDNSResponder	[R1767] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'a+ZGcP2TnfAKHAs9CPXCKw=='>, Addr) STOP PID[8572](RedLemon)
default	15:51:55.601850-0500	mDNSResponder	[R1768] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'a+ZGcP2TnfAKHAs9CPXCKw=='>, AAAA) STOP PID[8572](RedLemon)
default	15:51:55.639379-0500	runningboardd	Invalidating assertion 174-8572-1911 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:55.652616-0500	RedLemon	⏱️ Duration update: 9145.8s. WatchParty: YES, SentReady: NO
default	15:51:55.652781-0500	RedLemon	⏱️ Watch Party: Duration available (9145.8s), triggering ready signal
default	15:51:55.652884-0500	RedLemon	👋 Watch Party: Sending READY signal
default	15:51:55.749377-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:55.749998-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:55.750083-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:55.754704-0500	runningboardd	Invalidating assertion 174-114-1912 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:55.841490-0500	RedLemon	✅ Watch Party: READY signal sent successfully
default	15:51:55.863008-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:55.863792-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:55.863883-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:55.887269-0500	RedLemon	Task <20BC6C24-724D-4463-9AF6-4A31FEDC1B58>.<176> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:51:55.887722-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8D26C51D-CCD5-4FE6-AF16-A109B9B810D5] (reporting strategy default)> on Task <20BC6C24-724D-4463-9AF6-4A31FEDC1B58>.<176> was not selected for reporting
default	15:51:55.891309-0500	RedLemon	Task <20BC6C24-724D-4463-9AF6-4A31FEDC1B58>.<176> summary for task success {transaction_duration_ms=3, response_status=200, cache_hit=true}
default	15:51:55.891443-0500	RedLemon	Task <20BC6C24-724D-4463-9AF6-4A31FEDC1B58>.<176> finished successfully
default	15:51:55.907339-0500	RedLemon	⏱️ Duration update: 9145.8s. WatchParty: YES, SentReady: YES
default	15:51:56.535862-0500	RedLemon	Task <F24F425F-008A-4491-ADE0-BEA111033169>.<177> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:56.536375-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D3C27D3E-3B24-420D-94BE-C2A6BA3BCE71] (reporting strategy default)> on Task <F24F425F-008A-4491-ADE0-BEA111033169>.<177> was not selected for reporting
default	15:51:56.537487-0500	RedLemon	Task <F24F425F-008A-4491-ADE0-BEA111033169>.<177> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:56.537806-0500	RedLemon	Task <F24F425F-008A-4491-ADE0-BEA111033169>.<177> now using Connection 3
default	15:51:56.538969-0500	RedLemon	0x7fbf96254b68 ID=124 Task <F24F425F-008A-4491-ADE0-BEA111033169>.<177> sent request, body N 0
default	15:51:56.592284-0500	RedLemon	Connection 18: cleaning up
default	15:51:56.592377-0500	RedLemon	[C18 D53836F8-0DFE-4F22-BFD1-18CA3C2C3215 Hostname#199a033c:443 quic-connection, url hash: 12f6340e, definite, attribution: developer] cancel
default	15:51:56.592538-0500	RedLemon	[C18 D53836F8-0DFE-4F22-BFD1-18CA3C2C3215 Hostname#199a033c:443 quic-connection, url hash: 12f6340e, definite, attribution: developer] cancelled
	[C18.1.1 CD3EA301-2864-413A-B904-565889E224DD 2607:fea8:995b:fd00:e143:eb11:f54f:69d1.60086<->IPv6#1274a9ff.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 6.818s, DNS @0.007s took 0.022s, TCP @0.033s took 0.110s, TLS 1.3 took 0.222s
	bytes in/out: 7078/1876, packets in/out: 21/24, rtt: 0.128s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:51:56.593138-0500	RedLemon	nw_protocol_tcp_log_summary [C18.1.1:3]
	[5FB6815B-62B1-4FA3-B021-4B20E36E1BD0 <private>:60086<-><private>:443]
	Init: 1, Conn_Time: 109.631ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 0
	rtt_cache: kernel, rtt_upd: 11, rtt: 128.718ms, rtt_var: 20.750ms rtt_nc: 124.437ms, rtt_var_nc: 21.937ms base rtt: 100ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:51:56.593410-0500	RedLemon	nw_flow_disconnected [C18.1.1 IPv6#1274a9ff.443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:51:56.594002-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C18] reporting state cancelled
default	15:51:56.594167-0500	RedLemon	Connection 18: done
default	15:51:56.594223-0500	RedLemon	tcp_input [C18.1.1:3] flags=[FP.] seq=1055022546, ack=2980633858, win=501 state=ESTABLISHED rcv_nxt=1055022546, snd_una=2980633858
error	15:51:56.594367-0500	RedLemon	tcp_output [C18.1.1:3] flags=[R.] seq=2980633921, ack=1055022571, win=4095 state=CLOSED rcv_nxt=1055022571, snd_una=2980633858
default	15:51:56.620050-0500	RedLemon	0x7fbf96254b68 ID=124 Task <F24F425F-008A-4491-ADE0-BEA111033169>.<177> received response, status 200 content K
default	15:51:56.626385-0500	RedLemon	Task <F24F425F-008A-4491-ADE0-BEA111033169>.<177> response ended
default	15:51:56.630495-0500	RedLemon	Task <F24F425F-008A-4491-ADE0-BEA111033169>.<177> done using Connection 3
default	15:51:56.630995-0500	RedLemon	Task <F24F425F-008A-4491-ADE0-BEA111033169>.<177> summary for task success {transaction_duration_ms=94, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=83, response_duration_ms=10, request_bytes=530, response_bytes=663, cache_hit=false}
default	15:51:56.631232-0500	RedLemon	Task <F24F425F-008A-4491-ADE0-BEA111033169>.<177> finished successfully
default	15:51:56.639288-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1913 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:56.641061-0500	runningboardd	Assertion 174-8572-1913 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:56.643198-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:56.643296-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:56.643567-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:56.645979-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1914 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:56.646626-0500	runningboardd	Assertion 174-114-1914 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:56.648592-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:56.648639-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:56.648685-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:57.648341-0500	runningboardd	Invalidating assertion 174-8572-1913 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:57.822468-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:57.822549-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:57.822633-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:57.824714-0500	runningboardd	Invalidating assertion 174-114-1914 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:57.927792-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:57.927884-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:57.927972-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:58.536751-0500	RedLemon	Task <375CB4B0-DD3D-44B3-8E37-5E0874AD6801>.<178> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:51:58.537703-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4C250BE6-B8A9-4FE5-920A-FE5C65FEF22C] (reporting strategy default)> on Task <375CB4B0-DD3D-44B3-8E37-5E0874AD6801>.<178> was not selected for reporting
default	15:51:58.538889-0500	RedLemon	Task <375CB4B0-DD3D-44B3-8E37-5E0874AD6801>.<178> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:51:58.539288-0500	RedLemon	Task <375CB4B0-DD3D-44B3-8E37-5E0874AD6801>.<178> now using Connection 3
default	15:51:58.540350-0500	RedLemon	0x7fbf970c4d48 ID=128 Task <375CB4B0-DD3D-44B3-8E37-5E0874AD6801>.<178> sent request, body N 0
default	15:51:58.598603-0500	RedLemon	0x7fbf970c4d48 ID=128 Task <375CB4B0-DD3D-44B3-8E37-5E0874AD6801>.<178> received response, status 200 content K
default	15:51:58.599219-0500	RedLemon	Task <375CB4B0-DD3D-44B3-8E37-5E0874AD6801>.<178> response ended
default	15:51:58.599730-0500	RedLemon	Task <375CB4B0-DD3D-44B3-8E37-5E0874AD6801>.<178> done using Connection 3
default	15:51:58.599955-0500	RedLemon	Task <375CB4B0-DD3D-44B3-8E37-5E0874AD6801>.<178> summary for task success {transaction_duration_ms=61, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=60, response_duration_ms=1, request_bytes=530, response_bytes=660, cache_hit=false}
default	15:51:58.600455-0500	RedLemon	Task <375CB4B0-DD3D-44B3-8E37-5E0874AD6801>.<178> finished successfully
default	15:51:58.601568-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1915 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:58.601855-0500	runningboardd	Assertion 174-8572-1915 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:51:58.602616-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:58.602663-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:58.603015-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:58.605302-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1916 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:51:58.605704-0500	runningboardd	Assertion 174-114-1916 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:51:58.606707-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:58.606831-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:58.606880-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:59.608078-0500	runningboardd	Invalidating assertion 174-8572-1915 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:51:59.709861-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:59.709917-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:59.709964-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:51:59.711443-0500	runningboardd	Invalidating assertion 174-114-1916 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:51:59.822662-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:51:59.822746-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:51:59.822824-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:00.536869-0500	RedLemon	Task <514D65AC-3182-4926-A85F-F7AB7ACA224F>.<179> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:52:00.537585-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B6E203EE-5517-490D-828C-426538E7A2E4] (reporting strategy default)> on Task <514D65AC-3182-4926-A85F-F7AB7ACA224F>.<179> was not selected for reporting
default	15:52:00.539009-0500	RedLemon	Task <514D65AC-3182-4926-A85F-F7AB7ACA224F>.<179> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:52:00.539403-0500	RedLemon	Task <514D65AC-3182-4926-A85F-F7AB7ACA224F>.<179> now using Connection 3
default	15:52:00.540657-0500	RedLemon	0x7fbf970a1048 ID=132 Task <514D65AC-3182-4926-A85F-F7AB7ACA224F>.<179> sent request, body N 0
default	15:52:00.601413-0500	RedLemon	0x7fbf970a1048 ID=132 Task <514D65AC-3182-4926-A85F-F7AB7ACA224F>.<179> received response, status 200 content K
default	15:52:00.602690-0500	RedLemon	Task <514D65AC-3182-4926-A85F-F7AB7ACA224F>.<179> response ended
default	15:52:00.603487-0500	RedLemon	Task <514D65AC-3182-4926-A85F-F7AB7ACA224F>.<179> done using Connection 3
default	15:52:00.603885-0500	RedLemon	Task <514D65AC-3182-4926-A85F-F7AB7ACA224F>.<179> summary for task success {transaction_duration_ms=65, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=62, response_duration_ms=2, request_bytes=530, response_bytes=663, cache_hit=false}
default	15:52:00.604408-0500	RedLemon	Task <514D65AC-3182-4926-A85F-F7AB7ACA224F>.<179> finished successfully
default	15:52:00.605693-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1917 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:52:00.605922-0500	runningboardd	Assertion 174-8572-1917 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:52:00.606687-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:00.606739-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:00.606789-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:00.609029-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1918 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:52:00.609309-0500	runningboardd	Assertion 174-114-1918 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:52:00.611795-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:00.611845-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:00.611890-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:00.637757-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:52:01.162633-0500	RedLemon	Task <38084F03-00D3-44FF-A0DB-7B59CB612115>.<180> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:52:01.163187-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CCD01C62-C005-4D0A-BC38-AD2174179CE0] (reporting strategy default)> on Task <38084F03-00D3-44FF-A0DB-7B59CB612115>.<180> was not selected for reporting
default	15:52:01.165591-0500	RedLemon	Task <38084F03-00D3-44FF-A0DB-7B59CB612115>.<180> summary for task success {transaction_duration_ms=2, response_status=200, cache_hit=true}
default	15:52:01.165718-0500	RedLemon	Task <38084F03-00D3-44FF-A0DB-7B59CB612115>.<180> finished successfully
default	15:52:01.612720-0500	runningboardd	Invalidating assertion 174-8572-1917 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:52:01.714200-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:01.714240-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:01.714274-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:01.717468-0500	runningboardd	Invalidating assertion 174-114-1918 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:52:01.889522-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:01.889569-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:01.889616-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:02.537328-0500	RedLemon	Task <372D9DF6-EF1C-48AD-902B-129B707F907D>.<181> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:52:02.537810-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BEB67E84-6031-4330-8CC2-BA471AD7D782] (reporting strategy default)> on Task <372D9DF6-EF1C-48AD-902B-129B707F907D>.<181> was not selected for reporting
default	15:52:02.539207-0500	RedLemon	Task <372D9DF6-EF1C-48AD-902B-129B707F907D>.<181> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:52:02.539472-0500	RedLemon	Task <372D9DF6-EF1C-48AD-902B-129B707F907D>.<181> now using Connection 3
default	15:52:02.540915-0500	RedLemon	0x7fbf970f03c8 ID=136 Task <372D9DF6-EF1C-48AD-902B-129B707F907D>.<181> sent request, body N 0
default	15:52:02.606096-0500	RedLemon	0x7fbf970f03c8 ID=136 Task <372D9DF6-EF1C-48AD-902B-129B707F907D>.<181> received response, status 200 content K
default	15:52:02.606591-0500	RedLemon	Task <372D9DF6-EF1C-48AD-902B-129B707F907D>.<181> response ended
default	15:52:02.606867-0500	RedLemon	Task <372D9DF6-EF1C-48AD-902B-129B707F907D>.<181> done using Connection 3
default	15:52:02.607331-0500	RedLemon	Task <372D9DF6-EF1C-48AD-902B-129B707F907D>.<181> summary for task success {transaction_duration_ms=68, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=67, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=false}
default	15:52:02.608494-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1919 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:52:02.607697-0500	RedLemon	Task <372D9DF6-EF1C-48AD-902B-129B707F907D>.<181> finished successfully
default	15:52:02.609087-0500	runningboardd	Assertion 174-8572-1919 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:52:02.610546-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:02.610649-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:02.610697-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:02.613660-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1920 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:52:02.613836-0500	runningboardd	Assertion 174-114-1920 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:52:02.615317-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:02.615405-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:02.615461-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:03.616413-0500	runningboardd	Invalidating assertion 174-8572-1919 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:52:03.719177-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:03.719451-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:03.719742-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:03.722737-0500	runningboardd	Invalidating assertion 174-114-1920 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:52:03.825268-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:03.825359-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:03.825448-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:04.536166-0500	RedLemon	Task <16C454F9-3775-4ACD-A25A-8465707D0E20>.<182> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:52:04.536956-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9F844A3C-C92F-467C-9830-46DF9C7AAE9A] (reporting strategy default)> on Task <16C454F9-3775-4ACD-A25A-8465707D0E20>.<182> was not selected for reporting
default	15:52:04.538140-0500	RedLemon	Task <16C454F9-3775-4ACD-A25A-8465707D0E20>.<182> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:52:04.538582-0500	RedLemon	Task <16C454F9-3775-4ACD-A25A-8465707D0E20>.<182> now using Connection 3
default	15:52:04.541273-0500	RedLemon	0x7fbf97061588 ID=140 Task <16C454F9-3775-4ACD-A25A-8465707D0E20>.<182> sent request, body N 0
default	15:52:04.607630-0500	RedLemon	0x7fbf97061588 ID=140 Task <16C454F9-3775-4ACD-A25A-8465707D0E20>.<182> received response, status 200 content K
default	15:52:04.608189-0500	RedLemon	Task <16C454F9-3775-4ACD-A25A-8465707D0E20>.<182> response ended
default	15:52:04.608558-0500	RedLemon	Task <16C454F9-3775-4ACD-A25A-8465707D0E20>.<182> done using Connection 3
default	15:52:04.609114-0500	RedLemon	Task <16C454F9-3775-4ACD-A25A-8465707D0E20>.<182> summary for task success {transaction_duration_ms=71, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=70, response_duration_ms=1, request_bytes=530, response_bytes=662, cache_hit=true}
default	15:52:04.609591-0500	RedLemon	Task <16C454F9-3775-4ACD-A25A-8465707D0E20>.<182> finished successfully
default	15:52:04.610979-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1923 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:52:04.611171-0500	runningboardd	Assertion 174-8572-1923 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:52:04.612020-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:04.612067-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:04.612113-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:04.614784-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1924 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:52:04.614943-0500	runningboardd	Assertion 174-114-1924 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:52:04.615890-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:04.615957-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:04.616003-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:05.065428-0500	runningboardd	Invalidating assertion 174-140-1880 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.coreservices.launchservicesd>:140]
default	15:52:05.353444-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:05.355722-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:05.366377-0500	runningboardd	[anon<RedLemon>(501):8572] Set darwin role to: UserInteractiveNonFocal
default	15:52:05.368333-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:05.508994-0500	runningboardd	Invalidating assertion 174-171-1909 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	15:52:05.677527-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:05.679307-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:05.680012-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:05.710755-0500	runningboardd	Invalidating assertion 174-8572-1923 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:52:05.871934-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:05.871984-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:05.872035-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:05.879225-0500	runningboardd	Invalidating assertion 174-114-1924 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:52:06.038372-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:06.038424-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:06.038531-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:06.536550-0500	RedLemon	Task <4C90D82F-41D7-4C37-BBEA-A044CDB9B52A>.<183> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:52:06.537503-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5AB8A968-9FF0-4B15-8050-762B44C2943D] (reporting strategy default)> on Task <4C90D82F-41D7-4C37-BBEA-A044CDB9B52A>.<183> was not selected for reporting
default	15:52:06.539004-0500	RedLemon	Task <4C90D82F-41D7-4C37-BBEA-A044CDB9B52A>.<183> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:52:06.539216-0500	RedLemon	Task <4C90D82F-41D7-4C37-BBEA-A044CDB9B52A>.<183> now using Connection 3
default	15:52:06.541019-0500	RedLemon	0x7fbf97074408 ID=144 Task <4C90D82F-41D7-4C37-BBEA-A044CDB9B52A>.<183> sent request, body N 0
default	15:52:06.623023-0500	RedLemon	0x7fbf97074408 ID=144 Task <4C90D82F-41D7-4C37-BBEA-A044CDB9B52A>.<183> received response, status 200 content K
default	15:52:06.624876-0500	RedLemon	Task <4C90D82F-41D7-4C37-BBEA-A044CDB9B52A>.<183> response ended
default	15:52:06.625447-0500	RedLemon	Task <4C90D82F-41D7-4C37-BBEA-A044CDB9B52A>.<183> done using Connection 3
default	15:52:06.625772-0500	RedLemon	Task <4C90D82F-41D7-4C37-BBEA-A044CDB9B52A>.<183> summary for task success {transaction_duration_ms=87, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=84, response_duration_ms=2, request_bytes=530, response_bytes=662, cache_hit=false}
default	15:52:06.626162-0500	RedLemon	Task <4C90D82F-41D7-4C37-BBEA-A044CDB9B52A>.<183> finished successfully
default	15:52:06.630608-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1941 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:52:06.630978-0500	runningboardd	Assertion 174-8572-1941 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:52:06.633832-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:06.634169-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:06.634227-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:06.646717-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1942 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:52:06.647083-0500	runningboardd	Assertion 174-114-1942 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:52:06.649118-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:06.649358-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:06.649540-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:07.735146-0500	runningboardd	Invalidating assertion 174-8572-1941 (target:[anon<RedLemon>(501):8572]) from originator [anon<RedLemon>(501):8572]
default	15:52:07.802217-0500	RedLemon	tcp_input [C13.1.1:3] flags=[F.] seq=1937360025, ack=1848504134, win=8 state=ESTABLISHED rcv_nxt=1937360025, snd_una=1848504134
default	15:52:07.802328-0500	RedLemon	nw_protocol_tcp_log_summary [C13.1.1:3]
	[BE60941F-0AB6-449F-AE63-6C810AE1F82D <private>:60084<-><private>:443]
	Init: 1, Conn_Time: 18.165ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 8, rtt: 26.562ms, rtt_var: 12.312ms rtt_nc: 23.187ms, rtt_var_nc: 10.375ms base rtt: 11ms
	ACKs-compressed: 0, ACKs delayed: 9 delayed ACKs sent: 0
default	15:52:07.803116-0500	RedLemon	Connection 13: read-side closed
default	15:52:07.803138-0500	RedLemon	Connection 13: read-side closed
default	15:52:07.803162-0500	RedLemon	Connection 13: read-side closed
default	15:52:07.803427-0500	RedLemon	Connection 13: cleaning up
default	15:52:07.803498-0500	RedLemon	[C13 35213D18-9069-46DB-8F8E-9D84976BBB5C Hostname#204e95ef:443 quic-connection, url hash: eff720ee, definite, attribution: developer] cancel
default	15:52:07.803632-0500	RedLemon	[C13 35213D18-9069-46DB-8F8E-9D84976BBB5C Hostname#204e95ef:443 quic-connection, url hash: eff720ee, definite, attribution: developer] cancelled
	[C13.1.1 0670C083-31A9-4E01-8F94-1A474E628664 2607:fea8:995b:fd00:e143:eb11:f54f:69d1.60084<->IPv6#29739f0d.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 33.651s, DNS @0.001s took 0.013s, TCP @0.021s took 0.019s, TLS 1.3 took 0.039s
	bytes in/out: 484917/1095, packets in/out: 84/107, rtt: 0.026s, retransmitted bytes: 0, out-of-order bytes: 34970
default	15:52:07.804625-0500	RedLemon	nw_flow_disconnected [C13.1.1 IPv6#29739f0d.443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:52:07.805013-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C13] reporting state cancelled
default	15:52:07.805547-0500	RedLemon	Connection 13: done
default	15:52:07.805613-0500	RedLemon	tcp_output [C13.1.1:3] flags=[FP.] seq=1848504173, ack=1937360026, win=11374 state=LAST_ACK rcv_nxt=1937360026, snd_una=1848504134
default	15:52:07.905476-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:07.905531-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:07.905580-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:07.908418-0500	runningboardd	Invalidating assertion 174-114-1942 (target:[anon<RedLemon>(501):8572]) from originator [daemon<com.apple.powerd>:114]
default	15:52:08.072247-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:08.072534-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:08.072715-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:08.536984-0500	RedLemon	Task <6296693C-7535-405C-B680-C4B3ED8BEEEA>.<184> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:52:08.538024-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [769357A1-5286-4CA7-977E-25A12FDEBD83] (reporting strategy default)> on Task <6296693C-7535-405C-B680-C4B3ED8BEEEA>.<184> was not selected for reporting
default	15:52:08.539510-0500	RedLemon	Task <6296693C-7535-405C-B680-C4B3ED8BEEEA>.<184> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:52:08.539809-0500	RedLemon	Task <6296693C-7535-405C-B680-C4B3ED8BEEEA>.<184> now using Connection 3
default	15:52:08.540895-0500	RedLemon	0x7fbf93f41fe8 ID=148 Task <6296693C-7535-405C-B680-C4B3ED8BEEEA>.<184> sent request, body N 0
default	15:52:08.610754-0500	RedLemon	0x7fbf93f41fe8 ID=148 Task <6296693C-7535-405C-B680-C4B3ED8BEEEA>.<184> received response, status 200 content K
default	15:52:08.611428-0500	RedLemon	Task <6296693C-7535-405C-B680-C4B3ED8BEEEA>.<184> response ended
default	15:52:08.611888-0500	RedLemon	Task <6296693C-7535-405C-B680-C4B3ED8BEEEA>.<184> done using Connection 3
default	15:52:08.612164-0500	RedLemon	Task <6296693C-7535-405C-B680-C4B3ED8BEEEA>.<184> summary for task success {transaction_duration_ms=73, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=71, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=true}
default	15:52:08.612525-0500	RedLemon	Task <6296693C-7535-405C-B680-C4B3ED8BEEEA>.<184> finished successfully
default	15:52:08.620064-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [anon<RedLemon>(501):8572] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:174-8572-1943 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:52:08.620249-0500	runningboardd	Assertion 174-8572-1943 (target:[anon<RedLemon>(501):8572]) will be created as active as no start-time-defining assertions exist
default	15:52:08.621697-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:08.621742-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:08.621824-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed
default	15:52:08.623819-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):8572] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:174-114-1944 target:8572 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:52:08.623991-0500	runningboardd	Assertion 174-114-1944 (target:[anon<RedLemon>(501):8572]) will be created as active
default	15:52:08.625144-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring jetsam update because this process is not memory-managed
default	15:52:08.625199-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring suspend because this process is not lifecycle managed
default	15:52:08.625432-0500	runningboardd	[anon<RedLemon>(501):8572] Ignoring GPU update because this process is not GPU managed

