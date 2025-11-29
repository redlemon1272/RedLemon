default	09:52:24.856878-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "frontmost:4529" ID:173-140-1512 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	09:52:24.857358-0500	runningboardd	Assertion 173-140-1512 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:24.870757-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:24.872652-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:24.873477-0500	runningboardd	[anon<RedLemon>(501):4529] Set darwin role to: UserInteractiveFocal
default	09:52:24.874269-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:24.875283-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "notification:4529" ID:173-140-1513 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	09:52:24.875454-0500	runningboardd	Assertion 173-140-1513 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:24.878005-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:24.878254-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:24.878396-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:27.140516-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:27.143793-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [53AF4A88-F859-4E0D-8164-0AD8966DDEAE] (reporting strategy default)> on Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> was not selected for reporting
default	09:52:27.144546-0500	RedLemon	Task <4D3036FE-9E41-4B9A-94AA-3EF49E8E9A51>.<259> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:27.144610-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:27.144490-0500	RedLemon	Task <D577776B-9319-41F1-9B14-1879F880AE53>.<1> summary for task success {transaction_duration_ms=16904, response_status=101, connection=39, protocol="http/1.1", domain_lookup_duration_ms=27, connect_duration_ms=56, secure_connection_duration_ms=37, private_relay=false, request_start_ms=86, request_duration_ms=0, response_start_ms=218, response_duration_ms=0, request_bytes=828, response_bytes=850, cache_hit=false}
default	09:52:27.145318-0500	RedLemon	Task <D577776B-9319-41F1-9B14-1879F880AE53>.<1> finished successfully
default	09:52:27.145008-0500	RedLemon	Connection 39: cleaning up
default	09:52:27.145925-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B794787F-6566-4485-8D22-00F9B429678C] (reporting strategy default)> on Task <4D3036FE-9E41-4B9A-94AA-3EF49E8E9A51>.<259> was not selected for reporting
default	09:52:27.146049-0500	RedLemon	[C39 FDD53DA7-467B-40D7-91E3-4F4BD43AC910 Hostname#ad896fdc:443 tcp, url hash: b4e6f735, tls, definite, attribution: developer] cancel
default	09:52:27.147016-0500	RedLemon	[C39 FDD53DA7-467B-40D7-91E3-4F4BD43AC910 Hostname#ad896fdc:443 tcp, url hash: b4e6f735, tls, definite, attribution: developer] cancelled
	[C39.1 FC1AD9CB-0ED0-47B2-9422-15A35FD8991B 10.0.0.249:51442<->IPv4#de37c2c5:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 16.904s, DNS @0.000s took 0.027s, TCP @0.217s took 0.018s, TLS 1.3 took 0.000s
	bytes in/out: 5102/1734, packets in/out: 8/12, rtt: 0.027s, retransmitted bytes: 0, out-of-order bytes: 0
default	09:52:27.149288-0500	RedLemon	nw_flow_disconnected [C39.1 IPv4#de37c2c5:443 cancelled channel-flow ((null))] Output protocol disconnected
default	09:52:27.152684-0500	RedLemon	nw_protocol_tcp_log_summary [C39.1:3]
	[15565268-D615-42DA-A843-D0F7A1AD7354 <private>:51442<-><private>:443]
	Init: 1, Conn_Time: 17.636ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 27.750ms, rtt_var: 15.062ms rtt_nc: 22.812ms, rtt_var_nc: 13.250ms base rtt: 13ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	09:52:27.154892-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C39] reporting state cancelled
default	09:52:27.155216-0500	RedLemon	Task <4D3036FE-9E41-4B9A-94AA-3EF49E8E9A51>.<259> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:27.157960-0500	RedLemon	Task <4D3036FE-9E41-4B9A-94AA-3EF49E8E9A51>.<259> now using Connection 2
default	09:52:27.158551-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:27.159006-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A7D67B8D-C469-401B-92F6-BA23D9CE7597] (reporting strategy default)> on Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> was not selected for reporting
default	09:52:27.159645-0500	RedLemon	Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:27.160402-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [27BE6470-5D35-40B2-B754-21158B361F0E] (reporting strategy default)> on Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> was not selected for reporting
default	09:52:27.161375-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:27.161573-0500	RedLemon	Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:27.162609-0500	RedLemon	tcp_output [C39.1:3] flags=[F.] seq=1013034575, ack=3421598870, win=2048 state=FIN_WAIT_1 rcv_nxt=3421598870, snd_una=1013034521
error	09:52:27.162938-0500	RedLemon	Read completed with an error <private>
default	09:52:27.163044-0500	RedLemon	Connection 39: done
default	09:52:27.163657-0500	RedLemon	Connection 42: enabling TLS
default	09:52:27.163747-0500	RedLemon	Connection 42: starting, TC(0x0)
default	09:52:27.163903-0500	RedLemon	[C42 FB9ECF5A-3C0C-4AF9-A9DC-45CD71559941 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{30C8563A-9968-4205-B728-95376061D77C}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:27.164005-0500	RedLemon	[C42 Hostname#11e4b683:443 initial path ((null))] event: path:start @0.000s
default	09:52:27.165008-0500	RedLemon	[C42 Hostname#11e4b683:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: B6651155-9152-46A2-8C52-1905F3F3371E
default	09:52:27.165597-0500	RedLemon	[C42 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	09:52:27.165646-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state preparing
default	09:52:27.165992-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> setting up Connection 42
default	09:52:27.166244-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	09:52:27.167025-0500	RedLemon	Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> waiting for setup of Connection 43
default	09:52:27.167117-0500	RedLemon	Connection 43: enabling TLS
default	09:52:27.167156-0500	RedLemon	Connection 43: starting, TC(0x0)
default	09:52:27.167216-0500	RedLemon	[C43 ADF372D1-5067-4F2F-8976-0408D3B9E49D Hostname#b11eb60d:443 quic-connection, url hash: d262e80f, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{77FB6E13-E53B-463D-8DF7-A6D883A4CEA5}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:27.167298-0500	RedLemon	[C43 Hostname#b11eb60d:443 initial path ((null))] event: path:start @0.000s
default	09:52:27.167869-0500	RedLemon	[C43 Hostname#b11eb60d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: F2AEC20A-86ED-4A08-B9EC-0A6B01F55550
default	09:52:27.168075-0500	RedLemon	[C43 Hostname#b11eb60d:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	09:52:27.168113-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state preparing
default	09:52:27.166290-0500	mDNSResponder	[R1584] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 4529 (RedLemon)
default	09:52:27.169249-0500	RedLemon	[C43.1 Hostname#b11eb60d:443 initial path ((null))] event: path:start @0.001s
default	09:52:27.169862-0500	RedLemon	[C43.1 Hostname#b11eb60d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.002s, uuid: E84B5080-9819-4197-BC24-7192A37F817B
default	09:52:27.170105-0500	RedLemon	[C43.1 Hostname#b11eb60d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.002s
default	09:52:27.170382-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> setting up Connection 43
default	09:52:27.170886-0500	RedLemon	0x7fb19b32f9e8 ID=380 Task <4D3036FE-9E41-4B9A-94AA-3EF49E8E9A51>.<259> sent request, body S 83
default	09:52:27.171026-0500	RedLemon	tcp_input [C39.1:3] flags=[F.] seq=3421598870, ack=1013034575, win=16 state=FIN_WAIT_1 rcv_nxt=3421598870, snd_una=1013034575
default	09:52:27.171086-0500	RedLemon	tcp_output [C39.1:3] flags=[F.] seq=1013034575, ack=3421598871, win=2048 state=CLOSING rcv_nxt=3421598871, snd_una=1013034575
default	09:52:27.170630-0500	mDNSResponder	[R1585] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'pBGNh34PZbr+T4Lknogg+Q=='>, options: 0x8 {use-failover}, client pid: 4529 (RedLemon)
default	09:52:27.173762-0500	RedLemon	nw_endpoint_resolver_update [C42 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#fd2705f0:443
default	09:52:27.173885-0500	RedLemon	[C42 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.009s
default	09:52:27.173928-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:27.174575-0500	mDNSResponder	[R1584] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 4529 (RedLemon)
default	09:52:27.174405-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 initial path ((null))] event: path:start @0.010s
default	09:52:27.175369-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.011s, uuid: BFA79085-D2F3-42E0-B12E-5EE3416171E3
default	09:52:27.175623-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.011s
default	09:52:27.177313-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.013s
default	09:52:27.177947-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.013s
default	09:52:27.178062-0500	RedLemon	tcp_output [C42.1:3] flags=[S] seq=2272883427, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2272883427
default	09:52:27.179080-0500	mDNSResponder	[R1585] getaddrinfo stop -- hostname: <mask.hash: 'pBGNh34PZbr+T4Lknogg+Q=='>, client pid: 4529 (RedLemon)
default	09:52:27.179110-0500	RedLemon	nw_endpoint_resolver_update [C43.1 Hostname#b11eb60d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#fec6f23c.443
default	09:52:27.179254-0500	RedLemon	nw_endpoint_resolver_update [C43.1 Hostname#b11eb60d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#1920225f:443
default	09:52:27.179475-0500	RedLemon	[C43.1 Hostname#b11eb60d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.012s
default	09:52:27.179800-0500	RedLemon	[C43.1.1 IPv6#fec6f23c.443 initial path ((null))] event: path:start @0.012s
default	09:52:27.180377-0500	RedLemon	[C43.1.1 IPv6#fec6f23c.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.013s, uuid: E4D9F76B-54D7-4DE0-8FD2-4BAB41B4C120
default	09:52:27.180608-0500	RedLemon	[C43.1.1 IPv6#fec6f23c.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.013s
default	09:52:27.181375-0500	RedLemon	[C43.1.1 IPv6#fec6f23c.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.014s
default	09:52:27.182257-0500	RedLemon	[C43.1.1 IPv6#fec6f23c.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.014s
default	09:52:27.182502-0500	RedLemon	tcp_output [C43.1.1:3] flags=[SEC] seq=2166463448, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2166463448
default	09:52:27.194113-0500	RedLemon	tcp_input [C43.1.1:3] flags=[S.E] seq=943569176, ack=2166463449, win=31416 state=SYN_SENT rcv_nxt=0, snd_una=2166463448
default	09:52:27.194246-0500	RedLemon	nw_flow_connected [C43.1.1 IPv6#fec6f23c.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:27.194498-0500	RedLemon	[C43.1.1 IPv6#fec6f23c.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.027s
default	09:52:27.194642-0500	RedLemon	[C43.1 Hostname#b11eb60d:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.027s
default	09:52:27.194704-0500	RedLemon	[C43 Hostname#b11eb60d:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.027s
default	09:52:27.195185-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C43.1.1:2][0x7fb19c3d3a30] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	09:52:27.195288-0500	RedLemon	boringssl_context_info_handler(2028) [C43.1.1:2][0x7fb19c3d3a30] Client handshake started
default	09:52:27.195441-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS client enter_early_data
default	09:52:27.195564-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS client read_server_hello
default	09:52:27.216656-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client read_hello_retry_request
default	09:52:27.216751-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client read_server_hello
default	09:52:27.217037-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	09:52:27.217510-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client read_certificate_request
default	09:52:27.218115-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client read_server_certificate
default	09:52:27.218182-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	09:52:27.219599-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C43.1.1:2][0x7fb19c3d3a30] Performing external trust evaluation
default	09:52:27.219834-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C43.1.1:2][0x7fb19c3d3a30] Asyncing for external verify block
default	09:52:27.220201-0500	RedLemon	Connection 43: asked to evaluate TLS Trust
default	09:52:27.220885-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> auth completion disp=1 cred=0x0
default	09:52:27.231493-0500	RedLemon	Connection 43: TLS Trust result 0
default	09:52:27.231571-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C43.1.1:2][0x7fb19c3d3a30] Returning from external verify block with result: true
default	09:52:27.231676-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C43.1.1:2][0x7fb19c3d3a30] Certificate verification result: OK
default	09:52:27.232374-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client read_server_finished
default	09:52:27.232863-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client send_end_of_early_data
default	09:52:27.232903-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	09:52:27.232939-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client send_client_certificate
default	09:52:27.232975-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client complete_second_flight
default	09:52:27.233114-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS 1.3 client done
default	09:52:27.233345-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS client finish_client_handshake
default	09:52:27.233395-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1.1:2][0x7fb19c3d3a30] Client handshake state: TLS client done
default	09:52:27.233418-0500	RedLemon	boringssl_context_info_handler(2034) [C43.1.1:2][0x7fb19c3d3a30] Client handshake done
default	09:52:27.233949-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C43.1.1:2][0x7fb19c3d3a30] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(38ms) flight_time(22ms) rtt(21ms) write_stalls(0) read_stalls(7)]
default	09:52:27.234266-0500	RedLemon	nw_flow_connected [C43.1.1 IPv6#fec6f23c.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:27.234678-0500	RedLemon	[C43.1.1 IPv6#fec6f23c.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.067s
default	09:52:27.234848-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state ready
default	09:52:27.235156-0500	RedLemon	[C43.1 Hostname#b11eb60d:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.067s
default	09:52:27.235197-0500	RedLemon	[C43 Hostname#b11eb60d:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.067s
default	09:52:27.235354-0500	RedLemon	[C43.1.1 IPv6#fec6f23c.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.068s
default	09:52:27.235503-0500	RedLemon	[C43.1 Hostname#b11eb60d:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.068s
default	09:52:27.235548-0500	RedLemon	[C43 Hostname#b11eb60d:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.068s
default	09:52:27.235879-0500	RedLemon	Connection 43: connected successfully
default	09:52:27.236179-0500	RedLemon	Connection 43: TLS handshake complete
default	09:52:27.236532-0500	RedLemon	Connection 43: ready C(N) E(N)
default	09:52:27.237068-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> now using Connection 43
default	09:52:27.237237-0500	RedLemon	Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> now using Connection 43
default	09:52:27.237329-0500	RedLemon	Connection 43: received viability advisory(Y)
default	09:52:27.237436-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> sent request, body N 0
default	09:52:27.237468-0500	RedLemon	Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> sent request, body N 0
default	09:52:27.237970-0500	RedLemon	0x7fb19b32f9e8 ID=380 Task <4D3036FE-9E41-4B9A-94AA-3EF49E8E9A51>.<259> received response, status 201 content U
default	09:52:27.238878-0500	RedLemon	Task <4D3036FE-9E41-4B9A-94AA-3EF49E8E9A51>.<259> response ended
default	09:52:27.239459-0500	RedLemon	Task <4D3036FE-9E41-4B9A-94AA-3EF49E8E9A51>.<259> done using Connection 2
default	09:52:27.239597-0500	RedLemon	Task <4D3036FE-9E41-4B9A-94AA-3EF49E8E9A51>.<259> summary for task success {transaction_duration_ms=93, response_status=201, connection=2, reused=1, request_start_ms=11, request_duration_ms=12, response_start_ms=91, response_duration_ms=1, request_bytes=496, response_bytes=775, cache_hit=false}
default	09:52:27.239917-0500	RedLemon	Task <4D3036FE-9E41-4B9A-94AA-3EF49E8E9A51>.<259> finished successfully
default	09:52:27.240113-0500	RedLemon	✅ Guest joined room 3PBW in database
default	09:52:27.240658-0500	RedLemon	Task <C0DB5502-CF28-4CEE-BF38-A7C2FF9C5065>.<2> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:27.241198-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1E4ECF4C-8CF4-4E43-BA1E-AC3029F5A45C] (reporting strategy default)> on Task <C0DB5502-CF28-4CEE-BF38-A7C2FF9C5065>.<2> was not selected for reporting
default	09:52:27.242897-0500	RedLemon	Connection 44: enabling TLS
default	09:52:27.242985-0500	RedLemon	Connection 44: starting, TC(0x0)
default	09:52:27.243084-0500	RedLemon	[C44 0DF1ED84-9E17-461F-9CB9-FD7B60D73CF0 Hostname#ad896fdc:443 tcp, url hash: b4e6f735, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{F0FBD091-7EC7-446D-BC0E-91861B508A16}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:27.243180-0500	RedLemon	[C44 Hostname#ad896fdc:443 initial path ((null))] event: path:start @0.000s
default	09:52:27.243736-0500	RedLemon	[C44 Hostname#ad896fdc:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 22438BF0-BDEC-48CF-B986-3D65A3FB6DA1
default	09:52:27.244916-0500	mDNSResponder	[R1586] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'G36kQr+TBraomyPBiUO6UA=='>, options: 0x8 {use-failover}, client pid: 4529 (RedLemon)
default	09:52:27.244358-0500	RedLemon	[C44 Hostname#ad896fdc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	09:52:27.244405-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state preparing
default	09:52:27.244692-0500	RedLemon	Task <C0DB5502-CF28-4CEE-BF38-A7C2FF9C5065>.<2> setting up Connection 44
default	09:52:27.263160-0500	RedLemon	nw_endpoint_resolver_update [C44 Hostname#ad896fdc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#de37c2c5:443
default	09:52:27.263314-0500	RedLemon	nw_endpoint_resolver_update [C44 Hostname#ad896fdc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#7ddd21d6:443
default	09:52:27.272689-0500	RedLemon	[C44 Hostname#ad896fdc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.020s
default	09:52:27.272716-0500	mDNSResponder	[R1586] getaddrinfo stop -- hostname: <mask.hash: 'G36kQr+TBraomyPBiUO6UA=='>, client pid: 4529 (RedLemon)
default	09:52:27.274529-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 initial path ((null))] event: path:start @0.031s
default	09:52:27.277620-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.034s, uuid: 39BEF0C4-6A8C-4643-911E-B72C7812293B
default	09:52:27.277820-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.034s
default	09:52:27.278503-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.035s
default	09:52:27.279321-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.036s
default	09:52:27.279474-0500	RedLemon	tcp_output [C44.1:3] flags=[S] seq=3540460073, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3540460073
default	09:52:27.294280-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> received response, status 200 content K
default	09:52:27.300620-0500	RedLemon	tcp_input [C44.1:3] flags=[S.] seq=2824032642, ack=3540460074, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3540460073
default	09:52:27.300882-0500	RedLemon	nw_flow_connected [C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:27.301139-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.057s
default	09:52:27.301212-0500	RedLemon	[C44 Hostname#ad896fdc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.058s
default	09:52:27.301584-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C44.1:2][0x7fb19c411be0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	09:52:27.301835-0500	RedLemon	boringssl_context_info_handler(2028) [C44.1:2][0x7fb19c411be0] Client handshake started
default	09:52:27.301966-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS client enter_early_data
default	09:52:27.302073-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS client read_server_hello
default	09:52:27.302524-0500	RedLemon	tcp_input [C42.1:3] flags=[S.] seq=351881887, ack=2272883428, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2272883427
default	09:52:27.302664-0500	RedLemon	nw_flow_connected [C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:27.302813-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.138s
default	09:52:27.302875-0500	RedLemon	[C42 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.138s
default	09:52:27.303328-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C42.1:2][0x7fb19be48ea0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	09:52:27.303455-0500	RedLemon	boringssl_context_info_handler(2028) [C42.1:2][0x7fb19be48ea0] Client handshake started
default	09:52:27.303800-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS client enter_early_data
default	09:52:27.303906-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS client read_server_hello
default	09:52:27.310034-0500	RedLemon	Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> received response, status 200 content K
default	09:52:27.316638-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	09:52:27.316695-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client read_server_hello
default	09:52:27.316880-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	09:52:27.317492-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client read_certificate_request
default	09:52:27.317569-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client read_server_certificate
default	09:52:27.317679-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	09:52:27.318165-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C44.1:2][0x7fb19c411be0] Performing external trust evaluation
default	09:52:27.318423-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C44.1:2][0x7fb19c411be0] Asyncing for external verify block
default	09:52:27.318659-0500	RedLemon	Connection 44: asked to evaluate TLS Trust
default	09:52:27.319071-0500	RedLemon	Task <C0DB5502-CF28-4CEE-BF38-A7C2FF9C5065>.<2> auth completion disp=1 cred=0x0
default	09:52:27.322833-0500	RedLemon	Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> done using Connection 43
default	09:52:27.323019-0500	RedLemon	Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> response ended
default	09:52:27.323770-0500	RedLemon	Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> summary for task success {transaction_duration_ms=162, response_status=200, connection=43, reused=1, request_start_ms=76, request_duration_ms=0, response_start_ms=149, response_duration_ms=13, request_bytes=36, response_bytes=63211, cache_hit=false}
default	09:52:27.323893-0500	RedLemon	Task <838EB759-F2B6-4205-8749-2FB8A513425F>.<261> finished successfully
default	09:52:27.328479-0500	RedLemon	Connection 44: TLS Trust result 0
default	09:52:27.328643-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C44.1:2][0x7fb19c411be0] Returning from external verify block with result: true
default	09:52:27.328752-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C44.1:2][0x7fb19c411be0] Certificate verification result: OK
default	09:52:27.329401-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client read_server_finished
default	09:52:27.329560-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	09:52:27.329602-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	09:52:27.329642-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client send_client_certificate
default	09:52:27.329734-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client complete_second_flight
default	09:52:27.329909-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS 1.3 client done
default	09:52:27.330101-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS client finish_client_handshake
default	09:52:27.330290-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fb19c411be0] Client handshake state: TLS client done
default	09:52:27.330384-0500	RedLemon	boringssl_context_info_handler(2034) [C44.1:2][0x7fb19c411be0] Client handshake done
default	09:52:27.332309-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C44.1:2][0x7fb19c411be0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(29ms) flight_time(16ms) rtt(15ms) write_stalls(0) read_stalls(6)]
default	09:52:27.332803-0500	RedLemon	nw_flow_connected [C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:27.333273-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.090s
default	09:52:27.334208-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state ready
default	09:52:27.334302-0500	RedLemon	[C44 Hostname#ad896fdc:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.091s
default	09:52:27.334518-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.091s
default	09:52:27.334594-0500	RedLemon	[C44 Hostname#ad896fdc:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.091s
default	09:52:27.334947-0500	RedLemon	Connection 44: connected successfully
default	09:52:27.335047-0500	RedLemon	Connection 44: TLS handshake complete
default	09:52:27.335489-0500	RedLemon	Connection 44: ready C(N) E(N)
default	09:52:27.335747-0500	RedLemon	Task <C0DB5502-CF28-4CEE-BF38-A7C2FF9C5065>.<2> now using Connection 44
default	09:52:27.335864-0500	RedLemon	Connection 44: received viability advisory(Y)
default	09:52:27.336137-0500	RedLemon	Task <C0DB5502-CF28-4CEE-BF38-A7C2FF9C5065>.<2> sent request, body N 0
default	09:52:27.336478-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> done using Connection 43
default	09:52:27.336611-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> response ended
default	09:52:27.337393-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> summary for task success {transaction_duration_ms=178, response_status=200, connection=43, protocol="h2", domain_lookup_duration_ms=10, connect_duration_ms=53, secure_connection_duration_ms=38, private_relay=false, request_start_ms=78, request_duration_ms=0, response_start_ms=134, response_duration_ms=42, request_bytes=128, response_bytes=118499, cache_hit=false}
default	09:52:27.337532-0500	RedLemon	Task <19FF48DC-FDA3-4FF4-BB9A-732D2682C199>.<260> finished successfully
default	09:52:27.426002-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	09:52:27.426163-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client read_server_hello
default	09:52:27.426819-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	09:52:27.427788-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client read_certificate_request
default	09:52:27.428457-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client read_server_certificate
default	09:52:27.428561-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	09:52:27.429986-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C42.1:2][0x7fb19be48ea0] Performing external trust evaluation
default	09:52:27.430218-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C42.1:2][0x7fb19be48ea0] Asyncing for external verify block
default	09:52:27.430486-0500	RedLemon	Connection 42: asked to evaluate TLS Trust
default	09:52:27.430988-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> auth completion disp=1 cred=0x0
default	09:52:27.437767-0500	RedLemon	Connection 42: TLS Trust result 0
default	09:52:27.437819-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C42.1:2][0x7fb19be48ea0] Returning from external verify block with result: true
default	09:52:27.437875-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C42.1:2][0x7fb19be48ea0] Certificate verification result: OK
default	09:52:27.438210-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client read_server_finished
default	09:52:27.438381-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	09:52:27.438405-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	09:52:27.438426-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client send_client_certificate
default	09:52:27.438446-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client complete_second_flight
default	09:52:27.438678-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS 1.3 client done
default	09:52:27.438914-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS client finish_client_handshake
default	09:52:27.439069-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fb19be48ea0] Client handshake state: TLS client done
default	09:52:27.439141-0500	RedLemon	boringssl_context_info_handler(2034) [C42.1:2][0x7fb19be48ea0] Client handshake done
default	09:52:27.439816-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C42.1:2][0x7fb19be48ea0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(136ms) flight_time(123ms) rtt(122ms) write_stalls(0) read_stalls(6)]
default	09:52:27.440011-0500	RedLemon	nw_flow_connected [C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:27.440295-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.276s
default	09:52:27.440610-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state ready
default	09:52:27.440676-0500	RedLemon	[C42 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.276s
default	09:52:27.440829-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.276s
default	09:52:27.440896-0500	RedLemon	[C42 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.276s
default	09:52:27.441232-0500	RedLemon	Connection 42: connected successfully
default	09:52:27.441289-0500	RedLemon	Connection 42: TLS handshake complete
default	09:52:27.441565-0500	RedLemon	Connection 42: ready C(N) E(N)
default	09:52:27.441833-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> now using Connection 42
default	09:52:27.441915-0500	RedLemon	Connection 42: received viability advisory(Y)
default	09:52:27.442178-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> sent request, body N 0
default	09:52:27.464375-0500	RedLemon	Task <C0DB5502-CF28-4CEE-BF38-A7C2FF9C5065>.<2> received response, status 101 content U
default	09:52:27.465046-0500	RedLemon	Task <C0DB5502-CF28-4CEE-BF38-A7C2FF9C5065>.<2> response ended
default	09:52:27.465156-0500	RedLemon	Task <C0DB5502-CF28-4CEE-BF38-A7C2FF9C5065>.<2> done using Connection 44
default	09:52:27.466964-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.223s
default	09:52:27.467015-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state preparing
default	09:52:27.467091-0500	RedLemon	[C44 Hostname#ad896fdc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.223s
default	09:52:27.467237-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.224s
default	09:52:27.467298-0500	RedLemon	[C44 Hostname#ad896fdc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.224s
default	09:52:27.467380-0500	RedLemon	nw_flow_connected [C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:27.467519-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.224s
default	09:52:27.467577-0500	RedLemon	[C44 Hostname#ad896fdc:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.224s
default	09:52:27.468075-0500	RedLemon	nw_flow_connected [C44.1 IPv4#de37c2c5:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:27.468790-0500	RedLemon	[C44.1 IPv4#de37c2c5:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.225s
default	09:52:27.469120-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state ready
default	09:52:27.469669-0500	RedLemon	[C44 Hostname#ad896fdc:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.226s
default	09:52:27.484781-0500	RedLemon	Task <14E5B8BE-C090-46D9-A281-BBE6464D343B>.<262> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:27.485275-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8356520D-EFBA-4B33-8440-E93448596FFB] (reporting strategy default)> on Task <14E5B8BE-C090-46D9-A281-BBE6464D343B>.<262> was not selected for reporting
default	09:52:27.486032-0500	RedLemon	Task <14E5B8BE-C090-46D9-A281-BBE6464D343B>.<262> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:27.486248-0500	RedLemon	Task <14E5B8BE-C090-46D9-A281-BBE6464D343B>.<262> now using Connection 2
default	09:52:27.487030-0500	RedLemon	0x7fb19b3e39b8 ID=384 Task <14E5B8BE-C090-46D9-A281-BBE6464D343B>.<262> sent request, body N 0
default	09:52:27.511899-0500	RedLemon	📥 Received Realtime message: 'LOBBY_JOIN' from ursinho in room 3PBW
default	09:52:27.512168-0500	RedLemon	👋 Received: Guest 'ursinho' joined room 3PBW
default	09:52:27.547166-0500	RedLemon	0x7fb19b3e39b8 ID=384 Task <14E5B8BE-C090-46D9-A281-BBE6464D343B>.<262> received response, status 200 content U
default	09:52:27.548058-0500	RedLemon	Task <14E5B8BE-C090-46D9-A281-BBE6464D343B>.<262> response ended
default	09:52:27.550036-0500	RedLemon	Task <14E5B8BE-C090-46D9-A281-BBE6464D343B>.<262> done using Connection 2
default	09:52:27.554502-0500	RedLemon	Task <14E5B8BE-C090-46D9-A281-BBE6464D343B>.<262> summary for task success {transaction_duration_ms=68, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=6, request_bytes=511, response_bytes=840, cache_hit=true}
default	09:52:27.554789-0500	RedLemon	Task <14E5B8BE-C090-46D9-A281-BBE6464D343B>.<262> finished successfully
default	09:52:27.558305-0500	RedLemon	Task <AF43F860-4692-4766-9BFA-E9A0EDE73B02>.<263> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:27.558371-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1516 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:27.558681-0500	runningboardd	Assertion 173-4529-1516 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:27.558737-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1AF9A68F-9F8A-4D98-B89A-ED4E3D8D19D4] (reporting strategy default)> on Task <AF43F860-4692-4766-9BFA-E9A0EDE73B02>.<263> was not selected for reporting
default	09:52:27.559576-0500	RedLemon	Task <AF43F860-4692-4766-9BFA-E9A0EDE73B02>.<263> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:27.559885-0500	RedLemon	Task <AF43F860-4692-4766-9BFA-E9A0EDE73B02>.<263> now using Connection 2
default	09:52:27.560908-0500	RedLemon	0x7fb19c286e98 ID=388 Task <AF43F860-4692-4766-9BFA-E9A0EDE73B02>.<263> sent request, body N 0
default	09:52:27.561161-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:27.561326-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:27.561374-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:27.564083-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1517 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:27.564929-0500	runningboardd	Assertion 173-114-1517 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:27.566638-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:27.566692-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:27.566742-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:27.567831-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> received response, status 101 content U
default	09:52:27.568006-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> response ended
default	09:52:27.568070-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> done using Connection 42
default	09:52:27.568710-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.404s
default	09:52:27.568754-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state preparing
default	09:52:27.568819-0500	RedLemon	[C42 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.404s
default	09:52:27.568953-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.404s
default	09:52:27.569009-0500	RedLemon	[C42 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.405s
default	09:52:27.569096-0500	RedLemon	nw_flow_connected [C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:27.569236-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.405s
default	09:52:27.569293-0500	RedLemon	[C42 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.405s
default	09:52:27.569488-0500	RedLemon	nw_flow_connected [C42.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:27.569823-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.405s
default	09:52:27.570171-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state ready
default	09:52:27.570288-0500	RedLemon	[C42 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.406s
default	09:52:27.578285-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:27.636460-0500	RedLemon	0x7fb19c286e98 ID=388 Task <AF43F860-4692-4766-9BFA-E9A0EDE73B02>.<263> received response, status 200 content U
default	09:52:27.637312-0500	RedLemon	Task <AF43F860-4692-4766-9BFA-E9A0EDE73B02>.<263> response ended
default	09:52:27.638153-0500	RedLemon	Task <AF43F860-4692-4766-9BFA-E9A0EDE73B02>.<263> done using Connection 2
default	09:52:27.638520-0500	RedLemon	Task <AF43F860-4692-4766-9BFA-E9A0EDE73B02>.<263> summary for task success {transaction_duration_ms=79, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=77, response_duration_ms=2, request_bytes=524, response_bytes=843, cache_hit=true}
default	09:52:27.638978-0500	RedLemon	Task <AF43F860-4692-4766-9BFA-E9A0EDE73B02>.<263> finished successfully
default	09:52:27.642806-0500	RedLemon	Task <AEE2F0B0-22A5-4ACE-93CB-262D543C7CA1>.<264> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:27.643357-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [12BFD93C-180C-4012-95EC-D5D3A8D3B13E] (reporting strategy default)> on Task <AEE2F0B0-22A5-4ACE-93CB-262D543C7CA1>.<264> was not selected for reporting
default	09:52:27.644821-0500	RedLemon	Task <AEE2F0B0-22A5-4ACE-93CB-262D543C7CA1>.<264> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:27.645207-0500	RedLemon	Task <AEE2F0B0-22A5-4ACE-93CB-262D543C7CA1>.<264> now using Connection 2
default	09:52:27.646528-0500	RedLemon	0x7fb19c286e98 ID=392 Task <AEE2F0B0-22A5-4ACE-93CB-262D543C7CA1>.<264> sent request, body N 0
default	09:52:27.662146-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:27.693576-0500	RedLemon	nw_flow_disconnected [C42.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	09:52:27.694072-0500	RedLemon	nw_protocol_tcp_log_summary [C42.1:3]
	[442E91DC-057D-4ABF-A7FD-25ADA234A916 <private>:51444<-><private>:443]
	Init: 1, Conn_Time: 124.592ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 128.375ms, rtt_var: 8.500ms rtt_nc: 124.375ms, rtt_var_nc: 27.875ms base rtt: 121ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	09:52:27.694447-0500	RedLemon	Connection 42: read-side closed
default	09:52:27.694536-0500	RedLemon	tcp_input [C42.1:3] flags=[F.] seq=351884918, ack=2272884482, win=249 state=ESTABLISHED rcv_nxt=351884918, snd_una=2272884482
error	09:52:27.695015-0500	RedLemon	nw_read_request_report [C42] Receive failed with error "Socket is not connected"
default	09:52:27.695693-0500	RedLemon	[C42.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.531s, error Socket is not connected
default	09:52:27.695810-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state failed error Socket is not connected
default	09:52:27.695935-0500	RedLemon	[C42 Hostname#11e4b683:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.531s
default	09:52:27.696052-0500	RedLemon	tcp_output [C42.1:3] flags=[F.] seq=2272884613, ack=351884919, win=2048 state=LAST_ACK rcv_nxt=351884919, snd_una=2272884482
error	09:52:27.696297-0500	RedLemon	Connection 42: received failure notification
default	09:52:27.696398-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> summary for task success {transaction_duration_ms=552, response_status=101, connection=42, protocol="http/1.1", domain_lookup_duration_ms=8, connect_duration_ms=263, secure_connection_duration_ms=136, private_relay=false, request_start_ms=297, request_duration_ms=0, response_start_ms=423, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	09:52:27.696518-0500	RedLemon	Task <110EC8E3-6057-44E4-9B0F-C9C6D8F648A3>.<1> finished successfully
error	09:52:27.696669-0500	RedLemon	nw_flow_add_write_request [C42.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	09:52:27.697078-0500	RedLemon	nw_write_request_report [C42] Send failed with error "Socket is not connected"
default	09:52:27.697396-0500	RedLemon	Connection 42: cleaning up
default	09:52:27.697696-0500	RedLemon	[C42 FB9ECF5A-3C0C-4AF9-A9DC-45CD71559941 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancel
default	09:52:27.697928-0500	RedLemon	[C42 FB9ECF5A-3C0C-4AF9-A9DC-45CD71559941 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancelled
	[C42.1 BFA79085-D2F3-42E0-B12E-5EE3416171E3 10.0.0.249:51444<->IPv4#fd2705f0:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.533s, DNS @0.001s took 0.008s, TCP @0.404s took 0.125s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	09:52:27.698652-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state cancelled error Socket is not connected
default	09:52:27.698863-0500	RedLemon	Connection 42: done
default	09:52:27.706542-0500	RedLemon	0x7fb19c286e98 ID=392 Task <AEE2F0B0-22A5-4ACE-93CB-262D543C7CA1>.<264> received response, status 200 content U
default	09:52:27.707195-0500	RedLemon	Task <AEE2F0B0-22A5-4ACE-93CB-262D543C7CA1>.<264> response ended
default	09:52:27.707580-0500	RedLemon	Task <AEE2F0B0-22A5-4ACE-93CB-262D543C7CA1>.<264> done using Connection 2
default	09:52:27.707756-0500	RedLemon	Task <AEE2F0B0-22A5-4ACE-93CB-262D543C7CA1>.<264> summary for task success {transaction_duration_ms=63, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	09:52:27.708028-0500	RedLemon	Task <AEE2F0B0-22A5-4ACE-93CB-262D543C7CA1>.<264> finished successfully
default	09:52:27.710177-0500	RedLemon	🔍 Current guest participant found in polling: ursinho with ID 656DAA91-33B4-4688-9135-C982EA52D7C9
default	09:52:27.710408-0500	RedLemon	👋 ursinho joined room
default	09:52:27.710858-0500	RedLemon	Task <15FC17D9-280D-477A-A7F6-33575A865444>.<265> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:27.711340-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A3C88295-6156-4E77-8E10-1EA5950B2C1C] (reporting strategy default)> on Task <15FC17D9-280D-477A-A7F6-33575A865444>.<265> was not selected for reporting
default	09:52:27.712507-0500	RedLemon	Task <15FC17D9-280D-477A-A7F6-33575A865444>.<265> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:27.712836-0500	RedLemon	Task <15FC17D9-280D-477A-A7F6-33575A865444>.<265> now using Connection 2
default	09:52:27.713987-0500	RedLemon	0x7fb19c33b8b8 ID=396 Task <15FC17D9-280D-477A-A7F6-33575A865444>.<265> sent request, body N 0
default	09:52:27.742773-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:27.776170-0500	RedLemon	0x7fb19c33b8b8 ID=396 Task <15FC17D9-280D-477A-A7F6-33575A865444>.<265> received response, status 200 content U
default	09:52:27.777314-0500	RedLemon	Task <15FC17D9-280D-477A-A7F6-33575A865444>.<265> response ended
default	09:52:27.778194-0500	RedLemon	Task <15FC17D9-280D-477A-A7F6-33575A865444>.<265> done using Connection 2
default	09:52:27.781820-0500	RedLemon	Task <15FC17D9-280D-477A-A7F6-33575A865444>.<265> summary for task success {transaction_duration_ms=70, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=64, response_duration_ms=2, request_bytes=500, response_bytes=969, cache_hit=false}
default	09:52:27.782243-0500	RedLemon	Task <15FC17D9-280D-477A-A7F6-33575A865444>.<265> finished successfully
error	09:52:27.815776-0500	RedLemon	tcp_input [C42.1:3] flags=[R] seq=351884919, ack=0, win=0 state=LAST_ACK rcv_nxt=351884919, snd_una=2272884482
default	09:52:27.816102-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:28.663388-0500	runningboardd	Invalidating assertion 173-4529-1516 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:28.781583-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:28.782427-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2E93BF30-E760-4D98-A3B4-6858474FF6BE] (reporting strategy default)> on Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> was not selected for reporting
default	09:52:28.784580-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:28.785574-0500	RedLemon	Connection 45: enabling TLS
default	09:52:28.785619-0500	RedLemon	Connection 45: starting, TC(0x0)
default	09:52:28.785679-0500	RedLemon	[C45 7BE58A63-5967-4181-BBD0-EA5034648AF2 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{27699152-3FB4-45DD-A5CA-D84DD330640E}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:28.785777-0500	RedLemon	[C45 Hostname#11e4b683:443 initial path ((null))] event: path:start @0.000s
default	09:52:28.786160-0500	RedLemon	[C45 Hostname#11e4b683:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 2FE9D04A-B761-4FBD-B6A8-E1691F5EEA44
default	09:52:28.786381-0500	RedLemon	[C45 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	09:52:28.786535-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state preparing
default	09:52:28.786751-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> setting up Connection 45
default	09:52:28.786967-0500	mDNSResponder	[R1587] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 4529 (RedLemon)
default	09:52:28.788877-0500	RedLemon	nw_endpoint_resolver_update [C45 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#fd2705f0:443
default	09:52:28.788810-0500	mDNSResponder	[R1587] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 4529 (RedLemon)
default	09:52:28.789179-0500	RedLemon	[C45 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.003s
default	09:52:28.790793-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 initial path ((null))] event: path:start @0.005s
default	09:52:28.818665-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.032s, uuid: 2AF64DFB-4667-4062-8AE6-60BA070CFE14
default	09:52:28.819416-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.033s
default	09:52:28.820584-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.034s
default	09:52:28.825186-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.039s
default	09:52:28.825766-0500	RedLemon	tcp_output [C45.1:3] flags=[S] seq=2094495965, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2094495965
default	09:52:28.844650-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:28.845215-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:28.845282-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:28.862514-0500	runningboardd	Invalidating assertion 173-140-1512 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.coreservices.launchservicesd>:140]
default	09:52:28.912602-0500	runningboardd	Invalidating assertion 173-114-1517 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:28.947897-0500	RedLemon	tcp_input [C45.1:3] flags=[S.] seq=1932211474, ack=2094495966, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2094495965
default	09:52:28.948092-0500	RedLemon	nw_flow_connected [C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:28.948303-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.162s
default	09:52:28.948378-0500	RedLemon	[C45 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.162s
default	09:52:28.948766-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C45.1:2][0x7fb19c44a040] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	09:52:28.948890-0500	RedLemon	boringssl_context_info_handler(2028) [C45.1:2][0x7fb19c44a040] Client handshake started
default	09:52:28.949085-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS client enter_early_data
default	09:52:28.949228-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS client read_server_hello
default	09:52:29.020551-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:29.020613-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:29.020687-0500	runningboardd	[anon<RedLemon>(501):4529] Set darwin role to: UserInteractiveNonFocal
default	09:52:29.020740-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:29.077992-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client read_hello_retry_request
default	09:52:29.078247-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client read_server_hello
default	09:52:29.078607-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	09:52:29.078972-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client read_certificate_request
default	09:52:29.080101-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client read_server_certificate
default	09:52:29.080421-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	09:52:29.082545-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C45.1:2][0x7fb19c44a040] Performing external trust evaluation
default	09:52:29.082921-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C45.1:2][0x7fb19c44a040] Asyncing for external verify block
default	09:52:29.083233-0500	RedLemon	Connection 45: asked to evaluate TLS Trust
default	09:52:29.084233-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> auth completion disp=1 cred=0x0
default	09:52:29.091051-0500	RedLemon	Connection 45: TLS Trust result 0
default	09:52:29.091103-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C45.1:2][0x7fb19c44a040] Returning from external verify block with result: true
default	09:52:29.091155-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C45.1:2][0x7fb19c44a040] Certificate verification result: OK
default	09:52:29.091506-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client read_server_finished
default	09:52:29.091666-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client send_end_of_early_data
default	09:52:29.091700-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	09:52:29.091721-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client send_client_certificate
default	09:52:29.091738-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client complete_second_flight
default	09:52:29.091928-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS 1.3 client done
default	09:52:29.092122-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS client finish_client_handshake
default	09:52:29.092171-0500	RedLemon	boringssl_context_info_handler(2045) [C45.1:2][0x7fb19c44a040] Client handshake state: TLS client done
default	09:52:29.092237-0500	RedLemon	boringssl_context_info_handler(2034) [C45.1:2][0x7fb19c44a040] Client handshake done
default	09:52:29.092915-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C45.1:2][0x7fb19c44a040] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(144ms) flight_time(128ms) rtt(128ms) write_stalls(0) read_stalls(7)]
default	09:52:29.093065-0500	RedLemon	nw_flow_connected [C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:29.093381-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.307s
default	09:52:29.093693-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state ready
default	09:52:29.093868-0500	RedLemon	[C45 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.308s
default	09:52:29.094082-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.308s
default	09:52:29.094156-0500	RedLemon	[C45 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.308s
default	09:52:29.094504-0500	RedLemon	Connection 45: connected successfully
default	09:52:29.094563-0500	RedLemon	Connection 45: TLS handshake complete
default	09:52:29.094827-0500	RedLemon	Connection 45: ready C(N) E(N)
default	09:52:29.095035-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> now using Connection 45
default	09:52:29.095134-0500	RedLemon	Connection 45: received viability advisory(Y)
default	09:52:29.095366-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> sent request, body N 0
default	09:52:29.218278-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> received response, status 101 content U
default	09:52:29.218703-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> response ended
default	09:52:29.218810-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> done using Connection 45
default	09:52:29.219805-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.434s
default	09:52:29.219875-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state preparing
default	09:52:29.219980-0500	RedLemon	[C45 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.434s
default	09:52:29.220187-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.434s
default	09:52:29.220277-0500	RedLemon	[C45 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.434s
default	09:52:29.220388-0500	RedLemon	nw_flow_connected [C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:29.220958-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.435s
default	09:52:29.221194-0500	RedLemon	[C45 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.435s
default	09:52:29.221518-0500	RedLemon	nw_flow_connected [C45.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:29.221965-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.436s
default	09:52:29.222017-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state ready
default	09:52:29.222095-0500	RedLemon	[C45 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.436s
default	09:52:29.341373-0500	RedLemon	nw_flow_disconnected [C45.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	09:52:29.341727-0500	RedLemon	nw_protocol_tcp_log_summary [C45.1:3]
	[109EC6F2-176A-41C5-8359-C9CA4D68B64D <private>:51446<-><private>:443]
	Init: 1, Conn_Time: 122.313ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 126.656ms, rtt_var: 8.250ms rtt_nc: 121.906ms, rtt_var_nc: 27.500ms base rtt: 118ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	09:52:29.341960-0500	RedLemon	tcp_input [C45.1:3] flags=[F.] seq=1932214505, ack=2094497020, win=249 state=ESTABLISHED rcv_nxt=1932214505, snd_una=2094497020
default	09:52:29.342473-0500	RedLemon	[C45.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.556s, error Socket is not connected
default	09:52:29.342502-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state failed error Socket is not connected
default	09:52:29.342582-0500	RedLemon	[C45 Hostname#11e4b683:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.556s
error	09:52:29.342658-0500	RedLemon	nw_read_request_report [C45] Receive failed with error "Socket is not connected"
error	09:52:29.342730-0500	RedLemon	nw_flow_service_reads [C45.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	09:52:29.342791-0500	RedLemon	tcp_output [C45.1:3] flags=[R.] seq=2094497151, ack=1932214506, win=2047 state=CLOSED rcv_nxt=1932214506, snd_una=2094497020
error	09:52:29.342894-0500	RedLemon	Connection 45: received failure notification
default	09:52:29.343033-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> summary for task success {transaction_duration_ms=559, response_status=101, connection=45, protocol="http/1.1", domain_lookup_duration_ms=3, connect_duration_ms=268, secure_connection_duration_ms=144, private_relay=false, request_start_ms=311, request_duration_ms=0, response_start_ms=434, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	09:52:29.343071-0500	RedLemon	nw_flow_add_write_request [C45.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
default	09:52:29.343101-0500	RedLemon	Task <50C72199-9333-483E-8CFD-293E3169CD95>.<1> finished successfully
error	09:52:29.343128-0500	RedLemon	nw_write_request_report [C45] Send failed with error "Socket is not connected"
default	09:52:29.343182-0500	RedLemon	Connection 45: cleaning up
default	09:52:29.343233-0500	RedLemon	[C45 7BE58A63-5967-4181-BBD0-EA5034648AF2 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancel
default	09:52:29.343374-0500	RedLemon	[C45 7BE58A63-5967-4181-BBD0-EA5034648AF2 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancelled
	[C45.1 2AF64DFB-4667-4062-8AE6-60BA070CFE14 10.0.0.249:51446<->IPv4#fd2705f0:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.557s, DNS @0.000s took 0.003s, TCP @0.434s took 0.123s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	09:52:29.343852-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state cancelled error Socket is not connected
default	09:52:29.343957-0500	RedLemon	Connection 45: done
default	09:52:29.543595-0500	RedLemon	Task <65A46852-FA59-40F6-BB25-65E43ABC60A8>.<267> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:29.543595-0500	RedLemon	Task <D56938C6-C5B4-4CA9-91E5-A386CD8E0D76>.<266> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:29.545022-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9E6AF729-AE3A-4482-8634-3EF066DB2B6C] (reporting strategy default)> on Task <65A46852-FA59-40F6-BB25-65E43ABC60A8>.<267> was not selected for reporting
default	09:52:29.545392-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [80D75DDA-2656-46FF-81B2-FB6574A7C6CD] (reporting strategy default)> on Task <D56938C6-C5B4-4CA9-91E5-A386CD8E0D76>.<266> was not selected for reporting
default	09:52:29.547579-0500	RedLemon	Task <65A46852-FA59-40F6-BB25-65E43ABC60A8>.<267> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:29.548125-0500	RedLemon	Task <65A46852-FA59-40F6-BB25-65E43ABC60A8>.<267> now using Connection 2
default	09:52:29.550266-0500	RedLemon	Task <D56938C6-C5B4-4CA9-91E5-A386CD8E0D76>.<266> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:29.550579-0500	RedLemon	Task <D56938C6-C5B4-4CA9-91E5-A386CD8E0D76>.<266> now using Connection 2
default	09:52:29.552145-0500	RedLemon	0x7fb19be4c5e8 ID=400 Task <65A46852-FA59-40F6-BB25-65E43ABC60A8>.<267> sent request, body N 0
default	09:52:29.552238-0500	RedLemon	0x7fb19bbd5e58 ID=404 Task <D56938C6-C5B4-4CA9-91E5-A386CD8E0D76>.<266> sent request, body N 0
default	09:52:29.606694-0500	RedLemon	0x7fb19be4c5e8 ID=400 Task <65A46852-FA59-40F6-BB25-65E43ABC60A8>.<267> received response, status 200 content U
default	09:52:29.607671-0500	RedLemon	Task <65A46852-FA59-40F6-BB25-65E43ABC60A8>.<267> response ended
default	09:52:29.608124-0500	RedLemon	Task <65A46852-FA59-40F6-BB25-65E43ABC60A8>.<267> done using Connection 2
default	09:52:29.608422-0500	RedLemon	Task <65A46852-FA59-40F6-BB25-65E43ABC60A8>.<267> summary for task success {transaction_duration_ms=62, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=4, response_start_ms=60, response_duration_ms=1, request_bytes=500, response_bytes=970, cache_hit=false}
default	09:52:29.609066-0500	RedLemon	Task <65A46852-FA59-40F6-BB25-65E43ABC60A8>.<267> finished successfully
default	09:52:29.610477-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1524 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:29.611109-0500	runningboardd	Assertion 173-4529-1524 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:29.613646-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:29.613728-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:29.613862-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:29.617150-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1525 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:29.617315-0500	runningboardd	Assertion 173-114-1525 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:29.618809-0500	RedLemon	0x7fb19bbd5e58 ID=404 Task <D56938C6-C5B4-4CA9-91E5-A386CD8E0D76>.<266> received response, status 200 content U
default	09:52:29.619625-0500	RedLemon	Task <D56938C6-C5B4-4CA9-91E5-A386CD8E0D76>.<266> response ended
default	09:52:29.620094-0500	RedLemon	Task <D56938C6-C5B4-4CA9-91E5-A386CD8E0D76>.<266> done using Connection 2
default	09:52:29.620287-0500	RedLemon	Task <D56938C6-C5B4-4CA9-91E5-A386CD8E0D76>.<266> summary for task success {transaction_duration_ms=73, response_status=200, connection=2, reused=1, request_start_ms=3, request_duration_ms=1, response_start_ms=71, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	09:52:29.620676-0500	RedLemon	Task <D56938C6-C5B4-4CA9-91E5-A386CD8E0D76>.<266> finished successfully
default	09:52:29.621707-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:29.621948-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:29.622040-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:29.622534-0500	RedLemon	Task <9580ED12-A0C5-42E7-9570-0280E803EED5>.<268> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:29.622961-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9712CEDB-4FE0-48DD-96D4-C34ACD28A73D] (reporting strategy default)> on Task <9580ED12-A0C5-42E7-9570-0280E803EED5>.<268> was not selected for reporting
default	09:52:29.623826-0500	RedLemon	Task <9580ED12-A0C5-42E7-9570-0280E803EED5>.<268> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:29.624145-0500	RedLemon	Task <9580ED12-A0C5-42E7-9570-0280E803EED5>.<268> now using Connection 2
default	09:52:29.625205-0500	RedLemon	0x7fb198ae2118 ID=408 Task <9580ED12-A0C5-42E7-9570-0280E803EED5>.<268> sent request, body N 0
default	09:52:29.629523-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:29.685229-0500	RedLemon	0x7fb198ae2118 ID=408 Task <9580ED12-A0C5-42E7-9570-0280E803EED5>.<268> received response, status 200 content U
default	09:52:29.686954-0500	RedLemon	Task <9580ED12-A0C5-42E7-9570-0280E803EED5>.<268> response ended
default	09:52:29.687810-0500	RedLemon	Task <9580ED12-A0C5-42E7-9570-0280E803EED5>.<268> done using Connection 2
default	09:52:29.688205-0500	RedLemon	Task <9580ED12-A0C5-42E7-9570-0280E803EED5>.<268> summary for task success {transaction_duration_ms=64, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=61, response_duration_ms=3, request_bytes=524, response_bytes=840, cache_hit=true}
default	09:52:29.688656-0500	RedLemon	Task <9580ED12-A0C5-42E7-9570-0280E803EED5>.<268> finished successfully
default	09:52:29.691940-0500	RedLemon	Task <A69FDEDC-B15B-4EFC-A761-9428697DC331>.<269> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:29.692732-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7E9F3ABE-8D74-4DF1-8C0C-F8BB90BAE61B] (reporting strategy default)> on Task <A69FDEDC-B15B-4EFC-A761-9428697DC331>.<269> was not selected for reporting
default	09:52:29.694226-0500	RedLemon	Task <A69FDEDC-B15B-4EFC-A761-9428697DC331>.<269> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:29.694541-0500	RedLemon	Task <A69FDEDC-B15B-4EFC-A761-9428697DC331>.<269> now using Connection 2
default	09:52:29.695719-0500	RedLemon	0x7fb198ae2118 ID=412 Task <A69FDEDC-B15B-4EFC-A761-9428697DC331>.<269> sent request, body N 0
default	09:52:29.708110-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:29.755942-0500	RedLemon	0x7fb198ae2118 ID=412 Task <A69FDEDC-B15B-4EFC-A761-9428697DC331>.<269> received response, status 200 content U
default	09:52:29.758322-0500	RedLemon	Task <A69FDEDC-B15B-4EFC-A761-9428697DC331>.<269> response ended
default	09:52:29.759120-0500	RedLemon	Task <A69FDEDC-B15B-4EFC-A761-9428697DC331>.<269> done using Connection 2
default	09:52:29.759540-0500	RedLemon	Task <A69FDEDC-B15B-4EFC-A761-9428697DC331>.<269> summary for task success {transaction_duration_ms=66, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=61, response_duration_ms=4, request_bytes=524, response_bytes=842, cache_hit=true}
default	09:52:29.760143-0500	RedLemon	Task <A69FDEDC-B15B-4EFC-A761-9428697DC331>.<269> finished successfully
default	09:52:29.762001-0500	RedLemon	🔍 Current guest participant found in polling: ursinho with ID 656DAA91-33B4-4688-9135-C982EA52D7C9
default	09:52:29.793843-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:29.876168-0500	runningboardd	Assertion did invalidate due to timeout: 173-140-1513 (target:[anon<RedLemon>(501):4529])
default	09:52:30.053440-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:30.053541-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:30.053708-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:30.623040-0500	runningboardd	Invalidating assertion 173-4529-1524 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:30.726058-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:30.726161-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:30.726257-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:30.728522-0500	runningboardd	Invalidating assertion 173-114-1525 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:30.756836-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "frontmost:4529" ID:173-140-1527 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	09:52:30.757143-0500	runningboardd	Assertion 173-140-1527 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:30.779721-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:30.784557-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:30.798716-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "notification:4529" ID:173-140-1528 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	09:52:30.798906-0500	runningboardd	Assertion 173-140-1528 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:30.785456-0500	runningboardd	[anon<RedLemon>(501):4529] Set darwin role to: UserInteractiveFocal
default	09:52:30.800578-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:30.806047-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:30.806159-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:30.807459-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:30.877454-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:30.877513-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:30.877566-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:31.542198-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:31.542794-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8620FF3F-EE72-46F1-AE3E-45A10DC275D3] (reporting strategy default)> on Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> was not selected for reporting
default	09:52:31.544053-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:31.544790-0500	RedLemon	Connection 46: enabling TLS
default	09:52:31.544836-0500	RedLemon	Connection 46: starting, TC(0x0)
default	09:52:31.544898-0500	RedLemon	[C46 994F6AE6-D220-47F9-AB12-8124E1BA463C Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{5FBA54D0-7526-46A6-892D-98119839830D}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:31.544998-0500	RedLemon	[C46 Hostname#11e4b683:443 initial path ((null))] event: path:start @0.000s
default	09:52:31.545454-0500	RedLemon	[C46 Hostname#11e4b683:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: EF932F5A-7845-427E-ABFA-36DAFB27F90C
default	09:52:31.546056-0500	mDNSResponder	[R1588] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 4529 (RedLemon)
default	09:52:31.545700-0500	RedLemon	[C46 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	09:52:31.545744-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state preparing
default	09:52:31.546000-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> setting up Connection 46
default	09:52:31.548558-0500	mDNSResponder	[R1588] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 4529 (RedLemon)
default	09:52:31.548775-0500	RedLemon	nw_endpoint_resolver_update [C46 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#fd2705f0:443
default	09:52:31.549155-0500	RedLemon	[C46 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.004s
default	09:52:31.549721-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 initial path ((null))] event: path:start @0.004s
default	09:52:31.550268-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.005s, uuid: E2D68D3A-B7C2-4B7E-AE02-2BE9EACC0ED7
default	09:52:31.550498-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.005s
default	09:52:31.551352-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.006s
default	09:52:31.552525-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.007s
default	09:52:31.552701-0500	RedLemon	tcp_output [C46.1:3] flags=[S] seq=411476604, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=411476604
default	09:52:31.640223-0500	RedLemon	Task <018C3EFF-2360-4CC9-BD3D-6C3A2B72DBAD>.<270> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:31.640774-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A94717B8-FF4C-4DA4-8118-F4B75235DE8D] (reporting strategy default)> on Task <018C3EFF-2360-4CC9-BD3D-6C3A2B72DBAD>.<270> was not selected for reporting
default	09:52:31.641671-0500	RedLemon	Task <018C3EFF-2360-4CC9-BD3D-6C3A2B72DBAD>.<270> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:31.641927-0500	RedLemon	Task <018C3EFF-2360-4CC9-BD3D-6C3A2B72DBAD>.<270> now using Connection 2
default	09:52:31.642890-0500	RedLemon	0x7fb19be4c5e8 ID=416 Task <018C3EFF-2360-4CC9-BD3D-6C3A2B72DBAD>.<270> sent request, body N 0
default	09:52:31.670942-0500	RedLemon	tcp_input [C46.1:3] flags=[S.] seq=2648141100, ack=411476605, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=411476604
default	09:52:31.671163-0500	RedLemon	nw_flow_connected [C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:31.671416-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.126s
default	09:52:31.671539-0500	RedLemon	[C46 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.126s
default	09:52:31.672260-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C46.1:2][0x7fb19c2eaa70] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	09:52:31.672494-0500	RedLemon	boringssl_context_info_handler(2028) [C46.1:2][0x7fb19c2eaa70] Client handshake started
default	09:52:31.672873-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS client enter_early_data
default	09:52:31.673134-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS client read_server_hello
default	09:52:31.718156-0500	RedLemon	0x7fb19be4c5e8 ID=416 Task <018C3EFF-2360-4CC9-BD3D-6C3A2B72DBAD>.<270> received response, status 200 content U
default	09:52:31.718909-0500	RedLemon	Task <018C3EFF-2360-4CC9-BD3D-6C3A2B72DBAD>.<270> response ended
default	09:52:31.719465-0500	RedLemon	Task <018C3EFF-2360-4CC9-BD3D-6C3A2B72DBAD>.<270> done using Connection 2
default	09:52:31.719749-0500	RedLemon	Task <018C3EFF-2360-4CC9-BD3D-6C3A2B72DBAD>.<270> summary for task success {transaction_duration_ms=78, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=76, response_duration_ms=1, request_bytes=500, response_bytes=965, cache_hit=true}
default	09:52:31.720566-0500	RedLemon	Task <018C3EFF-2360-4CC9-BD3D-6C3A2B72DBAD>.<270> finished successfully
default	09:52:31.722225-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1531 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:31.722852-0500	runningboardd	Assertion 173-4529-1531 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:31.724754-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:31.724915-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:31.725008-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:31.728667-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1532 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:31.728924-0500	runningboardd	Assertion 173-114-1532 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:31.730226-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:31.730287-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:31.730341-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:31.753191-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:31.799004-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client read_hello_retry_request
default	09:52:31.799494-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client read_server_hello
default	09:52:31.800048-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	09:52:31.800704-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client read_certificate_request
default	09:52:31.802751-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client read_server_certificate
default	09:52:31.802892-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	09:52:31.805176-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C46.1:2][0x7fb19c2eaa70] Performing external trust evaluation
default	09:52:31.805346-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C46.1:2][0x7fb19c2eaa70] Asyncing for external verify block
default	09:52:31.805730-0500	RedLemon	Connection 46: asked to evaluate TLS Trust
default	09:52:31.806278-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> auth completion disp=1 cred=0x0
default	09:52:31.814646-0500	RedLemon	Connection 46: TLS Trust result 0
default	09:52:31.814868-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C46.1:2][0x7fb19c2eaa70] Returning from external verify block with result: true
default	09:52:31.815152-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C46.1:2][0x7fb19c2eaa70] Certificate verification result: OK
default	09:52:31.815521-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client read_server_finished
default	09:52:31.815715-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client send_end_of_early_data
default	09:52:31.815740-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	09:52:31.815761-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client send_client_certificate
default	09:52:31.815783-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client complete_second_flight
default	09:52:31.815965-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS 1.3 client done
default	09:52:31.816164-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS client finish_client_handshake
default	09:52:31.816212-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fb19c2eaa70] Client handshake state: TLS client done
default	09:52:31.816252-0500	RedLemon	boringssl_context_info_handler(2034) [C46.1:2][0x7fb19c2eaa70] Client handshake done
default	09:52:31.816890-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C46.1:2][0x7fb19c2eaa70] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(144ms) flight_time(127ms) rtt(126ms) write_stalls(0) read_stalls(7)]
default	09:52:31.817063-0500	RedLemon	nw_flow_connected [C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:31.817454-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.272s
default	09:52:31.817857-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state ready
default	09:52:31.817929-0500	RedLemon	[C46 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.272s
default	09:52:31.818094-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.273s
default	09:52:31.818169-0500	RedLemon	[C46 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.273s
default	09:52:31.818522-0500	RedLemon	Connection 46: connected successfully
default	09:52:31.818599-0500	RedLemon	Connection 46: TLS handshake complete
default	09:52:31.818856-0500	RedLemon	Connection 46: ready C(N) E(N)
default	09:52:31.819083-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> now using Connection 46
default	09:52:31.819205-0500	RedLemon	Connection 46: received viability advisory(Y)
default	09:52:31.819307-0500	RedLemon	Task <D22D98D7-08BE-4488-B1AF-DDBB3E879E57>.<271> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:31.819474-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> sent request, body N 0
default	09:52:31.819772-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0F42651B-CC89-428C-9E82-66C5A69B88B8] (reporting strategy default)> on Task <D22D98D7-08BE-4488-B1AF-DDBB3E879E57>.<271> was not selected for reporting
default	09:52:31.820516-0500	RedLemon	Task <D22D98D7-08BE-4488-B1AF-DDBB3E879E57>.<271> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:31.820755-0500	RedLemon	Task <D22D98D7-08BE-4488-B1AF-DDBB3E879E57>.<271> now using Connection 2
default	09:52:31.821765-0500	RedLemon	0x7fb19cef7508 ID=420 Task <D22D98D7-08BE-4488-B1AF-DDBB3E879E57>.<271> sent request, body N 0
default	09:52:31.886990-0500	RedLemon	0x7fb19cef7508 ID=420 Task <D22D98D7-08BE-4488-B1AF-DDBB3E879E57>.<271> received response, status 200 content U
default	09:52:31.887737-0500	RedLemon	Task <D22D98D7-08BE-4488-B1AF-DDBB3E879E57>.<271> response ended
default	09:52:31.888336-0500	RedLemon	Task <D22D98D7-08BE-4488-B1AF-DDBB3E879E57>.<271> done using Connection 2
default	09:52:31.888629-0500	RedLemon	Task <D22D98D7-08BE-4488-B1AF-DDBB3E879E57>.<271> summary for task success {transaction_duration_ms=68, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=66, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	09:52:31.890101-0500	RedLemon	Task <D22D98D7-08BE-4488-B1AF-DDBB3E879E57>.<271> finished successfully
default	09:52:31.892676-0500	RedLemon	Task <053FE5F3-D59B-4DA3-BE51-78C9A3FDD587>.<272> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:31.893203-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8A308ECD-496C-45AE-83FE-F44F9EDD43D3] (reporting strategy default)> on Task <053FE5F3-D59B-4DA3-BE51-78C9A3FDD587>.<272> was not selected for reporting
default	09:52:31.894812-0500	RedLemon	Task <053FE5F3-D59B-4DA3-BE51-78C9A3FDD587>.<272> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:31.895236-0500	RedLemon	Task <053FE5F3-D59B-4DA3-BE51-78C9A3FDD587>.<272> now using Connection 2
default	09:52:31.896795-0500	RedLemon	0x7fb19cef7508 ID=424 Task <053FE5F3-D59B-4DA3-BE51-78C9A3FDD587>.<272> sent request, body N 0
default	09:52:31.909079-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:31.942955-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> received response, status 101 content U
default	09:52:31.943361-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> response ended
default	09:52:31.943459-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> done using Connection 46
default	09:52:31.944417-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.399s
default	09:52:31.944498-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state preparing
default	09:52:31.944621-0500	RedLemon	[C46 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.399s
default	09:52:31.944874-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.399s
default	09:52:31.945010-0500	RedLemon	[C46 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.400s
default	09:52:31.945143-0500	RedLemon	nw_flow_connected [C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:31.945389-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.400s
default	09:52:31.945497-0500	RedLemon	[C46 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.400s
default	09:52:31.945710-0500	RedLemon	nw_flow_connected [C46.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:31.946280-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.401s
default	09:52:31.946356-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state ready
default	09:52:31.946475-0500	RedLemon	[C46 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.401s
default	09:52:31.955401-0500	RedLemon	0x7fb19cef7508 ID=424 Task <053FE5F3-D59B-4DA3-BE51-78C9A3FDD587>.<272> received response, status 200 content U
default	09:52:31.956353-0500	RedLemon	Task <053FE5F3-D59B-4DA3-BE51-78C9A3FDD587>.<272> response ended
default	09:52:31.957325-0500	RedLemon	Task <053FE5F3-D59B-4DA3-BE51-78C9A3FDD587>.<272> done using Connection 2
default	09:52:31.957700-0500	RedLemon	Task <053FE5F3-D59B-4DA3-BE51-78C9A3FDD587>.<272> summary for task success {transaction_duration_ms=63, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=61, response_duration_ms=2, request_bytes=524, response_bytes=844, cache_hit=true}
default	09:52:31.958195-0500	RedLemon	Task <053FE5F3-D59B-4DA3-BE51-78C9A3FDD587>.<272> finished successfully
default	09:52:31.961452-0500	RedLemon	Task <8C0DCEB0-BD6B-4F7F-97AF-806D0CCA2E29>.<273> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:31.962064-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9F07A2A4-54AD-433F-8898-B12A5EF9F021] (reporting strategy default)> on Task <8C0DCEB0-BD6B-4F7F-97AF-806D0CCA2E29>.<273> was not selected for reporting
default	09:52:31.963428-0500	RedLemon	Task <8C0DCEB0-BD6B-4F7F-97AF-806D0CCA2E29>.<273> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:31.963840-0500	RedLemon	Task <8C0DCEB0-BD6B-4F7F-97AF-806D0CCA2E29>.<273> now using Connection 2
default	09:52:31.965218-0500	RedLemon	0x7fb19b351f78 ID=428 Task <8C0DCEB0-BD6B-4F7F-97AF-806D0CCA2E29>.<273> sent request, body N 0
default	09:52:31.977068-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:32.031291-0500	RedLemon	0x7fb19b351f78 ID=428 Task <8C0DCEB0-BD6B-4F7F-97AF-806D0CCA2E29>.<273> received response, status 200 content U
default	09:52:32.032059-0500	RedLemon	Task <8C0DCEB0-BD6B-4F7F-97AF-806D0CCA2E29>.<273> response ended
default	09:52:32.032660-0500	RedLemon	Task <8C0DCEB0-BD6B-4F7F-97AF-806D0CCA2E29>.<273> done using Connection 2
default	09:52:32.032958-0500	RedLemon	Task <8C0DCEB0-BD6B-4F7F-97AF-806D0CCA2E29>.<273> summary for task success {transaction_duration_ms=70, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=68, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	09:52:32.033906-0500	RedLemon	Task <8C0DCEB0-BD6B-4F7F-97AF-806D0CCA2E29>.<273> finished successfully
default	09:52:32.037058-0500	RedLemon	🔍 Current guest participant found in polling: ursinho with ID 656DAA91-33B4-4688-9135-C982EA52D7C9
default	09:52:32.065479-0500	RedLemon	tcp_input [C46.1:3] flags=[F.] seq=2648144132, ack=411477660, win=249 state=ESTABLISHED rcv_nxt=2648144132, snd_una=411477660
default	09:52:32.065582-0500	RedLemon	nw_protocol_tcp_log_summary [C46.1:3]
	[9FDF9CE3-36D1-40C4-BF01-9BCFDD783801 <private>:51447<-><private>:443]
	Init: 1, Conn_Time: 118.423ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 126.250ms, rtt_var: 8.375ms rtt_nc: 119.750ms, rtt_var_nc: 26.437ms base rtt: 118ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	09:52:32.066658-0500	RedLemon	nw_flow_disconnected [C46.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	09:52:32.067338-0500	RedLemon	Connection 46: read-side closed
default	09:52:32.067377-0500	RedLemon	Connection 46: read-side closed
default	09:52:32.067461-0500	RedLemon	Connection 46: read-side closed
default	09:52:32.068938-0500	RedLemon	[C46.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.523s, error Socket is not connected
default	09:52:32.068991-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state failed error Socket is not connected
default	09:52:32.069060-0500	RedLemon	[C46 Hostname#11e4b683:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.524s
error	09:52:32.069125-0500	RedLemon	nw_read_request_report [C46] Receive failed with error "Socket is not connected"
error	09:52:32.069194-0500	RedLemon	nw_flow_service_reads [C46.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	09:52:32.069446-0500	RedLemon	tcp_output [C46.1:3] flags=[F.] seq=411477791, ack=2648144133, win=2048 state=LAST_ACK rcv_nxt=2648144133, snd_una=411477660
error	09:52:32.069654-0500	RedLemon	Connection 46: received failure notification
default	09:52:32.070281-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
error	09:52:32.070435-0500	RedLemon	nw_flow_add_write_request [C46.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	09:52:32.070512-0500	RedLemon	nw_write_request_report [C46] Send failed with error "Socket is not connected"
default	09:52:32.070640-0500	RedLemon	Connection 46: cleaning up
default	09:52:32.070770-0500	RedLemon	[C46 994F6AE6-D220-47F9-AB12-8124E1BA463C Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancel
default	09:52:32.070947-0500	RedLemon	[C46 994F6AE6-D220-47F9-AB12-8124E1BA463C Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancelled
	[C46.1 E2D68D3A-B7C2-4B7E-AE02-2BE9EACC0ED7 10.0.0.249:51447<->IPv4#fd2705f0:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.525s, DNS @0.000s took 0.004s, TCP @0.399s took 0.119s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	09:52:32.071034-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> summary for task success {transaction_duration_ms=526, response_status=101, connection=46, protocol="http/1.1", domain_lookup_duration_ms=4, connect_duration_ms=265, secure_connection_duration_ms=144, private_relay=false, request_start_ms=275, request_duration_ms=0, response_start_ms=399, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	09:52:32.071111-0500	RedLemon	Task <BCDFF95D-F3C9-4727-A0F2-920EE5C4DE86>.<1> finished successfully
default	09:52:32.071813-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state cancelled error Socket is not connected
default	09:52:32.071937-0500	RedLemon	Connection 46: done
error	09:52:32.188024-0500	RedLemon	tcp_input [C46.1:3] flags=[R] seq=2648144133, ack=0, win=0 state=LAST_ACK rcv_nxt=2648144133, snd_una=411477660
error	09:52:32.188455-0500	RedLemon	tcp_input [C46.1:3] flags=[R] seq=2648144133, ack=0, win=0 state=CLOSED rcv_nxt=2648144133, snd_una=411477660
error	09:52:32.188529-0500	RedLemon	tcp_input [C46.1:3] flags=[R] seq=2648144133, ack=0, win=0 state=CLOSED rcv_nxt=2648144133, snd_una=411477660
error	09:52:32.188575-0500	RedLemon	tcp_input [C46.1:3] flags=[R] seq=2648144133, ack=0, win=0 state=CLOSED rcv_nxt=2648144133, snd_una=411477660
error	09:52:32.188767-0500	RedLemon	tcp_input [C46.1:3] flags=[R] seq=2648144133, ack=0, win=0 state=CLOSED rcv_nxt=2648144133, snd_una=411477660
error	09:52:32.189198-0500	RedLemon	tcp_input [C46.1:3] flags=[R] seq=2648144133, ack=0, win=0 state=CLOSED rcv_nxt=2648144133, snd_una=411477660
error	09:52:32.189503-0500	RedLemon	tcp_input [C46.1:3] flags=[R] seq=2648144133, ack=0, win=0 state=CLOSED rcv_nxt=2648144133, snd_una=411477660
default	09:52:32.702544-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
default	09:52:32.826720-0500	runningboardd	Invalidating assertion 173-4529-1531 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:32.986857-0500	RedLemon	📥 Received Realtime message: 'LOBBY_START_COUNTDOWN' from Host in room 3PBW
default	09:52:32.987066-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	09:52:32.992528-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:33.015561-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	09:52:33.022031-0500	RedLemon	Task <D8947FA7-D7AC-479A-959F-CDD0F2C4AD80>.<274> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:32.992619-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:32.992706-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:33.023323-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [EDC44853-CB92-4263-B572-121D04CAD3F4] (reporting strategy default)> on Task <D8947FA7-D7AC-479A-959F-CDD0F2C4AD80>.<274> was not selected for reporting
default	09:52:33.024585-0500	RedLemon	Task <D8947FA7-D7AC-479A-959F-CDD0F2C4AD80>.<274> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:33.024890-0500	RedLemon	Task <D8947FA7-D7AC-479A-959F-CDD0F2C4AD80>.<274> now using Connection 2
default	09:52:33.026021-0500	RedLemon	0x7fb19c2fbe28 ID=432 Task <D8947FA7-D7AC-479A-959F-CDD0F2C4AD80>.<274> sent request, body N 0
default	09:52:33.026932-0500	runningboardd	Invalidating assertion 173-114-1532 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:33.085136-0500	RedLemon	0x7fb19c2fbe28 ID=432 Task <D8947FA7-D7AC-479A-959F-CDD0F2C4AD80>.<274> received response, status 200 content U
default	09:52:33.086714-0500	RedLemon	Task <D8947FA7-D7AC-479A-959F-CDD0F2C4AD80>.<274> response ended
default	09:52:33.087515-0500	RedLemon	Task <D8947FA7-D7AC-479A-959F-CDD0F2C4AD80>.<274> done using Connection 2
default	09:52:33.087805-0500	RedLemon	Task <D8947FA7-D7AC-479A-959F-CDD0F2C4AD80>.<274> summary for task success {transaction_duration_ms=63, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=60, response_duration_ms=3, request_bytes=500, response_bytes=959, cache_hit=true}
default	09:52:33.088583-0500	RedLemon	Task <D8947FA7-D7AC-479A-959F-CDD0F2C4AD80>.<274> finished successfully
default	09:52:33.090629-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1533 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:33.090934-0500	runningboardd	Assertion 173-4529-1533 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:33.092323-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:33.092514-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	09:52:33.092726-0500	RedLemon	🎬 Guest: Fetch took 0.077s, waiting 3.173s (includes 0.25s sync buffer)
default	09:52:33.092463-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:33.093252-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:33.096016-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1534 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:33.096240-0500	runningboardd	Assertion 173-114-1534 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:33.100788-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:33.898412-0500	RedLemon	Task <D8D4DF65-F658-4CD0-B150-F2360C7F05A9>.<275> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:33.899240-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D5642CB5-17DE-495F-9D9A-93D67DB9D55F] (reporting strategy default)> on Task <D8D4DF65-F658-4CD0-B150-F2360C7F05A9>.<275> was not selected for reporting
default	09:52:33.900091-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
default	09:52:33.900929-0500	RedLemon	Task <D8D4DF65-F658-4CD0-B150-F2360C7F05A9>.<275> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:33.901593-0500	RedLemon	Task <D8D4DF65-F658-4CD0-B150-F2360C7F05A9>.<275> now using Connection 2
default	09:52:33.904520-0500	RedLemon	0x7fb198aeb188 ID=436 Task <D8D4DF65-F658-4CD0-B150-F2360C7F05A9>.<275> sent request, body N 0
default	09:52:33.967643-0500	RedLemon	0x7fb198aeb188 ID=436 Task <D8D4DF65-F658-4CD0-B150-F2360C7F05A9>.<275> received response, status 200 content U
default	09:52:33.969360-0500	RedLemon	Task <D8D4DF65-F658-4CD0-B150-F2360C7F05A9>.<275> response ended
default	09:52:33.969932-0500	RedLemon	Task <D8D4DF65-F658-4CD0-B150-F2360C7F05A9>.<275> done using Connection 2
default	09:52:33.970243-0500	RedLemon	Task <D8D4DF65-F658-4CD0-B150-F2360C7F05A9>.<275> summary for task success {transaction_duration_ms=70, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=67, response_duration_ms=3, request_bytes=500, response_bytes=959, cache_hit=true}
default	09:52:33.970793-0500	RedLemon	Task <D8D4DF65-F658-4CD0-B150-F2360C7F05A9>.<275> finished successfully
default	09:52:33.973438-0500	RedLemon	🎬 Guest: Detected room playback start via database fallback
default	09:52:33.977193-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:33.985207-0500	RedLemon	Connection 35: cleaning up
default	09:52:33.985302-0500	RedLemon	[C35 2DFECF51-6144-407A-9789-5AD7F675BAE8 127.0.0.1:47253 tcp, url hash: cfa841c3, definite, attribution: developer] cancel
default	09:52:33.985486-0500	RedLemon	[C35 2DFECF51-6144-407A-9789-5AD7F675BAE8 127.0.0.1:47253 tcp, url hash: cfa841c3, definite, attribution: developer] cancelled
	[C35 92ABFB9A-5BCD-4D68-A03C-20AF3F9AFB0D 127.0.0.1:49785<->127.0.0.1:47253]
	Connected Path: satisfied (Path is satisfied), viable, interface: lo0
	Privacy Stance: Not Eligible
	Duration: 59.989s, TCP @0.000s took 0.001s
	bytes in/out: 237342/245, packets in/out: 15/1, rtt: 0.001s, retransmitted bytes: 0, out-of-order bytes: 0
default	09:52:33.985963-0500	RedLemon	nw_flow_disconnected [C35 127.0.0.1:47253 cancelled socket-flow ((null))] Output protocol disconnected
default	09:52:33.986083-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C35] reporting state cancelled
default	09:52:33.986284-0500	RedLemon	Connection 35: done
default	09:52:34.189776-0500	RedLemon	Task <D4486E53-D0AE-4804-89CA-46DBF70B8EEC>.<276> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:34.191214-0500	runningboardd	Invalidating assertion 173-4529-1533 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:34.190596-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A3B524B3-795C-4D70-BDCC-078368ADFF44] (reporting strategy default)> on Task <D4486E53-D0AE-4804-89CA-46DBF70B8EEC>.<276> was not selected for reporting
default	09:52:34.192327-0500	RedLemon	Task <D4486E53-D0AE-4804-89CA-46DBF70B8EEC>.<276> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:34.192749-0500	RedLemon	Task <D4486E53-D0AE-4804-89CA-46DBF70B8EEC>.<276> now using Connection 2
default	09:52:34.194575-0500	RedLemon	0x7fb19c2fbe28 ID=440 Task <D4486E53-D0AE-4804-89CA-46DBF70B8EEC>.<276> sent request, body N 0
default	09:52:34.259465-0500	RedLemon	0x7fb19c2fbe28 ID=440 Task <D4486E53-D0AE-4804-89CA-46DBF70B8EEC>.<276> received response, status 200 content U
default	09:52:34.260507-0500	RedLemon	Task <D4486E53-D0AE-4804-89CA-46DBF70B8EEC>.<276> response ended
default	09:52:34.261406-0500	RedLemon	Task <D4486E53-D0AE-4804-89CA-46DBF70B8EEC>.<276> done using Connection 2
default	09:52:34.262134-0500	RedLemon	Task <D4486E53-D0AE-4804-89CA-46DBF70B8EEC>.<276> summary for task success {transaction_duration_ms=70, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=67, response_duration_ms=2, request_bytes=511, response_bytes=839, cache_hit=false}
default	09:52:34.263041-0500	RedLemon	Task <D4486E53-D0AE-4804-89CA-46DBF70B8EEC>.<276> finished successfully
default	09:52:34.265136-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1535 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:34.266186-0500	runningboardd	Assertion 173-4529-1535 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:34.266676-0500	RedLemon	Task <E76F03F9-7D19-41D9-BB8B-A66FF145210B>.<277> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:34.267657-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0D21CF48-B68E-497F-B220-DFAB6A23EB85] (reporting strategy default)> on Task <E76F03F9-7D19-41D9-BB8B-A66FF145210B>.<277> was not selected for reporting
default	09:52:34.269882-0500	RedLemon	Task <E76F03F9-7D19-41D9-BB8B-A66FF145210B>.<277> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:34.270266-0500	RedLemon	Task <E76F03F9-7D19-41D9-BB8B-A66FF145210B>.<277> now using Connection 2
default	09:52:34.271598-0500	RedLemon	0x7fb19c2fbe28 ID=444 Task <E76F03F9-7D19-41D9-BB8B-A66FF145210B>.<277> sent request, body N 0
default	09:52:34.271758-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:34.272207-0500	runningboardd	Attempting to rename power assertion 33747 for target anon<RedLemon>(501) to anon<RedLemon>(501);173-4529-1533:com.apple.CFNetwork.StorageDB;173-4529-1535:com.apple.CFNetwork.StorageDB
default	09:52:34.272572-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:34.272620-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:34.272664-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:34.331644-0500	RedLemon	0x7fb19c2fbe28 ID=444 Task <E76F03F9-7D19-41D9-BB8B-A66FF145210B>.<277> received response, status 200 content U
default	09:52:34.332761-0500	RedLemon	Task <E76F03F9-7D19-41D9-BB8B-A66FF145210B>.<277> response ended
default	09:52:34.333693-0500	RedLemon	Task <E76F03F9-7D19-41D9-BB8B-A66FF145210B>.<277> done using Connection 2
default	09:52:34.334086-0500	RedLemon	Task <E76F03F9-7D19-41D9-BB8B-A66FF145210B>.<277> summary for task success {transaction_duration_ms=65, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=62, response_duration_ms=2, request_bytes=524, response_bytes=843, cache_hit=true}
default	09:52:34.334517-0500	RedLemon	Task <E76F03F9-7D19-41D9-BB8B-A66FF145210B>.<277> finished successfully
default	09:52:34.339426-0500	RedLemon	Task <DC0DAB2A-972A-44E0-A91C-FFC47EEF297B>.<278> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:34.340085-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [05529F5C-BED0-418E-BDC8-0CEA0D3FFCE6] (reporting strategy default)> on Task <DC0DAB2A-972A-44E0-A91C-FFC47EEF297B>.<278> was not selected for reporting
default	09:52:34.341159-0500	RedLemon	Task <DC0DAB2A-972A-44E0-A91C-FFC47EEF297B>.<278> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:34.341489-0500	RedLemon	Task <DC0DAB2A-972A-44E0-A91C-FFC47EEF297B>.<278> now using Connection 2
default	09:52:34.342541-0500	RedLemon	0x7fb19b351f78 ID=448 Task <DC0DAB2A-972A-44E0-A91C-FFC47EEF297B>.<278> sent request, body N 0
default	09:52:34.358527-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:34.368957-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:34.369051-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:34.369143-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:34.370912-0500	runningboardd	Attempting to rename power assertion 33747 for target anon<RedLemon>(501) to anon<RedLemon>(501)173-4529-1535:com.apple.CFNetwork.StorageDB
default	09:52:34.405181-0500	RedLemon	0x7fb19b351f78 ID=448 Task <DC0DAB2A-972A-44E0-A91C-FFC47EEF297B>.<278> received response, status 200 content U
default	09:52:34.405982-0500	RedLemon	Task <DC0DAB2A-972A-44E0-A91C-FFC47EEF297B>.<278> response ended
default	09:52:34.406527-0500	RedLemon	Task <DC0DAB2A-972A-44E0-A91C-FFC47EEF297B>.<278> done using Connection 2
default	09:52:34.406836-0500	RedLemon	Task <DC0DAB2A-972A-44E0-A91C-FFC47EEF297B>.<278> summary for task success {transaction_duration_ms=66, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=64, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	09:52:34.407754-0500	RedLemon	Task <DC0DAB2A-972A-44E0-A91C-FFC47EEF297B>.<278> finished successfully
default	09:52:34.410360-0500	RedLemon	🔍 Current guest participant found in polling: ursinho with ID 656DAA91-33B4-4688-9135-C982EA52D7C9
default	09:52:34.558824-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:35.368666-0500	runningboardd	Invalidating assertion 173-4529-1535 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:35.545881-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:35.546174-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:35.546531-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:35.548480-0500	runningboardd	Invalidating assertion 173-114-1534 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:35.728343-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:35.728439-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:35.728528-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:35.856154-0500	runningboardd	Assertion did invalidate due to timeout: 173-140-1528 (target:[anon<RedLemon>(501):4529])
default	09:52:35.973731-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:35.974025-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:35.974100-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:36.123168-0500	RedLemon	Task <60E0BEAF-E5F0-4CEB-B6A4-6E8FDBC6C35C>.<279> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:36.123955-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [43EBF407-8DE9-4302-B2E4-B83107D0D85F] (reporting strategy default)> on Task <60E0BEAF-E5F0-4CEB-B6A4-6E8FDBC6C35C>.<279> was not selected for reporting
default	09:52:36.125633-0500	RedLemon	Task <60E0BEAF-E5F0-4CEB-B6A4-6E8FDBC6C35C>.<279> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:36.126234-0500	RedLemon	Task <60E0BEAF-E5F0-4CEB-B6A4-6E8FDBC6C35C>.<279> now using Connection 2
default	09:52:36.128300-0500	RedLemon	0x7fb198a7e8e8 ID=452 Task <60E0BEAF-E5F0-4CEB-B6A4-6E8FDBC6C35C>.<279> sent request, body N 0
default	09:52:36.136718-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:36.137062-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1E578E90-B3AD-443A-B326-B9B9BC7FA189] (reporting strategy default)> on Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> was not selected for reporting
default	09:52:36.137805-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:36.138238-0500	RedLemon	Connection 47: enabling TLS
default	09:52:36.138281-0500	RedLemon	Connection 47: starting, TC(0x0)
default	09:52:36.138334-0500	RedLemon	[C47 EBA4EDB6-F66D-496A-AA4D-BAF1032FC90A Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{13892BD6-A566-4F48-B5CD-682B30EBD08A}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:36.138430-0500	RedLemon	[C47 Hostname#11e4b683:443 initial path ((null))] event: path:start @0.000s
default	09:52:36.138778-0500	RedLemon	[C47 Hostname#11e4b683:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 1B10E5BC-CBCF-4E74-B6DA-8E848C5FBE37
default	09:52:36.138979-0500	RedLemon	[C47 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	09:52:36.139020-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state preparing
default	09:52:36.139250-0500	mDNSResponder	[R1591] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 4529 (RedLemon)
default	09:52:36.139224-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> setting up Connection 47
default	09:52:36.140703-0500	mDNSResponder	[R1591] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 4529 (RedLemon)
default	09:52:36.140778-0500	RedLemon	nw_endpoint_resolver_update [C47 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#fd2705f0:443
default	09:52:36.140921-0500	RedLemon	[C47 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	09:52:36.141232-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 initial path ((null))] event: path:start @0.002s
default	09:52:36.141652-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: 3E003028-C7D8-4F12-BB54-6ECAF727CB1B
default	09:52:36.141805-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.003s
default	09:52:36.142477-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.004s
default	09:52:36.143105-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.004s
default	09:52:36.143260-0500	RedLemon	tcp_output [C47.1:3] flags=[S] seq=392737038, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=392737038
default	09:52:36.191164-0500	RedLemon	0x7fb198a7e8e8 ID=452 Task <60E0BEAF-E5F0-4CEB-B6A4-6E8FDBC6C35C>.<279> received response, status 200 content U
default	09:52:36.191946-0500	RedLemon	Task <60E0BEAF-E5F0-4CEB-B6A4-6E8FDBC6C35C>.<279> response ended
default	09:52:36.192573-0500	RedLemon	Task <60E0BEAF-E5F0-4CEB-B6A4-6E8FDBC6C35C>.<279> done using Connection 2
default	09:52:36.192869-0500	RedLemon	Task <60E0BEAF-E5F0-4CEB-B6A4-6E8FDBC6C35C>.<279> summary for task success {transaction_duration_ms=68, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=66, response_duration_ms=1, request_bytes=500, response_bytes=959, cache_hit=true}
default	09:52:36.195147-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1536 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:36.193805-0500	RedLemon	Task <60E0BEAF-E5F0-4CEB-B6A4-6E8FDBC6C35C>.<279> finished successfully
default	09:52:36.195697-0500	runningboardd	Assertion 173-4529-1536 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:36.200062-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:36.200304-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:36.200407-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:36.203326-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1537 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:36.203572-0500	runningboardd	Assertion 173-114-1537 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:36.205173-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:36.205224-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:36.205272-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:36.225740-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:36.267843-0500	RedLemon	tcp_input [C47.1:3] flags=[S.] seq=1480875858, ack=392737039, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=392737038
default	09:52:36.268621-0500	RedLemon	nw_flow_connected [C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:36.269145-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.130s
default	09:52:36.269572-0500	RedLemon	[C47 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.131s
default	09:52:36.270304-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C47.1:2][0x7fb198be6a00] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	09:52:36.270535-0500	RedLemon	boringssl_context_info_handler(2028) [C47.1:2][0x7fb198be6a00] Client handshake started
default	09:52:36.270930-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS client enter_early_data
default	09:52:36.271203-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS client read_server_hello
default	09:52:36.395973-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client read_hello_retry_request
default	09:52:36.396073-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client read_server_hello
default	09:52:36.396420-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	09:52:36.397272-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client read_certificate_request
default	09:52:36.398102-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client read_server_certificate
default	09:52:36.398380-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	09:52:36.400675-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C47.1:2][0x7fb198be6a00] Performing external trust evaluation
default	09:52:36.401001-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C47.1:2][0x7fb198be6a00] Asyncing for external verify block
default	09:52:36.401870-0500	RedLemon	Connection 47: asked to evaluate TLS Trust
default	09:52:36.402898-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> auth completion disp=1 cred=0x0
default	09:52:36.410949-0500	RedLemon	Connection 47: TLS Trust result 0
default	09:52:36.411004-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C47.1:2][0x7fb198be6a00] Returning from external verify block with result: true
default	09:52:36.411061-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C47.1:2][0x7fb198be6a00] Certificate verification result: OK
default	09:52:36.411397-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client read_server_finished
default	09:52:36.411672-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client send_end_of_early_data
default	09:52:36.411722-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	09:52:36.411760-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client send_client_certificate
default	09:52:36.411793-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client complete_second_flight
default	09:52:36.411923-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS 1.3 client done
default	09:52:36.412097-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS client finish_client_handshake
default	09:52:36.412164-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1:2][0x7fb198be6a00] Client handshake state: TLS client done
default	09:52:36.412242-0500	RedLemon	boringssl_context_info_handler(2034) [C47.1:2][0x7fb198be6a00] Client handshake done
default	09:52:36.412925-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C47.1:2][0x7fb198be6a00] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(142ms) flight_time(126ms) rtt(125ms) write_stalls(0) read_stalls(4)]
default	09:52:36.413239-0500	RedLemon	nw_flow_connected [C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:36.413552-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.275s
default	09:52:36.413841-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state ready
default	09:52:36.413938-0500	RedLemon	[C47 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.275s
default	09:52:36.414170-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.275s
default	09:52:36.414227-0500	RedLemon	[C47 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.275s
default	09:52:36.414758-0500	RedLemon	Connection 47: connected successfully
default	09:52:36.414820-0500	RedLemon	Connection 47: TLS handshake complete
default	09:52:36.415338-0500	RedLemon	Connection 47: ready C(N) E(N)
default	09:52:36.415648-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> now using Connection 47
default	09:52:36.415710-0500	RedLemon	🎬 Guest: Starting playback after countdown
default	09:52:36.415844-0500	RedLemon	🎬 Guest: Launching player for Frankenstein
default	09:52:36.415919-0500	RedLemon	Task <1F0DEAF2-58EA-4427-A579-9A889BB5FA72>.<280> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:36.416093-0500	RedLemon	Connection 47: received viability advisory(Y)
default	09:52:36.416094-0500	RedLemon	   Quality: 1080p
default	09:52:36.416269-0500	RedLemon	   Mode: watchParty
default	09:52:36.416382-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	09:52:36.416492-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> sent request, body N 0
default	09:52:36.417273-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5E6DBD58-7F32-49EE-8E78-6D0D51867117] (reporting strategy default)> on Task <1F0DEAF2-58EA-4427-A579-9A889BB5FA72>.<280> was not selected for reporting
default	09:52:36.418325-0500	RedLemon	Task <1F0DEAF2-58EA-4427-A579-9A889BB5FA72>.<280> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:36.418674-0500	RedLemon	Task <1F0DEAF2-58EA-4427-A579-9A889BB5FA72>.<280> now using Connection 2
default	09:52:36.419766-0500	RedLemon	0x7fb19cef7508 ID=456 Task <1F0DEAF2-58EA-4427-A579-9A889BB5FA72>.<280> sent request, body N 0
default	09:52:36.482254-0500	RedLemon	0x7fb19cef7508 ID=456 Task <1F0DEAF2-58EA-4427-A579-9A889BB5FA72>.<280> received response, status 200 content U
default	09:52:36.482846-0500	RedLemon	Task <1F0DEAF2-58EA-4427-A579-9A889BB5FA72>.<280> response ended
default	09:52:36.483355-0500	RedLemon	Task <1F0DEAF2-58EA-4427-A579-9A889BB5FA72>.<280> done using Connection 2
default	09:52:36.483824-0500	RedLemon	Task <1F0DEAF2-58EA-4427-A579-9A889BB5FA72>.<280> summary for task success {transaction_duration_ms=65, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=64, response_duration_ms=1, request_bytes=511, response_bytes=842, cache_hit=true}
default	09:52:36.484087-0500	RedLemon	Task <1F0DEAF2-58EA-4427-A579-9A889BB5FA72>.<280> finished successfully
default	09:52:36.503573-0500	RedLemon	Task <A7C06FD4-E40D-4596-98D5-6D35F99316DB>.<281> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:36.504055-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [09173365-DF15-4ED8-9E94-01D0F485DB1E] (reporting strategy default)> on Task <A7C06FD4-E40D-4596-98D5-6D35F99316DB>.<281> was not selected for reporting
default	09:52:36.504987-0500	RedLemon	Task <A7C06FD4-E40D-4596-98D5-6D35F99316DB>.<281> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:36.505326-0500	RedLemon	Task <A7C06FD4-E40D-4596-98D5-6D35F99316DB>.<281> now using Connection 2
default	09:52:36.506436-0500	RedLemon	0x7fb198aeb188 ID=460 Task <A7C06FD4-E40D-4596-98D5-6D35F99316DB>.<281> sent request, body N 0
default	09:52:36.523202-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:36.535778-0500	RedLemon	🖼️ Loading background art: https://images.metahub.space/background/medium/tt1312221/img
default	09:52:36.536087-0500	RedLemon	⏳ Background art loading...
default	09:52:36.536628-0500	RedLemon	🎨 Loading logo: https://images.metahub.space/logo/medium/tt1312221/img
default	09:52:36.536910-0500	RedLemon	⏳ Logo loading...
default	09:52:36.538007-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> received response, status 101 content U
default	09:52:36.538216-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> response ended
default	09:52:36.538273-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> done using Connection 47
default	09:52:36.538839-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.400s
default	09:52:36.538882-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state preparing
default	09:52:36.538958-0500	RedLemon	[C47 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.400s
default	09:52:36.539107-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.400s
default	09:52:36.539167-0500	RedLemon	[C47 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.400s
default	09:52:36.539246-0500	RedLemon	nw_flow_connected [C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:36.539381-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.400s
default	09:52:36.539441-0500	RedLemon	[C47 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.401s
default	09:52:36.539561-0500	RedLemon	nw_flow_connected [C47.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:36.539884-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.401s
default	09:52:36.539933-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state ready
default	09:52:36.539999-0500	RedLemon	[C47 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.401s
default	09:52:36.570888-0500	RedLemon	Task <B79EE427-6CF2-4A29-9C77-43FB6A084209>.<282> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:36.571485-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [24747EB3-790B-4D46-A610-8AAA3EDEE651] (reporting strategy default)> on Task <B79EE427-6CF2-4A29-9C77-43FB6A084209>.<282> was not selected for reporting
default	09:52:36.572309-0500	RedLemon	Task <50AEBE30-5DA8-4D79-8D63-883B887CE386>.<283> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:36.572469-0500	RedLemon	Task <B79EE427-6CF2-4A29-9C77-43FB6A084209>.<282> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:36.572675-0500	RedLemon	Task <B79EE427-6CF2-4A29-9C77-43FB6A084209>.<282> now using Connection 43
default	09:52:36.572916-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DC928D58-A754-4649-85DE-C44CE6BB8687] (reporting strategy default)> on Task <50AEBE30-5DA8-4D79-8D63-883B887CE386>.<283> was not selected for reporting
default	09:52:36.574500-0500	RedLemon	Task <50AEBE30-5DA8-4D79-8D63-883B887CE386>.<283> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:36.574722-0500	RedLemon	Task <50AEBE30-5DA8-4D79-8D63-883B887CE386>.<283> now using Connection 43
default	09:52:36.575174-0500	RedLemon	Task <B79EE427-6CF2-4A29-9C77-43FB6A084209>.<282> sent request, body N 0
default	09:52:36.575305-0500	RedLemon	Task <50AEBE30-5DA8-4D79-8D63-883B887CE386>.<283> sent request, body N 0
default	09:52:36.575660-0500	RedLemon	0x7fb198aeb188 ID=460 Task <A7C06FD4-E40D-4596-98D5-6D35F99316DB>.<281> received response, status 200 content U
default	09:52:36.576353-0500	RedLemon	Task <A7C06FD4-E40D-4596-98D5-6D35F99316DB>.<281> response ended
default	09:52:36.576913-0500	RedLemon	Task <A7C06FD4-E40D-4596-98D5-6D35F99316DB>.<281> done using Connection 2
default	09:52:36.577014-0500	RedLemon	Task <A7C06FD4-E40D-4596-98D5-6D35F99316DB>.<281> summary for task failure {transaction_duration_ms=72, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=70, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	09:52:36.577353-0500	RedLemon	Task <A7C06FD4-E40D-4596-98D5-6D35F99316DB>.<281> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	09:52:36.588637-0500	RedLemon	Task <B79EE427-6CF2-4A29-9C77-43FB6A084209>.<282> received response, status 200 content K
default	09:52:36.592573-0500	RedLemon	Task <B79EE427-6CF2-4A29-9C77-43FB6A084209>.<282> done using Connection 43
default	09:52:36.592812-0500	RedLemon	Task <B79EE427-6CF2-4A29-9C77-43FB6A084209>.<282> response ended
default	09:52:36.593575-0500	RedLemon	Task <B79EE427-6CF2-4A29-9C77-43FB6A084209>.<282> summary for task success {transaction_duration_ms=21, response_status=200, connection=43, reused=1, request_start_ms=2, request_duration_ms=1, response_start_ms=16, response_duration_ms=4, request_bytes=36, response_bytes=63076, cache_hit=false}
default	09:52:36.593780-0500	RedLemon	Task <B79EE427-6CF2-4A29-9C77-43FB6A084209>.<282> finished successfully
default	09:52:36.603679-0500	RedLemon	Task <50AEBE30-5DA8-4D79-8D63-883B887CE386>.<283> received response, status 200 content K
default	09:52:36.609036-0500	RedLemon	✅ Logo loaded successfully
default	09:52:36.609163-0500	RedLemon	Task <50AEBE30-5DA8-4D79-8D63-883B887CE386>.<283> done using Connection 43
default	09:52:36.610061-0500	RedLemon	Task <50AEBE30-5DA8-4D79-8D63-883B887CE386>.<283> response ended
default	09:52:36.611052-0500	RedLemon	Task <50AEBE30-5DA8-4D79-8D63-883B887CE386>.<283> summary for task success {transaction_duration_ms=37, response_status=200, connection=43, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=29, response_duration_ms=6, request_bytes=41, response_bytes=117927, cache_hit=false}
default	09:52:36.611198-0500	RedLemon	Task <50AEBE30-5DA8-4D79-8D63-883B887CE386>.<283> finished successfully
default	09:52:36.612334-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	09:52:36.612488-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	09:52:36.612513-0500	RedLemon	✅ Background art loaded successfully
default	09:52:36.612519-0500	RedLemon	Task <B3C6F0D8-BD75-4E3C-8E8B-F00482917841>.<284> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:36.612560-0500	RedLemon	Task <352DDF06-3DE5-4DF7-BD92-78437C339855>.<285> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:36.612613-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	09:52:36.613086-0500	RedLemon	Task <959C1A9A-9C3A-47FA-AEA4-202A9267326A>.<14> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	09:52:36.614418-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [12FF959F-011B-48C5-9BF2-A5EB92740FDB] (reporting strategy default)> on Task <B3C6F0D8-BD75-4E3C-8E8B-F00482917841>.<284> was not selected for reporting
default	09:52:36.617970-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5CAB53CA-65EB-48F9-8B62-2EA80E723BDE] (reporting strategy default)> on Task <352DDF06-3DE5-4DF7-BD92-78437C339855>.<285> was not selected for reporting
default	09:52:36.618356-0500	RedLemon	Task <B3C6F0D8-BD75-4E3C-8E8B-F00482917841>.<284> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	09:52:36.618856-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [28360129-1730-4F28-955A-E2A8B0BB87FC] (reporting strategy default)> on Task <959C1A9A-9C3A-47FA-AEA4-202A9267326A>.<14> was not selected for reporting
default	09:52:36.623747-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:36.623754-0500	RedLemon	Task <352DDF06-3DE5-4DF7-BD92-78437C339855>.<285> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	09:52:36.642999-0500	RedLemon	Connection 48: starting, TC(0x0)
default	09:52:36.643069-0500	RedLemon	[C48 9422652F-2C33-4F9E-A20C-69F06738D58D 127.0.0.1:47253 tcp, url hash: 2862eb21, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{4D5C7DF3-0881-494C-BE82-EB8B1DD23DB3}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:36.643155-0500	RedLemon	[C48 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	09:52:36.645189-0500	RedLemon	[C48 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.002s, uuid: 92ABFB9A-5BCD-4D68-A03C-20AF3F9AFB0D
default	09:52:36.646847-0500	RedLemon	[C48 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.003s
default	09:52:36.646959-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C48] reporting state preparing
default	09:52:36.647305-0500	RedLemon	Task <959C1A9A-9C3A-47FA-AEA4-202A9267326A>.<14> setting up Connection 48
default	09:52:36.651254-0500	RedLemon	nw_socket_handle_socket_event [C48:2] Socket received CONNECTED event
default	09:52:36.651406-0500	RedLemon	nw_flow_connected [C48 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	09:52:36.651464-0500	RedLemon	[C48 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.008s
default	09:52:36.651699-0500	RedLemon	nw_flow_connected [C48 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:36.652324-0500	RedLemon	[C48 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.008s
default	09:52:36.652623-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C48] reporting state ready
default	09:52:36.652709-0500	RedLemon	[C48 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.009s
default	09:52:36.652806-0500	RedLemon	Connection 48: connected successfully
default	09:52:36.652913-0500	RedLemon	Connection 48: ready C(N) E(N)
default	09:52:36.656301-0500	RedLemon	Task <959C1A9A-9C3A-47FA-AEA4-202A9267326A>.<14> now using Connection 48
default	09:52:36.656461-0500	RedLemon	Connection 48: received viability advisory(Y)
default	09:52:36.656805-0500	RedLemon	Task <959C1A9A-9C3A-47FA-AEA4-202A9267326A>.<14> sent request, body N 0
default	09:52:36.661183-0500	RedLemon	Task <568C60EF-0B0F-4C74-A728-7D837951929C>.<288> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	09:52:36.661178-0500	RedLemon	Task <2BF06739-5F18-433C-A1BA-C211898606C5>.<286> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	09:52:36.661178-0500	RedLemon	Task <C7AA3169-383A-4246-8962-BB3905EA4355>.<287> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	09:52:36.661478-0500	RedLemon	Task <D5E9EC77-EC57-4748-AFC8-92A418E1E37A>.<289> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	09:52:36.662812-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2A71F1A8-3464-4859-AD6E-C6957F90FED0] (reporting strategy default)> on Task <2BF06739-5F18-433C-A1BA-C211898606C5>.<286> was not selected for reporting
default	09:52:36.663307-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2F9CCC14-00D4-4346-B388-70A1FC3BE65E] (reporting strategy default)> on Task <C7AA3169-383A-4246-8962-BB3905EA4355>.<287> was not selected for reporting
default	09:52:36.667283-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [34D18057-0D61-4BD3-8C5E-C8C53749684F] (reporting strategy default)> on Task <D5E9EC77-EC57-4748-AFC8-92A418E1E37A>.<289> was not selected for reporting
default	09:52:36.669018-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C7B3602D-BF6A-461A-A13C-BF801571AEE8] (reporting strategy default)> on Task <568C60EF-0B0F-4C74-A728-7D837951929C>.<288> was not selected for reporting
default	09:52:36.672038-0500	RedLemon	nw_flow_disconnected [C47.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	09:52:36.673629-0500	RedLemon	nw_protocol_tcp_log_summary [C47.1:3]
	[B52617F9-24B4-4FF0-83AF-B457E57ED5BA <private>:51448<-><private>:443]
	Init: 1, Conn_Time: 125.040ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 128.718ms, rtt_var: 6.312ms rtt_nc: 125.656ms, rtt_var_nc: 28.187ms base rtt: 124ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	09:52:36.674058-0500	RedLemon	tcp_input [C47.1:3] flags=[FP.] seq=1480878865, ack=392738094, win=249 state=ESTABLISHED rcv_nxt=1480878865, snd_una=392738094
default	09:52:36.675820-0500	RedLemon	[C47.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.537s, error Socket is not connected
default	09:52:36.676237-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state failed error Socket is not connected
default	09:52:36.676351-0500	RedLemon	[C47 Hostname#11e4b683:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.537s
error	09:52:36.676419-0500	RedLemon	tcp_output [C47.1:3] flags=[R.] seq=392738225, ack=1480878890, win=2047 state=CLOSED rcv_nxt=1480878890, snd_una=392738094
error	09:52:36.676820-0500	RedLemon	Connection 47: received failure notification
default	09:52:36.678447-0500	RedLemon	Task <D5E9EC77-EC57-4748-AFC8-92A418E1E37A>.<289> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:36.678775-0500	RedLemon	Task <D5E9EC77-EC57-4748-AFC8-92A418E1E37A>.<289> now using Connection 19
default	09:52:36.679208-0500	RedLemon	Task <D5E9EC77-EC57-4748-AFC8-92A418E1E37A>.<289> sent request, body N 0
default	09:52:36.686115-0500	RedLemon	⚠️ Lobby: Failed to poll room state: Error Domain=NSURLErrorDomain Code=-999 "cancelled" UserInfo={NSErrorFailingURLStringKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/rooms?id=eq.3PBW&select=*, NSErrorFailingURLKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/rooms?id=eq.3PBW&select=*, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <B3C6F0D8-BD75-4E3C-8E8B-F00482917841>.<284>"
), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <B3C6F0D8-BD75-4E3C-8E8B-F00482917841>.<284>, NSLocalizedDescription=cancelled}
default	09:52:36.687958-0500	RedLemon	👋 ursinho left room
default	09:52:36.688235-0500	RedLemon	👋 lemontom left room
error	09:52:36.689245-0500	RedLemon	nw_read_request_report [C47] Receive failed with error "Socket is not connected"
error	09:52:36.689459-0500	RedLemon	nw_flow_service_reads [C47.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	09:52:36.689785-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> summary for task success {transaction_duration_ms=552, response_status=101, connection=47, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=271, secure_connection_duration_ms=142, private_relay=false, request_start_ms=278, request_duration_ms=0, response_start_ms=400, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	09:52:36.689857-0500	RedLemon	Task <5DEA1CA3-AB56-49AD-B1CD-0CBA3EF091CF>.<1> finished successfully
error	09:52:36.689887-0500	RedLemon	nw_flow_add_write_request [C47.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	09:52:36.689944-0500	RedLemon	nw_write_request_report [C47] Send failed with error "Socket is not connected"
default	09:52:36.689999-0500	RedLemon	Connection 47: cleaning up
default	09:52:36.690118-0500	RedLemon	[C47 EBA4EDB6-F66D-496A-AA4D-BAF1032FC90A Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancel
default	09:52:36.690618-0500	RedLemon	[C47 EBA4EDB6-F66D-496A-AA4D-BAF1032FC90A Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancelled
	[C47.1 3E003028-C7D8-4F12-BB54-6ECAF727CB1B 10.0.0.249:51448<->IPv4#fd2705f0:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.552s, DNS @0.000s took 0.002s, TCP @0.400s took 0.126s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	09:52:36.691381-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state cancelled error Socket is not connected
default	09:52:36.691530-0500	RedLemon	Connection 47: done
default	09:52:36.698951-0500	RedLemon	Task <2BF06739-5F18-433C-A1BA-C211898606C5>.<286> summary for task success {transaction_duration_ms=29, response_status=200, cache_hit=true}
default	09:52:36.699208-0500	RedLemon	Task <2BF06739-5F18-433C-A1BA-C211898606C5>.<286> finished successfully
default	09:52:36.699342-0500	RedLemon	Task <C7AA3169-383A-4246-8962-BB3905EA4355>.<287> summary for task success {transaction_duration_ms=27, response_status=200, cache_hit=true}
default	09:52:36.699539-0500	RedLemon	Task <C7AA3169-383A-4246-8962-BB3905EA4355>.<287> finished successfully
default	09:52:36.699702-0500	RedLemon	Task <568C60EF-0B0F-4C74-A728-7D837951929C>.<288> summary for task success {transaction_duration_ms=24, response_status=200, cache_hit=true}
default	09:52:36.700753-0500	RedLemon	Task <568C60EF-0B0F-4C74-A728-7D837951929C>.<288> finished successfully
default	09:52:36.859343-0500	RedLemon	Task <D5E9EC77-EC57-4748-AFC8-92A418E1E37A>.<289> received response, status 200 content U
default	09:52:37.085289-0500	RedLemon	Task <D5E9EC77-EC57-4748-AFC8-92A418E1E37A>.<289> done using Connection 19
default	09:52:37.085627-0500	RedLemon	Task <D5E9EC77-EC57-4748-AFC8-92A418E1E37A>.<289> response ended
default	09:52:37.085894-0500	RedLemon	Task <D5E9EC77-EC57-4748-AFC8-92A418E1E37A>.<289> summary for task success {transaction_duration_ms=411, response_status=200, connection=19, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=185, response_duration_ms=226, request_bytes=483, response_bytes=6870, cache_hit=true}
default	09:52:37.086309-0500	RedLemon	Task <D5E9EC77-EC57-4748-AFC8-92A418E1E37A>.<289> finished successfully
default	09:52:37.102130-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 207
default	09:52:37.102380-0500	RedLemon	   INPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	09:52:37.102719-0500	RedLemon	   INPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean
default	09:52:37.102945-0500	RedLemon	   INPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean
default	09:52:37.103130-0500	RedLemon	   INPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	09:52:37.103301-0500	RedLemon	   INPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	09:52:37.103470-0500	RedLemon	   INPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	09:52:37.103637-0500	RedLemon	   INPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	09:52:37.103801-0500	RedLemon	   INPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	09:52:37.103967-0500	RedLemon	   INPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	09:52:37.104135-0500	RedLemon	   INPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean
default	09:52:37.104305-0500	RedLemon	   INPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	09:52:37.104470-0500	RedLemon	   INPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	09:52:37.104630-0500	RedLemon	   INPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean
default	09:52:37.104796-0500	RedLemon	   INPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	09:52:37.104957-0500	RedLemon	   INPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	09:52:37.105118-0500	RedLemon	   INPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean
default	09:52:37.105278-0500	RedLemon	   INPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	09:52:37.105439-0500	RedLemon	   INPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	09:52:37.105602-0500	RedLemon	   INPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	09:52:37.105763-0500	RedLemon	   INPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	09:52:37.105925-0500	RedLemon	   INPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	09:52:37.106086-0500	RedLemon	   INPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	09:52:37.106437-0500	RedLemon	   INPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	09:52:37.106636-0500	RedLemon	   INPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	09:52:37.106856-0500	RedLemon	   INPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	09:52:37.107060-0500	RedLemon	   INPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean
default	09:52:37.108210-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	09:52:37.108407-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	09:52:37.108558-0500	RedLemon	   INPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	09:52:37.108951-0500	RedLemon	   INPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	09:52:37.109107-0500	RedLemon	   INPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	09:52:37.109260-0500	RedLemon	   INPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	09:52:37.109426-0500	RedLemon	   INPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	09:52:37.109576-0500	RedLemon	   INPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	09:52:37.109728-0500	RedLemon	   INPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	09:52:37.109879-0500	RedLemon	   INPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	09:52:37.112165-0500	RedLemon	   INPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	09:52:37.112457-0500	RedLemon	   INPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	09:52:37.112637-0500	RedLemon	   INPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	09:52:37.112803-0500	RedLemon	   INPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	09:52:37.113116-0500	RedLemon	   INPUT[40]: FRANKENSTEIN mkv | Unknown | zilean
default	09:52:37.113261-0500	RedLemon	   INPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	09:52:37.113400-0500	RedLemon	   INPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	09:52:37.113555-0500	RedLemon	   INPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	09:52:37.113702-0500	RedLemon	   INPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	09:52:37.114670-0500	RedLemon	   INPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	09:52:37.114850-0500	RedLemon	   INPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	09:52:37.114958-0500	RedLemon	   INPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	09:52:37.115048-0500	RedLemon	   INPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	09:52:37.115955-0500	RedLemon	   INPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	09:52:37.116844-0500	RedLemon	   INPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	09:52:37.117069-0500	RedLemon	   INPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	09:52:37.117228-0500	RedLemon	   INPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	09:52:37.117381-0500	RedLemon	   INPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	09:52:37.117527-0500	RedLemon	   INPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	09:52:37.117671-0500	RedLemon	   INPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	09:52:37.118370-0500	RedLemon	   INPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	09:52:37.119322-0500	RedLemon	   INPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	09:52:37.119497-0500	RedLemon	   INPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	09:52:37.119712-0500	RedLemon	   INPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	09:52:37.119862-0500	RedLemon	   INPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	09:52:37.120007-0500	RedLemon	   INPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	09:52:37.120151-0500	RedLemon	   INPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	09:52:37.120307-0500	RedLemon	   INPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	09:52:37.120454-0500	RedLemon	   INPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	09:52:37.120862-0500	RedLemon	   INPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	09:52:37.126049-0500	RedLemon	   INPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	09:52:37.126243-0500	RedLemon	   INPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	09:52:37.126983-0500	RedLemon	   INPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	09:52:37.127204-0500	RedLemon	   INPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	09:52:37.127331-0500	RedLemon	   INPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	09:52:37.127420-0500	RedLemon	   INPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	09:52:37.127502-0500	RedLemon	   INPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	09:52:37.129055-0500	RedLemon	   INPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
default	09:52:37.129303-0500	RedLemon	   INPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	09:52:37.129475-0500	RedLemon	   INPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	09:52:37.129663-0500	RedLemon	   INPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	09:52:37.129832-0500	RedLemon	   INPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	09:52:37.129981-0500	RedLemon	   INPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	09:52:37.130130-0500	RedLemon	   INPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	09:52:37.130276-0500	RedLemon	   INPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	09:52:37.130408-0500	RedLemon	   INPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	09:52:37.135540-0500	RedLemon	   INPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	09:52:37.135799-0500	RedLemon	   INPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	09:52:37.135972-0500	RedLemon	   INPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
default	09:52:37.136105-0500	RedLemon	   INPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	09:52:37.141602-0500	RedLemon	   INPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	09:52:37.143296-0500	RedLemon	   INPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	09:52:37.143590-0500	RedLemon	   INPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	09:52:37.143733-0500	RedLemon	   INPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	09:52:37.145086-0500	RedLemon	   INPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	09:52:37.145229-0500	RedLemon	   INPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.145356-0500	RedLemon	   INPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	09:52:37.145473-0500	RedLemon	   INPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.145747-0500	RedLemon	   INPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	09:52:37.145884-0500	RedLemon	   INPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	09:52:37.146013-0500	RedLemon	   INPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.146142-0500	RedLemon	   INPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.146253-0500	RedLemon	   INPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.146373-0500	RedLemon	   INPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	09:52:37.146480-0500	RedLemon	   INPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	09:52:37.146670-0500	RedLemon	   INPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	09:52:37.146789-0500	RedLemon	   INPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.146938-0500	RedLemon	   INPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	09:52:37.147046-0500	RedLemon	   INPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.147157-0500	RedLemon	   INPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.147269-0500	RedLemon	   INPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.147607-0500	RedLemon	   INPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	09:52:37.147783-0500	RedLemon	   INPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	09:52:37.147918-0500	RedLemon	   INPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	09:52:37.148036-0500	RedLemon	   INPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	09:52:37.148174-0500	RedLemon	   INPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.148297-0500	RedLemon	   INPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	09:52:37.148422-0500	RedLemon	   INPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.148538-0500	RedLemon	   INPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	09:52:37.148659-0500	RedLemon	   INPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	09:52:37.162664-0500	RedLemon	   INPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	09:52:37.163748-0500	RedLemon	   INPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	09:52:37.163883-0500	RedLemon	   INPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	09:52:37.164014-0500	RedLemon	   INPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.164294-0500	RedLemon	   INPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	09:52:37.165047-0500	RedLemon	   INPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.165210-0500	RedLemon	   INPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.165330-0500	RedLemon	   INPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.165443-0500	RedLemon	   INPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	09:52:37.165556-0500	RedLemon	   INPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.165664-0500	RedLemon	   INPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.171875-0500	RedLemon	   INPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	09:52:37.172274-0500	RedLemon	   INPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	09:52:37.172996-0500	RedLemon	   INPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	09:52:37.173156-0500	RedLemon	   INPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	09:52:37.192002-0500	RedLemon	   INPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	09:52:37.192455-0500	RedLemon	   INPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	09:52:37.192610-0500	RedLemon	   INPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	09:52:37.192739-0500	RedLemon	   INPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	09:52:37.192861-0500	RedLemon	   INPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	09:52:37.193042-0500	RedLemon	   INPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	09:52:37.194330-0500	RedLemon	   INPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	09:52:37.194500-0500	RedLemon	   INPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	09:52:37.194641-0500	RedLemon	   INPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.194772-0500	RedLemon	   INPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	09:52:37.196477-0500	RedLemon	   INPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	09:52:37.197931-0500	RedLemon	   INPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	09:52:37.206914-0500	RedLemon	   INPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	09:52:37.207413-0500	RedLemon	   INPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	09:52:37.207958-0500	RedLemon	   INPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	09:52:37.208476-0500	RedLemon	   INPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	09:52:37.208755-0500	RedLemon	   INPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	09:52:37.209032-0500	RedLemon	   INPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	09:52:37.209281-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.209453-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.209578-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.209693-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.209805-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.209908-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.210068-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.210351-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.210628-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.210839-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.210953-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.211690-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.211903-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.212217-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.212578-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.212816-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.213186-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.213341-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.213619-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.213766-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.214170-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.214332-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.214751-0500	RedLemon	🎬 Guest: Starting playback after database fallback detection
default	09:52:37.214910-0500	RedLemon	🎬 Guest: Launching player via database fallback
default	09:52:37.215182-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	09:52:37.215703-0500	RedLemon	   Quality: 1080p
default	09:52:37.216178-0500	RedLemon	   Mode: watchParty
default	09:52:37.214502-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.217108-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.217247-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	09:52:37.217482-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.218163-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.218852-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.219968-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.221556-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.223035-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.223650-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.224033-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.224531-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.225312-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.225574-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.225945-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.226701-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.226926-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.227370-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.227766-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.229496-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.229950-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.230499-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.231237-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.231791-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.232495-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.233866-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.234869-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.235002-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 720p | 720p | comet
default	09:52:37.235742-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 720p | 720p | comet
default	09:52:37.235958-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	09:52:37.236282-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 480p | 480p | comet
default	09:52:37.236867-0500	RedLemon	   INPUT[201]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.237169-0500	RedLemon	   INPUT[202]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.237698-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.237890-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.238154-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.238419-0500	RedLemon	   INPUT[206]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.238903-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	09:52:37.239474-0500	RedLemon	Task <48EB5145-B099-44EF-8B63-2980506852AF>.<290> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	09:52:37.242753-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9ED47C8A-CBBD-4CCB-A66C-990880464DE3] (reporting strategy default)> on Task <48EB5145-B099-44EF-8B63-2980506852AF>.<290> was not selected for reporting
default	09:52:37.244702-0500	RedLemon	Task <48EB5145-B099-44EF-8B63-2980506852AF>.<290> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:37.245007-0500	RedLemon	Task <48EB5145-B099-44EF-8B63-2980506852AF>.<290> now using Connection 20
default	09:52:37.247005-0500	RedLemon	0x7fb19bbd76b8 ID=8 Task <48EB5145-B099-44EF-8B63-2980506852AF>.<290> sent request, body N 0
default	09:52:37.254441-0500	runningboardd	Invalidating assertion 173-4529-1536 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:37.359076-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	09:52:37.359397-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	09:52:37.359745-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	09:52:37.360286-0500	RedLemon	Task <26B3ABC7-A99C-47F7-AA47-E0E997428C40>.<15> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	09:52:37.361104-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [78A0B175-F542-4E1D-AF06-21F217E73C75] (reporting strategy default)> on Task <26B3ABC7-A99C-47F7-AA47-E0E997428C40>.<15> was not selected for reporting
default	09:52:37.362291-0500	RedLemon	Connection 49: starting, TC(0x0)
default	09:52:37.362385-0500	RedLemon	[C49 21D35904-FA42-435D-9088-C9CAA20C08DE 127.0.0.1:47253 tcp, url hash: 2862eb21, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{4D5C7DF3-0881-494C-BE82-EB8B1DD23DB3}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:37.362453-0500	RedLemon	[C49 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	09:52:37.362561-0500	RedLemon	[C49 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.000s, uuid: 92ABFB9A-5BCD-4D68-A03C-20AF3F9AFB0D
default	09:52:37.363004-0500	RedLemon	[C49 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.000s
default	09:52:37.363028-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state preparing
default	09:52:37.363205-0500	RedLemon	Task <26B3ABC7-A99C-47F7-AA47-E0E997428C40>.<15> setting up Connection 49
default	09:52:37.363804-0500	RedLemon	nw_socket_handle_socket_event [C49:2] Socket received CONNECTED event
default	09:52:37.363933-0500	RedLemon	nw_flow_connected [C49 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	09:52:37.363998-0500	RedLemon	[C49 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.001s
default	09:52:37.364310-0500	RedLemon	nw_flow_connected [C49 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:37.364532-0500	RedLemon	[C49 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.002s
default	09:52:37.364883-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state ready
default	09:52:37.364985-0500	RedLemon	[C49 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.002s
default	09:52:37.365102-0500	RedLemon	Connection 49: connected successfully
default	09:52:37.365247-0500	RedLemon	Connection 49: ready C(N) E(N)
default	09:52:37.365566-0500	RedLemon	Task <26B3ABC7-A99C-47F7-AA47-E0E997428C40>.<15> now using Connection 49
default	09:52:37.365674-0500	RedLemon	Connection 49: received viability advisory(Y)
default	09:52:37.365950-0500	RedLemon	Task <26B3ABC7-A99C-47F7-AA47-E0E997428C40>.<15> sent request, body N 0
default	09:52:37.377465-0500	RedLemon	Task <7AA13D7A-560B-4646-A62D-AB09ABDB4BB7>.<291> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	09:52:37.377618-0500	RedLemon	Task <EA1B9752-8AFE-4CAD-AF9C-6DE4AA18FDD9>.<292> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	09:52:37.378477-0500	RedLemon	Task <869BDD7B-622C-43E3-B27A-A1715A0B72F3>.<293> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	09:52:37.379276-0500	RedLemon	Task <DAC1E774-4E75-4361-BAE1-B8939E1847A0>.<294> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	09:52:37.380975-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B5E30346-79BA-41CA-9638-59ED6246ED37] (reporting strategy default)> on Task <7AA13D7A-560B-4646-A62D-AB09ABDB4BB7>.<291> was not selected for reporting
default	09:52:37.387310-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [685FCCE6-1DA8-422C-B754-9C685AEBB544] (reporting strategy default)> on Task <869BDD7B-622C-43E3-B27A-A1715A0B72F3>.<293> was not selected for reporting
default	09:52:37.387541-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4413F157-A1C4-4E4B-A554-088C5208BAC9] (reporting strategy default)> on Task <DAC1E774-4E75-4361-BAE1-B8939E1847A0>.<294> was not selected for reporting
default	09:52:37.388048-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [82E70E25-93AD-4D2B-920E-C8FEA34118A2] (reporting strategy default)> on Task <EA1B9752-8AFE-4CAD-AF9C-6DE4AA18FDD9>.<292> was not selected for reporting
default	09:52:37.394525-0500	RedLemon	Task <869BDD7B-622C-43E3-B27A-A1715A0B72F3>.<293> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:37.394833-0500	RedLemon	Task <869BDD7B-622C-43E3-B27A-A1715A0B72F3>.<293> now using Connection 19
default	09:52:37.395498-0500	RedLemon	Task <869BDD7B-622C-43E3-B27A-A1715A0B72F3>.<293> sent request, body N 0
default	09:52:37.396069-0500	RedLemon	Task <7AA13D7A-560B-4646-A62D-AB09ABDB4BB7>.<291> summary for task success {transaction_duration_ms=7, response_status=200, cache_hit=true}
default	09:52:37.396327-0500	RedLemon	Task <7AA13D7A-560B-4646-A62D-AB09ABDB4BB7>.<291> finished successfully
default	09:52:37.396450-0500	RedLemon	Task <DAC1E774-4E75-4361-BAE1-B8939E1847A0>.<294> summary for task success {transaction_duration_ms=4, response_status=200, cache_hit=true}
default	09:52:37.403791-0500	RedLemon	Task <DAC1E774-4E75-4361-BAE1-B8939E1847A0>.<294> finished successfully
default	09:52:37.404474-0500	RedLemon	Task <EA1B9752-8AFE-4CAD-AF9C-6DE4AA18FDD9>.<292> summary for task success {transaction_duration_ms=11, response_status=200, cache_hit=true}
default	09:52:37.404830-0500	RedLemon	Task <EA1B9752-8AFE-4CAD-AF9C-6DE4AA18FDD9>.<292> finished successfully
default	09:52:37.405597-0500	RedLemon	0x7fb19bbd76b8 ID=8 Task <48EB5145-B099-44EF-8B63-2980506852AF>.<290> received response, status 200 content K
default	09:52:37.407092-0500	RedLemon	Task <48EB5145-B099-44EF-8B63-2980506852AF>.<290> response ended
default	09:52:37.408632-0500	RedLemon	Task <48EB5145-B099-44EF-8B63-2980506852AF>.<290> done using Connection 20
default	09:52:37.417033-0500	RedLemon	Task <48EB5145-B099-44EF-8B63-2980506852AF>.<290> summary for task success {transaction_duration_ms=173, response_status=200, connection=20, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=162, response_duration_ms=3, request_bytes=166, response_bytes=1383, cache_hit=true}
default	09:52:37.417681-0500	RedLemon	Task <48EB5145-B099-44EF-8B63-2980506852AF>.<290> finished successfully
default	09:52:37.422574-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	09:52:37.422836-0500	RedLemon	✅ Filtered to 4 English subtitles
default	09:52:37.423131-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	09:52:37.424755-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	09:52:37.425147-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.425314-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.425438-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.425736-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.425914-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.426062-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.426611-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.427141-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.427584-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.427884-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.428946-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.429132-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.429286-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.437839-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.438504-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.438877-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.439032-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.439325-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.439461-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.439588-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.439905-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.440061-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.440917-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.441214-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.441348-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.441631-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.441780-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.447412-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.456413-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.459585-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.459754-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.460864-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.461215-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.461741-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.461899-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.462177-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.462796-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.462979-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.463498-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.463706-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.464900-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.465224-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.465347-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.467967-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.468135-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.468718-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.468952-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.469621-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.469780-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.470684-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.470978-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.472217-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.473165-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.474081-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.474505-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.474930-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.476711-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.477293-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.478138-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.478662-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.479748-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.480031-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.480739-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.480937-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.481520-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.481925-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.482100-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.482450-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.482769-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.482922-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.483270-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.484019-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.485253-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.485680-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.485843-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.486356-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.486567-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.487420-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.487685-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.488765-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.489002-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.489943-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.490513-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.490863-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.491419-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.491574-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.492073-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.492242-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.492706-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.493149-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.493645-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.493796-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.494777-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.494976-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.495481-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.495871-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.496565-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.497153-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.497493-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.498212-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.498481-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.499102-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.499435-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.501841-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.502635-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.503032-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.503237-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.503834-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.504025-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.504570-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.505223-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.507992-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.508533-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.509340-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.509792-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.510102-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.510593-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.510900-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.511064-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.511578-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.512006-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.512547-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.513027-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.513597-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.514704-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.515161-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.515357-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.515841-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.516063-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.516501-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.517481-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.517699-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.518137-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.518367-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.519900-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.520076-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.521521-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.522038-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.522880-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.523391-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.524451-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.524914-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.525422-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.525665-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.526019-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.526618-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.526978-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.527529-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.527729-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.528268-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.528724-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.529213-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.530304-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.530534-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.531325-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.531759-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.532234-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.532684-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.534701-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.534868-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:37.535458-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.536050-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.536417-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.537040-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.537420-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.537801-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.538012-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.538281-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.534929-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:37.538706-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.538868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.539015-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.539916-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.539988-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:37.540518-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.541342-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.541753-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.542239-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.542439-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.542817-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.543354-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.543605-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.544544-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.544982-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.545196-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.545762-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.546161-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.547194-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.549146-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.549364-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.550813-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.551158-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.551980-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.554368-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.554593-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.555397-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.555814-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.556890-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.557142-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.557658-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.558327-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.558939-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.559545-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.560194-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.560395-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.560650-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.561209-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.561391-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.561760-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.562696-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.563179-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.563838-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.564081-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.564790-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.565005-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.568909-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.574594-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.575773-0500	RedLemon	Task <869BDD7B-622C-43E3-B27A-A1715A0B72F3>.<293> received response, status 200 content U
default	09:52:37.575862-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.576029-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.577183-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.579891-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.580108-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.580979-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.581181-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.586366-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.587089-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.589539-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.590169-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.590610-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.591697-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.592504-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.593198-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.593389-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.594068-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.594533-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.595056-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.595225-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.596223-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.596524-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.597237-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.597560-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.597332-0500	runningboardd	Invalidating assertion 173-114-1537 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:37.598762-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.599572-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.599788-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.603041-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.603308-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.604646-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.605607-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.606276-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.607134-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.607603-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.607777-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.608587-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.607485-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1538 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:37.608757-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.608907-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.609932-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.610433-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.610965-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.611556-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.612195-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.612284-0500	runningboardd	Assertion 173-4529-1538 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:37.612365-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.613183-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.613382-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.613954-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.614954-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.615330-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.615828-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.616254-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.616693-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.617171-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.617378-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.617883-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.618244-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.618704-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.621396-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.622889-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.623121-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.623691-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.623856-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.625001-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.625411-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.625859-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:37.625966-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.625912-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:37.626162-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.625961-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:37.627015-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.627219-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.627366-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.629668-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.630495-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.631899-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.633097-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.634927-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.635926-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.636389-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.636765-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.638031-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.638346-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.638976-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.639846-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.640058-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.640649-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.640981-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.641292-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.642000-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.642882-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.643085-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.644182-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.644401-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.645303-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.645461-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.646533-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.647197-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.647941-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.649563-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.651941-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.654247-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.654989-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.656507-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.657413-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.658309-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.658586-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.659405-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.659610-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.660515-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.661494-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.662321-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.662579-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1539 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:37.662805-0500	runningboardd	Assertion 173-114-1539 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:37.663254-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.664108-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.664539-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.666855-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.668440-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.669552-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.670703-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.670895-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.671066-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.672581-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.673306-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.674009-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.675169-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.675719-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.676400-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.676577-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.677216-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.677691-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.678541-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.679219-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.679361-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.679800-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.680541-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.681387-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.681591-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.682063-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.682245-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.682595-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.683176-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.683449-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.684623-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.685322-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.685790-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.685970-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.686685-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.687293-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.687473-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.687866-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.688386-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.688785-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.689954-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.690241-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.690689-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.691580-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.691781-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.691951-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.692495-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.692696-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.694891-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.695137-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.695292-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.695669-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.695832-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.696439-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.696901-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.697598-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.698440-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.698636-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.699037-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.699204-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.699585-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.699807-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.700233-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.700411-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.700788-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.700957-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.701369-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.701585-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.702039-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.702217-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.702673-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.702931-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.704066-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.704397-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.704989-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.705188-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.705408-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.706305-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.706420-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.706500-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.706698-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.707312-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.707685-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.707807-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.708007-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.708091-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.708257-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.708357-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.708550-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.709726-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.710119-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.710647-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.711011-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.711535-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.711683-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.712124-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.712287-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.712728-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.712925-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.713273-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.713439-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.713566-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.713897-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.714207-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.714417-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.714783-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.714952-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.715249-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.715405-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.715532-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.716321-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.716489-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.716619-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.716948-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.717113-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.717411-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.718118-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.718492-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.718636-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.718761-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.719150-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.719348-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.719688-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.719855-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.719980-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.720295-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.720438-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.720613-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.721497-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.721687-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.722373-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.723063-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.723337-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.723731-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.723895-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.724209-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.724618-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.724808-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.725131-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.725295-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.725425-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.725996-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.726159-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.726290-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.726857-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.727082-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.729846-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.729979-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.730067-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.731086-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.731276-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.733104-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.733639-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.733863-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.734251-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.734447-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.734596-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.734956-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.735137-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.736665-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.737271-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.738599-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.739253-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.739448-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.740200-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.740504-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.740603-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.740680-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.740856-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.740957-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.741195-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.742181-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.742312-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.742748-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.742897-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.743029-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.745058-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.745207-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.745462-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.745552-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.745619-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.745832-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.745912-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.746036-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.746565-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.746670-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.747044-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.747220-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.747344-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.748311-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.748465-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.748591-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.748907-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.749073-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.750199-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.750396-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.750536-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.751332-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.751523-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.751674-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.752489-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.752638-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.752837-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.752926-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.752990-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.753192-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.753696-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.753874-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.754237-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.754410-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.754817-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.754981-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.755721-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.756298-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.756413-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.756493-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.757349-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.757549-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.757900-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.758061-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.758250-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.758961-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.759191-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.759350-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.759751-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.759954-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.762701-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.762901-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.763056-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.763401-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.763557-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.764158-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.764466-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.764575-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.767225-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.768906-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.770222-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.770467-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.771189-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.771532-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.772456-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.772808-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.772911-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.773128-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.773257-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.773350-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.774190-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.774339-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.775492-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.775731-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.776438-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.777267-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.777470-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.778143-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.778304-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.779726-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.779973-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.780416-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.780621-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.782228-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.782356-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.782573-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.782665-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.783240-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.783457-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.784343-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.784499-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.785485-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.785675-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.786130-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.786458-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.786650-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.787098-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.787252-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.787679-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.789479-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.789658-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.790060-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.790368-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.790474-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.792274-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.792572-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.792751-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.793647-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.793837-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.794363-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.794553-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.794962-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.795175-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.795334-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.797116-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.797307-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.797806-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.801085-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.801796-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.803729-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.804431-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.804991-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.806539-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.806740-0500	RedLemon	Task <869BDD7B-622C-43E3-B27A-A1715A0B72F3>.<293> done using Connection 19
default	09:52:37.806948-0500	RedLemon	Task <869BDD7B-622C-43E3-B27A-A1715A0B72F3>.<293> response ended
default	09:52:37.807188-0500	RedLemon	Task <869BDD7B-622C-43E3-B27A-A1715A0B72F3>.<293> summary for task success {transaction_duration_ms=415, response_status=200, connection=19, reused=1, request_start_ms=3, request_duration_ms=0, response_start_ms=184, response_duration_ms=231, request_bytes=483, response_bytes=6811, cache_hit=true}
default	09:52:37.807416-0500	RedLemon	Task <869BDD7B-622C-43E3-B27A-A1715A0B72F3>.<293> finished successfully
default	09:52:37.806771-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.808228-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.808388-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.810750-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.811182-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.814702-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.815145-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.815300-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.815718-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.816082-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.816320-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.816683-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.816844-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.816962-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.818164-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.819173-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.819833-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.820022-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.820363-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.820537-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.820868-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.821177-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.821325-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.821460-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.821793-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.821954-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.822807-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.823045-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.823175-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.823499-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.823658-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.823801-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.824214-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.824915-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.825402-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.826092-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.826302-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.826711-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.827079-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.827472-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.827686-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.828530-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.828746-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.828866-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.829279-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.829435-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.829567-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.829935-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.830168-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.830322-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.830681-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 207
default	09:52:37.831037-0500	RedLemon	   INPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	09:52:37.831892-0500	RedLemon	   INPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean
default	09:52:37.832050-0500	RedLemon	   INPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean
default	09:52:37.830959-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.833496-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.833646-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.834145-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.834333-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.834819-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.835176-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.835375-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.836260-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.832153-0500	RedLemon	   INPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	09:52:37.836481-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.836524-0500	RedLemon	   INPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	09:52:37.836927-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.837001-0500	RedLemon	   INPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	09:52:37.837080-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.837163-0500	RedLemon	   INPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	09:52:37.837205-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.837315-0500	RedLemon	   INPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	09:52:37.837470-0500	RedLemon	   INPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	09:52:37.837572-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.837651-0500	RedLemon	   INPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean
default	09:52:37.837788-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.837872-0500	RedLemon	   INPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	09:52:37.837944-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.838113-0500	RedLemon	   INPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	09:52:37.838298-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.838392-0500	RedLemon	   INPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean
default	09:52:37.838462-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.838598-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.838704-0500	RedLemon	   INPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	09:52:37.838871-0500	RedLemon	   INPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	09:52:37.838980-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.839040-0500	RedLemon	   INPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean
default	09:52:37.839139-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.839188-0500	RedLemon	   INPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	09:52:37.839332-0500	RedLemon	   INPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	09:52:37.839600-0500	RedLemon	   INPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	09:52:37.839771-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.839827-0500	RedLemon	   INPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	09:52:37.840079-0500	RedLemon	   INPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	09:52:37.840095-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.840301-0500	RedLemon	   INPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	09:52:37.840517-0500	RedLemon	   INPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	09:52:37.840625-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.840737-0500	RedLemon	   INPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	09:52:37.840800-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.840972-0500	RedLemon	   INPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	09:52:37.841593-0500	RedLemon	   INPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean
default	09:52:37.840914-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.841964-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	09:52:37.842246-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	09:52:37.842405-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.842551-0500	RedLemon	   INPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	09:52:37.842626-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.842725-0500	RedLemon	   INPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	09:52:37.842773-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.842917-0500	RedLemon	   INPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	09:52:37.843120-0500	RedLemon	   INPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	09:52:37.843275-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.843278-0500	RedLemon	   INPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	09:52:37.843575-0500	RedLemon	   INPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	09:52:37.843739-0500	RedLemon	   INPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	09:52:37.843677-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.843900-0500	RedLemon	   INPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	09:52:37.844053-0500	RedLemon	   INPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	09:52:37.844225-0500	RedLemon	   INPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	09:52:37.844383-0500	RedLemon	   INPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	09:52:37.844414-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.844543-0500	RedLemon	   INPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	09:52:37.844692-0500	RedLemon	   INPUT[40]: FRANKENSTEIN mkv | Unknown | zilean
default	09:52:37.844718-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.844841-0500	RedLemon	   INPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	09:52:37.844890-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.845199-0500	RedLemon	   INPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	09:52:37.845288-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.845523-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.845597-0500	RedLemon	   INPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	09:52:37.845843-0500	RedLemon	   INPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	09:52:37.846060-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.846558-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.846909-0500	RedLemon	   INPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	09:52:37.847345-0500	RedLemon	   INPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	09:52:37.847532-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.847799-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.847810-0500	RedLemon	   INPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	09:52:37.847982-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.848475-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.848515-0500	RedLemon	   INPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	09:52:37.848660-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.848716-0500	RedLemon	   INPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	09:52:37.848902-0500	RedLemon	   INPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	09:52:37.849023-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.849385-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.849081-0500	RedLemon	   INPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	09:52:37.849998-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.849997-0500	RedLemon	   INPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	09:52:37.850192-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.850275-0500	RedLemon	   INPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	09:52:37.850316-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.850574-0500	RedLemon	   INPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	09:52:37.850697-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.850750-0500	RedLemon	   INPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	09:52:37.851584-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.851763-0500	RedLemon	   INPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	09:52:37.851808-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.851990-0500	RedLemon	   INPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	09:52:37.852385-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.852474-0500	RedLemon	   INPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	09:52:37.852618-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.852859-0500	RedLemon	   INPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	09:52:37.853075-0500	RedLemon	   INPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	09:52:37.853260-0500	RedLemon	   INPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	09:52:37.853432-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.853485-0500	RedLemon	   INPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	09:52:37.853621-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.853661-0500	RedLemon	   INPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	09:52:37.853939-0500	RedLemon	   INPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	09:52:37.854012-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.854155-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.854159-0500	RedLemon	   INPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	09:52:37.854343-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.854475-0500	RedLemon	   INPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	09:52:37.854645-0500	RedLemon	   INPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	09:52:37.854846-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.855020-0500	RedLemon	   INPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	09:52:37.855051-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.855344-0500	RedLemon	   INPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	09:52:37.855531-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.855607-0500	RedLemon	   INPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	09:52:37.855954-0500	RedLemon	   INPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	09:52:37.856108-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.856126-0500	RedLemon	   INPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	09:52:37.856226-0500	RedLemon	   INPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
default	09:52:37.856245-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.856400-0500	RedLemon	   INPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	09:52:37.856553-0500	RedLemon	   INPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	09:52:37.856602-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.856709-0500	RedLemon	   INPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	09:52:37.856770-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.856854-0500	RedLemon	   INPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	09:52:37.856915-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.857021-0500	RedLemon	   INPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	09:52:37.857983-0500	RedLemon	   INPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	09:52:37.858160-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.858524-0500	RedLemon	   INPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	09:52:37.858639-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.858688-0500	RedLemon	   INPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	09:52:37.858846-0500	RedLemon	   INPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	09:52:37.859018-0500	RedLemon	   INPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	09:52:37.859164-0500	RedLemon	   INPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
default	09:52:37.859185-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.859453-0500	RedLemon	   INPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	09:52:37.859560-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.859585-0500	RedLemon	   INPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	09:52:37.859680-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.859719-0500	RedLemon	   INPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	09:52:37.859930-0500	RedLemon	   INPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	09:52:37.860028-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.860112-0500	RedLemon	   INPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	09:52:37.860213-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.860373-0500	RedLemon	   INPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	09:52:37.860564-0500	RedLemon	   INPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.860605-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.860764-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.860865-0500	RedLemon	   INPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	09:52:37.861018-0500	RedLemon	   INPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.861378-0500	RedLemon	   INPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	09:52:37.861457-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.861569-0500	RedLemon	   INPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	09:52:37.861812-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.861885-0500	RedLemon	   INPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.862515-0500	RedLemon	   INPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.862842-0500	RedLemon	   INPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.863040-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.863006-0500	RedLemon	   INPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	09:52:37.863226-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.863253-0500	RedLemon	   INPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	09:52:37.863368-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.863370-0500	RedLemon	   INPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	09:52:37.863562-0500	RedLemon	   INPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.863930-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.863929-0500	RedLemon	   INPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	09:52:37.864171-0500	RedLemon	   INPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.864281-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.864314-0500	RedLemon	   INPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.864464-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.864487-0500	RedLemon	   INPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.864743-0500	RedLemon	   INPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	09:52:37.864928-0500	RedLemon	   INPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	09:52:37.865009-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.865122-0500	RedLemon	   INPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	09:52:37.865200-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.865267-0500	RedLemon	   INPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	09:52:37.865315-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.865396-0500	RedLemon	   INPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.865526-0500	RedLemon	   INPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	09:52:37.865633-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.865658-0500	RedLemon	   INPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.865777-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.865784-0500	RedLemon	   INPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	09:52:37.865921-0500	RedLemon	   INPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	09:52:37.865911-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.866060-0500	RedLemon	   INPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	09:52:37.866306-0500	RedLemon	   INPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	09:52:37.866560-0500	RedLemon	   INPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	09:52:37.866777-0500	RedLemon	   INPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.866846-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.866913-0500	RedLemon	   INPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	09:52:37.867011-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.867033-0500	RedLemon	   INPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.867163-0500	RedLemon	   INPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.867284-0500	RedLemon	   INPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.867413-0500	RedLemon	   INPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	09:52:37.867505-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.868134-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.868293-0500	RedLemon	   INPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	09:52:37.868335-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.869139-0500	RedLemon	   INPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.869395-0500	RedLemon	   INPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	09:52:37.869716-0500	RedLemon	   INPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	09:52:37.869880-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.869896-0500	RedLemon	   INPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	09:52:37.870084-0500	RedLemon	   INPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	09:52:37.870112-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.870266-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.870327-0500	RedLemon	   INPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	09:52:37.870449-0500	RedLemon	   INPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	09:52:37.870584-0500	RedLemon	   INPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	09:52:37.870687-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.870771-0500	RedLemon	   INPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	09:52:37.870948-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.871051-0500	RedLemon	   INPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	09:52:37.871148-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.871181-0500	RedLemon	   INPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	09:52:37.871294-0500	RedLemon	   INPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	09:52:37.871412-0500	RedLemon	   INPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	09:52:37.871527-0500	RedLemon	   INPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	09:52:37.871639-0500	RedLemon	   INPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	09:52:37.871643-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.871902-0500	RedLemon	   INPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	09:52:37.872035-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.872245-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.872272-0500	RedLemon	   INPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	09:52:37.872639-0500	RedLemon	   INPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	09:52:37.872965-0500	RedLemon	   INPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	09:52:37.873119-0500	RedLemon	   INPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	09:52:37.873598-0500	RedLemon	   INPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	09:52:37.874052-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.873755-0500	RedLemon	   INPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	09:52:37.874392-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.874465-0500	RedLemon	   INPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	09:52:37.874670-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.874905-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.875070-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.875062-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.875181-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.875396-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.875494-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.875514-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.875674-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.875823-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.876056-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.876166-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.876271-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.876430-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.876543-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.876619-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.876708-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.876898-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.877006-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.877049-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.877108-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.877198-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.877194-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.877299-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.877521-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.877779-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.877898-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.877938-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.878058-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.878165-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.878273-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.878390-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.878403-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.878644-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.878737-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.878768-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	09:52:37.878865-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.878899-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.878963-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.879055-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.879151-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.879249-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.879344-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.879378-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.879442-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.879534-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.879540-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.879626-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.879631-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.879728-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.879867-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.879998-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.880151-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.880395-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.880503-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.880604-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.880894-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.880995-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.881077-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.881180-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.881161-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.881279-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.881337-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.881373-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.881793-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	09:52:37.881966-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 720p | 720p | comet
default	09:52:37.882257-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.882412-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 720p | 720p | comet
default	09:52:37.882517-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.882531-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	09:52:37.882630-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 480p | 480p | comet
default	09:52:37.882677-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.882728-0500	RedLemon	   INPUT[201]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.883007-0500	RedLemon	   INPUT[202]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.883135-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.883128-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.883315-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.883656-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.883718-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.883827-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.884071-0500	RedLemon	   INPUT[206]: [RD⚡] Comet unknown | unknown | comet
default	09:52:37.884212-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	09:52:37.884238-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.884392-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.884465-0500	RedLemon	Task <B4C66E89-DED0-4166-9BDD-9836B2FE4416>.<295> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	09:52:37.884742-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.884888-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.884937-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [21355DD6-9B20-4A90-9750-D715C33EAACB] (reporting strategy default)> on Task <B4C66E89-DED0-4166-9BDD-9836B2FE4416>.<295> was not selected for reporting
default	09:52:37.885637-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.885873-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.886912-0500	RedLemon	Task <B4C66E89-DED0-4166-9BDD-9836B2FE4416>.<295> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:37.887124-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.887204-0500	RedLemon	Task <B4C66E89-DED0-4166-9BDD-9836B2FE4416>.<295> now using Connection 20
default	09:52:37.887355-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.887571-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.888226-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.888475-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.888638-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.888849-0500	RedLemon	0x7fb19bbd76b8 ID=12 Task <B4C66E89-DED0-4166-9BDD-9836B2FE4416>.<295> sent request, body N 0
default	09:52:37.889664-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.889905-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.890407-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.890650-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.891002-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.891777-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.892055-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.892280-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.892972-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.893217-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.893419-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.893794-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.893950-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.894105-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.894550-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.894895-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.895503-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.895725-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.896369-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.896864-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.897054-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.897213-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.897684-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.897885-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.898612-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.898967-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.899194-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.900509-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.900722-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.901235-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.902210-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.902528-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.902823-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.903592-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.903836-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.904082-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.904622-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.904814-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.905219-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.905397-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.905572-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.906692-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.906943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.907130-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.907685-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.907881-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.908281-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.908469-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.908972-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.909176-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.909310-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.909769-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.909948-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.910094-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.910715-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.911062-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.911317-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.911897-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.912118-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.913045-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.913235-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.913384-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.913767-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.913950-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.914737-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.915044-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.915441-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.915643-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.915808-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.916218-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.916412-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.916991-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.917201-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.917339-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.917825-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.917987-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.918538-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.919142-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.919357-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.919542-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.920130-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.920334-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.920614-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.921185-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.921504-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.923146-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.923825-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.924058-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.924787-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.925406-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.925911-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.926122-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.926405-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.927115-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.927612-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.927942-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.928595-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.928735-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.929397-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.929577-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.930457-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.930677-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.931682-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.932364-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.932744-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.933681-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.934022-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.934639-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.935391-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.935663-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.937154-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.937382-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.938242-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.938659-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.939060-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.939876-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.940188-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.940754-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.941940-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.942164-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.944364-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.944562-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.945796-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.946911-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.948189-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.948420-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.949959-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.951041-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.951301-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.951967-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.952277-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.954799-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.957564-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.958543-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.959667-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.960370-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.960668-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.961833-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.962115-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.962788-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.963378-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.963836-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.965060-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.969427-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.970439-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.970648-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.971537-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.972155-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.972493-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.973757-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.975287-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.976313-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.977467-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.978147-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.979135-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.979826-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.980030-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.981112-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:37.981879-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:37.982994-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.984551-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.986298-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.986965-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.988131-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.988329-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.988722-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.989943-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.990411-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.991118-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.991523-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:37.992095-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.992945-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:37.993499-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.993690-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.994353-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.994756-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:37.995543-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:37.996383-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:37.997025-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:37.997780-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:37.998830-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.000619-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.001241-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.001965-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.004211-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.005692-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.006969-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.007519-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.007891-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.008616-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.009085-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.009696-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.010406-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.011018-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.011924-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.012605-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.012876-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.013214-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.014000-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.014956-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.017281-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.020163-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.020894-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.021373-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.021986-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.023289-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.023564-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.024538-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.025506-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.025738-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.027143-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.027975-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.028853-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.029160-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.030652-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.031100-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.031852-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.033554-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.033838-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.034672-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.035058-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.035656-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.036720-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.037384-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.037549-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.044215-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.044832-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.045775-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.047144-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.050884-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.051873-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.052875-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.054027-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.055800-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.056252-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.055775-0500	RedLemon	0x7fb19bbd76b8 ID=12 Task <B4C66E89-DED0-4166-9BDD-9836B2FE4416>.<295> received response, status 200 content K
default	09:52:38.058615-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.058787-0500	RedLemon	Task <B4C66E89-DED0-4166-9BDD-9836B2FE4416>.<295> response ended
default	09:52:38.059398-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.059813-0500	RedLemon	Task <B4C66E89-DED0-4166-9BDD-9836B2FE4416>.<295> done using Connection 20
default	09:52:38.060064-0500	RedLemon	Task <B4C66E89-DED0-4166-9BDD-9836B2FE4416>.<295> summary for task success {transaction_duration_ms=174, response_status=200, connection=20, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=169, response_duration_ms=4, request_bytes=166, response_bytes=1380, cache_hit=true}
default	09:52:38.060270-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.060405-0500	RedLemon	Task <B4C66E89-DED0-4166-9BDD-9836B2FE4416>.<295> finished successfully
default	09:52:38.060868-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.061489-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.061928-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.062880-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	09:52:38.063077-0500	RedLemon	✅ Filtered to 4 English subtitles
default	09:52:38.063608-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	09:52:38.063656-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.063885-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	09:52:38.064464-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.064455-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.064995-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.065522-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.066052-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.066092-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.066272-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.066567-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.066744-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.067296-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.067513-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.068356-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.069029-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.069679-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.069681-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.069892-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.070234-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.070966-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.071239-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.071993-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.072523-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.073940-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.074147-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.074201-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.074628-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.075170-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.075419-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.075375-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.075719-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.076087-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.076436-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.076508-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.076747-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.076801-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.077347-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.077440-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.077631-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.077847-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.078223-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.078380-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.078767-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.078927-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.079502-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.079684-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.080065-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.080096-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.080209-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.080318-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.080797-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.080976-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.081120-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.081276-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.081748-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.081948-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.081947-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.082324-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.082386-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.082462-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.082806-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.083137-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.083280-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.083293-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.083517-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.083821-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.084001-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.084794-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.084875-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.084990-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.085273-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.085614-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.085684-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.085860-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.086220-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.086524-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.086600-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.086734-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.087179-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.087414-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.087420-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.087970-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.088087-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.088188-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.088706-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.088912-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.088937-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.090470-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.090446-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.090742-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.091022-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.091608-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.091676-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.091856-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.091897-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.092365-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.092684-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.092703-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.092909-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.093419-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.093580-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.093880-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.093880-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.094630-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.094567-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.094826-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.095518-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.095587-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.095676-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.096517-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.096517-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.096755-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.096899-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.097400-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.097784-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.097899-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.098218-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.098685-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.098977-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.099236-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.100996-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.101021-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.101195-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.101470-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.101963-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.101965-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.102575-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.102577-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.103024-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.103280-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.103473-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.103477-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.103681-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.104063-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.104449-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.104799-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.105571-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.104971-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.105808-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.106605-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.106698-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.107114-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.107183-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.107736-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.107736-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.107933-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.108222-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.108539-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.108695-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.108863-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.108998-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.109406-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.109625-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.109920-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.109924-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.110378-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.110578-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.110960-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.111290-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.111290-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.111829-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.112164-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.112590-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.112590-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.112818-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.112869-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.113538-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.113631-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.113687-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.114491-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.115015-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.115130-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.115317-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.116108-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.116121-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.116430-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.117093-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.117125-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.117799-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.117996-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.118031-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.118498-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.118565-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.118774-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.119273-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.119374-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.119527-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.119723-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.120003-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.120315-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.120414-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.120709-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.120771-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.120899-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.121993-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.122169-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.121948-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.122322-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.123071-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.123378-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.123186-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.123538-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.124138-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.124341-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.124793-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.125298-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.125298-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.125475-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.125684-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.126600-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.126862-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.127162-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.127671-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.127923-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.128017-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.128504-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.128662-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.128988-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.129268-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.129458-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.129302-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.130013-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.130177-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.130191-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.130661-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.130589-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.130850-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.131062-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.132119-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.132355-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.132169-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.133188-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.133918-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.133989-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.134087-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.134602-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.134746-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.134777-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.135071-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.135541-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.135513-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.135772-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.136576-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.136790-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.136939-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.136950-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.137347-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.137527-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.137703-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.137875-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.138236-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.138394-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.138669-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.138705-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.139005-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.139506-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.139765-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.139971-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.140269-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.140393-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.140765-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.140945-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.140927-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.141239-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.141927-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.142683-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.142854-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.143146-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.143696-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.143832-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.144160-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.144160-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.144412-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.144769-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.145163-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.145307-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.145339-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.145967-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.146245-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.146435-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.146821-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.147209-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.147382-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.147710-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.147208-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.148567-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.148691-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.148834-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.149036-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.149532-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.149524-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.149717-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.150219-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.150304-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.150577-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.150731-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.151034-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.151283-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.151837-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.152262-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.152261-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.152651-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.152826-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.153388-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.153523-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.153924-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.154006-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.154433-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.154506-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.154656-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.154985-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.155148-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.155388-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.155728-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.156764-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.156831-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.156986-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.157527-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.158023-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.158138-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.158570-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.159010-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.159256-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.159203-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.159632-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.159785-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.159921-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.160079-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.160271-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.160711-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.160727-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.160871-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.160912-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.162316-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.162316-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.162784-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.163086-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.163216-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.163388-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.163793-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.163845-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.163965-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.163980-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.164184-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.164290-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.164578-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.164738-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.164964-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.165380-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.165563-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.166047-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.166224-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.167754-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.167808-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.167954-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.168003-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.168344-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.168761-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.168911-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.168945-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.169096-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.169472-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.169662-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.169778-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.169939-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.169985-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.170502-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.170557-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.170696-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.170898-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.171211-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.171226-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.171401-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.171525-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.171921-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.171941-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.172096-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.172224-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.172214-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.172409-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.172771-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.172943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.173089-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.173702-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.173914-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.173913-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.174262-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.174417-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.174626-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.174766-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.174787-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.175120-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.175297-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.175312-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.175493-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.175822-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.175820-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.176009-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.175998-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.176476-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.176481-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.176742-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.176870-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.176856-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.177213-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.177364-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.177416-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.177548-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.177814-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.177953-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.178117-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.178745-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.178864-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.178931-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.179059-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.179272-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.179691-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.179691-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.179872-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.179898-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.180206-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.180490-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.180672-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.181011-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.181272-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.181334-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.181643-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.181698-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.181787-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.181834-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.181968-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.182198-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.182218-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.182343-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.182336-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.182573-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.183010-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.183001-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.183594-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.183854-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.183940-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.184019-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.184171-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.184288-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.184648-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.184683-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.184782-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.184806-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.184962-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.185075-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.185396-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.185554-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.185940-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.186014-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.186172-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.186574-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.186732-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.186737-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.186997-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.187179-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.187336-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.187484-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.187485-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.187659-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.187731-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.188455-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.188467-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.188638-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.188815-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.189538-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.189595-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.189769-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.189893-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.190151-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.190300-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.190530-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.190491-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.190679-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.190884-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.191523-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.191703-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.192186-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.200561-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.200757-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.201100-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.201248-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.201602-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.202116-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.203012-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.203273-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.203726-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.204310-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.205348-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.205590-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.206271-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.206487-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.208035-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.208273-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.208425-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.209011-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.209197-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.209451-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.190886-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.210268-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.210481-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.211199-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.211528-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.211823-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.212798-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.213057-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.213269-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.214783-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.214884-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.215002-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.215070-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.215348-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.215502-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.215620-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.216171-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.216388-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.216551-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.216954-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.217159-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.217545-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.217705-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.219166-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.219400-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.220185-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.220422-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.221384-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.221591-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.221745-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.222613-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.223119-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.223701-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.224087-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.225466-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.225828-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.226030-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.226670-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.226690-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.226871-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.227229-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.227421-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.227827-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.227971-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.228179-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.228274-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.228346-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.228511-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.228588-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.228951-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.229311-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.229492-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.230042-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.230215-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.230396-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.231116-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.231744-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.231915-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.232616-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.232990-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.234164-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.234177-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.234333-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.234797-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.235184-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.235605-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.235805-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.236438-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.236943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.237101-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.237510-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.237695-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.238343-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.238732-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.239239-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.239415-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.239546-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.240386-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.240555-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.240860-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.240333-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.241307-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.241503-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.241641-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.241514-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.242477-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.242695-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.243071-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.243483-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.243652-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.243865-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.244448-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.244654-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.245119-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.245305-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.245429-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.245891-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.246048-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.246355-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.246812-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.246995-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.246129-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.247601-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.247972-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.248462-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.248909-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.249330-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.249521-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.249887-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.250029-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.250355-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.250516-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.250967-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.252346-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.252963-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.253139-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.253701-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.253876-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.258368-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.258918-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.259649-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.259841-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.259978-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.260495-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.260667-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.260802-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.261132-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.261497-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.261965-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.262125-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.262455-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.262598-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.262903-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.263073-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.263904-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.264070-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.269182-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.270200-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.270534-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.270534-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.271437-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.271601-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.272018-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.272526-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.273293-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.274343-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.275185-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.275337-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.275402-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.275528-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.276365-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.276669-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.276900-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.277328-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.277817-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.278438-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.278621-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.278717-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.278755-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.278825-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.279067-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.279067-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.279205-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.279392-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.279521-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.282140-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.282609-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.283015-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.283194-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.283968-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.284169-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.284328-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.284724-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.284920-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.285288-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.287209-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.287403-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.287764-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.287914-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.288052-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.288374-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.288542-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.289695-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.289870-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.289993-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.290290-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.290426-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.290565-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.291773-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.291975-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.292326-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.293715-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.293895-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.294270-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.294429-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.294574-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.294913-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.295083-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.296231-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.296416-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.296545-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.296890-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.297439-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.297591-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.299987-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.300822-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.301246-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.301431-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.301562-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.302201-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.302371-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.302505-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.302829-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.303002-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.303318-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.303467-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.305741-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.308598-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.309070-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.309468-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.309875-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.310055-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.310486-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.310643-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.310764-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.311160-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.312033-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.312199-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.312688-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.312872-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.313327-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.313497-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.313625-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.315659-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.315785-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.325747-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.326219-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.326392-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.326710-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.326858-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.326973-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.327260-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.342803-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.343702-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.346636-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.346957-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.357393-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.358230-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.358680-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.360661-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.360963-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.362420-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.368925-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.369164-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.371500-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.371809-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.372627-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.375324-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.375521-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.377422-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.378547-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.378876-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.384064-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.385385-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.386539-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.390266-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.390465-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.390618-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.390971-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.391149-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.393079-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.395783-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.396014-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.397243-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.397974-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.398147-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.398288-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.398753-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.398960-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.400399-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.400587-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.400588-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.401386-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.401959-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.402067-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.402204-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.402959-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.403469-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.403681-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.402935-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.404329-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.404535-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.404552-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.404653-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.404907-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.405678-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.405906-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.406611-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.407433-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.407756-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.407680-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.408000-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.408288-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.408416-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.408551-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.408714-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.409086-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.409276-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.410036-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.410226-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.410481-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.410382-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.410677-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.410680-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.411216-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.411422-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.411863-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.412049-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.412198-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.412704-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.414486-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.414638-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.415383-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.415407-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.415940-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.416398-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.416522-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.416534-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.416685-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.416716-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.416801-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.416821-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.417776-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.417656-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.417973-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.418349-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.418519-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.418215-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.419153-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.419949-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.419943-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.420393-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.420569-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.420855-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.421035-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.421484-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.421484-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.421941-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.422338-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.422627-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.423065-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.423230-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.423732-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.423930-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.424289-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.424787-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.425414-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.425595-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.425947-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.426362-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.426548-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.426897-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.426963-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.427026-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.427243-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.427288-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.427593-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.427763-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.427958-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.428119-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.428212-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.428653-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.428800-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.429275-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.428992-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.429729-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.430197-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.430282-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.430397-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.430624-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.430788-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.430941-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.431025-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.431067-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.431520-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.431596-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.431675-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.431727-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.431792-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.432030-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.432054-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.432373-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.433094-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.433255-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.433604-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.434952-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.435122-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.435549-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.435878-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.436134-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.436028-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.437108-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.437340-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.437807-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.438169-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.438369-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.438730-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.438915-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.439068-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.439066-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.439692-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.440110-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.440599-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.440684-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.441351-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.441534-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.441900-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.442449-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.442650-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.442992-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.443444-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.443602-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.443975-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.444139-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.444622-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.444808-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.444859-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.445276-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.445426-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.445776-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.445966-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.446181-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.446347-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.447592-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.447662-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.447787-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.447805-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.448282-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.448440-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.448652-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.448930-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.449040-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.449080-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.449424-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.449603-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.449726-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 207
default	09:52:38.449959-0500	RedLemon	   OUTPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.450234-0500	RedLemon	   OUTPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean | Subtitles: 3
default	09:52:38.450264-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.450423-0500	RedLemon	   OUTPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.450623-0500	RedLemon	   OUTPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.450496-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.451586-0500	RedLemon	   OUTPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.451622-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.451972-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.452066-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.452507-0500	RedLemon	   OUTPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.452851-0500	RedLemon	   OUTPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.453059-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.453226-0500	RedLemon	   OUTPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.453378-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.453528-0500	RedLemon	   OUTPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.453677-0500	RedLemon	   OUTPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	09:52:38.453829-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.454055-0500	RedLemon	   OUTPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.454456-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.454447-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.454649-0500	RedLemon	   OUTPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	09:52:38.454930-0500	RedLemon	   OUTPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.455327-0500	RedLemon	   OUTPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.455533-0500	RedLemon	   OUTPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.455713-0500	RedLemon	   OUTPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.456346-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.456372-0500	RedLemon	   OUTPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.456536-0500	RedLemon	   OUTPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	09:52:38.456635-0500	RedLemon	   OUTPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.456722-0500	RedLemon	   OUTPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	09:52:38.456809-0500	RedLemon	   OUTPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.456805-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.456892-0500	RedLemon	   OUTPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	09:52:38.457959-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.458203-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.458493-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.458782-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.458893-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	09:52:38.459080-0500	RedLemon	   OUTPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	09:52:38.459371-0500	RedLemon	   OUTPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	09:52:38.459680-0500	RedLemon	   OUTPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.459964-0500	RedLemon	   OUTPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.460076-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.460158-0500	RedLemon	   OUTPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	09:52:38.460210-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.460314-0500	RedLemon	   OUTPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	09:52:38.460469-0500	RedLemon	   OUTPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.460628-0500	RedLemon	   OUTPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	09:52:38.460783-0500	RedLemon	   OUTPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.460946-0500	RedLemon	   OUTPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	09:52:38.461349-0500	RedLemon	   OUTPUT[40]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	09:52:38.461529-0500	RedLemon	   OUTPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.462057-0500	RedLemon	   OUTPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.462246-0500	RedLemon	   OUTPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	09:52:38.462426-0500	RedLemon	   OUTPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	09:52:38.462598-0500	RedLemon	   OUTPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.462775-0500	RedLemon	   OUTPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.460577-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.463797-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.464200-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.464365-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.465120-0500	RedLemon	   OUTPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.465372-0500	RedLemon	   OUTPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	09:52:38.465430-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.465557-0500	RedLemon	   OUTPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.465554-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.465728-0500	RedLemon	   OUTPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	09:52:38.465893-0500	RedLemon	   OUTPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.466581-0500	RedLemon	   OUTPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.467608-0500	RedLemon	   OUTPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.467765-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.467839-0500	RedLemon	   OUTPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.467883-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.468017-0500	RedLemon	   OUTPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	09:52:38.468118-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.468184-0500	RedLemon	   OUTPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	09:52:38.468231-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.468643-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.468671-0500	RedLemon	   OUTPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	09:52:38.468833-0500	RedLemon	   OUTPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.468992-0500	RedLemon	   OUTPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.469054-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.469146-0500	RedLemon	   OUTPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.469166-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.469291-0500	RedLemon	   OUTPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	09:52:38.469446-0500	RedLemon	   OUTPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	09:52:38.469523-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.469613-0500	RedLemon	   OUTPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.469779-0500	RedLemon	   OUTPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	09:52:38.469939-0500	RedLemon	   OUTPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.470103-0500	RedLemon	   OUTPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.470267-0500	RedLemon	   OUTPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	09:52:38.470422-0500	RedLemon	   OUTPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.470730-0500	RedLemon	   OUTPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.471041-0500	RedLemon	   OUTPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	09:52:38.471236-0500	RedLemon	   OUTPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.471363-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.471399-0500	RedLemon	   OUTPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.471518-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.471545-0500	RedLemon	   OUTPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.471688-0500	RedLemon	   OUTPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	09:52:38.472027-0500	RedLemon	   OUTPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.472383-0500	RedLemon	   OUTPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.472527-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.472549-0500	RedLemon	   OUTPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	09:52:38.472698-0500	RedLemon	   OUTPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	09:52:38.473248-0500	RedLemon	   OUTPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	09:52:38.473429-0500	RedLemon	   OUTPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.473586-0500	RedLemon	   OUTPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	09:52:38.473939-0500	RedLemon	   OUTPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	09:52:38.473989-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.474097-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.474106-0500	RedLemon	   OUTPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	09:52:38.474246-0500	RedLemon	   OUTPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	09:52:38.474585-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	09:52:38.474756-0500	RedLemon	   OUTPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	09:52:38.475493-0500	RedLemon	   OUTPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	09:52:38.475703-0500	RedLemon	   OUTPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	09:52:38.475852-0500	RedLemon	   OUTPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	09:52:38.475982-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	09:52:38.476113-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:38.476243-0500	RedLemon	   OUTPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	09:52:38.476371-0500	RedLemon	   OUTPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:38.479084-0500	RedLemon	   OUTPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	09:52:38.479224-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.479259-0500	RedLemon	   OUTPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	09:52:38.479398-0500	RedLemon	   OUTPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:38.479530-0500	RedLemon	   OUTPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:38.480214-0500	RedLemon	   OUTPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:38.480387-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.480426-0500	RedLemon	   OUTPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	09:52:38.480560-0500	RedLemon	   OUTPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	09:52:38.480695-0500	RedLemon	   OUTPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	09:52:38.481049-0500	RedLemon	   OUTPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:38.481231-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.481266-0500	RedLemon	   OUTPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	09:52:38.481744-0500	RedLemon	   OUTPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:38.481901-0500	RedLemon	   OUTPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:38.482040-0500	RedLemon	   OUTPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:38.482178-0500	RedLemon	   OUTPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	09:52:38.482287-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.482311-0500	RedLemon	   OUTPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	09:52:38.482886-0500	RedLemon	   OUTPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	09:52:38.483048-0500	RedLemon	   OUTPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	09:52:38.483196-0500	RedLemon	   OUTPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:38.485002-0500	RedLemon	   OUTPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	09:52:38.485861-0500	RedLemon	   OUTPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:38.486588-0500	RedLemon	   OUTPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	09:52:38.486726-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.486824-0500	RedLemon	   OUTPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	09:52:38.487005-0500	RedLemon	   OUTPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	09:52:38.487308-0500	RedLemon	   OUTPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	09:52:38.487595-0500	RedLemon	   OUTPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	09:52:38.487787-0500	RedLemon	   OUTPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:38.488236-0500	RedLemon	   OUTPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	09:52:38.488718-0500	RedLemon	   OUTPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:38.489049-0500	RedLemon	   OUTPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:38.489531-0500	RedLemon	   OUTPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:38.489856-0500	RedLemon	   OUTPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:38.490029-0500	RedLemon	   OUTPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:38.490173-0500	RedLemon	   OUTPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:38.490411-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.490422-0500	RedLemon	   OUTPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	09:52:38.490617-0500	RedLemon	   OUTPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	09:52:38.490765-0500	RedLemon	   OUTPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	09:52:38.490899-0500	RedLemon	   OUTPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	09:52:38.491055-0500	RedLemon	   OUTPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	09:52:38.491215-0500	RedLemon	   OUTPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	09:52:38.491364-0500	RedLemon	   OUTPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	09:52:38.491962-0500	RedLemon	   OUTPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	09:52:38.492055-0500	RedLemon	   OUTPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	09:52:38.492131-0500	RedLemon	   OUTPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	09:52:38.492203-0500	RedLemon	   OUTPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	09:52:38.492274-0500	RedLemon	   OUTPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	09:52:38.492484-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.492553-0500	RedLemon	   OUTPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:38.492676-0500	RedLemon	   OUTPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	09:52:38.492821-0500	RedLemon	   OUTPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	09:52:38.492968-0500	RedLemon	   OUTPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	09:52:38.493252-0500	RedLemon	   OUTPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	09:52:38.493431-0500	RedLemon	   OUTPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	09:52:38.493671-0500	RedLemon	   OUTPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	09:52:38.493930-0500	RedLemon	   OUTPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	09:52:38.494003-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.494079-0500	RedLemon	   OUTPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	09:52:38.494199-0500	RedLemon	   OUTPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	09:52:38.494215-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.494303-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.494354-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.494406-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.494980-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.495078-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.495105-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.495374-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.495395-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.495656-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.495778-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.495945-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.496078-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.496798-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.496931-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.497227-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.497700-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.497886-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.498092-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.498213-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.498318-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.498754-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.498841-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.498914-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.499022-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.499169-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.499305-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.499418-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.499703-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.500698-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.500771-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.501159-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:38.501298-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.501427-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.501550-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.501667-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.502058-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.502211-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.502327-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.502515-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.502638-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.502860-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.502907-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.503031-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.503144-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.503253-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.503441-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.503580-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.503779-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.503806-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.503905-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.504051-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.504169-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.504309-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.504479-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.504659-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:38.504970-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	09:52:38.505280-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.505213-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	09:52:38.505711-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	09:52:38.505942-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	09:52:38.505970-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.506068-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:38.506112-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.506172-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:38.506236-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.506268-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:38.507544-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:38.507714-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:38.507911-0500	RedLemon	   OUTPUT[206]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:38.508131-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.508328-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.508986-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.509227-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.509747-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.509934-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.510087-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.512511-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.512768-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.512949-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.513976-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.514888-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.515592-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.515929-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.516524-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.516752-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.516855-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.517059-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.517155-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.517220-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.517385-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.518117-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.518274-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.520456-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.520657-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.528069-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.528275-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.528394-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.528723-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.528872-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.529011-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.529364-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.529521-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.529882-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.530061-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.531235-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.531888-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.532042-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.532291-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.532403-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.533843-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.534073-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.534301-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.534957-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.537470-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.538799-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.539710-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.539978-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.540534-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.542184-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.542407-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.542845-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.543540-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.543752-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.544270-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.544493-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.545233-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.547034-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.547815-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.549098-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.549310-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.549479-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.550539-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.551562-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.551783-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.552648-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.553380-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.553829-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.555165-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.555674-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.558269-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.558480-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.560789-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.560935-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.561012-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.561223-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.561311-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.561388-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.561588-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.562300-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.563000-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.563194-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.563317-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.564204-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.564446-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.565994-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.567272-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.568469-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.568689-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.568831-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.569333-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.569786-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.570681-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.571548-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.572761-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.573602-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.574122-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.575083-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.575494-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.576105-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.576864-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.577233-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.577649-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.577847-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.578253-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.578934-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.580183-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.584801-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.585186-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.586102-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.586823-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.587321-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.588351-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.589258-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.589391-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.589638-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.596966-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.597938-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.598223-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.598359-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.598721-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.599370-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.601437-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.601701-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.603878-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.604229-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.605123-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.605379-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.605539-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.605917-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.606133-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.606286-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.606616-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.610341-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.610480-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.610781-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.610927-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.611056-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.611375-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.611525-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.613393-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.613588-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.613703-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.614763-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.614984-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.618632-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.619083-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.619292-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.619441-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.620596-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.620819-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.620948-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.621367-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.621562-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.623405-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.623795-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.624020-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.625673-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.625895-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.626811-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.627058-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.627199-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.627585-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.627780-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.627927-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.628362-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.629223-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.629448-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.630377-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.630594-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.630934-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.631519-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.631787-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.631983-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.632410-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.632606-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.632746-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.633114-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.633724-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.634768-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.635411-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.637449-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.637748-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.638339-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.638523-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.638675-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.640031-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.640295-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.640455-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.640923-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.641108-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.641496-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.641652-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.642596-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.643419-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.643692-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.644022-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.644470-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.644675-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.644813-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.645176-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.645368-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.645526-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.646121-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.646259-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.646495-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.646598-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.646665-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.646841-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.648390-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.650152-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.650769-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.652287-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.654051-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.655679-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.656470-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.657876-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.658106-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.658271-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.658943-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.659470-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.659638-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.660141-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.660348-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.660860-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.661947-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.662162-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.662554-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.662729-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.662872-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.663194-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.663579-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.663804-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.664310-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.664513-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.665102-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.665312-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.667686-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.667984-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.668426-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.670047-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.670370-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.670696-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.671380-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.671685-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.672081-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.673403-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.673620-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.673943-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.674098-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.674230-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.674580-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.674956-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.675362-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.675565-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.675919-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.676095-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.676333-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.676887-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.677089-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.678599-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.678991-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.679141-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.679780-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.679953-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.680094-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.680932-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.681122-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.681231-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.681533-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.681643-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.681711-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.681951-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.682415-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.682820-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.682996-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.683881-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.685002-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.685229-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.685651-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.685806-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.685933-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.686279-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.686486-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.686964-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.687860-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.688009-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.688769-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.689122-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.690574-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.690788-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.691356-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.691879-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.692053-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.692430-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.692676-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.695115-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.696191-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.696325-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.702908-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.703124-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.703519-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.703717-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.703875-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.706471-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.706660-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.708570-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.708973-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.709141-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.709615-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.709753-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.710194-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.710576-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.713121-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.713304-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.713821-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.721903-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.722090-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.722456-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.724370-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.724611-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.725074-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.725665-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.725836-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.726602-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.726819-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.727493-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.727670-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.728071-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.729312-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.729612-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.730381-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.730545-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.731271-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.732100-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.732592-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.732861-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.733056-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.735378-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.735565-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.736020-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.737938-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.738291-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.743264-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.743766-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.743935-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.745109-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.745383-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.745589-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.746247-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.746443-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.746562-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.747975-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.748176-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.748332-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.748738-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.748920-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.749313-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.749512-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.753762-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.754132-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.754292-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.754654-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.755343-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.755553-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.756603-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.757016-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.757174-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.757531-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.757690-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.758138-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.758502-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.763240-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.763660-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.763828-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.764926-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.768871-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.769124-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.771018-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.771456-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.771645-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.772757-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.772994-0500	runningboardd	Invalidating assertion 173-4529-1538 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:38.774075-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.774287-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.775012-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.775460-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.775635-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.777439-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.778502-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.778680-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.779067-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.779262-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.779407-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.779906-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.780343-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.787024-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.788655-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.788912-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.789062-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.790900-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.791071-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.791534-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.792771-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.793848-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	09:52:38.794084-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	09:52:38.794240-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.795459-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.795623-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.796206-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.796370-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.796741-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.797293-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.797790-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.798039-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.798419-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.798592-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.798984-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.800875-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.801398-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.801578-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.801985-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.802171-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.802586-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.803764-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.805424-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.805859-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.806195-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.806341-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.806631-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.806776-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.808594-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.808753-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.809055-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.809190-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.814419-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.815872-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.819247-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.819540-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.820524-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.820796-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.821288-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.821813-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.822360-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.822820-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.823318-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.823493-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.823797-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.823949-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.824259-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.824373-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.824641-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.825500-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.825861-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.826031-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.826361-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.826494-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.827982-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.828175-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.828494-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.828651-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.828963-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.829083-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.829559-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.829739-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.831444-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.831662-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.832082-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.832242-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.832595-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.832772-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.834043-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.834264-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.834654-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.835015-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.835556-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.835731-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.836060-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.836239-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.836584-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.836705-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.836986-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.837919-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.838330-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.838526-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.839060-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.839215-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.839519-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.839653-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.839950-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.840101-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.840821-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.840970-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.841283-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.841470-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.842040-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.842230-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.842593-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.842722-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.843036-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.843847-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.844386-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.844573-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.844892-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.845007-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.845418-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.845577-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.846091-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.846271-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.846587-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.846702-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.847268-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.847436-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.848103-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.848288-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.848608-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.848728-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.850624-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.850821-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.852864-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.853094-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.854667-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.854829-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.855222-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.855489-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.856239-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.856451-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.857281-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.857429-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.857976-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.858149-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.858701-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.858900-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.859400-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.859572-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.859899-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.860058-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.860538-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.863219-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.863665-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.863840-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.864492-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.864670-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.865310-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.865520-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.866230-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.866393-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.867058-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.867683-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.869834-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.870733-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.871232-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.871474-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.871782-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.871922-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.873130-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.873334-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.873706-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.873850-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.875201-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.875382-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.875695-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.875854-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.876178-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.876303-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.876585-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.877532-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.877863-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.878016-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.878874-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.879045-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.879173-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.880338-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.880513-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.881014-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.881761-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.881947-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.882441-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.882606-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.882731-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.883626-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.883793-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.883913-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.884195-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.884685-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.885366-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.885535-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.885643-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.885915-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.886035-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.886146-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.886420-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.886822-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.887134-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.887279-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.887392-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.887885-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.888042-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.888164-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.888462-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.888609-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.888895-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.889039-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.890187-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.890907-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.891069-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.891205-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.891539-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.891706-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.892096-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.892251-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.892359-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.892628-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.893009-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.893142-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.893359-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.893460-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.894179-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.894323-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.894431-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.894692-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.894815-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.894932-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.897384-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.897528-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.897721-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.897808-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.897872-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.898386-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.898557-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.898701-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.899077-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.899301-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.900952-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.901135-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.901258-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.901535-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.901663-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.901777-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.902065-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.905272-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.906095-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.906280-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.906409-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.907274-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.907444-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.907576-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.907903-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.908068-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.908376-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.908540-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.908852-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.909195-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.909336-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.909459-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.909768-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.909924-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.910209-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.911241-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.911638-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.912265-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.912436-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.912584-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.912976-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.913170-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.913696-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.913861-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.913978-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.914625-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.914791-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.914927-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.915529-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.915750-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.917233-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.917455-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.917608-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.917973-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.918150-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.918299-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.919598-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.920123-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.920944-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.921138-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.921628-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.921966-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.922111-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.922911-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.923265-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.923419-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.923870-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.924308-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.924449-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.924895-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.925054-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.925184-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.925770-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.925961-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.926462-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.926632-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.926903-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.927721-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.927894-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.928030-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.929364-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.929548-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.929850-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.929990-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.932425-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.934494-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.934679-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.935194-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.935801-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.936017-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.936433-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.936616-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.936763-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.937676-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.938054-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.938643-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.940633-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.940839-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.941195-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.941376-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.941508-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.941819-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.941957-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.942082-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.942435-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.942621-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.942965-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.943123-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.943876-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.944246-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.944600-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.944791-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.945171-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.945391-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.945736-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.945899-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.946021-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.946225-0500	RedLemon	    📺 Resolution match: 1080p
default	09:52:38.946306-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.946378-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.946551-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.947856-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.948237-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.948741-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.949083-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.949218-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.949518-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.949682-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.949992-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.950114-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.950402-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.950537-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.951402-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.951615-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.951981-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.952109-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.952613-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.952776-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.953119-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.953288-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.953614-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.953705-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.955274-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.956478-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.956940-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.957144-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.957633-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.958911-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.959739-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.960021-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.960367-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.960539-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.962593-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.962733-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.965513-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.965677-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.966162-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.966353-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.966734-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.967019-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.967500-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.967854-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.968206-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.968369-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.968698-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.969389-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.969712-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.969842-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.970124-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.970236-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.970443-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.971407-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.971807-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.971967-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.972301-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.972470-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.972810-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	09:52:38.972944-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	09:52:38.974462-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	09:52:38.974631-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	09:52:38.974936-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	09:52:38.975094-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	09:52:38.975202-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 207
default	09:52:38.975373-0500	RedLemon	   OUTPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.975537-0500	RedLemon	   OUTPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean | Subtitles: 3
default	09:52:38.979856-0500	RedLemon	   OUTPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.980076-0500	RedLemon	   OUTPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.980521-0500	RedLemon	   OUTPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.980732-0500	RedLemon	   OUTPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.981050-0500	RedLemon	   OUTPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.981231-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.981379-0500	RedLemon	   OUTPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.981583-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.981750-0500	RedLemon	   OUTPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.981918-0500	RedLemon	   OUTPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	09:52:38.982074-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.982230-0500	RedLemon	   OUTPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.982969-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.983149-0500	RedLemon	   OUTPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	09:52:38.983300-0500	RedLemon	   OUTPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.983449-0500	RedLemon	   OUTPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.983597-0500	RedLemon	   OUTPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.983747-0500	RedLemon	   OUTPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.983900-0500	RedLemon	   OUTPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.984477-0500	RedLemon	   OUTPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	09:52:38.984652-0500	RedLemon	   OUTPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.984812-0500	RedLemon	   OUTPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	09:52:38.985611-0500	RedLemon	   OUTPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.985892-0500	RedLemon	   OUTPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	09:52:38.986083-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.986248-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.986402-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.986550-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	09:52:38.986696-0500	RedLemon	   OUTPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	09:52:38.986844-0500	RedLemon	   OUTPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	09:52:38.987571-0500	RedLemon	   OUTPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.987751-0500	RedLemon	   OUTPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.987910-0500	RedLemon	   OUTPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	09:52:38.988068-0500	RedLemon	   OUTPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	09:52:38.988229-0500	RedLemon	   OUTPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.988439-0500	RedLemon	   OUTPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	09:52:38.988811-0500	RedLemon	   OUTPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.988986-0500	RedLemon	   OUTPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	09:52:38.989147-0500	RedLemon	   OUTPUT[40]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	09:52:38.989518-0500	RedLemon	   OUTPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.989630-0500	RedLemon	   OUTPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.989723-0500	RedLemon	   OUTPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	09:52:38.989815-0500	RedLemon	   OUTPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	09:52:38.990231-0500	RedLemon	   OUTPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.990402-0500	RedLemon	   OUTPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.990564-0500	RedLemon	   OUTPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.990726-0500	RedLemon	   OUTPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	09:52:38.990891-0500	RedLemon	   OUTPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.991051-0500	RedLemon	   OUTPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	09:52:38.991419-0500	RedLemon	   OUTPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.991605-0500	RedLemon	   OUTPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.991770-0500	RedLemon	   OUTPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.991931-0500	RedLemon	   OUTPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.992089-0500	RedLemon	   OUTPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	09:52:38.992245-0500	RedLemon	   OUTPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	09:52:38.992463-0500	RedLemon	   OUTPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	09:52:38.993151-0500	RedLemon	   OUTPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.993318-0500	RedLemon	   OUTPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.993478-0500	RedLemon	   OUTPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.993624-0500	RedLemon	   OUTPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	09:52:38.993772-0500	RedLemon	   OUTPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	09:52:38.993921-0500	RedLemon	   OUTPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	09:52:38.994070-0500	RedLemon	   OUTPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	09:52:38.994215-0500	RedLemon	   OUTPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.994884-0500	RedLemon	   OUTPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.995054-0500	RedLemon	   OUTPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	09:52:38.995212-0500	RedLemon	   OUTPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.995498-0500	RedLemon	   OUTPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.995665-0500	RedLemon	   OUTPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	09:52:38.995825-0500	RedLemon	   OUTPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.995979-0500	RedLemon	   OUTPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.996129-0500	RedLemon	   OUTPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	09:52:38.996278-0500	RedLemon	   OUTPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	09:52:38.996424-0500	RedLemon	   OUTPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.996998-0500	RedLemon	   OUTPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.997169-0500	RedLemon	   OUTPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	09:52:38.997327-0500	RedLemon	   OUTPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	09:52:38.997494-0500	RedLemon	   OUTPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	09:52:38.997798-0500	RedLemon	   OUTPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	09:52:38.997956-0500	RedLemon	   OUTPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	09:52:38.998095-0500	RedLemon	   OUTPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	09:52:38.998229-0500	RedLemon	   OUTPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	09:52:38.998347-0500	RedLemon	   OUTPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	09:52:38.998464-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	09:52:38.998573-0500	RedLemon	   OUTPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	09:52:38.998678-0500	RedLemon	   OUTPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	09:52:39.000323-0500	RedLemon	   OUTPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	09:52:39.000469-0500	RedLemon	   OUTPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	09:52:39.000782-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	09:52:39.000941-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:39.001108-0500	RedLemon	   OUTPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	09:52:39.001240-0500	RedLemon	   OUTPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:39.001367-0500	RedLemon	   OUTPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	09:52:39.001557-0500	RedLemon	   OUTPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	09:52:39.001682-0500	RedLemon	   OUTPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:39.002157-0500	RedLemon	   OUTPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:39.002310-0500	RedLemon	   OUTPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:39.002454-0500	RedLemon	   OUTPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	09:52:39.002578-0500	RedLemon	   OUTPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	09:52:39.002707-0500	RedLemon	   OUTPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	09:52:39.002836-0500	RedLemon	   OUTPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:39.003317-0500	RedLemon	   OUTPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	09:52:39.003444-0500	RedLemon	   OUTPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:39.003565-0500	RedLemon	   OUTPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:39.003684-0500	RedLemon	   OUTPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:39.003806-0500	RedLemon	   OUTPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	09:52:39.003925-0500	RedLemon	   OUTPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	09:52:39.004039-0500	RedLemon	   OUTPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	09:52:39.004154-0500	RedLemon	   OUTPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	09:52:39.004283-0500	RedLemon	   OUTPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:39.005424-0500	RedLemon	   OUTPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	09:52:39.005573-0500	RedLemon	   OUTPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:39.005703-0500	RedLemon	   OUTPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	09:52:39.005840-0500	RedLemon	   OUTPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	09:52:39.005969-0500	RedLemon	   OUTPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	09:52:39.006115-0500	RedLemon	   OUTPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	09:52:39.006242-0500	RedLemon	   OUTPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	09:52:39.007395-0500	RedLemon	   OUTPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:39.007544-0500	RedLemon	   OUTPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	09:52:39.007680-0500	RedLemon	   OUTPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:39.007822-0500	RedLemon	   OUTPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:39.007975-0500	RedLemon	   OUTPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:39.008114-0500	RedLemon	   OUTPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:39.008258-0500	RedLemon	   OUTPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	09:52:39.008384-0500	RedLemon	   OUTPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:39.008516-0500	RedLemon	   OUTPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	09:52:39.008637-0500	RedLemon	   OUTPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	09:52:39.008771-0500	RedLemon	   OUTPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	09:52:39.008930-0500	RedLemon	   OUTPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	09:52:39.010030-0500	RedLemon	   OUTPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	09:52:39.010165-0500	RedLemon	   OUTPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	09:52:39.010298-0500	RedLemon	   OUTPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	09:52:39.010421-0500	RedLemon	   OUTPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	09:52:39.010550-0500	RedLemon	   OUTPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	09:52:39.010787-0500	RedLemon	   OUTPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	09:52:39.010925-0500	RedLemon	   OUTPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	09:52:39.011051-0500	RedLemon	   OUTPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	09:52:39.011167-0500	RedLemon	   OUTPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	09:52:39.011277-0500	RedLemon	   OUTPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	09:52:39.011404-0500	RedLemon	   OUTPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	09:52:39.011538-0500	RedLemon	   OUTPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	09:52:39.011636-0500	RedLemon	   OUTPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	09:52:39.011708-0500	RedLemon	   OUTPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	09:52:39.011775-0500	RedLemon	   OUTPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	09:52:39.011843-0500	RedLemon	   OUTPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	09:52:39.011908-0500	RedLemon	   OUTPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	09:52:39.011974-0500	RedLemon	   OUTPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	09:52:39.012563-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.012696-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.012799-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.012900-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.013000-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.013099-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.013202-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.013683-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.013804-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.013915-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.014019-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.014343-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.014467-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.014575-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.014673-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.014776-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.014877-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.017059-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.017179-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.017275-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.017364-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.017426-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.017481-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.018208-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.018338-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.018452-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	09:52:39.018562-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.018670-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.018775-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.018881-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.018992-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.019094-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.019196-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.019301-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.019404-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.019509-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.020054-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.020172-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.020288-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.020397-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.020502-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.020605-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.020709-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.020811-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.020920-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.021023-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.021123-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.021224-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	09:52:39.021327-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	09:52:39.021430-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	09:52:39.023546-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	09:52:39.023786-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	09:52:39.024038-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:39.024195-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:39.024377-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:39.024502-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:39.024614-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:39.025023-0500	RedLemon	   OUTPUT[206]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	09:52:39.099684-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:39.099746-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:39.099797-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:39.120477-0500	runningboardd	Invalidating assertion 173-114-1539 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:39.197598-0500	RedLemon	Task <959C1A9A-9C3A-47FA-AEA4-202A9267326A>.<14> received response, status 200 content K
default	09:52:39.198080-0500	RedLemon	Task <959C1A9A-9C3A-47FA-AEA4-202A9267326A>.<14> response ended
default	09:52:39.198151-0500	RedLemon	Task <959C1A9A-9C3A-47FA-AEA4-202A9267326A>.<14> done using Connection 48
default	09:52:39.198359-0500	RedLemon	Task <959C1A9A-9C3A-47FA-AEA4-202A9267326A>.<14> summary for task success {transaction_duration_ms=2574, response_status=200, connection=48, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=5, secure_connection_duration_ms=0, private_relay=false, request_start_ms=33, request_duration_ms=0, response_start_ms=2573, response_duration_ms=0, request_bytes=277, response_bytes=19768, cache_hit=false}
default	09:52:39.198590-0500	RedLemon	Task <959C1A9A-9C3A-47FA-AEA4-202A9267326A>.<14> finished successfully
default	09:52:39.207056-0500	RedLemon	Task <1E81AEA7-70ED-448E-949E-85E58A2CFA67>.<296> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:39.207645-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [ADD6C96F-A7EE-433C-85D2-DBE357591827] (reporting strategy default)> on Task <1E81AEA7-70ED-448E-949E-85E58A2CFA67>.<296> was not selected for reporting
default	09:52:39.209271-0500	RedLemon	Connection 50: starting, TC(0x0)
default	09:52:39.209350-0500	RedLemon	[C50 EA2D2901-30FE-49BB-BB3E-440BD08841C5 127.0.0.1:47253 tcp, url hash: 94a68d18, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{77FB6E13-E53B-463D-8DF7-A6D883A4CEA5}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:39.209462-0500	RedLemon	[C50 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	09:52:39.209764-0500	RedLemon	[C50 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), interface: lo0)] event: path:satisfied @0.000s, uuid: DE5281A4-586E-4DFF-91E0-C0F88B087B11
default	09:52:39.210422-0500	RedLemon	[C50 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), interface: lo0)] event: flow:start_connect @0.001s
default	09:52:39.210468-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C50] reporting state preparing
default	09:52:39.210854-0500	RedLemon	Task <1E81AEA7-70ED-448E-949E-85E58A2CFA67>.<296> setting up Connection 50
default	09:52:39.211314-0500	RedLemon	nw_socket_handle_socket_event [C50:2] Socket received CONNECTED event
default	09:52:39.213152-0500	RedLemon	nw_flow_connected [C50 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	09:52:39.213231-0500	RedLemon	[C50 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.003s
default	09:52:39.213289-0500	RedLemon	nw_flow_connected [C50 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:39.213573-0500	RedLemon	[C50 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.004s
default	09:52:39.214021-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C50] reporting state ready
default	09:52:39.215157-0500	RedLemon	[C50 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.005s
default	09:52:39.215260-0500	RedLemon	Connection 50: connected successfully
default	09:52:39.215367-0500	RedLemon	Connection 50: ready C(N) E(N)
default	09:52:39.215626-0500	RedLemon	Task <1E81AEA7-70ED-448E-949E-85E58A2CFA67>.<296> now using Connection 50
default	09:52:39.215857-0500	RedLemon	Connection 50: received viability advisory(Y)
default	09:52:39.216880-0500	RedLemon	Task <1E81AEA7-70ED-448E-949E-85E58A2CFA67>.<296> sent request, body S 90
default	09:52:39.217994-0500	RedLemon	🔓 Unlock request: infoHash=54753892d63a..., fileIdx=0
default	09:52:39.218115-0500	RedLemon	✅ Token found, attempting unlock...
default	09:52:39.218467-0500	RedLemon	✅ Unlocked successfully: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	09:52:39.219917-0500	RedLemon	Task <1E81AEA7-70ED-448E-949E-85E58A2CFA67>.<296> received response, status 200 content K
default	09:52:39.224580-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:39.224632-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:39.224679-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:39.225544-0500	RedLemon	Task <1E81AEA7-70ED-448E-949E-85E58A2CFA67>.<296> response ended
default	09:52:39.226438-0500	RedLemon	Task <1E81AEA7-70ED-448E-949E-85E58A2CFA67>.<296> done using Connection 50
default	09:52:39.226965-0500	RedLemon	Task <1E81AEA7-70ED-448E-949E-85E58A2CFA67>.<296> summary for task success {transaction_duration_ms=18, response_status=200, connection=50, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=3, secure_connection_duration_ms=0, private_relay=false, request_start_ms=7, request_duration_ms=0, response_start_ms=11, response_duration_ms=7, request_bytes=372, response_bytes=358, cache_hit=true}
default	09:52:39.227190-0500	RedLemon	Task <1E81AEA7-70ED-448E-949E-85E58A2CFA67>.<296> finished successfully
default	09:52:39.227401-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	09:52:39.227638-0500	RedLemon	Task <8318AB33-C741-4D0E-89D6-C40967A3771F>.<299> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:39.227638-0500	RedLemon	Task <3815B18A-3588-4A48-B30E-A11B90508DC4>.<297> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:39.227638-0500	RedLemon	Task <E5409966-D7A4-4F8B-920D-205BA0C9C119>.<298> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:39.229173-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9CF728E3-014C-4DED-9862-C96BCB435AFB] (reporting strategy default)> on Task <3815B18A-3588-4A48-B30E-A11B90508DC4>.<297> was not selected for reporting
default	09:52:39.229312-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6D047884-5E32-4496-AD38-34760DEE7094] (reporting strategy default)> on Task <E5409966-D7A4-4F8B-920D-205BA0C9C119>.<298> was not selected for reporting
default	09:52:39.229804-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8DBCAE8C-80BB-47EB-A936-34E45D771CC1] (reporting strategy default)> on Task <8318AB33-C741-4D0E-89D6-C40967A3771F>.<299> was not selected for reporting
default	09:52:39.232517-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1540 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:39.233896-0500	runningboardd	Assertion 173-4529-1540 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:39.235311-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:39.235366-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:39.235413-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:39.238296-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1541 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:39.238514-0500	runningboardd	Assertion 173-114-1541 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:39.240061-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:39.240111-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:39.240159-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:39.242274-0500	RedLemon	Task <3815B18A-3588-4A48-B30E-A11B90508DC4>.<297> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:39.246541-0500	RedLemon	Task <3815B18A-3588-4A48-B30E-A11B90508DC4>.<297> now using Connection 26
default	09:52:39.250833-0500	RedLemon	Task <E5409966-D7A4-4F8B-920D-205BA0C9C119>.<298> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:39.252758-0500	RedLemon	Task <E5409966-D7A4-4F8B-920D-205BA0C9C119>.<298> now using Connection 26
default	09:52:39.254297-0500	RedLemon	Task <8318AB33-C741-4D0E-89D6-C40967A3771F>.<299> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:39.254792-0500	RedLemon	Task <8318AB33-C741-4D0E-89D6-C40967A3771F>.<299> now using Connection 26
default	09:52:39.256474-0500	RedLemon	0x7fb19c445458 ID=24 Task <3815B18A-3588-4A48-B30E-A11B90508DC4>.<297> sent request, body N 0
default	09:52:39.256556-0500	RedLemon	0x7fb19c4ed8f8 ID=28 Task <E5409966-D7A4-4F8B-920D-205BA0C9C119>.<298> sent request, body N 0
default	09:52:39.256609-0500	RedLemon	0x7fb19c410628 ID=32 Task <8318AB33-C741-4D0E-89D6-C40967A3771F>.<299> sent request, body N 0
default	09:52:39.517508-0500	RedLemon	Task <26B3ABC7-A99C-47F7-AA47-E0E997428C40>.<15> received response, status 200 content K
default	09:52:39.518202-0500	RedLemon	Task <26B3ABC7-A99C-47F7-AA47-E0E997428C40>.<15> response ended
default	09:52:39.518300-0500	RedLemon	Task <26B3ABC7-A99C-47F7-AA47-E0E997428C40>.<15> done using Connection 49
default	09:52:39.518460-0500	RedLemon	Task <26B3ABC7-A99C-47F7-AA47-E0E997428C40>.<15> summary for task success {transaction_duration_ms=2157, response_status=200, connection=49, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=2, secure_connection_duration_ms=0, private_relay=false, request_start_ms=4, request_duration_ms=0, response_start_ms=2156, response_duration_ms=0, request_bytes=277, response_bytes=19768, cache_hit=false}
default	09:52:39.518733-0500	RedLemon	Task <26B3ABC7-A99C-47F7-AA47-E0E997428C40>.<15> finished successfully
default	09:52:39.526077-0500	RedLemon	Task <C7517585-B7EC-4646-87AB-213295C3E64D>.<300> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:39.526520-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [20282840-2CA8-470C-897C-751F5CA813E5] (reporting strategy default)> on Task <C7517585-B7EC-4646-87AB-213295C3E64D>.<300> was not selected for reporting
default	09:52:39.527606-0500	RedLemon	Task <C7517585-B7EC-4646-87AB-213295C3E64D>.<300> now using Connection 50
default	09:52:39.528676-0500	RedLemon	Task <C7517585-B7EC-4646-87AB-213295C3E64D>.<300> sent request, body S 90
default	09:52:39.531657-0500	RedLemon	🔓 Unlock request: infoHash=54753892d63a..., fileIdx=0
default	09:52:39.532134-0500	RedLemon	✅ Token found, attempting unlock...
default	09:52:39.532910-0500	RedLemon	✅ Unlocked successfully: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	09:52:39.536768-0500	RedLemon	Task <C7517585-B7EC-4646-87AB-213295C3E64D>.<300> received response, status 200 content K
default	09:52:39.537096-0500	RedLemon	Task <C7517585-B7EC-4646-87AB-213295C3E64D>.<300> response ended
default	09:52:39.537198-0500	RedLemon	Task <C7517585-B7EC-4646-87AB-213295C3E64D>.<300> done using Connection 50
default	09:52:39.537409-0500	RedLemon	Task <C7517585-B7EC-4646-87AB-213295C3E64D>.<300> summary for task success {transaction_duration_ms=10, response_status=200, connection=50, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=7, response_duration_ms=2, request_bytes=372, response_bytes=358, cache_hit=true}
default	09:52:39.537636-0500	RedLemon	Task <C7517585-B7EC-4646-87AB-213295C3E64D>.<300> finished successfully
default	09:52:39.537868-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	09:52:39.538106-0500	RedLemon	Task <BA1E6400-BB01-473B-8376-FE68E14F6CFF>.<302> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:39.538106-0500	RedLemon	Task <6430045F-8C72-474B-A7A7-CAF33EBF1A53>.<301> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:39.538992-0500	RedLemon	Task <580B43F9-8C80-49E3-AD36-05BCD4B95F7F>.<303> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:39.539349-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0F82490D-4A64-45CE-953A-D561795AD156] (reporting strategy default)> on Task <6430045F-8C72-474B-A7A7-CAF33EBF1A53>.<301> was not selected for reporting
default	09:52:39.539241-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3CCEEFEE-FBFC-4E84-BA84-8EE09AF358A0] (reporting strategy default)> on Task <BA1E6400-BB01-473B-8376-FE68E14F6CFF>.<302> was not selected for reporting
default	09:52:39.541037-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2085ADAD-175B-46C4-BD7E-500936313B52] (reporting strategy default)> on Task <580B43F9-8C80-49E3-AD36-05BCD4B95F7F>.<303> was not selected for reporting
default	09:52:39.541109-0500	RedLemon	Task <6430045F-8C72-474B-A7A7-CAF33EBF1A53>.<301> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:39.541296-0500	RedLemon	Task <6430045F-8C72-474B-A7A7-CAF33EBF1A53>.<301> now using Connection 26
default	09:52:39.542489-0500	RedLemon	Task <BA1E6400-BB01-473B-8376-FE68E14F6CFF>.<302> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:39.542680-0500	RedLemon	Task <BA1E6400-BB01-473B-8376-FE68E14F6CFF>.<302> now using Connection 26
default	09:52:39.544539-0500	RedLemon	Task <580B43F9-8C80-49E3-AD36-05BCD4B95F7F>.<303> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:39.544730-0500	RedLemon	Task <580B43F9-8C80-49E3-AD36-05BCD4B95F7F>.<303> now using Connection 26
default	09:52:39.545984-0500	RedLemon	0x7fb19c567cb8 ID=36 Task <6430045F-8C72-474B-A7A7-CAF33EBF1A53>.<301> sent request, body N 0
default	09:52:39.546039-0500	RedLemon	0x7fb19bbc7a58 ID=40 Task <BA1E6400-BB01-473B-8376-FE68E14F6CFF>.<302> sent request, body N 0
default	09:52:39.546083-0500	RedLemon	0x7fb19c5e65d8 ID=44 Task <580B43F9-8C80-49E3-AD36-05BCD4B95F7F>.<303> sent request, body N 0
default	09:52:39.951560-0500	RedLemon	0x7fb19c410628 ID=32 Task <8318AB33-C741-4D0E-89D6-C40967A3771F>.<299> received response, status 200 content U
default	09:52:39.952461-0500	RedLemon	0x7fb19c445458 ID=24 Task <3815B18A-3588-4A48-B30E-A11B90508DC4>.<297> received response, status 200 content K
default	09:52:39.953396-0500	RedLemon	Task <3815B18A-3588-4A48-B30E-A11B90508DC4>.<297> response ended
default	09:52:39.953958-0500	RedLemon	Task <3815B18A-3588-4A48-B30E-A11B90508DC4>.<297> done using Connection 26
default	09:52:39.954267-0500	RedLemon	Task <3815B18A-3588-4A48-B30E-A11B90508DC4>.<297> summary for task success {transaction_duration_ms=724, response_status=200, connection=26, reused=1, request_start_ms=16, request_duration_ms=9, response_start_ms=722, response_duration_ms=1, request_bytes=112, response_bytes=3275, cache_hit=true}
default	09:52:39.954667-0500	RedLemon	Task <3815B18A-3588-4A48-B30E-A11B90508DC4>.<297> finished successfully
default	09:52:39.956439-0500	RedLemon	0x7fb19c4ed8f8 ID=28 Task <E5409966-D7A4-4F8B-920D-205BA0C9C119>.<298> received response, status 200 content U
default	09:52:39.966095-0500	RedLemon	Task <8318AB33-C741-4D0E-89D6-C40967A3771F>.<299> response ended
default	09:52:39.967036-0500	RedLemon	Task <8318AB33-C741-4D0E-89D6-C40967A3771F>.<299> done using Connection 26
default	09:52:39.967708-0500	RedLemon	Task <8318AB33-C741-4D0E-89D6-C40967A3771F>.<299> summary for task success {transaction_duration_ms=734, response_status=200, connection=26, reused=1, request_start_ms=22, request_duration_ms=1, response_start_ms=718, response_duration_ms=15, request_bytes=112, response_bytes=39898, cache_hit=true}
default	09:52:39.967972-0500	RedLemon	Task <8318AB33-C741-4D0E-89D6-C40967A3771F>.<299> finished successfully
default	09:52:40.013036-0500	RedLemon	Task <E5409966-D7A4-4F8B-920D-205BA0C9C119>.<298> response ended
default	09:52:40.013525-0500	RedLemon	Task <E5409966-D7A4-4F8B-920D-205BA0C9C119>.<298> done using Connection 26
default	09:52:40.013767-0500	RedLemon	Task <E5409966-D7A4-4F8B-920D-205BA0C9C119>.<298> summary for task success {transaction_duration_ms=783, response_status=200, connection=26, reused=1, request_start_ms=22, request_duration_ms=3, response_start_ms=725, response_duration_ms=57, request_bytes=112, response_bytes=91141, cache_hit=true}
default	09:52:40.014528-0500	RedLemon	Task <E5409966-D7A4-4F8B-920D-205BA0C9C119>.<298> finished successfully
default	09:52:40.027126-0500	RedLemon	🎬🎬🎬 MPVPlayerView INIT called - streamURL: https://chi7-4.download.real-debrid.com/d/BFXVFRZ2BVHPE111/F, subtitles: 3
default	09:52:40.062372-0500	RedLemon	0x7fb19bbc7a58 ID=40 Task <BA1E6400-BB01-473B-8376-FE68E14F6CFF>.<302> received response, status 200 content U
default	09:52:40.075642-0500	RedLemon	0x7fb19c5e65d8 ID=44 Task <580B43F9-8C80-49E3-AD36-05BCD4B95F7F>.<303> received response, status 200 content U
default	09:52:40.103543-0500	RedLemon	Task <580B43F9-8C80-49E3-AD36-05BCD4B95F7F>.<303> response ended
default	09:52:40.104330-0500	RedLemon	Task <580B43F9-8C80-49E3-AD36-05BCD4B95F7F>.<303> done using Connection 26
default	09:52:40.105401-0500	RedLemon	Task <580B43F9-8C80-49E3-AD36-05BCD4B95F7F>.<303> summary for task success {transaction_duration_ms=563, response_status=200, connection=26, reused=1, request_start_ms=3, request_duration_ms=1, response_start_ms=533, response_duration_ms=29, request_bytes=112, response_bytes=39903, cache_hit=true}
default	09:52:40.106769-0500	RedLemon	Task <580B43F9-8C80-49E3-AD36-05BCD4B95F7F>.<303> finished successfully
default	09:52:40.107611-0500	RedLemon	✅ Stream ready, starting playback...
default	09:52:40.107805-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	09:52:40.108186-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7fb1988d8a90>
default	09:52:40.108330-0500	RedLemon	   Is fullscreen: 0
default	09:52:40.108581-0500	RedLemon	   ✅ WindowManager: Toggling fullscreen ON
default	09:52:40.112652-0500	RedLemon	Task <BA1E6400-BB01-473B-8376-FE68E14F6CFF>.<302> response ended
default	09:52:40.113785-0500	RedLemon	Task <BA1E6400-BB01-473B-8376-FE68E14F6CFF>.<302> done using Connection 26
default	09:52:40.114787-0500	RedLemon	Task <BA1E6400-BB01-473B-8376-FE68E14F6CFF>.<302> summary for task success {transaction_duration_ms=574, response_status=200, connection=26, reused=1, request_start_ms=2, request_duration_ms=3, response_start_ms=521, response_duration_ms=51, request_bytes=112, response_bytes=91145, cache_hit=true}
default	09:52:40.115221-0500	RedLemon	Task <BA1E6400-BB01-473B-8376-FE68E14F6CFF>.<302> finished successfully
default	09:52:40.170506-0500	RedLemon	🖼️ Setting up MPV with native macOS video output...
default	09:52:40.183751-0500	RedLemon	✅ MPV initialized with native GPU rendering
default	09:52:40.187071-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task starting
default	09:52:40.187279-0500	RedLemon	🎉 Starting watch party sync - Room: 3PBW, Host: NO
default	09:52:40.229424-0500	RedLemon	0x7fb19c567cb8 ID=36 Task <6430045F-8C72-474B-A7A7-CAF33EBF1A53>.<301> received response, status 200 content K
default	09:52:40.230339-0500	RedLemon	Task <6430045F-8C72-474B-A7A7-CAF33EBF1A53>.<301> response ended
default	09:52:40.240515-0500	RedLemon	Task <6430045F-8C72-474B-A7A7-CAF33EBF1A53>.<301> done using Connection 26
default	09:52:40.242398-0500	RedLemon	Task <6430045F-8C72-474B-A7A7-CAF33EBF1A53>.<301> summary for task success {transaction_duration_ms=702, response_status=200, connection=26, reused=1, request_start_ms=1, request_duration_ms=4, response_start_ms=689, response_duration_ms=12, request_bytes=112, response_bytes=3281, cache_hit=true}
default	09:52:40.242849-0500	RedLemon	Task <6430045F-8C72-474B-A7A7-CAF33EBF1A53>.<301> finished successfully
default	09:52:40.277689-0500	runningboardd	Invalidating assertion 173-4529-1540 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:40.281166-0500	runningboardd	Invalidating assertion 173-171-1473 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	09:52:40.286498-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.WindowServer(88)>:171] with description <RBSAssertionDescriptor| "AppVisible" ID:173-171-1545 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:40.286684-0500	runningboardd	Assertion 173-171-1545 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:40.311178-0500	RedLemon	🔄 Starting chat polling for room: 3PBW
default	09:52:40.312227-0500	RedLemon	✅ Watch party sync started successfully - isInWatchParty is now TRUE
default	09:52:40.312424-0500	RedLemon	🎬🎬🎬 About to call loadStream - isInWatchParty: YES
default	09:52:40.312917-0500	RedLemon	🎬🎬🎬 Subtitles: 3
default	09:52:40.313313-0500	RedLemon	🎬🎬🎬 LOADSTREAM CALLED - streamTitle: Frankenstein
default	09:52:40.313812-0500	RedLemon	🎬🎬🎬 streamURL: https://chi7-4.download.real-debrid.com/d/BFXVFRZ2BVHPE111/F
default	09:52:40.314372-0500	RedLemon	🎬🎬🎬 subtitles: 3
default	09:52:40.315391-0500	RedLemon	🎬 MPV loadVideo called with URL: https://chi7-4.download.real-debrid.com/d/BFXVFRZ2BVHPE111/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1., autoplay: false
default	09:52:40.315706-0500	RedLemon	🎬 MPV executing command: loadfile "https://chi7-4.download.real-debrid.com/d/BFXVFRZ2BVHPE111/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv" pause
default	09:52:40.316164-0500	RedLemon	🎬 MPV loadfile result: -4
default	09:52:40.317361-0500	RedLemon	❌ MPV loadfile failed with code: -4
default	09:52:40.318293-0500	RedLemon	✅ Subtitles already downloaded, loading as additional options...
default	09:52:40.319523-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task completed
default	09:52:40.413769-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:40.414695-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:40.415849-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:40.417442-0500	runningboardd	Invalidating assertion 173-114-1541 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:40.479705-0500	RedLemon	✅ Stream ready, starting playback...
default	09:52:40.480004-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	09:52:40.480741-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7fb1988d8a90>
default	09:52:40.481118-0500	RedLemon	   Is fullscreen: 1
default	09:52:40.481573-0500	RedLemon	   ⚠️ WindowManager: Already in fullscreen
default	09:52:40.482234-0500	RedLemon	Task <C93C2C1B-4E7C-4F8E-BB0A-EF10BFC0FC36>.<304> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:40.482688-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DD26E5F0-484A-48E9-99A4-EC04B74A489B] (reporting strategy default)> on Task <C93C2C1B-4E7C-4F8E-BB0A-EF10BFC0FC36>.<304> was not selected for reporting
default	09:52:40.484081-0500	RedLemon	Task <C93C2C1B-4E7C-4F8E-BB0A-EF10BFC0FC36>.<304> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:40.484446-0500	RedLemon	Task <C93C2C1B-4E7C-4F8E-BB0A-EF10BFC0FC36>.<304> now using Connection 2
default	09:52:40.487346-0500	RedLemon	0x7fb19c354df8 ID=464 Task <C93C2C1B-4E7C-4F8E-BB0A-EF10BFC0FC36>.<304> sent request, body N 0
default	09:52:40.491004-0500	RedLemon	📝 Loading external subtitle 1 (Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_B9849569-56EA-4F62-9FAA-8C3EEBFC303E/Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA.srt
default	09:52:40.491887-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_B9849569-56EA-4
default	09:52:40.492988-0500	RedLemon	❌ Failed to load subtitle, MPV error code: -12
default	09:52:40.493172-0500	RedLemon	📝 Loading external subtitle 2 (Frankenstein (2025) eng): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_BC6CAFFF-4E8D-4D37-AD13-6EB9EB5FA053/Frankenstein (2025) eng.srt
default	09:52:40.493532-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_BC6CAFFF-4E8D-4
default	09:52:40.494240-0500	RedLemon	❌ Failed to load subtitle, MPV error code: -12
default	09:52:40.494440-0500	RedLemon	📝 Loading external subtitle 3 (Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_E50992DA-E1C8-40AA-A160-5D58923B6146/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.eng.srt
default	09:52:40.494822-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_E50992DA-E1C8-4
default	09:52:40.495569-0500	RedLemon	❌ Failed to load subtitle, MPV error code: -12
default	09:52:40.495728-0500	RedLemon	ℹ️ External subtitles loaded as additional options (embedded subs take priority)
default	09:52:40.527795-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:40.527910-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:40.528065-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:40.549277-0500	RedLemon	0x7fb19c354df8 ID=464 Task <C93C2C1B-4E7C-4F8E-BB0A-EF10BFC0FC36>.<304> received response, status 200 content K
default	09:52:40.550131-0500	RedLemon	Task <C93C2C1B-4E7C-4F8E-BB0A-EF10BFC0FC36>.<304> response ended
default	09:52:40.551526-0500	RedLemon	Task <C93C2C1B-4E7C-4F8E-BB0A-EF10BFC0FC36>.<304> done using Connection 2
default	09:52:40.552081-0500	RedLemon	Task <C93C2C1B-4E7C-4F8E-BB0A-EF10BFC0FC36>.<304> summary for task success {transaction_duration_ms=68, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=65, response_duration_ms=2, request_bytes=530, response_bytes=662, cache_hit=false}
default	09:52:40.552300-0500	RedLemon	Task <C93C2C1B-4E7C-4F8E-BB0A-EF10BFC0FC36>.<304> finished successfully
default	09:52:40.553270-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1546 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:40.553699-0500	runningboardd	Assertion 173-4529-1546 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:40.557548-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:40.557605-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:40.557652-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:40.558310-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1547 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:40.558532-0500	runningboardd	Assertion 173-114-1547 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:40.560149-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:40.560201-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:40.560250-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:40.621159-0500	RedLemon	Task <AD44830C-9146-41EE-A8D3-49E19E519456>.<305> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:40.622169-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [09F5E582-549A-43B6-82E4-5D1A72B464B2] (reporting strategy default)> on Task <AD44830C-9146-41EE-A8D3-49E19E519456>.<305> was not selected for reporting
default	09:52:40.623230-0500	RedLemon	Task <AD44830C-9146-41EE-A8D3-49E19E519456>.<305> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:40.623488-0500	RedLemon	Task <AD44830C-9146-41EE-A8D3-49E19E519456>.<305> now using Connection 43
default	09:52:40.624001-0500	RedLemon	Task <AD44830C-9146-41EE-A8D3-49E19E519456>.<305> sent request, body N 0
default	09:52:40.635822-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:40.639889-0500	RedLemon	Task <AD44830C-9146-41EE-A8D3-49E19E519456>.<305> received response, status 200 content K
default	09:52:40.643981-0500	RedLemon	Task <AD44830C-9146-41EE-A8D3-49E19E519456>.<305> done using Connection 43
default	09:52:40.644188-0500	RedLemon	Task <AD44830C-9146-41EE-A8D3-49E19E519456>.<305> response ended
default	09:52:40.645145-0500	RedLemon	Task <AD44830C-9146-41EE-A8D3-49E19E519456>.<305> summary for task success {transaction_duration_ms=22, response_status=200, connection=43, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=15, response_duration_ms=5, request_bytes=41, response_bytes=117950, cache_hit=false}
default	09:52:40.645272-0500	RedLemon	Task <AD44830C-9146-41EE-A8D3-49E19E519456>.<305> finished successfully
default	09:52:40.712276-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:40.712608-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D8D3EFDA-E343-4476-9872-C8117C2BFB51] (reporting strategy default)> on Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> was not selected for reporting
default	09:52:40.713239-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:40.713761-0500	RedLemon	Connection 51: enabling TLS
default	09:52:40.713784-0500	RedLemon	Connection 51: starting, TC(0x0)
default	09:52:40.713816-0500	RedLemon	[C51 ADB69F9F-4825-4222-ACAB-2E3CFE0DE9F1 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{381ED6E4-70D6-4F19-BE65-DE13ACDB4EEE}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:40.713867-0500	RedLemon	[C51 Hostname#11e4b683:443 initial path ((null))] event: path:start @0.000s
default	09:52:40.714184-0500	RedLemon	[C51 Hostname#11e4b683:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 5AC621FD-903E-44E8-BE24-19B086921B76
default	09:52:40.714437-0500	RedLemon	[C51 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	09:52:40.714464-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state preparing
default	09:52:40.714629-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> setting up Connection 51
default	09:52:40.714662-0500	mDNSResponder	[R1592] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 4529 (RedLemon)
default	09:52:40.716017-0500	mDNSResponder	[R1592] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 4529 (RedLemon)
default	09:52:40.716129-0500	RedLemon	nw_endpoint_resolver_update [C51 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#fd2705f0:443
default	09:52:40.716253-0500	RedLemon	[C51 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	09:52:40.716439-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 initial path ((null))] event: path:start @0.002s
default	09:52:40.716790-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.002s, uuid: B80B3242-5126-44B5-814A-D250947A9CCB
default	09:52:40.716932-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.003s
default	09:52:40.717550-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.003s
default	09:52:40.718413-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.004s
default	09:52:40.718574-0500	RedLemon	tcp_output [C51.1:3] flags=[S] seq=2272046353, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2272046353
default	09:52:40.819832-0500	runningboardd	Invalidating assertion 173-171-1545 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	09:52:40.841984-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:40.842221-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:40.842819-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:40.841933-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.WindowServer(88)>:171] with description <RBSAssertionDescriptor| "AppVisible" ID:173-171-1550 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:40.844266-0500	runningboardd	Assertion 173-171-1550 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:40.845473-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:40.845515-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:40.845557-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:40.848678-0500	RedLemon	tcp_input [C51.1:3] flags=[S.] seq=413483718, ack=2272046354, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2272046353
default	09:52:40.848812-0500	RedLemon	nw_flow_connected [C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:40.849029-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.135s
default	09:52:40.849134-0500	RedLemon	[C51 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.135s
default	09:52:40.849700-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C51.1:2][0x7fb19c39e0e0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	09:52:40.849828-0500	RedLemon	boringssl_context_info_handler(2028) [C51.1:2][0x7fb19c39e0e0] Client handshake started
default	09:52:40.850028-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS client enter_early_data
default	09:52:40.850169-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS client read_server_hello
default	09:52:41.332397-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	09:52:41.332534-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client read_server_hello
default	09:52:41.333234-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	09:52:41.334048-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client read_certificate_request
default	09:52:41.334985-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client read_server_certificate
default	09:52:41.335123-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	09:52:41.335964-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C51.1:2][0x7fb19c39e0e0] Performing external trust evaluation
default	09:52:41.336146-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C51.1:2][0x7fb19c39e0e0] Asyncing for external verify block
default	09:52:41.336334-0500	RedLemon	Connection 51: asked to evaluate TLS Trust
default	09:52:41.336656-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> auth completion disp=1 cred=0x0
default	09:52:41.342205-0500	RedLemon	Connection 51: TLS Trust result 0
default	09:52:41.342256-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C51.1:2][0x7fb19c39e0e0] Returning from external verify block with result: true
default	09:52:41.342314-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C51.1:2][0x7fb19c39e0e0] Certificate verification result: OK
default	09:52:41.342679-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client read_server_finished
default	09:52:41.342859-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	09:52:41.342881-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	09:52:41.342901-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client send_client_certificate
default	09:52:41.342920-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client complete_second_flight
default	09:52:41.343111-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS 1.3 client done
default	09:52:41.343300-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS client finish_client_handshake
default	09:52:41.343347-0500	RedLemon	boringssl_context_info_handler(2045) [C51.1:2][0x7fb19c39e0e0] Client handshake state: TLS client done
default	09:52:41.343416-0500	RedLemon	boringssl_context_info_handler(2034) [C51.1:2][0x7fb19c39e0e0] Client handshake done
default	09:52:41.344086-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C51.1:2][0x7fb19c39e0e0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(494ms) flight_time(484ms) rtt(483ms) write_stalls(0) read_stalls(7)]
default	09:52:41.344259-0500	RedLemon	nw_flow_connected [C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:41.344537-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.630s
default	09:52:41.344926-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state ready
default	09:52:41.344996-0500	RedLemon	[C51 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.631s
default	09:52:41.345143-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.631s
default	09:52:41.345230-0500	RedLemon	[C51 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.631s
default	09:52:41.345587-0500	RedLemon	Connection 51: connected successfully
default	09:52:41.345647-0500	RedLemon	Connection 51: TLS handshake complete
default	09:52:41.345916-0500	RedLemon	Connection 51: ready C(N) E(N)
default	09:52:41.346088-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> now using Connection 51
default	09:52:41.346183-0500	RedLemon	Connection 51: received viability advisory(Y)
default	09:52:41.346446-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> sent request, body N 0
default	09:52:41.472268-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> received response, status 101 content U
default	09:52:41.472618-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> response ended
default	09:52:41.472712-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> done using Connection 51
default	09:52:41.473680-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.759s
default	09:52:41.473769-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state preparing
default	09:52:41.473901-0500	RedLemon	[C51 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.759s
default	09:52:41.474153-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.760s
default	09:52:41.474219-0500	RedLemon	[C51 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.760s
default	09:52:41.474303-0500	RedLemon	nw_flow_connected [C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:41.474441-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.760s
default	09:52:41.474499-0500	RedLemon	[C51 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.760s
default	09:52:41.474623-0500	RedLemon	nw_flow_connected [C51.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:41.475095-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.761s
default	09:52:41.475183-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state ready
default	09:52:41.475310-0500	RedLemon	[C51 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.761s
default	09:52:41.560934-0500	runningboardd	Invalidating assertion 173-4529-1546 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:41.599673-0500	RedLemon	nw_flow_disconnected [C51.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	09:52:41.600147-0500	RedLemon	nw_protocol_tcp_log_summary [C51.1:3]
	[28AFEB4B-1F76-4C81-9CD7-4917DA92C80E <private>:51449<-><private>:443]
	Init: 1, Conn_Time: 130.232ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 127.656ms, rtt_var: 6.687ms rtt_nc: 128.312ms, rtt_var_nc: 31.562ms base rtt: 119ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	09:52:41.600744-0500	RedLemon	tcp_input [C51.1:3] flags=[F.] seq=413486750, ack=2272047407, win=249 state=ESTABLISHED rcv_nxt=413486750, snd_una=2272047407
default	09:52:41.601648-0500	RedLemon	[C51.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.887s, error Socket is not connected
default	09:52:41.601739-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state failed error Socket is not connected
default	09:52:41.601866-0500	RedLemon	[C51 Hostname#11e4b683:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.887s
error	09:52:41.601979-0500	RedLemon	nw_read_request_report [C51] Receive failed with error "Socket is not connected"
error	09:52:41.602102-0500	RedLemon	nw_flow_service_reads [C51.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	09:52:41.602214-0500	RedLemon	tcp_output [C51.1:3] flags=[R.] seq=2272047538, ack=413486751, win=2047 state=CLOSED rcv_nxt=413486751, snd_una=2272047407
error	09:52:41.602443-0500	RedLemon	Connection 51: received failure notification
default	09:52:41.602716-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> summary for task success {transaction_duration_ms=889, response_status=101, connection=51, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=626, secure_connection_duration_ms=494, private_relay=false, request_start_ms=633, request_duration_ms=0, response_start_ms=759, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	09:52:41.602917-0500	RedLemon	nw_flow_add_write_request [C51.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	09:52:41.603039-0500	RedLemon	nw_write_request_report [C51] Send failed with error "Socket is not connected"
default	09:52:41.603161-0500	RedLemon	Connection 51: cleaning up
default	09:52:41.603266-0500	RedLemon	[C51 ADB69F9F-4825-4222-ACAB-2E3CFE0DE9F1 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancel
default	09:52:41.603219-0500	RedLemon	Task <1C0C7ABF-36AA-4C96-9EB8-094119CB4143>.<1> finished successfully
default	09:52:41.603527-0500	RedLemon	[C51 ADB69F9F-4825-4222-ACAB-2E3CFE0DE9F1 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancelled
	[C51.1 B80B3242-5126-44B5-814A-D250947A9CCB 10.0.0.249:51449<->IPv4#fd2705f0:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.889s, DNS @0.000s took 0.002s, TCP @0.760s took 0.131s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	09:52:41.604434-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state cancelled error Socket is not connected
default	09:52:41.604656-0500	RedLemon	Connection 51: done
default	09:52:41.663930-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:41.664015-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:41.664160-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:41.667170-0500	runningboardd	Invalidating assertion 173-114-1547 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:41.836256-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:41.836354-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:41.836447-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:42.311985-0500	RedLemon	Task <B5F91179-CAB6-4457-8723-03E7919C2B0B>.<306> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:42.312433-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2FB9BFC5-71FA-4F50-B54A-64E8FDE927ED] (reporting strategy default)> on Task <B5F91179-CAB6-4457-8723-03E7919C2B0B>.<306> was not selected for reporting
default	09:52:42.313601-0500	RedLemon	Task <B5F91179-CAB6-4457-8723-03E7919C2B0B>.<306> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:42.313934-0500	RedLemon	Task <B5F91179-CAB6-4457-8723-03E7919C2B0B>.<306> now using Connection 2
default	09:52:42.316726-0500	RedLemon	0x7fb19c3ee9d8 ID=468 Task <B5F91179-CAB6-4457-8723-03E7919C2B0B>.<306> sent request, body N 0
default	09:52:42.380650-0500	RedLemon	0x7fb19c3ee9d8 ID=468 Task <B5F91179-CAB6-4457-8723-03E7919C2B0B>.<306> received response, status 200 content K
default	09:52:42.381968-0500	RedLemon	Task <B5F91179-CAB6-4457-8723-03E7919C2B0B>.<306> response ended
default	09:52:42.382757-0500	RedLemon	Task <B5F91179-CAB6-4457-8723-03E7919C2B0B>.<306> done using Connection 2
default	09:52:42.383111-0500	RedLemon	Task <B5F91179-CAB6-4457-8723-03E7919C2B0B>.<306> summary for task success {transaction_duration_ms=70, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=67, response_duration_ms=2, request_bytes=530, response_bytes=662, cache_hit=false}
default	09:52:42.383575-0500	RedLemon	Task <B5F91179-CAB6-4457-8723-03E7919C2B0B>.<306> finished successfully
default	09:52:42.384912-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1551 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:42.385314-0500	runningboardd	Assertion 173-4529-1551 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:42.387227-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:42.387506-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:42.387587-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:42.390821-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1552 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:42.391052-0500	runningboardd	Assertion 173-114-1552 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:42.392563-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:42.392640-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:42.392867-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:42.394481-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:43.062097-0500	RedLemon	🔍 MPV track-list/count: 0
default	09:52:43.062308-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	09:52:43.391154-0500	runningboardd	Invalidating assertion 173-4529-1551 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:43.558284-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:43.558676-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:43.558967-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:43.561213-0500	runningboardd	Invalidating assertion 173-114-1552 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:43.671046-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:43.671106-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:43.671154-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:44.313172-0500	RedLemon	Task <D7F3714F-37CC-4C64-AB58-887FE039906D>.<307> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:44.313632-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8C842575-B387-416D-A186-381A971E6BFA] (reporting strategy default)> on Task <D7F3714F-37CC-4C64-AB58-887FE039906D>.<307> was not selected for reporting
default	09:52:44.314954-0500	RedLemon	Task <D7F3714F-37CC-4C64-AB58-887FE039906D>.<307> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:44.315385-0500	RedLemon	Task <D7F3714F-37CC-4C64-AB58-887FE039906D>.<307> now using Connection 2
default	09:52:44.316658-0500	RedLemon	0x7fb19c312de8 ID=472 Task <D7F3714F-37CC-4C64-AB58-887FE039906D>.<307> sent request, body N 0
default	09:52:44.382308-0500	RedLemon	0x7fb19c312de8 ID=472 Task <D7F3714F-37CC-4C64-AB58-887FE039906D>.<307> received response, status 200 content K
default	09:52:44.384692-0500	RedLemon	Task <D7F3714F-37CC-4C64-AB58-887FE039906D>.<307> response ended
default	09:52:44.385474-0500	RedLemon	Task <D7F3714F-37CC-4C64-AB58-887FE039906D>.<307> done using Connection 2
default	09:52:44.387154-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1554 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:44.385936-0500	RedLemon	Task <D7F3714F-37CC-4C64-AB58-887FE039906D>.<307> summary for task success {transaction_duration_ms=71, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=67, response_duration_ms=3, request_bytes=530, response_bytes=662, cache_hit=false}
default	09:52:44.387686-0500	runningboardd	Assertion 173-4529-1554 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:44.386776-0500	RedLemon	Task <D7F3714F-37CC-4C64-AB58-887FE039906D>.<307> finished successfully
default	09:52:44.391654-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:44.391921-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:44.392060-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:44.394268-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1555 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:44.394548-0500	runningboardd	Assertion 173-114-1555 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:44.395529-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:44.395581-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:44.395631-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:44.396166-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:44.667081-0500	RedLemon	🔍 MPV track-list/count: 0
default	09:52:44.667377-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	09:52:45.397391-0500	runningboardd	Invalidating assertion 173-4529-1554 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:45.558690-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:45.558785-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:45.558875-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:45.561134-0500	runningboardd	Invalidating assertion 173-114-1555 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:45.675733-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:45.675826-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:45.675910-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:46.312288-0500	RedLemon	Task <CB3CEF76-CAA1-4376-8A5A-E05CD32B4673>.<308> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:46.312834-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DF71153C-8AAE-4F27-9242-60DB25B1B0A0] (reporting strategy default)> on Task <CB3CEF76-CAA1-4376-8A5A-E05CD32B4673>.<308> was not selected for reporting
default	09:52:46.313393-0500	RedLemon	🔍 MPV track-list/count: 0
default	09:52:46.313581-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	09:52:46.313808-0500	RedLemon	Task <CB3CEF76-CAA1-4376-8A5A-E05CD32B4673>.<308> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:46.314176-0500	RedLemon	Task <CB3CEF76-CAA1-4376-8A5A-E05CD32B4673>.<308> now using Connection 2
default	09:52:46.315160-0500	RedLemon	0x7fb19c4dc0a8 ID=476 Task <CB3CEF76-CAA1-4376-8A5A-E05CD32B4673>.<308> sent request, body N 0
default	09:52:46.379374-0500	RedLemon	0x7fb19c4dc0a8 ID=476 Task <CB3CEF76-CAA1-4376-8A5A-E05CD32B4673>.<308> received response, status 200 content K
default	09:52:46.380419-0500	RedLemon	Task <CB3CEF76-CAA1-4376-8A5A-E05CD32B4673>.<308> response ended
default	09:52:46.381233-0500	RedLemon	Task <CB3CEF76-CAA1-4376-8A5A-E05CD32B4673>.<308> done using Connection 2
default	09:52:46.381618-0500	RedLemon	Task <CB3CEF76-CAA1-4376-8A5A-E05CD32B4673>.<308> summary for task success {transaction_duration_ms=68, response_status=200, connection=2, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=65, response_duration_ms=2, request_bytes=530, response_bytes=662, cache_hit=false}
default	09:52:46.382183-0500	RedLemon	Task <CB3CEF76-CAA1-4376-8A5A-E05CD32B4673>.<308> finished successfully
default	09:52:46.383347-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1557 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:46.383817-0500	runningboardd	Assertion 173-4529-1557 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:46.385538-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:46.385620-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:46.385710-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:46.389086-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1558 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:46.389386-0500	runningboardd	Assertion 173-114-1558 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:46.390430-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:46.390542-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:46.390605-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:46.392733-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:47.391733-0500	runningboardd	Invalidating assertion 173-4529-1557 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:47.558288-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:47.558379-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:47.558471-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:47.560370-0500	runningboardd	Invalidating assertion 173-114-1558 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:47.687292-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:47.687367-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:47.687442-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:48.313030-0500	RedLemon	Task <E0A69A39-D86E-42E0-84E0-3BF2CFD7BEA3>.<309> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:48.313441-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [646F8AAC-7821-4CB2-9366-325B061E8E97] (reporting strategy default)> on Task <E0A69A39-D86E-42E0-84E0-3BF2CFD7BEA3>.<309> was not selected for reporting
default	09:52:48.314673-0500	RedLemon	Task <E0A69A39-D86E-42E0-84E0-3BF2CFD7BEA3>.<309> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:48.315013-0500	RedLemon	Task <E0A69A39-D86E-42E0-84E0-3BF2CFD7BEA3>.<309> now using Connection 2
default	09:52:48.317744-0500	RedLemon	0x7fb198ac0f18 ID=480 Task <E0A69A39-D86E-42E0-84E0-3BF2CFD7BEA3>.<309> sent request, body N 0
default	09:52:48.376595-0500	RedLemon	0x7fb198ac0f18 ID=480 Task <E0A69A39-D86E-42E0-84E0-3BF2CFD7BEA3>.<309> received response, status 200 content K
default	09:52:48.377517-0500	RedLemon	Task <E0A69A39-D86E-42E0-84E0-3BF2CFD7BEA3>.<309> response ended
default	09:52:48.378010-0500	RedLemon	Task <E0A69A39-D86E-42E0-84E0-3BF2CFD7BEA3>.<309> done using Connection 2
default	09:52:48.378546-0500	RedLemon	Task <E0A69A39-D86E-42E0-84E0-3BF2CFD7BEA3>.<309> summary for task success {transaction_duration_ms=64, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=62, response_duration_ms=2, request_bytes=530, response_bytes=663, cache_hit=false}
default	09:52:48.379462-0500	RedLemon	Task <E0A69A39-D86E-42E0-84E0-3BF2CFD7BEA3>.<309> finished successfully
default	09:52:48.383826-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1559 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:48.384368-0500	runningboardd	Assertion 173-4529-1559 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:48.386187-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:48.386249-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:48.386305-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:48.390760-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1560 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:48.390944-0500	runningboardd	Assertion 173-114-1560 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:48.391819-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:48.391869-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:48.391952-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:48.416357-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:48.802651-0500	runningboardd	Invalidating assertion 173-140-1527 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.coreservices.launchservicesd>:140]
default	09:52:48.914205-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:48.914252-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:48.914330-0500	runningboardd	[anon<RedLemon>(501):4529] Set darwin role to: UserInteractiveNonFocal
default	09:52:48.914572-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:49.070292-0500	runningboardd	Invalidating assertion 173-171-1550 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	09:52:49.190596-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:49.190660-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:49.190715-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:49.390211-0500	runningboardd	Invalidating assertion 173-4529-1559 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:49.556655-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:49.556742-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:49.556957-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:49.559799-0500	runningboardd	Invalidating assertion 173-114-1560 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:49.736129-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:49.736229-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:49.736325-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:50.313452-0500	RedLemon	Task <F483C404-8908-4428-B78D-6BF0D01D1893>.<310> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:50.314069-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4642A35F-600B-4217-BB46-5C42E04355E7] (reporting strategy default)> on Task <F483C404-8908-4428-B78D-6BF0D01D1893>.<310> was not selected for reporting
default	09:52:50.315406-0500	RedLemon	Task <F483C404-8908-4428-B78D-6BF0D01D1893>.<310> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:50.315886-0500	RedLemon	Task <F483C404-8908-4428-B78D-6BF0D01D1893>.<310> now using Connection 2
default	09:52:50.317971-0500	RedLemon	0x7fb19c5e0f28 ID=484 Task <F483C404-8908-4428-B78D-6BF0D01D1893>.<310> sent request, body N 0
default	09:52:50.380810-0500	RedLemon	0x7fb19c5e0f28 ID=484 Task <F483C404-8908-4428-B78D-6BF0D01D1893>.<310> received response, status 200 content K
default	09:52:50.381656-0500	RedLemon	Task <F483C404-8908-4428-B78D-6BF0D01D1893>.<310> response ended
default	09:52:50.382165-0500	RedLemon	Task <F483C404-8908-4428-B78D-6BF0D01D1893>.<310> done using Connection 2
default	09:52:50.382584-0500	RedLemon	Task <F483C404-8908-4428-B78D-6BF0D01D1893>.<310> summary for task success {transaction_duration_ms=67, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=65, response_duration_ms=1, request_bytes=530, response_bytes=662, cache_hit=false}
default	09:52:50.383348-0500	RedLemon	Task <F483C404-8908-4428-B78D-6BF0D01D1893>.<310> finished successfully
default	09:52:50.384929-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1577 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:50.385381-0500	runningboardd	Assertion 173-4529-1577 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:50.388139-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:50.388217-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:50.388297-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:50.391632-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1578 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:50.391865-0500	runningboardd	Assertion 173-114-1578 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:50.393244-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:50.393311-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:50.393376-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:50.420768-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:51.418366-0500	runningboardd	Invalidating assertion 173-4529-1577 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:51.567481-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:51.567574-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:51.567666-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:51.569868-0500	runningboardd	Invalidating assertion 173-114-1578 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:51.705537-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:51.705631-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:51.705724-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:52.313530-0500	RedLemon	Task <3FC94288-79EC-42D0-A3D9-83EDC9BF0C77>.<311> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	09:52:52.314091-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D7FE3FFC-0A03-449C-A1C6-C44E7BBA5866] (reporting strategy default)> on Task <3FC94288-79EC-42D0-A3D9-83EDC9BF0C77>.<311> was not selected for reporting
default	09:52:52.315681-0500	RedLemon	Task <3FC94288-79EC-42D0-A3D9-83EDC9BF0C77>.<311> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:52.316262-0500	RedLemon	Task <3FC94288-79EC-42D0-A3D9-83EDC9BF0C77>.<311> now using Connection 2
default	09:52:52.319416-0500	RedLemon	0x7fb19c230918 ID=488 Task <3FC94288-79EC-42D0-A3D9-83EDC9BF0C77>.<311> sent request, body N 0
default	09:52:52.377119-0500	RedLemon	0x7fb19c230918 ID=488 Task <3FC94288-79EC-42D0-A3D9-83EDC9BF0C77>.<311> received response, status 200 content K
default	09:52:52.378289-0500	RedLemon	Task <3FC94288-79EC-42D0-A3D9-83EDC9BF0C77>.<311> response ended
default	09:52:52.379183-0500	RedLemon	Task <3FC94288-79EC-42D0-A3D9-83EDC9BF0C77>.<311> done using Connection 2
default	09:52:52.379880-0500	RedLemon	Task <3FC94288-79EC-42D0-A3D9-83EDC9BF0C77>.<311> summary for task success {transaction_duration_ms=64, response_status=200, connection=2, reused=1, request_start_ms=1, request_duration_ms=3, response_start_ms=61, response_duration_ms=2, request_bytes=530, response_bytes=661, cache_hit=false}
default	09:52:52.380744-0500	RedLemon	Task <3FC94288-79EC-42D0-A3D9-83EDC9BF0C77>.<311> finished successfully
default	09:52:52.382441-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [anon<RedLemon>(501):4529] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-4529-1579 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:52.382730-0500	runningboardd	Assertion 173-4529-1579 (target:[anon<RedLemon>(501):4529]) will be created as active as no start-time-defining assertions exist
default	09:52:52.385041-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:52.385407-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:52.385468-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:52.387599-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4529] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-1580 target:4529 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	09:52:52.387748-0500	runningboardd	Assertion 173-114-1580 (target:[anon<RedLemon>(501):4529]) will be created as active
default	09:52:52.388883-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:52.388922-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:52.389163-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:52.414242-0500	RedLemon	Connection 2: encountered bidirectional stream limit updated event
default	09:52:53.485033-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	09:52:53.485913-0500	runningboardd	Invalidating assertion 173-4529-1579 (target:[anon<RedLemon>(501):4529]) from originator [anon<RedLemon>(501):4529]
default	09:52:53.485850-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BFFB7D41-B97F-4026-BC50-E2E78DCC6C91] (reporting strategy default)> on Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> was not selected for reporting
default	09:52:53.487091-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	09:52:53.488149-0500	RedLemon	Connection 52: enabling TLS
default	09:52:53.488224-0500	RedLemon	Connection 52: starting, TC(0x0)
default	09:52:53.488325-0500	RedLemon	[C52 6E588602-58AF-4C10-8E56-F6E055499FD4 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{6DA1BD68-3ADA-4D11-9D1C-9FC489DF4A25}{(null)}{Y}{2} (private), proc: DA8FB1F5-AA1A-325D-9135-279B69FF40E4] start
default	09:52:53.488493-0500	RedLemon	[C52 Hostname#11e4b683:443 initial path ((null))] event: path:start @0.000s
default	09:52:53.489131-0500	RedLemon	[C52 Hostname#11e4b683:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: FAD18EAB-6587-4585-9ABC-0729A1C90C9D
default	09:52:53.489507-0500	RedLemon	[C52 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	09:52:53.489600-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C52] reporting state preparing
default	09:52:53.489907-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> setting up Connection 52
default	09:52:53.489913-0500	mDNSResponder	[R1597] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 4529 (RedLemon)
default	09:52:53.491657-0500	mDNSResponder	[R1597] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 4529 (RedLemon)
default	09:52:53.492024-0500	RedLemon	nw_endpoint_resolver_update [C52 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#fd2705f0:443
default	09:52:53.492225-0500	RedLemon	[C52 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.003s
default	09:52:53.492537-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 initial path ((null))] event: path:start @0.004s
default	09:52:53.493031-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.004s, uuid: C7826A25-1620-4D99-9D3C-A020C9989D8C
default	09:52:53.493246-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.004s
default	09:52:53.494060-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.005s
default	09:52:53.495039-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.006s
default	09:52:53.495245-0500	RedLemon	tcp_output [C52.1:3] flags=[S] seq=49486479, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=49486479
default	09:52:53.620357-0500	RedLemon	tcp_input [C52.1:3] flags=[S.] seq=3846708469, ack=49486480, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=49486479
default	09:52:53.620574-0500	RedLemon	nw_flow_connected [C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:53.620812-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.132s
default	09:52:53.620927-0500	RedLemon	[C52 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.132s
default	09:52:53.621537-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C52.1:2][0x7fb19c46b430] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	09:52:53.621751-0500	RedLemon	boringssl_context_info_handler(2028) [C52.1:2][0x7fb19c46b430] Client handshake started
default	09:52:53.622122-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS client enter_early_data
default	09:52:53.622409-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS client read_server_hello
default	09:52:53.659686-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:53.659773-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:53.659898-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:53.663248-0500	runningboardd	Invalidating assertion 173-114-1580 (target:[anon<RedLemon>(501):4529]) from originator [daemon<com.apple.powerd>:114]
default	09:52:53.749161-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client read_hello_retry_request
default	09:52:53.749351-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client read_server_hello
default	09:52:53.749977-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	09:52:53.750823-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client read_certificate_request
default	09:52:53.753241-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client read_server_certificate
default	09:52:53.753382-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	09:52:53.755927-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C52.1:2][0x7fb19c46b430] Performing external trust evaluation
default	09:52:53.756189-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C52.1:2][0x7fb19c46b430] Asyncing for external verify block
default	09:52:53.756501-0500	RedLemon	Connection 52: asked to evaluate TLS Trust
default	09:52:53.757790-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> auth completion disp=1 cred=0x0
default	09:52:53.768794-0500	RedLemon	Connection 52: TLS Trust result 0
default	09:52:53.768843-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C52.1:2][0x7fb19c46b430] Returning from external verify block with result: true
default	09:52:53.768906-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C52.1:2][0x7fb19c46b430] Certificate verification result: OK
default	09:52:53.769356-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client read_server_finished
default	09:52:53.769608-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client send_end_of_early_data
default	09:52:53.769648-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	09:52:53.769685-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client send_client_certificate
default	09:52:53.769721-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client complete_second_flight
default	09:52:53.769859-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS 1.3 client done
default	09:52:53.770040-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS client finish_client_handshake
default	09:52:53.770088-0500	RedLemon	boringssl_context_info_handler(2045) [C52.1:2][0x7fb19c46b430] Client handshake state: TLS client done
default	09:52:53.770132-0500	RedLemon	boringssl_context_info_handler(2034) [C52.1:2][0x7fb19c46b430] Client handshake done
default	09:52:53.770725-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C52.1:2][0x7fb19c46b430] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(149ms) flight_time(128ms) rtt(127ms) write_stalls(0) read_stalls(7)]
default	09:52:53.770896-0500	RedLemon	nw_flow_connected [C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:53.771312-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.282s
default	09:52:53.771636-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C52] reporting state ready
default	09:52:53.771704-0500	RedLemon	[C52 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.283s
default	09:52:53.771960-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.283s
default	09:52:53.772056-0500	RedLemon	[C52 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.283s
default	09:52:53.772420-0500	RedLemon	Connection 52: connected successfully
default	09:52:53.772476-0500	RedLemon	Connection 52: TLS handshake complete
default	09:52:53.772763-0500	RedLemon	Connection 52: ready C(N) E(N)
default	09:52:53.772994-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> now using Connection 52
default	09:52:53.773099-0500	RedLemon	Connection 52: received viability advisory(Y)
default	09:52:53.773592-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> sent request, body N 0
default	09:52:53.822257-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring jetsam update because this process is not memory-managed
default	09:52:53.824585-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring suspend because this process is not lifecycle managed
default	09:52:53.825086-0500	runningboardd	[anon<RedLemon>(501):4529] Ignoring GPU update because this process is not GPU managed
default	09:52:53.898045-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> received response, status 101 content U
default	09:52:53.898370-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> response ended
default	09:52:53.898461-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> done using Connection 52
default	09:52:53.899487-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.411s
default	09:52:53.899565-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C52] reporting state preparing
default	09:52:53.899683-0500	RedLemon	[C52 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.411s
default	09:52:53.899929-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.411s
default	09:52:53.900032-0500	RedLemon	[C52 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.411s
default	09:52:53.900166-0500	RedLemon	nw_flow_connected [C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	09:52:53.900403-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.411s
default	09:52:53.900504-0500	RedLemon	[C52 Hostname#11e4b683:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.412s
default	09:52:53.900708-0500	RedLemon	nw_flow_connected [C52.1 IPv4#fd2705f0:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-1091285777)
default	09:52:53.901243-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.412s
default	09:52:53.901321-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C52] reporting state ready
default	09:52:53.901529-0500	RedLemon	[C52 Hostname#11e4b683:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.413s
default	09:52:54.027463-0500	RedLemon	nw_flow_disconnected [C52.1 IPv4#fd2705f0:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	09:52:54.027784-0500	RedLemon	nw_protocol_tcp_log_summary [C52.1:3]
	[C75D952E-11D7-4DBD-ABD9-E0436BA48967 <private>:51450<-><private>:443]
	Init: 1, Conn_Time: 125.308ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 127.875ms, rtt_var: 5.312ms rtt_nc: 125.812ms, rtt_var_nc: 27.000ms base rtt: 125ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	09:52:54.028110-0500	RedLemon	tcp_input [C52.1:3] flags=[FP.] seq=3846711476, ack=49487536, win=249 state=ESTABLISHED rcv_nxt=3846711476, snd_una=49487536
default	09:52:54.029100-0500	RedLemon	[C52.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.540s, error Socket is not connected
default	09:52:54.029159-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C52] reporting state failed error Socket is not connected
default	09:52:54.029237-0500	RedLemon	[C52 Hostname#11e4b683:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.540s
error	09:52:54.029311-0500	RedLemon	nw_read_request_report [C52] Receive failed with error "Socket is not connected"
error	09:52:54.029391-0500	RedLemon	nw_flow_service_reads [C52.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	09:52:54.029697-0500	RedLemon	tcp_output [C52.1:3] flags=[R.] seq=49487667, ack=3846711501, win=2047 state=CLOSED rcv_nxt=3846711501, snd_una=49487536
error	09:52:54.029938-0500	RedLemon	Connection 52: received failure notification
error	09:52:54.030281-0500	RedLemon	nw_flow_add_write_request [C52.1 IPv4#fd2705f0:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	09:52:54.030390-0500	RedLemon	nw_write_request_report [C52] Send failed with error "Socket is not connected"
default	09:52:54.030497-0500	RedLemon	Connection 52: cleaning up
default	09:52:54.030602-0500	RedLemon	[C52 6E588602-58AF-4C10-8E56-F6E055499FD4 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancel
default	09:52:54.030658-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> summary for task success {transaction_duration_ms=544, response_status=101, connection=52, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=276, secure_connection_duration_ms=149, private_relay=false, request_start_ms=286, request_duration_ms=0, response_start_ms=411, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	09:52:54.030808-0500	RedLemon	[C52 6E588602-58AF-4C10-8E56-F6E055499FD4 Hostname#11e4b683:443 tcp, url hash: 3b09aa3a, tls, definite, attribution: developer] cancelled
	[C52.1 C7826A25-1620-4D99-9D3C-A020C9989D8C 10.0.0.249:51450<->IPv4#fd2705f0:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.542s, DNS @0.001s took 0.002s, TCP @0.411s took 0.126s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	09:52:54.030895-0500	RedLemon	Task <E6994A07-1D72-4E32-AF23-E739C775C3A0>.<1> finished successfully
default	09:52:54.032152-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C52] reporting state cancelled error Socket is not connected
default	09:52:54.032461-0500	RedLemon	Connection 52: done
