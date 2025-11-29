default	10:26:37.138375-0500	runningboardd	Assertion did invalidate due to timeout: 173-140-2101 (target:[anon<RedLemon>(501):6145])
default	10:26:37.249075-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:37.250224-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:37.251353-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:39.367223-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "frontmost:6145" ID:173-140-2117 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	10:26:39.367584-0500	runningboardd	Assertion 173-140-2117 (target:[anon<RedLemon>(501):6145]) will be created as active
default	10:26:39.372103-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:39.375606-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:39.381287-0500	runningboardd	[anon<RedLemon>(501):6145] Set darwin role to: UserInteractiveFocal
default	10:26:39.382122-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:39.383541-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [daemon<com.apple.coreservices.launchservicesd>:140] with description <RBSAssertionDescriptor| "notification:6145" ID:173-140-2118 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	10:26:39.383709-0500	runningboardd	Assertion 173-140-2118 (target:[anon<RedLemon>(501):6145]) will be created as active
default	10:26:39.385936-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:39.386141-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:39.386379-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:40.126935-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	10:26:40.130662-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [96D6523B-D5AB-4295-847E-143FF998758C] (reporting strategy default)> on Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> was not selected for reporting
default	10:26:40.131244-0500	RedLemon	Task <C4363EAF-C9F3-4FA7-8BE2-2FC6D75716CE>.<304> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:40.131017-0500	RedLemon	Task <2B71B659-FADD-4445-8A22-B791F1249675>.<1> summary for task success {transaction_duration_ms=7165, response_status=101, connection=45, protocol="http/1.1", domain_lookup_duration_ms=26, connect_duration_ms=47, secure_connection_duration_ms=32, private_relay=false, request_start_ms=75, request_duration_ms=0, response_start_ms=191, response_duration_ms=1, request_bytes=828, response_bytes=850, cache_hit=false}
default	10:26:40.132178-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:40.132318-0500	RedLemon	Task <2B71B659-FADD-4445-8A22-B791F1249675>.<1> finished successfully
default	10:26:40.133079-0500	RedLemon	Connection 45: cleaning up
default	10:26:40.133548-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3A74F5F0-D7D7-4301-94C8-4FBD2DD3AC37] (reporting strategy default)> on Task <C4363EAF-C9F3-4FA7-8BE2-2FC6D75716CE>.<304> was not selected for reporting
default	10:26:40.133445-0500	RedLemon	[C45 A9CB7211-5A20-44E1-B182-6417599869E4 Hostname#d74fcfc7:443 tcp, url hash: d2b368a7, tls, definite, attribution: developer] cancel
default	10:26:40.134411-0500	RedLemon	[C45 A9CB7211-5A20-44E1-B182-6417599869E4 Hostname#d74fcfc7:443 tcp, url hash: d2b368a7, tls, definite, attribution: developer] cancelled
	[C45.1 0C700DC1-8E27-498D-A020-543C117F44B0 10.0.0.249:51486<->IPv4#a00ac144:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 7.167s, DNS @0.000s took 0.026s, TCP @0.191s took 0.014s, TLS 1.3 took 0.001s
	bytes in/out: 5123/1734, packets in/out: 9/13, rtt: 0.030s, retransmitted bytes: 0, out-of-order bytes: 0
default	10:26:40.136620-0500	RedLemon	nw_flow_disconnected [C45.1 IPv4#a00ac144:443 cancelled channel-flow ((null))] Output protocol disconnected
default	10:26:40.139796-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	10:26:40.139946-0500	RedLemon	nw_protocol_tcp_log_summary [C45.1:3]
	[94BB2FAC-0EBB-441D-A801-8002283DB341 <private>:51486<-><private>:443]
	Init: 1, Conn_Time: 14.057ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 30.343ms, rtt_var: 11.937ms rtt_nc: 18.875ms, rtt_var_nc: 11.250ms base rtt: 11ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	10:26:40.140546-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [51443CB4-BC42-4F79-834C-787A0EE82017] (reporting strategy default)> on Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> was not selected for reporting
default	10:26:40.141314-0500	RedLemon	Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	10:26:40.142168-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5B4FD877-0B2F-419A-B70A-495CC9041F56] (reporting strategy default)> on Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> was not selected for reporting
default	10:26:40.143712-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C45] reporting state cancelled
default	10:26:40.144006-0500	RedLemon	Task <C4363EAF-C9F3-4FA7-8BE2-2FC6D75716CE>.<304> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:40.146390-0500	RedLemon	Task <C4363EAF-C9F3-4FA7-8BE2-2FC6D75716CE>.<304> now using Connection 3
default	10:26:40.149882-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:40.150104-0500	RedLemon	Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:40.151341-0500	RedLemon	tcp_output [C45.1:3] flags=[F.] seq=2570519208, ack=2609255706, win=2048 state=FIN_WAIT_1 rcv_nxt=2609255706, snd_una=2570519154
default	10:26:40.151966-0500	RedLemon	Connection 45: done
error	10:26:40.153059-0500	RedLemon	Read completed with an error <private>
default	10:26:40.153194-0500	RedLemon	Connection 46: enabling TLS
default	10:26:40.153239-0500	RedLemon	Connection 46: starting, TC(0x0)
default	10:26:40.153352-0500	RedLemon	[C46 A7B4629F-7BE4-4B1F-91AE-3F9AE8AE46B8 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{269F519D-8989-4D28-9FA1-7188D6C05E28}{(null)}{Y}{2} (private), proc: FA056963-4751-3C92-B931-FEB284B88616] start
default	10:26:40.153448-0500	RedLemon	[C46 Hostname#9081a023:443 initial path ((null))] event: path:start @0.000s
default	10:26:40.156778-0500	RedLemon	[C46 Hostname#9081a023:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: BE370FFE-F314-4161-830A-ACF0C0467A1F
default	10:26:40.157005-0500	RedLemon	[C46 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.003s
default	10:26:40.157047-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state preparing
default	10:26:40.157273-0500	mDNSResponder	[R2237] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 6145 (RedLemon)
default	10:26:40.158004-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> setting up Connection 46
default	10:26:40.158329-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	10:26:40.158878-0500	RedLemon	Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> waiting for setup of Connection 47
default	10:26:40.158931-0500	RedLemon	Connection 47: enabling TLS
default	10:26:40.158972-0500	RedLemon	Connection 47: starting, TC(0x0)
default	10:26:40.159033-0500	RedLemon	[C47 AC5F6F53-9F77-40A2-8BD6-3FFEE6287F29 Hostname#309115f3:443 quic-connection, url hash: 2b9e2054, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{3AB6D079-918D-47AB-9C49-80051391D7AF}{(null)}{Y}{2} (private), proc: FA056963-4751-3C92-B931-FEB284B88616] start
default	10:26:40.159205-0500	RedLemon	[C47 Hostname#309115f3:443 initial path ((null))] event: path:start @0.000s
default	10:26:40.159382-0500	RedLemon	[C47 Hostname#309115f3:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 45FF4152-D806-46CA-97BA-80CF9CDE8755
default	10:26:40.159567-0500	RedLemon	[C47 Hostname#309115f3:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	10:26:40.159610-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state preparing
default	10:26:40.160980-0500	RedLemon	[C47.1 Hostname#309115f3:443 initial path ((null))] event: path:start @0.001s
default	10:26:40.161252-0500	RedLemon	[C47.1 Hostname#309115f3:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.002s, uuid: BC837B92-377B-4F01-8424-F6548BA5DF47
default	10:26:40.161767-0500	mDNSResponder	[R2238] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'pBGNh34PZbr+T4Lknogg+Q=='>, options: 0x8 {use-failover}, client pid: 6145 (RedLemon)
default	10:26:40.161575-0500	RedLemon	[C47.1 Hostname#309115f3:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.002s
default	10:26:40.161745-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> setting up Connection 47
default	10:26:40.162363-0500	RedLemon	0x7fbaf639afc8 ID=548 Task <C4363EAF-C9F3-4FA7-8BE2-2FC6D75716CE>.<304> sent request, body S 83
default	10:26:40.162461-0500	RedLemon	tcp_input [C45.1:3] flags=[F.] seq=2609255706, ack=2570519208, win=16 state=FIN_WAIT_1 rcv_nxt=2609255706, snd_una=2570519208
default	10:26:40.162516-0500	RedLemon	tcp_output [C45.1:3] flags=[F.] seq=2570519208, ack=2609255707, win=2048 state=CLOSING rcv_nxt=2609255707, snd_una=2570519208
default	10:26:40.163300-0500	mDNSResponder	[R2237] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 6145 (RedLemon)
default	10:26:40.163564-0500	RedLemon	nw_endpoint_resolver_update [C46 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e597c525:443
default	10:26:40.163955-0500	RedLemon	[C46 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.010s
default	10:26:40.164525-0500	RedLemon	[C46.1 IPv4#e597c525:443 initial path ((null))] event: path:start @0.011s
default	10:26:40.165102-0500	RedLemon	[C46.1 IPv4#e597c525:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.011s, uuid: 9C29211C-284D-4C9E-9936-5A577B1D6656
default	10:26:40.165256-0500	RedLemon	[C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.011s
default	10:26:40.166894-0500	RedLemon	[C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.013s
default	10:26:40.167871-0500	RedLemon	[C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.014s
default	10:26:40.168020-0500	RedLemon	tcp_output [C46.1:3] flags=[S] seq=2915638550, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2915638550
default	10:26:40.168920-0500	mDNSResponder	[R2238] getaddrinfo stop -- hostname: <mask.hash: 'pBGNh34PZbr+T4Lknogg+Q=='>, client pid: 6145 (RedLemon)
default	10:26:40.169200-0500	RedLemon	nw_endpoint_resolver_update [C47.1 Hostname#309115f3:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#297a0349.443
default	10:26:40.169357-0500	RedLemon	nw_endpoint_resolver_update [C47.1 Hostname#309115f3:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#ea1fb049:443
default	10:26:40.169570-0500	RedLemon	[C47.1 Hostname#309115f3:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.010s
default	10:26:40.169897-0500	RedLemon	[C47.1.1 IPv6#297a0349.443 initial path ((null))] event: path:start @0.010s
default	10:26:40.170192-0500	RedLemon	[C47.1.1 IPv6#297a0349.443 waiting path (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.011s, uuid: 02B0B460-902A-40C5-B4EA-624A958AACDB
default	10:26:40.170411-0500	RedLemon	[C47.1.1 IPv6#297a0349.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.011s
default	10:26:40.171786-0500	RedLemon	[C47.1.1 IPv6#297a0349.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.012s
default	10:26:40.173497-0500	RedLemon	[C47.1.1 IPv6#297a0349.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.014s
default	10:26:40.173732-0500	RedLemon	tcp_output [C47.1.1:3] flags=[SEC] seq=727007445, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=727007445
default	10:26:40.189378-0500	RedLemon	tcp_input [C47.1.1:3] flags=[S.E] seq=2067224963, ack=727007446, win=31416 state=SYN_SENT rcv_nxt=0, snd_una=727007445
default	10:26:40.189529-0500	RedLemon	nw_flow_connected [C47.1.1 IPv6#297a0349.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:40.189814-0500	RedLemon	[C47.1.1 IPv6#297a0349.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.030s
default	10:26:40.189985-0500	RedLemon	[C47.1 Hostname#309115f3:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.030s
default	10:26:40.190058-0500	RedLemon	[C47 Hostname#309115f3:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.030s
default	10:26:40.190733-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C47.1.1:2][0x7fbaf97cd6a0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	10:26:40.190876-0500	RedLemon	boringssl_context_info_handler(2028) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake started
default	10:26:40.191118-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS client enter_early_data
default	10:26:40.191251-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS client read_server_hello
default	10:26:40.216445-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	10:26:40.217003-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client read_server_hello
default	10:26:40.218094-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	10:26:40.218794-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client read_certificate_request
default	10:26:40.220361-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client read_server_certificate
default	10:26:40.220487-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	10:26:40.222435-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C47.1.1:2][0x7fbaf97cd6a0] Performing external trust evaluation
default	10:26:40.222682-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C47.1.1:2][0x7fbaf97cd6a0] Asyncing for external verify block
default	10:26:40.222980-0500	RedLemon	Connection 47: asked to evaluate TLS Trust
default	10:26:40.223617-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> auth completion disp=1 cred=0x0
default	10:26:40.235860-0500	RedLemon	Connection 47: TLS Trust result 0
default	10:26:40.235913-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C47.1.1:2][0x7fbaf97cd6a0] Returning from external verify block with result: true
default	10:26:40.236001-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C47.1.1:2][0x7fbaf97cd6a0] Certificate verification result: OK
default	10:26:40.236370-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client read_server_finished
default	10:26:40.236645-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	10:26:40.236694-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	10:26:40.236736-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client send_client_certificate
default	10:26:40.236774-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client complete_second_flight
default	10:26:40.236924-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS 1.3 client done
default	10:26:40.237117-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS client finish_client_handshake
default	10:26:40.237206-0500	RedLemon	boringssl_context_info_handler(2045) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake state: TLS client done
default	10:26:40.237257-0500	RedLemon	boringssl_context_info_handler(2034) [C47.1.1:2][0x7fbaf97cd6a0] Client handshake done
default	10:26:40.237853-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C47.1.1:2][0x7fbaf97cd6a0] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(47ms) flight_time(27ms) rtt(25ms) write_stalls(0) read_stalls(7)]
default	10:26:40.238084-0500	RedLemon	nw_flow_connected [C47.1.1 IPv6#297a0349.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:40.238538-0500	RedLemon	[C47.1.1 IPv6#297a0349.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.079s
default	10:26:40.238655-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C47] reporting state ready
default	10:26:40.238789-0500	RedLemon	[C47.1 Hostname#309115f3:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.079s
default	10:26:40.238828-0500	RedLemon	[C47 Hostname#309115f3:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.079s
default	10:26:40.238976-0500	RedLemon	[C47.1.1 IPv6#297a0349.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.079s
default	10:26:40.239147-0500	RedLemon	[C47.1 Hostname#309115f3:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.080s
default	10:26:40.239203-0500	RedLemon	[C47 Hostname#309115f3:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.080s
default	10:26:40.239463-0500	RedLemon	Connection 47: connected successfully
default	10:26:40.239810-0500	RedLemon	Connection 47: TLS handshake complete
default	10:26:40.240605-0500	RedLemon	Connection 47: ready C(N) E(N)
default	10:26:40.241153-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> now using Connection 47
default	10:26:40.241429-0500	RedLemon	Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> now using Connection 47
default	10:26:40.241563-0500	RedLemon	Connection 47: received viability advisory(Y)
default	10:26:40.241709-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> sent request, body N 0
default	10:26:40.241760-0500	RedLemon	Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> sent request, body N 0
default	10:26:40.244544-0500	RedLemon	0x7fbaf639afc8 ID=548 Task <C4363EAF-C9F3-4FA7-8BE2-2FC6D75716CE>.<304> received response, status 201 content U
default	10:26:40.245343-0500	RedLemon	Task <C4363EAF-C9F3-4FA7-8BE2-2FC6D75716CE>.<304> response ended
default	10:26:40.246262-0500	RedLemon	Task <C4363EAF-C9F3-4FA7-8BE2-2FC6D75716CE>.<304> done using Connection 3
default	10:26:40.246432-0500	RedLemon	Task <C4363EAF-C9F3-4FA7-8BE2-2FC6D75716CE>.<304> summary for task success {transaction_duration_ms=112, response_status=201, connection=3, reused=1, request_start_ms=12, request_duration_ms=15, response_start_ms=110, response_duration_ms=1, request_bytes=496, response_bytes=775, cache_hit=false}
default	10:26:40.246720-0500	RedLemon	Task <C4363EAF-C9F3-4FA7-8BE2-2FC6D75716CE>.<304> finished successfully
default	10:26:40.246944-0500	RedLemon	✅ Guest joined room URC9 in database
default	10:26:40.247493-0500	RedLemon	Task <002A1521-19FE-4181-AA26-C0C153E0588F>.<2> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:40.248138-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F05D4663-D18E-4429-B004-412CA4274620] (reporting strategy default)> on Task <002A1521-19FE-4181-AA26-C0C153E0588F>.<2> was not selected for reporting
default	10:26:40.249650-0500	RedLemon	Connection 48: enabling TLS
default	10:26:40.249739-0500	RedLemon	Connection 48: starting, TC(0x0)
default	10:26:40.249844-0500	RedLemon	[C48 35817039-2894-49F5-BC5D-2E147FAA61E8 Hostname#d74fcfc7:443 tcp, url hash: d2b368a7, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{C07264EA-6B84-4E9A-8200-C045567A65C9}{(null)}{Y}{2} (private), proc: FA056963-4751-3C92-B931-FEB284B88616] start
default	10:26:40.249996-0500	RedLemon	[C48 Hostname#d74fcfc7:443 initial path ((null))] event: path:start @0.000s
default	10:26:40.250571-0500	RedLemon	[C48 Hostname#d74fcfc7:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 0E47A263-D78E-41E5-8D06-91083DEE6AEE
default	10:26:40.250785-0500	RedLemon	[C48 Hostname#d74fcfc7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	10:26:40.250828-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C48] reporting state preparing
default	10:26:40.251051-0500	RedLemon	Task <002A1521-19FE-4181-AA26-C0C153E0588F>.<2> setting up Connection 48
default	10:26:40.251241-0500	mDNSResponder	[R2239] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'G36kQr+TBraomyPBiUO6UA=='>, options: 0x8 {use-failover}, client pid: 6145 (RedLemon)
default	10:26:40.257162-0500	mDNSResponder	[R2239] getaddrinfo stop -- hostname: <mask.hash: 'G36kQr+TBraomyPBiUO6UA=='>, client pid: 6145 (RedLemon)
default	10:26:40.257141-0500	RedLemon	nw_endpoint_resolver_update [C48 Hostname#d74fcfc7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#a00ac144:443
default	10:26:40.257458-0500	RedLemon	nw_endpoint_resolver_update [C48 Hostname#d74fcfc7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#aac9c249:443
default	10:26:40.257688-0500	RedLemon	[C48 Hostname#d74fcfc7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.007s
default	10:26:40.258069-0500	RedLemon	[C48.1 IPv4#a00ac144:443 initial path ((null))] event: path:start @0.008s
default	10:26:40.268189-0500	RedLemon	[C48.1 IPv4#a00ac144:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.018s, uuid: 5270DCC2-4BBF-4990-86A6-56B38E9997CF
default	10:26:40.268762-0500	RedLemon	[C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.018s
default	10:26:40.269380-0500	RedLemon	[C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.019s
default	10:26:40.270175-0500	RedLemon	[C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.020s
default	10:26:40.270335-0500	RedLemon	tcp_output [C48.1:3] flags=[S] seq=1945244288, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1945244288
default	10:26:40.271203-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> received response, status 200 content K
default	10:26:40.287446-0500	RedLemon	tcp_input [C46.1:3] flags=[S.] seq=1867018701, ack=2915638551, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2915638550
default	10:26:40.287599-0500	RedLemon	nw_flow_connected [C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:40.287838-0500	RedLemon	[C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.134s
default	10:26:40.287950-0500	RedLemon	[C46 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.134s
default	10:26:40.288450-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C46.1:2][0x7fbaf88922b0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	10:26:40.289035-0500	RedLemon	boringssl_context_info_handler(2028) [C46.1:2][0x7fbaf88922b0] Client handshake started
default	10:26:40.289966-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS client enter_early_data
default	10:26:40.290126-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS client read_server_hello
default	10:26:40.290836-0500	RedLemon	tcp_input [C48.1:3] flags=[S.] seq=2693126842, ack=1945244289, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1945244288
default	10:26:40.290951-0500	RedLemon	nw_flow_connected [C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:40.291112-0500	RedLemon	[C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.041s
default	10:26:40.291178-0500	RedLemon	[C48 Hostname#d74fcfc7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.041s
default	10:26:40.291949-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C48.1:2][0x7fbaf9676bd0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	10:26:40.292722-0500	RedLemon	boringssl_context_info_handler(2028) [C48.1:2][0x7fbaf9676bd0] Client handshake started
default	10:26:40.293031-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS client enter_early_data
default	10:26:40.293392-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS client read_server_hello
default	10:26:40.298863-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:40.300034-0500	RedLemon	Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> received response, status 200 content K
default	10:26:40.300137-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> done using Connection 47
default	10:26:40.300811-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> response ended
default	10:26:40.301405-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> summary for task success {transaction_duration_ms=160, response_status=200, connection=47, protocol="h2", domain_lookup_duration_ms=8, connect_duration_ms=65, secure_connection_duration_ms=47, private_relay=false, request_start_ms=100, request_duration_ms=0, response_start_ms=130, response_duration_ms=29, request_bytes=128, response_bytes=118497, cache_hit=false}
default	10:26:40.301537-0500	RedLemon	Task <9BF3F726-D6AA-43B1-B7C4-DEBB38C14059>.<305> finished successfully
default	10:26:40.301846-0500	RedLemon	Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> done using Connection 47
default	10:26:40.302243-0500	RedLemon	Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> response ended
default	10:26:40.302897-0500	RedLemon	Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> summary for task success {transaction_duration_ms=160, response_status=200, connection=47, reused=1, request_start_ms=99, request_duration_ms=0, response_start_ms=157, response_duration_ms=2, request_bytes=36, response_bytes=63211, cache_hit=false}
default	10:26:40.303014-0500	RedLemon	Task <1DE2AD35-87A6-4B6F-BFD5-8EF27B55B86A>.<306> finished successfully
default	10:26:40.476438-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	10:26:40.476603-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client read_server_hello
default	10:26:40.477276-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	10:26:40.478799-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client read_certificate_request
default	10:26:40.478960-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client read_server_certificate
default	10:26:40.479134-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	10:26:40.480017-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C48.1:2][0x7fbaf9676bd0] Performing external trust evaluation
default	10:26:40.480705-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C48.1:2][0x7fbaf9676bd0] Asyncing for external verify block
default	10:26:40.481194-0500	RedLemon	Connection 48: asked to evaluate TLS Trust
default	10:26:40.481803-0500	RedLemon	Task <002A1521-19FE-4181-AA26-C0C153E0588F>.<2> auth completion disp=1 cred=0x0
default	10:26:40.490952-0500	RedLemon	Connection 48: TLS Trust result 0
default	10:26:40.491005-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C48.1:2][0x7fbaf9676bd0] Returning from external verify block with result: true
default	10:26:40.491065-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C48.1:2][0x7fbaf9676bd0] Certificate verification result: OK
default	10:26:40.491545-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client read_server_finished
default	10:26:40.491694-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	10:26:40.491734-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	10:26:40.491770-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client send_client_certificate
default	10:26:40.491803-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client complete_second_flight
default	10:26:40.491933-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS 1.3 client done
default	10:26:40.492219-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS client finish_client_handshake
default	10:26:40.492264-0500	RedLemon	boringssl_context_info_handler(2045) [C48.1:2][0x7fbaf9676bd0] Client handshake state: TLS client done
default	10:26:40.492299-0500	RedLemon	boringssl_context_info_handler(2034) [C48.1:2][0x7fbaf9676bd0] Client handshake done
default	10:26:40.492948-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C48.1:2][0x7fbaf9676bd0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(200ms) flight_time(186ms) rtt(184ms) write_stalls(0) read_stalls(7)]
default	10:26:40.493139-0500	RedLemon	nw_flow_connected [C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:40.493488-0500	RedLemon	[C48.1 IPv4#a00ac144:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.243s
default	10:26:40.493788-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C48] reporting state ready
default	10:26:40.493853-0500	RedLemon	[C48 Hostname#d74fcfc7:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.243s
default	10:26:40.493985-0500	RedLemon	[C48.1 IPv4#a00ac144:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.244s
default	10:26:40.494050-0500	RedLemon	[C48 Hostname#d74fcfc7:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.244s
default	10:26:40.494213-0500	RedLemon	Connection 48: connected successfully
default	10:26:40.494261-0500	RedLemon	Connection 48: TLS handshake complete
default	10:26:40.494522-0500	RedLemon	Connection 48: ready C(N) E(N)
default	10:26:40.494679-0500	RedLemon	Task <002A1521-19FE-4181-AA26-C0C153E0588F>.<2> now using Connection 48
default	10:26:40.494744-0500	RedLemon	Connection 48: received viability advisory(Y)
default	10:26:40.494957-0500	RedLemon	Task <002A1521-19FE-4181-AA26-C0C153E0588F>.<2> sent request, body N 0
default	10:26:40.609281-0500	RedLemon	Task <002A1521-19FE-4181-AA26-C0C153E0588F>.<2> received response, status 101 content U
default	10:26:40.610099-0500	RedLemon	Task <002A1521-19FE-4181-AA26-C0C153E0588F>.<2> response ended
default	10:26:40.610203-0500	RedLemon	Task <002A1521-19FE-4181-AA26-C0C153E0588F>.<2> done using Connection 48
default	10:26:40.612059-0500	RedLemon	[C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.362s
default	10:26:40.612111-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C48] reporting state preparing
default	10:26:40.612188-0500	RedLemon	[C48 Hostname#d74fcfc7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.362s
default	10:26:40.612339-0500	RedLemon	[C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.362s
default	10:26:40.612400-0500	RedLemon	[C48 Hostname#d74fcfc7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.362s
default	10:26:40.612483-0500	RedLemon	nw_flow_connected [C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:40.612620-0500	RedLemon	[C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.362s
default	10:26:40.612679-0500	RedLemon	[C48 Hostname#d74fcfc7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.362s
default	10:26:40.613141-0500	RedLemon	nw_flow_connected [C48.1 IPv4#a00ac144:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:40.613816-0500	RedLemon	[C48.1 IPv4#a00ac144:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.363s
default	10:26:40.613903-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C48] reporting state ready
default	10:26:40.614043-0500	RedLemon	[C48 Hostname#d74fcfc7:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.364s
default	10:26:40.630028-0500	RedLemon	Task <2D80E7E4-00D3-41C5-8841-2FE95F1FEA19>.<307> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:40.630438-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0123D386-C6E2-4CE6-82D4-930F257D3EDB] (reporting strategy default)> on Task <2D80E7E4-00D3-41C5-8841-2FE95F1FEA19>.<307> was not selected for reporting
default	10:26:40.631357-0500	RedLemon	Task <2D80E7E4-00D3-41C5-8841-2FE95F1FEA19>.<307> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:40.631686-0500	RedLemon	Task <2D80E7E4-00D3-41C5-8841-2FE95F1FEA19>.<307> now using Connection 3
default	10:26:40.633307-0500	RedLemon	0x7fbaf9c81b58 ID=552 Task <2D80E7E4-00D3-41C5-8841-2FE95F1FEA19>.<307> sent request, body N 0
default	10:26:40.661140-0500	RedLemon	📥 Received Realtime message: 'LOBBY_JOIN' from ursinho in room URC9
default	10:26:40.661420-0500	RedLemon	👋 Received: Guest 'ursinho' joined room URC9
default	10:26:40.690989-0500	RedLemon	0x7fbaf9c81b58 ID=552 Task <2D80E7E4-00D3-41C5-8841-2FE95F1FEA19>.<307> received response, status 200 content U
default	10:26:40.692842-0500	RedLemon	Task <2D80E7E4-00D3-41C5-8841-2FE95F1FEA19>.<307> response ended
default	10:26:40.693681-0500	RedLemon	Task <2D80E7E4-00D3-41C5-8841-2FE95F1FEA19>.<307> done using Connection 3
default	10:26:40.694255-0500	RedLemon	Task <2D80E7E4-00D3-41C5-8841-2FE95F1FEA19>.<307> summary for task success {transaction_duration_ms=63, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=59, response_duration_ms=3, request_bytes=511, response_bytes=835, cache_hit=false}
default	10:26:40.695796-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [anon<RedLemon>(501):6145] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-6145-2121 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:40.696141-0500	runningboardd	Assertion 173-6145-2121 (target:[anon<RedLemon>(501):6145]) will be created as active as no start-time-defining assertions exist
default	10:26:40.695169-0500	RedLemon	Task <2D80E7E4-00D3-41C5-8841-2FE95F1FEA19>.<307> finished successfully
default	10:26:40.697669-0500	RedLemon	Task <2F0BDF15-3A27-48A6-BEC7-86BE9E072893>.<308> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:40.698088-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [16D0DF17-A019-4885-A714-C894F39324E6] (reporting strategy default)> on Task <2F0BDF15-3A27-48A6-BEC7-86BE9E072893>.<308> was not selected for reporting
default	10:26:40.698980-0500	RedLemon	Task <2F0BDF15-3A27-48A6-BEC7-86BE9E072893>.<308> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:40.699284-0500	RedLemon	Task <2F0BDF15-3A27-48A6-BEC7-86BE9E072893>.<308> now using Connection 3
default	10:26:40.700388-0500	RedLemon	0x7fbaf9d64e18 ID=556 Task <2F0BDF15-3A27-48A6-BEC7-86BE9E072893>.<308> sent request, body N 0
default	10:26:40.700746-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:40.700792-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:40.700839-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:40.703254-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-2122 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:40.703872-0500	runningboardd	Assertion 173-114-2122 (target:[anon<RedLemon>(501):6145]) will be created as active
default	10:26:40.708208-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:40.708331-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:40.708446-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:40.714903-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:40.765985-0500	RedLemon	0x7fbaf9d64e18 ID=556 Task <2F0BDF15-3A27-48A6-BEC7-86BE9E072893>.<308> received response, status 200 content U
default	10:26:40.767468-0500	RedLemon	Task <2F0BDF15-3A27-48A6-BEC7-86BE9E072893>.<308> response ended
default	10:26:40.768074-0500	RedLemon	Task <2F0BDF15-3A27-48A6-BEC7-86BE9E072893>.<308> done using Connection 3
default	10:26:40.768377-0500	RedLemon	Task <2F0BDF15-3A27-48A6-BEC7-86BE9E072893>.<308> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=67, response_duration_ms=2, request_bytes=524, response_bytes=841, cache_hit=true}
default	10:26:40.769329-0500	RedLemon	Task <2F0BDF15-3A27-48A6-BEC7-86BE9E072893>.<308> finished successfully
default	10:26:40.772550-0500	RedLemon	Task <5BA8EEAD-F271-40BB-B150-24F3CCF084A0>.<309> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:40.773098-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1AC2DD69-3782-4279-A352-9730839F8BE8] (reporting strategy default)> on Task <5BA8EEAD-F271-40BB-B150-24F3CCF084A0>.<309> was not selected for reporting
default	10:26:40.774609-0500	RedLemon	Task <5BA8EEAD-F271-40BB-B150-24F3CCF084A0>.<309> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:40.775065-0500	RedLemon	Task <5BA8EEAD-F271-40BB-B150-24F3CCF084A0>.<309> now using Connection 3
default	10:26:40.776715-0500	RedLemon	0x7fbaf9cdf6b8 ID=560 Task <5BA8EEAD-F271-40BB-B150-24F3CCF084A0>.<309> sent request, body N 0
default	10:26:40.780730-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:40.839956-0500	RedLemon	0x7fbaf9cdf6b8 ID=560 Task <5BA8EEAD-F271-40BB-B150-24F3CCF084A0>.<309> received response, status 200 content U
default	10:26:40.840915-0500	RedLemon	Task <5BA8EEAD-F271-40BB-B150-24F3CCF084A0>.<309> response ended
default	10:26:40.841481-0500	RedLemon	Task <5BA8EEAD-F271-40BB-B150-24F3CCF084A0>.<309> done using Connection 3
default	10:26:40.841794-0500	RedLemon	Task <5BA8EEAD-F271-40BB-B150-24F3CCF084A0>.<309> summary for task success {transaction_duration_ms=67, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=65, response_duration_ms=2, request_bytes=524, response_bytes=842, cache_hit=true}
default	10:26:40.842598-0500	RedLemon	Task <5BA8EEAD-F271-40BB-B150-24F3CCF084A0>.<309> finished successfully
default	10:26:40.845343-0500	RedLemon	🔍 Current guest participant found in polling: ursinho with ID 656DAA91-33B4-4688-9135-C982EA52D7C9
default	10:26:40.845699-0500	RedLemon	👋 ursinho joined room
default	10:26:40.846474-0500	RedLemon	Task <49EB2990-75E0-4307-A3BC-48CDF13FBF4E>.<310> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:40.847326-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F7D82246-72E6-41DE-8E3E-FA585F16DDAE] (reporting strategy default)> on Task <49EB2990-75E0-4307-A3BC-48CDF13FBF4E>.<310> was not selected for reporting
default	10:26:40.848598-0500	RedLemon	Task <49EB2990-75E0-4307-A3BC-48CDF13FBF4E>.<310> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:40.849070-0500	RedLemon	Task <49EB2990-75E0-4307-A3BC-48CDF13FBF4E>.<310> now using Connection 3
default	10:26:40.851198-0500	RedLemon	0x7fbaf636b508 ID=564 Task <49EB2990-75E0-4307-A3BC-48CDF13FBF4E>.<310> sent request, body N 0
default	10:26:40.866476-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:40.927165-0500	RedLemon	0x7fbaf636b508 ID=564 Task <49EB2990-75E0-4307-A3BC-48CDF13FBF4E>.<310> received response, status 200 content U
default	10:26:40.928543-0500	RedLemon	Task <49EB2990-75E0-4307-A3BC-48CDF13FBF4E>.<310> response ended
default	10:26:40.929431-0500	RedLemon	Task <49EB2990-75E0-4307-A3BC-48CDF13FBF4E>.<310> done using Connection 3
default	10:26:40.929805-0500	RedLemon	Task <49EB2990-75E0-4307-A3BC-48CDF13FBF4E>.<310> summary for task success {transaction_duration_ms=81, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=78, response_duration_ms=2, request_bytes=500, response_bytes=966, cache_hit=false}
default	10:26:40.930269-0500	RedLemon	Task <49EB2990-75E0-4307-A3BC-48CDF13FBF4E>.<310> finished successfully
default	10:26:40.939119-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:41.124890-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	10:26:41.125087-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client read_server_hello
default	10:26:41.125760-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	10:26:41.126502-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client read_certificate_request
default	10:26:41.126934-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client read_server_certificate
default	10:26:41.127058-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	10:26:41.128132-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C46.1:2][0x7fbaf88922b0] Performing external trust evaluation
default	10:26:41.128354-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C46.1:2][0x7fbaf88922b0] Asyncing for external verify block
default	10:26:41.128619-0500	RedLemon	Connection 46: asked to evaluate TLS Trust
default	10:26:41.129194-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> auth completion disp=1 cred=0x0
default	10:26:41.137602-0500	RedLemon	Connection 46: TLS Trust result 0
default	10:26:41.137655-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C46.1:2][0x7fbaf88922b0] Returning from external verify block with result: true
default	10:26:41.137712-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C46.1:2][0x7fbaf88922b0] Certificate verification result: OK
default	10:26:41.138062-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client read_server_finished
default	10:26:41.138245-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	10:26:41.138268-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	10:26:41.138288-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client send_client_certificate
default	10:26:41.138308-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client complete_second_flight
default	10:26:41.138586-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS 1.3 client done
default	10:26:41.138803-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS client finish_client_handshake
default	10:26:41.138851-0500	RedLemon	boringssl_context_info_handler(2045) [C46.1:2][0x7fbaf88922b0] Client handshake state: TLS client done
default	10:26:41.138891-0500	RedLemon	boringssl_context_info_handler(2034) [C46.1:2][0x7fbaf88922b0] Client handshake done
default	10:26:41.139511-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C46.1:2][0x7fbaf88922b0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(850ms) flight_time(837ms) rtt(835ms) write_stalls(0) read_stalls(6)]
default	10:26:41.139693-0500	RedLemon	nw_flow_connected [C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:41.139987-0500	RedLemon	[C46.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.986s
default	10:26:41.140480-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state ready
default	10:26:41.140549-0500	RedLemon	[C46 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.987s
default	10:26:41.140702-0500	RedLemon	[C46.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.987s
default	10:26:41.140774-0500	RedLemon	[C46 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.987s
default	10:26:41.141119-0500	RedLemon	Connection 46: connected successfully
default	10:26:41.141175-0500	RedLemon	Connection 46: TLS handshake complete
default	10:26:41.141432-0500	RedLemon	Connection 46: ready C(N) E(N)
default	10:26:41.141658-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> now using Connection 46
default	10:26:41.141772-0500	RedLemon	Connection 46: received viability advisory(Y)
default	10:26:41.142050-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> sent request, body N 0
default	10:26:41.280320-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> received response, status 101 content U
default	10:26:41.280688-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> response ended
default	10:26:41.280821-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> done using Connection 46
default	10:26:41.281930-0500	RedLemon	[C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @1.128s
default	10:26:41.281997-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state preparing
default	10:26:41.282082-0500	RedLemon	[C46 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @1.128s
default	10:26:41.282238-0500	RedLemon	[C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @1.128s
default	10:26:41.282322-0500	RedLemon	[C46 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @1.128s
default	10:26:41.282461-0500	RedLemon	nw_flow_connected [C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:41.282753-0500	RedLemon	[C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @1.129s
default	10:26:41.282867-0500	RedLemon	[C46 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @1.129s
default	10:26:41.283099-0500	RedLemon	nw_flow_connected [C46.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:41.283623-0500	RedLemon	[C46.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @1.130s
default	10:26:41.283673-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state ready
default	10:26:41.283761-0500	RedLemon	[C46 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @1.130s
default	10:26:41.410619-0500	RedLemon	tcp_input [C46.1:3] flags=[FP.] seq=1867021707, ack=2915639606, win=249 state=ESTABLISHED rcv_nxt=1867021707, snd_una=2915639606
default	10:26:41.410754-0500	RedLemon	nw_protocol_tcp_log_summary [C46.1:3]
	[70409FF3-7BC6-48C9-ABE1-837D566FA679 <private>:51487<-><private>:443]
	Init: 1, Conn_Time: 119.558ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 126.812ms, rtt_var: 4.437ms rtt_nc: 122.781ms, rtt_var_nc: 29.500ms base rtt: 113ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	10:26:41.411742-0500	RedLemon	nw_flow_disconnected [C46.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	10:26:41.412602-0500	RedLemon	Connection 46: read-side closed
default	10:26:41.412689-0500	RedLemon	Connection 46: read-side closed
default	10:26:41.412831-0500	RedLemon	Connection 46: read-side closed
error	10:26:41.413113-0500	RedLemon	nw_read_request_report [C46] Receive failed with error "Socket is not connected"
default	10:26:41.413917-0500	RedLemon	[C46.1 IPv4#e597c525:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @1.260s, error Socket is not connected
default	10:26:41.413973-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state failed error Socket is not connected
default	10:26:41.414042-0500	RedLemon	[C46 Hostname#9081a023:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @1.260s
default	10:26:41.414165-0500	RedLemon	tcp_output [C46.1:3] flags=[F.] seq=2915639737, ack=1867021732, win=2048 state=LAST_ACK rcv_nxt=1867021732, snd_una=2915639606
error	10:26:41.414362-0500	RedLemon	Connection 46: received failure notification
default	10:26:41.414567-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> summary for task success {transaction_duration_ms=1283, response_status=101, connection=46, protocol="http/1.1", domain_lookup_duration_ms=7, connect_duration_ms=972, secure_connection_duration_ms=850, private_relay=false, request_start_ms=1010, request_duration_ms=0, response_start_ms=1148, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	10:26:41.414685-0500	RedLemon	Task <560013FB-EAFB-4A93-8B72-FE8B002EEA2B>.<1> finished successfully
error	10:26:41.414987-0500	RedLemon	nw_flow_add_write_request [C46.1 IPv4#e597c525:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	10:26:41.415098-0500	RedLemon	nw_write_request_report [C46] Send failed with error "Socket is not connected"
default	10:26:41.415213-0500	RedLemon	Connection 46: cleaning up
default	10:26:41.415321-0500	RedLemon	[C46 A7B4629F-7BE4-4B1F-91AE-3F9AE8AE46B8 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer] cancel
default	10:26:41.415862-0500	RedLemon	[C46 A7B4629F-7BE4-4B1F-91AE-3F9AE8AE46B8 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer] cancelled
	[C46.1 9C29211C-284D-4C9E-9936-5A577B1D6656 10.0.0.249:51487<->IPv4#e597c525:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 1.262s, DNS @0.003s took 0.007s, TCP @1.128s took 0.120s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	10:26:41.416888-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C46] reporting state cancelled error Socket is not connected
default	10:26:41.417224-0500	RedLemon	Connection 46: done
default	10:26:41.759812-0500	RedLemon	tcp_output [C46.1:3] flags=[FP.] seq=2915639606, ack=1867021732, win=2048 state=LAST_ACK rcv_nxt=1867021732, snd_una=2915639606
default	10:26:41.760477-0500	runningboardd	Invalidating assertion 173-6145-2121 (target:[anon<RedLemon>(501):6145]) from originator [anon<RedLemon>(501):6145]
default	10:26:41.889374-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:41.889477-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:41.889575-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:41.892237-0500	runningboardd	Invalidating assertion 173-114-2122 (target:[anon<RedLemon>(501):6145]) from originator [daemon<com.apple.powerd>:114]
default	10:26:42.054486-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:42.054580-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:42.054670-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:42.083853-0500	RedLemon	📥 Received Realtime message: 'LOBBY_START_COUNTDOWN' from Host in room URC9
default	10:26:42.084063-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
error	10:26:42.101310-0500	RedLemon	tcp_input [C46.1:3] flags=[R] seq=1867021732, ack=0, win=0 state=LAST_ACK rcv_nxt=1867021732, snd_una=2915639606
default	10:26:42.111968-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	10:26:42.112551-0500	RedLemon	Task <4066702C-B7B5-42AF-9D28-D4F05A99CC57>.<311> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:42.113056-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BA359DD3-CEDB-4C68-8A52-2A978BD060F9] (reporting strategy default)> on Task <4066702C-B7B5-42AF-9D28-D4F05A99CC57>.<311> was not selected for reporting
default	10:26:42.113976-0500	RedLemon	Task <4066702C-B7B5-42AF-9D28-D4F05A99CC57>.<311> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:42.114276-0500	RedLemon	Task <4066702C-B7B5-42AF-9D28-D4F05A99CC57>.<311> now using Connection 3
default	10:26:42.117764-0500	RedLemon	0x7fbaf96a24f8 ID=568 Task <4066702C-B7B5-42AF-9D28-D4F05A99CC57>.<311> sent request, body N 0
default	10:26:42.185734-0500	RedLemon	0x7fbaf96a24f8 ID=568 Task <4066702C-B7B5-42AF-9D28-D4F05A99CC57>.<311> received response, status 200 content U
default	10:26:42.186516-0500	RedLemon	Task <4066702C-B7B5-42AF-9D28-D4F05A99CC57>.<311> response ended
default	10:26:42.187117-0500	RedLemon	Task <4066702C-B7B5-42AF-9D28-D4F05A99CC57>.<311> done using Connection 3
default	10:26:42.187450-0500	RedLemon	Task <4066702C-B7B5-42AF-9D28-D4F05A99CC57>.<311> summary for task success {transaction_duration_ms=74, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=3, response_start_ms=71, response_duration_ms=1, request_bytes=500, response_bytes=966, cache_hit=true}
default	10:26:42.188206-0500	RedLemon	Task <4066702C-B7B5-42AF-9D28-D4F05A99CC57>.<311> finished successfully
default	10:26:42.190942-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [anon<RedLemon>(501):6145] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-6145-2123 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:42.191776-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	10:26:42.192178-0500	RedLemon	🎬 Guest: Fetch took 0.080s, waiting 3.170s (includes 0.25s sync buffer)
default	10:26:42.191330-0500	runningboardd	Assertion 173-6145-2123 (target:[anon<RedLemon>(501):6145]) will be created as active as no start-time-defining assertions exist
default	10:26:42.194380-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:42.194456-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:42.194526-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:42.196355-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-2124 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:42.196578-0500	runningboardd	Assertion 173-114-2124 (target:[anon<RedLemon>(501):6145]) will be created as active
default	10:26:42.201920-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:42.201993-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:42.202048-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:42.223529-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:42.506572-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	10:26:42.507411-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A10778E6-A41D-4C55-A928-A3044D79DC72] (reporting strategy default)> on Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> was not selected for reporting
default	10:26:42.508899-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:42.509669-0500	RedLemon	Connection 49: enabling TLS
default	10:26:42.509716-0500	RedLemon	Connection 49: starting, TC(0x0)
default	10:26:42.509778-0500	RedLemon	[C49 C4DECDEC-17B9-4ECC-95AE-ED0978332C91 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{A06218B2-5768-460F-BC3D-5B6D22310396}{(null)}{Y}{2} (private), proc: FA056963-4751-3C92-B931-FEB284B88616] start
default	10:26:42.509886-0500	RedLemon	[C49 Hostname#9081a023:443 initial path ((null))] event: path:start @0.000s
default	10:26:42.510344-0500	RedLemon	[C49 Hostname#9081a023:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: F9B21B77-20CB-43E5-8DD4-685161E85B8F
default	10:26:42.511044-0500	mDNSResponder	[R2240] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 6145 (RedLemon)
default	10:26:42.510566-0500	RedLemon	[C49 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	10:26:42.510674-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state preparing
default	10:26:42.511023-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> setting up Connection 49
default	10:26:42.513469-0500	mDNSResponder	[R2240] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 6145 (RedLemon)
default	10:26:42.514132-0500	RedLemon	nw_endpoint_resolver_update [C49 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e597c525:443
default	10:26:42.514337-0500	RedLemon	[C49 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.004s
default	10:26:42.514653-0500	RedLemon	[C49.1 IPv4#e597c525:443 initial path ((null))] event: path:start @0.004s
default	10:26:42.515239-0500	RedLemon	[C49.1 IPv4#e597c525:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.005s, uuid: AB1A89A0-E078-456F-B8CA-07E9BFA6686D
default	10:26:42.515474-0500	RedLemon	[C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.005s
default	10:26:42.516195-0500	RedLemon	[C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.006s
default	10:26:42.517359-0500	RedLemon	[C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.007s
default	10:26:42.517573-0500	RedLemon	tcp_output [C49.1:3] flags=[S] seq=1737184111, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1737184111
default	10:26:42.639251-0500	RedLemon	tcp_input [C49.1:3] flags=[S.] seq=1855055196, ack=1737184112, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=1737184111
default	10:26:42.639475-0500	RedLemon	nw_flow_connected [C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:42.639863-0500	RedLemon	[C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.130s
default	10:26:42.639966-0500	RedLemon	[C49 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.130s
default	10:26:42.640635-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C49.1:2][0x7fbaf96c9da0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	10:26:42.640841-0500	RedLemon	boringssl_context_info_handler(2028) [C49.1:2][0x7fbaf96c9da0] Client handshake started
default	10:26:42.641428-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS client enter_early_data
default	10:26:42.641798-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS client read_server_hello
default	10:26:42.769130-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	10:26:42.769303-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client read_server_hello
default	10:26:42.769859-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	10:26:42.770687-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client read_certificate_request
default	10:26:42.771169-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client read_server_certificate
default	10:26:42.771301-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	10:26:42.772773-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C49.1:2][0x7fbaf96c9da0] Performing external trust evaluation
default	10:26:42.773086-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C49.1:2][0x7fbaf96c9da0] Asyncing for external verify block
default	10:26:42.773453-0500	RedLemon	Connection 49: asked to evaluate TLS Trust
default	10:26:42.774048-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> auth completion disp=1 cred=0x0
default	10:26:42.775988-0500	RedLemon	Task <9ECC5E2C-7BDA-4F04-84F4-B692BA977C82>.<313> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:42.775988-0500	RedLemon	Task <BBB0DADB-A011-4174-8424-1A6F64397362>.<312> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:42.777828-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7AD491A0-7F9B-45C0-8A6A-4B8DA19BC40E] (reporting strategy default)> on Task <BBB0DADB-A011-4174-8424-1A6F64397362>.<312> was not selected for reporting
default	10:26:42.777930-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F892AC41-AC09-445F-A908-32A38AA96936] (reporting strategy default)> on Task <9ECC5E2C-7BDA-4F04-84F4-B692BA977C82>.<313> was not selected for reporting
default	10:26:42.779776-0500	RedLemon	Task <BBB0DADB-A011-4174-8424-1A6F64397362>.<312> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:42.780149-0500	RedLemon	Task <BBB0DADB-A011-4174-8424-1A6F64397362>.<312> now using Connection 3
default	10:26:42.781408-0500	RedLemon	Task <9ECC5E2C-7BDA-4F04-84F4-B692BA977C82>.<313> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:42.781661-0500	RedLemon	Task <9ECC5E2C-7BDA-4F04-84F4-B692BA977C82>.<313> now using Connection 3
default	10:26:42.782763-0500	RedLemon	0x7fbafac546c8 ID=572 Task <BBB0DADB-A011-4174-8424-1A6F64397362>.<312> sent request, body N 0
default	10:26:42.782876-0500	RedLemon	0x7fbafac54c88 ID=576 Task <9ECC5E2C-7BDA-4F04-84F4-B692BA977C82>.<313> sent request, body N 0
default	10:26:42.786081-0500	RedLemon	Connection 49: TLS Trust result 0
default	10:26:42.786160-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C49.1:2][0x7fbaf96c9da0] Returning from external verify block with result: true
default	10:26:42.786232-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C49.1:2][0x7fbaf96c9da0] Certificate verification result: OK
default	10:26:42.786640-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client read_server_finished
default	10:26:42.786843-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	10:26:42.786866-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	10:26:42.786891-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client send_client_certificate
default	10:26:42.786921-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client complete_second_flight
default	10:26:42.787007-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS 1.3 client done
default	10:26:42.787255-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS client finish_client_handshake
default	10:26:42.787291-0500	RedLemon	boringssl_context_info_handler(2045) [C49.1:2][0x7fbaf96c9da0] Client handshake state: TLS client done
default	10:26:42.787314-0500	RedLemon	boringssl_context_info_handler(2034) [C49.1:2][0x7fbaf96c9da0] Client handshake done
default	10:26:42.788110-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C49.1:2][0x7fbaf96c9da0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(147ms) flight_time(129ms) rtt(128ms) write_stalls(0) read_stalls(6)]
default	10:26:42.788337-0500	RedLemon	nw_flow_connected [C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:42.788691-0500	RedLemon	[C49.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.278s
default	10:26:42.789038-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state ready
default	10:26:42.789108-0500	RedLemon	[C49 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.279s
default	10:26:42.789247-0500	RedLemon	[C49.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.279s
default	10:26:42.789314-0500	RedLemon	[C49 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.279s
default	10:26:42.789650-0500	RedLemon	Connection 49: connected successfully
default	10:26:42.789700-0500	RedLemon	Connection 49: TLS handshake complete
default	10:26:42.789911-0500	RedLemon	Connection 49: ready C(N) E(N)
default	10:26:42.790092-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> now using Connection 49
default	10:26:42.790174-0500	RedLemon	Connection 49: received viability advisory(Y)
default	10:26:42.790366-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> sent request, body N 0
default	10:26:42.843238-0500	RedLemon	0x7fbafac54c88 ID=576 Task <9ECC5E2C-7BDA-4F04-84F4-B692BA977C82>.<313> received response, status 200 content U
default	10:26:42.844063-0500	RedLemon	Task <9ECC5E2C-7BDA-4F04-84F4-B692BA977C82>.<313> response ended
default	10:26:42.844624-0500	RedLemon	Task <9ECC5E2C-7BDA-4F04-84F4-B692BA977C82>.<313> done using Connection 3
default	10:26:42.844944-0500	RedLemon	Task <9ECC5E2C-7BDA-4F04-84F4-B692BA977C82>.<313> summary for task success {transaction_duration_ms=65, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=1, response_start_ms=63, response_duration_ms=1, request_bytes=500, response_bytes=959, cache_hit=false}
default	10:26:42.845700-0500	RedLemon	Task <9ECC5E2C-7BDA-4F04-84F4-B692BA977C82>.<313> finished successfully
default	10:26:42.848779-0500	RedLemon	🎬 Guest: Detected room playback start via database fallback
default	10:26:42.866148-0500	RedLemon	0x7fbafac546c8 ID=572 Task <BBB0DADB-A011-4174-8424-1A6F64397362>.<312> received response, status 200 content U
default	10:26:42.866859-0500	RedLemon	Task <BBB0DADB-A011-4174-8424-1A6F64397362>.<312> response ended
default	10:26:42.867397-0500	RedLemon	Task <BBB0DADB-A011-4174-8424-1A6F64397362>.<312> done using Connection 3
default	10:26:42.867620-0500	RedLemon	Task <BBB0DADB-A011-4174-8424-1A6F64397362>.<312> summary for task success {transaction_duration_ms=88, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=86, response_duration_ms=2, request_bytes=511, response_bytes=837, cache_hit=true}
default	10:26:42.867851-0500	RedLemon	Task <BBB0DADB-A011-4174-8424-1A6F64397362>.<312> finished successfully
default	10:26:42.870006-0500	RedLemon	Task <27D20476-D768-44B1-A607-47790B8C2988>.<314> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:42.870309-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BFC8DD77-385D-4C1A-8C44-E6AE688E6511] (reporting strategy default)> on Task <27D20476-D768-44B1-A607-47790B8C2988>.<314> was not selected for reporting
default	10:26:42.871120-0500	RedLemon	Task <27D20476-D768-44B1-A607-47790B8C2988>.<314> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:42.871340-0500	RedLemon	Task <27D20476-D768-44B1-A607-47790B8C2988>.<314> now using Connection 3
default	10:26:42.872153-0500	RedLemon	0x7fbaf88922c8 ID=580 Task <27D20476-D768-44B1-A607-47790B8C2988>.<314> sent request, body N 0
default	10:26:42.876557-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:42.916083-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> received response, status 101 content U
default	10:26:42.916492-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> response ended
default	10:26:42.916593-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> done using Connection 49
default	10:26:42.917526-0500	RedLemon	[C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.407s
default	10:26:42.917612-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state preparing
default	10:26:42.917737-0500	RedLemon	[C49 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.407s
default	10:26:42.918004-0500	RedLemon	[C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.408s
default	10:26:42.918119-0500	RedLemon	[C49 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.408s
default	10:26:42.918257-0500	RedLemon	nw_flow_connected [C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:42.918503-0500	RedLemon	[C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.408s
default	10:26:42.918612-0500	RedLemon	[C49 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.408s
default	10:26:42.918833-0500	RedLemon	nw_flow_connected [C49.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:42.919393-0500	RedLemon	[C49.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.409s
default	10:26:42.919472-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state ready
default	10:26:42.919589-0500	RedLemon	[C49 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.409s
default	10:26:42.932585-0500	RedLemon	0x7fbaf88922c8 ID=580 Task <27D20476-D768-44B1-A607-47790B8C2988>.<314> received response, status 200 content U
default	10:26:42.933410-0500	RedLemon	Task <27D20476-D768-44B1-A607-47790B8C2988>.<314> response ended
default	10:26:42.934263-0500	RedLemon	Task <27D20476-D768-44B1-A607-47790B8C2988>.<314> done using Connection 3
default	10:26:42.934638-0500	RedLemon	Task <27D20476-D768-44B1-A607-47790B8C2988>.<314> summary for task success {transaction_duration_ms=63, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=2, request_bytes=524, response_bytes=844, cache_hit=true}
default	10:26:42.935106-0500	RedLemon	Task <27D20476-D768-44B1-A607-47790B8C2988>.<314> finished successfully
default	10:26:42.938391-0500	RedLemon	Task <E66DDDB4-0533-4EEA-9EE5-71AB2EF7D7EE>.<315> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:42.938956-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [29E5EC17-401F-41B3-BB3E-F672678642CD] (reporting strategy default)> on Task <E66DDDB4-0533-4EEA-9EE5-71AB2EF7D7EE>.<315> was not selected for reporting
default	10:26:42.940659-0500	RedLemon	Task <E66DDDB4-0533-4EEA-9EE5-71AB2EF7D7EE>.<315> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:42.941123-0500	RedLemon	Task <E66DDDB4-0533-4EEA-9EE5-71AB2EF7D7EE>.<315> now using Connection 3
default	10:26:42.942907-0500	RedLemon	0x7fbaf88657b8 ID=584 Task <E66DDDB4-0533-4EEA-9EE5-71AB2EF7D7EE>.<315> sent request, body N 0
default	10:26:42.954659-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:43.006419-0500	RedLemon	0x7fbaf88657b8 ID=584 Task <E66DDDB4-0533-4EEA-9EE5-71AB2EF7D7EE>.<315> received response, status 200 content U
default	10:26:43.007736-0500	RedLemon	Task <E66DDDB4-0533-4EEA-9EE5-71AB2EF7D7EE>.<315> response ended
default	10:26:43.009006-0500	RedLemon	Task <E66DDDB4-0533-4EEA-9EE5-71AB2EF7D7EE>.<315> done using Connection 3
default	10:26:43.009404-0500	RedLemon	Task <E66DDDB4-0533-4EEA-9EE5-71AB2EF7D7EE>.<315> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=66, response_duration_ms=3, request_bytes=524, response_bytes=842, cache_hit=true}
default	10:26:43.009947-0500	RedLemon	Task <E66DDDB4-0533-4EEA-9EE5-71AB2EF7D7EE>.<315> finished successfully
default	10:26:43.012902-0500	RedLemon	🔍 Current guest participant found in polling: ursinho with ID 656DAA91-33B4-4688-9135-C982EA52D7C9
default	10:26:43.039452-0500	RedLemon	tcp_input [C49.1:3] flags=[FP.] seq=1855058203, ack=1737185165, win=249 state=ESTABLISHED rcv_nxt=1855058203, snd_una=1737185165
default	10:26:43.039561-0500	RedLemon	nw_protocol_tcp_log_summary [C49.1:3]
	[25292D4A-CF4E-4156-BB25-727B428E2841 <private>:51489<-><private>:443]
	Init: 1, Conn_Time: 121.861ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 125.281ms, rtt_var: 4.062ms rtt_nc: 123.062ms, rtt_var_nc: 27.375ms base rtt: 113ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	10:26:43.040735-0500	RedLemon	nw_flow_disconnected [C49.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	10:26:43.041608-0500	RedLemon	Connection 49: read-side closed
default	10:26:43.041675-0500	RedLemon	Connection 49: read-side closed
error	10:26:43.042165-0500	RedLemon	nw_read_request_report [C49] Receive failed with error "Socket is not connected"
default	10:26:43.043318-0500	RedLemon	[C49.1 IPv4#e597c525:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.533s, error Socket is not connected
default	10:26:43.043380-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state failed error Socket is not connected
default	10:26:43.043466-0500	RedLemon	[C49 Hostname#9081a023:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.533s
default	10:26:43.043543-0500	RedLemon	tcp_output [C49.1:3] flags=[F.] seq=1737185296, ack=1855058228, win=2048 state=LAST_ACK rcv_nxt=1855058228, snd_una=1737185165
default	10:26:43.043644-0500	RedLemon	Connection 49: read-side closed
error	10:26:43.043750-0500	RedLemon	Connection 49: received failure notification
default	10:26:43.043920-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:43.044228-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> summary for task success {transaction_duration_ms=535, response_status=101, connection=49, protocol="http/1.1", domain_lookup_duration_ms=4, connect_duration_ms=271, secure_connection_duration_ms=147, private_relay=false, request_start_ms=281, request_duration_ms=0, response_start_ms=407, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	10:26:43.044321-0500	RedLemon	Task <6ECB616E-8846-44F5-9580-072FB66C30FE>.<1> finished successfully
error	10:26:43.044934-0500	RedLemon	nw_flow_add_write_request [C49.1 IPv4#e597c525:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	10:26:43.045037-0500	RedLemon	nw_write_request_report [C49] Send failed with error "Socket is not connected"
default	10:26:43.045181-0500	RedLemon	Connection 49: cleaning up
default	10:26:43.045265-0500	RedLemon	[C49 C4DECDEC-17B9-4ECC-95AE-ED0978332C91 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer] cancel
default	10:26:43.045644-0500	RedLemon	[C49 C4DECDEC-17B9-4ECC-95AE-ED0978332C91 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer] cancelled
	[C49.1 AB1A89A0-E078-456F-B8CA-07E9BFA6686D 10.0.0.249:51489<->IPv4#e597c525:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.535s, DNS @0.000s took 0.004s, TCP @0.408s took 0.123s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	10:26:43.046494-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C49] reporting state cancelled error Socket is not connected
default	10:26:43.046602-0500	RedLemon	Connection 49: done
error	10:26:43.159765-0500	RedLemon	tcp_input [C49.1:3] flags=[R] seq=1855058228, ack=0, win=0 state=LAST_ACK rcv_nxt=1855058228, snd_una=1737185165
error	10:26:43.159970-0500	RedLemon	tcp_input [C49.1:3] flags=[R] seq=1855058228, ack=0, win=0 state=CLOSED rcv_nxt=1855058228, snd_una=1737185165
error	10:26:43.160067-0500	RedLemon	tcp_input [C49.1:3] flags=[R] seq=1855058228, ack=0, win=0 state=CLOSED rcv_nxt=1855058228, snd_una=1737185165
error	10:26:43.160489-0500	RedLemon	tcp_input [C49.1:3] flags=[R] seq=1855058228, ack=0, win=0 state=CLOSED rcv_nxt=1855058228, snd_una=1737185165
error	10:26:43.160793-0500	RedLemon	tcp_input [C49.1:3] flags=[R] seq=1855058228, ack=0, win=0 state=CLOSED rcv_nxt=1855058228, snd_una=1737185165
error	10:26:43.161007-0500	RedLemon	tcp_input [C49.1:3] flags=[R] seq=1855058228, ack=0, win=0 state=CLOSED rcv_nxt=1855058228, snd_una=1737185165
default	10:26:43.260200-0500	runningboardd	Invalidating assertion 173-6145-2123 (target:[anon<RedLemon>(501):6145]) from originator [anon<RedLemon>(501):6145]
default	10:26:43.432952-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:43.433128-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:43.433296-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:43.438963-0500	runningboardd	Invalidating assertion 173-114-2124 (target:[anon<RedLemon>(501):6145]) from originator [daemon<com.apple.powerd>:114]
default	10:26:43.569395-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:43.569493-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:43.569591-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:44.464195-0500	runningboardd	Assertion did invalidate due to timeout: 173-140-2118 (target:[anon<RedLemon>(501):6145])
default	10:26:44.582977-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:44.583065-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:44.583144-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:45.043872-0500	RedLemon	Task <41A61A6D-2308-4CE7-9718-4B2C9AF2D359>.<316> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:45.043880-0500	RedLemon	Task <D4854618-AB32-45D5-9A04-6766F75C7D12>.<317> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:45.047437-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [06A02C95-788F-4FAD-8E68-6449C7EB301D] (reporting strategy default)> on Task <41A61A6D-2308-4CE7-9718-4B2C9AF2D359>.<316> was not selected for reporting
default	10:26:45.047563-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4684E97A-0312-4060-A198-21EA027CC880] (reporting strategy default)> on Task <D4854618-AB32-45D5-9A04-6766F75C7D12>.<317> was not selected for reporting
default	10:26:45.044174-0500	RedLemon	CoreAnimation: warning, deleted thread with uncommitted CATransaction; set CA_DEBUG_TRANSACTIONS=1 in environment to log backtraces, or set CA_ASSERT_MAIN_THREAD_TRANSACTIONS=1 to abort when an implicit transaction isn't created on a main thread.
default	10:26:45.050379-0500	RedLemon	Task <41A61A6D-2308-4CE7-9718-4B2C9AF2D359>.<316> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:45.050874-0500	RedLemon	Task <41A61A6D-2308-4CE7-9718-4B2C9AF2D359>.<316> now using Connection 3
default	10:26:45.052624-0500	RedLemon	Task <D4854618-AB32-45D5-9A04-6766F75C7D12>.<317> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:45.053056-0500	RedLemon	Task <D4854618-AB32-45D5-9A04-6766F75C7D12>.<317> now using Connection 3
default	10:26:45.054846-0500	RedLemon	0x7fbaf637fc28 ID=588 Task <41A61A6D-2308-4CE7-9718-4B2C9AF2D359>.<316> sent request, body N 0
default	10:26:45.055232-0500	RedLemon	0x7fbaf9cb3e98 ID=592 Task <D4854618-AB32-45D5-9A04-6766F75C7D12>.<317> sent request, body N 0
default	10:26:45.059362-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	10:26:45.059803-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6ECCCD39-0EB9-4752-98C8-3F5C9D2FC4E1] (reporting strategy default)> on Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> was not selected for reporting
default	10:26:45.060563-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:45.061074-0500	RedLemon	Connection 50: enabling TLS
default	10:26:45.061119-0500	RedLemon	Connection 50: starting, TC(0x0)
default	10:26:45.061177-0500	RedLemon	[C50 DC157AC3-95E1-4476-AA88-E4D5426C63A0 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{B8859272-5F9E-4A04-8983-3DD0D11B7C56}{(null)}{Y}{2} (private), proc: FA056963-4751-3C92-B931-FEB284B88616] start
default	10:26:45.061275-0500	RedLemon	[C50 Hostname#9081a023:443 initial path ((null))] event: path:start @0.000s
default	10:26:45.061600-0500	RedLemon	[C50 Hostname#9081a023:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 51A0F562-B2AD-41D3-89E2-64FF875C3563
default	10:26:45.061806-0500	RedLemon	[C50 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	10:26:45.061853-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C50] reporting state preparing
default	10:26:45.062104-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> setting up Connection 50
default	10:26:45.062068-0500	mDNSResponder	[R2241] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 6145 (RedLemon)
default	10:26:45.063308-0500	mDNSResponder	[R2241] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 6145 (RedLemon)
default	10:26:45.063539-0500	RedLemon	nw_endpoint_resolver_update [C50 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e597c525:443
default	10:26:45.063677-0500	RedLemon	[C50 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	10:26:45.064016-0500	RedLemon	[C50.1 IPv4#e597c525:443 initial path ((null))] event: path:start @0.002s
default	10:26:45.064454-0500	RedLemon	[C50.1 IPv4#e597c525:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: 64F5525F-34D3-4B74-B148-514CF84282C0
default	10:26:45.064574-0500	RedLemon	[C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.003s
default	10:26:45.065079-0500	RedLemon	[C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.003s
default	10:26:45.065642-0500	RedLemon	[C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.004s
default	10:26:45.065736-0500	RedLemon	tcp_output [C50.1:3] flags=[S] seq=1508728851, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1508728851
default	10:26:45.119648-0500	RedLemon	0x7fbaf637fc28 ID=588 Task <41A61A6D-2308-4CE7-9718-4B2C9AF2D359>.<316> received response, status 200 content U
default	10:26:45.120793-0500	RedLemon	Task <41A61A6D-2308-4CE7-9718-4B2C9AF2D359>.<316> response ended
default	10:26:45.121565-0500	RedLemon	Task <41A61A6D-2308-4CE7-9718-4B2C9AF2D359>.<316> done using Connection 3
default	10:26:45.121990-0500	RedLemon	Task <41A61A6D-2308-4CE7-9718-4B2C9AF2D359>.<316> summary for task success {transaction_duration_ms=73, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=3, response_start_ms=70, response_duration_ms=2, request_bytes=511, response_bytes=834, cache_hit=true}
default	10:26:45.122438-0500	RedLemon	Task <41A61A6D-2308-4CE7-9718-4B2C9AF2D359>.<316> finished successfully
default	10:26:45.124488-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [anon<RedLemon>(501):6145] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-6145-2125 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:45.124857-0500	runningboardd	Assertion 173-6145-2125 (target:[anon<RedLemon>(501):6145]) will be created as active as no start-time-defining assertions exist
default	10:26:45.125916-0500	RedLemon	Task <690F2FE8-95F8-44C1-8475-799F26BBDFEE>.<318> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:45.126722-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1D9E8C80-6D30-4E53-BC86-CEBF5DFD5B1A] (reporting strategy default)> on Task <690F2FE8-95F8-44C1-8475-799F26BBDFEE>.<318> was not selected for reporting
default	10:26:45.127928-0500	RedLemon	Task <690F2FE8-95F8-44C1-8475-799F26BBDFEE>.<318> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:45.128262-0500	RedLemon	Task <690F2FE8-95F8-44C1-8475-799F26BBDFEE>.<318> now using Connection 3
default	10:26:45.128808-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:45.129399-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:45.129914-0500	RedLemon	0x7fbaf8b0ed78 ID=596 Task <690F2FE8-95F8-44C1-8475-799F26BBDFEE>.<318> sent request, body N 0
default	10:26:45.130253-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:45.130474-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:45.130991-0500	RedLemon	0x7fbaf9cb3e98 ID=592 Task <D4854618-AB32-45D5-9A04-6766F75C7D12>.<317> received response, status 200 content U
default	10:26:45.131926-0500	RedLemon	Task <D4854618-AB32-45D5-9A04-6766F75C7D12>.<317> response ended
default	10:26:45.132493-0500	RedLemon	Task <D4854618-AB32-45D5-9A04-6766F75C7D12>.<317> done using Connection 3
default	10:26:45.132771-0500	RedLemon	Task <D4854618-AB32-45D5-9A04-6766F75C7D12>.<317> summary for task success {transaction_duration_ms=83, response_status=200, connection=3, reused=1, request_start_ms=4, request_duration_ms=2, response_start_ms=81, response_duration_ms=2, request_bytes=500, response_bytes=959, cache_hit=true}
default	10:26:45.133156-0500	RedLemon	Task <D4854618-AB32-45D5-9A04-6766F75C7D12>.<317> finished successfully
default	10:26:45.135622-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-2126 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:45.135765-0500	runningboardd	Assertion 173-114-2126 (target:[anon<RedLemon>(501):6145]) will be created as active
default	10:26:45.136919-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:45.136967-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:45.137017-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:45.147308-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:45.184832-0500	RedLemon	0x7fbaf8b0ed78 ID=596 Task <690F2FE8-95F8-44C1-8475-799F26BBDFEE>.<318> received response, status 200 content U
default	10:26:45.185720-0500	RedLemon	Task <690F2FE8-95F8-44C1-8475-799F26BBDFEE>.<318> response ended
default	10:26:45.186391-0500	RedLemon	Task <690F2FE8-95F8-44C1-8475-799F26BBDFEE>.<318> done using Connection 3
default	10:26:45.186628-0500	RedLemon	tcp_input [C50.1:3] flags=[S.] seq=190720423, ack=1508728852, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=1508728851
default	10:26:45.186709-0500	RedLemon	Task <690F2FE8-95F8-44C1-8475-799F26BBDFEE>.<318> summary for task success {transaction_duration_ms=59, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=57, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	10:26:45.186811-0500	RedLemon	nw_flow_connected [C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:45.187654-0500	RedLemon	Task <690F2FE8-95F8-44C1-8475-799F26BBDFEE>.<318> finished successfully
default	10:26:45.188254-0500	RedLemon	[C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.126s
default	10:26:45.188436-0500	RedLemon	[C50 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.127s
default	10:26:45.189758-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C50.1:2][0x7fbaf6358a30] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	10:26:45.190016-0500	RedLemon	boringssl_context_info_handler(2028) [C50.1:2][0x7fbaf6358a30] Client handshake started
default	10:26:45.190443-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS client enter_early_data
default	10:26:45.190727-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS client read_server_hello
default	10:26:45.192158-0500	RedLemon	Task <4B75E8C6-61E7-459C-9F0E-72C7FCC54E5D>.<319> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:45.193651-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [18A62E9E-F0F0-4D7F-BBD8-F593622FA3E2] (reporting strategy default)> on Task <4B75E8C6-61E7-459C-9F0E-72C7FCC54E5D>.<319> was not selected for reporting
default	10:26:45.195054-0500	RedLemon	Task <4B75E8C6-61E7-459C-9F0E-72C7FCC54E5D>.<319> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:45.195462-0500	RedLemon	Task <4B75E8C6-61E7-459C-9F0E-72C7FCC54E5D>.<319> now using Connection 3
default	10:26:45.196643-0500	RedLemon	0x7fbaf9cb3e98 ID=600 Task <4B75E8C6-61E7-459C-9F0E-72C7FCC54E5D>.<319> sent request, body N 0
default	10:26:45.211673-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:45.264287-0500	RedLemon	0x7fbaf9cb3e98 ID=600 Task <4B75E8C6-61E7-459C-9F0E-72C7FCC54E5D>.<319> received response, status 200 content U
default	10:26:45.265074-0500	RedLemon	Task <4B75E8C6-61E7-459C-9F0E-72C7FCC54E5D>.<319> response ended
default	10:26:45.265785-0500	RedLemon	Task <4B75E8C6-61E7-459C-9F0E-72C7FCC54E5D>.<319> done using Connection 3
default	10:26:45.266292-0500	RedLemon	Task <4B75E8C6-61E7-459C-9F0E-72C7FCC54E5D>.<319> summary for task success {transaction_duration_ms=71, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=69, response_duration_ms=2, request_bytes=524, response_bytes=840, cache_hit=true}
default	10:26:45.266850-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
default	10:26:45.267391-0500	RedLemon	Task <4B75E8C6-61E7-459C-9F0E-72C7FCC54E5D>.<319> finished successfully
default	10:26:45.271565-0500	RedLemon	🔍 Current guest participant found in polling: ursinho with ID 656DAA91-33B4-4688-9135-C982EA52D7C9
default	10:26:45.305138-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:45.318095-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client read_hello_retry_request
default	10:26:45.318262-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client read_server_hello
default	10:26:45.318799-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	10:26:45.319363-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client read_certificate_request
default	10:26:45.320013-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client read_server_certificate
default	10:26:45.320169-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	10:26:45.321479-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C50.1:2][0x7fbaf6358a30] Performing external trust evaluation
default	10:26:45.321768-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C50.1:2][0x7fbaf6358a30] Asyncing for external verify block
default	10:26:45.322148-0500	RedLemon	Connection 50: asked to evaluate TLS Trust
default	10:26:45.322607-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> auth completion disp=1 cred=0x0
default	10:26:45.329602-0500	RedLemon	Connection 50: TLS Trust result 0
default	10:26:45.329658-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C50.1:2][0x7fbaf6358a30] Returning from external verify block with result: true
default	10:26:45.329714-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C50.1:2][0x7fbaf6358a30] Certificate verification result: OK
default	10:26:45.330055-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client read_server_finished
default	10:26:45.330522-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client send_end_of_early_data
default	10:26:45.330583-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	10:26:45.330625-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client send_client_certificate
default	10:26:45.330703-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client complete_second_flight
default	10:26:45.330924-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS 1.3 client done
default	10:26:45.331118-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS client finish_client_handshake
default	10:26:45.331168-0500	RedLemon	boringssl_context_info_handler(2045) [C50.1:2][0x7fbaf6358a30] Client handshake state: TLS client done
default	10:26:45.331211-0500	RedLemon	boringssl_context_info_handler(2034) [C50.1:2][0x7fbaf6358a30] Client handshake done
default	10:26:45.331903-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C50.1:2][0x7fbaf6358a30] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(141ms) flight_time(129ms) rtt(128ms) write_stalls(0) read_stalls(6)]
default	10:26:45.332109-0500	RedLemon	nw_flow_connected [C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:45.332402-0500	RedLemon	[C50.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.271s
default	10:26:45.332717-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C50] reporting state ready
default	10:26:45.332855-0500	RedLemon	[C50 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.271s
default	10:26:45.333012-0500	RedLemon	[C50.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.271s
default	10:26:45.333081-0500	RedLemon	[C50 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.271s
default	10:26:45.333527-0500	RedLemon	Connection 50: connected successfully
default	10:26:45.333585-0500	RedLemon	Connection 50: TLS handshake complete
default	10:26:45.333861-0500	RedLemon	Connection 50: ready C(N) E(N)
default	10:26:45.334085-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> now using Connection 50
default	10:26:45.334197-0500	RedLemon	Connection 50: received viability advisory(Y)
default	10:26:45.334423-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> sent request, body N 0
default	10:26:45.461920-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> received response, status 101 content U
default	10:26:45.461951-0500	RedLemon	🎬 Guest: Starting playback after countdown
default	10:26:45.462240-0500	RedLemon	🎬 Guest: Launching player for Frankenstein
default	10:26:45.462694-0500	RedLemon	   Quality: 1080p
default	10:26:45.462730-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> response ended
default	10:26:45.463031-0500	RedLemon	   Mode: watchParty
default	10:26:45.463037-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> done using Connection 50
default	10:26:45.463259-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	10:26:45.464688-0500	RedLemon	[C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.403s
default	10:26:45.464799-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C50] reporting state preparing
default	10:26:45.464946-0500	RedLemon	[C50 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.403s
default	10:26:45.465235-0500	RedLemon	[C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.403s
default	10:26:45.465358-0500	RedLemon	[C50 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.404s
default	10:26:45.465508-0500	RedLemon	nw_flow_connected [C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:45.465773-0500	RedLemon	[C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.404s
default	10:26:45.465886-0500	RedLemon	[C50 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.404s
default	10:26:45.466111-0500	RedLemon	nw_flow_connected [C50.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:45.466708-0500	RedLemon	[C50.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.405s
default	10:26:45.466792-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C50] reporting state ready
default	10:26:45.466916-0500	RedLemon	[C50 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.405s
default	10:26:45.561948-0500	RedLemon	🖼️ Loading background art: https://images.metahub.space/background/medium/tt1312221/img
default	10:26:45.562180-0500	RedLemon	⏳ Background art loading...
default	10:26:45.562385-0500	RedLemon	🎨 Loading logo: https://images.metahub.space/logo/medium/tt1312221/img
default	10:26:45.562627-0500	RedLemon	⏳ Logo loading...
default	10:26:45.587085-0500	RedLemon	Task <BFCAFE17-317C-40A4-A416-AEB85EA59B52>.<320> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	10:26:45.587167-0500	RedLemon	nw_flow_disconnected [C50.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	10:26:45.587853-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6BEA809B-C9A1-4BA2-8604-2FA44F220C91] (reporting strategy default)> on Task <BFCAFE17-317C-40A4-A416-AEB85EA59B52>.<320> was not selected for reporting
default	10:26:45.588030-0500	RedLemon	nw_protocol_tcp_log_summary [C50.1:3]
	[07B0C92A-9631-4B09-B5A3-AEB05986B393 <private>:51490<-><private>:443]
	Init: 1, Conn_Time: 121.041ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 124.781ms, rtt_var: 4.062ms rtt_nc: 121.812ms, rtt_var_nc: 27.937ms base rtt: 113ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	10:26:45.588623-0500	RedLemon	Task <CA7732B7-9182-4449-9A7A-B2A23F9209AA>.<321> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	10:26:45.588730-0500	RedLemon	Task <BFCAFE17-317C-40A4-A416-AEB85EA59B52>.<320> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:45.589406-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E692E2B7-B100-4F58-A9F0-53D16F307141] (reporting strategy default)> on Task <CA7732B7-9182-4449-9A7A-B2A23F9209AA>.<321> was not selected for reporting
default	10:26:45.588941-0500	RedLemon	Task <BFCAFE17-317C-40A4-A416-AEB85EA59B52>.<320> now using Connection 47
default	10:26:45.590162-0500	RedLemon	Task <CA7732B7-9182-4449-9A7A-B2A23F9209AA>.<321> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:45.590362-0500	RedLemon	Task <CA7732B7-9182-4449-9A7A-B2A23F9209AA>.<321> now using Connection 47
default	10:26:45.590512-0500	RedLemon	tcp_input [C50.1:3] flags=[FP.] seq=190723430, ack=1508729907, win=249 state=ESTABLISHED rcv_nxt=190723430, snd_una=1508729907
default	10:26:45.591098-0500	RedLemon	[C50.1 IPv4#e597c525:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.529s, error Socket is not connected
default	10:26:45.591169-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C50] reporting state failed error Socket is not connected
default	10:26:45.591748-0500	RedLemon	[C50 Hostname#9081a023:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.530s
error	10:26:45.592046-0500	RedLemon	tcp_output [C50.1:3] flags=[R.] seq=1508730038, ack=190723455, win=2047 state=CLOSED rcv_nxt=190723455, snd_una=1508729907
default	10:26:45.592474-0500	RedLemon	Task <BFCAFE17-317C-40A4-A416-AEB85EA59B52>.<320> sent request, body N 0
default	10:26:45.592550-0500	RedLemon	Task <CA7732B7-9182-4449-9A7A-B2A23F9209AA>.<321> sent request, body N 0
error	10:26:45.592744-0500	RedLemon	Connection 50: received failure notification
default	10:26:45.615138-0500	RedLemon	Task <BFCAFE17-317C-40A4-A416-AEB85EA59B52>.<320> received response, status 200 content K
default	10:26:45.620826-0500	RedLemon	Task <BFCAFE17-317C-40A4-A416-AEB85EA59B52>.<320> done using Connection 47
default	10:26:45.621454-0500	RedLemon	Task <BFCAFE17-317C-40A4-A416-AEB85EA59B52>.<320> response ended
default	10:26:45.622481-0500	RedLemon	Task <BFCAFE17-317C-40A4-A416-AEB85EA59B52>.<320> summary for task success {transaction_duration_ms=34, response_status=200, connection=47, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=26, response_duration_ms=6, request_bytes=36, response_bytes=63076, cache_hit=false}
default	10:26:45.622611-0500	RedLemon	Task <BFCAFE17-317C-40A4-A416-AEB85EA59B52>.<320> finished successfully
default	10:26:45.622786-0500	RedLemon	Task <CA7732B7-9182-4449-9A7A-B2A23F9209AA>.<321> received response, status 200 content K
default	10:26:45.624018-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	10:26:45.624264-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	10:26:45.624676-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	10:26:45.625281-0500	RedLemon	Task <99FD6554-825A-4E46-8E9E-DA03117B5F6A>.<322> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:45.625391-0500	RedLemon	Task <7A0D0B3D-B7D1-4E1C-AC33-42125E084D0E>.<14> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:26:45.625804-0500	RedLemon	Task <E9CCAC97-8F0F-46B6-B4B6-F922D10D454C>.<323> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
error	10:26:45.626256-0500	RedLemon	nw_read_request_report [C50] Receive failed with error "Socket is not connected"
default	10:26:45.626920-0500	RedLemon	✅ Logo loaded successfully
error	10:26:45.626600-0500	RedLemon	nw_flow_service_reads [C50.1 IPv4#e597c525:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	10:26:45.630095-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7345E1A3-5174-4232-B424-ABFFC4FE8EFD] (reporting strategy default)> on Task <7A0D0B3D-B7D1-4E1C-AC33-42125E084D0E>.<14> was not selected for reporting
default	10:26:45.631073-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5A396F2E-DA38-4FB2-8AF6-82925141E191] (reporting strategy default)> on Task <99FD6554-825A-4E46-8E9E-DA03117B5F6A>.<322> was not selected for reporting
default	10:26:45.631423-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CBFA631A-363B-4866-80F4-5A95B7CD5CD0] (reporting strategy default)> on Task <E9CCAC97-8F0F-46B6-B4B6-F922D10D454C>.<323> was not selected for reporting
default	10:26:45.632337-0500	RedLemon	Task <99FD6554-825A-4E46-8E9E-DA03117B5F6A>.<322> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	10:26:45.632524-0500	RedLemon	Task <7A0D0B3D-B7D1-4E1C-AC33-42125E084D0E>.<14> now using Connection 41
default	10:26:45.632750-0500	RedLemon	⚠️ Lobby: Failed to poll participants: Error Domain=NSURLErrorDomain Code=-999 "cancelled" UserInfo={NSErrorFailingURLStringKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/room_participants?select=*&room_id=eq.URC9, NSErrorFailingURLKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/room_participants?select=*&room_id=eq.URC9, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <99FD6554-825A-4E46-8E9E-DA03117B5F6A>.<322>"
), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <99FD6554-825A-4E46-8E9E-DA03117B5F6A>.<322>, NSLocalizedDescription=cancelled}
default	10:26:45.633531-0500	RedLemon	Task <E9CCAC97-8F0F-46B6-B4B6-F922D10D454C>.<323> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	10:26:45.633858-0500	RedLemon	⚠️ Lobby: Failed to poll room state: Error Domain=NSURLErrorDomain Code=-999 "cancelled" UserInfo={NSErrorFailingURLStringKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/rooms?select=*&id=eq.URC9, NSErrorFailingURLKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/rooms?select=*&id=eq.URC9, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <E9CCAC97-8F0F-46B6-B4B6-F922D10D454C>.<323>"
), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <E9CCAC97-8F0F-46B6-B4B6-F922D10D454C>.<323>, NSLocalizedDescription=cancelled}
default	10:26:45.634380-0500	RedLemon	Task <7A0D0B3D-B7D1-4E1C-AC33-42125E084D0E>.<14> sent request, body N 0
default	10:26:45.634830-0500	RedLemon	Task <99FD6554-825A-4E46-8E9E-DA03117B5F6A>.<322> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:45.635168-0500	RedLemon	Task <99FD6554-825A-4E46-8E9E-DA03117B5F6A>.<322> now using Connection 3
default	10:26:45.634470-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> summary for task success {transaction_duration_ms=574, response_status=101, connection=50, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=267, secure_connection_duration_ms=141, private_relay=false, request_start_ms=274, request_duration_ms=0, response_start_ms=401, response_duration_ms=1, request_bytes=359, response_bytes=330, cache_hit=false}
default	10:26:45.635646-0500	RedLemon	Task <DC7F77F0-23B8-41F0-BC50-4AFD8FADAC1F>.<1> finished successfully
default	10:26:45.638511-0500	RedLemon	Task <99FD6554-825A-4E46-8E9E-DA03117B5F6A>.<322> done using Connection 3
default	10:26:45.648972-0500	RedLemon	Task <CA7732B7-9182-4449-9A7A-B2A23F9209AA>.<321> done using Connection 47
error	10:26:45.649566-0500	RedLemon	nw_flow_add_write_request [C50.1 IPv4#e597c525:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	10:26:45.649636-0500	RedLemon	nw_write_request_report [C50] Send failed with error "Socket is not connected"
default	10:26:45.649694-0500	RedLemon	Connection 50: cleaning up
default	10:26:45.653924-0500	RedLemon	[C50 DC157AC3-95E1-4476-AA88-E4D5426C63A0 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer] cancel
default	10:26:45.654089-0500	RedLemon	[C50 DC157AC3-95E1-4476-AA88-E4D5426C63A0 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer] cancelled
	[C50.1 64F5525F-34D3-4B74-B148-514CF84282C0 10.0.0.249:51490<->IPv4#e597c525:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.592s, DNS @0.000s took 0.002s, TCP @0.403s took 0.122s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	10:26:45.662827-0500	RedLemon	Task <F41CDCBC-42E7-40C5-8F0E-59C818E6284E>.<324> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	10:26:45.666711-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C50] reporting state cancelled error Socket is not connected
default	10:26:45.666951-0500	RedLemon	Task <5FEEFD11-675E-4663-8B70-95D16B75D1DE>.<326> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	10:26:45.666951-0500	RedLemon	Task <8E512986-ACCE-476F-AC33-544F254C12A6>.<325> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	10:26:45.667963-0500	RedLemon	Task <4BB933C4-52EA-476A-8E90-AED03FB963D0>.<327> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	10:26:45.669341-0500	RedLemon	Connection 50: done
default	10:26:45.669922-0500	RedLemon	0x7fbaf6358a48 ID=604 Task <99FD6554-825A-4E46-8E9E-DA03117B5F6A>.<322> sent request, body N 0
default	10:26:45.671245-0500	RedLemon	Task <CA7732B7-9182-4449-9A7A-B2A23F9209AA>.<321> response ended
default	10:26:45.672022-0500	RedLemon	Task <CA7732B7-9182-4449-9A7A-B2A23F9209AA>.<321> summary for task success {transaction_duration_ms=82, response_status=200, connection=47, reused=1, request_start_ms=2, request_duration_ms=0, response_start_ms=32, response_duration_ms=49, request_bytes=41, response_bytes=117927, cache_hit=false}
default	10:26:45.672235-0500	RedLemon	Task <CA7732B7-9182-4449-9A7A-B2A23F9209AA>.<321> finished successfully
default	10:26:45.673295-0500	RedLemon	✅ Background art loaded successfully
default	10:26:45.673743-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C2A26C3D-04FE-4CA7-A7D6-AAF757F254B5] (reporting strategy default)> on Task <5FEEFD11-675E-4663-8B70-95D16B75D1DE>.<326> was not selected for reporting
default	10:26:45.678916-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DD2CFCBF-CB9F-4019-AB62-5997895643BE] (reporting strategy default)> on Task <8E512986-ACCE-476F-AC33-544F254C12A6>.<325> was not selected for reporting
default	10:26:45.695374-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [072E2E28-0358-44DC-9E56-1FD0189A34CB] (reporting strategy default)> on Task <4BB933C4-52EA-476A-8E90-AED03FB963D0>.<327> was not selected for reporting
default	10:26:45.695851-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BBA63685-56E2-4248-B2AC-5AD4407B1074] (reporting strategy default)> on Task <F41CDCBC-42E7-40C5-8F0E-59C818E6284E>.<324> was not selected for reporting
default	10:26:45.707474-0500	RedLemon	Task <8E512986-ACCE-476F-AC33-544F254C12A6>.<325> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:45.707926-0500	RedLemon	Task <8E512986-ACCE-476F-AC33-544F254C12A6>.<325> now using Connection 23
default	10:26:45.708461-0500	RedLemon	Task <8E512986-ACCE-476F-AC33-544F254C12A6>.<325> sent request, body N 0
default	10:26:45.718070-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:45.718900-0500	RedLemon	Task <5FEEFD11-675E-4663-8B70-95D16B75D1DE>.<326> summary for task success {transaction_duration_ms=23, response_status=200, cache_hit=true}
default	10:26:45.719212-0500	RedLemon	Task <5FEEFD11-675E-4663-8B70-95D16B75D1DE>.<326> finished successfully
default	10:26:45.719372-0500	RedLemon	Task <4BB933C4-52EA-476A-8E90-AED03FB963D0>.<327> summary for task success {transaction_duration_ms=13, response_status=200, cache_hit=true}
default	10:26:45.719558-0500	RedLemon	Task <4BB933C4-52EA-476A-8E90-AED03FB963D0>.<327> finished successfully
default	10:26:45.720082-0500	RedLemon	Task <F41CDCBC-42E7-40C5-8F0E-59C818E6284E>.<324> summary for task success {transaction_duration_ms=13, response_status=200, cache_hit=true}
default	10:26:45.720314-0500	RedLemon	Task <F41CDCBC-42E7-40C5-8F0E-59C818E6284E>.<324> finished successfully
default	10:26:45.898926-0500	RedLemon	Task <8E512986-ACCE-476F-AC33-544F254C12A6>.<325> received response, status 200 content U
default	10:26:46.119132-0500	RedLemon	Task <8E512986-ACCE-476F-AC33-544F254C12A6>.<325> done using Connection 23
default	10:26:46.119657-0500	RedLemon	Task <8E512986-ACCE-476F-AC33-544F254C12A6>.<325> response ended
default	10:26:46.119982-0500	RedLemon	Task <8E512986-ACCE-476F-AC33-544F254C12A6>.<325> summary for task success {transaction_duration_ms=416, response_status=200, connection=23, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=195, response_duration_ms=220, request_bytes=483, response_bytes=6675, cache_hit=true}
default	10:26:46.120388-0500	RedLemon	Task <8E512986-ACCE-476F-AC33-544F254C12A6>.<325> finished successfully
default	10:26:46.120790-0500	RedLemon	🎬 Guest: Starting playback after database fallback detection
default	10:26:46.121066-0500	RedLemon	🎬 Guest: Launching player via database fallback
default	10:26:46.121257-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	10:26:46.121659-0500	RedLemon	   Quality: 1080p
default	10:26:46.122097-0500	RedLemon	   Mode: watchParty
default	10:26:46.122363-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	10:26:46.150888-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 207
default	10:26:46.151114-0500	RedLemon	   INPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	10:26:46.151628-0500	RedLemon	   INPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean
default	10:26:46.151935-0500	RedLemon	   INPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean
default	10:26:46.152115-0500	RedLemon	   INPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	10:26:46.152271-0500	RedLemon	   INPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	10:26:46.152578-0500	RedLemon	   INPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	10:26:46.153075-0500	RedLemon	   INPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	10:26:46.153408-0500	RedLemon	   INPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	10:26:46.153589-0500	RedLemon	   INPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	10:26:46.153928-0500	RedLemon	   INPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean
default	10:26:46.154918-0500	RedLemon	   INPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	10:26:46.155481-0500	RedLemon	   INPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	10:26:46.160214-0500	RedLemon	   INPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean
default	10:26:46.163275-0500	RedLemon	   INPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	10:26:46.168679-0500	RedLemon	   INPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	10:26:46.177530-0500	RedLemon	   INPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean
default	10:26:46.177803-0500	RedLemon	   INPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	10:26:46.178148-0500	RedLemon	   INPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	10:26:46.178390-0500	RedLemon	   INPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	10:26:46.178540-0500	RedLemon	   INPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	10:26:46.178886-0500	RedLemon	   INPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	10:26:46.179830-0500	RedLemon	   INPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	10:26:46.182580-0500	RedLemon	   INPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	10:26:46.182960-0500	RedLemon	   INPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	10:26:46.187707-0500	RedLemon	   INPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	10:26:46.188070-0500	RedLemon	   INPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean
default	10:26:46.189049-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	10:26:46.189522-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	10:26:46.189793-0500	RedLemon	   INPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	10:26:46.193813-0500	RedLemon	   INPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	10:26:46.194394-0500	RedLemon	   INPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	10:26:46.194629-0500	RedLemon	   INPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	10:26:46.194974-0500	RedLemon	   INPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	10:26:46.195555-0500	RedLemon	   INPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	10:26:46.195956-0500	RedLemon	   INPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	10:26:46.196397-0500	RedLemon	   INPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	10:26:46.196754-0500	RedLemon	   INPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	10:26:46.211724-0500	RedLemon	   INPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	10:26:46.212825-0500	RedLemon	   INPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	10:26:46.213013-0500	RedLemon	   INPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	10:26:46.213263-0500	RedLemon	   INPUT[40]: FRANKENSTEIN mkv | Unknown | zilean
default	10:26:46.213615-0500	RedLemon	   INPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	10:26:46.218055-0500	RedLemon	   INPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	10:26:46.228487-0500	RedLemon	   INPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	10:26:46.228698-0500	RedLemon	   INPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	10:26:46.229054-0500	RedLemon	   INPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	10:26:46.229836-0500	RedLemon	   INPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	10:26:46.230132-0500	RedLemon	   INPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	10:26:46.236027-0500	RedLemon	   INPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	10:26:46.243046-0500	RedLemon	   INPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	10:26:46.243942-0500	RedLemon	tcp_input [C43.1.1:3] flags=[FP.] seq=988674459, ack=3949760858, win=8 state=ESTABLISHED rcv_nxt=988674459, snd_una=3949760858
default	10:26:46.244810-0500	RedLemon	nw_protocol_tcp_log_summary [C43.1.1:3]
	[CBABF278-B02B-419B-8583-0A4A06B2CBCB <private>:65194<-><private>:443]
	Init: 1, Conn_Time: 11.804ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/1, TS: 1
	rtt_cache: process, rtt_upd: 8, rtt: 28.218ms, rtt_var: 18.312ms rtt_nc: 23.687ms, rtt_var_nc: 17.812ms base rtt: 8ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	10:26:46.245544-0500	RedLemon	   INPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	10:26:46.245733-0500	RedLemon	   INPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	10:26:46.245899-0500	RedLemon	   INPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	10:26:46.246156-0500	RedLemon	   INPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	10:26:46.246447-0500	RedLemon	   INPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	10:26:46.246737-0500	RedLemon	   INPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	10:26:46.247118-0500	RedLemon	   INPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	10:26:46.256666-0500	RedLemon	   INPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	10:26:46.256915-0500	RedLemon	   INPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	10:26:46.257116-0500	RedLemon	   INPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	10:26:46.257309-0500	RedLemon	   INPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	10:26:46.257577-0500	RedLemon	   INPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	10:26:46.257797-0500	RedLemon	   INPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	10:26:46.257925-0500	RedLemon	Connection 43: read-side closed
default	10:26:46.258204-0500	RedLemon	   INPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	10:26:46.258332-0500	RedLemon	Connection 43: read-side closed
default	10:26:46.258663-0500	RedLemon	Connection 43: read-side closed
default	10:26:46.258934-0500	RedLemon	Connection 43: cleaning up
default	10:26:46.259008-0500	RedLemon	[C43 B7BF0022-6357-4403-B44F-9903B8695BBD Hostname#309115f3:443 quic-connection, url hash: cc03c18e, definite, attribution: developer] cancel
default	10:26:46.259150-0500	RedLemon	[C43 B7BF0022-6357-4403-B44F-9903B8695BBD Hostname#309115f3:443 quic-connection, url hash: cc03c18e, definite, attribution: developer] cancelled
	[C43.1.1 02B0B460-902A-40C5-B4EA-624A958AACDB 2607:fea8:995b:fd00:983f:9889:cc56:9bfb.65194<->IPv6#297a0349.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 16.507s, DNS @0.000s took 0.053s, TCP @0.054s took 0.012s, TLS 1.3 took 0.026s
	bytes in/out: 4003/1002, packets in/out: 18/20, rtt: 0.028s, retransmitted bytes: 0, out-of-order bytes: 0
default	10:26:46.259653-0500	RedLemon	nw_flow_disconnected [C43.1.1 IPv6#297a0349.443 cancelled channel-flow ((null))] Output protocol disconnected
default	10:26:46.259866-0500	RedLemon	   INPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	10:26:46.260060-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state cancelled
default	10:26:46.260516-0500	RedLemon	   INPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	10:26:46.261200-0500	RedLemon	   INPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	10:26:46.261405-0500	RedLemon	   INPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	10:26:46.260404-0500	RedLemon	tcp_output [C43.1.1:3] flags=[FP.] seq=3949760897, ack=988674484, win=2048 state=LAST_ACK rcv_nxt=988674484, snd_una=3949760858
default	10:26:46.261759-0500	RedLemon	   INPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	10:26:46.262181-0500	RedLemon	   INPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	10:26:46.262444-0500	RedLemon	   INPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	10:26:46.262675-0500	RedLemon	   INPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	10:26:46.274590-0500	RedLemon	   INPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	10:26:46.274785-0500	RedLemon	   INPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
error	10:26:46.274071-0500	RedLemon	tcp_input [C43.1.1:3] flags=[R.] seq=988674484, ack=3949760897, win=8 state=LAST_ACK rcv_nxt=988674484, snd_una=3949760897
default	10:26:46.274967-0500	RedLemon	   INPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	10:26:46.277554-0500	RedLemon	   INPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	10:26:46.278234-0500	RedLemon	   INPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	10:26:46.278547-0500	RedLemon	   INPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	10:26:46.278759-0500	RedLemon	   INPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	10:26:46.279082-0500	RedLemon	   INPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	10:26:46.279561-0500	RedLemon	   INPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	10:26:46.279746-0500	RedLemon	   INPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	10:26:46.279896-0500	RedLemon	   INPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	10:26:46.285722-0500	RedLemon	   INPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	10:26:46.286814-0500	RedLemon	   INPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
error	10:26:46.285420-0500	RedLemon	tcp_input [C43.1.1:3] flags=[R] seq=988674484, ack=0, win=0 state=CLOSED rcv_nxt=988674484, snd_una=3949760897
default	10:26:46.286962-0500	RedLemon	   INPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	10:26:46.287086-0500	RedLemon	   INPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	10:26:46.287265-0500	RedLemon	   INPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	10:26:46.287430-0500	RedLemon	   INPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	10:26:46.287581-0500	RedLemon	   INPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	10:26:46.287760-0500	RedLemon	   INPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	10:26:46.288028-0500	RedLemon	   INPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.288417-0500	RedLemon	   INPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	10:26:46.288789-0500	RedLemon	   INPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.289150-0500	RedLemon	   INPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	10:26:46.289442-0500	RedLemon	   INPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	10:26:46.289616-0500	RedLemon	   INPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.292408-0500	RedLemon	   INPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.293291-0500	RedLemon	   INPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.293570-0500	RedLemon	   INPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	10:26:46.296617-0500	RedLemon	   INPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	10:26:46.297243-0500	RedLemon	   INPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	10:26:46.297466-0500	RedLemon	   INPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.297607-0500	RedLemon	   INPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	10:26:46.297730-0500	RedLemon	   INPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.297853-0500	RedLemon	   INPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.297980-0500	RedLemon	   INPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.298105-0500	RedLemon	   INPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	10:26:46.298759-0500	RedLemon	   INPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	10:26:46.298919-0500	RedLemon	   INPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	10:26:46.309149-0500	RedLemon	   INPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	10:26:46.309317-0500	RedLemon	   INPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.310436-0500	RedLemon	   INPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	10:26:46.310628-0500	RedLemon	   INPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.310956-0500	RedLemon	   INPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	10:26:46.311110-0500	RedLemon	   INPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	10:26:46.311356-0500	RedLemon	   INPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	10:26:46.311703-0500	RedLemon	   INPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	10:26:46.312069-0500	RedLemon	   INPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	10:26:46.312437-0500	RedLemon	   INPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.312609-0500	RedLemon	   INPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	10:26:46.312937-0500	RedLemon	   INPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.313209-0500	RedLemon	   INPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.313473-0500	RedLemon	   INPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.313709-0500	RedLemon	   INPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	10:26:46.314059-0500	RedLemon	   INPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.314199-0500	RedLemon	   INPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.314333-0500	RedLemon	   INPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	10:26:46.314448-0500	RedLemon	   INPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	10:26:46.314585-0500	RedLemon	   INPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	10:26:46.321141-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	10:26:46.314697-0500	RedLemon	   INPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	10:26:46.321374-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	10:26:46.321496-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	10:26:46.321496-0500	RedLemon	   INPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	10:26:46.322715-0500	RedLemon	Task <BAE2A88C-5EFD-40A1-90D9-9760F39CAEA5>.<15> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	10:26:46.327732-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [EA51E45A-66CE-462E-936A-0ABF49987D09] (reporting strategy default)> on Task <BAE2A88C-5EFD-40A1-90D9-9760F39CAEA5>.<15> was not selected for reporting
default	10:26:46.327925-0500	RedLemon	   INPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	10:26:46.329962-0500	RedLemon	Connection 51: starting, TC(0x0)
default	10:26:46.330030-0500	RedLemon	[C51 D062AF16-5B05-4561-B041-530ABD619182 127.0.0.1:47253 tcp, url hash: 0a23289f, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{3A52D9FB-3E47-4CB8-B57B-00F7E75C60BB}{(null)}{Y}{2} (private), proc: FA056963-4751-3C92-B931-FEB284B88616] start
default	10:26:46.330118-0500	RedLemon	[C51 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	10:26:46.330648-0500	RedLemon	[C51 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.000s, uuid: 4575CC08-B212-4061-849A-F15B6137D36E
default	10:26:46.329396-0500	RedLemon	   INPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	10:26:46.331829-0500	RedLemon	   INPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	10:26:46.332192-0500	RedLemon	   INPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	10:26:46.332360-0500	RedLemon	   INPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	10:26:46.332480-0500	RedLemon	   INPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	10:26:46.332608-0500	RedLemon	[C51 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.002s
default	10:26:46.332614-0500	RedLemon	   INPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	10:26:46.334177-0500	RedLemon	   INPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.334321-0500	RedLemon	   INPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	10:26:46.334446-0500	RedLemon	   INPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	10:26:46.334573-0500	RedLemon	   INPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	10:26:46.332794-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state preparing
default	10:26:46.334702-0500	RedLemon	   INPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	10:26:46.334897-0500	RedLemon	   INPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	10:26:46.335222-0500	RedLemon	Task <BAE2A88C-5EFD-40A1-90D9-9760F39CAEA5>.<15> setting up Connection 51
default	10:26:46.341562-0500	RedLemon	   INPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	10:26:46.343168-0500	RedLemon	   INPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	10:26:46.343386-0500	RedLemon	   INPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	10:26:46.343432-0500	RedLemon	nw_socket_handle_socket_event [C51:2] Socket received CONNECTED event
default	10:26:46.343549-0500	RedLemon	   INPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	10:26:46.343601-0500	RedLemon	nw_flow_connected [C51 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	10:26:46.343657-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.343657-0500	RedLemon	[C51 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.013s
default	10:26:46.343760-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.343832-0500	RedLemon	nw_flow_connected [C51 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:46.345309-0500	RedLemon	[C51 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.015s
default	10:26:46.345454-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C51] reporting state ready
default	10:26:46.345511-0500	RedLemon	[C51 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.015s
default	10:26:46.345586-0500	RedLemon	Connection 51: connected successfully
default	10:26:46.345681-0500	RedLemon	Connection 51: ready C(N) E(N)
default	10:26:46.345877-0500	RedLemon	Task <BAE2A88C-5EFD-40A1-90D9-9760F39CAEA5>.<15> now using Connection 51
default	10:26:46.345983-0500	RedLemon	Connection 51: received viability advisory(Y)
default	10:26:46.343997-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.346544-0500	RedLemon	Task <BAE2A88C-5EFD-40A1-90D9-9760F39CAEA5>.<15> sent request, body N 0
default	10:26:46.346836-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.346949-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.347045-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.347141-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.348323-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.349915-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.352613-0500	RedLemon	Task <3958E9BB-003A-4C0B-9D51-36D63BAC1D3D>.<329> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	10:26:46.352699-0500	RedLemon	Task <B336C855-DC3A-4A61-8D1D-325F2BCEB1BC>.<330> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	10:26:46.352726-0500	RedLemon	Task <ADBD52F6-545D-4A24-B774-21C7CC67F8DB>.<328> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	10:26:46.353087-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.353909-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.355099-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [49C5B37E-7E93-4AE6-A926-90B39B52344A] (reporting strategy default)> on Task <B336C855-DC3A-4A61-8D1D-325F2BCEB1BC>.<330> was not selected for reporting
default	10:26:46.354938-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.355511-0500	RedLemon	Task <1D2E3045-9D60-4B32-B80D-1380CF714E92>.<331> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	10:26:46.356252-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D9EF8909-BB81-42A1-B2B8-0B403B06010E] (reporting strategy default)> on Task <ADBD52F6-545D-4A24-B774-21C7CC67F8DB>.<328> was not selected for reporting
default	10:26:46.356844-0500	RedLemon	Task <B336C855-DC3A-4A61-8D1D-325F2BCEB1BC>.<330> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:46.357038-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4A9CC5A4-D6DA-4519-916E-469E744E8F5F] (reporting strategy default)> on Task <3958E9BB-003A-4C0B-9D51-36D63BAC1D3D>.<329> was not selected for reporting
default	10:26:46.356983-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.357367-0500	RedLemon	Task <B336C855-DC3A-4A61-8D1D-325F2BCEB1BC>.<330> now using Connection 23
default	10:26:46.357711-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [44A7DAB3-94DE-480A-BA3C-574DE7C124C2] (reporting strategy default)> on Task <1D2E3045-9D60-4B32-B80D-1380CF714E92>.<331> was not selected for reporting
default	10:26:46.357767-0500	RedLemon	Task <B336C855-DC3A-4A61-8D1D-325F2BCEB1BC>.<330> sent request, body N 0
default	10:26:46.358022-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.360223-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.360409-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.361018-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.361169-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.361299-0500	RedLemon	Task <ADBD52F6-545D-4A24-B774-21C7CC67F8DB>.<328> summary for task success {transaction_duration_ms=4, response_status=200, cache_hit=true}
default	10:26:46.361465-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.361516-0500	RedLemon	Task <ADBD52F6-545D-4A24-B774-21C7CC67F8DB>.<328> finished successfully
default	10:26:46.361726-0500	RedLemon	Task <3958E9BB-003A-4C0B-9D51-36D63BAC1D3D>.<329> summary for task success {transaction_duration_ms=2, response_status=200, cache_hit=true}
default	10:26:46.362018-0500	RedLemon	Task <3958E9BB-003A-4C0B-9D51-36D63BAC1D3D>.<329> finished successfully
default	10:26:46.362149-0500	RedLemon	Task <1D2E3045-9D60-4B32-B80D-1380CF714E92>.<331> summary for task success {transaction_duration_ms=2, response_status=200, cache_hit=true}
default	10:26:46.362673-0500	RedLemon	Task <1D2E3045-9D60-4B32-B80D-1380CF714E92>.<331> finished successfully
default	10:26:46.365911-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.366550-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.367060-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.367201-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.367518-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.367855-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.367996-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.368675-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.369148-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.370019-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.370604-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.370899-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.372005-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.372195-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.375231-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.375797-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.376468-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.377355-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.377532-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.377582-0500	runningboardd	Invalidating assertion 173-6145-2125 (target:[anon<RedLemon>(501):6145]) from originator [anon<RedLemon>(501):6145]
default	10:26:46.377654-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.378098-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.378238-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.378704-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.379076-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.379215-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.379530-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.379985-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.380141-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.380562-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.380712-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 720p | 720p | comet
default	10:26:46.380975-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 720p | 720p | comet
default	10:26:46.381526-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	10:26:46.381688-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 480p | 480p | comet
default	10:26:46.381879-0500	RedLemon	   INPUT[201]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.382222-0500	RedLemon	   INPUT[202]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.382366-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.382685-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.383414-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.383579-0500	RedLemon	   INPUT[206]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.383915-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	10:26:46.384355-0500	RedLemon	Task <A676459B-D7F5-477B-B28B-36583413D607>.<332> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	10:26:46.384809-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2C4D4B08-3499-4A25-8534-CE71997DD27B] (reporting strategy default)> on Task <A676459B-D7F5-477B-B28B-36583413D607>.<332> was not selected for reporting
default	10:26:46.385673-0500	RedLemon	Task <A676459B-D7F5-477B-B28B-36583413D607>.<332> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:46.385973-0500	RedLemon	Task <A676459B-D7F5-477B-B28B-36583413D607>.<332> now using Connection 26
default	10:26:46.385849-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [anon<RedLemon>(501):6145] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-6145-2127 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:46.386060-0500	runningboardd	Assertion 173-6145-2127 (target:[anon<RedLemon>(501):6145]) will be created as active as no start-time-defining assertions exist
default	10:26:46.387620-0500	RedLemon	0x7fbaf9dbfe18 ID=8 Task <A676459B-D7F5-477B-B28B-36583413D607>.<332> sent request, body N 0
default	10:26:46.389365-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:46.389486-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:46.389539-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:46.390230-0500	runningboardd	Attempting to rename power assertion 33969 for target anon<RedLemon>(501) to anon<RedLemon>(501);173-6145-2125:com.apple.CFNetwork.StorageDB;173-6145-2127:com.apple.CFNetwork.StorageDB
default	10:26:46.529491-0500	RedLemon	Task <B336C855-DC3A-4A61-8D1D-325F2BCEB1BC>.<330> received response, status 200 content U
default	10:26:46.542392-0500	RedLemon	0x7fbaf9dbfe18 ID=8 Task <A676459B-D7F5-477B-B28B-36583413D607>.<332> received response, status 200 content K
default	10:26:46.543369-0500	RedLemon	Task <A676459B-D7F5-477B-B28B-36583413D607>.<332> response ended
default	10:26:46.544161-0500	RedLemon	Task <A676459B-D7F5-477B-B28B-36583413D607>.<332> done using Connection 26
default	10:26:46.544590-0500	RedLemon	Task <A676459B-D7F5-477B-B28B-36583413D607>.<332> summary for task success {transaction_duration_ms=159, response_status=200, connection=26, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=156, response_duration_ms=2, request_bytes=166, response_bytes=1386, cache_hit=true}
default	10:26:46.545013-0500	RedLemon	Task <A676459B-D7F5-477B-B28B-36583413D607>.<332> finished successfully
default	10:26:46.547570-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	10:26:46.547749-0500	RedLemon	✅ Filtered to 4 English subtitles
default	10:26:46.548531-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	10:26:46.548708-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	10:26:46.549314-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.549516-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.549695-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.550142-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.550342-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.550533-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.550973-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.551168-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.551548-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.551753-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.552130-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.552313-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.552479-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.552894-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.553950-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.554529-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.554698-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.554991-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.555124-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.555542-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.555895-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.556097-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.557209-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.558242-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.558417-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.558934-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.559624-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.561547-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.561917-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.562603-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.563227-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.564105-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.564497-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.565021-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.565181-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.565419-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.565790-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.565973-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.566314-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.566488-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.566973-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.567235-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.567348-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.567656-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.567800-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.568203-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.569652-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.570586-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.570745-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.574027-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.574875-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.575670-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.576114-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.576860-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.577172-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.577944-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.578265-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.578567-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.579121-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.579304-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.579701-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.579879-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.580916-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.581085-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.581216-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.581533-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.581973-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.582364-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.583079-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.583642-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.584054-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.584243-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.584685-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.585165-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.585321-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.585856-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.587172-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.590126-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.590317-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.590629-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.590769-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.590893-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.591892-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.592097-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.592737-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.592890-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.593458-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.593730-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.594368-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.594604-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.595494-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.595707-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.605876-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.606415-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.607059-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.607372-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.608191-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.608675-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:46.608781-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.609306-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.609286-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:46.609342-0500	runningboardd	Attempting to rename power assertion 33969 for target anon<RedLemon>(501) to anon<RedLemon>(501)173-6145-2127:com.apple.CFNetwork.StorageDB
default	10:26:46.609368-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:46.610066-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.610863-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.612399-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.612765-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.613765-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.615309-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.616089-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.616544-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.617412-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.624064-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.626377-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.626660-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.627516-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.627748-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.628246-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.628573-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.629024-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.630737-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.631488-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.631664-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.632919-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.634129-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.634860-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.637015-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.637629-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.639197-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.642008-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.644257-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.645198-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.645870-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.646617-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.647516-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.648057-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.648916-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.649457-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.653378-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.653558-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.654664-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.655479-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.656131-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.656521-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.657059-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.657272-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.657814-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.658015-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.658381-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.660681-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.661539-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.662271-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.662775-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.663480-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.664192-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.664763-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.665513-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.670973-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.671657-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.672255-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.672405-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.673124-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.673511-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.674132-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.674623-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.674981-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.675543-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.677515-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.678392-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.679047-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.679563-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.680277-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.680435-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.680764-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.681720-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.682379-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.683689-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.688265-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.689683-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.690145-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.690340-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.691004-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.691277-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.692039-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.693957-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.694145-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.695457-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.695962-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.696717-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.697580-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.698105-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.698882-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.704204-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.704781-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.705374-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.705554-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.706140-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.706549-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.707053-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.707241-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.707967-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.708204-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.708822-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.709650-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.711378-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.712191-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.712564-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.713267-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.714389-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.715534-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.716382-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.716968-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.719878-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.721282-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.724170-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.724628-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.725250-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.725622-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.726845-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.727035-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.727936-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.728395-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.728588-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.729106-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.729523-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.729676-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.730482-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.730621-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.731187-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.731360-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.731740-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.731853-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.732182-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.732353-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.732705-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.732891-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.733259-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.733402-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.733735-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.733959-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.734637-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.734904-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.735414-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.735568-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.735690-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.736279-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.736443-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.736671-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.737037-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.737222-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.737673-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.737844-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.737974-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.738399-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.738831-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.739068-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.739600-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.739845-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.741219-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.741342-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.741672-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.741822-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.742145-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.742325-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.742650-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.742813-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.742940-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.743252-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.743402-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.743539-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.743832-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.743978-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.744335-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.744477-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.744826-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.745352-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.746082-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.746292-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.746669-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.746818-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.747510-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.747652-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.748090-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.748334-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.748841-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.749042-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.749161-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.749667-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.749842-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.749989-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.750773-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.750933-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.751256-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.751421-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.751544-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.751856-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.752008-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.752177-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.752520-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.752717-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.753232-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.753499-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.753768-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.754492-0500	RedLemon	Task <B336C855-DC3A-4A61-8D1D-325F2BCEB1BC>.<330> done using Connection 23
default	10:26:46.754530-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.754687-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.754731-0500	RedLemon	Task <B336C855-DC3A-4A61-8D1D-325F2BCEB1BC>.<330> response ended
default	10:26:46.755047-0500	RedLemon	Task <B336C855-DC3A-4A61-8D1D-325F2BCEB1BC>.<330> summary for task success {transaction_duration_ms=399, response_status=200, connection=23, reused=1, request_start_ms=2, request_duration_ms=0, response_start_ms=173, response_duration_ms=225, request_bytes=483, response_bytes=6849, cache_hit=true}
default	10:26:46.755532-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.755594-0500	RedLemon	Task <B336C855-DC3A-4A61-8D1D-325F2BCEB1BC>.<330> finished successfully
default	10:26:46.756010-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.756179-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.756515-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.756649-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.756966-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.757107-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.757457-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.757632-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.758383-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.758549-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.758817-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.759268-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.759648-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.760234-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.760467-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.761142-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.761470-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.761718-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.762274-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.762516-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.762718-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.763196-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.763658-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.764162-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.764368-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.764645-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.764949-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.765094-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.765321-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.766041-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.766388-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.767026-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.767216-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.767344-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.767631-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.767781-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.767906-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.768214-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.768385-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.768731-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.768872-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.769181-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.769335-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.769646-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.769824-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.770134-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.770291-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.770407-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.770700-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.770859-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.771142-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.771455-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.771891-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.772104-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.772497-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.773166-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.773349-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.773478-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.773994-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.774357-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.774688-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.774838-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.775103-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.775525-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.775892-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.776114-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.777048-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.777297-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.777909-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.778090-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.778366-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.778920-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.778978-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 207
default	10:26:46.779100-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.779179-0500	RedLemon	   INPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	10:26:46.779344-0500	RedLemon	   INPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean
default	10:26:46.779375-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.779506-0500	RedLemon	   INPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean
default	10:26:46.779963-0500	RedLemon	   INPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	10:26:46.779969-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.780184-0500	RedLemon	   INPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	10:26:46.780293-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.780339-0500	RedLemon	   INPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	10:26:46.780478-0500	RedLemon	   INPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	10:26:46.780641-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.780623-0500	RedLemon	   INPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	10:26:46.780911-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.781054-0500	RedLemon	   INPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	10:26:46.781404-0500	RedLemon	   INPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean
default	10:26:46.781560-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.781703-0500	RedLemon	   INPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	10:26:46.781732-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.781877-0500	RedLemon	   INPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	10:26:46.782037-0500	RedLemon	   INPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean
default	10:26:46.782071-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.782234-0500	RedLemon	   INPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	10:26:46.782306-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.782804-0500	RedLemon	   INPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	10:26:46.782824-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.783056-0500	RedLemon	   INPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean
default	10:26:46.783114-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.783240-0500	RedLemon	   INPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	10:26:46.783405-0500	RedLemon	   INPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	10:26:46.783607-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.783701-0500	RedLemon	   INPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	10:26:46.784430-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.784944-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.785130-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.784738-0500	RedLemon	   INPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	10:26:46.785499-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.785618-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.785995-0500	RedLemon	   INPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	10:26:46.786114-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.786241-0500	RedLemon	   INPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	10:26:46.786283-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.786427-0500	RedLemon	   INPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	10:26:46.786592-0500	RedLemon	   INPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	10:26:46.786613-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.786778-0500	RedLemon	   INPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	10:26:46.786777-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.786945-0500	RedLemon	   INPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean
default	10:26:46.787350-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.787641-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.787693-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	10:26:46.787837-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.788080-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	10:26:46.788193-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.788264-0500	RedLemon	   INPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	10:26:46.788434-0500	RedLemon	   INPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	10:26:46.788455-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.788683-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.788695-0500	RedLemon	   INPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	10:26:46.789074-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.789371-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.789824-0500	RedLemon	   INPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	10:26:46.789927-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.790126-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.790221-0500	RedLemon	   INPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	10:26:46.790397-0500	RedLemon	   INPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	10:26:46.790429-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.790549-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.790565-0500	RedLemon	   INPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	10:26:46.790710-0500	RedLemon	   INPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	10:26:46.790817-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.790863-0500	RedLemon	   INPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	10:26:46.790961-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.791011-0500	RedLemon	   INPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	10:26:46.791157-0500	RedLemon	   INPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	10:26:46.791383-0500	RedLemon	   INPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	10:26:46.791445-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.791666-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.791671-0500	RedLemon	   INPUT[40]: FRANKENSTEIN mkv | Unknown | zilean
default	10:26:46.791852-0500	RedLemon	   INPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	10:26:46.792011-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.792016-0500	RedLemon	   INPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	10:26:46.792273-0500	RedLemon	   INPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	10:26:46.792469-0500	RedLemon	   INPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	10:26:46.792633-0500	RedLemon	   INPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	10:26:46.792782-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.792799-0500	RedLemon	   INPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	10:26:46.792965-0500	RedLemon	   INPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	10:26:46.793009-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.793124-0500	RedLemon	   INPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	10:26:46.793283-0500	RedLemon	   INPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	10:26:46.793445-0500	RedLemon	   INPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	10:26:46.793601-0500	RedLemon	   INPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	10:26:46.793653-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.793761-0500	RedLemon	   INPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	10:26:46.793930-0500	RedLemon	   INPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	10:26:46.794498-0500	RedLemon	   INPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	10:26:46.794504-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.794708-0500	RedLemon	   INPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	10:26:46.795130-0500	RedLemon	   INPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	10:26:46.795336-0500	RedLemon	   INPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	10:26:46.795727-0500	RedLemon	   INPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	10:26:46.795811-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.796005-0500	RedLemon	   INPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	10:26:46.796049-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.796188-0500	RedLemon	   INPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	10:26:46.796457-0500	RedLemon	   INPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	10:26:46.796550-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.796659-0500	RedLemon	   INPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	10:26:46.796725-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.797163-0500	RedLemon	   INPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	10:26:46.797369-0500	RedLemon	   INPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	10:26:46.797437-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.797559-0500	RedLemon	   INPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	10:26:46.797661-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.797718-0500	RedLemon	   INPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	10:26:46.797777-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.797879-0500	RedLemon	   INPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	10:26:46.798031-0500	RedLemon	   INPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	10:26:46.798085-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.798183-0500	RedLemon	   INPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	10:26:46.798207-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.798500-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.798638-0500	RedLemon	   INPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	10:26:46.798830-0500	RedLemon	   INPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	10:26:46.798974-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.799168-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.799205-0500	RedLemon	   INPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	10:26:46.799470-0500	RedLemon	   INPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
default	10:26:46.799524-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.799664-0500	RedLemon	   INPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	10:26:46.799673-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.799788-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.799825-0500	RedLemon	   INPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	10:26:46.799979-0500	RedLemon	   INPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	10:26:46.800079-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.800128-0500	RedLemon	   INPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	10:26:46.800213-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.800276-0500	RedLemon	   INPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	10:26:46.800338-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.800421-0500	RedLemon	   INPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	10:26:46.800580-0500	RedLemon	   INPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	10:26:46.800646-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.800812-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.800880-0500	RedLemon	   INPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	10:26:46.801027-0500	RedLemon	   INPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	10:26:46.801543-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.801321-0500	RedLemon	   INPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	10:26:46.801804-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.802129-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.802315-0500	RedLemon	   INPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
default	10:26:46.802372-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.802582-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.802660-0500	RedLemon	   INPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	10:26:46.802802-0500	RedLemon	   INPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	10:26:46.802994-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.803152-0500	RedLemon	   INPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	10:26:46.803350-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.803477-0500	RedLemon	   INPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	10:26:46.803672-0500	RedLemon	   INPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	10:26:46.803695-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.803803-0500	RedLemon	   INPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	10:26:46.803826-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.803921-0500	RedLemon	   INPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.803925-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.804050-0500	RedLemon	   INPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	10:26:46.804203-0500	RedLemon	   INPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.804341-0500	RedLemon	   INPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	10:26:46.804562-0500	RedLemon	   INPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	10:26:46.804655-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.804708-0500	RedLemon	   INPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.804795-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.804840-0500	RedLemon	   INPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.804927-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.804954-0500	RedLemon	   INPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.805079-0500	RedLemon	   INPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	10:26:46.805203-0500	RedLemon	   INPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	10:26:46.805511-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.805854-0500	RedLemon	   INPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	10:26:46.805943-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.805984-0500	RedLemon	   INPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.806092-0500	RedLemon	   INPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	10:26:46.806205-0500	RedLemon	   INPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.806272-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.806325-0500	RedLemon	   INPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.806731-0500	RedLemon	   INPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.806749-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.806869-0500	RedLemon	   INPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	10:26:46.806879-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.807008-0500	RedLemon	   INPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	10:26:46.807245-0500	RedLemon	   INPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	10:26:46.807408-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.807457-0500	RedLemon	   INPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	10:26:46.807590-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.807693-0500	RedLemon	   INPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.807714-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.807832-0500	RedLemon	   INPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	10:26:46.807960-0500	RedLemon	   INPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.808044-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.808074-0500	RedLemon	   INPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	10:26:46.808202-0500	RedLemon	   INPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	10:26:46.808202-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.808469-0500	RedLemon	   INPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	10:26:46.808501-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.808643-0500	RedLemon	   INPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	10:26:46.808780-0500	RedLemon	   INPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	10:26:46.808921-0500	RedLemon	   INPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.809525-0500	RedLemon	   INPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	10:26:46.809596-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.809756-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.809823-0500	RedLemon	   INPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.809967-0500	RedLemon	   INPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.810096-0500	RedLemon	   INPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.810209-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.810225-0500	RedLemon	   INPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	10:26:46.810355-0500	RedLemon	   INPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	10:26:46.810379-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.810477-0500	RedLemon	   INPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.810606-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.810610-0500	RedLemon	   INPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	10:26:46.810770-0500	RedLemon	   INPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	10:26:46.810911-0500	RedLemon	   INPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	10:26:46.811117-0500	RedLemon	   INPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	10:26:46.811242-0500	RedLemon	   INPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	10:26:46.811383-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.811394-0500	RedLemon	   INPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	10:26:46.811569-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.811543-0500	RedLemon	   INPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	10:26:46.811777-0500	RedLemon	   INPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	10:26:46.811902-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.811945-0500	RedLemon	   INPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	10:26:46.812048-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.812165-0500	RedLemon	   INPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	10:26:46.812165-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.812328-0500	RedLemon	   INPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	10:26:46.812453-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.812622-0500	RedLemon	   INPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	10:26:46.812648-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.812753-0500	RedLemon	   INPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	10:26:46.812829-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.812869-0500	RedLemon	   INPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	10:26:46.812985-0500	RedLemon	   INPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	10:26:46.813189-0500	RedLemon	   INPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	10:26:46.813229-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.813391-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.813465-0500	RedLemon	   INPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	10:26:46.813649-0500	RedLemon	   INPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	10:26:46.813700-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.814217-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.814698-0500	RedLemon	   INPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	10:26:46.814852-0500	RedLemon	   INPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	10:26:46.814975-0500	RedLemon	   INPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	10:26:46.815222-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.815319-0500	RedLemon	   INPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	10:26:46.815594-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.815732-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.815740-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.815937-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.815965-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.816061-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.816085-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.816160-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.816256-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.816356-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.816395-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.816457-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.816539-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.816555-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.816644-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.816744-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.816852-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.816953-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.817054-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.817157-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.817157-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.817260-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.817303-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.817362-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.817418-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.817461-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.817560-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.817662-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.817694-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.817763-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.817821-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.817862-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.817941-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.817962-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.818063-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.818201-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.818382-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.818569-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	10:26:46.818681-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.818737-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.818882-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.819036-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.819161-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.819191-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.819304-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.819343-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.819580-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.820207-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.820601-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.820660-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.820817-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.820970-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.821435-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.821645-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.821768-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.821805-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.822063-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.822362-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.822629-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.822752-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.822758-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.822861-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.822910-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.822967-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.823024-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.823070-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.823173-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.823277-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.823381-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.823421-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.823482-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.823549-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.823585-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.823671-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.823857-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	10:26:46.823964-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 720p | 720p | comet
default	10:26:46.824116-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 720p | 720p | comet
default	10:26:46.824266-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	10:26:46.824307-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.824415-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 480p | 480p | comet
default	10:26:46.824456-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.824568-0500	RedLemon	   INPUT[201]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.824769-0500	RedLemon	   INPUT[202]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.824879-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.824979-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.824980-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.825086-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.825294-0500	RedLemon	   INPUT[206]: [RD⚡] Comet unknown | unknown | comet
default	10:26:46.825411-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.825548-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	10:26:46.825572-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.825824-0500	RedLemon	Task <130EEF83-30DD-4FC5-8DFB-12846A07B183>.<333> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	10:26:46.826411-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [487B61A6-62D4-4078-90F4-52F33B1B5313] (reporting strategy default)> on Task <130EEF83-30DD-4FC5-8DFB-12846A07B183>.<333> was not selected for reporting
default	10:26:46.826520-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.826688-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.826972-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.828157-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.828300-0500	RedLemon	Task <130EEF83-30DD-4FC5-8DFB-12846A07B183>.<333> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:46.828738-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.828901-0500	RedLemon	Task <130EEF83-30DD-4FC5-8DFB-12846A07B183>.<333> now using Connection 26
default	10:26:46.829675-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.830765-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.831552-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.832063-0500	RedLemon	0x7fbaf88b5968 ID=12 Task <130EEF83-30DD-4FC5-8DFB-12846A07B183>.<333> sent request, body N 0
default	10:26:46.832186-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.832545-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.832721-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.833376-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.833578-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.834013-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.834192-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.834321-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.834691-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.834877-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.835196-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.836150-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.836355-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.836827-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.836963-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.837140-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.838061-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.838229-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.838375-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.838857-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.839111-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.839762-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.840019-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.840245-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.840820-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.841154-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.841383-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.842061-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.843612-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.844611-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.845025-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.845232-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.845813-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.846014-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.846318-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.846838-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.847207-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.847848-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.848016-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.850059-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.851063-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.851825-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.856738-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.857796-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.858603-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.859194-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.859924-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.861437-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.862582-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.863387-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.867172-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.869893-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.870093-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.872220-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.877222-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.877568-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.878453-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.878992-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.879929-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.880742-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.881695-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.881980-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.882894-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.883332-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.883825-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.884141-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.885795-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.886070-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.886771-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.886924-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.888144-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.888341-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.889720-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.889987-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.890619-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.891343-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.891880-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.892601-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.893608-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.893843-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.894524-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.895265-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.895637-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.896171-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.896481-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.896801-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.897615-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.897871-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.898839-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.899065-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.900026-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.900429-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.900872-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.901324-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.901580-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.901997-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.902574-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.902837-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.903295-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.903676-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.904088-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.904598-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.907206-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.908157-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.908907-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.911602-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.912616-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.913372-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.913574-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.914283-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.914891-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.915326-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.916035-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.916676-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.916874-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.917051-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.918030-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.918354-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.918957-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.919167-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.919893-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.920123-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.920315-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.920810-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.921000-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.921539-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.922137-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.922422-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.923126-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.924443-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.925090-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.926398-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.927145-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.927476-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.928385-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.928658-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.929505-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.929788-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.930793-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.931410-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.931655-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.932216-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.932486-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.933187-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.933418-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.933551-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.934396-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.934868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.935064-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.935700-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.936008-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.936202-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.937078-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.937335-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.937685-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.938309-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.938519-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.939100-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.939542-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.939773-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.941086-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.941900-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.942650-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.942900-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.943099-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.943824-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.944283-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.944612-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.945159-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.945430-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.945718-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.946211-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.946398-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.946868-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.947741-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.948410-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.948770-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.948982-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.949589-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.949760-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.949937-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.950691-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.950897-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.951425-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.951673-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.951997-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.952573-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.954068-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.955538-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.956099-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.956963-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.957485-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.957684-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.958198-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.958585-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.959252-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.961711-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.962332-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.962734-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.962872-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.964011-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.964479-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.964889-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.965560-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.966003-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.966864-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.967093-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.967803-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.968003-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.968353-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.969026-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.969242-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.969810-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.970226-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.970650-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.972208-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.974298-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.974591-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.975101-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.975313-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.975795-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.976017-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.976151-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.976816-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.977586-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.978782-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.979053-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.980042-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.980293-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.983220-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.983436-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.983583-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.984919-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.985105-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.985213-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.985443-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.985544-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.985614-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.985788-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.986723-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.986870-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.986881-0500	RedLemon	0x7fbaf88b5968 ID=12 Task <130EEF83-30DD-4FC5-8DFB-12846A07B183>.<333> received response, status 200 content K
default	10:26:46.987535-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.987556-0500	RedLemon	Task <130EEF83-30DD-4FC5-8DFB-12846A07B183>.<333> response ended
default	10:26:46.987710-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.987981-0500	RedLemon	Task <130EEF83-30DD-4FC5-8DFB-12846A07B183>.<333> done using Connection 26
default	10:26:46.988363-0500	RedLemon	Task <130EEF83-30DD-4FC5-8DFB-12846A07B183>.<333> summary for task success {transaction_duration_ms=161, response_status=200, connection=26, reused=1, request_start_ms=1, request_duration_ms=3, response_start_ms=159, response_duration_ms=1, request_bytes=166, response_bytes=1383, cache_hit=true}
default	10:26:46.988785-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.989361-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.990711-0500	RedLemon	Task <130EEF83-30DD-4FC5-8DFB-12846A07B183>.<333> finished successfully
default	10:26:46.991852-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.993026-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	10:26:46.993211-0500	RedLemon	✅ Filtered to 4 English subtitles
default	10:26:46.993268-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.993566-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	10:26:46.993887-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	10:26:46.993427-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.994321-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.994472-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.994476-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.994710-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.995023-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.995172-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.995239-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:46.995294-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.995433-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:46.995575-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.995573-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.995984-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.996382-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.996416-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.996542-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.996581-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:46.996680-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.996818-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.997234-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.997426-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.998006-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:46.998147-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:46.998213-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.998337-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.998409-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.998426-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:46.998589-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:46.998995-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:46.999147-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:46.999311-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.999594-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.999691-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.999763-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.999845-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.000103-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.000329-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.000415-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.000560-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.000900-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.001074-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.001442-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.001482-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.001594-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.001867-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.001867-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.002094-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.002373-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.002453-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.002537-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.002624-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.002959-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.003103-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.003417-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.003607-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.003935-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.004081-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.004370-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.004403-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.004554-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.004556-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.004856-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.005055-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.005357-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.005633-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.005672-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.005808-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.005811-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.006297-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.006352-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.006479-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.006829-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.006818-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.006974-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.007795-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.008332-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.008769-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.008774-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.008943-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.008949-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.009241-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.009396-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.009699-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.009813-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.009840-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.009970-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.010421-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.010438-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.010616-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.010639-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.010941-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.010941-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.011107-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.011420-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.011559-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.011584-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.011682-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.011717-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.011991-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.012033-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.012171-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.012540-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.012614-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.012754-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.012839-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.013019-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.013175-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.014090-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.012980-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.014470-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.014600-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.014624-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.014919-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.014946-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.015100-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.015033-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.015674-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.015805-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.015830-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.015974-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.016113-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.016118-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.016254-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.016383-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.016719-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.016881-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.017221-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.017292-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.017363-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.017438-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.017539-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.017673-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.017807-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.017822-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.018357-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.018539-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.018558-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.018882-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.018995-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.019006-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.019329-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.019821-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.020209-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.020294-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.020390-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.020440-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.020718-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.020780-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.021002-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.021008-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.021241-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.021589-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.021614-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.021755-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.022262-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.022349-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.022368-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.022531-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.022631-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.022650-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.022849-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.022955-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.023022-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.023467-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.023789-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.023837-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.023952-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.023952-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.024317-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.024461-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.024456-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.024619-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.024770-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.024939-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.025537-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.025710-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.025839-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.026182-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.026303-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.026331-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.026442-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.026467-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.026566-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.026741-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.026839-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.026891-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.026978-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.027107-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.027163-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.027331-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.027451-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.027715-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.027775-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.027843-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.027920-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.027955-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.028239-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.028333-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.028388-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.028502-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.028611-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.028707-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.028973-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.028973-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.029123-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.029413-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.029474-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.029568-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.029618-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.029885-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.029952-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.030013-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.030144-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.030956-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.031116-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.031451-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.031610-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.031615-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.031958-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.032114-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.032402-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.032557-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.032691-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.033021-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.033133-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.033195-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.033243-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.033315-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.033504-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.033560-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.033651-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.034115-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.034192-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.034249-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.034368-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.034665-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.034748-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.034830-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.034933-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.035074-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.035155-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.035453-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.035511-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.035594-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.035662-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.035763-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.035880-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.036030-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.036036-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.036189-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.036704-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.037064-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.037219-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.037312-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.037466-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.037539-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.037678-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.037924-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.037933-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.038073-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.038156-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.038181-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.038260-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.038448-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.038577-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.038628-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.038696-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.039228-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.039412-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.039751-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.039947-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.040477-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.040472-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.040709-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.041027-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.041520-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.041613-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.041697-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.041882-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.042007-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.042030-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.042098-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.042339-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.043718-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.043981-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.044147-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.044145-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.044487-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.044897-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.045000-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.045110-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.045152-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.045196-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.045289-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.045368-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.045542-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.045625-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.046160-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.046278-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.046494-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.046628-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.046642-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.046814-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.046947-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.047405-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.047763-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.047763-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.047951-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.047949-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.048090-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.048299-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.048471-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.048799-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.049069-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.048799-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.049856-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.050035-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.050148-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.050503-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.050503-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.050664-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.050786-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.051065-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.051090-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.051222-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.051254-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.051354-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.051549-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.051682-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.051979-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.052115-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.052455-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.052591-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.052869-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.052951-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.053189-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.053437-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.053544-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.053875-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.054083-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.054255-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.054666-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.054831-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.054924-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.055074-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.055212-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.055378-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.056162-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.056529-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.056633-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.056930-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.056930-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.057136-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.057312-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.057475-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.057478-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.057729-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.057957-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.058037-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.058073-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.058208-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.058238-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.058301-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.058588-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.058610-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.058701-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.058872-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.058880-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.058964-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.058974-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.059027-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.059506-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.059590-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.059652-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.060031-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.060194-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.062709-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.063066-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.063421-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.063839-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.064404-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.064549-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.064763-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.065155-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.065201-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.065382-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.065566-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.065965-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.065982-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.066162-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.066270-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.066302-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.066586-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.066654-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.066706-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.066855-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.066973-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.066998-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.067099-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.067363-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.067524-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.067823-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.067981-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.067717-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.068532-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.068532-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.068892-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.069051-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.069184-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.069480-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.069561-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.069645-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.069696-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.069957-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.070071-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.070086-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.070362-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.070513-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.070519-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.070883-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.071049-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.071067-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.071389-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.071530-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.071868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.072016-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.072429-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.072685-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.073157-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.073340-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.073468-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.075123-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.075347-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.075491-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.075984-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.076270-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.076999-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.077142-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.077224-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.077579-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.077754-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.077956-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.078371-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.078528-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.078545-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.078701-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.079140-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.079360-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.079478-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.079529-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.079747-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.079751-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.079899-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.080125-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.080878-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.081356-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.081837-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.081974-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.081974-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.082357-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.082509-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.082509-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.082638-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.082839-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.083013-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.083550-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.083610-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.083714-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.083725-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.083839-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.083950-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.084062-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.084239-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.084525-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.084527-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.084924-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.084969-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.085057-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.085119-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.085530-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.085577-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.085681-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.085793-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.085907-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.086062-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.086159-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.086376-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.086736-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.087203-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.087384-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.087712-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.087836-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.087867-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.087969-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.087977-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.088269-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.088406-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.088443-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.088823-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.089365-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.089418-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.089524-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.089591-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.089721-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.089849-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.090085-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.090209-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.090656-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.090679-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.090825-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.090953-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.091134-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.091248-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.091280-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.091401-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.092314-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.092483-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.093211-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.093250-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.093395-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.093441-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.093601-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.093712-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.093863-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.094146-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.094360-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.094481-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.094799-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.094854-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.094954-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.095223-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.095290-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.095457-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.095494-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.095760-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.095809-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.095899-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.095951-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.096002-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.096259-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.096318-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.096388-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.096427-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.096493-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.096754-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.096754-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.097438-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.100203-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.100397-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.100524-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.111823-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.111999-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.112134-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.112473-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.112643-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.115108-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.115303-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.115430-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.115758-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.115905-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.116036-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.117139-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.117698-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.118148-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.118293-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.118630-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.118787-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.125130-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.126617-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.130558-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.130763-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.131611-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.131788-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.132138-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.132327-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.136682-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.136866-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.137227-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.137367-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.144727-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.146992-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.150540-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.150713-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.151423-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.151797-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.151943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.152081-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.152431-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.153182-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.153567-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.153716-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.154021-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.154548-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.154922-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.161335-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.161727-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.161859-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.162170-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.162772-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.162965-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.163461-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.166697-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.168095-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.168276-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.168751-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.168940-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.170603-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.170792-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.171530-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.177699-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.179133-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.179337-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.179721-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.179894-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.097714-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.181550-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.182281-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.182315-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.183690-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.184175-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.184288-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.184315-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.184855-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.184945-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.185002-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.185632-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.185822-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.186161-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.186320-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.186613-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.186755-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.185466-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.187089-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.187632-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.187916-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.187963-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.188389-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.188668-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.188752-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.188838-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.188858-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.190391-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.190391-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.191471-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.191600-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.192679-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.193428-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.193692-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.193979-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.194004-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.194098-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.194166-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.194330-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.194350-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.194936-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.194963-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.195071-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.195384-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.195549-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.196500-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.196685-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.196806-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.197500-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.197500-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.197669-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.197805-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.198394-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.198592-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.198941-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.199253-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.199398-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.199795-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.199965-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.200100-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.200448-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.200620-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.201157-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.201606-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.201744-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.201859-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.202008-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.202049-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.202184-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.202316-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.202380-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.202630-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.202953-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.203035-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.203111-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.203365-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.203514-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.203507-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.203635-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.203722-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.203856-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.204051-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.204160-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.204323-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.204458-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.204613-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.204932-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.204963-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.205106-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.205615-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.205637-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.205815-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.205841-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.205925-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.206525-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.206731-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.206876-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.208085-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.208291-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.208420-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.208758-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.208911-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.209053-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.209492-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.209532-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.209665-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.209665-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.210244-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.210511-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.210643-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.210563-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.211231-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.211424-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.211474-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.211714-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.211797-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.212523-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.212749-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.212806-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.213083-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.213371-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.213494-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.213500-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.214049-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.214334-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.214644-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.214943-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.215059-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.215348-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.215547-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.215723-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.216258-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.216437-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.216559-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.218885-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.219825-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.220021-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.220422-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.219136-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.221184-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.221378-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.221786-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.222054-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.222301-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.222608-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.222722-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.222862-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.222990-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.223453-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.223624-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.223716-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.223884-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.224042-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.224303-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.226080-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.226413-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.227683-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.228471-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.228609-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.229705-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.230094-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.230859-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.232897-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.233418-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.233581-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.233993-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.234206-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.234530-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.235187-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.235918-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.236114-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.236566-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.237144-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.237339-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.237900-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.238054-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.238703-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.238730-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.238873-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.238904-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.240601-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.240906-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.241656-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.242239-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.242397-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.242860-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.242901-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.243141-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.243370-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.243501-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.243597-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.243748-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.243900-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.244064-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.244182-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.244055-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.244606-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.244745-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.244772-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.244920-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.245033-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.245044-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.245193-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.245870-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.245870-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.246036-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.246793-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.246900-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.247023-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.247508-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.247975-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.248167-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.248495-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.248645-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.248758-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.249237-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.249221-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.249412-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.249422-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.250073-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.250494-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.250677-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.253005-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.253916-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.253917-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.254319-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.254451-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.254600-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.254875-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.255028-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.255079-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.255527-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.256110-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.256124-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.256273-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.256597-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.256956-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.257617-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.258336-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.258930-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.259073-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.259109-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.259609-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.259838-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.260287-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.260607-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.261240-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.261570-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.261750-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.261926-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.262025-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.262125-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.262547-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.262643-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.262826-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.263147-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.264081-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.264281-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.264640-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.264770-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.265527-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.265687-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.266124-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.266307-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.266663-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.266798-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.267297-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.267474-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.267924-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.268620-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.269180-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.269351-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.269835-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.270008-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.270354-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.270544-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.271188-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.271364-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.271738-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.271909-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.272408-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.272552-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.272777-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.272856-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.273029-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.273109-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.275077-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.275229-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.275733-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.275907-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.276289-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.276453-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.276848-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.277045-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.277630-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.277789-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.278230-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.278352-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.278378-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.278526-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.279052-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.279217-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.279289-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.279474-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.279856-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.280016-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.282769-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.282983-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.283396-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.283602-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.284332-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.284508-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.284888-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.285049-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.285707-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.285712-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.285963-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.286134-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.286381-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.286799-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.286945-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.287334-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.287488-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.287750-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.287902-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.288268-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.289242-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.289308-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.289469-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.289736-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.289813-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.289901-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.289940-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.290591-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.290755-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.291487-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.291609-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.291677-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.291727-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.292195-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.292452-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.293595-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.293837-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.293873-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.294146-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.295291-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.295495-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.296464-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.297977-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.298088-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.298209-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.298635-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.298789-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.299303-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.299573-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.299619-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.299721-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.299933-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.300065-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.300086-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.300254-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.300393-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.301228-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.301263-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.301585-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.301660-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.301731-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.302140-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.302247-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.302409-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.302860-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.302860-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.303284-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.303632-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.304035-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.304209-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.304574-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.304757-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.305140-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.305509-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.305629-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.305988-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.306142-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.306454-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.306452-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.306632-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.306972-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.308259-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.306972-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.308662-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.308820-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.308986-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.309545-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.309743-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.310128-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.310273-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.310659-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.310817-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.310895-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.311124-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.311141-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.311300-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.311569-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.312032-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.312194-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.312223-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.312340-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.312505-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.312632-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.312767-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.312906-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.313749-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.314497-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.314845-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.314841-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.316375-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.317086-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.317320-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.317775-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.317780-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.317933-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.318762-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.319626-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.319626-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.320239-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.320683-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.320919-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.321058-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.321356-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.321624-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.321688-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.321791-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.322216-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.322535-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.322702-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.322773-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.322948-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.323005-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.323151-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.323252-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.323262-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.323962-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.324125-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.324266-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.324657-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.324866-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.325231-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.325414-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.325544-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.326596-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.326598-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.326769-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.327277-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.327414-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.327567-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.327598-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.328238-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.328250-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.328464-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.328799-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.329041-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.329200-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.329200-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.329488-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.329523-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.329674-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.329982-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.330132-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.331057-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.331125-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.331593-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.331748-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.331840-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.331906-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.332256-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.332345-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.332438-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.332499-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.332555-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.332617-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.332855-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.333096-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.333245-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.333251-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.333383-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.333725-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.333937-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.334104-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.334254-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.334254-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.334501-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.334763-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.334758-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.335614-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.335613-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.335793-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.335958-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.336071-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.336533-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.336720-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.337044-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.337193-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.337307-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.337730-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.337786-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.337833-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.337912-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.337943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.338233-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.338247-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.338395-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.338897-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.338897-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.339291-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.339438-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.339694-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.339776-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.339924-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.340076-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.341423-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.341622-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.341703-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.342042-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.342137-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.342184-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.342274-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.342379-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.342479-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.342618-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.342631-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.342865-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.343031-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.343220-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.343538-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.343559-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.343705-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.343708-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.344007-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.344162-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.344286-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.344079-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.344695-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.344836-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.344882-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.345002-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.345123-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.345587-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.345797-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.346205-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.346642-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.346657-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.346828-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.347611-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.347793-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.347917-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.347914-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.349152-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.349323-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.349818-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.350011-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.350164-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.359020-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.359215-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.360009-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.360579-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.360780-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.360908-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.361644-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.361860-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.362293-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.362498-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.362668-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.363163-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.363305-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.364649-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.364854-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.365005-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.369122-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.369390-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.369564-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.369941-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.370619-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.370801-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.378160-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.379426-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.379416-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.379983-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.380157-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.380636-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.380743-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.380824-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.380882-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.381140-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.381141-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.381280-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.381726-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.381758-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.381849-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.382064-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.382107-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.382186-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.382237-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.382298-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.382354-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.382574-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.382646-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.383030-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.383200-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.383512-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.383512-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.383685-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.384469-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.384908-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.385062-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.385094-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.385194-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.385454-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.385778-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.386214-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.387550-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.388044-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.388257-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.389846-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.389931-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.390031-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.390094-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.390357-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.390383-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.390511-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.390511-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.391130-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.391277-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.391346-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.391387-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.391496-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.391604-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.391649-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.391769-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.391885-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.392174-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.392201-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.392515-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.392628-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.392734-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.392879-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.392915-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.393002-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.393038-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.393064-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.393892-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.394067-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.394119-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.394247-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.394361-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.394356-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.395272-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.395478-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.395576-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.395896-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.396462-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.396655-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.397494-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.397600-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.397696-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.397962-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.398021-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.398139-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.398315-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.398612-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.398930-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.398989-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.399111-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.399230-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.399338-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.399487-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.399512-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.400511-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.400794-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.400473-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.401068-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.401583-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.401777-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.401907-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.402230-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.402379-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.402513-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.403044-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.403101-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.403218-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.403271-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.403618-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.403778-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.404342-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.404453-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.404514-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.404622-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.404622-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.405663-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.405828-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.405957-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.407129-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	10:26:47.405600-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.408010-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.408067-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.408152-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.408224-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.408493-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.408523-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.408634-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.410101-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.410434-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.410747-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.411134-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.411482-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.411631-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.411648-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.411742-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.411815-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.412813-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.412906-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.412955-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.413070-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.413239-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.413152-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.413911-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.414005-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.414345-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.414400-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.414606-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.414686-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.414756-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.414834-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.414926-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.415302-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.415502-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.415537-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.415827-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.415970-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.416086-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.416568-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.416724-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.416857-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.415940-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.417315-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.417531-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.418379-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.418648-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.418842-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.419287-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.419543-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.419894-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.420058-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.420173-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.420422-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.420506-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.420581-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.420759-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.421010-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.421116-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.421688-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.421861-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.425633-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.425633-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.425821-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.426150-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.426299-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.426565-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.427037-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.427284-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.427455-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.427776-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.427895-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.428529-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.428544-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.428709-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.428889-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.429018-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.429449-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.429486-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.429580-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.430013-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.430197-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.430640-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.430790-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.431124-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.431617-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.431760-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.431880-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.431951-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.432010-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.432136-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.432185-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.432456-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.432833-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.433082-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.433249-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.433410-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.433680-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.433902-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.434294-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.434484-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.434607-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.435026-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.435094-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.435189-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.435250-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.435512-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.435817-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.436428-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.436428-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.437166-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.437227-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.437402-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.437829-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.437999-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.438155-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.438260-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.438421-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.438465-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.438564-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.438771-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.439425-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.439671-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.440259-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.441756-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.442002-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.442872-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.443538-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.443809-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.444456-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.444655-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.444812-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.444720-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.445594-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.445637-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.445868-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.446028-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.446098-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.446647-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.446854-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.446975-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.448426-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.448621-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.448777-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.449196-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.449377-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.449377-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.449836-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.450126-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.450318-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.452111-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.452745-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.452922-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.453293-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.453448-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.454118-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.454303-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.454771-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.454828-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.454929-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.455116-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.455167-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.455734-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.456005-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.456973-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.457112-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.457210-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.457202-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.457329-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.457405-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.457493-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.458441-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.458662-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.460613-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.460735-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.461112-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.461484-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.461606-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.461626-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.461750-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.461980-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.462018-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.462115-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.462429-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.462627-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.462774-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.462795-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.462888-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.463114-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.463231-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.463238-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.463972-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.463975-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.464436-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.464817-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.464948-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.465022-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.465102-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.465153-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.465207-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 207
default	10:26:47.465373-0500	RedLemon	   OUTPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.465480-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.466475-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.466525-0500	RedLemon	   OUTPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean | Subtitles: 3
default	10:26:47.466609-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.466960-0500	RedLemon	   OUTPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.467102-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.467169-0500	RedLemon	   OUTPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.467216-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.467330-0500	RedLemon	   OUTPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.467423-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.467484-0500	RedLemon	   OUTPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.467524-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.468357-0500	RedLemon	   OUTPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.468573-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.468641-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.468739-0500	RedLemon	   OUTPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.468811-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.468888-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.469275-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.469496-0500	RedLemon	   OUTPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.469849-0500	RedLemon	   OUTPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	10:26:47.469986-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.470052-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.470140-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.470202-0500	RedLemon	   OUTPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.470271-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.470345-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.470848-0500	RedLemon	   OUTPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	10:26:47.470880-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.471390-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.471399-0500	RedLemon	   OUTPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.471570-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.474603-0500	runningboardd	Invalidating assertion 173-6145-2127 (target:[anon<RedLemon>(501):6145]) from originator [anon<RedLemon>(501):6145]
default	10:26:47.472290-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.475168-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.476341-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.476531-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.477524-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.477967-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.478149-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.478545-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.482821-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.483197-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.483360-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.483499-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.484489-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.484715-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.486175-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.486330-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.486409-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.486675-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.486771-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.486850-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.487066-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.487329-0500	RedLemon	   OUTPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.487529-0500	RedLemon	   OUTPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.488365-0500	RedLemon	   OUTPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.494329-0500	RedLemon	   OUTPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.495145-0500	RedLemon	   OUTPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	10:26:47.495731-0500	RedLemon	   OUTPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.495944-0500	RedLemon	   OUTPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	10:26:47.496320-0500	RedLemon	   OUTPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.496788-0500	RedLemon	   OUTPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	10:26:47.497421-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.497637-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.497827-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.497987-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	10:26:47.498135-0500	RedLemon	   OUTPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	10:26:47.498281-0500	RedLemon	   OUTPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	10:26:47.498801-0500	RedLemon	   OUTPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.499078-0500	RedLemon	   OUTPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.500153-0500	RedLemon	   OUTPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	10:26:47.500377-0500	RedLemon	   OUTPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	10:26:47.500577-0500	RedLemon	   OUTPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.500775-0500	RedLemon	   OUTPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	10:26:47.500965-0500	RedLemon	   OUTPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.502681-0500	RedLemon	   OUTPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	10:26:47.502945-0500	RedLemon	   OUTPUT[40]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	10:26:47.503125-0500	RedLemon	   OUTPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.503562-0500	RedLemon	   OUTPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.503752-0500	RedLemon	   OUTPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	10:26:47.504292-0500	RedLemon	   OUTPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	10:26:47.504528-0500	RedLemon	   OUTPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.509860-0500	RedLemon	   OUTPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.510063-0500	RedLemon	   OUTPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.510250-0500	RedLemon	   OUTPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	10:26:47.510468-0500	RedLemon	   OUTPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.510727-0500	RedLemon	   OUTPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	10:26:47.512294-0500	RedLemon	   OUTPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.512514-0500	RedLemon	   OUTPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.512674-0500	RedLemon	   OUTPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.513598-0500	RedLemon	   OUTPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.514261-0500	RedLemon	   OUTPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	10:26:47.514427-0500	RedLemon	   OUTPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	10:26:47.514580-0500	RedLemon	   OUTPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	10:26:47.514730-0500	RedLemon	   OUTPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.514879-0500	RedLemon	   OUTPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.515036-0500	RedLemon	   OUTPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.515183-0500	RedLemon	   OUTPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	10:26:47.516514-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.516709-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.517227-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.518313-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.518968-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.519715-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.519926-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.526658-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.527092-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.527304-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.528026-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.528271-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.529000-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.529210-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.529361-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.530056-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.530839-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.530992-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.531322-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.531408-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.531649-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.531733-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.535908-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.536047-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.536370-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.536633-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.536725-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.536936-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.537060-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.539982-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.540637-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.541389-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.541934-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.542129-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.544645-0500	RedLemon	   OUTPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	10:26:47.544789-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.546277-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.546606-0500	RedLemon	   OUTPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.546713-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.546773-0500	RedLemon	   OUTPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	10:26:47.546912-0500	RedLemon	   OUTPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.549434-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.549806-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.550235-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.550630-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.550820-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.547065-0500	RedLemon	   OUTPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.551430-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.551687-0500	RedLemon	   OUTPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	10:26:47.551879-0500	RedLemon	   OUTPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.552088-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.553306-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.553842-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.554081-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.554272-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.554713-0500	RedLemon	   OUTPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.554918-0500	RedLemon	   OUTPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	10:26:47.555026-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.555073-0500	RedLemon	   OUTPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.555941-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.556122-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.556535-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.558470-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.558697-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.559973-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.560136-0500	RedLemon	   OUTPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.560379-0500	RedLemon	   OUTPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.560530-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.561048-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.561506-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.561696-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.562352-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.562520-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.565332-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.560549-0500	RedLemon	   OUTPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	10:26:47.566195-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.566384-0500	RedLemon	   OUTPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.566814-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.567413-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.567560-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.568041-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.568213-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.568629-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.568856-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.569024-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.569629-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.569797-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.570477-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.570944-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.571386-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.572153-0500	RedLemon	   OUTPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.572211-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.572379-0500	RedLemon	   OUTPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	10:26:47.573040-0500	RedLemon	   OUTPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	10:26:47.573029-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.573559-0500	RedLemon	   OUTPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	10:26:47.573621-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.573787-0500	RedLemon	   OUTPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.573931-0500	RedLemon	   OUTPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	10:26:47.574278-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.574714-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.574893-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.576716-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.574832-0500	RedLemon	   OUTPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	10:26:47.576966-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.577018-0500	RedLemon	   OUTPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	10:26:47.577083-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.577447-0500	RedLemon	   OUTPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	10:26:47.577689-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	10:26:47.577891-0500	RedLemon	   OUTPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	10:26:47.578068-0500	RedLemon	   OUTPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	10:26:47.578207-0500	RedLemon	   OUTPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	10:26:47.578346-0500	RedLemon	   OUTPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	10:26:47.578473-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	10:26:47.579144-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.579291-0500	RedLemon	   OUTPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	10:26:47.579346-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.579621-0500	RedLemon	   OUTPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.579922-0500	RedLemon	   OUTPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	10:26:47.580075-0500	RedLemon	   OUTPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	10:26:47.580215-0500	RedLemon	   OUTPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.580353-0500	RedLemon	   OUTPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.580480-0500	RedLemon	   OUTPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.579787-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.580607-0500	RedLemon	   OUTPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	10:26:47.581804-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.582251-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.582257-0500	RedLemon	   OUTPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	10:26:47.582509-0500	RedLemon	   OUTPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	10:26:47.582509-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.582639-0500	RedLemon	   OUTPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.582758-0500	RedLemon	   OUTPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	10:26:47.582885-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.583096-0500	RedLemon	   OUTPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.583240-0500	RedLemon	   OUTPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.583467-0500	RedLemon	   OUTPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.583621-0500	RedLemon	   OUTPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	10:26:47.583631-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.584022-0500	RedLemon	   OUTPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	10:26:47.584172-0500	RedLemon	   OUTPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	10:26:47.584309-0500	RedLemon	   OUTPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	10:26:47.584446-0500	RedLemon	   OUTPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.584583-0500	RedLemon	   OUTPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	10:26:47.586805-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.587644-0500	RedLemon	   OUTPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.587745-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.587826-0500	RedLemon	   OUTPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	10:26:47.587896-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.588682-0500	RedLemon	   OUTPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	10:26:47.588876-0500	RedLemon	   OUTPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	10:26:47.589018-0500	RedLemon	   OUTPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	10:26:47.589152-0500	RedLemon	   OUTPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	10:26:47.589281-0500	RedLemon	   OUTPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.589404-0500	RedLemon	   OUTPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	10:26:47.589531-0500	RedLemon	   OUTPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.588597-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.590198-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.590415-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.590946-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.591088-0500	RedLemon	   OUTPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.591229-0500	RedLemon	   OUTPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.591362-0500	RedLemon	   OUTPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.591396-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.591496-0500	RedLemon	   OUTPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.591557-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.591619-0500	RedLemon	   OUTPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.594495-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.594511-0500	RedLemon	   OUTPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	10:26:47.594697-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.595686-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.596124-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.596287-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.596795-0500	RedLemon	   OUTPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	10:26:47.597090-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.597289-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.597656-0500	RedLemon	   OUTPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	10:26:47.597803-0500	RedLemon	   OUTPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	10:26:47.597929-0500	RedLemon	   OUTPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	10:26:47.598051-0500	RedLemon	   OUTPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	10:26:47.598877-0500	RedLemon	   OUTPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	10:26:47.599073-0500	RedLemon	   OUTPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	10:26:47.599364-0500	RedLemon	   OUTPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	10:26:47.599462-0500	RedLemon	   OUTPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	10:26:47.599534-0500	RedLemon	   OUTPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	10:26:47.599606-0500	RedLemon	   OUTPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	10:26:47.599672-0500	RedLemon	   OUTPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.599735-0500	RedLemon	   OUTPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	10:26:47.599803-0500	RedLemon	   OUTPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	10:26:47.599875-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.600290-0500	RedLemon	   OUTPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	10:26:47.600461-0500	RedLemon	   OUTPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	10:26:47.600924-0500	RedLemon	   OUTPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	10:26:47.601015-0500	RedLemon	   OUTPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	10:26:47.601090-0500	RedLemon	   OUTPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	10:26:47.601157-0500	RedLemon	   OUTPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	10:26:47.601288-0500	RedLemon	   OUTPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	10:26:47.601649-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.601784-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.602097-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.602227-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.602336-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.602442-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.602546-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.602650-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.602752-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603125-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603195-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603255-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603312-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603368-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603425-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603481-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603537-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603593-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603647-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603703-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603758-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603813-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603869-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603924-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.603981-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.604036-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.604091-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.605751-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.605911-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.606030-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.606369-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.608010-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.608135-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.608242-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.608346-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.608436-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.608458-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.608553-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.608652-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.609579-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.609711-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.609822-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.609929-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.610399-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.610491-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.610555-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.610615-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.610672-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.610728-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.610785-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	10:26:47.610841-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	10:26:47.610897-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	10:26:47.610951-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	10:26:47.611007-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.611063-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.611119-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.611174-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.611228-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.611283-0500	RedLemon	   OUTPUT[206]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.611628-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.613481-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.622217-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.623805-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.624504-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.626463-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.627754-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.628591-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.628858-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.629213-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.629818-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.632852-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.633003-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.633276-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.633393-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.634691-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.635534-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.636138-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.636324-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.636691-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.636898-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.637044-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.637897-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.638046-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.639149-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.639321-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.641175-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	10:26:47.641412-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	10:26:47.641581-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.643142-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.643301-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.644073-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.644345-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.644686-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.645211-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.645586-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.645927-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.646240-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.646379-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.646658-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.647556-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.647905-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.648036-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.648533-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.648685-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.648602-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:47.648968-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.648654-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:47.649128-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.648704-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:47.649609-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.649744-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.650032-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.650162-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.651330-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.651524-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.651881-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.652218-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.653376-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.653558-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.653601-0500	runningboardd	Invalidating assertion 173-114-2126 (target:[anon<RedLemon>(501):6145]) from originator [daemon<com.apple.powerd>:114]
default	10:26:47.654186-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.654380-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.655760-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.655922-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.656208-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.656336-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.656606-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.656754-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.657058-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.657255-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.657743-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.657881-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.658318-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.658442-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.658648-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.658721-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.658886-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.658965-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.659132-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.659220-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.659404-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.659476-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.659646-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.660691-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.661742-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.661964-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.662308-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.662456-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.662782-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.662931-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.663230-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.664205-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.664757-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.664858-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.665045-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.665127-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.665306-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.665400-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.665590-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.666394-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.666964-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.667133-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.667696-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.667886-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.668407-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.668514-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.668706-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.668788-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.668962-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.669059-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.669250-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.669322-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.669506-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.669589-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.670077-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.670270-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.671169-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.671350-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.671911-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.672066-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.672794-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.672991-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.673338-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.673465-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.674729-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.674909-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.675257-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.675441-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.675820-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.675983-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.676358-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.676562-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.677382-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.677608-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.678190-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.678286-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.678463-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.678544-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.679266-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.679399-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.679764-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.679899-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.680402-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.680566-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.681298-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.681490-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.682301-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.682498-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.683106-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.683224-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.683422-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.683722-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.684072-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.684191-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.684463-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.684587-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.684860-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.685002-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.685585-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.685710-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.686053-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.686214-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.686718-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.686851-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.687064-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.687141-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.687310-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.687391-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.687561-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.687652-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.689269-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.689385-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.689582-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.689666-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.690151-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.690339-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.690675-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.690813-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.691121-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.691361-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.691848-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.692110-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.692686-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.692791-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.692976-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.693059-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.693229-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.693326-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.693514-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.694401-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.694729-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.695061-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.695385-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.695542-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.696027-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.696216-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.696333-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.697880-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.699724-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.700777-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.701747-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.701982-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.702713-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.703149-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.703282-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.703800-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.703968-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.704097-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.704432-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.704597-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.704899-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.705049-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.705158-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.705624-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.705787-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.705920-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.707520-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.707758-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.708168-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.708362-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.708489-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.709328-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.709673-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.710948-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.711700-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.711903-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.713430-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.713622-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.713737-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.715840-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	10:26:47.716968-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.717139-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.717264-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.717571-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.717725-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.718005-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.718146-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.718591-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.718919-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.719213-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.719306-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.719510-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.719608-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.719786-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.719877-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.719942-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.720102-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.720177-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.720247-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.721374-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.721582-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.722285-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.722456-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.722565-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.722837-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.722961-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.723073-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.723352-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.726850-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.727253-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.727895-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.728051-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.728607-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.728785-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.729420-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.729918-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.730101-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.730855-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.731183-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.731324-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.732615-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.732811-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.732960-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.733808-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.737482-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.737962-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.738145-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.738266-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.738591-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.738749-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.738883-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.741132-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.741363-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.741731-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.741904-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.742037-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.742382-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.742546-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.742687-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.746561-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.746769-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.747740-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.747927-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.748054-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.748464-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.748635-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.748773-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.749658-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.749866-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.750575-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.750763-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.750878-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.751171-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.751307-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.751426-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.751718-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.754441-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.755611-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.756536-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.756680-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.757252-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.757411-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.758341-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.758692-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.758845-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.759123-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.759254-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.759356-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.759618-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.761501-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.761650-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.764662-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.765824-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.766318-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.766496-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.766630-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.768059-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.768234-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.768358-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.768676-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.768835-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.769114-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.769246-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.769669-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.769988-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.770116-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.770236-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.770731-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.770908-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.771241-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.771395-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.771512-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.773653-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.773874-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.774049-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.774457-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.774669-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.775094-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.775279-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.775405-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.778093-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.778294-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.778496-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.778873-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.780894-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.781990-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.782186-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.782314-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.782655-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.783052-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.783842-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.784710-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.784835-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.785043-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.785136-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.785206-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.785379-0500	RedLemon	    📺 Resolution match: 1080p
default	10:26:47.786722-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.786827-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.787590-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.787796-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.788897-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.789057-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.789352-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.789479-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.789757-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.789906-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.790204-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.790965-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.791304-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.791441-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.791765-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.791933-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.792689-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.792865-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.793555-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.795248-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.796360-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.796587-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.800348-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:47.800404-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:47.800450-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:47.801325-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.801484-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.802611-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.803045-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.804913-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.805123-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.805478-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.805622-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.810673-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.810894-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.814512-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.815397-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.816668-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.816833-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.817599-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.817783-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.818109-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.818274-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.819672-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.819792-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.820018-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.820108-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.820297-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.820400-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.820599-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.822319-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.823056-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.823223-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.823558-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.823754-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.824146-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.824306-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.829466-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.829647-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.829988-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.830606-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.831037-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	10:26:47.831176-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	10:26:47.831486-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	10:26:47.831808-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	10:26:47.832209-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	10:26:47.832927-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	10:26:47.833791-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 207
default	10:26:47.833981-0500	RedLemon	   OUTPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.834151-0500	RedLemon	   OUTPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean | Subtitles: 3
default	10:26:47.834316-0500	RedLemon	   OUTPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.834472-0500	RedLemon	   OUTPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.834625-0500	RedLemon	   OUTPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.836188-0500	RedLemon	   OUTPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.836411-0500	RedLemon	   OUTPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.836579-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.836728-0500	RedLemon	   OUTPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.837201-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.837733-0500	RedLemon	   OUTPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.837929-0500	RedLemon	   OUTPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	10:26:47.838078-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.843012-0500	RedLemon	   OUTPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.843260-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.843545-0500	RedLemon	   OUTPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	10:26:47.844060-0500	RedLemon	   OUTPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.844810-0500	RedLemon	   OUTPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.845129-0500	RedLemon	   OUTPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.845374-0500	RedLemon	   OUTPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.845530-0500	RedLemon	   OUTPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.845685-0500	RedLemon	   OUTPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	10:26:47.845845-0500	RedLemon	   OUTPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.846004-0500	RedLemon	   OUTPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	10:26:47.846159-0500	RedLemon	   OUTPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.846559-0500	RedLemon	   OUTPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	10:26:47.847896-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.848117-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.848309-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.849679-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	10:26:47.849910-0500	RedLemon	   OUTPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	10:26:47.850353-0500	RedLemon	   OUTPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	10:26:47.850792-0500	RedLemon	   OUTPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.850974-0500	RedLemon	   OUTPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.851138-0500	RedLemon	   OUTPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	10:26:47.851301-0500	RedLemon	   OUTPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	10:26:47.851463-0500	RedLemon	   OUTPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.851619-0500	RedLemon	   OUTPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	10:26:47.851778-0500	RedLemon	   OUTPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.852905-0500	RedLemon	   OUTPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	10:26:47.853096-0500	RedLemon	   OUTPUT[40]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	10:26:47.853267-0500	RedLemon	   OUTPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.853440-0500	RedLemon	   OUTPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.853606-0500	RedLemon	   OUTPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	10:26:47.853770-0500	RedLemon	   OUTPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	10:26:47.853945-0500	RedLemon	   OUTPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.856226-0500	RedLemon	   OUTPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.856424-0500	RedLemon	   OUTPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.856599-0500	RedLemon	   OUTPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	10:26:47.856774-0500	RedLemon	   OUTPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.856947-0500	RedLemon	   OUTPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	10:26:47.857116-0500	RedLemon	   OUTPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.857290-0500	RedLemon	   OUTPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.858103-0500	RedLemon	   OUTPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.858503-0500	RedLemon	   OUTPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.859498-0500	RedLemon	   OUTPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	10:26:47.859802-0500	RedLemon	   OUTPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	10:26:47.860764-0500	RedLemon	   OUTPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	10:26:47.861036-0500	RedLemon	   OUTPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.861589-0500	RedLemon	   OUTPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.861805-0500	RedLemon	   OUTPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.861974-0500	RedLemon	   OUTPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	10:26:47.862133-0500	RedLemon	   OUTPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	10:26:47.862312-0500	RedLemon	   OUTPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	10:26:47.862631-0500	RedLemon	   OUTPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	10:26:47.862824-0500	RedLemon	   OUTPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.863167-0500	RedLemon	   OUTPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.864118-0500	RedLemon	   OUTPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	10:26:47.864312-0500	RedLemon	   OUTPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.864490-0500	RedLemon	   OUTPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.864653-0500	RedLemon	   OUTPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	10:26:47.864819-0500	RedLemon	   OUTPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.864978-0500	RedLemon	   OUTPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.865144-0500	RedLemon	   OUTPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	10:26:47.868191-0500	RedLemon	   OUTPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	10:26:47.868362-0500	RedLemon	   OUTPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.869358-0500	RedLemon	   OUTPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.869529-0500	RedLemon	   OUTPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	10:26:47.869683-0500	RedLemon	   OUTPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	10:26:47.869832-0500	RedLemon	   OUTPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	10:26:47.870235-0500	RedLemon	   OUTPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	10:26:47.870392-0500	RedLemon	   OUTPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	10:26:47.870543-0500	RedLemon	   OUTPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	10:26:47.870939-0500	RedLemon	   OUTPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	10:26:47.871293-0500	RedLemon	   OUTPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	10:26:47.871409-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	10:26:47.871489-0500	RedLemon	   OUTPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	10:26:47.871556-0500	RedLemon	   OUTPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	10:26:47.871632-0500	RedLemon	   OUTPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	10:26:47.871705-0500	RedLemon	   OUTPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	10:26:47.871773-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	10:26:47.872235-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.872749-0500	RedLemon	   OUTPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	10:26:47.872922-0500	RedLemon	   OUTPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.873119-0500	RedLemon	   OUTPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	10:26:47.873986-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	10:26:47.878109-0500	RedLemon	   OUTPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	10:26:47.878276-0500	RedLemon	   OUTPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.878420-0500	RedLemon	   OUTPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.878875-0500	RedLemon	   OUTPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.879029-0500	RedLemon	   OUTPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	10:26:47.879178-0500	RedLemon	   OUTPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	10:26:47.879492-0500	RedLemon	   OUTPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	10:26:47.879765-0500	RedLemon	   OUTPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.880053-0500	RedLemon	   OUTPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	10:26:47.880208-0500	RedLemon	   OUTPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.880341-0500	RedLemon	   OUTPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.880835-0500	RedLemon	   OUTPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.881007-0500	RedLemon	   OUTPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	10:26:47.881134-0500	RedLemon	   OUTPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	10:26:47.881257-0500	RedLemon	   OUTPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	10:26:47.881380-0500	RedLemon	   OUTPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	10:26:47.881510-0500	RedLemon	   OUTPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.881642-0500	RedLemon	   OUTPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	10:26:47.881766-0500	RedLemon	   OUTPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.881877-0500	RedLemon	   OUTPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	10:26:47.882004-0500	RedLemon	   OUTPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	10:26:47.882132-0500	RedLemon	   OUTPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	10:26:47.882258-0500	RedLemon	   OUTPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	10:26:47.882666-0500	RedLemon	   OUTPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	10:26:47.882838-0500	RedLemon	   OUTPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.882970-0500	RedLemon	   OUTPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	10:26:47.883095-0500	RedLemon	   OUTPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.883570-0500	RedLemon	   OUTPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.883703-0500	RedLemon	   OUTPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.883829-0500	RedLemon	   OUTPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.886085-0500	RedLemon	   OUTPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	10:26:47.886259-0500	RedLemon	   OUTPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.886393-0500	RedLemon	   OUTPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	10:26:47.886512-0500	RedLemon	   OUTPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	10:26:47.886643-0500	RedLemon	   OUTPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	10:26:47.886770-0500	RedLemon	   OUTPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	10:26:47.886884-0500	RedLemon	   OUTPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	10:26:47.887151-0500	RedLemon	   OUTPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	10:26:47.887962-0500	RedLemon	   OUTPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	10:26:47.888111-0500	RedLemon	   OUTPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	10:26:47.888247-0500	RedLemon	   OUTPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	10:26:47.888375-0500	RedLemon	   OUTPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	10:26:47.889450-0500	RedLemon	   OUTPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	10:26:47.889828-0500	RedLemon	   OUTPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	10:26:47.890259-0500	RedLemon	   OUTPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	10:26:47.890431-0500	RedLemon	   OUTPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	10:26:47.890569-0500	RedLemon	   OUTPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	10:26:47.890698-0500	RedLemon	   OUTPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	10:26:47.890829-0500	RedLemon	   OUTPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	10:26:47.890948-0500	RedLemon	   OUTPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	10:26:47.891062-0500	RedLemon	   OUTPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	10:26:47.891179-0500	RedLemon	   OUTPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	10:26:47.891583-0500	RedLemon	   OUTPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	10:26:47.891674-0500	RedLemon	   OUTPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	10:26:47.891742-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.891808-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.892199-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.892314-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.892424-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.892529-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.892635-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.892740-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.892848-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.894449-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.894733-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.894804-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.894866-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.894927-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.894984-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.895044-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.895404-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.895534-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.895632-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.895728-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.895823-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.895915-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.896008-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.896100-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.896193-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.896286-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	10:26:47.896379-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.896476-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.896575-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.896676-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.896780-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.897321-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.897576-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.897860-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.898144-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.898225-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.898781-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.898864-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.898929-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.898988-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.899049-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.899106-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.899163-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.900197-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.900326-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.900441-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.900551-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.900656-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	10:26:47.900762-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	10:26:47.900867-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	10:26:47.900974-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	10:26:47.901304-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	10:26:47.901479-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.901585-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.901704-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.901819-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.902051-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:47.902158-0500	RedLemon	   OUTPUT[206]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	10:26:48.106040-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
default	10:26:48.125386-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	10:26:48.208825-0500	RedLemon	Task <7A0D0B3D-B7D1-4E1C-AC33-42125E084D0E>.<14> received response, status 200 content K
default	10:26:48.210093-0500	RedLemon	Task <7A0D0B3D-B7D1-4E1C-AC33-42125E084D0E>.<14> response ended
default	10:26:48.211638-0500	RedLemon	Task <7A0D0B3D-B7D1-4E1C-AC33-42125E084D0E>.<14> done using Connection 41
default	10:26:48.211865-0500	RedLemon	Task <7A0D0B3D-B7D1-4E1C-AC33-42125E084D0E>.<14> summary for task success {transaction_duration_ms=2580, response_status=200, connection=41, reused=1, request_start_ms=2, request_duration_ms=0, response_start_ms=2577, response_duration_ms=3, request_bytes=277, response_bytes=19768, cache_hit=false}
default	10:26:48.212127-0500	RedLemon	Task <7A0D0B3D-B7D1-4E1C-AC33-42125E084D0E>.<14> finished successfully
default	10:26:48.217447-0500	RedLemon	Task <B63EE116-F081-4719-8EA6-017726C31AB3>.<334> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:48.218275-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BFA39E5D-E3F2-4B6D-BF96-B9C1C753870B] (reporting strategy default)> on Task <B63EE116-F081-4719-8EA6-017726C31AB3>.<334> was not selected for reporting
default	10:26:48.223436-0500	RedLemon	Connection 52: starting, TC(0x0)
default	10:26:48.223630-0500	RedLemon	[C52 0364BD31-135C-4C4B-B19C-86AF95164F2C 127.0.0.1:47253 tcp, url hash: 905dac05, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{3AB6D079-918D-47AB-9C49-80051391D7AF}{(null)}{Y}{2} (private), proc: FA056963-4751-3C92-B931-FEB284B88616] start
default	10:26:48.223735-0500	RedLemon	[C52 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	10:26:48.224037-0500	RedLemon	[C52 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), interface: lo0)] event: path:satisfied @0.000s, uuid: B6A6B603-A536-4CBD-B08E-0711FF8DF43D
default	10:26:48.224637-0500	RedLemon	[C52 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), interface: lo0)] event: flow:start_connect @0.000s
default	10:26:48.224678-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C52] reporting state preparing
default	10:26:48.224915-0500	RedLemon	Task <B63EE116-F081-4719-8EA6-017726C31AB3>.<334> setting up Connection 52
default	10:26:48.225564-0500	RedLemon	nw_socket_handle_socket_event [C52:2] Socket received CONNECTED event
default	10:26:48.225878-0500	RedLemon	nw_flow_connected [C52 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	10:26:48.225949-0500	RedLemon	[C52 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.002s
default	10:26:48.226072-0500	RedLemon	nw_flow_connected [C52 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:48.226480-0500	RedLemon	[C52 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.002s
default	10:26:48.226629-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C52] reporting state ready
default	10:26:48.226686-0500	RedLemon	[C52 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.002s
default	10:26:48.226756-0500	RedLemon	Connection 52: connected successfully
default	10:26:48.226847-0500	RedLemon	Connection 52: ready C(N) E(N)
default	10:26:48.227045-0500	RedLemon	Task <B63EE116-F081-4719-8EA6-017726C31AB3>.<334> now using Connection 52
default	10:26:48.227257-0500	RedLemon	Connection 52: received viability advisory(Y)
default	10:26:48.228744-0500	RedLemon	Task <B63EE116-F081-4719-8EA6-017726C31AB3>.<334> sent request, body S 90
default	10:26:48.230643-0500	RedLemon	🔓 Unlock request: infoHash=54753892d63a..., fileIdx=0
default	10:26:48.230839-0500	RedLemon	✅ Token found, attempting unlock...
default	10:26:48.231420-0500	RedLemon	✅ Unlocked successfully: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	10:26:48.233202-0500	RedLemon	Task <B63EE116-F081-4719-8EA6-017726C31AB3>.<334> received response, status 200 content K
default	10:26:48.234988-0500	RedLemon	Task <B63EE116-F081-4719-8EA6-017726C31AB3>.<334> response ended
default	10:26:48.235066-0500	RedLemon	Task <B63EE116-F081-4719-8EA6-017726C31AB3>.<334> done using Connection 52
default	10:26:48.235306-0500	RedLemon	Task <B63EE116-F081-4719-8EA6-017726C31AB3>.<334> summary for task success {transaction_duration_ms=15, response_status=200, connection=52, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=2, secure_connection_duration_ms=0, private_relay=false, request_start_ms=7, request_duration_ms=1, response_start_ms=13, response_duration_ms=2, request_bytes=372, response_bytes=358, cache_hit=true}
default	10:26:48.235512-0500	RedLemon	Task <B63EE116-F081-4719-8EA6-017726C31AB3>.<334> finished successfully
default	10:26:48.235744-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	10:26:48.235975-0500	RedLemon	Task <2405AABE-A426-45EE-BA70-427E5618F504>.<335> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:48.236665-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E79E7AD9-AC18-4840-965A-54FE221F9E67] (reporting strategy default)> on Task <2405AABE-A426-45EE-BA70-427E5618F504>.<335> was not selected for reporting
default	10:26:48.236813-0500	RedLemon	Task <14F523CD-5E36-4544-BA8F-44180EAE9025>.<336> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:48.237221-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A8230B29-3237-4525-BD7A-DE12C43A5A53] (reporting strategy default)> on Task <14F523CD-5E36-4544-BA8F-44180EAE9025>.<336> was not selected for reporting
default	10:26:48.237334-0500	RedLemon	Task <96528A38-DE8C-41C5-9820-208EB2C4039B>.<337> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:48.237859-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6C4A112A-B043-499F-A7EA-F4226C297F09] (reporting strategy default)> on Task <96528A38-DE8C-41C5-9820-208EB2C4039B>.<337> was not selected for reporting
default	10:26:48.238470-0500	RedLemon	Task <2405AABE-A426-45EE-BA70-427E5618F504>.<335> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:48.238775-0500	RedLemon	Task <2405AABE-A426-45EE-BA70-427E5618F504>.<335> now using Connection 32
default	10:26:48.241559-0500	RedLemon	Task <14F523CD-5E36-4544-BA8F-44180EAE9025>.<336> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:48.241760-0500	RedLemon	Task <14F523CD-5E36-4544-BA8F-44180EAE9025>.<336> now using Connection 32
default	10:26:48.243355-0500	RedLemon	Task <96528A38-DE8C-41C5-9820-208EB2C4039B>.<337> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:48.243535-0500	RedLemon	Task <96528A38-DE8C-41C5-9820-208EB2C4039B>.<337> now using Connection 32
default	10:26:48.245285-0500	RedLemon	0x7fbaf8b955d8 ID=24 Task <2405AABE-A426-45EE-BA70-427E5618F504>.<335> sent request, body N 0
default	10:26:48.245393-0500	RedLemon	0x7fbaf96363f8 ID=28 Task <14F523CD-5E36-4544-BA8F-44180EAE9025>.<336> sent request, body N 0
default	10:26:48.245516-0500	RedLemon	0x7fbaf9732358 ID=32 Task <96528A38-DE8C-41C5-9820-208EB2C4039B>.<337> sent request, body N 0
default	10:26:48.261862-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [anon<RedLemon>(501):6145] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-6145-2128 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:48.262197-0500	runningboardd	Assertion 173-6145-2128 (target:[anon<RedLemon>(501):6145]) will be created as active as no start-time-defining assertions exist
default	10:26:48.263400-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:48.264985-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:48.265053-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:48.266464-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-2129 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:48.266648-0500	runningboardd	Assertion 173-114-2129 (target:[anon<RedLemon>(501):6145]) will be created as active
default	10:26:48.269062-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:48.269119-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:48.269170-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:48.331146-0500	RedLemon	Task <BAE2A88C-5EFD-40A1-90D9-9760F39CAEA5>.<15> received response, status 200 content K
default	10:26:48.331574-0500	RedLemon	Task <BAE2A88C-5EFD-40A1-90D9-9760F39CAEA5>.<15> response ended
default	10:26:48.331859-0500	RedLemon	Task <BAE2A88C-5EFD-40A1-90D9-9760F39CAEA5>.<15> done using Connection 51
default	10:26:48.332164-0500	RedLemon	Task <BAE2A88C-5EFD-40A1-90D9-9760F39CAEA5>.<15> summary for task success {transaction_duration_ms=2003, response_status=200, connection=51, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=13, secure_connection_duration_ms=0, private_relay=false, request_start_ms=17, request_duration_ms=0, response_start_ms=2002, response_duration_ms=1, request_bytes=277, response_bytes=19768, cache_hit=false}
default	10:26:48.332361-0500	RedLemon	Task <BAE2A88C-5EFD-40A1-90D9-9760F39CAEA5>.<15> finished successfully
default	10:26:48.339534-0500	RedLemon	Task <5BE941A7-09A2-46D0-A5F9-11E93C3A64E4>.<338> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:48.340070-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5E8982CA-D996-4BDD-A4F6-C821EEC3ABB8] (reporting strategy default)> on Task <5BE941A7-09A2-46D0-A5F9-11E93C3A64E4>.<338> was not selected for reporting
default	10:26:48.341578-0500	RedLemon	Task <5BE941A7-09A2-46D0-A5F9-11E93C3A64E4>.<338> now using Connection 52
default	10:26:48.342329-0500	RedLemon	Task <5BE941A7-09A2-46D0-A5F9-11E93C3A64E4>.<338> sent request, body S 90
default	10:26:48.344398-0500	RedLemon	🔓 Unlock request: infoHash=54753892d63a..., fileIdx=0
default	10:26:48.344554-0500	RedLemon	✅ Token found, attempting unlock...
default	10:26:48.344960-0500	RedLemon	✅ Unlocked successfully: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	10:26:48.346260-0500	RedLemon	Task <5BE941A7-09A2-46D0-A5F9-11E93C3A64E4>.<338> received response, status 200 content K
default	10:26:48.346652-0500	RedLemon	Task <5BE941A7-09A2-46D0-A5F9-11E93C3A64E4>.<338> response ended
default	10:26:48.346726-0500	RedLemon	Task <5BE941A7-09A2-46D0-A5F9-11E93C3A64E4>.<338> done using Connection 52
default	10:26:48.347577-0500	RedLemon	Task <5BE941A7-09A2-46D0-A5F9-11E93C3A64E4>.<338> summary for task success {transaction_duration_ms=6, response_status=200, connection=52, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=5, response_duration_ms=0, request_bytes=372, response_bytes=358, cache_hit=true}
default	10:26:48.348994-0500	RedLemon	Task <5BE941A7-09A2-46D0-A5F9-11E93C3A64E4>.<338> finished successfully
default	10:26:48.349354-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	10:26:48.349605-0500	RedLemon	Task <B49A1CE1-2883-4748-AB56-A14DFD33BEFD>.<339> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:48.350106-0500	RedLemon	Task <25E89D72-4C98-4AFD-9924-8AFD6B288DCB>.<340> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:48.350176-0500	RedLemon	Task <3E4508F0-5042-46F7-957C-E2C7B00EBF2D>.<341> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:48.350812-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [861D3073-31A8-409B-9AD8-7C44E0B8993D] (reporting strategy default)> on Task <B49A1CE1-2883-4748-AB56-A14DFD33BEFD>.<339> was not selected for reporting
default	10:26:48.351717-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [56D19A07-B478-47CB-9236-6BAD2FF7718F] (reporting strategy default)> on Task <25E89D72-4C98-4AFD-9924-8AFD6B288DCB>.<340> was not selected for reporting
default	10:26:48.353055-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [79A0EFEC-4CD6-48D8-B1AE-A36B2281BCCC] (reporting strategy default)> on Task <3E4508F0-5042-46F7-957C-E2C7B00EBF2D>.<341> was not selected for reporting
default	10:26:48.367518-0500	RedLemon	Task <B49A1CE1-2883-4748-AB56-A14DFD33BEFD>.<339> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:48.367717-0500	RedLemon	Task <B49A1CE1-2883-4748-AB56-A14DFD33BEFD>.<339> now using Connection 32
default	10:26:48.370171-0500	RedLemon	0x7fbaf8b1ede8 ID=36 Task <B49A1CE1-2883-4748-AB56-A14DFD33BEFD>.<339> sent request, body N 0
default	10:26:48.371027-0500	RedLemon	Task <25E89D72-4C98-4AFD-9924-8AFD6B288DCB>.<340> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:48.371248-0500	RedLemon	Task <25E89D72-4C98-4AFD-9924-8AFD6B288DCB>.<340> now using Connection 32
default	10:26:48.372358-0500	RedLemon	0x7fbaf8870428 ID=40 Task <25E89D72-4C98-4AFD-9924-8AFD6B288DCB>.<340> sent request, body N 0
default	10:26:48.376688-0500	RedLemon	Task <3E4508F0-5042-46F7-957C-E2C7B00EBF2D>.<341> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:48.381540-0500	RedLemon	Task <3E4508F0-5042-46F7-957C-E2C7B00EBF2D>.<341> now using Connection 32
default	10:26:48.386218-0500	RedLemon	0x7fbaf8886298 ID=44 Task <3E4508F0-5042-46F7-957C-E2C7B00EBF2D>.<341> sent request, body N 0
default	10:26:48.387075-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	10:26:48.397434-0500	RedLemon	0x7fbaf8b955d8 ID=24 Task <2405AABE-A426-45EE-BA70-427E5618F504>.<335> received response, status 200 content U
default	10:26:48.399507-0500	RedLemon	0x7fbaf96363f8 ID=28 Task <14F523CD-5E36-4544-BA8F-44180EAE9025>.<336> received response, status 200 content K
default	10:26:48.402158-0500	RedLemon	Task <14F523CD-5E36-4544-BA8F-44180EAE9025>.<336> response ended
default	10:26:48.402880-0500	RedLemon	Task <14F523CD-5E36-4544-BA8F-44180EAE9025>.<336> done using Connection 32
default	10:26:48.403944-0500	RedLemon	Task <14F523CD-5E36-4544-BA8F-44180EAE9025>.<336> summary for task success {transaction_duration_ms=165, response_status=200, connection=32, reused=1, request_start_ms=3, request_duration_ms=3, response_start_ms=160, response_duration_ms=3, request_bytes=112, response_bytes=3275, cache_hit=true}
default	10:26:48.404211-0500	RedLemon	Task <14F523CD-5E36-4544-BA8F-44180EAE9025>.<336> finished successfully
default	10:26:48.404406-0500	RedLemon	0x7fbaf9732358 ID=32 Task <96528A38-DE8C-41C5-9820-208EB2C4039B>.<337> received response, status 200 content U
default	10:26:48.432389-0500	RedLemon	Task <2405AABE-A426-45EE-BA70-427E5618F504>.<335> response ended
default	10:26:48.433135-0500	RedLemon	Task <2405AABE-A426-45EE-BA70-427E5618F504>.<335> done using Connection 32
default	10:26:48.433635-0500	RedLemon	Task <2405AABE-A426-45EE-BA70-427E5618F504>.<335> summary for task success {transaction_duration_ms=196, response_status=200, connection=32, reused=1, request_start_ms=1, request_duration_ms=6, response_start_ms=159, response_duration_ms=36, request_bytes=112, response_bytes=91139, cache_hit=true}
default	10:26:48.433974-0500	RedLemon	Task <96528A38-DE8C-41C5-9820-208EB2C4039B>.<337> response ended
default	10:26:48.435117-0500	RedLemon	Task <2405AABE-A426-45EE-BA70-427E5618F504>.<335> finished successfully
default	10:26:48.436546-0500	RedLemon	Task <96528A38-DE8C-41C5-9820-208EB2C4039B>.<337> done using Connection 32
default	10:26:48.436974-0500	RedLemon	Task <96528A38-DE8C-41C5-9820-208EB2C4039B>.<337> summary for task success {transaction_duration_ms=198, response_status=200, connection=32, reused=1, request_start_ms=4, request_duration_ms=1, response_start_ms=165, response_duration_ms=32, request_bytes=112, response_bytes=39896, cache_hit=true}
default	10:26:48.437439-0500	RedLemon	Task <96528A38-DE8C-41C5-9820-208EB2C4039B>.<337> finished successfully
default	10:26:48.472362-0500	RedLemon	🎬🎬🎬 MPVPlayerView INIT called - streamURL: https://chi3-4.download.real-debrid.com/d/3H5G6ZM7ESD6I101/F, subtitles: 3
default	10:26:48.521406-0500	RedLemon	0x7fbaf8870428 ID=40 Task <25E89D72-4C98-4AFD-9924-8AFD6B288DCB>.<340> received response, status 200 content U
default	10:26:48.529191-0500	RedLemon	Task <25E89D72-4C98-4AFD-9924-8AFD6B288DCB>.<340> response ended
default	10:26:48.530000-0500	RedLemon	Task <25E89D72-4C98-4AFD-9924-8AFD6B288DCB>.<340> done using Connection 32
default	10:26:48.530574-0500	RedLemon	Task <25E89D72-4C98-4AFD-9924-8AFD6B288DCB>.<340> summary for task success {transaction_duration_ms=164, response_status=200, connection=32, reused=1, request_start_ms=5, request_duration_ms=1, response_start_ms=155, response_duration_ms=9, request_bytes=112, response_bytes=39900, cache_hit=true}
default	10:26:48.530971-0500	RedLemon	Task <25E89D72-4C98-4AFD-9924-8AFD6B288DCB>.<340> finished successfully
default	10:26:48.562798-0500	RedLemon	✅ Stream ready, starting playback...
default	10:26:48.562931-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	10:26:48.563153-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7fbaf61d5380>
default	10:26:48.563285-0500	RedLemon	   Is fullscreen: 0
default	10:26:48.563385-0500	RedLemon	   ✅ WindowManager: Toggling fullscreen ON
default	10:26:48.605726-0500	RedLemon	🖼️ Setting up MPV with native macOS video output...
default	10:26:48.610377-0500	RedLemon	✅ MPV initialized with native GPU rendering
default	10:26:48.614116-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task starting
default	10:26:48.614268-0500	RedLemon	🎉 Starting watch party sync - Room: URC9, Host: NO
default	10:26:48.656843-0500	runningboardd	Invalidating assertion 173-171-2090 (target:[anon<RedLemon>(501):6145]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	10:26:48.661055-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [daemon<com.apple.WindowServer(88)>:171] with description <RBSAssertionDescriptor| "AppVisible" ID:173-171-2130 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:48.661854-0500	runningboardd	Assertion 173-171-2130 (target:[anon<RedLemon>(501):6145]) will be created as active
default	10:26:48.679322-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	10:26:48.680787-0500	RedLemon	🔄 Starting chat polling for room: URC9
default	10:26:48.681181-0500	RedLemon	✅ Watch party sync started successfully - isInWatchParty is now TRUE
default	10:26:48.681648-0500	RedLemon	🎬🎬🎬 About to call loadStream - isInWatchParty: YES
default	10:26:48.681812-0500	RedLemon	🎬🎬🎬 Subtitles: 3
default	10:26:48.682027-0500	RedLemon	🎬🎬🎬 LOADSTREAM CALLED - streamTitle: Frankenstein
default	10:26:48.682188-0500	RedLemon	🎬🎬🎬 streamURL: https://chi3-4.download.real-debrid.com/d/3H5G6ZM7ESD6I101/F
default	10:26:48.682337-0500	RedLemon	🎬🎬🎬 subtitles: 3
default	10:26:48.683535-0500	RedLemon	🎬 MPV loadVideo called with URL: https://chi3-4.download.real-debrid.com/d/3H5G6ZM7ESD6I101/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1., autoplay: false
default	10:26:48.685493-0500	RedLemon	🎬 MPV executing command: loadfile "https://chi3-4.download.real-debrid.com/d/3H5G6ZM7ESD6I101/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv" pause
default	10:26:48.685651-0500	RedLemon	🎬 MPV loadfile result: -4
default	10:26:48.685746-0500	RedLemon	❌ MPV loadfile failed with code: -4
default	10:26:48.685889-0500	RedLemon	✅ Subtitles already downloaded, loading as additional options...
default	10:26:48.685992-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task completed
default	10:26:48.701562-0500	RedLemon	0x7fbaf8886298 ID=44 Task <3E4508F0-5042-46F7-957C-E2C7B00EBF2D>.<341> received response, status 200 content K
default	10:26:48.713200-0500	RedLemon	📝 Loading external subtitle 1 (Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_BF8F877B-67DF-4495-96B8-2E92F7534613/Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA.srt
default	10:26:48.713458-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_BF8F877B-67DF-4
default	10:26:48.715313-0500	RedLemon	Task <3AD6F9CB-EF56-41D8-92A3-8857C56D5C72>.<342> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:48.720524-0500	RedLemon	Task <3E4508F0-5042-46F7-957C-E2C7B00EBF2D>.<341> response ended
default	10:26:48.721117-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [91AC7A76-69E8-452D-90E8-5AE7A43DA035] (reporting strategy default)> on Task <3AD6F9CB-EF56-41D8-92A3-8857C56D5C72>.<342> was not selected for reporting
default	10:26:48.722261-0500	RedLemon	Task <3E4508F0-5042-46F7-957C-E2C7B00EBF2D>.<341> done using Connection 32
default	10:26:48.723500-0500	RedLemon	Task <3E4508F0-5042-46F7-957C-E2C7B00EBF2D>.<341> summary for task success {transaction_duration_ms=356, response_status=200, connection=32, reused=1, request_start_ms=14, request_duration_ms=4, response_start_ms=333, response_duration_ms=22, request_bytes=112, response_bytes=3901, cache_hit=true}
default	10:26:48.723537-0500	RedLemon	Task <3AD6F9CB-EF56-41D8-92A3-8857C56D5C72>.<342> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:48.724301-0500	RedLemon	❌ Failed to load subtitle, MPV error code: -12
default	10:26:48.724395-0500	RedLemon	Task <3E4508F0-5042-46F7-957C-E2C7B00EBF2D>.<341> finished successfully
default	10:26:48.724574-0500	RedLemon	📝 Loading external subtitle 2 (Frankenstein (2025) eng): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_DAF07F21-3A78-4586-AFB0-03DCE7E8555A/Frankenstein (2025) eng.srt
default	10:26:48.725081-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_DAF07F21-3A78-4
default	10:26:48.726387-0500	RedLemon	❌ Failed to load subtitle, MPV error code: -12
default	10:26:48.726573-0500	RedLemon	📝 Loading external subtitle 3 (Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX): /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_F18BCBD6-1EAC-4325-983F-D0DD77647045/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.eng.srt
default	10:26:48.726830-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/3v/s3d75ntd4v90_pg0mb6rmlz40000gn/T/extract_F18BCBD6-1EAC-4
default	10:26:48.727385-0500	RedLemon	❌ Failed to load subtitle, MPV error code: -12
default	10:26:48.727539-0500	RedLemon	ℹ️ External subtitles loaded as additional options (embedded subs take priority)
default	10:26:48.736011-0500	RedLemon	Task <59449C95-04BF-470C-A36C-3CAA293BAB59>.<343> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	10:26:48.736479-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E34ABAE3-B6F2-4851-82F6-7CDA2360E4BD] (reporting strategy default)> on Task <59449C95-04BF-470C-A36C-3CAA293BAB59>.<343> was not selected for reporting
default	10:26:48.751267-0500	RedLemon	Task <3AD6F9CB-EF56-41D8-92A3-8857C56D5C72>.<342> now using Connection 3
default	10:26:48.763470-0500	RedLemon	Task <59449C95-04BF-470C-A36C-3CAA293BAB59>.<343> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:48.766410-0500	RedLemon	Task <59449C95-04BF-470C-A36C-3CAA293BAB59>.<343> now using Connection 47
default	10:26:48.774089-0500	RedLemon	0x7fbaf8b1ede8 ID=36 Task <B49A1CE1-2883-4748-AB56-A14DFD33BEFD>.<339> received response, status 200 content U
default	10:26:48.776664-0500	RedLemon	0x7fbaf88ec7c8 ID=608 Task <3AD6F9CB-EF56-41D8-92A3-8857C56D5C72>.<342> sent request, body N 0
default	10:26:48.777065-0500	RedLemon	Task <59449C95-04BF-470C-A36C-3CAA293BAB59>.<343> sent request, body N 0
default	10:26:48.805368-0500	RedLemon	Task <59449C95-04BF-470C-A36C-3CAA293BAB59>.<343> received response, status 200 content K
default	10:26:48.808051-0500	RedLemon	Task <59449C95-04BF-470C-A36C-3CAA293BAB59>.<343> done using Connection 47
default	10:26:48.808478-0500	RedLemon	Task <59449C95-04BF-470C-A36C-3CAA293BAB59>.<343> response ended
default	10:26:48.809117-0500	RedLemon	Task <59449C95-04BF-470C-A36C-3CAA293BAB59>.<343> summary for task success {transaction_duration_ms=71, response_status=200, connection=47, reused=1, request_start_ms=39, request_duration_ms=0, response_start_ms=64, response_duration_ms=6, request_bytes=41, response_bytes=117977, cache_hit=false}
default	10:26:48.809401-0500	RedLemon	Task <59449C95-04BF-470C-A36C-3CAA293BAB59>.<343> finished successfully
default	10:26:48.830544-0500	RedLemon	0x7fbaf88ec7c8 ID=608 Task <3AD6F9CB-EF56-41D8-92A3-8857C56D5C72>.<342> received response, status 200 content K
default	10:26:48.831897-0500	RedLemon	Task <3AD6F9CB-EF56-41D8-92A3-8857C56D5C72>.<342> response ended
default	10:26:48.832894-0500	RedLemon	Task <3AD6F9CB-EF56-41D8-92A3-8857C56D5C72>.<342> done using Connection 3
default	10:26:48.833141-0500	RedLemon	Task <3AD6F9CB-EF56-41D8-92A3-8857C56D5C72>.<342> summary for task success {transaction_duration_ms=110, response_status=200, connection=3, reused=1, request_start_ms=28, request_duration_ms=25, response_start_ms=107, response_duration_ms=3, request_bytes=530, response_bytes=663, cache_hit=false}
default	10:26:48.833667-0500	RedLemon	Task <3AD6F9CB-EF56-41D8-92A3-8857C56D5C72>.<342> finished successfully
default	10:26:48.834609-0500	RedLemon	Task <B49A1CE1-2883-4748-AB56-A14DFD33BEFD>.<339> response ended
default	10:26:48.835069-0500	RedLemon	Task <B49A1CE1-2883-4748-AB56-A14DFD33BEFD>.<339> done using Connection 32
default	10:26:48.835285-0500	RedLemon	Task <B49A1CE1-2883-4748-AB56-A14DFD33BEFD>.<339> summary for task success {transaction_duration_ms=470, response_status=200, connection=32, reused=1, request_start_ms=2, request_duration_ms=2, response_start_ms=408, response_duration_ms=61, request_bytes=112, response_bytes=91141, cache_hit=true}
default	10:26:48.835537-0500	RedLemon	Task <B49A1CE1-2883-4748-AB56-A14DFD33BEFD>.<339> finished successfully
default	10:26:48.847225-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:48.959605-0500	RedLemon	✅ Stream ready, starting playback...
default	10:26:48.959887-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	10:26:48.960372-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7fbaf61d5380>
default	10:26:48.960510-0500	RedLemon	   Is fullscreen: 1
default	10:26:48.960618-0500	RedLemon	   ⚠️ WindowManager: Already in fullscreen
default	10:26:49.192706-0500	runningboardd	Invalidating assertion 173-171-2130 (target:[anon<RedLemon>(501):6145]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	10:26:49.211909-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [daemon<com.apple.WindowServer(88)>:171] with description <RBSAssertionDescriptor| "AppVisible" ID:173-171-2132 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:49.212157-0500	runningboardd	Assertion 173-171-2132 (target:[anon<RedLemon>(501):6145]) will be created as active
default	10:26:49.364171-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	10:26:49.365274-0500	runningboardd	Invalidating assertion 173-6145-2128 (target:[anon<RedLemon>(501):6145]) from originator [anon<RedLemon>(501):6145]
default	10:26:49.365164-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F2814CB7-7561-4D90-8560-D48E8A0108A3] (reporting strategy default)> on Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> was not selected for reporting
default	10:26:49.366581-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:49.367532-0500	RedLemon	Connection 53: enabling TLS
default	10:26:49.367582-0500	RedLemon	Connection 53: starting, TC(0x0)
default	10:26:49.367643-0500	RedLemon	[C53 DD45D075-413A-46BD-8EBA-26FB9C5E6B61 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{207C99B9-3CEA-47EF-9DD3-3DB5F53708C8}{(null)}{Y}{2} (private), proc: FA056963-4751-3C92-B931-FEB284B88616] start
default	10:26:49.367739-0500	RedLemon	[C53 Hostname#9081a023:443 initial path ((null))] event: path:start @0.000s
default	10:26:49.368159-0500	RedLemon	[C53 Hostname#9081a023:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: D3B8FB85-D0C8-4AA5-8A48-93D6A516ED0B
default	10:26:49.368329-0500	RedLemon	[C53 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	10:26:49.368626-0500	mDNSResponder	[R2246] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 6145 (RedLemon)
default	10:26:49.368365-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C53] reporting state preparing
default	10:26:49.368642-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> setting up Connection 53
default	10:26:49.371054-0500	mDNSResponder	[R2246] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 6145 (RedLemon)
default	10:26:49.371347-0500	RedLemon	nw_endpoint_resolver_update [C53 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e597c525:443
default	10:26:49.371627-0500	RedLemon	[C53 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.003s
default	10:26:49.372232-0500	RedLemon	[C53.1 IPv4#e597c525:443 initial path ((null))] event: path:start @0.004s
default	10:26:49.373028-0500	RedLemon	[C53.1 IPv4#e597c525:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.005s, uuid: A71BD352-2D2B-47D9-940C-6ED7D03EFE81
default	10:26:49.373461-0500	RedLemon	[C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.005s
default	10:26:49.374324-0500	RedLemon	[C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.006s
default	10:26:49.375188-0500	RedLemon	[C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.007s
default	10:26:49.375298-0500	RedLemon	tcp_output [C53.1:3] flags=[S] seq=2060745592, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2060745592
default	10:26:49.500901-0500	RedLemon	tcp_input [C53.1:3] flags=[S.] seq=1524366537, ack=2060745593, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2060745592
default	10:26:49.501121-0500	RedLemon	nw_flow_connected [C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:49.501364-0500	RedLemon	[C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.133s
default	10:26:49.501493-0500	RedLemon	[C53 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.133s
default	10:26:49.502180-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C53.1:2][0x7fbafad836d0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	10:26:49.502403-0500	RedLemon	boringssl_context_info_handler(2028) [C53.1:2][0x7fbafad836d0] Client handshake started
default	10:26:49.502773-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS client enter_early_data
default	10:26:49.502947-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS client read_server_hello
default	10:26:49.525873-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:49.525969-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:49.526062-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:49.528280-0500	runningboardd	Invalidating assertion 173-114-2129 (target:[anon<RedLemon>(501):6145]) from originator [daemon<com.apple.powerd>:114]
default	10:26:49.630734-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	10:26:49.631127-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client read_server_hello
default	10:26:49.631783-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	10:26:49.632695-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client read_certificate_request
default	10:26:49.633970-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client read_server_certificate
default	10:26:49.634196-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	10:26:49.636404-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C53.1:2][0x7fbafad836d0] Performing external trust evaluation
default	10:26:49.636713-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C53.1:2][0x7fbafad836d0] Asyncing for external verify block
default	10:26:49.637052-0500	RedLemon	Connection 53: asked to evaluate TLS Trust
default	10:26:49.637387-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> auth completion disp=1 cred=0x0
default	10:26:49.640930-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:49.641019-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:49.641076-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:49.646442-0500	RedLemon	Connection 53: TLS Trust result 0
default	10:26:49.646505-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C53.1:2][0x7fbafad836d0] Returning from external verify block with result: true
default	10:26:49.646604-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C53.1:2][0x7fbafad836d0] Certificate verification result: OK
default	10:26:49.647134-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client read_server_finished
default	10:26:49.647413-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	10:26:49.647435-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	10:26:49.647456-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client send_client_certificate
default	10:26:49.647490-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client complete_second_flight
default	10:26:49.647579-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS 1.3 client done
default	10:26:49.647818-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS client finish_client_handshake
default	10:26:49.647867-0500	RedLemon	boringssl_context_info_handler(2045) [C53.1:2][0x7fbafad836d0] Client handshake state: TLS client done
default	10:26:49.647907-0500	RedLemon	boringssl_context_info_handler(2034) [C53.1:2][0x7fbafad836d0] Client handshake done
default	10:26:49.648509-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C53.1:2][0x7fbafad836d0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(146ms) flight_time(130ms) rtt(128ms) write_stalls(0) read_stalls(7)]
default	10:26:49.648720-0500	RedLemon	nw_flow_connected [C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:49.649221-0500	RedLemon	[C53.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.281s
default	10:26:49.649403-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C53] reporting state ready
default	10:26:49.649451-0500	RedLemon	[C53 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.281s
default	10:26:49.649648-0500	RedLemon	[C53.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.281s
default	10:26:49.649728-0500	RedLemon	[C53 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.282s
default	10:26:49.650052-0500	RedLemon	Connection 53: connected successfully
default	10:26:49.650106-0500	RedLemon	Connection 53: TLS handshake complete
default	10:26:49.650386-0500	RedLemon	Connection 53: ready C(N) E(N)
default	10:26:49.650907-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> now using Connection 53
default	10:26:49.651115-0500	RedLemon	Connection 53: received viability advisory(Y)
default	10:26:49.651391-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> sent request, body N 0
default	10:26:49.668308-0500	RedLemon	🖱️ Mouse: x=622/1366 y=36/768 | Exit: 0 Controls: 1 Chat: 0
default	10:26:49.758799-0500	RedLemon	🖱️ Mouse: x=618/1366 y=0/768 | Exit: 0 Controls: 1 Chat: 0
default	10:26:49.777537-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> received response, status 101 content U
default	10:26:49.777890-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> response ended
default	10:26:49.777978-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> done using Connection 53
default	10:26:49.778928-0500	RedLemon	[C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.411s
default	10:26:49.779004-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C53] reporting state preparing
default	10:26:49.779094-0500	RedLemon	[C53 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.411s
default	10:26:49.779269-0500	RedLemon	[C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.411s
default	10:26:49.779388-0500	RedLemon	[C53 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.411s
default	10:26:49.779515-0500	RedLemon	nw_flow_connected [C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:49.780014-0500	RedLemon	[C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.412s
default	10:26:49.780178-0500	RedLemon	[C53 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.412s
default	10:26:49.780508-0500	RedLemon	nw_flow_connected [C53.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:49.780924-0500	RedLemon	[C53.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.413s
default	10:26:49.780978-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C53] reporting state ready
default	10:26:49.781059-0500	RedLemon	[C53 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.413s
default	10:26:49.900341-0500	RedLemon	tcp_input [C53.1:3] flags=[FP.] seq=1524369544, ack=2060746648, win=249 state=ESTABLISHED rcv_nxt=1524369544, snd_una=2060746648
default	10:26:49.900465-0500	RedLemon	nw_protocol_tcp_log_summary [C53.1:3]
	[6026DF9B-072C-4C68-88D1-D9A98951903E <private>:51491<-><private>:443]
	Init: 1, Conn_Time: 125.777ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 125.593ms, rtt_var: 4.125ms rtt_nc: 125.562ms, rtt_var_nc: 29.250ms base rtt: 113ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	10:26:49.901490-0500	RedLemon	nw_flow_disconnected [C53.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	10:26:49.902493-0500	RedLemon	Connection 53: read-side closed
default	10:26:49.902590-0500	RedLemon	Connection 53: read-side closed
default	10:26:49.902671-0500	RedLemon	Connection 53: read-side closed
default	10:26:49.903529-0500	RedLemon	[C53.1 IPv4#e597c525:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.535s, error Socket is not connected
default	10:26:49.903624-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C53] reporting state failed error Socket is not connected
default	10:26:49.903748-0500	RedLemon	[C53 Hostname#9081a023:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.536s
error	10:26:49.903851-0500	RedLemon	nw_read_request_report [C53] Receive failed with error "Socket is not connected"
error	10:26:49.903978-0500	RedLemon	nw_flow_service_reads [C53.1 IPv4#e597c525:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	10:26:49.904100-0500	RedLemon	tcp_output [C53.1:3] flags=[F.] seq=2060746779, ack=1524369569, win=2048 state=LAST_ACK rcv_nxt=1524369569, snd_una=2060746648
error	10:26:49.904274-0500	RedLemon	Connection 53: received failure notification
default	10:26:49.904563-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> summary for task success {transaction_duration_ms=538, response_status=101, connection=53, protocol="http/1.1", domain_lookup_duration_ms=3, connect_duration_ms=274, secure_connection_duration_ms=146, private_relay=false, request_start_ms=285, request_duration_ms=0, response_start_ms=411, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	10:26:49.904685-0500	RedLemon	nw_flow_add_write_request [C53.1 IPv4#e597c525:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	10:26:49.904795-0500	RedLemon	nw_write_request_report [C53] Send failed with error "Socket is not connected"
default	10:26:49.904908-0500	RedLemon	Connection 53: cleaning up
default	10:26:49.904913-0500	RedLemon	Task <3F94E249-08CE-483C-BD59-4A2ABAA6CE19>.<1> finished successfully
default	10:26:49.905019-0500	RedLemon	[C53 DD45D075-413A-46BD-8EBA-26FB9C5E6B61 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer] cancel
default	10:26:49.905231-0500	RedLemon	[C53 DD45D075-413A-46BD-8EBA-26FB9C5E6B61 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer] cancelled
	[C53.1 A71BD352-2D2B-47D9-940C-6ED7D03EFE81 10.0.0.249:51491<->IPv4#e597c525:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.537s, DNS @0.000s took 0.003s, TCP @0.411s took 0.126s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	10:26:49.906270-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C53] reporting state cancelled error Socket is not connected
default	10:26:49.908091-0500	RedLemon	Connection 53: done
error	10:26:50.023595-0500	RedLemon	tcp_input [C53.1:3] flags=[R] seq=1524369569, ack=0, win=0 state=LAST_ACK rcv_nxt=1524369569, snd_una=2060746648
error	10:26:50.023982-0500	RedLemon	tcp_input [C53.1:3] flags=[R] seq=1524369569, ack=0, win=0 state=CLOSED rcv_nxt=1524369569, snd_una=2060746648
error	10:26:50.024090-0500	RedLemon	tcp_input [C53.1:3] flags=[R] seq=1524369569, ack=0, win=0 state=CLOSED rcv_nxt=1524369569, snd_una=2060746648
error	10:26:50.024173-0500	RedLemon	tcp_input [C53.1:3] flags=[R] seq=1524369569, ack=0, win=0 state=CLOSED rcv_nxt=1524369569, snd_una=2060746648
error	10:26:50.024246-0500	RedLemon	tcp_input [C53.1:3] flags=[R] seq=1524369569, ack=0, win=0 state=CLOSED rcv_nxt=1524369569, snd_una=2060746648
error	10:26:50.024321-0500	RedLemon	tcp_input [C53.1:3] flags=[R] seq=1524369569, ack=0, win=0 state=CLOSED rcv_nxt=1524369569, snd_una=2060746648
default	10:26:50.682472-0500	RedLemon	Task <76D696CD-E672-4029-929E-69F9344341A5>.<344> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:50.683089-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F79DEE3F-CBBA-429D-A1D0-69DCAFB71C99] (reporting strategy default)> on Task <76D696CD-E672-4029-929E-69F9344341A5>.<344> was not selected for reporting
default	10:26:50.685030-0500	RedLemon	Task <76D696CD-E672-4029-929E-69F9344341A5>.<344> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:50.685586-0500	RedLemon	Task <76D696CD-E672-4029-929E-69F9344341A5>.<344> now using Connection 3
default	10:26:50.687736-0500	RedLemon	0x7fbaf9bbbfa8 ID=612 Task <76D696CD-E672-4029-929E-69F9344341A5>.<344> sent request, body N 0
default	10:26:50.747615-0500	RedLemon	0x7fbaf9bbbfa8 ID=612 Task <76D696CD-E672-4029-929E-69F9344341A5>.<344> received response, status 200 content K
default	10:26:50.748895-0500	RedLemon	Task <76D696CD-E672-4029-929E-69F9344341A5>.<344> response ended
default	10:26:50.750735-0500	RedLemon	Task <76D696CD-E672-4029-929E-69F9344341A5>.<344> done using Connection 3
default	10:26:50.751384-0500	RedLemon	Task <76D696CD-E672-4029-929E-69F9344341A5>.<344> summary for task success {transaction_duration_ms=67, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=63, response_duration_ms=4, request_bytes=530, response_bytes=663, cache_hit=false}
default	10:26:50.752029-0500	RedLemon	Task <76D696CD-E672-4029-929E-69F9344341A5>.<344> finished successfully
default	10:26:50.753612-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [anon<RedLemon>(501):6145] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-6145-2134 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:50.753926-0500	runningboardd	Assertion 173-6145-2134 (target:[anon<RedLemon>(501):6145]) will be created as active as no start-time-defining assertions exist
default	10:26:50.755059-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:50.755134-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:50.755203-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:50.757440-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:50.761058-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-2135 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:50.761296-0500	runningboardd	Assertion 173-114-2135 (target:[anon<RedLemon>(501):6145]) will be created as active
default	10:26:50.762325-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:50.762708-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:50.762763-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:51.361025-0500	RedLemon	🔍 MPV track-list/count: 0
default	10:26:51.361335-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	10:26:51.553930-0500	runningboardd	Invalidating assertion 173-140-2117 (target:[anon<RedLemon>(501):6145]) from originator [daemon<com.apple.coreservices.launchservicesd>:140]
default	10:26:51.672766-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:51.673032-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:51.673924-0500	runningboardd	[anon<RedLemon>(501):6145] Set darwin role to: UserInteractiveNonFocal
default	10:26:51.673988-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:51.763557-0500	runningboardd	Invalidating assertion 173-6145-2134 (target:[anon<RedLemon>(501):6145]) from originator [anon<RedLemon>(501):6145]
default	10:26:51.764583-0500	runningboardd	Invalidating assertion 173-171-2132 (target:[anon<RedLemon>(501):6145]) from originator [daemon<com.apple.WindowServer(88)>:171]
default	10:26:51.938812-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:51.940228-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:51.940584-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:51.941854-0500	runningboardd	Invalidating assertion 173-114-2135 (target:[anon<RedLemon>(501):6145]) from originator [daemon<com.apple.powerd>:114]
default	10:26:52.138858-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:52.138973-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:52.139085-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:52.681910-0500	RedLemon	Task <4BA2CF65-A1AC-444A-832B-E702EBB2A1E6>.<345> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	10:26:52.682511-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BEAA0498-4B8B-40E1-8D9C-97984C031163] (reporting strategy default)> on Task <4BA2CF65-A1AC-444A-832B-E702EBB2A1E6>.<345> was not selected for reporting
default	10:26:52.684267-0500	RedLemon	Task <4BA2CF65-A1AC-444A-832B-E702EBB2A1E6>.<345> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:52.684649-0500	RedLemon	Task <4BA2CF65-A1AC-444A-832B-E702EBB2A1E6>.<345> now using Connection 3
default	10:26:52.686105-0500	RedLemon	0x7fbaf9ccc978 ID=616 Task <4BA2CF65-A1AC-444A-832B-E702EBB2A1E6>.<345> sent request, body N 0
default	10:26:52.758514-0500	RedLemon	0x7fbaf9ccc978 ID=616 Task <4BA2CF65-A1AC-444A-832B-E702EBB2A1E6>.<345> received response, status 200 content K
default	10:26:52.759346-0500	RedLemon	Task <4BA2CF65-A1AC-444A-832B-E702EBB2A1E6>.<345> response ended
default	10:26:52.759886-0500	RedLemon	Task <4BA2CF65-A1AC-444A-832B-E702EBB2A1E6>.<345> done using Connection 3
default	10:26:52.760268-0500	RedLemon	Task <4BA2CF65-A1AC-444A-832B-E702EBB2A1E6>.<345> summary for task success {transaction_duration_ms=77, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=75, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=false}
default	10:26:52.761106-0500	RedLemon	Task <4BA2CF65-A1AC-444A-832B-E702EBB2A1E6>.<345> finished successfully
default	10:26:52.762218-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [anon<RedLemon>(501):6145] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:173-6145-2154 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:52.762552-0500	runningboardd	Assertion 173-6145-2154 (target:[anon<RedLemon>(501):6145]) will be created as active as no start-time-defining assertions exist
default	10:26:52.765147-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:52.765275-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:52.765374-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:52.769319-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6145] from originator [daemon<com.apple.powerd>:114] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:173-114-2155 target:6145 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	10:26:52.769577-0500	runningboardd	Assertion 173-114-2155 (target:[anon<RedLemon>(501):6145]) will be created as active
default	10:26:52.770701-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:52.770780-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:52.770837-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:52.793773-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	10:26:52.861784-0500	RedLemon	🔍 MPV track-list/count: 0
default	10:26:52.862020-0500	RedLemon	📊 Total subtitle tracks found: 1 (including Off if needed)
default	10:26:53.862869-0500	RedLemon	Task <284A362E-6B8D-41DC-9EFD-94F768256291>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	10:26:53.864082-0500	runningboardd	Invalidating assertion 173-6145-2154 (target:[anon<RedLemon>(501):6145]) from originator [anon<RedLemon>(501):6145]
default	10:26:53.863884-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DF676AEB-0C11-411C-90C0-A8C168B6795A] (reporting strategy default)> on Task <284A362E-6B8D-41DC-9EFD-94F768256291>.<1> was not selected for reporting
default	10:26:53.865326-0500	RedLemon	Task <284A362E-6B8D-41DC-9EFD-94F768256291>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	10:26:53.866241-0500	RedLemon	Connection 54: enabling TLS
default	10:26:53.866313-0500	RedLemon	Connection 54: starting, TC(0x0)
default	10:26:53.866411-0500	RedLemon	[C54 8B6615E3-A9B3-4FBE-A43F-6052D4E86FB8 Hostname#9081a023:443 tcp, url hash: dc220872, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{E281FB5E-BBEF-4857-88A8-C2DBD17200CC}{(null)}{Y}{2} (private), proc: FA056963-4751-3C92-B931-FEB284B88616] start
default	10:26:53.866580-0500	RedLemon	[C54 Hostname#9081a023:443 initial path ((null))] event: path:start @0.000s
default	10:26:53.867211-0500	RedLemon	[C54 Hostname#9081a023:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: EAAF9B2D-C2D5-4CA6-B642-2E44C9DE0E2A
default	10:26:53.867558-0500	RedLemon	[C54 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	10:26:53.867635-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C54] reporting state preparing
default	10:26:53.867997-0500	mDNSResponder	[R2247] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, options: 0x8 {use-failover}, client pid: 6145 (RedLemon)
default	10:26:53.867938-0500	RedLemon	Task <284A362E-6B8D-41DC-9EFD-94F768256291>.<1> setting up Connection 54
default	10:26:53.870680-0500	mDNSResponder	[R2247] getaddrinfo stop -- hostname: <mask.hash: 'jI96yAwj7m+UOTxfmAXogQ=='>, client pid: 6145 (RedLemon)
default	10:26:53.871032-0500	RedLemon	nw_endpoint_resolver_update [C54 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#e597c525:443
default	10:26:53.871289-0500	RedLemon	[C54 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.004s
default	10:26:53.871594-0500	RedLemon	[C54.1 IPv4#e597c525:443 initial path ((null))] event: path:start @0.005s
default	10:26:53.872031-0500	RedLemon	[C54.1 IPv4#e597c525:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.005s, uuid: 3FC4E40D-2083-4869-BFCE-DAB3E9C89162
default	10:26:53.872210-0500	RedLemon	[C54.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.005s
default	10:26:53.872925-0500	RedLemon	[C54.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.006s
default	10:26:53.873861-0500	RedLemon	[C54.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.007s
default	10:26:53.874034-0500	RedLemon	tcp_output [C54.1:3] flags=[S] seq=2581576142, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2581576142
default	10:26:53.999243-0500	RedLemon	tcp_input [C54.1:3] flags=[S.] seq=3429680907, ack=2581576143, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2581576142
default	10:26:53.999430-0500	RedLemon	nw_flow_connected [C54.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	10:26:54.999675-0500	RedLemon	[C54.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.133s
default	10:26:54.999797-0500	RedLemon	[C54 Hostname#9081a023:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.133s
default	10:26:54.000473-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C54.1:2][0x7fbaf6366f60] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	10:26:54.000686-0500	RedLemon	boringssl_context_info_handler(2028) [C54.1:2][0x7fbaf6366f60] Client handshake started
default	10:26:54.001051-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS client enter_early_data
default	10:26:54.001292-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS client read_server_hello
default	10:26:54.033081-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring jetsam update because this process is not memory-managed
default	10:26:54.033375-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring suspend because this process is not lifecycle managed
default	10:26:54.033830-0500	runningboardd	[anon<RedLemon>(501):6145] Ignoring GPU update because this process is not GPU managed
default	10:26:54.035984-0500	runningboardd	Invalidating assertion 173-114-2155 (target:[anon<RedLemon>(501):6145]) from originator [daemon<com.apple.powerd>:114]
default	10:26:54.125101-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client read_hello_retry_request
default	10:26:54.125296-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client read_server_hello
default	10:26:54.125963-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	10:26:54.126683-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client read_certificate_request
default	10:26:54.127295-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client read_server_certificate
default	10:26:54.127424-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	10:26:54.128484-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C54.1:2][0x7fbaf6366f60] Performing external trust evaluation
default	10:26:54.128767-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C54.1:2][0x7fbaf6366f60] Asyncing for external verify block
default	10:26:54.129116-0500	RedLemon	Connection 54: asked to evaluate TLS Trust
default	10:26:54.129678-0500	RedLemon	Task <284A362E-6B8D-41DC-9EFD-94F768256291>.<1> auth completion disp=1 cred=0x0
default	10:26:54.138895-0500	RedLemon	Connection 54: TLS Trust result 0
default	10:26:54.138950-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C54.1:2][0x7fbaf6366f60] Returning from external verify block with result: true
default	10:26:54.139005-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C54.1:2][0x7fbaf6366f60] Certificate verification result: OK
default	10:26:54.139357-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client read_server_finished
default	10:26:54.139534-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client send_end_of_early_data
default	10:26:54.139558-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	10:26:54.139604-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client send_client_certificate
default	10:26:54.139638-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client complete_second_flight
default	10:26:54.139811-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS 1.3 client done
default	10:26:54.140002-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS client finish_client_handshake
default	10:26:54.140052-0500	RedLemon	boringssl_context_info_handler(2045) [C54.1:2][0x7fbaf6366f60] Client handshake state: TLS client done
default	10:26:54.140119-0500	RedLemon	boringssl_context_info_handler(2034) [C54.1:2][0x7fbaf6366f60] Client handshake done
default	10:26:54.140724-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C54.1:2][0x7fbaf6366f60] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(140ms) flight_time(126ms) rtt(125ms) write_stalls(0) read_stalls(6)]
default	10:26:54.140964-0500	RedLemon	nw_flow_connected [C54.1 IPv4#e597c525:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2220563743)
default	10:26:54.141304-0500	RedLemon	[C54.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.274s
default	10:26:54.141628-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C54] reporting state ready
default	10:26:54.141695-0500	RedLemon	[C54 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.275s
default	10:26:54.141835-0500	RedLemon	[C54.1 IPv4#e597c525:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.275s
default	10:26:54.141906-0500	RedLemon	[C54 Hostname#9081a023:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.275s
default	10:26:54.142225-0500	RedLemon	Connection 54: connected successfully
default	10:26:54.142280-0500	RedLemon	Connection 54: TLS handshake complete
default	10:26:54.143059-0500	RedLemon	Connection 54: ready C(N) E(N)
default	10:26:54.143331-0500	RedLemon	Task <284A362E-6B8D-41DC-9EFD-94F768256291>.<1> now using Connection 54
default	10:26:54.143443-0500	RedLemon	Connection 54: received viability advisory(Y)
default	10:26:54.143848-0500	RedLemon	Task <284A362E-6B8D-41DC-9EFD-94F768256291>.<1> sent request, body N 0
