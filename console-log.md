default	17:05:52.414340-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):25877] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "frontmost:25877" ID:173-140-1900 target:25877 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	17:05:52.414702-0500	runningboardd	Assertion 173-140-1900 (target:[anon<RedLemon>(501):25877]) will be created as active
default	17:05:52.442131-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring jetsam update because this process is not memory-managed
default	17:05:52.448240-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring suspend because this process is not lifecycle managed
default	17:05:52.450562-0500	runningboardd	[anon<RedLemon>(501):25877] Set darwin role to: UserInteractiveFocal
default	17:05:52.450634-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring GPU update because this process is not GPU managed
default	17:05:52.453823-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):25877] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "notification:25877" ID:173-140-1901 target:25877 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	17:05:52.454271-0500	runningboardd	Assertion 173-140-1901 (target:[anon<RedLemon>(501):25877]) will be created as active
default	17:05:52.458292-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring jetsam update because this process is not memory-managed
default	17:05:52.458345-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring suspend because this process is not lifecycle managed
default	17:05:52.459124-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring GPU update because this process is not GPU managed
default	17:05:52.529503-0500	RedLemon	tcp_input [C7.1:3] flags=[FP.] seq=4153057677, ack=903846104, win=501 state=ESTABLISHED rcv_nxt=4153057677, snd_una=903846104
default	17:05:52.529741-0500	RedLemon	nw_protocol_tcp_log_summary [C7.1:3]
	[D57A2B08-D4FC-44DE-BB1D-3F9FCFCF03AD <private>:56539<-><private>:443]
	Init: 1, Conn_Time: 113.338ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 0
	rtt_cache: kernel, rtt_upd: 4, rtt: 127.343ms, rtt_var: 20.687ms rtt_nc: 120.968ms, rtt_var_nc: 36.937ms base rtt: 100ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	17:05:52.533503-0500	RedLemon	Connection 7: read-side closed
default	17:05:52.533555-0500	RedLemon	Connection 7: read-side closed
default	17:05:52.533591-0500	RedLemon	Connection 7: read-side closed
default	17:05:52.533868-0500	RedLemon	Connection 7: cleaning up
default	17:05:52.533963-0500	RedLemon	[C7 63913BE5-8047-475A-AE06-4F1D6CE01ADC Hostname#1feeda98:443 tcp, url hash: ef3a82c0, tls, definite, attribution: developer] cancel
default	17:05:52.535357-0500	RedLemon	[C7 63913BE5-8047-475A-AE06-4F1D6CE01ADC Hostname#1feeda98:443 tcp, url hash: ef3a82c0, tls, definite, attribution: developer] cancelled
	[C7.1 42088266-1034-4B0E-9986-E1C0F3103449 2607:fea8:995b:fd00:a093:c093:802e:3add.56539<->IPv6#47c3fd32.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 5.538s, DNS @0.000s took 0.027s, TCP @0.028s took 0.114s, TLS 1.3 took 0.130s
	bytes in/out: 5727/994, packets in/out: 11/15, rtt: 0.127s, retransmitted bytes: 0, out-of-order bytes: 0
default	17:05:52.538434-0500	RedLemon	nw_flow_disconnected [C7.1 IPv6#47c3fd32.443 cancelled channel-flow ((null))] Output protocol disconnected
default	17:05:52.539664-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C7] reporting state cancelled
default	17:05:52.540055-0500	RedLemon	tcp_output [C7.1:3] flags=[F.] seq=903846167, ack=4153057702, win=4096 state=LAST_ACK rcv_nxt=4153057702, snd_una=903846104
default	17:05:52.650949-0500	RedLemon	tcp_output [C7.1:3] flags=[FP.] seq=903846104, ack=4153057702, win=4096 state=LAST_ACK rcv_nxt=4153057702, snd_una=903846104
default	17:05:53.060403-0500	RedLemon	Task <2B7C516A-5BE7-4BFB-B21F-428670E0F329>.<63> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	17:05:53.060931-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [32D2A680-9A0C-4D87-AFB0-33C0664192FF] (reporting strategy default)> on Task <2B7C516A-5BE7-4BFB-B21F-428670E0F329>.<63> was not selected for reporting
default	17:05:53.062052-0500	RedLemon	Task <2B7C516A-5BE7-4BFB-B21F-428670E0F329>.<63> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:53.062350-0500	RedLemon	Task <2B7C516A-5BE7-4BFB-B21F-428670E0F329>.<63> now using Connection 2
default	17:05:53.062798-0500	RedLemon	Task <2B7C516A-5BE7-4BFB-B21F-428670E0F329>.<63> sent request, body N 0
default	17:05:53.131381-0500	RedLemon	Task <2B7C516A-5BE7-4BFB-B21F-428670E0F329>.<63> received response, status 200 content U
default	17:05:53.131731-0500	RedLemon	Task <2B7C516A-5BE7-4BFB-B21F-428670E0F329>.<63> done using Connection 2
default	17:05:53.132782-0500	RedLemon	Task <2B7C516A-5BE7-4BFB-B21F-428670E0F329>.<63> response ended
default	17:05:53.133037-0500	RedLemon	Task <2B7C516A-5BE7-4BFB-B21F-428670E0F329>.<63> summary for task success {transaction_duration_ms=71, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=1, request_bytes=227, response_bytes=888, cache_hit=false}
default	17:05:53.133394-0500	RedLemon	Task <2B7C516A-5BE7-4BFB-B21F-428670E0F329>.<63> finished successfully
default	17:05:53.135413-0500	RedLemon	Task <DCB9D77D-F9EB-4270-85CD-AA1AFFB91E4E>.<64> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	17:05:53.136360-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [39988E40-F4F2-497E-97D4-28C034F124BE] (reporting strategy default)> on Task <DCB9D77D-F9EB-4270-85CD-AA1AFFB91E4E>.<64> was not selected for reporting
default	17:05:53.137280-0500	RedLemon	Task <DCB9D77D-F9EB-4270-85CD-AA1AFFB91E4E>.<64> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:53.137573-0500	RedLemon	Task <DCB9D77D-F9EB-4270-85CD-AA1AFFB91E4E>.<64> now using Connection 2
default	17:05:53.140089-0500	RedLemon	Task <DCB9D77D-F9EB-4270-85CD-AA1AFFB91E4E>.<64> sent request, body S 94
default	17:05:53.233896-0500	RedLemon	Task <DCB9D77D-F9EB-4270-85CD-AA1AFFB91E4E>.<64> received response, status 409 content U
default	17:05:53.234136-0500	RedLemon	Task <DCB9D77D-F9EB-4270-85CD-AA1AFFB91E4E>.<64> done using Connection 2
default	17:05:53.235096-0500	RedLemon	Task <DCB9D77D-F9EB-4270-85CD-AA1AFFB91E4E>.<64> response ended
default	17:05:53.235330-0500	RedLemon	Task <DCB9D77D-F9EB-4270-85CD-AA1AFFB91E4E>.<64> summary for task success {transaction_duration_ms=98, response_status=409, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=96, response_duration_ms=1, request_bytes=320, response_bytes=476, cache_hit=false}
default	17:05:53.235778-0500	RedLemon	Task <DCB9D77D-F9EB-4270-85CD-AA1AFFB91E4E>.<64> finished successfully
default	17:05:53.236279-0500	RedLemon	⚠️ SupabaseClient: User already in room (409), proceeding...
default	17:05:53.361601-0500	RedLemon	🖼️ Loading background art: https://images.metahub.space/background/medium/tt0413300/img
default	17:05:53.362417-0500	RedLemon	⏳ Background art loading...
default	17:05:53.362775-0500	RedLemon	🎨 Loading logo: https://images.metahub.space/logo/medium/tt0413300/img
default	17:05:53.363396-0500	RedLemon	⏳ Logo loading...
default	17:05:53.372178-0500	RedLemon	Task <C1AB2C28-F308-46BC-8E08-5F8630EEF81A>.<20> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	17:05:53.373347-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2977467F-7667-4F8D-83B2-29FE11178331] (reporting strategy default)> on Task <C1AB2C28-F308-46BC-8E08-5F8630EEF81A>.<20> was not selected for reporting
default	17:05:53.374264-0500	RedLemon	Task <4F9A3612-8894-4D4E-BDD9-2CD08E0428E5>.<21> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	17:05:53.374424-0500	RedLemon	Task <C1AB2C28-F308-46BC-8E08-5F8630EEF81A>.<20> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:53.374934-0500	RedLemon	Task <C1AB2C28-F308-46BC-8E08-5F8630EEF81A>.<20> now using Connection 4
default	17:05:53.375236-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [83F6C8C4-DA9D-4F95-A30E-B785D1296093] (reporting strategy default)> on Task <4F9A3612-8894-4D4E-BDD9-2CD08E0428E5>.<21> was not selected for reporting
default	17:05:53.375914-0500	RedLemon	Task <C1AB2C28-F308-46BC-8E08-5F8630EEF81A>.<20> sent request, body N 0
default	17:05:53.376600-0500	RedLemon	Task <4F9A3612-8894-4D4E-BDD9-2CD08E0428E5>.<21> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:53.378089-0500	RedLemon	Task <4F9A3612-8894-4D4E-BDD9-2CD08E0428E5>.<21> now using Connection 4
default	17:05:53.380386-0500	RedLemon	Task <4F9A3612-8894-4D4E-BDD9-2CD08E0428E5>.<21> sent request, body N 0
default	17:05:53.389456-0500	RedLemon	Task <C1AB2C28-F308-46BC-8E08-5F8630EEF81A>.<20> received response, status 200 content K
default	17:05:53.390616-0500	RedLemon	Task <C1AB2C28-F308-46BC-8E08-5F8630EEF81A>.<20> done using Connection 4
default	17:05:53.391017-0500	RedLemon	Task <C1AB2C28-F308-46BC-8E08-5F8630EEF81A>.<20> response ended
default	17:05:53.391624-0500	RedLemon	Task <4F9A3612-8894-4D4E-BDD9-2CD08E0428E5>.<21> received response, status 200 content K
default	17:05:53.392493-0500	RedLemon	Task <C1AB2C28-F308-46BC-8E08-5F8630EEF81A>.<20> summary for task success {transaction_duration_ms=18, response_status=200, connection=4, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=15, response_duration_ms=1, request_bytes=37, response_bytes=51963, cache_hit=false}
default	17:05:53.392957-0500	RedLemon	Task <C1AB2C28-F308-46BC-8E08-5F8630EEF81A>.<20> finished successfully
default	17:05:53.414263-0500	RedLemon	✅ Logo loaded successfully
default	17:05:53.416410-0500	RedLemon	   Quality: 1080p
default	17:05:53.417097-0500	RedLemon	   Mode: watchParty
default	17:05:53.417227-0500	RedLemon	📡 Fetching metadata for tt0413300...
default	17:05:53.418565-0500	RedLemon	Task <2F9CFB0F-C471-42F3-86E1-6F37AD137522>.<1> resuming, timeouts(60.0, 300.0) QOS(0x19) Voucher (null)
default	17:05:53.419151-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AF32C3A4-4652-4BBE-97C0-FC7650166F33] (reporting strategy default)> on Task <2F9CFB0F-C471-42F3-86E1-6F37AD137522>.<1> was not selected for reporting
default	17:05:53.435472-0500	RedLemon	Connection 8: starting, TC(0x0)
default	17:05:53.435652-0500	RedLemon	[C8 79EABEBD-98D5-4275-B340-61795FDB137C 127.0.0.1:47253 tcp, url hash: 2a12ec71, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{37D592E4-4AB1-4306-845E-1D61F5F2152A}{(null)}{Y}{2} (private), proc: B4432D13-77F8-3DF2-847A-B04DA02DB95B] start
default	17:05:53.435765-0500	RedLemon	[C8 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	17:05:53.436192-0500	RedLemon	[C8 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), interface: lo0)] event: path:satisfied @0.000s, uuid: C128D93A-9A8A-46FC-A378-66AA6D3B8F23
default	17:05:53.436834-0500	RedLemon	[C8 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), interface: lo0)] event: flow:start_connect @0.001s
default	17:05:53.436876-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C8] reporting state preparing
default	17:05:53.437086-0500	RedLemon	Task <2F9CFB0F-C471-42F3-86E1-6F37AD137522>.<1> setting up Connection 8
default	17:05:53.437298-0500	RedLemon	Task <4F9A3612-8894-4D4E-BDD9-2CD08E0428E5>.<21> done using Connection 4
default	17:05:53.437629-0500	RedLemon	nw_socket_handle_socket_event [C8:2] Socket received CONNECTED event
default	17:05:53.437817-0500	RedLemon	nw_flow_connected [C8 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	17:05:53.438215-0500	RedLemon	[C8 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.002s
default	17:05:53.438301-0500	RedLemon	nw_flow_connected [C8 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-3232369669)
default	17:05:53.439291-0500	RedLemon	[C8 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.003s
default	17:05:53.439574-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C8] reporting state ready
default	17:05:53.439675-0500	RedLemon	[C8 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.003s
default	17:05:53.439749-0500	RedLemon	Connection 8: connected successfully
default	17:05:53.440033-0500	RedLemon	Connection 8: ready C(N) E(N)
default	17:05:53.441452-0500	RedLemon	Task <2F9CFB0F-C471-42F3-86E1-6F37AD137522>.<1> now using Connection 8
default	17:05:53.442878-0500	RedLemon	Connection 8: received viability advisory(Y)
default	17:05:53.444829-0500	RedLemon	Task <2F9CFB0F-C471-42F3-86E1-6F37AD137522>.<1> sent request, body N 0
default	17:05:53.445349-0500	RedLemon	Task <4F9A3612-8894-4D4E-BDD9-2CD08E0428E5>.<21> response ended
default	17:05:53.446686-0500	RedLemon	Task <4F9A3612-8894-4D4E-BDD9-2CD08E0428E5>.<21> summary for task success {transaction_duration_ms=71, response_status=200, connection=4, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=15, response_duration_ms=54, request_bytes=41, response_bytes=1014397, cache_hit=false}
default	17:05:53.446840-0500	RedLemon	Task <4F9A3612-8894-4D4E-BDD9-2CD08E0428E5>.<21> finished successfully
default	17:05:53.449999-0500	RedLemon	✅ Background art loaded successfully
default	17:05:53.468993-0500	mDNSResponder	[R4216] DNSServiceCreateConnection START PID[25877](RedLemon)
default	17:05:53.469196-0500	RedLemon	<private>
default	17:05:53.469331-0500	RedLemon	<private>
default	17:05:53.469638-0500	mDNSResponder	[R4217] DNSServiceQueryRecord(1D000, 0, <mask.hash: '/tfdZSgHcBatFx7YOuCljw=='>, Addr) START PID[25877](RedLemon)
default	17:05:53.469432-0500	RedLemon	<private>
default	17:05:53.469536-0500	RedLemon	<private>
default	17:05:53.470654-0500	mDNSResponder	[R4218] DNSServiceQueryRecord(1D000, 0, <mask.hash: '/tfdZSgHcBatFx7YOuCljw=='>, AAAA) START PID[25877](RedLemon)
default	17:05:53.491255-0500	mDNSResponder	[R4217] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'sj84HI6Ls+vhIwof6Ees1Q=='>, Addr) STOP PID[25877](RedLemon)
default	17:05:53.491349-0500	mDNSResponder	[R4218] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'sj84HI6Ls+vhIwof6Ees1Q=='>, AAAA) STOP PID[25877](RedLemon)
default	17:05:53.602684-0500	RedLemon	Task <2F9CFB0F-C471-42F3-86E1-6F37AD137522>.<1> received response, status 200 content K
default	17:05:53.603053-0500	RedLemon	Task <2F9CFB0F-C471-42F3-86E1-6F37AD137522>.<1> response ended
default	17:05:53.603152-0500	RedLemon	Task <2F9CFB0F-C471-42F3-86E1-6F37AD137522>.<1> done using Connection 8
default	17:05:53.603338-0500	RedLemon	Task <2F9CFB0F-C471-42F3-86E1-6F37AD137522>.<1> summary for task success {transaction_duration_ms=183, response_status=200, connection=8, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=2, secure_connection_duration_ms=0, private_relay=false, request_start_ms=24, request_duration_ms=0, response_start_ms=182, response_duration_ms=0, request_bytes=299, response_bytes=2703, cache_hit=false}
default	17:05:53.603600-0500	RedLemon	Task <2F9CFB0F-C471-42F3-86E1-6F37AD137522>.<1> finished successfully
default	17:05:53.605952-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: -1
default	17:05:53.650830-0500	RedLemon	🎬 GUEST: Using host's stream selection (skipping resolution)
default	17:05:53.651065-0500	RedLemon	⚠️ GUEST: Detected quality from filename: 4K
default	17:05:53.651175-0500	RedLemon	🎬 GUEST: Fetching subtitles for shared stream...
default	17:05:53.651766-0500	RedLemon	Task <20D16322-38D0-4F64-9381-07D1DCC3C2FB>.<2> resuming, timeouts(60.0, 300.0) QOS(0x19) Voucher (null)
default	17:05:53.652134-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D4CADFD9-5219-40B4-8D16-B8EACC1E0E0F] (reporting strategy default)> on Task <20D16322-38D0-4F64-9381-07D1DCC3C2FB>.<2> was not selected for reporting
default	17:05:53.652811-0500	RedLemon	Task <20D16322-38D0-4F64-9381-07D1DCC3C2FB>.<2> now using Connection 8
default	17:05:53.653172-0500	RedLemon	Task <20D16322-38D0-4F64-9381-07D1DCC3C2FB>.<2> sent request, body N 0
default	17:05:53.655816-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> resuming, timeouts(5.0, 604800.0) QOS(0x15) Voucher (null)
default	17:05:53.656328-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [36991ECE-ABD3-4631-A990-617C8007383E] (reporting strategy default)> on Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> was not selected for reporting
default	17:05:53.664525-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:53.665024-0500	RedLemon	Connection 9: enabling TLS
default	17:05:53.665049-0500	RedLemon	Connection 9: starting, TC(0x0)
default	17:05:53.665081-0500	RedLemon	[C9 0786C1BF-63CD-46FB-8E1E-A9E7737CE182 Hostname#38445e48:443 tcp, url hash: 008aa370, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{935D24CC-D049-4D03-9D51-70F13158B1CC}{(null)}{Y}{2} (private), proc: B4432D13-77F8-3DF2-847A-B04DA02DB95B] start
default	17:05:53.665158-0500	RedLemon	[C9 Hostname#38445e48:443 initial path ((null))] event: path:start @0.000s
default	17:05:53.665460-0500	RedLemon	[C9 Hostname#38445e48:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 927CAEA8-67F5-474F-BC5A-A81CEABA99D8
default	17:05:53.665596-0500	RedLemon	[C9 Hostname#38445e48:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	17:05:53.665853-0500	mDNSResponder	[R4219] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: '5Jaur2vW6gXr0hnyjhT/Ig=='>, options: 0x8 {use-failover}, client pid: 25877 (RedLemon)
default	17:05:53.665622-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C9] reporting state preparing
default	17:05:53.665783-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> setting up Connection 9
default	17:05:53.668962-0500	RedLemon	[C9 Hostname#38445e48:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_alternative @0.003s
default	17:05:53.669151-0500	RedLemon	nw_endpoint_resolver_update [C9 Hostname#38445e48:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#b359ef86.443
default	17:05:53.669255-0500	RedLemon	nw_endpoint_resolver_update [C9 Hostname#38445e48:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#03906bbc:443
default	17:05:53.669373-0500	RedLemon	[C9 Hostname#38445e48:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.004s
default	17:05:53.669588-0500	RedLemon	[C9.1 IPv6#b359ef86.443 initial path ((null))] event: path:start @0.004s
default	17:05:53.669975-0500	RedLemon	[C9.1 IPv6#b359ef86.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.004s, uuid: 339DDB56-3B1E-4F3B-84F6-0D3E94848C27
default	17:05:53.670118-0500	RedLemon	[C9.1 IPv6#b359ef86.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.004s
default	17:05:53.670659-0500	RedLemon	[C9.1 IPv6#b359ef86.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.005s
default	17:05:53.671525-0500	RedLemon	[C9.1 IPv6#b359ef86.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.006s
default	17:05:53.671852-0500	RedLemon	tcp_output [C9.1:3] flags=[S] seq=2515245273, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2515245273
default	17:05:53.681313-0500	RedLemon	tcp_input [C9.1:3] flags=[S.] seq=1947832142, ack=2515245274, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2515245273
default	17:05:53.681452-0500	RedLemon	nw_flow_connected [C9.1 IPv6#b359ef86.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	17:05:53.681622-0500	RedLemon	[C9.1 IPv6#b359ef86.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.016s
default	17:05:53.681674-0500	RedLemon	[C9 Hostname#38445e48:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.016s
default	17:05:53.682044-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C9.1:2][0x7fa10c0b4b80] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	17:05:53.682145-0500	RedLemon	boringssl_context_info_handler(2028) [C9.1:2][0x7fa10c0b4b80] Client handshake started
default	17:05:53.682284-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS client enter_early_data
default	17:05:53.682589-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS client read_server_hello
default	17:05:53.692487-0500	mDNSResponder	[R4219] getaddrinfo stop -- hostname: <mask.hash: '5Jaur2vW6gXr0hnyjhT/Ig=='>, client pid: 25877 (RedLemon)
default	17:05:53.692980-0500	RedLemon	[C9 Hostname#38445e48:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_alternative @0.027s
default	17:05:53.703670-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client read_hello_retry_request
default	17:05:53.703852-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client read_server_hello
default	17:05:53.704438-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	17:05:53.706478-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client read_certificate_request
default	17:05:53.706736-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client read_server_certificate
default	17:05:53.706939-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	17:05:53.708864-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C9.1:2][0x7fa10c0b4b80] Performing external trust evaluation
default	17:05:53.709587-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C9.1:2][0x7fa10c0b4b80] Asyncing for external verify block
default	17:05:53.710664-0500	RedLemon	Connection 9: asked to evaluate TLS Trust
default	17:05:53.711287-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> auth completion disp=1 cred=0x0
default	17:05:53.718909-0500	RedLemon	Connection 9: TLS Trust result 0
default	17:05:53.718982-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C9.1:2][0x7fa10c0b4b80] Returning from external verify block with result: true
default	17:05:53.719037-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C9.1:2][0x7fa10c0b4b80] Certificate verification result: OK
default	17:05:53.719489-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client read_server_finished
default	17:05:53.719593-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client send_end_of_early_data
default	17:05:53.719616-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	17:05:53.719636-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client send_client_certificate
default	17:05:53.719655-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client complete_second_flight
default	17:05:53.719732-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS 1.3 client done
default	17:05:53.719940-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS client finish_client_handshake
default	17:05:53.719974-0500	RedLemon	boringssl_context_info_handler(2045) [C9.1:2][0x7fa10c0b4b80] Client handshake state: TLS client done
default	17:05:53.720002-0500	RedLemon	boringssl_context_info_handler(2034) [C9.1:2][0x7fa10c0b4b80] Client handshake done
default	17:05:53.720683-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C9.1:2][0x7fa10c0b4b80] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(38ms) flight_time(24ms) rtt(21ms) write_stalls(0) read_stalls(7)]
default	17:05:53.720896-0500	RedLemon	nw_flow_connected [C9.1 IPv6#b359ef86.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-3232369669)
default	17:05:53.721308-0500	RedLemon	[C9.1 IPv6#b359ef86.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.056s
default	17:05:53.721719-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C9] reporting state ready
default	17:05:53.721843-0500	RedLemon	[C9 Hostname#38445e48:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.056s
default	17:05:53.722090-0500	RedLemon	[C9.1 IPv6#b359ef86.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.056s
default	17:05:53.722234-0500	RedLemon	[C9 Hostname#38445e48:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.057s
default	17:05:53.722393-0500	RedLemon	Connection 9: connected successfully
default	17:05:53.722450-0500	RedLemon	Connection 9: TLS handshake complete
default	17:05:53.722835-0500	RedLemon	Connection 9: ready C(N) E(N)
default	17:05:53.723431-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> now using Connection 9
default	17:05:53.723551-0500	RedLemon	Connection 9: received viability advisory(Y)
default	17:05:53.723754-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> sent request, body N 0
default	17:05:54.168143-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> received response, status 200 content U
default	17:05:54.168478-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> done using Connection 9
default	17:05:54.169137-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> response ended
default	17:05:54.169509-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> summary for task success {transaction_duration_ms=506, response_status=200, connection=9, protocol="h2", domain_lookup_duration_ms=4, connect_duration_ms=50, secure_connection_duration_ms=38, private_relay=false, request_start_ms=60, request_duration_ms=0, response_start_ms=505, response_duration_ms=1, request_bytes=175, response_bytes=1092, cache_hit=true}
default	17:05:54.170001-0500	RedLemon	Task <6DA91012-1D5B-487A-A87A-CC28484999D5>.<22> finished successfully
default	17:05:54.171120-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):25877] from originator [anon<RedLemon>(501):25877] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-25877-1905 target:25877 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	17:05:54.171572-0500	runningboardd	Assertion 173-25877-1905 (target:[anon<RedLemon>(501):25877]) will be created as active as no start-time-defining assertions exist
default	17:05:54.172230-0500	RedLemon	Task <0183842A-1BA4-49F2-BF17-10B440EAAAF2>.<23> resuming, timeouts(5.0, 604800.0) QOS(0x15) Voucher (null)
default	17:05:54.173031-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2613F3C6-25F1-411E-B2D4-435AFC233314] (reporting strategy default)> on Task <0183842A-1BA4-49F2-BF17-10B440EAAAF2>.<23> was not selected for reporting
default	17:05:54.175218-0500	RedLemon	Task <0183842A-1BA4-49F2-BF17-10B440EAAAF2>.<23> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:54.175517-0500	RedLemon	Task <0183842A-1BA4-49F2-BF17-10B440EAAAF2>.<23> now using Connection 9
default	17:05:54.175870-0500	RedLemon	Task <0183842A-1BA4-49F2-BF17-10B440EAAAF2>.<23> sent request, body N 0
default	17:05:54.177022-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring jetsam update because this process is not memory-managed
default	17:05:54.177093-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring suspend because this process is not lifecycle managed
default	17:05:54.177160-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring GPU update because this process is not GPU managed
default	17:05:54.180691-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):25877] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1906 target:25877 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	17:05:54.180888-0500	runningboardd	Assertion 173-114-1906 (target:[anon<RedLemon>(501):25877]) will be created as active
default	17:05:54.182262-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring jetsam update because this process is not memory-managed
default	17:05:54.182311-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring suspend because this process is not lifecycle managed
default	17:05:54.182357-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring GPU update because this process is not GPU managed
default	17:05:54.474673-0500	RedLemon	Task <0183842A-1BA4-49F2-BF17-10B440EAAAF2>.<23> received response, status 200 content U
default	17:05:54.474911-0500	RedLemon	Task <0183842A-1BA4-49F2-BF17-10B440EAAAF2>.<23> done using Connection 9
default	17:05:54.475671-0500	RedLemon	Task <0183842A-1BA4-49F2-BF17-10B440EAAAF2>.<23> response ended
default	17:05:54.475955-0500	RedLemon	Task <0183842A-1BA4-49F2-BF17-10B440EAAAF2>.<23> summary for task success {transaction_duration_ms=301, response_status=200, connection=9, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=300, response_duration_ms=1, request_bytes=92, response_bytes=302, cache_hit=false}
default	17:05:54.476392-0500	RedLemon	Task <0183842A-1BA4-49F2-BF17-10B440EAAAF2>.<23> finished successfully
default	17:05:54.479940-0500	RedLemon	Task <20D16322-38D0-4F64-9381-07D1DCC3C2FB>.<2> received response, status 200 content K
default	17:05:54.480285-0500	RedLemon	Task <20D16322-38D0-4F64-9381-07D1DCC3C2FB>.<2> response ended
default	17:05:54.480395-0500	RedLemon	Task <20D16322-38D0-4F64-9381-07D1DCC3C2FB>.<2> done using Connection 8
default	17:05:54.480634-0500	RedLemon	Task <20D16322-38D0-4F64-9381-07D1DCC3C2FB>.<2> summary for task success {transaction_duration_ms=828, response_status=200, connection=8, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=827, response_duration_ms=0, request_bytes=323, response_bytes=148, cache_hit=false}
default	17:05:54.481086-0500	RedLemon	Task <20D16322-38D0-4F64-9381-07D1DCC3C2FB>.<2> finished successfully
default	17:05:54.481549-0500	RedLemon	✅ GUEST: Found 0 subtitles
default	17:05:54.517121-0500	RedLemon	🎬🎬🎬 MPVPlayerView INIT called - streamURL: https://chi9-4.download.real-debrid.com/d/Z4ISYGLKCDEX2107/S, subtitles: 0
default	17:05:54.572429-0500	RedLemon	✅ Stream ready, starting playback...
default	17:05:54.572695-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	17:05:54.575963-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7fa10c06a570>
default	17:05:54.576224-0500	RedLemon	   Is fullscreen: 0
default	17:05:54.576555-0500	RedLemon	   ✅ WindowManager: Toggling fullscreen ON
default	17:05:54.668149-0500	RedLemon	🖼️ Setting up MPV with native macOS video output...
default	17:05:54.674896-0500	RedLemon	✅ MPV initialized with native GPU rendering
default	17:05:54.702672-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task starting
default	17:05:54.703097-0500	RedLemon	🎉 Starting watch party sync - Room: event_tt0413300, Host: NO
default	17:05:54.703588-0500	RedLemon	🎉 Watch Party Mode ENABLED. isInWatchParty = YES
default	17:05:54.780504-0500	runningboardd	Invalidating assertion 173-171-1884 (target:[anon<RedLemon>(501):25877]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	17:05:54.781053-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):25877] from originator [daemon<com.apple.WindowServer(88)>:171] with description <RBSAssertionDescriptor| "AppVisible" ID:173-171-1912 target:25877 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	17:05:54.781215-0500	runningboardd	Assertion 173-171-1912 (target:[anon<RedLemon>(501):25877]) will be created as active
default	17:05:54.790117-0500	RedLemon	🔄 Starting chat polling for room: event_tt0413300
default	17:05:54.790600-0500	RedLemon	✅ Watch party sync started successfully - isInWatchParty is now TRUE
default	17:05:54.790847-0500	RedLemon	🎬🎬🎬 About to call loadStream - isInWatchParty: YES
default	17:05:54.791181-0500	RedLemon	🎬🎬🎬 Subtitles: 0
default	17:05:54.791965-0500	RedLemon	🎬🎬🎬 LOADSTREAM CALLED - streamTitle: Spider-Man 3
default	17:05:54.792614-0500	RedLemon	🎬🎬🎬 streamURL: https://chi9-4.download.real-debrid.com/d/Z4ISYGLKCDEX2107/S
default	17:05:54.792885-0500	RedLemon	🎬🎬🎬 subtitles: 0
default	17:05:54.796639-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task completed
default	17:05:54.815052-0500	RedLemon	Task <59CF2CBA-CC74-4A7C-A712-AC45E91E63FC>.<65> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	17:05:54.815830-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B770038D-9AD7-40C3-AA82-A13BC1090A74] (reporting strategy default)> on Task <59CF2CBA-CC74-4A7C-A712-AC45E91E63FC>.<65> was not selected for reporting
default	17:05:54.816262-0500	RedLemon	🎬 MPV: Current video filename set to: Spider-Man 3 2007 1080p UHD BluRay DD+7.1 x264-LoRD.mkv
default	17:05:54.816355-0500	RedLemon	🔍 MPV track-list/count: 0
default	17:05:54.816556-0500	RedLemon	🎬 MPV loadVideo called with URL: https://chi9-4.download.real-debrid.com/d/Z4ISYGLKCDEX2107/Spider-Man%203%202007%201080p%20UHD%20Blu, autoplay: true
default	17:05:54.816903-0500	RedLemon	Task <59CF2CBA-CC74-4A7C-A712-AC45E91E63FC>.<65> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:54.817044-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	17:05:54.817173-0500	RedLemon	🎬 MPV executing command: loadfile "https://chi9-4.download.real-debrid.com/d/Z4ISYGLKCDEX2107/Spider-Man%203%202007%201080p%20UHD%20BluRay%20DD%2B7.1%20x264-LoRD.mkv"
default	17:05:54.817370-0500	RedLemon	Task <59CF2CBA-CC74-4A7C-A712-AC45E91E63FC>.<65> now using Connection 2
default	17:05:54.817569-0500	RedLemon	   Start[0]: ID=0, Title='Off', Lang='nil', Ext=0
default	17:05:54.817591-0500	RedLemon	🎬 MPV loadfile result: 0
default	17:05:54.818042-0500	RedLemon	✅ MPV loadfile succeeded, isPlaying set to true
default	17:05:54.818389-0500	RedLemon	✅ SubtitleService: Scanned 1 tracks (Attempt 1/5)
default	17:05:54.818444-0500	RedLemon	Task <59CF2CBA-CC74-4A7C-A712-AC45E91E63FC>.<65> sent request, body N 0
default	17:05:54.818955-0500	RedLemon	   Track: ID=0, Title=Off, External=0
default	17:05:54.822101-0500	mDNSResponder	[R4220] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'oVvBqWNuQEwN9KeEY7wdzw=='>, Addr) START PID[25877](RedLemon)
default	17:05:54.825891-0500	mDNSResponder	[R4221] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'oVvBqWNuQEwN9KeEY7wdzw=='>, AAAA) START PID[25877](RedLemon)
default	17:05:54.829066-0500	mDNSResponder	[R4220] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'OQKQHxoD0QODflCO7KUpvQ=='>, Addr) STOP PID[25877](RedLemon)
default	17:05:54.831209-0500	mDNSResponder	[R4221] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'OQKQHxoD0QODflCO7KUpvQ=='>, AAAA) STOP PID[25877](RedLemon)
default	17:05:54.909614-0500	RedLemon	Task <59CF2CBA-CC74-4A7C-A712-AC45E91E63FC>.<65> received response, status 200 content K
default	17:05:54.909909-0500	RedLemon	Task <59CF2CBA-CC74-4A7C-A712-AC45E91E63FC>.<65> done using Connection 2
default	17:05:54.912390-0500	RedLemon	Task <59CF2CBA-CC74-4A7C-A712-AC45E91E63FC>.<65> response ended
default	17:05:54.912554-0500	RedLemon	Task <59CF2CBA-CC74-4A7C-A712-AC45E91E63FC>.<65> summary for task success {transaction_duration_ms=95, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=92, response_duration_ms=2, request_bytes=256, response_bytes=401, cache_hit=false}
default	17:05:54.912791-0500	RedLemon	Task <59CF2CBA-CC74-4A7C-A712-AC45E91E63FC>.<65> finished successfully
default	17:05:54.998155-0500	RedLemon	Task <13B97B15-A302-4370-BF71-7C176855D255>.<66> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	17:05:54.998575-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [32C6FA53-A5DF-4BBF-BBFE-35F47411E044] (reporting strategy default)> on Task <13B97B15-A302-4370-BF71-7C176855D255>.<66> was not selected for reporting
default	17:05:54.999219-0500	RedLemon	Task <13B97B15-A302-4370-BF71-7C176855D255>.<66> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:54.999479-0500	RedLemon	Task <13B97B15-A302-4370-BF71-7C176855D255>.<66> now using Connection 2
default	17:05:55.999938-0500	RedLemon	Task <13B97B15-A302-4370-BF71-7C176855D255>.<66> sent request, body N 0
default	17:05:55.033042-0500	RedLemon	Task <B72D9F33-E57C-428A-8EA4-75A4466F48AC>.<24> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	17:05:55.033493-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CEB27846-D09F-475A-ABA0-62638B1EBCF2] (reporting strategy default)> on Task <B72D9F33-E57C-428A-8EA4-75A4466F48AC>.<24> was not selected for reporting
default	17:05:55.034172-0500	RedLemon	Task <B72D9F33-E57C-428A-8EA4-75A4466F48AC>.<24> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:55.034384-0500	RedLemon	Task <B72D9F33-E57C-428A-8EA4-75A4466F48AC>.<24> now using Connection 4
default	17:05:55.034626-0500	RedLemon	Task <B72D9F33-E57C-428A-8EA4-75A4466F48AC>.<24> sent request, body N 0
default	17:05:55.047208-0500	RedLemon	Task <B72D9F33-E57C-428A-8EA4-75A4466F48AC>.<24> received response, status 200 content K
default	17:05:55.089550-0500	RedLemon	Task <13B97B15-A302-4370-BF71-7C176855D255>.<66> received response, status 200 content U
default	17:05:55.098263-0500	RedLemon	Task <B72D9F33-E57C-428A-8EA4-75A4466F48AC>.<24> done using Connection 4
default	17:05:55.098596-0500	RedLemon	Task <B72D9F33-E57C-428A-8EA4-75A4466F48AC>.<24> response ended
default	17:05:55.099493-0500	RedLemon	Task <13B97B15-A302-4370-BF71-7C176855D255>.<66> done using Connection 2
default	17:05:55.100447-0500	RedLemon	Task <B72D9F33-E57C-428A-8EA4-75A4466F48AC>.<24> summary for task success {transaction_duration_ms=66, response_status=200, connection=4, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=13, response_duration_ms=51, request_bytes=41, response_bytes=1014452, cache_hit=false}
default	17:05:55.099626-0500	RedLemon	Task <13B97B15-A302-4370-BF71-7C176855D255>.<66> response ended
default	17:05:55.100728-0500	RedLemon	Task <B72D9F33-E57C-428A-8EA4-75A4466F48AC>.<24> finished successfully
default	17:05:55.101260-0500	RedLemon	Task <13B97B15-A302-4370-BF71-7C176855D255>.<66> summary for task success {transaction_duration_ms=102, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=90, response_duration_ms=11, request_bytes=238, response_bytes=522, cache_hit=false}
default	17:05:55.102099-0500	RedLemon	Task <13B97B15-A302-4370-BF71-7C176855D255>.<66> finished successfully
default	17:05:55.179554-0500	RedLemon	<private>
default	17:05:55.179692-0500	RedLemon	<private>
default	17:05:55.179805-0500	RedLemon	<private>
default	17:05:55.179914-0500	RedLemon	<private>
default	17:05:55.182717-0500	runningboardd	Invalidating assertion 173-25877-1905 (target:[anon<RedLemon>(501):25877]) from originator [anon<RedLemon>(501):25877]
default	17:05:55.219870-0500	RedLemon	Task <9917BC48-D4DB-4A55-9955-8A1A175581D5>.<67> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	17:05:55.220421-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [63F4C021-85EE-4BD4-B1D0-1537A94DC810] (reporting strategy default)> on Task <9917BC48-D4DB-4A55-9955-8A1A175581D5>.<67> was not selected for reporting
default	17:05:55.221132-0500	RedLemon	Task <9917BC48-D4DB-4A55-9955-8A1A175581D5>.<67> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:55.221517-0500	RedLemon	Task <9917BC48-D4DB-4A55-9955-8A1A175581D5>.<67> now using Connection 2
default	17:05:55.221951-0500	RedLemon	Task <9917BC48-D4DB-4A55-9955-8A1A175581D5>.<67> sent request, body N 0
default	17:05:55.246536-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring jetsam update because this process is not memory-managed
default	17:05:55.247253-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring suspend because this process is not lifecycle managed
default	17:05:55.248091-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring GPU update because this process is not GPU managed
default	17:05:55.263895-0500	RedLemon	🔍 MPV track-list/count: 0
default	17:05:55.264043-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	17:05:55.264439-0500	RedLemon	   Start[0]: ID=0, Title='Off', Lang='nil', Ext=0
default	17:05:55.281994-0500	runningboardd	Invalidating assertion 173-114-1906 (target:[anon<RedLemon>(501):25877]) from originator [daemon<com.apple.powerd>:114]
default	17:05:55.298702-0500	runningboardd	Invalidating assertion 173-171-1912 (target:[anon<RedLemon>(501):25877]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	17:05:55.299529-0500	RedLemon	Task <9917BC48-D4DB-4A55-9955-8A1A175581D5>.<67> received response, status 200 content U
default	17:05:55.299776-0500	RedLemon	Task <9917BC48-D4DB-4A55-9955-8A1A175581D5>.<67> done using Connection 2
default	17:05:55.300376-0500	RedLemon	Task <9917BC48-D4DB-4A55-9955-8A1A175581D5>.<67> response ended
default	17:05:55.300484-0500	RedLemon	Task <9917BC48-D4DB-4A55-9955-8A1A175581D5>.<67> summary for task success {transaction_duration_ms=79, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=78, response_duration_ms=1, request_bytes=244, response_bytes=585, cache_hit=false}
default	17:05:55.300714-0500	RedLemon	Task <9917BC48-D4DB-4A55-9955-8A1A175581D5>.<67> finished successfully
default	17:05:55.305262-0500	RedLemon	👥 MPVPlayer: Updated participants list via polling: 1
default	17:05:55.313514-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):25877] from originator [daemon<com.apple.WindowServer(88)>:171] with description <RBSAssertionDescriptor| "AppVisible" ID:173-171-1915 target:25877 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	17:05:55.313677-0500	runningboardd	Assertion 173-171-1915 (target:[anon<RedLemon>(501):25877]) will be created as active
default	17:05:55.398437-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring jetsam update because this process is not memory-managed
default	17:05:55.398731-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring suspend because this process is not lifecycle managed
default	17:05:55.399056-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring GPU update because this process is not GPU managed
default	17:05:55.603328-0500	mDNSResponder	[R4222] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'oVvBqWNuQEwN9KeEY7wdzw=='>, Addr) START PID[25877](RedLemon)
default	17:05:55.604976-0500	mDNSResponder	[R4223] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'oVvBqWNuQEwN9KeEY7wdzw=='>, AAAA) START PID[25877](RedLemon)
default	17:05:55.606820-0500	mDNSResponder	[R4222] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'OQKQHxoD0QODflCO7KUpvQ=='>, Addr) STOP PID[25877](RedLemon)
default	17:05:55.607059-0500	mDNSResponder	[R4223] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'OQKQHxoD0QODflCO7KUpvQ=='>, AAAA) STOP PID[25877](RedLemon)
default	17:05:55.772491-0500	RedLemon	⏳ MPV: File not fully loaded yet. Queueing PENDING SEEK to 7093.3s
default	17:05:55.825289-0500	RedLemon	🔍 MPV track-list/count: 0
default	17:05:55.825592-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	17:05:55.825848-0500	RedLemon	   Start[0]: ID=0, Title='Off', Lang='nil', Ext=0
default	17:05:55.826216-0500	RedLemon	✅ SubtitleService: Scanned 1 tracks (Attempt 2/5)
default	17:05:55.826770-0500	RedLemon	   Track: ID=0, Title=Off, External=0
default	17:05:55.982136-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):25877] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1916 target:25877 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	17:05:55.982465-0500	runningboardd	Assertion 173-114-1916 (target:[anon<RedLemon>(501):25877]) will be created as active
default	17:05:55.983916-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring jetsam update because this process is not memory-managed
default	17:05:55.984019-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring suspend because this process is not lifecycle managed
default	17:05:55.984828-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring GPU update because this process is not GPU managed
default	17:05:56.559015-0500	mDNSResponder	[R4224] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'oVvBqWNuQEwN9KeEY7wdzw=='>, Addr) START PID[25877](RedLemon)
default	17:05:56.559514-0500	mDNSResponder	[R4225] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'oVvBqWNuQEwN9KeEY7wdzw=='>, AAAA) START PID[25877](RedLemon)
default	17:05:56.560972-0500	mDNSResponder	[R4224] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'OQKQHxoD0QODflCO7KUpvQ=='>, Addr) STOP PID[25877](RedLemon)
default	17:05:56.561085-0500	mDNSResponder	[R4225] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'OQKQHxoD0QODflCO7KUpvQ=='>, AAAA) STOP PID[25877](RedLemon)
default	17:05:56.905355-0500	RedLemon	🔍 MPV track-list/count: 0
default	17:05:56.905549-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	17:05:56.905680-0500	RedLemon	   Start[0]: ID=0, Title='Off', Lang='nil', Ext=0
default	17:05:56.905878-0500	RedLemon	✅ SubtitleService: Scanned 1 tracks (Attempt 3/5)
default	17:05:56.906074-0500	RedLemon	   Track: ID=0, Title=Off, External=0
default	17:05:57.454966-0500	runningboardd	Assertion did invalidate due to timeout: 173-140-1901 (target:[anon<RedLemon>(501):25877])
default	17:05:57.563386-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring jetsam update because this process is not memory-managed
default	17:05:57.563460-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring suspend because this process is not lifecycle managed
default	17:05:57.563575-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring GPU update because this process is not GPU managed
default	17:05:57.820219-0500	RedLemon	 HALPlugInManagement::RegisterPlugIns: skipping in-process plug-ins
error	17:05:57.820302-0500	RedLemon	AddInstanceForFactory: No factory registered for id <CFUUID 0x7fa109bfe120> F8BB1C28-BAE8-11D6-9C31-00039315CD46
default	17:05:57.872380-0500	RedLemon	                AUHAL.cpp:386   AUHAL: (0x7fa10934a840) Listening to HAL system property 1682929012
default	17:05:57.872574-0500	RedLemon	                AUHAL.cpp:397   AUHAL: (0x7fa10934a840) Selecting device 49 from constructor
default	17:05:57.872669-0500	RedLemon	                AUHAL.cpp:570   SelectDevice: -> (0x7fa10934a840)
default	17:05:57.872720-0500	RedLemon	                AUHAL.cpp:627   SelectDevice: (0x7fa10934a840) not already running
default	17:05:57.872757-0500	RedLemon	                AUHAL.cpp:702   SelectDevice: (0x7fa10934a840) nothing to teardown
default	17:05:57.872792-0500	RedLemon	                AUHAL.cpp:706   SelectDevice: (0x7fa10934a840) connecting device 49
default	17:05:57.873097-0500	RedLemon	                AUHAL.cpp:3107  IsDeviceUsable: (0x7fa10934a840) Device ID: 49 (Input:No | Output:Yes): true
default	17:05:57.873414-0500	RedLemon	                AUHAL.cpp:716   SelectDevice: (0x7fa10934a840) created ioproc 0xa for device 49
default	17:05:57.873457-0500	RedLemon	                AUHAL.cpp:1452  UpdateStreamFormats: -> (0x7fa10934a840)
default	17:05:57.873682-0500	RedLemon	                AUHAL.cpp:1516  UpdateStreamFormats:
  output stream 0 [0x32]:  2 ch,  44100 Hz, Float32, interleaved
default	17:05:57.873737-0500	RedLemon	                AUHAL.cpp:1527  UpdateStreamFormats: 1 output streams; not all mono
default	17:05:57.873781-0500	RedLemon	                AUHAL.cpp:1537  UpdateStreamFormats:
  Output render format:  2 ch,  44100 Hz, Float32, interleaved
default	17:05:57.873836-0500	RedLemon	                AUHAL.cpp:1527  UpdateStreamFormats: 0 input streams; not all mono
default	17:05:57.874139-0500	RedLemon	                AUHAL.cpp:1602  UpdateStreamFormats: AUHAL(0x7fa10934a840) Calling PropertyChanged() for kAudioUnitProperty_StreamFormat, Scope:Output, Bus:Output
default	17:05:57.874192-0500	RedLemon	                AUHAL.cpp:1615  UpdateStreamFormats: <-
default	17:05:57.875328-0500	RedLemon	                AUHAL.cpp:820   SelectDevice: (0x7fa10934a840) removing 0 device listeners from device 0
default	17:05:57.875353-0500	RedLemon	                AUHAL.cpp:829   SelectDevice: (0x7fa10934a840) adding 6 device listeners to device 49
default	17:05:57.876028-0500	RedLemon	                AUHAL.cpp:820   SelectDevice: (0x7fa10934a840) removing 0 device delegate listeners from device 0
default	17:05:57.876075-0500	RedLemon	                AUHAL.cpp:829   SelectDevice: (0x7fa10934a840) adding 0 device delegate listeners to device 49
default	17:05:57.876137-0500	RedLemon	                AUHAL.cpp:842   SelectDevice: <- (0x7fa10934a840)
default	17:05:57.876750-0500	RedLemon	                AUHAL.cpp:1711  SetStreamUsage: Output stream enables: Stream 0 is ENABLED
default	17:05:57.879076-0500	RedLemon	Registered notify signal com.apple.caulk.alloc.audiodump (0)
default	17:05:57.880108-0500	RedLemon	                AUHAL.cpp:1711  SetStreamUsage: Output stream enables: Stream 0 is ENABLED
default	17:05:57.880327-0500	RedLemon	                AUHAL.cpp:2060  SetProperty: (0x7fa10934a840) caller requesting device change from 49 to 49
default	17:05:57.880387-0500	RedLemon	                AUHAL.cpp:570   SelectDevice: -> (0x7fa10934a840)
default	17:05:57.880443-0500	RedLemon	                AUHAL.cpp:613   SelectDevice: <- (0x7fa10934a840) exiting with nothing to do
default	17:05:58.092072-0500	RedLemon	🔍 MPV track-list/count: 7
default	17:05:58.113603-0500	RedLemon	🔍 Track 0 type: video
default	17:05:58.113866-0500	RedLemon	🔍 Track 1 type: audio
default	17:05:58.144370-0500	CAReportingService	    CAReportingService.mm:465   sessions for client 197 : (
    "reporterID=846108557317,serviceName=audiodeviceusage,ownerPid=197,clientProcessName=(null),HostApplicationDisplayID=com.redlemon.app,started=1,singleMessageSession=0",
    "reporterID=846108557313,serviceName=audiodeviceusage,ownerPid=197,clientProcessName=(null),HostApplicationDisplayID=com.google.antigravity.helper,started=0,singleMessageSession=0"
)
default	17:05:58.144613-0500	CAReportingService	    CAReportingService.mm:577   1 active reporting session(s) (
    "reporterID=846108557317,serviceName=audiodeviceusage,ownerPid=197,clientProcessName=(null),HostApplicationDisplayID=com.redlemon.app,started=1,singleMessageSession=0"
)
default	17:05:58.234873-0500	RedLemon	🔍 Track 2 type: audio
default	17:05:58.235163-0500	RedLemon	🔍 Track 3 type: audio
default	17:05:58.235320-0500	RedLemon	🔍 Track 4 type: sub
default	17:05:58.235522-0500	RedLemon	✅ Found subtitle track: ID=1, lang=en, title=nil, external=0
default	17:05:58.235836-0500	RedLemon	🔍 Track 5 type: sub
default	17:05:58.236056-0500	RedLemon	✅ Found subtitle track: ID=2, lang=en, title=SDH, external=0
default	17:05:58.236247-0500	RedLemon	🔍 Track 6 type: sub
default	17:05:58.236547-0500	RedLemon	✅ Found subtitle track: ID=3, lang=tr, title=nil, external=0
default	17:05:58.236701-0500	RedLemon	📊 Total subtitle tracks found: 4 (including Off if needed)
default	17:05:58.236955-0500	RedLemon	   Start[0]: ID=0, Title='Off', Lang='nil', Ext=0
default	17:05:58.237271-0500	RedLemon	   Start[1]: ID=1, Title='nil', Lang='en', Ext=0
default	17:05:58.237596-0500	RedLemon	   Start[2]: ID=2, Title='SDH', Lang='en', Ext=0
default	17:05:58.237870-0500	RedLemon	   Start[3]: ID=3, Title='nil', Lang='tr', Ext=0
default	17:05:58.241082-0500	mDNSResponder	[R4226] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'oVvBqWNuQEwN9KeEY7wdzw=='>, Addr) START PID[25877](RedLemon)
default	17:05:58.242760-0500	mDNSResponder	[R4227] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'oVvBqWNuQEwN9KeEY7wdzw=='>, AAAA) START PID[25877](RedLemon)
default	17:05:58.243797-0500	RedLemon	🔄 MPV: Executing PENDING SEEK to 7093.3s after FILE_LOADED
default	17:05:58.243818-0500	RedLemon	✅ SubtitleService: Scanned 4 tracks (Attempt 4/5)
default	17:05:58.244076-0500	RedLemon	   Track: ID=0, Title=Off, External=0
default	17:05:58.244218-0500	RedLemon	   Track: ID=1, Title=English, External=0
default	17:05:58.244386-0500	RedLemon	   Track: ID=2, Title=SDH, External=0
default	17:05:58.244505-0500	RedLemon	   Track: ID=3, Title=Track 3, External=0
default	17:05:58.248339-0500	RedLemon	⏱️ Watch Party: Duration available (8351.3s), triggering ready signal
default	17:05:58.248538-0500	RedLemon	👋 Watch Party: Sending INITIAL READY signal and starting loop
default	17:05:58.249907-0500	mDNSResponder	[R4226] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'OQKQHxoD0QODflCO7KUpvQ=='>, Addr) STOP PID[25877](RedLemon)
default	17:05:58.250435-0500	mDNSResponder	[R4227] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'OQKQHxoD0QODflCO7KUpvQ=='>, AAAA) STOP PID[25877](RedLemon)
default	17:05:58.252592-0500	RedLemon	🔍 MPV track-list/count: 7
default	17:05:58.252793-0500	RedLemon	🔍 Track 0 type: video
default	17:05:58.253002-0500	RedLemon	🔍 Track 1 type: audio
default	17:05:58.253182-0500	RedLemon	🔍 Track 2 type: audio
default	17:05:58.253374-0500	RedLemon	🔍 Track 3 type: audio
default	17:05:58.253524-0500	RedLemon	🔍 Track 4 type: sub
default	17:05:58.253684-0500	RedLemon	✅ Found subtitle track: ID=1, lang=en, title=nil, external=0
default	17:05:58.253822-0500	RedLemon	🔍 Track 5 type: sub
default	17:05:58.254030-0500	RedLemon	✅ Found subtitle track: ID=2, lang=en, title=SDH, external=0
default	17:05:58.254259-0500	RedLemon	🔍 Track 6 type: sub
default	17:05:58.254498-0500	RedLemon	✅ Found subtitle track: ID=3, lang=tr, title=nil, external=0
default	17:05:58.254673-0500	RedLemon	📊 Total subtitle tracks found: 4 (including Off if needed)
default	17:05:58.254869-0500	RedLemon	   Start[0]: ID=0, Title='Off', Lang='nil', Ext=0
default	17:05:58.254990-0500	RedLemon	   Start[1]: ID=1, Title='nil', Lang='en', Ext=0
default	17:05:58.255274-0500	RedLemon	   Start[2]: ID=2, Title='SDH', Lang='en', Ext=0
default	17:05:58.255539-0500	RedLemon	   Start[3]: ID=3, Title='nil', Lang='tr', Ext=0
default	17:05:58.349605-0500	RedLemon	📤 Realtime: Sending message type: ready, sender: 656DAA91-33B4-4688-9135-C982EA52D7C9
default	17:05:58.351012-0500	RedLemon	   Payload keys: senderId, timestamp, position, isPlaying, type
default	17:05:58.353156-0500	RedLemon	✅ Realtime: Message broadcast complete
default	17:05:58.385138-0500	RedLemon	Task <BF4C79BD-24F5-4E35-9A03-08E002689CD0>.<25> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	17:05:58.385433-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [421CF97C-4FE0-4CDE-A9AC-673F1FE53C2F] (reporting strategy default)> on Task <BF4C79BD-24F5-4E35-9A03-08E002689CD0>.<25> was not selected for reporting
default	17:05:58.386168-0500	RedLemon	Task <BF4C79BD-24F5-4E35-9A03-08E002689CD0>.<25> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:05:58.386385-0500	RedLemon	Task <BF4C79BD-24F5-4E35-9A03-08E002689CD0>.<25> now using Connection 4
default	17:05:58.386856-0500	RedLemon	Task <BF4C79BD-24F5-4E35-9A03-08E002689CD0>.<25> sent request, body N 0
default	17:05:58.394361-0500	RedLemon	📨 Realtime: Received broadcast message
default	17:05:58.394649-0500	RedLemon	   Payload keys: position, isPlaying, type, timestamp, senderId
default	17:05:58.395348-0500	RedLemon	✅ Realtime: Decoded message type: ready, sender: 656DAA91-33B4-4688-9135-C982EA52D7C9
default	17:05:58.395613-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: ready
default	17:05:58.395838-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	17:05:58.402003-0500	RedLemon	✅ Watch Party: READY signal sent successfully
default	17:05:58.402266-0500	RedLemon	🔍 DEBUG: Received sync message - type: ready, sender: 656DAA91-33B4-4688-9135-C982EA52D7C9
default	17:05:58.402425-0500	RedLemon	✅ Received READY signal from 656DAA91-33B4-4688-9135-C982EA52D7C9
default	17:05:58.405340-0500	RedLemon	Task <BF4C79BD-24F5-4E35-9A03-08E002689CD0>.<25> received response, status 200 content K
default	17:05:58.406718-0500	RedLemon	Task <BF4C79BD-24F5-4E35-9A03-08E002689CD0>.<25> done using Connection 4
default	17:05:58.406917-0500	RedLemon	Task <BF4C79BD-24F5-4E35-9A03-08E002689CD0>.<25> response ended
default	17:05:58.407893-0500	RedLemon	Task <BF4C79BD-24F5-4E35-9A03-08E002689CD0>.<25> summary for task success {transaction_duration_ms=22, response_status=200, connection=4, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=19, response_duration_ms=1, request_bytes=37, response_bytes=46603, cache_hit=false}
default	17:05:58.408030-0500	RedLemon	Task <BF4C79BD-24F5-4E35-9A03-08E002689CD0>.<25> finished successfully
default	17:05:58.682290-0500	mDNSResponder	[R4228] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'oVvBqWNuQEwN9KeEY7wdzw=='>, Addr) START PID[25877](RedLemon)
default	17:05:58.683336-0500	mDNSResponder	[R4229] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'oVvBqWNuQEwN9KeEY7wdzw=='>, AAAA) START PID[25877](RedLemon)
default	17:05:58.685849-0500	mDNSResponder	[R4228] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'OQKQHxoD0QODflCO7KUpvQ=='>, Addr) STOP PID[25877](RedLemon)
default	17:05:58.686031-0500	mDNSResponder	[R4229] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'OQKQHxoD0QODflCO7KUpvQ=='>, AAAA) STOP PID[25877](RedLemon)
default	17:05:59.324213-0500	RedLemon	🔍 MPV track-list/count: 7
default	17:05:59.324562-0500	RedLemon	🔍 Track 0 type: video
default	17:05:59.325331-0500	RedLemon	🔍 Track 1 type: audio
default	17:05:59.325663-0500	RedLemon	🔍 Track 2 type: audio
default	17:05:59.325917-0500	RedLemon	🔍 Track 3 type: audio
default	17:05:59.326160-0500	RedLemon	🔍 Track 4 type: sub
default	17:05:59.326471-0500	RedLemon	✅ Found subtitle track: ID=1, lang=en, title=nil, external=0
default	17:05:59.326735-0500	RedLemon	🔍 Track 5 type: sub
default	17:05:59.327019-0500	RedLemon	✅ Found subtitle track: ID=2, lang=en, title=SDH, external=0
default	17:05:59.327292-0500	RedLemon	🔍 Track 6 type: sub
default	17:05:59.327687-0500	RedLemon	✅ Found subtitle track: ID=3, lang=tr, title=nil, external=0
default	17:05:59.327941-0500	RedLemon	📊 Total subtitle tracks found: 4 (including Off if needed)
default	17:05:59.328186-0500	RedLemon	   Start[0]: ID=0, Title='Off', Lang='nil', Ext=0
default	17:05:59.328422-0500	RedLemon	   Start[1]: ID=1, Title='nil', Lang='en', Ext=0
default	17:05:59.328634-0500	RedLemon	   Start[2]: ID=2, Title='SDH', Lang='en', Ext=0
default	17:05:59.328851-0500	RedLemon	   Start[3]: ID=3, Title='nil', Lang='tr', Ext=0
default	17:05:59.329206-0500	RedLemon	✅ SubtitleService: Scanned 4 tracks (Attempt 5/5)
default	17:05:59.329482-0500	RedLemon	   Track: ID=0, Title=Off, External=0
default	17:05:59.331573-0500	RedLemon	   Track: ID=1, Title=English, External=0
default	17:05:59.332283-0500	RedLemon	   Track: ID=2, Title=SDH, External=0
default	17:05:59.332514-0500	RedLemon	   Track: ID=3, Title=Track 3, External=0
default	17:05:59.947978-0500	RedLemon	CoreAnimation: warning, deleted thread with uncommitted CATransaction; set CA_DEBUG_TRANSACTIONS=1 in environment to log backtraces, or set CA_ASSERT_MAIN_THREAD_TRANSACTIONS=1 to abort when an implicit transaction isn't created on a main thread.
default	17:06:04.974385-0500	RedLemon	Task <F5DE3C6C-51AF-4C95-8DC7-E1300353A686>.<68> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	17:06:04.976099-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C3734F06-055D-4DF6-988A-E1784E7CAC72] (reporting strategy default)> on Task <F5DE3C6C-51AF-4C95-8DC7-E1300353A686>.<68> was not selected for reporting
default	17:06:04.978642-0500	RedLemon	Task <F5DE3C6C-51AF-4C95-8DC7-E1300353A686>.<68> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:06:04.979058-0500	RedLemon	Task <F5DE3C6C-51AF-4C95-8DC7-E1300353A686>.<68> now using Connection 2
default	17:06:04.979640-0500	RedLemon	Task <F5DE3C6C-51AF-4C95-8DC7-E1300353A686>.<68> sent request, body N 0
default	17:06:05.064424-0500	RedLemon	Task <F5DE3C6C-51AF-4C95-8DC7-E1300353A686>.<68> received response, status 200 content K
default	17:06:05.066241-0500	RedLemon	Task <F5DE3C6C-51AF-4C95-8DC7-E1300353A686>.<68> done using Connection 2
default	17:06:05.066472-0500	RedLemon	Task <F5DE3C6C-51AF-4C95-8DC7-E1300353A686>.<68> response ended
default	17:06:05.066625-0500	RedLemon	Task <F5DE3C6C-51AF-4C95-8DC7-E1300353A686>.<68> summary for task success {transaction_duration_ms=88, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=86, response_duration_ms=2, request_bytes=256, response_bytes=555, cache_hit=false}
default	17:06:05.066905-0500	RedLemon	Task <F5DE3C6C-51AF-4C95-8DC7-E1300353A686>.<68> finished successfully
default	17:06:05.095088-0500	RedLemon	Task <8210FAF2-D457-4F98-8C38-C0D7026259CC>.<69> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	17:06:05.095964-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C8E3D180-9F60-4FE0-82D8-834962DB2AD7] (reporting strategy default)> on Task <8210FAF2-D457-4F98-8C38-C0D7026259CC>.<69> was not selected for reporting
default	17:06:05.097238-0500	RedLemon	Task <8210FAF2-D457-4F98-8C38-C0D7026259CC>.<69> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:06:05.097707-0500	RedLemon	Task <8210FAF2-D457-4F98-8C38-C0D7026259CC>.<69> now using Connection 2
default	17:06:05.098782-0500	RedLemon	Task <8210FAF2-D457-4F98-8C38-C0D7026259CC>.<69> sent request, body N 0
default	17:06:05.166407-0500	RedLemon	Task <8210FAF2-D457-4F98-8C38-C0D7026259CC>.<69> received response, status 200 content U
default	17:06:05.166719-0500	RedLemon	Task <8210FAF2-D457-4F98-8C38-C0D7026259CC>.<69> done using Connection 2
default	17:06:05.168025-0500	RedLemon	Task <8210FAF2-D457-4F98-8C38-C0D7026259CC>.<69> response ended
default	17:06:05.168226-0500	RedLemon	Task <8210FAF2-D457-4F98-8C38-C0D7026259CC>.<69> summary for task success {transaction_duration_ms=71, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=69, response_duration_ms=1, request_bytes=238, response_bytes=480, cache_hit=false}
default	17:06:05.168461-0500	RedLemon	Task <8210FAF2-D457-4F98-8C38-C0D7026259CC>.<69> finished successfully
default	17:06:05.667593-0500	RedLemon	Task <27B8981B-5256-4D8D-9130-B4CF286D4DAA>.<26> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	17:06:05.667973-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [EB568A00-29BB-4E79-BA6E-185ED7F8CE7E] (reporting strategy default)> on Task <27B8981B-5256-4D8D-9130-B4CF286D4DAA>.<26> was not selected for reporting
default	17:06:05.668678-0500	RedLemon	Task <27B8981B-5256-4D8D-9130-B4CF286D4DAA>.<26> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	17:06:05.668874-0500	RedLemon	Task <27B8981B-5256-4D8D-9130-B4CF286D4DAA>.<26> now using Connection 4
default	17:06:05.669188-0500	RedLemon	Task <27B8981B-5256-4D8D-9130-B4CF286D4DAA>.<26> sent request, body N 0
default	17:06:05.684324-0500	RedLemon	Task <27B8981B-5256-4D8D-9130-B4CF286D4DAA>.<26> received response, status 200 content K
default	17:06:05.687813-0500	RedLemon	Task <27B8981B-5256-4D8D-9130-B4CF286D4DAA>.<26> done using Connection 4
default	17:06:05.688899-0500	RedLemon	Task <27B8981B-5256-4D8D-9130-B4CF286D4DAA>.<26> response ended
default	17:06:05.689723-0500	RedLemon	Task <27B8981B-5256-4D8D-9130-B4CF286D4DAA>.<26> summary for task success {transaction_duration_ms=21, response_status=200, connection=4, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=15, response_duration_ms=4, request_bytes=37, response_bytes=46291, cache_hit=false}
default	17:06:05.689861-0500	RedLemon	Task <27B8981B-5256-4D8D-9130-B4CF286D4DAA>.<26> finished successfully
default	17:06:07.208857-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):25877] from originator [daemon<com.apple.Dock.agent(501)>:395] with description <RBSAssertionDescriptor| "com.apple.dock:CopyMenu}" ID:173-395-1918 target:25877 attributes:[
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>,
	<RBSDomainAttribute| domain:"com.apple.dock" name:"CopyMenu" sourceEnvironment:"(null)">
	]>
default	17:06:07.209062-0500	runningboardd	Assertion 173-395-1918 (target:[anon<RedLemon>(501):25877]) will be created as active
default	17:06:07.210097-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring jetsam update because this process is not memory-managed
default	17:06:07.210143-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring suspend because this process is not lifecycle managed
default	17:06:07.210190-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring GPU update because this process is not GPU managed
default	17:06:07.223212-0500	runningboardd	Invalidating assertion 173-395-1918 (target:[anon<RedLemon>(501):25877]) from originator [daemon<com.apple.Dock.agent(501)>:395]
default	17:06:07.334182-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring jetsam update because this process is not memory-managed
default	17:06:07.334347-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring suspend because this process is not lifecycle managed
default	17:06:07.334517-0500	runningboardd	[anon<RedLemon>(501):25877] Ignoring GPU update because this process is not GPU managed
default	17:06:08.996777-0500	runningboardd	Invalidating assertion 173-171-1915 (target:[anon<RedLemon>(501):25877]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	17:06:09.001699-0500	RedLemon	Entering exit handler.
default	17:06:09.001746-0500	RedLemon	Exiting exit handler.
default	17:06:09.053689-0500	runningboardd	XPC connection invalidated: [anon<RedLemon>(501):25877]
default	17:06:09.043508-0500	CAReportingService	    CAReportingService.mm:465   sessions for client 197 : (
    "reporterID=846108557317,serviceName=audiodeviceusage,ownerPid=197,clientProcessName=(null),HostApplicationDisplayID=com.redlemon.app,started=0,singleMessageSession=0",
    "reporterID=846108557313,serviceName=audiodeviceusage,ownerPid=197,clientProcessName=(null),HostApplicationDisplayID=com.google.antigravity.helper,started=0,singleMessageSession=0"
)
default	17:06:09.084686-0500	mDNSResponder	[R4216] DNSServiceCreateConnection STOP PID[25877](RedLemon)
default	17:06:09.092741-0500	runningboardd	[anon<RedLemon>(501):25877] termination reported by proc_exit
default	17:06:09.095710-0500	runningboardd	Invalidating assertion 173-140-1900 (target:[anon<RedLemon>(501):25877]) from originator [daemon<com.apple.coreservices.launchservicesd>:140]
default	17:06:09.199920-0500	runningboardd	Removing process: [anon<RedLemon>(501):25877]
default	17:06:09.200546-0500	runningboardd	removeJobWithInstance called for identity without existing job [anon<RedLemon>(501):25877]
default	17:06:09.200711-0500	runningboardd	Removing assertions for terminated process: [anon<RedLemon>(501):25877]
error	17:06:09.262224-0500	runningboardd	RBSStateCapture remove item called for untracked item 173-140-1900 (target:[anon<RedLemon>(501):25877])
default	17:06:09.185333-0500	loginwindow	-[PersistentAppsSupport applicationQuit:] | for app:RedLemon, _appTrackingState = 2
default	17:06:09.186469-0500	loginwindow	-[PersistentAppsSupport applicationQuit:] | App: RedLemon, quit, updating active tracking timer
