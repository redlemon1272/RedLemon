default	16:41:21.628423-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "frontmost:6308" ID:169-129-1760 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	16:41:21.628875-0500	runningboardd	Assertion 169-129-1760 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:21.646215-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:21.647588-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:21.647861-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "notification:6308" ID:169-129-1761 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	16:41:21.653387-0500	runningboardd	Assertion 169-129-1761 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:21.652688-0500	runningboardd	[anon<RedLemon>(501):6308] Set darwin role to: UserInteractiveFocal
default	16:41:21.653508-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:21.655272-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:21.657982-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:21.658037-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:23.147253-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:41:23.147572-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [95E5AB64-2EE2-4800-918C-A55D4472451F] (reporting strategy default)> on Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> was not selected for reporting
default	16:41:23.148085-0500	RedLemon	Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:41:23.148236-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:23.148488-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7EEA1AA0-FB1E-4936-84C4-9F544C445B7D] (reporting strategy default)> on Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> was not selected for reporting
default	16:41:23.148467-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	16:41:23.149056-0500	RedLemon	Connection 37: enabling TLS
default	16:41:23.149383-0500	RedLemon	Connection 37: starting, TC(0x0)
default	16:41:23.149547-0500	RedLemon	[C37 B182F655-AFF1-42B4-82A3-2BB77565BD40 Hostname#5a828566:443 quic-connection, url hash: 8005778e, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{8CB16F14-934A-4C1E-BB68-BE6FF0746A5B}{(null)}{Y}{2} (private), proc: 12180268-3769-3688-9AA2-A4113A2F44C4] start
default	16:41:23.149771-0500	RedLemon	[C37 Hostname#5a828566:443 initial path ((null))] event: path:start @0.000s
default	16:41:23.150171-0500	RedLemon	[C37 Hostname#5a828566:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: DCD2828C-7E38-4209-BD56-C2799267831C
default	16:41:23.150326-0500	RedLemon	[C37 Hostname#5a828566:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	16:41:23.150360-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C37] reporting state preparing
default	16:41:23.150609-0500	RedLemon	[C37.1 Hostname#5a828566:443 initial path ((null))] event: path:start @0.000s
default	16:41:23.150918-0500	RedLemon	[C37.1 Hostname#5a828566:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: 2C7BF51D-54DF-42E8-A056-7D630BFEDA41
default	16:41:23.151101-0500	RedLemon	[C37.1 Hostname#5a828566:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	16:41:23.151257-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> setting up Connection 37
default	16:41:23.151988-0500	mDNSResponder	[R1082] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'z5LN/js6tAYV2drtLzzUoQ=='>, options: 0x8 {use-failover}, client pid: 6308 (RedLemon)
default	16:41:23.151458-0500	RedLemon	Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:23.151540-0500	RedLemon	Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> waiting for setup of Connection 37
default	16:41:23.200555-0500	mDNSResponder	[R1082] getaddrinfo stop -- hostname: <mask.hash: 'z5LN/js6tAYV2drtLzzUoQ=='>, client pid: 6308 (RedLemon)
default	16:41:23.200921-0500	RedLemon	nw_endpoint_resolver_update [C37.1 Hostname#5a828566:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#1a273ade.443
default	16:41:23.201092-0500	RedLemon	nw_endpoint_resolver_update [C37.1 Hostname#5a828566:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#8ed0db6d:443
default	16:41:23.201267-0500	RedLemon	[C37.1 Hostname#5a828566:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.051s
default	16:41:23.201566-0500	RedLemon	[C37.1.1 IPv6#1a273ade.443 initial path ((null))] event: path:start @0.051s
default	16:41:23.202003-0500	RedLemon	[C37.1.1 IPv6#1a273ade.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.052s, uuid: 32F6E45D-0EF1-4111-A336-EB823367A2DA
default	16:41:23.202177-0500	RedLemon	[C37.1.1 IPv6#1a273ade.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.052s
default	16:41:23.202749-0500	RedLemon	[C37.1.1 IPv6#1a273ade.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.053s
default	16:41:23.203449-0500	RedLemon	[C37.1.1 IPv6#1a273ade.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.053s
default	16:41:23.203718-0500	RedLemon	tcp_output [C37.1.1:3] flags=[S] seq=3554862599, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3554862599
default	16:41:23.217916-0500	RedLemon	tcp_input [C37.1.1:3] flags=[S.] seq=2316107602, ack=3554862600, win=31416 state=SYN_SENT rcv_nxt=0, snd_una=3554862599
default	16:41:23.218568-0500	RedLemon	nw_flow_connected [C37.1.1 IPv6#1a273ade.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:41:23.218863-0500	RedLemon	[C37.1.1 IPv6#1a273ade.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.069s
default	16:41:23.219054-0500	RedLemon	[C37.1 Hostname#5a828566:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.069s
default	16:41:23.219106-0500	RedLemon	[C37 Hostname#5a828566:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.069s
default	16:41:23.219491-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C37.1.1:2][0x7fe2389a7e20] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:41:23.219666-0500	RedLemon	boringssl_context_info_handler(2028) [C37.1.1:2][0x7fe2389a7e20] Client handshake started
default	16:41:23.219886-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS client enter_early_data
default	16:41:23.220005-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS client read_server_hello
default	16:41:23.245786-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:41:23.245907-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client read_server_hello
default	16:41:23.246202-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:41:23.246578-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client read_certificate_request
default	16:41:23.247301-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client read_server_certificate
default	16:41:23.247383-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:41:23.248836-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C37.1.1:2][0x7fe2389a7e20] Performing external trust evaluation
default	16:41:23.249006-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C37.1.1:2][0x7fe2389a7e20] Asyncing for external verify block
default	16:41:23.249259-0500	RedLemon	Connection 37: asked to evaluate TLS Trust
default	16:41:23.250217-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> auth completion disp=1 cred=0x0
default	16:41:23.257704-0500	RedLemon	Connection 37: TLS Trust result 0
default	16:41:23.259659-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C37.1.1:2][0x7fe2389a7e20] Returning from external verify block with result: true
default	16:41:23.259727-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C37.1.1:2][0x7fe2389a7e20] Certificate verification result: OK
default	16:41:23.260207-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client read_server_finished
default	16:41:23.260476-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:41:23.260508-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:41:23.260539-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client send_client_certificate
default	16:41:23.260567-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client complete_second_flight
default	16:41:23.260684-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS 1.3 client done
default	16:41:23.260904-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS client finish_client_handshake
default	16:41:23.260943-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1.1:2][0x7fe2389a7e20] Client handshake state: TLS client done
default	16:41:23.260974-0500	RedLemon	boringssl_context_info_handler(2034) [C37.1.1:2][0x7fe2389a7e20] Client handshake done
default	16:41:23.261539-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C37.1.1:2][0x7fe2389a7e20] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(42ms) flight_time(27ms) rtt(26ms) write_stalls(0) read_stalls(6)]
default	16:41:23.261686-0500	RedLemon	nw_flow_connected [C37.1.1 IPv6#1a273ade.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-636241346)
default	16:41:23.262427-0500	RedLemon	[C37.1.1 IPv6#1a273ade.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.112s
default	16:41:23.262514-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C37] reporting state ready
default	16:41:23.262603-0500	RedLemon	[C37.1 Hostname#5a828566:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.112s
default	16:41:23.262631-0500	RedLemon	[C37 Hostname#5a828566:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.112s
default	16:41:23.262768-0500	RedLemon	[C37.1.1 IPv6#1a273ade.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.113s
default	16:41:23.262876-0500	RedLemon	[C37.1 Hostname#5a828566:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.113s
default	16:41:23.262922-0500	RedLemon	[C37 Hostname#5a828566:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.113s
default	16:41:23.263044-0500	RedLemon	Connection 37: connected successfully
default	16:41:23.263091-0500	RedLemon	Connection 37: TLS handshake complete
default	16:41:23.263315-0500	RedLemon	Connection 37: ready C(N) E(N)
default	16:41:23.263643-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> now using Connection 37
default	16:41:23.263755-0500	RedLemon	Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> now using Connection 37
default	16:41:23.263803-0500	RedLemon	Connection 37: received viability advisory(Y)
default	16:41:23.263879-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> sent request, body N 0
default	16:41:23.263899-0500	RedLemon	Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> sent request, body N 0
default	16:41:23.306611-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> received response, status 200 content K
default	16:41:23.330528-0500	RedLemon	Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:23.331068-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6D60EDDA-4196-4E25-AF70-77D6F198DDF1] (reporting strategy default)> on Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> was not selected for reporting
default	16:41:23.332180-0500	RedLemon	Connection 38: enabling TLS
default	16:41:23.332216-0500	RedLemon	Connection 38: starting, TC(0x0)
default	16:41:23.332262-0500	RedLemon	[C38 EA959C32-C0D5-4DC6-9240-C32DB4C59CBF Hostname#316a8648:443 tcp, url hash: 028c1bce, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{7529F084-3581-4320-A751-2B62136340AF}{(null)}{Y}{2} (private), proc: 12180268-3769-3688-9AA2-A4113A2F44C4] start
default	16:41:23.332335-0500	RedLemon	[C38 Hostname#316a8648:443 initial path ((null))] event: path:start @0.000s
default	16:41:23.332673-0500	RedLemon	[C38 Hostname#316a8648:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 6487DF09-62B8-4A88-AB50-29E8BC8CBCD5
default	16:41:23.332854-0500	RedLemon	[C38 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	16:41:23.332891-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state preparing
default	16:41:23.333051-0500	RedLemon	Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> setting up Connection 38
default	16:41:23.333465-0500	mDNSResponder	[R1083] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'LfJOt0PdXD49Vu8v884VSw=='>, options: 0x8 {use-failover}, client pid: 6308 (RedLemon)
default	16:41:23.354979-0500	RedLemon	Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> received response, status 200 content K
default	16:41:23.372132-0500	mDNSResponder	[R1083] getaddrinfo stop -- hostname: <mask.hash: 'LfJOt0PdXD49Vu8v884VSw=='>, client pid: 6308 (RedLemon)
default	16:41:23.372677-0500	RedLemon	nw_endpoint_resolver_update [C38 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#f44b3bd4:443
default	16:41:23.373003-0500	RedLemon	nw_endpoint_resolver_update [C38 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#dba0a053:443
default	16:41:23.373248-0500	RedLemon	[C38 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.040s
default	16:41:23.373492-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 initial path ((null))] event: path:start @0.041s
default	16:41:23.374604-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.042s, uuid: C91DF3DB-7EE4-4BBB-9186-FADFA412E598
default	16:41:23.375739-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.043s
default	16:41:23.377161-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.044s
default	16:41:23.379229-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.046s
default	16:41:23.379507-0500	RedLemon	tcp_output [C38.1:3] flags=[S] seq=3319207152, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3319207152
default	16:41:23.451889-0500	RedLemon	tcp_output [C38.1:3] flags=[S] seq=3319207152, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3319207152
default	16:41:23.467967-0500	RedLemon	Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> done using Connection 37
default	16:41:23.468178-0500	RedLemon	Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> response ended
default	16:41:23.468713-0500	RedLemon	Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> summary for task success {transaction_duration_ms=319, response_status=200, connection=37, reused=1, request_start_ms=115, request_duration_ms=0, response_start_ms=206, response_duration_ms=113, request_bytes=42, response_bytes=117785, cache_hit=false}
default	16:41:23.468827-0500	RedLemon	Task <7868A684-1F24-4013-A0CE-E6A5B22CA50F>.<640> finished successfully
default	16:41:23.471647-0500	RedLemon	tcp_input [C38.1:3] flags=[S.] seq=1277023091, ack=3319207153, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3319207152
default	16:41:23.471801-0500	RedLemon	nw_flow_connected [C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:41:23.471931-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.139s
default	16:41:23.471980-0500	RedLemon	[C38 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.139s
default	16:41:23.472377-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C38.1:2][0x7fe23bcc2250] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:41:23.472599-0500	RedLemon	boringssl_context_info_handler(2028) [C38.1:2][0x7fe23bcc2250] Client handshake started
default	16:41:23.472848-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS client enter_early_data
default	16:41:23.473206-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS client read_server_hello
default	16:41:23.500981-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:41:23.501096-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client read_server_hello
default	16:41:23.501380-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:41:23.501795-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client read_certificate_request
default	16:41:23.502070-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client read_server_certificate
default	16:41:23.502201-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:41:23.503505-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C38.1:2][0x7fe23bcc2250] Performing external trust evaluation
default	16:41:23.503961-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C38.1:2][0x7fe23bcc2250] Asyncing for external verify block
default	16:41:23.504935-0500	RedLemon	Connection 38: asked to evaluate TLS Trust
default	16:41:23.506309-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> done using Connection 37
default	16:41:23.506319-0500	RedLemon	Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> auth completion disp=1 cred=0x0
default	16:41:23.506469-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> response ended
default	16:41:23.507206-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> summary for task success {transaction_duration_ms=359, response_status=200, connection=37, protocol="h2", domain_lookup_duration_ms=50, connect_duration_ms=59, secure_connection_duration_ms=42, private_relay=false, request_start_ms=116, request_duration_ms=0, response_start_ms=158, response_duration_ms=200, request_bytes=128, response_bytes=1015596, cache_hit=false}
default	16:41:23.507311-0500	RedLemon	Task <6375CA58-79FF-4ED4-8EAB-7F3EE01A2B75>.<639> finished successfully
default	16:41:23.519896-0500	RedLemon	Connection 38: TLS Trust result 0
default	16:41:23.519968-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C38.1:2][0x7fe23bcc2250] Returning from external verify block with result: true
default	16:41:23.520080-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C38.1:2][0x7fe23bcc2250] Certificate verification result: OK
default	16:41:23.520723-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client read_server_finished
default	16:41:23.520881-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:41:23.520920-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:41:23.520952-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client send_client_certificate
default	16:41:23.520983-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client complete_second_flight
default	16:41:23.521125-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS 1.3 client done
default	16:41:23.521328-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS client finish_client_handshake
default	16:41:23.521372-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe23bcc2250] Client handshake state: TLS client done
default	16:41:23.521404-0500	RedLemon	boringssl_context_info_handler(2034) [C38.1:2][0x7fe23bcc2250] Client handshake done
default	16:41:23.522145-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C38.1:2][0x7fe23bcc2250] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(49ms) flight_time(28ms) rtt(28ms) write_stalls(0) read_stalls(6)]
default	16:41:23.522475-0500	RedLemon	nw_flow_connected [C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-636241346)
default	16:41:23.522737-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.190s
default	16:41:23.523185-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state ready
default	16:41:23.524482-0500	RedLemon	[C38 Hostname#316a8648:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.192s
default	16:41:23.524759-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.192s
default	16:41:23.524889-0500	RedLemon	[C38 Hostname#316a8648:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.192s
default	16:41:23.525103-0500	RedLemon	Connection 38: connected successfully
default	16:41:23.525197-0500	RedLemon	Connection 38: TLS handshake complete
default	16:41:23.525532-0500	RedLemon	Connection 38: ready C(N) E(N)
default	16:41:23.525795-0500	RedLemon	Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> now using Connection 38
default	16:41:23.525960-0500	RedLemon	Connection 38: received viability advisory(Y)
default	16:41:23.526978-0500	RedLemon	Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> sent request, body N 0
default	16:41:23.547374-0500	RedLemon	<private>
default	16:41:23.547506-0500	RedLemon	<private>
default	16:41:23.547612-0500	RedLemon	<private>
default	16:41:23.547713-0500	RedLemon	<private>
default	16:41:23.668751-0500	RedLemon	Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> received response, status 101 content U
default	16:41:23.669152-0500	RedLemon	Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> response ended
default	16:41:23.669255-0500	RedLemon	Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> done using Connection 38
default	16:41:23.670197-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.337s
default	16:41:23.670285-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state preparing
default	16:41:23.670391-0500	RedLemon	[C38 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.338s
default	16:41:23.670605-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.338s
default	16:41:23.670700-0500	RedLemon	[C38 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.338s
default	16:41:23.670813-0500	RedLemon	nw_flow_connected [C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:41:23.671289-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1764 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:23.671010-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.338s
default	16:41:23.671083-0500	RedLemon	[C38 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.338s
default	16:41:23.671237-0500	RedLemon	nw_flow_connected [C38.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-636241346)
default	16:41:23.672126-0500	RedLemon	[C38.1 IPv4#f44b3bd4:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.339s
default	16:41:23.672174-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state ready
default	16:41:23.672348-0500	RedLemon	[C38 Hostname#316a8648:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.340s
default	16:41:23.673146-0500	runningboardd	Assertion 169-6308-1764 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:23.675390-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:23.675457-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:23.675513-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:23.678524-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1765 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:23.678809-0500	runningboardd	Assertion 169-103-1765 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:23.681055-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:23.681106-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:23.681152-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:24.780945-0500	runningboardd	Invalidating assertion 169-6308-1764 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:24.943896-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:24.943938-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:24.943981-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:24.944958-0500	runningboardd	Invalidating assertion 169-103-1765 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:25.049931-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:25.050443-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:25.050502-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:25.097184-0500	RedLemon	Task <EE601237-38F6-4DB3-9317-ABB6AE7CF16D>.<641> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.097475-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2B6CEFD7-19B3-403E-AF32-B6E1D44DC874] (reporting strategy default)> on Task <EE601237-38F6-4DB3-9317-ABB6AE7CF16D>.<641> was not selected for reporting
default	16:41:25.098052-0500	RedLemon	Task <EE601237-38F6-4DB3-9317-ABB6AE7CF16D>.<641> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.098228-0500	RedLemon	Task <EE601237-38F6-4DB3-9317-ABB6AE7CF16D>.<641> now using Connection 1
default	16:41:25.098989-0500	RedLemon	0x7fe23c36e318 ID=2308 Task <EE601237-38F6-4DB3-9317-ABB6AE7CF16D>.<641> sent request, body N 0
default	16:41:25.209223-0500	RedLemon	0x7fe23c36e318 ID=2308 Task <EE601237-38F6-4DB3-9317-ABB6AE7CF16D>.<641> received response, status 200 content U
default	16:41:25.210880-0500	RedLemon	Task <EE601237-38F6-4DB3-9317-ABB6AE7CF16D>.<641> response ended
default	16:41:25.211666-0500	RedLemon	Task <EE601237-38F6-4DB3-9317-ABB6AE7CF16D>.<641> done using Connection 1
default	16:41:25.212018-0500	RedLemon	Task <EE601237-38F6-4DB3-9317-ABB6AE7CF16D>.<641> summary for task success {transaction_duration_ms=114, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=111, response_duration_ms=2, request_bytes=534, response_bytes=1884, cache_hit=false}
default	16:41:25.212605-0500	RedLemon	Task <EE601237-38F6-4DB3-9317-ABB6AE7CF16D>.<641> finished successfully
default	16:41:25.214263-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1766 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:25.214452-0500	runningboardd	Assertion 169-6308-1766 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:25.215996-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:25.216051-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:25.216103-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:25.217926-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1767 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:25.218702-0500	runningboardd	Assertion 169-103-1767 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:25.220520-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:25.220597-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:25.220647-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:25.230693-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:25.234101-0500	RedLemon	Task <B3F76426-8DF7-4EC8-AFC3-B65A3AEB2D7C>.<642> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.234406-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0F94EF8E-82F8-416A-B3C6-7A812A9BF5F9] (reporting strategy default)> on Task <B3F76426-8DF7-4EC8-AFC3-B65A3AEB2D7C>.<642> was not selected for reporting
default	16:41:25.235012-0500	RedLemon	Task <B3F76426-8DF7-4EC8-AFC3-B65A3AEB2D7C>.<642> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.235196-0500	RedLemon	Task <B3F76426-8DF7-4EC8-AFC3-B65A3AEB2D7C>.<642> now using Connection 1
default	16:41:25.235934-0500	RedLemon	0x7fe23c36e318 ID=2312 Task <B3F76426-8DF7-4EC8-AFC3-B65A3AEB2D7C>.<642> sent request, body N 0
default	16:41:25.306096-0500	RedLemon	0x7fe23c36e318 ID=2312 Task <B3F76426-8DF7-4EC8-AFC3-B65A3AEB2D7C>.<642> received response, status 200 content U
default	16:41:25.306706-0500	RedLemon	Task <B3F76426-8DF7-4EC8-AFC3-B65A3AEB2D7C>.<642> response ended
default	16:41:25.307142-0500	RedLemon	Task <B3F76426-8DF7-4EC8-AFC3-B65A3AEB2D7C>.<642> done using Connection 1
default	16:41:25.307364-0500	RedLemon	Task <B3F76426-8DF7-4EC8-AFC3-B65A3AEB2D7C>.<642> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=71, response_duration_ms=1, request_bytes=511, response_bytes=790, cache_hit=false}
default	16:41:25.307810-0500	RedLemon	Task <B3F76426-8DF7-4EC8-AFC3-B65A3AEB2D7C>.<642> finished successfully
default	16:41:25.309120-0500	RedLemon	Task <226782FD-4160-4031-A926-6AF85F16C147>.<643> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.309561-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D43E5A00-1F9B-471F-A320-3C086B6339F5] (reporting strategy default)> on Task <226782FD-4160-4031-A926-6AF85F16C147>.<643> was not selected for reporting
default	16:41:25.310420-0500	RedLemon	Task <226782FD-4160-4031-A926-6AF85F16C147>.<643> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.310786-0500	RedLemon	Task <226782FD-4160-4031-A926-6AF85F16C147>.<643> now using Connection 1
default	16:41:25.312488-0500	RedLemon	0x7fe23bf3d648 ID=2316 Task <226782FD-4160-4031-A926-6AF85F16C147>.<643> sent request, body N 0
default	16:41:25.326587-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:25.368370-0500	RedLemon	0x7fe23bf3d648 ID=2316 Task <226782FD-4160-4031-A926-6AF85F16C147>.<643> received response, status 200 content U
default	16:41:25.369271-0500	RedLemon	Task <226782FD-4160-4031-A926-6AF85F16C147>.<643> response ended
default	16:41:25.369617-0500	RedLemon	Task <226782FD-4160-4031-A926-6AF85F16C147>.<643> done using Connection 1
default	16:41:25.369760-0500	RedLemon	Task <226782FD-4160-4031-A926-6AF85F16C147>.<643> summary for task success {transaction_duration_ms=59, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=58, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	16:41:25.370210-0500	RedLemon	Task <226782FD-4160-4031-A926-6AF85F16C147>.<643> finished successfully
default	16:41:25.371664-0500	RedLemon	Task <13450038-7A2D-4DA6-9E0B-74185A5CFE1B>.<644> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.371993-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B1DB280F-6E35-4DC5-96FE-5B5B1331F026] (reporting strategy default)> on Task <13450038-7A2D-4DA6-9E0B-74185A5CFE1B>.<644> was not selected for reporting
default	16:41:25.372709-0500	RedLemon	Task <13450038-7A2D-4DA6-9E0B-74185A5CFE1B>.<644> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.372983-0500	RedLemon	Task <13450038-7A2D-4DA6-9E0B-74185A5CFE1B>.<644> now using Connection 1
default	16:41:25.373848-0500	RedLemon	0x7fe238b73e78 ID=2320 Task <13450038-7A2D-4DA6-9E0B-74185A5CFE1B>.<644> sent request, body N 0
default	16:41:25.389223-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:25.438776-0500	RedLemon	0x7fe238b73e78 ID=2320 Task <13450038-7A2D-4DA6-9E0B-74185A5CFE1B>.<644> received response, status 200 content U
default	16:41:25.440222-0500	RedLemon	Task <13450038-7A2D-4DA6-9E0B-74185A5CFE1B>.<644> response ended
default	16:41:25.441476-0500	RedLemon	Task <13450038-7A2D-4DA6-9E0B-74185A5CFE1B>.<644> done using Connection 1
default	16:41:25.441684-0500	RedLemon	Task <13450038-7A2D-4DA6-9E0B-74185A5CFE1B>.<644> summary for task success {transaction_duration_ms=69, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=66, response_duration_ms=3, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:41:25.442003-0500	RedLemon	Task <13450038-7A2D-4DA6-9E0B-74185A5CFE1B>.<644> finished successfully
default	16:41:25.443759-0500	RedLemon	Task <02BEBBAD-9AD8-465A-902B-2BF7931BBABF>.<645> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.444084-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2B08EE95-ECDC-458E-ADBE-EA0D5D77EC61] (reporting strategy default)> on Task <02BEBBAD-9AD8-465A-902B-2BF7931BBABF>.<645> was not selected for reporting
default	16:41:25.444811-0500	RedLemon	Task <02BEBBAD-9AD8-465A-902B-2BF7931BBABF>.<645> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.445004-0500	RedLemon	Task <02BEBBAD-9AD8-465A-902B-2BF7931BBABF>.<645> now using Connection 1
default	16:41:25.445848-0500	RedLemon	0x7fe23c36e318 ID=2324 Task <02BEBBAD-9AD8-465A-902B-2BF7931BBABF>.<645> sent request, body N 0
default	16:41:25.467696-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:25.515414-0500	RedLemon	0x7fe23c36e318 ID=2324 Task <02BEBBAD-9AD8-465A-902B-2BF7931BBABF>.<645> received response, status 200 content U
default	16:41:25.516278-0500	RedLemon	Task <02BEBBAD-9AD8-465A-902B-2BF7931BBABF>.<645> response ended
default	16:41:25.517215-0500	RedLemon	Task <02BEBBAD-9AD8-465A-902B-2BF7931BBABF>.<645> done using Connection 1
default	16:41:25.517733-0500	RedLemon	Task <02BEBBAD-9AD8-465A-902B-2BF7931BBABF>.<645> summary for task success {transaction_duration_ms=73, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=70, response_duration_ms=2, request_bytes=519, response_bytes=849, cache_hit=true}
default	16:41:25.518044-0500	RedLemon	Task <02BEBBAD-9AD8-465A-902B-2BF7931BBABF>.<645> finished successfully
default	16:41:25.520112-0500	RedLemon	Task <8469F7D5-78A6-4C3E-81BD-90442CB0C1BA>.<646> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.520431-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5804A19C-11E3-47BA-B524-85083FF24FE9] (reporting strategy default)> on Task <8469F7D5-78A6-4C3E-81BD-90442CB0C1BA>.<646> was not selected for reporting
default	16:41:25.521198-0500	RedLemon	Task <8469F7D5-78A6-4C3E-81BD-90442CB0C1BA>.<646> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.521395-0500	RedLemon	Task <8469F7D5-78A6-4C3E-81BD-90442CB0C1BA>.<646> now using Connection 1
default	16:41:25.522222-0500	RedLemon	0x7fe23c36e318 ID=2328 Task <8469F7D5-78A6-4C3E-81BD-90442CB0C1BA>.<646> sent request, body N 0
default	16:41:25.539536-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:25.579680-0500	RedLemon	0x7fe23c36e318 ID=2328 Task <8469F7D5-78A6-4C3E-81BD-90442CB0C1BA>.<646> received response, status 200 content U
default	16:41:25.580451-0500	RedLemon	Task <8469F7D5-78A6-4C3E-81BD-90442CB0C1BA>.<646> response ended
default	16:41:25.580799-0500	RedLemon	Task <8469F7D5-78A6-4C3E-81BD-90442CB0C1BA>.<646> done using Connection 1
default	16:41:25.581073-0500	RedLemon	Task <8469F7D5-78A6-4C3E-81BD-90442CB0C1BA>.<646> summary for task success {transaction_duration_ms=60, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=58, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:41:25.581250-0500	RedLemon	Task <8469F7D5-78A6-4C3E-81BD-90442CB0C1BA>.<646> finished successfully
default	16:41:25.582922-0500	RedLemon	Task <9359F1FC-FF5F-4E78-96BA-4A07C683940A>.<647> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.583233-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9857A1E5-8746-4759-974E-C2296529C59C] (reporting strategy default)> on Task <9359F1FC-FF5F-4E78-96BA-4A07C683940A>.<647> was not selected for reporting
default	16:41:25.584028-0500	RedLemon	Task <9359F1FC-FF5F-4E78-96BA-4A07C683940A>.<647> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.584275-0500	RedLemon	Task <9359F1FC-FF5F-4E78-96BA-4A07C683940A>.<647> now using Connection 1
default	16:41:25.585217-0500	RedLemon	0x7fe23c36e318 ID=2332 Task <9359F1FC-FF5F-4E78-96BA-4A07C683940A>.<647> sent request, body N 0
default	16:41:25.595824-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:25.691148-0500	RedLemon	0x7fe23c36e318 ID=2332 Task <9359F1FC-FF5F-4E78-96BA-4A07C683940A>.<647> received response, status 200 content U
default	16:41:25.692378-0500	RedLemon	Task <9359F1FC-FF5F-4E78-96BA-4A07C683940A>.<647> response ended
default	16:41:25.693085-0500	RedLemon	Task <9359F1FC-FF5F-4E78-96BA-4A07C683940A>.<647> done using Connection 1
default	16:41:25.693274-0500	RedLemon	Task <9359F1FC-FF5F-4E78-96BA-4A07C683940A>.<647> summary for task success {transaction_duration_ms=109, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=107, response_duration_ms=2, request_bytes=511, response_bytes=834, cache_hit=true}
default	16:41:25.693500-0500	RedLemon	Task <9359F1FC-FF5F-4E78-96BA-4A07C683940A>.<647> finished successfully
default	16:41:25.694977-0500	RedLemon	Task <77758C5E-9389-497A-B23A-7DEC8A4203FE>.<648> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.695307-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C558C87E-0F89-4D51-BA66-CC8B8DC78FC6] (reporting strategy default)> on Task <77758C5E-9389-497A-B23A-7DEC8A4203FE>.<648> was not selected for reporting
default	16:41:25.696047-0500	RedLemon	Task <77758C5E-9389-497A-B23A-7DEC8A4203FE>.<648> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.696238-0500	RedLemon	Task <77758C5E-9389-497A-B23A-7DEC8A4203FE>.<648> now using Connection 1
default	16:41:25.697128-0500	RedLemon	0x7fe23c36e318 ID=2336 Task <77758C5E-9389-497A-B23A-7DEC8A4203FE>.<648> sent request, body N 0
default	16:41:25.711327-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:25.757667-0500	RedLemon	0x7fe23c36e318 ID=2336 Task <77758C5E-9389-497A-B23A-7DEC8A4203FE>.<648> received response, status 200 content U
default	16:41:25.758265-0500	RedLemon	Task <77758C5E-9389-497A-B23A-7DEC8A4203FE>.<648> response ended
default	16:41:25.758723-0500	RedLemon	Task <77758C5E-9389-497A-B23A-7DEC8A4203FE>.<648> done using Connection 1
default	16:41:25.758956-0500	RedLemon	Task <77758C5E-9389-497A-B23A-7DEC8A4203FE>.<648> summary for task success {transaction_duration_ms=63, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:41:25.759541-0500	RedLemon	Task <77758C5E-9389-497A-B23A-7DEC8A4203FE>.<648> finished successfully
default	16:41:25.761162-0500	RedLemon	Task <4976BF5B-E9EC-4172-B917-C144CECFB65C>.<649> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.761482-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [46E85E76-0CFC-4D6E-9DF0-EA7CD8401181] (reporting strategy default)> on Task <4976BF5B-E9EC-4172-B917-C144CECFB65C>.<649> was not selected for reporting
default	16:41:25.762192-0500	RedLemon	Task <4976BF5B-E9EC-4172-B917-C144CECFB65C>.<649> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.762386-0500	RedLemon	Task <4976BF5B-E9EC-4172-B917-C144CECFB65C>.<649> now using Connection 1
default	16:41:25.763478-0500	RedLemon	0x7fe23bf3d648 ID=2340 Task <4976BF5B-E9EC-4172-B917-C144CECFB65C>.<649> sent request, body N 0
default	16:41:25.777883-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:25.819670-0500	RedLemon	0x7fe23bf3d648 ID=2340 Task <4976BF5B-E9EC-4172-B917-C144CECFB65C>.<649> received response, status 200 content U
default	16:41:25.820884-0500	RedLemon	Task <4976BF5B-E9EC-4172-B917-C144CECFB65C>.<649> response ended
default	16:41:25.821351-0500	RedLemon	Task <4976BF5B-E9EC-4172-B917-C144CECFB65C>.<649> done using Connection 1
default	16:41:25.821759-0500	RedLemon	Task <4976BF5B-E9EC-4172-B917-C144CECFB65C>.<649> summary for task success {transaction_duration_ms=59, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=57, response_duration_ms=2, request_bytes=511, response_bytes=836, cache_hit=true}
default	16:41:25.822330-0500	RedLemon	Task <4976BF5B-E9EC-4172-B917-C144CECFB65C>.<649> finished successfully
default	16:41:25.824136-0500	RedLemon	Task <4A87DA74-D33F-467D-A954-FCA249AAFC5F>.<650> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.824455-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B7042F06-8FDF-4FBB-BAC6-7C0387915222] (reporting strategy default)> on Task <4A87DA74-D33F-467D-A954-FCA249AAFC5F>.<650> was not selected for reporting
default	16:41:25.825197-0500	RedLemon	Task <4A87DA74-D33F-467D-A954-FCA249AAFC5F>.<650> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.825407-0500	RedLemon	Task <4A87DA74-D33F-467D-A954-FCA249AAFC5F>.<650> now using Connection 1
default	16:41:25.826160-0500	RedLemon	0x7fe23bf3d648 ID=2344 Task <4A87DA74-D33F-467D-A954-FCA249AAFC5F>.<650> sent request, body N 0
default	16:41:25.887619-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:25.933533-0500	RedLemon	0x7fe23bf3d648 ID=2344 Task <4A87DA74-D33F-467D-A954-FCA249AAFC5F>.<650> received response, status 200 content U
default	16:41:25.934115-0500	RedLemon	Task <4A87DA74-D33F-467D-A954-FCA249AAFC5F>.<650> response ended
default	16:41:25.934549-0500	RedLemon	Task <4A87DA74-D33F-467D-A954-FCA249AAFC5F>.<650> done using Connection 1
default	16:41:25.934775-0500	RedLemon	Task <4A87DA74-D33F-467D-A954-FCA249AAFC5F>.<650> summary for task success {transaction_duration_ms=109, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=108, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:41:25.935616-0500	RedLemon	Task <4A87DA74-D33F-467D-A954-FCA249AAFC5F>.<650> finished successfully
default	16:41:25.938025-0500	RedLemon	Task <2FF82B70-956A-44A4-A07F-A26893A79E84>.<651> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:25.938719-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BE4DD3A6-C251-437F-A4C0-9C18236F945C] (reporting strategy default)> on Task <2FF82B70-956A-44A4-A07F-A26893A79E84>.<651> was not selected for reporting
default	16:41:25.939538-0500	RedLemon	Task <2FF82B70-956A-44A4-A07F-A26893A79E84>.<651> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:25.939734-0500	RedLemon	Task <2FF82B70-956A-44A4-A07F-A26893A79E84>.<651> now using Connection 1
default	16:41:25.940531-0500	RedLemon	0x7fe23bf3d648 ID=2348 Task <2FF82B70-956A-44A4-A07F-A26893A79E84>.<651> sent request, body N 0
default	16:41:25.957441-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.015681-0500	RedLemon	0x7fe23bf3d648 ID=2348 Task <2FF82B70-956A-44A4-A07F-A26893A79E84>.<651> received response, status 200 content U
default	16:41:26.016284-0500	RedLemon	Task <2FF82B70-956A-44A4-A07F-A26893A79E84>.<651> response ended
default	16:41:26.016724-0500	RedLemon	Task <2FF82B70-956A-44A4-A07F-A26893A79E84>.<651> done using Connection 1
default	16:41:26.016949-0500	RedLemon	Task <2FF82B70-956A-44A4-A07F-A26893A79E84>.<651> summary for task success {transaction_duration_ms=77, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=76, response_duration_ms=1, request_bytes=511, response_bytes=839, cache_hit=true}
default	16:41:26.017713-0500	RedLemon	Task <2FF82B70-956A-44A4-A07F-A26893A79E84>.<651> finished successfully
default	16:41:26.019571-0500	RedLemon	Task <D6239A2A-AE6F-42A5-97D8-5F2AF31D5102>.<652> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.019874-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [80546C5F-3541-4F03-B82A-85BD3ABA93C3] (reporting strategy default)> on Task <D6239A2A-AE6F-42A5-97D8-5F2AF31D5102>.<652> was not selected for reporting
default	16:41:26.020636-0500	RedLemon	Task <D6239A2A-AE6F-42A5-97D8-5F2AF31D5102>.<652> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.020860-0500	RedLemon	Task <D6239A2A-AE6F-42A5-97D8-5F2AF31D5102>.<652> now using Connection 1
default	16:41:26.021688-0500	RedLemon	0x7fe23c36e318 ID=2352 Task <D6239A2A-AE6F-42A5-97D8-5F2AF31D5102>.<652> sent request, body N 0
default	16:41:26.029907-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.130970-0500	RedLemon	0x7fe23c36e318 ID=2352 Task <D6239A2A-AE6F-42A5-97D8-5F2AF31D5102>.<652> received response, status 200 content U
default	16:41:26.131705-0500	RedLemon	Task <D6239A2A-AE6F-42A5-97D8-5F2AF31D5102>.<652> response ended
default	16:41:26.132368-0500	RedLemon	Task <D6239A2A-AE6F-42A5-97D8-5F2AF31D5102>.<652> done using Connection 1
default	16:41:26.132846-0500	RedLemon	Task <D6239A2A-AE6F-42A5-97D8-5F2AF31D5102>.<652> summary for task success {transaction_duration_ms=112, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=110, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:41:26.133176-0500	RedLemon	Task <D6239A2A-AE6F-42A5-97D8-5F2AF31D5102>.<652> finished successfully
default	16:41:26.135263-0500	RedLemon	Task <4D81D4E7-2227-4971-8F45-51062DAB441F>.<653> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.135567-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [28B8C81C-C25B-458A-8658-795BAABADD8F] (reporting strategy default)> on Task <4D81D4E7-2227-4971-8F45-51062DAB441F>.<653> was not selected for reporting
default	16:41:26.136431-0500	RedLemon	Task <4D81D4E7-2227-4971-8F45-51062DAB441F>.<653> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.136635-0500	RedLemon	Task <4D81D4E7-2227-4971-8F45-51062DAB441F>.<653> now using Connection 1
default	16:41:26.137474-0500	RedLemon	0x7fe23c36e318 ID=2356 Task <4D81D4E7-2227-4971-8F45-51062DAB441F>.<653> sent request, body N 0
default	16:41:26.144838-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.243525-0500	RedLemon	0x7fe23c36e318 ID=2356 Task <4D81D4E7-2227-4971-8F45-51062DAB441F>.<653> received response, status 200 content U
default	16:41:26.244494-0500	RedLemon	Task <4D81D4E7-2227-4971-8F45-51062DAB441F>.<653> response ended
default	16:41:26.245038-0500	RedLemon	Task <4D81D4E7-2227-4971-8F45-51062DAB441F>.<653> done using Connection 1
default	16:41:26.245378-0500	RedLemon	Task <4D81D4E7-2227-4971-8F45-51062DAB441F>.<653> summary for task success {transaction_duration_ms=109, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=107, response_duration_ms=1, request_bytes=512, response_bytes=837, cache_hit=true}
default	16:41:26.246157-0500	RedLemon	Task <4D81D4E7-2227-4971-8F45-51062DAB441F>.<653> finished successfully
default	16:41:26.248740-0500	RedLemon	Task <C8D79899-DBE7-4A5E-AFC9-A6737A71F0E9>.<654> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.249296-0500	runningboardd	Invalidating assertion 169-6308-1766 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:26.249169-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [91998AEB-DDF9-4356-B34C-0799D98C0754] (reporting strategy default)> on Task <C8D79899-DBE7-4A5E-AFC9-A6737A71F0E9>.<654> was not selected for reporting
default	16:41:26.249931-0500	RedLemon	Task <C8D79899-DBE7-4A5E-AFC9-A6737A71F0E9>.<654> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.250171-0500	RedLemon	Task <C8D79899-DBE7-4A5E-AFC9-A6737A71F0E9>.<654> now using Connection 1
default	16:41:26.250947-0500	RedLemon	0x7fe23bf3d648 ID=2360 Task <C8D79899-DBE7-4A5E-AFC9-A6737A71F0E9>.<654> sent request, body N 0
default	16:41:26.256963-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.329574-0500	RedLemon	0x7fe23bf3d648 ID=2360 Task <C8D79899-DBE7-4A5E-AFC9-A6737A71F0E9>.<654> received response, status 200 content U
default	16:41:26.331506-0500	RedLemon	Task <C8D79899-DBE7-4A5E-AFC9-A6737A71F0E9>.<654> response ended
default	16:41:26.332350-0500	RedLemon	Task <C8D79899-DBE7-4A5E-AFC9-A6737A71F0E9>.<654> done using Connection 1
default	16:41:26.332791-0500	RedLemon	Task <C8D79899-DBE7-4A5E-AFC9-A6737A71F0E9>.<654> summary for task success {transaction_duration_ms=83, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=79, response_duration_ms=3, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:41:26.333412-0500	RedLemon	Task <C8D79899-DBE7-4A5E-AFC9-A6737A71F0E9>.<654> finished successfully
default	16:41:26.335021-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1768 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:26.335280-0500	runningboardd	Assertion 169-6308-1768 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:26.335717-0500	RedLemon	Task <7D2B5AF4-9FFB-4F46-A50A-3E50582E3AFB>.<655> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.336333-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [550792E5-AF92-43CB-9240-D9B45D59C009] (reporting strategy default)> on Task <7D2B5AF4-9FFB-4F46-A50A-3E50582E3AFB>.<655> was not selected for reporting
default	16:41:26.337183-0500	RedLemon	Task <7D2B5AF4-9FFB-4F46-A50A-3E50582E3AFB>.<655> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.337465-0500	RedLemon	Task <7D2B5AF4-9FFB-4F46-A50A-3E50582E3AFB>.<655> now using Connection 1
default	16:41:26.338681-0500	RedLemon	0x7fe23bf3d648 ID=2364 Task <7D2B5AF4-9FFB-4F46-A50A-3E50582E3AFB>.<655> sent request, body N 0
default	16:41:26.339433-0500	runningboardd	Attempting to rename power assertion 34089 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-6308-1766:com.apple.CFNetwork.StorageDB;169-6308-1768:com.apple.CFNetwork.StorageDB
default	16:41:26.339374-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:26.339493-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:26.339581-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:26.398741-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.413557-0500	runningboardd	Attempting to rename power assertion 34089 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-6308-1768:com.apple.CFNetwork.StorageDB
default	16:41:26.413639-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:26.413903-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:26.414045-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:26.443375-0500	RedLemon	0x7fe23bf3d648 ID=2364 Task <7D2B5AF4-9FFB-4F46-A50A-3E50582E3AFB>.<655> received response, status 200 content U
default	16:41:26.444108-0500	RedLemon	Task <7D2B5AF4-9FFB-4F46-A50A-3E50582E3AFB>.<655> response ended
default	16:41:26.444585-0500	RedLemon	Task <7D2B5AF4-9FFB-4F46-A50A-3E50582E3AFB>.<655> done using Connection 1
default	16:41:26.444730-0500	RedLemon	Task <7D2B5AF4-9FFB-4F46-A50A-3E50582E3AFB>.<655> summary for task success {transaction_duration_ms=108, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=106, response_duration_ms=1, request_bytes=511, response_bytes=836, cache_hit=true}
default	16:41:26.445200-0500	RedLemon	Task <7D2B5AF4-9FFB-4F46-A50A-3E50582E3AFB>.<655> finished successfully
default	16:41:26.446695-0500	RedLemon	Task <F127C94A-DC3E-4563-AE6F-BD25CB364390>.<656> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.447204-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [52392BED-52E5-4F35-BA92-53D93F6B004E] (reporting strategy default)> on Task <F127C94A-DC3E-4563-AE6F-BD25CB364390>.<656> was not selected for reporting
default	16:41:26.448160-0500	RedLemon	Task <F127C94A-DC3E-4563-AE6F-BD25CB364390>.<656> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.448498-0500	RedLemon	Task <F127C94A-DC3E-4563-AE6F-BD25CB364390>.<656> now using Connection 1
default	16:41:26.449420-0500	RedLemon	0x7fe23c36e318 ID=2368 Task <F127C94A-DC3E-4563-AE6F-BD25CB364390>.<656> sent request, body N 0
default	16:41:26.463732-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.508529-0500	RedLemon	0x7fe23c36e318 ID=2368 Task <F127C94A-DC3E-4563-AE6F-BD25CB364390>.<656> received response, status 200 content U
default	16:41:26.509890-0500	RedLemon	Task <F127C94A-DC3E-4563-AE6F-BD25CB364390>.<656> response ended
default	16:41:26.510416-0500	RedLemon	Task <F127C94A-DC3E-4563-AE6F-BD25CB364390>.<656> done using Connection 1
default	16:41:26.510657-0500	RedLemon	Task <F127C94A-DC3E-4563-AE6F-BD25CB364390>.<656> summary for task success {transaction_duration_ms=62, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=60, response_duration_ms=2, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:41:26.511316-0500	RedLemon	Task <F127C94A-DC3E-4563-AE6F-BD25CB364390>.<656> finished successfully
default	16:41:26.513000-0500	RedLemon	Task <66DB594C-4B14-47B6-BA90-2E9B8417C21E>.<657> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.513324-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7292E30F-201E-4FFD-A7F8-8D3F1974E950] (reporting strategy default)> on Task <66DB594C-4B14-47B6-BA90-2E9B8417C21E>.<657> was not selected for reporting
default	16:41:26.518121-0500	RedLemon	Task <66DB594C-4B14-47B6-BA90-2E9B8417C21E>.<657> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.518328-0500	RedLemon	Task <66DB594C-4B14-47B6-BA90-2E9B8417C21E>.<657> now using Connection 1
default	16:41:26.519155-0500	RedLemon	0x7fe23bf3d648 ID=2372 Task <66DB594C-4B14-47B6-BA90-2E9B8417C21E>.<657> sent request, body N 0
default	16:41:26.536441-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.589983-0500	RedLemon	0x7fe23bf3d648 ID=2372 Task <66DB594C-4B14-47B6-BA90-2E9B8417C21E>.<657> received response, status 200 content U
default	16:41:26.590373-0500	RedLemon	Task <66DB594C-4B14-47B6-BA90-2E9B8417C21E>.<657> response ended
default	16:41:26.590779-0500	RedLemon	Task <66DB594C-4B14-47B6-BA90-2E9B8417C21E>.<657> done using Connection 1
default	16:41:26.590956-0500	RedLemon	Task <66DB594C-4B14-47B6-BA90-2E9B8417C21E>.<657> summary for task success {transaction_duration_ms=77, response_status=200, connection=1, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=76, response_duration_ms=1, request_bytes=511, response_bytes=841, cache_hit=true}
default	16:41:26.591192-0500	RedLemon	Task <66DB594C-4B14-47B6-BA90-2E9B8417C21E>.<657> finished successfully
default	16:41:26.592632-0500	RedLemon	Task <C417FC43-8C56-47F7-893C-751F3C22BA2D>.<658> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.592957-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [20687162-F81A-45FC-BA4E-CDAC7FE4B995] (reporting strategy default)> on Task <C417FC43-8C56-47F7-893C-751F3C22BA2D>.<658> was not selected for reporting
default	16:41:26.593677-0500	RedLemon	Task <C417FC43-8C56-47F7-893C-751F3C22BA2D>.<658> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.593875-0500	RedLemon	Task <C417FC43-8C56-47F7-893C-751F3C22BA2D>.<658> now using Connection 1
default	16:41:26.594659-0500	RedLemon	0x7fe23bf3d648 ID=2376 Task <C417FC43-8C56-47F7-893C-751F3C22BA2D>.<658> sent request, body N 0
default	16:41:26.612613-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.655860-0500	RedLemon	0x7fe23bf3d648 ID=2376 Task <C417FC43-8C56-47F7-893C-751F3C22BA2D>.<658> received response, status 200 content U
default	16:41:26.657006-0500	RedLemon	Task <C417FC43-8C56-47F7-893C-751F3C22BA2D>.<658> response ended
default	16:41:26.657479-0500	RedLemon	Task <C417FC43-8C56-47F7-893C-751F3C22BA2D>.<658> done using Connection 1
default	16:41:26.657672-0500	RedLemon	Task <C417FC43-8C56-47F7-893C-751F3C22BA2D>.<658> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=846, cache_hit=true}
default	16:41:26.657879-0500	RedLemon	Task <C417FC43-8C56-47F7-893C-751F3C22BA2D>.<658> finished successfully
default	16:41:26.660188-0500	RedLemon	Task <C9DD7F8D-2637-45FA-AD80-6F00BC6BA64C>.<659> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.660569-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0CA5CC59-6B7F-4662-A150-DDD619BBBBC7] (reporting strategy default)> on Task <C9DD7F8D-2637-45FA-AD80-6F00BC6BA64C>.<659> was not selected for reporting
default	16:41:26.661371-0500	RedLemon	Task <C9DD7F8D-2637-45FA-AD80-6F00BC6BA64C>.<659> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.661649-0500	RedLemon	Task <C9DD7F8D-2637-45FA-AD80-6F00BC6BA64C>.<659> now using Connection 1
default	16:41:26.663100-0500	RedLemon	0x7fe238b73e78 ID=2380 Task <C9DD7F8D-2637-45FA-AD80-6F00BC6BA64C>.<659> sent request, body N 0
default	16:41:26.671740-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.679725-0500	runningboardd	Assertion did invalidate due to timeout: 169-129-1761 (target:[anon<RedLemon>(501):6308])
default	16:41:26.727356-0500	RedLemon	0x7fe238b73e78 ID=2380 Task <C9DD7F8D-2637-45FA-AD80-6F00BC6BA64C>.<659> received response, status 200 content U
default	16:41:26.728143-0500	RedLemon	Task <C9DD7F8D-2637-45FA-AD80-6F00BC6BA64C>.<659> response ended
default	16:41:26.728583-0500	RedLemon	Task <C9DD7F8D-2637-45FA-AD80-6F00BC6BA64C>.<659> done using Connection 1
default	16:41:26.728832-0500	RedLemon	Task <C9DD7F8D-2637-45FA-AD80-6F00BC6BA64C>.<659> summary for task success {transaction_duration_ms=67, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=66, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	16:41:26.729406-0500	RedLemon	Task <C9DD7F8D-2637-45FA-AD80-6F00BC6BA64C>.<659> finished successfully
default	16:41:26.731389-0500	RedLemon	Task <1B587828-4378-4435-BF11-F5B787F1C277>.<660> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.731719-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [894B4460-6F4E-4B2D-A086-B34F38AC76BC] (reporting strategy default)> on Task <1B587828-4378-4435-BF11-F5B787F1C277>.<660> was not selected for reporting
default	16:41:26.732495-0500	RedLemon	Task <1B587828-4378-4435-BF11-F5B787F1C277>.<660> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.732690-0500	RedLemon	Task <1B587828-4378-4435-BF11-F5B787F1C277>.<660> now using Connection 1
default	16:41:26.733508-0500	RedLemon	0x7fe23c36e318 ID=2384 Task <1B587828-4378-4435-BF11-F5B787F1C277>.<660> sent request, body N 0
default	16:41:26.748042-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.795712-0500	RedLemon	0x7fe23c36e318 ID=2384 Task <1B587828-4378-4435-BF11-F5B787F1C277>.<660> received response, status 200 content U
default	16:41:26.796511-0500	RedLemon	Task <1B587828-4378-4435-BF11-F5B787F1C277>.<660> response ended
default	16:41:26.796972-0500	RedLemon	Task <1B587828-4378-4435-BF11-F5B787F1C277>.<660> done using Connection 1
default	16:41:26.797204-0500	RedLemon	Task <1B587828-4378-4435-BF11-F5B787F1C277>.<660> summary for task success {transaction_duration_ms=65, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:41:26.797862-0500	RedLemon	Task <1B587828-4378-4435-BF11-F5B787F1C277>.<660> finished successfully
default	16:41:26.799906-0500	RedLemon	Task <C91EF0EA-AD57-40A3-A9E0-58FCFDC8E868>.<661> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.800230-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A15A240E-A168-4FD1-90E6-ADED43D628B6] (reporting strategy default)> on Task <C91EF0EA-AD57-40A3-A9E0-58FCFDC8E868>.<661> was not selected for reporting
default	16:41:26.801328-0500	RedLemon	Task <C91EF0EA-AD57-40A3-A9E0-58FCFDC8E868>.<661> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.801531-0500	RedLemon	Task <C91EF0EA-AD57-40A3-A9E0-58FCFDC8E868>.<661> now using Connection 1
default	16:41:26.802301-0500	RedLemon	0x7fe23c36e318 ID=2388 Task <C91EF0EA-AD57-40A3-A9E0-58FCFDC8E868>.<661> sent request, body N 0
default	16:41:26.818022-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.850855-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:26.851299-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:26.851367-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:26.857731-0500	RedLemon	0x7fe23c36e318 ID=2388 Task <C91EF0EA-AD57-40A3-A9E0-58FCFDC8E868>.<661> received response, status 200 content U
default	16:41:26.858104-0500	RedLemon	Task <C91EF0EA-AD57-40A3-A9E0-58FCFDC8E868>.<661> response ended
default	16:41:26.858381-0500	RedLemon	Task <C91EF0EA-AD57-40A3-A9E0-58FCFDC8E868>.<661> done using Connection 1
default	16:41:26.858520-0500	RedLemon	Task <C91EF0EA-AD57-40A3-A9E0-58FCFDC8E868>.<661> summary for task success {transaction_duration_ms=57, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=56, response_duration_ms=0, request_bytes=512, response_bytes=839, cache_hit=true}
default	16:41:26.858881-0500	RedLemon	Task <C91EF0EA-AD57-40A3-A9E0-58FCFDC8E868>.<661> finished successfully
default	16:41:26.860330-0500	RedLemon	Task <31A182F1-73F7-4DF0-840E-134A1FCE1665>.<662> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.860652-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7F708483-AD2E-4506-887C-ECD669768085] (reporting strategy default)> on Task <31A182F1-73F7-4DF0-840E-134A1FCE1665>.<662> was not selected for reporting
default	16:41:26.861361-0500	RedLemon	Task <31A182F1-73F7-4DF0-840E-134A1FCE1665>.<662> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.861572-0500	RedLemon	Task <31A182F1-73F7-4DF0-840E-134A1FCE1665>.<662> now using Connection 1
default	16:41:26.862382-0500	RedLemon	0x7fe23c36e318 ID=2392 Task <31A182F1-73F7-4DF0-840E-134A1FCE1665>.<662> sent request, body N 0
default	16:41:26.877919-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.921617-0500	RedLemon	0x7fe23c36e318 ID=2392 Task <31A182F1-73F7-4DF0-840E-134A1FCE1665>.<662> received response, status 200 content U
default	16:41:26.923358-0500	RedLemon	Task <31A182F1-73F7-4DF0-840E-134A1FCE1665>.<662> response ended
default	16:41:26.923903-0500	RedLemon	Task <31A182F1-73F7-4DF0-840E-134A1FCE1665>.<662> done using Connection 1
default	16:41:26.924105-0500	RedLemon	Task <31A182F1-73F7-4DF0-840E-134A1FCE1665>.<662> summary for task success {transaction_duration_ms=63, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=60, response_duration_ms=2, request_bytes=524, response_bytes=846, cache_hit=true}
default	16:41:26.924333-0500	RedLemon	Task <31A182F1-73F7-4DF0-840E-134A1FCE1665>.<662> finished successfully
default	16:41:26.926016-0500	RedLemon	Task <C66C44F9-E78C-47A2-8CF5-7D8128416010>.<663> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.926342-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9A0C547A-D243-4FFF-8DDA-A05F2B0116EF] (reporting strategy default)> on Task <C66C44F9-E78C-47A2-8CF5-7D8128416010>.<663> was not selected for reporting
default	16:41:26.927093-0500	RedLemon	Task <C66C44F9-E78C-47A2-8CF5-7D8128416010>.<663> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.927330-0500	RedLemon	Task <C66C44F9-E78C-47A2-8CF5-7D8128416010>.<663> now using Connection 1
default	16:41:26.928102-0500	RedLemon	0x7fe23bf3d648 ID=2396 Task <C66C44F9-E78C-47A2-8CF5-7D8128416010>.<663> sent request, body N 0
default	16:41:26.937263-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:26.990119-0500	RedLemon	0x7fe23bf3d648 ID=2396 Task <C66C44F9-E78C-47A2-8CF5-7D8128416010>.<663> received response, status 200 content U
default	16:41:26.990719-0500	RedLemon	Task <C66C44F9-E78C-47A2-8CF5-7D8128416010>.<663> response ended
default	16:41:26.991225-0500	RedLemon	Task <C66C44F9-E78C-47A2-8CF5-7D8128416010>.<663> done using Connection 1
default	16:41:26.991461-0500	RedLemon	Task <C66C44F9-E78C-47A2-8CF5-7D8128416010>.<663> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=512, response_bytes=839, cache_hit=true}
default	16:41:26.992187-0500	RedLemon	Task <C66C44F9-E78C-47A2-8CF5-7D8128416010>.<663> finished successfully
default	16:41:26.993810-0500	RedLemon	Task <A52AD13C-79BF-44F1-A02B-A326CEE14A24>.<664> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:26.994131-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DAFBCE31-3120-4394-A436-8A4D9F01EC3A] (reporting strategy default)> on Task <A52AD13C-79BF-44F1-A02B-A326CEE14A24>.<664> was not selected for reporting
default	16:41:26.994844-0500	RedLemon	Task <A52AD13C-79BF-44F1-A02B-A326CEE14A24>.<664> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:26.995055-0500	RedLemon	Task <A52AD13C-79BF-44F1-A02B-A326CEE14A24>.<664> now using Connection 1
default	16:41:26.995827-0500	RedLemon	0x7fe23c36e318 ID=2400 Task <A52AD13C-79BF-44F1-A02B-A326CEE14A24>.<664> sent request, body N 0
default	16:41:27.016766-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.064615-0500	RedLemon	0x7fe23c36e318 ID=2400 Task <A52AD13C-79BF-44F1-A02B-A326CEE14A24>.<664> received response, status 200 content U
default	16:41:27.065427-0500	RedLemon	Task <A52AD13C-79BF-44F1-A02B-A326CEE14A24>.<664> response ended
default	16:41:27.065876-0500	RedLemon	Task <A52AD13C-79BF-44F1-A02B-A326CEE14A24>.<664> done using Connection 1
default	16:41:27.066128-0500	RedLemon	Task <A52AD13C-79BF-44F1-A02B-A326CEE14A24>.<664> summary for task success {transaction_duration_ms=71, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:41:27.066683-0500	RedLemon	Task <A52AD13C-79BF-44F1-A02B-A326CEE14A24>.<664> finished successfully
default	16:41:27.068562-0500	RedLemon	Task <86CEE9DD-E2DE-44B6-A573-7D8D541F66DA>.<665> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.068919-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [34B99D02-1DFD-44D6-A834-20A5149CA22F] (reporting strategy default)> on Task <86CEE9DD-E2DE-44B6-A573-7D8D541F66DA>.<665> was not selected for reporting
default	16:41:27.069755-0500	RedLemon	Task <86CEE9DD-E2DE-44B6-A573-7D8D541F66DA>.<665> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.070043-0500	RedLemon	Task <86CEE9DD-E2DE-44B6-A573-7D8D541F66DA>.<665> now using Connection 1
default	16:41:27.071053-0500	RedLemon	0x7fe238b73e78 ID=2404 Task <86CEE9DD-E2DE-44B6-A573-7D8D541F66DA>.<665> sent request, body N 0
default	16:41:27.080532-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.127728-0500	RedLemon	0x7fe238b73e78 ID=2404 Task <86CEE9DD-E2DE-44B6-A573-7D8D541F66DA>.<665> received response, status 200 content U
default	16:41:27.128734-0500	RedLemon	Task <86CEE9DD-E2DE-44B6-A573-7D8D541F66DA>.<665> response ended
default	16:41:27.129420-0500	RedLemon	Task <86CEE9DD-E2DE-44B6-A573-7D8D541F66DA>.<665> done using Connection 1
default	16:41:27.129662-0500	RedLemon	Task <86CEE9DD-E2DE-44B6-A573-7D8D541F66DA>.<665> summary for task success {transaction_duration_ms=60, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=58, response_duration_ms=2, request_bytes=512, response_bytes=840, cache_hit=true}
default	16:41:27.130146-0500	RedLemon	Task <86CEE9DD-E2DE-44B6-A573-7D8D541F66DA>.<665> finished successfully
default	16:41:27.132086-0500	RedLemon	Task <D6E85B9E-3503-4310-80C1-CF0B36A0D0DA>.<666> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.132410-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2C4B2DA3-83D5-4B8A-9DE6-5C16ADEE3BD0] (reporting strategy default)> on Task <D6E85B9E-3503-4310-80C1-CF0B36A0D0DA>.<666> was not selected for reporting
default	16:41:27.133111-0500	RedLemon	Task <D6E85B9E-3503-4310-80C1-CF0B36A0D0DA>.<666> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.133315-0500	RedLemon	Task <D6E85B9E-3503-4310-80C1-CF0B36A0D0DA>.<666> now using Connection 1
default	16:41:27.134161-0500	RedLemon	0x7fe23c36e318 ID=2408 Task <D6E85B9E-3503-4310-80C1-CF0B36A0D0DA>.<666> sent request, body N 0
default	16:41:27.142481-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.196254-0500	RedLemon	0x7fe23c36e318 ID=2408 Task <D6E85B9E-3503-4310-80C1-CF0B36A0D0DA>.<666> received response, status 200 content U
default	16:41:27.196953-0500	RedLemon	Task <D6E85B9E-3503-4310-80C1-CF0B36A0D0DA>.<666> response ended
default	16:41:27.197530-0500	RedLemon	Task <D6E85B9E-3503-4310-80C1-CF0B36A0D0DA>.<666> done using Connection 1
default	16:41:27.197763-0500	RedLemon	Task <D6E85B9E-3503-4310-80C1-CF0B36A0D0DA>.<666> summary for task success {transaction_duration_ms=65, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:27.198385-0500	RedLemon	Task <D6E85B9E-3503-4310-80C1-CF0B36A0D0DA>.<666> finished successfully
default	16:41:27.200021-0500	RedLemon	Task <08B418F2-9567-493B-A181-BFF410F12130>.<667> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.200341-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [40D4F048-F24B-4142-9480-BF515CC6F0EF] (reporting strategy default)> on Task <08B418F2-9567-493B-A181-BFF410F12130>.<667> was not selected for reporting
default	16:41:27.201147-0500	RedLemon	Task <08B418F2-9567-493B-A181-BFF410F12130>.<667> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.201347-0500	RedLemon	Task <08B418F2-9567-493B-A181-BFF410F12130>.<667> now using Connection 1
default	16:41:27.202116-0500	RedLemon	0x7fe23c36e318 ID=2412 Task <08B418F2-9567-493B-A181-BFF410F12130>.<667> sent request, body N 0
default	16:41:27.209794-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.254899-0500	RedLemon	0x7fe23c36e318 ID=2412 Task <08B418F2-9567-493B-A181-BFF410F12130>.<667> received response, status 200 content U
default	16:41:27.255697-0500	RedLemon	Task <08B418F2-9567-493B-A181-BFF410F12130>.<667> response ended
default	16:41:27.256371-0500	RedLemon	Task <08B418F2-9567-493B-A181-BFF410F12130>.<667> done using Connection 1
default	16:41:27.256664-0500	RedLemon	Task <08B418F2-9567-493B-A181-BFF410F12130>.<667> summary for task success {transaction_duration_ms=55, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=53, response_duration_ms=1, request_bytes=512, response_bytes=834, cache_hit=true}
default	16:41:27.257504-0500	RedLemon	Task <08B418F2-9567-493B-A181-BFF410F12130>.<667> finished successfully
default	16:41:27.258905-0500	RedLemon	Task <F2334684-8945-49A1-B028-2E85EB05F472>.<668> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.259227-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [06B3FC0B-4AC1-4CD2-A426-BC5C567129D7] (reporting strategy default)> on Task <F2334684-8945-49A1-B028-2E85EB05F472>.<668> was not selected for reporting
default	16:41:27.259999-0500	RedLemon	Task <F2334684-8945-49A1-B028-2E85EB05F472>.<668> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.260577-0500	RedLemon	Task <F2334684-8945-49A1-B028-2E85EB05F472>.<668> now using Connection 1
default	16:41:27.262522-0500	RedLemon	0x7fe238b73e78 ID=2416 Task <F2334684-8945-49A1-B028-2E85EB05F472>.<668> sent request, body N 0
default	16:41:27.279341-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.319133-0500	RedLemon	0x7fe238b73e78 ID=2416 Task <F2334684-8945-49A1-B028-2E85EB05F472>.<668> received response, status 200 content U
default	16:41:27.319741-0500	RedLemon	Task <F2334684-8945-49A1-B028-2E85EB05F472>.<668> response ended
default	16:41:27.320225-0500	RedLemon	Task <F2334684-8945-49A1-B028-2E85EB05F472>.<668> done using Connection 1
default	16:41:27.320465-0500	RedLemon	Task <F2334684-8945-49A1-B028-2E85EB05F472>.<668> summary for task success {transaction_duration_ms=60, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=59, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:41:27.321105-0500	RedLemon	Task <F2334684-8945-49A1-B028-2E85EB05F472>.<668> finished successfully
default	16:41:27.323100-0500	RedLemon	Task <5BC515C3-0536-440C-9F06-CD44C23C2486>.<669> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.323409-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BE38573A-2065-4A86-8172-32DEEC2B3B9B] (reporting strategy default)> on Task <5BC515C3-0536-440C-9F06-CD44C23C2486>.<669> was not selected for reporting
default	16:41:27.327956-0500	RedLemon	Task <5BC515C3-0536-440C-9F06-CD44C23C2486>.<669> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.328166-0500	RedLemon	Task <5BC515C3-0536-440C-9F06-CD44C23C2486>.<669> now using Connection 1
default	16:41:27.329113-0500	RedLemon	0x7fe23bfd61d8 ID=2420 Task <5BC515C3-0536-440C-9F06-CD44C23C2486>.<669> sent request, body N 0
default	16:41:27.345103-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.373857-0500	runningboardd	Invalidating assertion 169-6308-1768 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:27.389257-0500	RedLemon	0x7fe23bfd61d8 ID=2420 Task <5BC515C3-0536-440C-9F06-CD44C23C2486>.<669> received response, status 200 content U
default	16:41:27.389894-0500	RedLemon	Task <5BC515C3-0536-440C-9F06-CD44C23C2486>.<669> response ended
default	16:41:27.390383-0500	RedLemon	Task <5BC515C3-0536-440C-9F06-CD44C23C2486>.<669> done using Connection 1
default	16:41:27.390620-0500	RedLemon	Task <5BC515C3-0536-440C-9F06-CD44C23C2486>.<669> summary for task success {transaction_duration_ms=66, response_status=200, connection=1, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=65, response_duration_ms=1, request_bytes=512, response_bytes=836, cache_hit=true}
default	16:41:27.391339-0500	RedLemon	Task <5BC515C3-0536-440C-9F06-CD44C23C2486>.<669> finished successfully
default	16:41:27.392452-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1769 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:27.392642-0500	runningboardd	Assertion 169-6308-1769 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:27.393311-0500	RedLemon	Task <99DDA487-AC73-4887-A13A-3DDF9B3C011C>.<670> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.393779-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D000070D-3950-421B-ABA8-6645BACE2F9C] (reporting strategy default)> on Task <99DDA487-AC73-4887-A13A-3DDF9B3C011C>.<670> was not selected for reporting
default	16:41:27.394634-0500	RedLemon	Task <99DDA487-AC73-4887-A13A-3DDF9B3C011C>.<670> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.394937-0500	RedLemon	Task <99DDA487-AC73-4887-A13A-3DDF9B3C011C>.<670> now using Connection 1
default	16:41:27.395212-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:27.395430-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:27.395698-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:27.395942-0500	RedLemon	0x7fe23c36e318 ID=2424 Task <99DDA487-AC73-4887-A13A-3DDF9B3C011C>.<670> sent request, body N 0
default	16:41:27.396578-0500	runningboardd	Attempting to rename power assertion 34089 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-6308-1768:com.apple.CFNetwork.StorageDB;169-6308-1769:com.apple.CFNetwork.StorageDB
default	16:41:27.411739-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.451617-0500	RedLemon	0x7fe23c36e318 ID=2424 Task <99DDA487-AC73-4887-A13A-3DDF9B3C011C>.<670> received response, status 200 content U
default	16:41:27.452264-0500	RedLemon	Task <99DDA487-AC73-4887-A13A-3DDF9B3C011C>.<670> response ended
default	16:41:27.452704-0500	RedLemon	Task <99DDA487-AC73-4887-A13A-3DDF9B3C011C>.<670> done using Connection 1
default	16:41:27.452951-0500	RedLemon	Task <99DDA487-AC73-4887-A13A-3DDF9B3C011C>.<670> summary for task success {transaction_duration_ms=58, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=57, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:41:27.453701-0500	RedLemon	Task <99DDA487-AC73-4887-A13A-3DDF9B3C011C>.<670> finished successfully
default	16:41:27.455857-0500	RedLemon	Task <E59D1C95-229B-4BF4-981F-05BE9B965D54>.<671> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.456177-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B5DB6018-62EC-4709-8B1A-ABDA4649C036] (reporting strategy default)> on Task <E59D1C95-229B-4BF4-981F-05BE9B965D54>.<671> was not selected for reporting
default	16:41:27.456947-0500	RedLemon	Task <E59D1C95-229B-4BF4-981F-05BE9B965D54>.<671> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.457160-0500	RedLemon	Task <E59D1C95-229B-4BF4-981F-05BE9B965D54>.<671> now using Connection 1
default	16:41:27.457926-0500	RedLemon	0x7fe23bfd61d8 ID=2428 Task <E59D1C95-229B-4BF4-981F-05BE9B965D54>.<671> sent request, body N 0
default	16:41:27.479996-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.530536-0500	RedLemon	0x7fe23bfd61d8 ID=2428 Task <E59D1C95-229B-4BF4-981F-05BE9B965D54>.<671> received response, status 200 content U
default	16:41:27.531193-0500	RedLemon	Task <E59D1C95-229B-4BF4-981F-05BE9B965D54>.<671> response ended
default	16:41:27.531809-0500	RedLemon	Task <E59D1C95-229B-4BF4-981F-05BE9B965D54>.<671> done using Connection 1
default	16:41:27.532121-0500	RedLemon	Task <E59D1C95-229B-4BF4-981F-05BE9B965D54>.<671> summary for task success {transaction_duration_ms=75, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=73, response_duration_ms=1, request_bytes=511, response_bytes=831, cache_hit=true}
default	16:41:27.532500-0500	RedLemon	Task <E59D1C95-229B-4BF4-981F-05BE9B965D54>.<671> finished successfully
default	16:41:27.534236-0500	RedLemon	Task <552EADB3-BE48-43A4-A815-4A0D1CF560AE>.<672> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.534533-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AE69FFBC-63BD-4DB1-BB38-6459C42175BF] (reporting strategy default)> on Task <552EADB3-BE48-43A4-A815-4A0D1CF560AE>.<672> was not selected for reporting
default	16:41:27.535547-0500	RedLemon	Task <552EADB3-BE48-43A4-A815-4A0D1CF560AE>.<672> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.535871-0500	RedLemon	Task <552EADB3-BE48-43A4-A815-4A0D1CF560AE>.<672> now using Connection 1
default	16:41:27.537585-0500	RedLemon	0x7fe23c36e318 ID=2432 Task <552EADB3-BE48-43A4-A815-4A0D1CF560AE>.<672> sent request, body N 0
default	16:41:27.549767-0500	runningboardd	Attempting to rename power assertion 34089 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-6308-1769:com.apple.CFNetwork.StorageDB
default	16:41:27.549856-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:27.549962-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:27.550051-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:27.555109-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.605644-0500	RedLemon	0x7fe23c36e318 ID=2432 Task <552EADB3-BE48-43A4-A815-4A0D1CF560AE>.<672> received response, status 200 content U
default	16:41:27.606249-0500	RedLemon	Task <552EADB3-BE48-43A4-A815-4A0D1CF560AE>.<672> response ended
default	16:41:27.606743-0500	RedLemon	Task <552EADB3-BE48-43A4-A815-4A0D1CF560AE>.<672> done using Connection 1
default	16:41:27.606975-0500	RedLemon	Task <552EADB3-BE48-43A4-A815-4A0D1CF560AE>.<672> summary for task success {transaction_duration_ms=71, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=70, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:41:27.608340-0500	RedLemon	Task <552EADB3-BE48-43A4-A815-4A0D1CF560AE>.<672> finished successfully
default	16:41:27.610276-0500	RedLemon	Task <DE0DD8B5-C647-454F-A32E-C5903CA18FA6>.<673> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.610605-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7C0C9BEC-DFD7-437D-9FC8-7AC80B1F309E] (reporting strategy default)> on Task <DE0DD8B5-C647-454F-A32E-C5903CA18FA6>.<673> was not selected for reporting
default	16:41:27.611310-0500	RedLemon	Task <DE0DD8B5-C647-454F-A32E-C5903CA18FA6>.<673> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.611509-0500	RedLemon	Task <DE0DD8B5-C647-454F-A32E-C5903CA18FA6>.<673> now using Connection 1
default	16:41:27.612281-0500	RedLemon	0x7fe23bfd61d8 ID=2436 Task <DE0DD8B5-C647-454F-A32E-C5903CA18FA6>.<673> sent request, body N 0
default	16:41:27.632690-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.682634-0500	RedLemon	0x7fe23bfd61d8 ID=2436 Task <DE0DD8B5-C647-454F-A32E-C5903CA18FA6>.<673> received response, status 200 content U
default	16:41:27.683232-0500	RedLemon	Task <DE0DD8B5-C647-454F-A32E-C5903CA18FA6>.<673> response ended
default	16:41:27.683790-0500	RedLemon	Task <DE0DD8B5-C647-454F-A32E-C5903CA18FA6>.<673> done using Connection 1
default	16:41:27.684138-0500	RedLemon	Task <DE0DD8B5-C647-454F-A32E-C5903CA18FA6>.<673> summary for task success {transaction_duration_ms=73, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=71, response_duration_ms=1, request_bytes=511, response_bytes=835, cache_hit=true}
default	16:41:27.684499-0500	RedLemon	Task <DE0DD8B5-C647-454F-A32E-C5903CA18FA6>.<673> finished successfully
default	16:41:27.686479-0500	RedLemon	Task <3C7E9CE6-AE81-4651-A8A9-315651CB904F>.<674> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.689263-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F887087F-29CE-400E-8302-1E38D3DC4DDC] (reporting strategy default)> on Task <3C7E9CE6-AE81-4651-A8A9-315651CB904F>.<674> was not selected for reporting
default	16:41:27.690335-0500	RedLemon	Task <3C7E9CE6-AE81-4651-A8A9-315651CB904F>.<674> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.690860-0500	RedLemon	Task <3C7E9CE6-AE81-4651-A8A9-315651CB904F>.<674> now using Connection 1
default	16:41:27.692658-0500	RedLemon	0x7fe23c36e318 ID=2440 Task <3C7E9CE6-AE81-4651-A8A9-315651CB904F>.<674> sent request, body N 0
default	16:41:27.709232-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.752646-0500	RedLemon	0x7fe23c36e318 ID=2440 Task <3C7E9CE6-AE81-4651-A8A9-315651CB904F>.<674> received response, status 200 content U
default	16:41:27.753251-0500	RedLemon	Task <3C7E9CE6-AE81-4651-A8A9-315651CB904F>.<674> response ended
default	16:41:27.753720-0500	RedLemon	Task <3C7E9CE6-AE81-4651-A8A9-315651CB904F>.<674> done using Connection 1
default	16:41:27.754003-0500	RedLemon	Task <3C7E9CE6-AE81-4651-A8A9-315651CB904F>.<674> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:41:27.754571-0500	RedLemon	Task <3C7E9CE6-AE81-4651-A8A9-315651CB904F>.<674> finished successfully
default	16:41:27.756829-0500	RedLemon	Task <4AE4A8FC-3DE5-4F34-9482-F68FD6B97C66>.<675> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.757149-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B0511C93-D56C-4716-8B36-D05713F9880C] (reporting strategy default)> on Task <4AE4A8FC-3DE5-4F34-9482-F68FD6B97C66>.<675> was not selected for reporting
default	16:41:27.761672-0500	RedLemon	Task <4AE4A8FC-3DE5-4F34-9482-F68FD6B97C66>.<675> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.761883-0500	RedLemon	Task <4AE4A8FC-3DE5-4F34-9482-F68FD6B97C66>.<675> now using Connection 1
default	16:41:27.762659-0500	RedLemon	0x7fe23c36e318 ID=2444 Task <4AE4A8FC-3DE5-4F34-9482-F68FD6B97C66>.<675> sent request, body N 0
default	16:41:27.778445-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.847127-0500	RedLemon	0x7fe23c36e318 ID=2444 Task <4AE4A8FC-3DE5-4F34-9482-F68FD6B97C66>.<675> received response, status 200 content U
default	16:41:27.847764-0500	RedLemon	Task <4AE4A8FC-3DE5-4F34-9482-F68FD6B97C66>.<675> response ended
default	16:41:27.848278-0500	RedLemon	Task <4AE4A8FC-3DE5-4F34-9482-F68FD6B97C66>.<675> done using Connection 1
default	16:41:27.848519-0500	RedLemon	Task <4AE4A8FC-3DE5-4F34-9482-F68FD6B97C66>.<675> summary for task success {transaction_duration_ms=91, response_status=200, connection=1, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=89, response_duration_ms=1, request_bytes=512, response_bytes=838, cache_hit=true}
default	16:41:27.849244-0500	RedLemon	Task <4AE4A8FC-3DE5-4F34-9482-F68FD6B97C66>.<675> finished successfully
default	16:41:27.851057-0500	RedLemon	Task <9F780C07-D029-402D-A5DA-33AD54AD6173>.<676> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.851356-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DFBC7EFC-46D2-449F-864C-642657D1BD90] (reporting strategy default)> on Task <9F780C07-D029-402D-A5DA-33AD54AD6173>.<676> was not selected for reporting
default	16:41:27.852101-0500	RedLemon	Task <9F780C07-D029-402D-A5DA-33AD54AD6173>.<676> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.852300-0500	RedLemon	Task <9F780C07-D029-402D-A5DA-33AD54AD6173>.<676> now using Connection 1
default	16:41:27.853106-0500	RedLemon	0x7fe23c36e318 ID=2448 Task <9F780C07-D029-402D-A5DA-33AD54AD6173>.<676> sent request, body N 0
default	16:41:27.870676-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.913002-0500	RedLemon	0x7fe23c36e318 ID=2448 Task <9F780C07-D029-402D-A5DA-33AD54AD6173>.<676> received response, status 200 content U
default	16:41:27.913902-0500	RedLemon	Task <9F780C07-D029-402D-A5DA-33AD54AD6173>.<676> response ended
default	16:41:27.914623-0500	RedLemon	Task <9F780C07-D029-402D-A5DA-33AD54AD6173>.<676> done using Connection 1
default	16:41:27.914932-0500	RedLemon	Task <9F780C07-D029-402D-A5DA-33AD54AD6173>.<676> summary for task success {transaction_duration_ms=63, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=60, response_duration_ms=2, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:41:27.915216-0500	RedLemon	Task <9F780C07-D029-402D-A5DA-33AD54AD6173>.<676> finished successfully
default	16:41:27.917207-0500	RedLemon	Task <A6CE2DAC-36A6-4B38-8287-4821B2CAE9D1>.<677> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.917540-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [47EDB550-91BB-44D3-B250-F9B992A0B313] (reporting strategy default)> on Task <A6CE2DAC-36A6-4B38-8287-4821B2CAE9D1>.<677> was not selected for reporting
default	16:41:27.918381-0500	RedLemon	Task <A6CE2DAC-36A6-4B38-8287-4821B2CAE9D1>.<677> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.918595-0500	RedLemon	Task <A6CE2DAC-36A6-4B38-8287-4821B2CAE9D1>.<677> now using Connection 1
default	16:41:27.919414-0500	RedLemon	0x7fe23c36e318 ID=2452 Task <A6CE2DAC-36A6-4B38-8287-4821B2CAE9D1>.<677> sent request, body N 0
default	16:41:27.933444-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:27.981787-0500	RedLemon	0x7fe23c36e318 ID=2452 Task <A6CE2DAC-36A6-4B38-8287-4821B2CAE9D1>.<677> received response, status 200 content U
default	16:41:27.982584-0500	RedLemon	Task <A6CE2DAC-36A6-4B38-8287-4821B2CAE9D1>.<677> response ended
default	16:41:27.983051-0500	RedLemon	Task <A6CE2DAC-36A6-4B38-8287-4821B2CAE9D1>.<677> done using Connection 1
default	16:41:27.983305-0500	RedLemon	Task <A6CE2DAC-36A6-4B38-8287-4821B2CAE9D1>.<677> summary for task success {transaction_duration_ms=65, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	16:41:27.983935-0500	RedLemon	Task <A6CE2DAC-36A6-4B38-8287-4821B2CAE9D1>.<677> finished successfully
default	16:41:27.985893-0500	RedLemon	Task <25169361-9EEE-4B72-9E5E-E3C578562E59>.<678> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:27.986185-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [47EE2662-5788-4633-99B2-C4CCDA797996] (reporting strategy default)> on Task <25169361-9EEE-4B72-9E5E-E3C578562E59>.<678> was not selected for reporting
default	16:41:27.986958-0500	RedLemon	Task <25169361-9EEE-4B72-9E5E-E3C578562E59>.<678> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:27.987234-0500	RedLemon	Task <25169361-9EEE-4B72-9E5E-E3C578562E59>.<678> now using Connection 1
default	16:41:27.988101-0500	RedLemon	0x7fe23c36e318 ID=2456 Task <25169361-9EEE-4B72-9E5E-E3C578562E59>.<678> sent request, body N 0
default	16:41:28.052638-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:28.104587-0500	RedLemon	0x7fe23c36e318 ID=2456 Task <25169361-9EEE-4B72-9E5E-E3C578562E59>.<678> received response, status 200 content U
default	16:41:28.105442-0500	RedLemon	Task <25169361-9EEE-4B72-9E5E-E3C578562E59>.<678> response ended
default	16:41:28.105930-0500	RedLemon	Task <25169361-9EEE-4B72-9E5E-E3C578562E59>.<678> done using Connection 1
default	16:41:28.106161-0500	RedLemon	Task <25169361-9EEE-4B72-9E5E-E3C578562E59>.<678> summary for task success {transaction_duration_ms=119, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=117, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:28.106786-0500	RedLemon	Task <25169361-9EEE-4B72-9E5E-E3C578562E59>.<678> finished successfully
default	16:41:28.108817-0500	RedLemon	Task <7DC29907-DAA6-4BB8-9244-11AE5D51F382>.<679> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:28.109126-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [18BC547F-53C3-410B-B9EC-D57FA2A7C310] (reporting strategy default)> on Task <7DC29907-DAA6-4BB8-9244-11AE5D51F382>.<679> was not selected for reporting
default	16:41:28.109889-0500	RedLemon	Task <7DC29907-DAA6-4BB8-9244-11AE5D51F382>.<679> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:28.110085-0500	RedLemon	Task <7DC29907-DAA6-4BB8-9244-11AE5D51F382>.<679> now using Connection 1
default	16:41:28.110862-0500	RedLemon	0x7fe23bf3d648 ID=2460 Task <7DC29907-DAA6-4BB8-9244-11AE5D51F382>.<679> sent request, body N 0
default	16:41:28.126791-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:28.192919-0500	RedLemon	0x7fe23bf3d648 ID=2460 Task <7DC29907-DAA6-4BB8-9244-11AE5D51F382>.<679> received response, status 200 content U
default	16:41:28.193509-0500	RedLemon	Task <7DC29907-DAA6-4BB8-9244-11AE5D51F382>.<679> response ended
default	16:41:28.194261-0500	RedLemon	Task <7DC29907-DAA6-4BB8-9244-11AE5D51F382>.<679> done using Connection 1
default	16:41:28.194566-0500	RedLemon	Task <7DC29907-DAA6-4BB8-9244-11AE5D51F382>.<679> summary for task success {transaction_duration_ms=85, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=83, response_duration_ms=1, request_bytes=511, response_bytes=835, cache_hit=true}
default	16:41:28.194926-0500	RedLemon	Task <7DC29907-DAA6-4BB8-9244-11AE5D51F382>.<679> finished successfully
default	16:41:28.197216-0500	RedLemon	Task <4B6920C5-610F-48D9-80F5-62F876DA63F3>.<680> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:41:28.197499-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C84EDFBE-3F15-4394-95F4-7EA929C10A7F] (reporting strategy default)> on Task <4B6920C5-610F-48D9-80F5-62F876DA63F3>.<680> was not selected for reporting
default	16:41:28.198291-0500	RedLemon	Task <4B6920C5-610F-48D9-80F5-62F876DA63F3>.<680> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:28.198483-0500	RedLemon	Task <4B6920C5-610F-48D9-80F5-62F876DA63F3>.<680> now using Connection 1
default	16:41:28.199237-0500	RedLemon	0x7fe23c36e318 ID=2464 Task <4B6920C5-610F-48D9-80F5-62F876DA63F3>.<680> sent request, body N 0
default	16:41:28.215487-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:28.256661-0500	RedLemon	0x7fe23c36e318 ID=2464 Task <4B6920C5-610F-48D9-80F5-62F876DA63F3>.<680> received response, status 200 content U
default	16:41:28.257272-0500	RedLemon	Task <4B6920C5-610F-48D9-80F5-62F876DA63F3>.<680> response ended
default	16:41:28.257740-0500	RedLemon	Task <4B6920C5-610F-48D9-80F5-62F876DA63F3>.<680> done using Connection 1
default	16:41:28.257973-0500	RedLemon	Task <4B6920C5-610F-48D9-80F5-62F876DA63F3>.<680> summary for task success {transaction_duration_ms=60, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=58, response_duration_ms=1, request_bytes=524, response_bytes=846, cache_hit=true}
default	16:41:28.258559-0500	RedLemon	Task <4B6920C5-610F-48D9-80F5-62F876DA63F3>.<680> finished successfully
default	16:41:28.295852-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:28.322838-0500	RedLemon	Task <6FC8E5F9-2E7F-43D8-AC82-539FD9E9CC17>.<681> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:41:28.323246-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B1FB2E95-662B-4FDC-BD34-78605BF09DE4] (reporting strategy default)> on Task <6FC8E5F9-2E7F-43D8-AC82-539FD9E9CC17>.<681> was not selected for reporting
default	16:41:28.323882-0500	RedLemon	Task <6FC8E5F9-2E7F-43D8-AC82-539FD9E9CC17>.<681> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:28.324067-0500	RedLemon	Task <6FC8E5F9-2E7F-43D8-AC82-539FD9E9CC17>.<681> now using Connection 37
default	16:41:28.324312-0500	RedLemon	Task <6FC8E5F9-2E7F-43D8-AC82-539FD9E9CC17>.<681> sent request, body N 0
default	16:41:28.347397-0500	RedLemon	Task <6FC8E5F9-2E7F-43D8-AC82-539FD9E9CC17>.<681> received response, status 200 content K
default	16:41:28.349230-0500	RedLemon	Task <6FC8E5F9-2E7F-43D8-AC82-539FD9E9CC17>.<681> done using Connection 37
default	16:41:28.349347-0500	RedLemon	Task <6FC8E5F9-2E7F-43D8-AC82-539FD9E9CC17>.<681> response ended
default	16:41:28.349901-0500	RedLemon	Task <6FC8E5F9-2E7F-43D8-AC82-539FD9E9CC17>.<681> summary for task success {transaction_duration_ms=26, response_status=200, connection=37, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=23, response_duration_ms=2, request_bytes=42, response_bytes=117419, cache_hit=false}
default	16:41:28.349982-0500	RedLemon	Task <6FC8E5F9-2E7F-43D8-AC82-539FD9E9CC17>.<681> finished successfully
default	16:41:28.431864-0500	runningboardd	Invalidating assertion 169-6308-1769 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:28.536696-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:28.536808-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:28.536864-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:28.538492-0500	runningboardd	Invalidating assertion 169-103-1767 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:28.691471-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:28.691521-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:28.691590-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:29.428395-0500	RedLemon	Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> summary for task success {transaction_duration_ms=6096, response_status=101, connection=38, protocol="http/1.1", domain_lookup_duration_ms=40, connect_duration_ms=144, secure_connection_duration_ms=49, private_relay=false, request_start_ms=194, request_duration_ms=0, response_start_ms=337, response_duration_ms=0, request_bytes=828, response_bytes=850, cache_hit=false}
default	16:41:29.428508-0500	RedLemon	Task <4C389B9E-2DA1-4DB0-A5A9-285F200666BE>.<682> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:29.429007-0500	RedLemon	Task <9CDA3045-71E6-4D16-8C17-8174C9BEE586>.<1> finished successfully
default	16:41:29.429173-0500	RedLemon	Connection 38: cleaning up
default	16:41:29.429903-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9573A8DD-EA71-4769-83B8-00CF54F98C89] (reporting strategy default)> on Task <4C389B9E-2DA1-4DB0-A5A9-285F200666BE>.<682> was not selected for reporting
default	16:41:29.430041-0500	RedLemon	[C38 EA959C32-C0D5-4DC6-9240-C32DB4C59CBF Hostname#316a8648:443 tcp, url hash: 028c1bce, tls, definite, attribution: developer] cancel
default	16:41:29.430253-0500	RedLemon	[C38 EA959C32-C0D5-4DC6-9240-C32DB4C59CBF Hostname#316a8648:443 tcp, url hash: 028c1bce, tls, definite, attribution: developer] cancelled
	[C38.1 C91DF3DB-7EE4-4BBB-9186-FADFA412E598 10.0.0.113:61374<->IPv4#f44b3bd4:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 6.097s, DNS @0.000s took 0.040s, TCP @0.338s took 0.093s, TLS 1.3 took 0.002s
	bytes in/out: 5122/1734, packets in/out: 8/13, rtt: 0.028s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:41:29.430972-0500	RedLemon	nw_flow_disconnected [C38.1 IPv4#f44b3bd4:443 cancelled channel-flow ((null))] Output protocol disconnected
default	16:41:29.431344-0500	RedLemon	nw_protocol_tcp_log_summary [C38.1:3] 
	[E8E5C944-4A38-479A-98B9-91A409E7AE1C <private>:61374<-><private>:443]
	Init: 1, Conn_Time: 92.327ms, SYNs: 2, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 28.031ms, rtt_var: 10.812ms rtt_nc: 23.312ms, rtt_var_nc: 10.625ms base rtt: 11ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:41:29.431847-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state cancelled
default	16:41:29.432012-0500	RedLemon	Task <4C389B9E-2DA1-4DB0-A5A9-285F200666BE>.<682> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:29.432290-0500	RedLemon	Task <4C389B9E-2DA1-4DB0-A5A9-285F200666BE>.<682> now using Connection 1
default	16:41:29.433681-0500	RedLemon	tcp_output [C38.1:3] flags=[F.] seq=3319208911, ack=1277028214, win=2048 state=FIN_WAIT_1 rcv_nxt=1277028214, snd_una=3319208857
default	16:41:29.433877-0500	RedLemon	Connection 38: done
error	16:41:29.433952-0500	RedLemon	Read completed with an error <private>
default	16:41:29.435069-0500	RedLemon	0x7fe23b438c58 ID=2468 Task <4C389B9E-2DA1-4DB0-A5A9-285F200666BE>.<682> sent request, body S 83
default	16:41:29.436078-0500	RedLemon	Task <C1781781-38B2-43A6-8578-587EA9638BA2>.<683> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:41:29.436428-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [706D3EA4-5DCC-4F08-9456-EA1C643BB466] (reporting strategy default)> on Task <C1781781-38B2-43A6-8578-587EA9638BA2>.<683> was not selected for reporting
default	16:41:29.436922-0500	RedLemon	Task <A5337A21-3509-48C6-830B-FF5471BF92BD>.<684> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:41:29.436992-0500	RedLemon	Task <C1781781-38B2-43A6-8578-587EA9638BA2>.<683> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:29.437165-0500	RedLemon	Task <C1781781-38B2-43A6-8578-587EA9638BA2>.<683> now using Connection 37
default	16:41:29.437277-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D6B95ADF-B333-4E19-B518-C68B80B07FA9] (reporting strategy default)> on Task <A5337A21-3509-48C6-830B-FF5471BF92BD>.<684> was not selected for reporting
default	16:41:29.437417-0500	RedLemon	Task <C1781781-38B2-43A6-8578-587EA9638BA2>.<683> sent request, body N 0
default	16:41:29.437855-0500	RedLemon	Task <A5337A21-3509-48C6-830B-FF5471BF92BD>.<684> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:29.438055-0500	RedLemon	Task <A5337A21-3509-48C6-830B-FF5471BF92BD>.<684> now using Connection 37
default	16:41:29.438250-0500	RedLemon	Task <A5337A21-3509-48C6-830B-FF5471BF92BD>.<684> sent request, body N 0
default	16:41:29.448815-0500	RedLemon	Task <D7335F71-EDE7-4E24-8E8C-9610BB910087>.<3> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:29.450805-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5146A1BA-A5D2-4827-AEDA-16163091D366] (reporting strategy default)> on Task <D7335F71-EDE7-4E24-8E8C-9610BB910087>.<3> was not selected for reporting
default	16:41:29.452200-0500	RedLemon	Connection 39: enabling TLS
default	16:41:29.452234-0500	RedLemon	Connection 39: starting, TC(0x0)
default	16:41:29.452277-0500	RedLemon	[C39 0FDE5583-8585-4AA9-A73F-82C54265CFB5 Hostname#316a8648:443 tcp, url hash: 028c1bce, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{6E9BC476-5667-42CD-8780-0D74F541FF71}{(null)}{Y}{2} (private), proc: 12180268-3769-3688-9AA2-A4113A2F44C4] start
default	16:41:29.452348-0500	RedLemon	[C39 Hostname#316a8648:443 initial path ((null))] event: path:start @0.000s
default	16:41:29.453600-0500	RedLemon	[C39 Hostname#316a8648:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: 692187FF-F542-4E91-AC30-3B3DC3C6917E
default	16:41:29.454265-0500	RedLemon	[C39 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	16:41:29.454361-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C39] reporting state preparing
default	16:41:29.454648-0500	mDNSResponder	[R1084] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'LfJOt0PdXD49Vu8v884VSw=='>, options: 0x8 {use-failover}, client pid: 6308 (RedLemon)
default	16:41:29.455156-0500	RedLemon	Task <D7335F71-EDE7-4E24-8E8C-9610BB910087>.<3> setting up Connection 39
default	16:41:29.455483-0500	RedLemon	tcp_input [C38.1:3] flags=[F.] seq=1277028214, ack=3319208912, win=16 state=FIN_WAIT_2 rcv_nxt=1277028214, snd_una=3319208912
default	16:41:29.456783-0500	RedLemon	Task <C1781781-38B2-43A6-8578-587EA9638BA2>.<683> received response, status 200 content K
default	16:41:29.457204-0500	RedLemon	Task <C1781781-38B2-43A6-8578-587EA9638BA2>.<683> done using Connection 37
default	16:41:29.459314-0500	RedLemon	Task <C1781781-38B2-43A6-8578-587EA9638BA2>.<683> response ended
default	16:41:29.460313-0500	RedLemon	Task <C1781781-38B2-43A6-8578-587EA9638BA2>.<683> summary for task success {transaction_duration_ms=23, response_status=200, connection=37, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=19, response_duration_ms=2, request_bytes=42, response_bytes=117419, cache_hit=false}
default	16:41:29.460469-0500	RedLemon	Task <C1781781-38B2-43A6-8578-587EA9638BA2>.<683> finished successfully
default	16:41:29.462764-0500	mDNSResponder	[R1084] getaddrinfo stop -- hostname: <mask.hash: 'LfJOt0PdXD49Vu8v884VSw=='>, client pid: 6308 (RedLemon)
default	16:41:29.464443-0500	RedLemon	nw_endpoint_resolver_update [C39 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#f44b3bd4:443
default	16:41:29.464847-0500	RedLemon	nw_endpoint_resolver_update [C39 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#dba0a053:443
default	16:41:29.465106-0500	RedLemon	[C39 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.012s
default	16:41:29.466150-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 initial path ((null))] event: path:start @0.013s
default	16:41:29.466696-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.014s, uuid: 2D43BB59-AFD1-45CF-9076-9492D3605DA4
default	16:41:29.466835-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.014s
default	16:41:29.467488-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.015s
default	16:41:29.468358-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.016s
default	16:41:29.468534-0500	RedLemon	tcp_output [C39.1:3] flags=[S] seq=2253151190, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2253151190
default	16:41:29.481920-0500	RedLemon	Task <A5337A21-3509-48C6-830B-FF5471BF92BD>.<684> received response, status 200 content K
default	16:41:29.483021-0500	RedLemon	Task <A5337A21-3509-48C6-830B-FF5471BF92BD>.<684> done using Connection 37
default	16:41:29.483141-0500	RedLemon	Task <A5337A21-3509-48C6-830B-FF5471BF92BD>.<684> response ended
default	16:41:29.483680-0500	RedLemon	Task <A5337A21-3509-48C6-830B-FF5471BF92BD>.<684> summary for task success {transaction_duration_ms=46, response_status=200, connection=37, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=44, response_duration_ms=1, request_bytes=37, response_bytes=34671, cache_hit=false}
default	16:41:29.483779-0500	RedLemon	Task <A5337A21-3509-48C6-830B-FF5471BF92BD>.<684> finished successfully
default	16:41:29.487788-0500	RedLemon	tcp_input [C39.1:3] flags=[S.] seq=3165124500, ack=2253151191, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2253151190
default	16:41:29.487927-0500	RedLemon	nw_flow_connected [C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:41:29.488070-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.035s
default	16:41:29.488131-0500	RedLemon	[C39 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.035s
default	16:41:29.488477-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C39.1:2][0x7fe23df880a0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:41:29.488662-0500	RedLemon	boringssl_context_info_handler(2028) [C39.1:2][0x7fe23df880a0] Client handshake started
default	16:41:29.488830-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS client enter_early_data
default	16:41:29.488945-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS client read_server_hello
default	16:41:29.504138-0500	RedLemon	0x7fe23b438c58 ID=2468 Task <4C389B9E-2DA1-4DB0-A5A9-285F200666BE>.<682> received response, status 201 content U
default	16:41:29.505242-0500	RedLemon	Task <4C389B9E-2DA1-4DB0-A5A9-285F200666BE>.<682> response ended
default	16:41:29.505568-0500	RedLemon	Task <4C389B9E-2DA1-4DB0-A5A9-285F200666BE>.<682> done using Connection 1
default	16:41:29.505660-0500	RedLemon	Task <4C389B9E-2DA1-4DB0-A5A9-285F200666BE>.<682> summary for task success {transaction_duration_ms=75, response_status=201, connection=1, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=73, response_duration_ms=1, request_bytes=496, response_bytes=778, cache_hit=false}
default	16:41:29.505975-0500	RedLemon	Task <4C389B9E-2DA1-4DB0-A5A9-285F200666BE>.<682> finished successfully
default	16:41:29.506190-0500	RedLemon	✅ Guest joined room HN5M in database
default	16:41:29.529606-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:41:29.529679-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client read_server_hello
default	16:41:29.529937-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:41:29.530978-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client read_certificate_request
default	16:41:29.531052-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client read_server_certificate
default	16:41:29.531114-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:41:29.531533-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C39.1:2][0x7fe23df880a0] Performing external trust evaluation
default	16:41:29.531697-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C39.1:2][0x7fe23df880a0] Asyncing for external verify block
default	16:41:29.531816-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:29.531877-0500	RedLemon	Connection 39: asked to evaluate TLS Trust
default	16:41:29.532105-0500	RedLemon	Task <D7335F71-EDE7-4E24-8E8C-9610BB910087>.<3> auth completion disp=1 cred=0x0
default	16:41:29.537580-0500	RedLemon	Connection 39: TLS Trust result 0
default	16:41:29.537625-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C39.1:2][0x7fe23df880a0] Returning from external verify block with result: true
default	16:41:29.537678-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C39.1:2][0x7fe23df880a0] Certificate verification result: OK
default	16:41:29.538049-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client read_server_finished
default	16:41:29.538157-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:41:29.538187-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:41:29.538207-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client send_client_certificate
default	16:41:29.538223-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client complete_second_flight
default	16:41:29.538288-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS 1.3 client done
default	16:41:29.538427-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS client finish_client_handshake
default	16:41:29.538450-0500	RedLemon	boringssl_context_info_handler(2045) [C39.1:2][0x7fe23df880a0] Client handshake state: TLS client done
default	16:41:29.538469-0500	RedLemon	boringssl_context_info_handler(2034) [C39.1:2][0x7fe23df880a0] Client handshake done
default	16:41:29.539053-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C39.1:2][0x7fe23df880a0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(50ms) flight_time(42ms) rtt(41ms) write_stalls(0) read_stalls(7)]
default	16:41:29.539210-0500	RedLemon	nw_flow_connected [C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-636241346)
default	16:41:29.539437-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.087s
default	16:41:29.539670-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C39] reporting state ready
default	16:41:29.539818-0500	RedLemon	[C39 Hostname#316a8648:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.087s
default	16:41:29.539952-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.087s
default	16:41:29.540026-0500	RedLemon	[C39 Hostname#316a8648:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.087s
default	16:41:29.540153-0500	RedLemon	Connection 39: connected successfully
default	16:41:29.540200-0500	RedLemon	Connection 39: TLS handshake complete
default	16:41:29.540446-0500	RedLemon	Connection 39: ready C(N) E(N)
default	16:41:29.540610-0500	RedLemon	Task <D7335F71-EDE7-4E24-8E8C-9610BB910087>.<3> now using Connection 39
default	16:41:29.540678-0500	RedLemon	Connection 39: received viability advisory(Y)
default	16:41:29.540899-0500	RedLemon	Task <D7335F71-EDE7-4E24-8E8C-9610BB910087>.<3> sent request, body N 0
default	16:41:29.661741-0500	RedLemon	Task <D7335F71-EDE7-4E24-8E8C-9610BB910087>.<3> received response, status 101 content U
default	16:41:29.662136-0500	RedLemon	Task <D7335F71-EDE7-4E24-8E8C-9610BB910087>.<3> response ended
default	16:41:29.662200-0500	RedLemon	Task <D7335F71-EDE7-4E24-8E8C-9610BB910087>.<3> done using Connection 39
default	16:41:29.662878-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.210s
default	16:41:29.662911-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C39] reporting state preparing
default	16:41:29.662964-0500	RedLemon	[C39 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.210s
default	16:41:29.663073-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.210s
default	16:41:29.663196-0500	RedLemon	[C39 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.210s
default	16:41:29.663326-0500	RedLemon	nw_flow_connected [C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:41:29.663569-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.211s
default	16:41:29.663623-0500	RedLemon	[C39 Hostname#316a8648:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.211s
default	16:41:29.663724-0500	RedLemon	nw_flow_connected [C39.1 IPv4#f44b3bd4:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-636241346)
default	16:41:29.664074-0500	RedLemon	[C39.1 IPv4#f44b3bd4:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.211s
default	16:41:29.664130-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C39] reporting state ready
default	16:41:29.664299-0500	RedLemon	[C39 Hostname#316a8648:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.211s
default	16:41:29.664979-0500	RedLemon	📤 Realtime: Sending message type: chat, sender: 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:29.665318-0500	RedLemon	   Payload keys: type, chatText, chatUsername, position, timestamp, senderId
default	16:41:29.666399-0500	RedLemon	✅ Realtime: Message broadcast complete
default	16:41:29.683741-0500	RedLemon	Task <C5FABE74-676D-4B61-9FA5-E795BFB44D01>.<685> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:29.685523-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3C090A97-5A42-48A5-89A4-ECF353EE07B1] (reporting strategy default)> on Task <C5FABE74-676D-4B61-9FA5-E795BFB44D01>.<685> was not selected for reporting
default	16:41:29.688026-0500	RedLemon	Task <C5FABE74-676D-4B61-9FA5-E795BFB44D01>.<685> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:29.689188-0500	RedLemon	Task <C5FABE74-676D-4B61-9FA5-E795BFB44D01>.<685> now using Connection 1
default	16:41:29.691230-0500	RedLemon	0x7fe23bfd43f8 ID=2472 Task <C5FABE74-676D-4B61-9FA5-E795BFB44D01>.<685> sent request, body N 0
default	16:41:29.798974-0500	RedLemon	0x7fe23bfd43f8 ID=2472 Task <C5FABE74-676D-4B61-9FA5-E795BFB44D01>.<685> received response, status 200 content U
default	16:41:29.799573-0500	RedLemon	Task <C5FABE74-676D-4B61-9FA5-E795BFB44D01>.<685> response ended
default	16:41:29.800146-0500	RedLemon	Task <C5FABE74-676D-4B61-9FA5-E795BFB44D01>.<685> done using Connection 1
default	16:41:29.800494-0500	RedLemon	Task <C5FABE74-676D-4B61-9FA5-E795BFB44D01>.<685> summary for task success {transaction_duration_ms=113, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=111, response_duration_ms=1, request_bytes=511, response_bytes=838, cache_hit=true}
default	16:41:29.802280-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1770 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:29.801134-0500	RedLemon	Task <C5FABE74-676D-4B61-9FA5-E795BFB44D01>.<685> finished successfully
default	16:41:29.802690-0500	runningboardd	Assertion 169-6308-1770 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:29.803353-0500	RedLemon	Task <2C0BD239-6A3E-4F7D-9856-104AF58BF908>.<686> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:29.804012-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:29.804275-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:29.803742-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2FC6B202-17B0-4197-A942-AA6980B95592] (reporting strategy default)> on Task <2C0BD239-6A3E-4F7D-9856-104AF58BF908>.<686> was not selected for reporting
default	16:41:29.804486-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:29.804522-0500	RedLemon	Task <2C0BD239-6A3E-4F7D-9856-104AF58BF908>.<686> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:29.804806-0500	RedLemon	Task <2C0BD239-6A3E-4F7D-9856-104AF58BF908>.<686> now using Connection 1
default	16:41:29.806029-0500	RedLemon	0x7fe23bfd43f8 ID=2476 Task <2C0BD239-6A3E-4F7D-9856-104AF58BF908>.<686> sent request, body N 0
default	16:41:29.813636-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1771 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:29.813941-0500	runningboardd	Assertion 169-103-1771 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:29.814491-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:29.814892-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:29.814944-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:29.814989-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:29.866985-0500	RedLemon	0x7fe23bfd43f8 ID=2476 Task <2C0BD239-6A3E-4F7D-9856-104AF58BF908>.<686> received response, status 200 content U
default	16:41:29.867625-0500	RedLemon	Task <2C0BD239-6A3E-4F7D-9856-104AF58BF908>.<686> response ended
default	16:41:29.868108-0500	RedLemon	Task <2C0BD239-6A3E-4F7D-9856-104AF58BF908>.<686> done using Connection 1
default	16:41:29.868357-0500	RedLemon	Task <2C0BD239-6A3E-4F7D-9856-104AF58BF908>.<686> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:29.868875-0500	RedLemon	Task <2C0BD239-6A3E-4F7D-9856-104AF58BF908>.<686> finished successfully
default	16:41:29.871229-0500	RedLemon	Task <A6B581B3-5174-4760-B2DE-E681AC9771D3>.<687> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:29.871701-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F51825BD-5A3D-40A7-8F7A-DD79F8668210] (reporting strategy default)> on Task <A6B581B3-5174-4760-B2DE-E681AC9771D3>.<687> was not selected for reporting
default	16:41:29.872483-0500	RedLemon	Task <A6B581B3-5174-4760-B2DE-E681AC9771D3>.<687> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:29.872703-0500	RedLemon	Task <A6B581B3-5174-4760-B2DE-E681AC9771D3>.<687> now using Connection 1
default	16:41:29.873532-0500	RedLemon	0x7fe23bc1e1f8 ID=2480 Task <A6B581B3-5174-4760-B2DE-E681AC9771D3>.<687> sent request, body N 0
default	16:41:29.881669-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:29.886838-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:41:29.887089-0500	RedLemon	   Payload keys: timestamp, position, chatText, chatUsername, type, senderId
default	16:41:29.887480-0500	RedLemon	✅ Realtime: Decoded message type: chat, sender: 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:29.887645-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: chat
default	16:41:29.887767-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:41:29.900422-0500	RedLemon	📥 Received Realtime message: 'LOBBY_JOIN' from lemontom in room HN5M
default	16:41:29.900645-0500	RedLemon	👋 Received: Guest 'lemontom' joined room HN5M
default	16:41:29.933523-0500	RedLemon	0x7fe23bc1e1f8 ID=2480 Task <A6B581B3-5174-4760-B2DE-E681AC9771D3>.<687> received response, status 200 content U
default	16:41:29.933931-0500	RedLemon	Task <A6B581B3-5174-4760-B2DE-E681AC9771D3>.<687> response ended
default	16:41:29.934251-0500	RedLemon	Task <A6B581B3-5174-4760-B2DE-E681AC9771D3>.<687> done using Connection 1
default	16:41:29.934412-0500	RedLemon	Task <A6B581B3-5174-4760-B2DE-E681AC9771D3>.<687> summary for task success {transaction_duration_ms=62, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=0, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:29.934737-0500	RedLemon	Task <A6B581B3-5174-4760-B2DE-E681AC9771D3>.<687> finished successfully
default	16:41:29.936248-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:29.936400-0500	RedLemon	👋 lemontom joined room
default	16:41:29.936522-0500	RedLemon	👋 lemontom left room
default	16:41:29.936635-0500	RedLemon	👋 ursinho left room
default	16:41:29.937022-0500	RedLemon	Task <0F483756-DBC7-41F0-AE4C-180DB5A06641>.<688> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:29.937436-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B24A8EAC-FA2C-44E1-AAFA-45B34D7E65AD] (reporting strategy default)> on Task <0F483756-DBC7-41F0-AE4C-180DB5A06641>.<688> was not selected for reporting
default	16:41:29.938184-0500	RedLemon	Task <0F483756-DBC7-41F0-AE4C-180DB5A06641>.<688> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:29.938474-0500	RedLemon	Task <0F483756-DBC7-41F0-AE4C-180DB5A06641>.<688> now using Connection 1
default	16:41:29.939469-0500	RedLemon	0x7fe23b404628 ID=2484 Task <0F483756-DBC7-41F0-AE4C-180DB5A06641>.<688> sent request, body N 0
default	16:41:29.958345-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:29.997639-0500	RedLemon	0x7fe23b404628 ID=2484 Task <0F483756-DBC7-41F0-AE4C-180DB5A06641>.<688> received response, status 200 content U
default	16:41:29.998235-0500	RedLemon	Task <0F483756-DBC7-41F0-AE4C-180DB5A06641>.<688> response ended
default	16:41:29.998671-0500	RedLemon	Task <0F483756-DBC7-41F0-AE4C-180DB5A06641>.<688> done using Connection 1
default	16:41:29.998888-0500	RedLemon	Task <0F483756-DBC7-41F0-AE4C-180DB5A06641>.<688> summary for task success {transaction_duration_ms=61, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=59, response_duration_ms=1, request_bytes=500, response_bytes=966, cache_hit=false}
default	16:41:29.999466-0500	RedLemon	Task <0F483756-DBC7-41F0-AE4C-180DB5A06641>.<688> finished successfully
default	16:41:30.043517-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:30.896676-0500	runningboardd	Invalidating assertion 169-6308-1770 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:31.052633-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:31.052781-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:31.052867-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:31.054867-0500	runningboardd	Invalidating assertion 169-103-1771 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:31.231645-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:31.231726-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:31.231807-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:31.438280-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:41:31.438591-0500	RedLemon	   Payload keys: position, chatText, type, timestamp, senderId, chatUsername
default	16:41:31.439044-0500	RedLemon	✅ Realtime: Decoded message type: chat, sender: 656DAA91-33B4-4688-9135-C982EA52D7C9
default	16:41:31.439253-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: chat
default	16:41:31.439430-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:41:31.439524-0500	RedLemon	📥 Received Realtime message: 'LOBBY_START_COUNTDOWN' from Host in room HN5M
default	16:41:31.439698-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	16:41:31.458406-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	16:41:31.458797-0500	RedLemon	Task <AD8EC22F-3F6A-409A-B68F-9A111BCA3589>.<689> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:31.459104-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [466BABED-B307-476E-8D0A-A1C5A319D224] (reporting strategy default)> on Task <AD8EC22F-3F6A-409A-B68F-9A111BCA3589>.<689> was not selected for reporting
default	16:41:31.459649-0500	RedLemon	Task <AD8EC22F-3F6A-409A-B68F-9A111BCA3589>.<689> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:31.459906-0500	RedLemon	Task <AD8EC22F-3F6A-409A-B68F-9A111BCA3589>.<689> now using Connection 1
default	16:41:31.460886-0500	RedLemon	0x7fe23df2b5d8 ID=2488 Task <AD8EC22F-3F6A-409A-B68F-9A111BCA3589>.<689> sent request, body N 0
default	16:41:31.520622-0500	RedLemon	0x7fe23df2b5d8 ID=2488 Task <AD8EC22F-3F6A-409A-B68F-9A111BCA3589>.<689> received response, status 200 content U
default	16:41:31.521640-0500	RedLemon	Task <AD8EC22F-3F6A-409A-B68F-9A111BCA3589>.<689> response ended
default	16:41:31.522022-0500	RedLemon	Task <AD8EC22F-3F6A-409A-B68F-9A111BCA3589>.<689> done using Connection 1
default	16:41:31.522877-0500	RedLemon	Task <AD8EC22F-3F6A-409A-B68F-9A111BCA3589>.<689> summary for task success {transaction_duration_ms=63, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=1, request_bytes=500, response_bytes=956, cache_hit=false}
default	16:41:31.523580-0500	RedLemon	Task <AD8EC22F-3F6A-409A-B68F-9A111BCA3589>.<689> finished successfully
default	16:41:31.527708-0500	RedLemon	🎬 Guest: Fetch took 0.069s, waiting 3.181s (includes 0.25s sync buffer)
default	16:41:31.528831-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1772 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:31.529087-0500	runningboardd	Assertion 169-6308-1772 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:31.529951-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:31.529995-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:31.530040-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:31.533370-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1773 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:31.533531-0500	runningboardd	Assertion 169-103-1773 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:31.542047-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:31.542206-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:31.542357-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:31.565130-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:31.876965-0500	RedLemon	Task <27BBEF72-14CA-4AC7-B39C-FB6ED6ED1301>.<690> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:31.877661-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BFB17D10-CCE5-4957-A446-311538F05513] (reporting strategy default)> on Task <27BBEF72-14CA-4AC7-B39C-FB6ED6ED1301>.<690> was not selected for reporting
default	16:41:31.878639-0500	RedLemon	Task <27BBEF72-14CA-4AC7-B39C-FB6ED6ED1301>.<690> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:31.878957-0500	RedLemon	Task <27BBEF72-14CA-4AC7-B39C-FB6ED6ED1301>.<690> now using Connection 1
default	16:41:31.880120-0500	RedLemon	0x7fe23bfbcdc8 ID=2492 Task <27BBEF72-14CA-4AC7-B39C-FB6ED6ED1301>.<690> sent request, body N 0
default	16:41:31.944400-0500	RedLemon	0x7fe23bfbcdc8 ID=2492 Task <27BBEF72-14CA-4AC7-B39C-FB6ED6ED1301>.<690> received response, status 200 content U
default	16:41:31.946065-0500	RedLemon	Task <27BBEF72-14CA-4AC7-B39C-FB6ED6ED1301>.<690> response ended
default	16:41:31.946815-0500	RedLemon	Task <27BBEF72-14CA-4AC7-B39C-FB6ED6ED1301>.<690> done using Connection 1
default	16:41:31.947134-0500	RedLemon	Task <27BBEF72-14CA-4AC7-B39C-FB6ED6ED1301>.<690> summary for task success {transaction_duration_ms=68, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=66, response_duration_ms=2, request_bytes=511, response_bytes=834, cache_hit=false}
default	16:41:31.947330-0500	RedLemon	Task <27BBEF72-14CA-4AC7-B39C-FB6ED6ED1301>.<690> finished successfully
default	16:41:31.949237-0500	RedLemon	Task <3D7CCB4F-A0C5-4EDA-BEB8-30C8E47F152C>.<691> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:31.949655-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4622C70E-E3F3-4B20-A8FA-BC545DF6C5F6] (reporting strategy default)> on Task <3D7CCB4F-A0C5-4EDA-BEB8-30C8E47F152C>.<691> was not selected for reporting
default	16:41:31.950448-0500	RedLemon	Task <3D7CCB4F-A0C5-4EDA-BEB8-30C8E47F152C>.<691> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:31.950669-0500	RedLemon	Task <3D7CCB4F-A0C5-4EDA-BEB8-30C8E47F152C>.<691> now using Connection 1
default	16:41:31.951504-0500	RedLemon	0x7fe23bc1e1f8 ID=2496 Task <3D7CCB4F-A0C5-4EDA-BEB8-30C8E47F152C>.<691> sent request, body N 0
default	16:41:31.969141-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:32.013842-0500	RedLemon	0x7fe23bc1e1f8 ID=2496 Task <3D7CCB4F-A0C5-4EDA-BEB8-30C8E47F152C>.<691> received response, status 200 content U
default	16:41:32.014424-0500	RedLemon	Task <3D7CCB4F-A0C5-4EDA-BEB8-30C8E47F152C>.<691> response ended
default	16:41:32.014870-0500	RedLemon	Task <3D7CCB4F-A0C5-4EDA-BEB8-30C8E47F152C>.<691> done using Connection 1
default	16:41:32.015095-0500	RedLemon	Task <3D7CCB4F-A0C5-4EDA-BEB8-30C8E47F152C>.<691> summary for task success {transaction_duration_ms=65, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:32.015748-0500	RedLemon	Task <3D7CCB4F-A0C5-4EDA-BEB8-30C8E47F152C>.<691> finished successfully
default	16:41:32.017878-0500	RedLemon	Task <848A8311-A2D3-4FB2-9587-5CA04D8A4A80>.<692> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:32.018162-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3B966C11-1E7E-4D1F-9F78-D47F3506C41B] (reporting strategy default)> on Task <848A8311-A2D3-4FB2-9587-5CA04D8A4A80>.<692> was not selected for reporting
default	16:41:32.019043-0500	RedLemon	Task <848A8311-A2D3-4FB2-9587-5CA04D8A4A80>.<692> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:32.019356-0500	RedLemon	Task <848A8311-A2D3-4FB2-9587-5CA04D8A4A80>.<692> now using Connection 1
default	16:41:32.020704-0500	RedLemon	0x7fe238bc5798 ID=2500 Task <848A8311-A2D3-4FB2-9587-5CA04D8A4A80>.<692> sent request, body N 0
default	16:41:32.153898-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:32.163511-0500	RedLemon	0x7fe238bc5798 ID=2500 Task <848A8311-A2D3-4FB2-9587-5CA04D8A4A80>.<692> received response, status 200 content U
default	16:41:32.164278-0500	RedLemon	Task <848A8311-A2D3-4FB2-9587-5CA04D8A4A80>.<692> response ended
default	16:41:32.164719-0500	RedLemon	Task <848A8311-A2D3-4FB2-9587-5CA04D8A4A80>.<692> done using Connection 1
default	16:41:32.164968-0500	RedLemon	Task <848A8311-A2D3-4FB2-9587-5CA04D8A4A80>.<692> summary for task success {transaction_duration_ms=146, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=144, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:41:32.165535-0500	RedLemon	Task <848A8311-A2D3-4FB2-9587-5CA04D8A4A80>.<692> finished successfully
default	16:41:32.167167-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:32.177021-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:32.631422-0500	runningboardd	Invalidating assertion 169-6308-1772 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:32.787936-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:32.788311-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:32.788405-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:32.789879-0500	runningboardd	Invalidating assertion 169-103-1773 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:32.948128-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:32.948178-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:32.948546-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:34.367993-0500	RedLemon	Task <56DAEB72-9058-479E-9BDC-BC6AF72A22F8>.<693> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:34.368498-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [55BCD949-E649-45F0-A484-CD64B373C03D] (reporting strategy default)> on Task <56DAEB72-9058-479E-9BDC-BC6AF72A22F8>.<693> was not selected for reporting
default	16:41:34.370079-0500	RedLemon	Task <56DAEB72-9058-479E-9BDC-BC6AF72A22F8>.<693> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:34.370608-0500	RedLemon	Task <56DAEB72-9058-479E-9BDC-BC6AF72A22F8>.<693> now using Connection 1
default	16:41:34.372184-0500	RedLemon	0x7fe23bc1e1f8 ID=2504 Task <56DAEB72-9058-479E-9BDC-BC6AF72A22F8>.<693> sent request, body N 0
default	16:41:34.432610-0500	RedLemon	0x7fe23bc1e1f8 ID=2504 Task <56DAEB72-9058-479E-9BDC-BC6AF72A22F8>.<693> received response, status 200 content U
default	16:41:34.433382-0500	RedLemon	Task <56DAEB72-9058-479E-9BDC-BC6AF72A22F8>.<693> response ended
default	16:41:34.433830-0500	RedLemon	Task <56DAEB72-9058-479E-9BDC-BC6AF72A22F8>.<693> done using Connection 1
default	16:41:34.434081-0500	RedLemon	Task <56DAEB72-9058-479E-9BDC-BC6AF72A22F8>.<693> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=63, response_duration_ms=1, request_bytes=511, response_bytes=834, cache_hit=true}
default	16:41:34.434639-0500	RedLemon	Task <56DAEB72-9058-479E-9BDC-BC6AF72A22F8>.<693> finished successfully
default	16:41:34.435941-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1774 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:34.436152-0500	runningboardd	Assertion 169-6308-1774 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:34.436647-0500	RedLemon	Task <A42AB9A6-8549-4BED-9B8D-BBEBB710B97C>.<694> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:34.437088-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FA9B85E7-7FF7-4549-9858-15F7DF66AE3B] (reporting strategy default)> on Task <A42AB9A6-8549-4BED-9B8D-BBEBB710B97C>.<694> was not selected for reporting
default	16:41:34.437916-0500	RedLemon	Task <A42AB9A6-8549-4BED-9B8D-BBEBB710B97C>.<694> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:34.438209-0500	RedLemon	Task <A42AB9A6-8549-4BED-9B8D-BBEBB710B97C>.<694> now using Connection 1
default	16:41:34.439069-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:34.439176-0500	RedLemon	0x7fe238bc5798 ID=2508 Task <A42AB9A6-8549-4BED-9B8D-BBEBB710B97C>.<694> sent request, body N 0
default	16:41:34.439287-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:34.439407-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:34.441329-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1775 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:34.441487-0500	runningboardd	Assertion 169-103-1775 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:34.442421-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:34.442470-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:34.442514-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:34.455040-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:34.498399-0500	RedLemon	0x7fe238bc5798 ID=2508 Task <A42AB9A6-8549-4BED-9B8D-BBEBB710B97C>.<694> received response, status 200 content U
default	16:41:34.499017-0500	RedLemon	Task <A42AB9A6-8549-4BED-9B8D-BBEBB710B97C>.<694> response ended
default	16:41:34.499510-0500	RedLemon	Task <A42AB9A6-8549-4BED-9B8D-BBEBB710B97C>.<694> done using Connection 1
default	16:41:34.499746-0500	RedLemon	Task <A42AB9A6-8549-4BED-9B8D-BBEBB710B97C>.<694> summary for task success {transaction_duration_ms=62, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=60, response_duration_ms=1, request_bytes=524, response_bytes=848, cache_hit=true}
default	16:41:34.500543-0500	RedLemon	Task <A42AB9A6-8549-4BED-9B8D-BBEBB710B97C>.<694> finished successfully
default	16:41:34.502825-0500	RedLemon	Task <433965F2-AF22-45EF-AE59-EC3BB01BAB8D>.<695> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:34.503158-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6340FCFA-68A3-4333-8592-C9404DC776FC] (reporting strategy default)> on Task <433965F2-AF22-45EF-AE59-EC3BB01BAB8D>.<695> was not selected for reporting
default	16:41:34.503896-0500	RedLemon	Task <433965F2-AF22-45EF-AE59-EC3BB01BAB8D>.<695> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:34.504164-0500	RedLemon	Task <433965F2-AF22-45EF-AE59-EC3BB01BAB8D>.<695> now using Connection 1
default	16:41:34.505023-0500	RedLemon	0x7fe23b3f9388 ID=2512 Task <433965F2-AF22-45EF-AE59-EC3BB01BAB8D>.<695> sent request, body N 0
default	16:41:34.521579-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:34.560265-0500	RedLemon	0x7fe23b3f9388 ID=2512 Task <433965F2-AF22-45EF-AE59-EC3BB01BAB8D>.<695> received response, status 200 content U
default	16:41:34.560895-0500	RedLemon	Task <433965F2-AF22-45EF-AE59-EC3BB01BAB8D>.<695> response ended
default	16:41:34.562222-0500	RedLemon	Task <433965F2-AF22-45EF-AE59-EC3BB01BAB8D>.<695> done using Connection 1
default	16:41:34.564774-0500	RedLemon	Task <433965F2-AF22-45EF-AE59-EC3BB01BAB8D>.<695> summary for task success {transaction_duration_ms=61, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=56, response_duration_ms=2, request_bytes=524, response_bytes=840, cache_hit=true}
default	16:41:34.564984-0500	RedLemon	Task <433965F2-AF22-45EF-AE59-EC3BB01BAB8D>.<695> finished successfully
default	16:41:34.566862-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:34.601843-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:34.911396-0500	RedLemon	🎬 Guest: Starting playback after countdown
default	16:41:34.911591-0500	RedLemon	🎬 Guest: Launching player for Weapons
default	16:41:34.911958-0500	RedLemon	   Quality: 1080p
default	16:41:34.912250-0500	RedLemon	   Mode: watchParty
default	16:41:34.912426-0500	RedLemon	📡 Fetching metadata for tt26581740...
default	16:41:35.021655-0500	RedLemon	🖼️ Loading background art: https://images.metahub.space/background/medium/tt26581740/img
default	16:41:35.021946-0500	RedLemon	⏳ Background art loading...
default	16:41:35.022144-0500	RedLemon	🎨 Loading logo: https://images.metahub.space/logo/medium/tt26581740/img
default	16:41:35.022355-0500	RedLemon	⏳ Logo loading...
default	16:41:35.044619-0500	RedLemon	Task <DDFF27FD-13AD-4896-B0DB-15183EB91D2A>.<696> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:41:35.045070-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BAA7665E-4B09-4470-8DAE-E1537D08D402] (reporting strategy default)> on Task <DDFF27FD-13AD-4896-B0DB-15183EB91D2A>.<696> was not selected for reporting
default	16:41:35.045650-0500	RedLemon	Task <AF81056B-83CB-45F3-9D6F-FE6C987EF361>.<697> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:41:35.045732-0500	RedLemon	Task <DDFF27FD-13AD-4896-B0DB-15183EB91D2A>.<696> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:35.045948-0500	RedLemon	Task <DDFF27FD-13AD-4896-B0DB-15183EB91D2A>.<696> now using Connection 37
default	16:41:35.046066-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2B6C8B7C-5BC7-410B-AC82-8DE2CABC289D] (reporting strategy default)> on Task <AF81056B-83CB-45F3-9D6F-FE6C987EF361>.<697> was not selected for reporting
default	16:41:35.046428-0500	RedLemon	Task <DDFF27FD-13AD-4896-B0DB-15183EB91D2A>.<696> sent request, body N 0
default	16:41:35.046737-0500	RedLemon	Task <AF81056B-83CB-45F3-9D6F-FE6C987EF361>.<697> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:35.046916-0500	RedLemon	Task <AF81056B-83CB-45F3-9D6F-FE6C987EF361>.<697> now using Connection 37
default	16:41:35.047125-0500	RedLemon	Task <AF81056B-83CB-45F3-9D6F-FE6C987EF361>.<697> sent request, body N 0
default	16:41:35.062222-0500	RedLemon	Task <DDFF27FD-13AD-4896-B0DB-15183EB91D2A>.<696> received response, status 200 content K
default	16:41:35.062403-0500	RedLemon	Task <DDFF27FD-13AD-4896-B0DB-15183EB91D2A>.<696> done using Connection 37
default	16:41:35.062892-0500	RedLemon	Task <DDFF27FD-13AD-4896-B0DB-15183EB91D2A>.<696> response ended
default	16:41:35.063489-0500	RedLemon	Task <DDFF27FD-13AD-4896-B0DB-15183EB91D2A>.<696> summary for task success {transaction_duration_ms=18, response_status=200, connection=37, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=16, response_duration_ms=0, request_bytes=37, response_bytes=34633, cache_hit=false}
default	16:41:35.063594-0500	RedLemon	Task <DDFF27FD-13AD-4896-B0DB-15183EB91D2A>.<696> finished successfully
default	16:41:35.076396-0500	RedLemon	Task <AF81056B-83CB-45F3-9D6F-FE6C987EF361>.<697> received response, status 200 content K
default	16:41:35.079287-0500	RedLemon	✅ Logo loaded successfully
default	16:41:35.080964-0500	RedLemon	Task <AF81056B-83CB-45F3-9D6F-FE6C987EF361>.<697> done using Connection 37
default	16:41:35.081116-0500	RedLemon	Task <AF81056B-83CB-45F3-9D6F-FE6C987EF361>.<697> response ended
default	16:41:35.081830-0500	RedLemon	Task <AF81056B-83CB-45F3-9D6F-FE6C987EF361>.<697> summary for task success {transaction_duration_ms=35, response_status=200, connection=37, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=29, response_duration_ms=5, request_bytes=42, response_bytes=117405, cache_hit=false}
default	16:41:35.081950-0500	RedLemon	Task <AF81056B-83CB-45F3-9D6F-FE6C987EF361>.<697> finished successfully
default	16:41:35.082346-0500	RedLemon	✅ StreamService: Using provided metadata: Weapons
default	16:41:35.082499-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	16:41:35.082554-0500	RedLemon	✅ Background art loaded successfully
default	16:41:35.082591-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt26581740, type=movie, year=2025
default	16:41:35.082984-0500	RedLemon	Task <ED2EB75D-E22F-4749-AEB4-875CCA30790A>.<22> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	16:41:35.083363-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0829BF7C-25D2-45E0-9B2C-C638AB2D33BE] (reporting strategy default)> on Task <ED2EB75D-E22F-4749-AEB4-875CCA30790A>.<22> was not selected for reporting
default	16:41:35.084403-0500	RedLemon	Connection 40: starting, TC(0x0)
default	16:41:35.084456-0500	RedLemon	[C40 B05F6B89-756E-4F74-8D00-A6AECC3AE26D 127.0.0.1:47253 tcp, url hash: a025d583, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{9335F7B4-8967-4EAA-B8EE-42E31B2BD663}{(null)}{Y}{2} (private), proc: 12180268-3769-3688-9AA2-A4113A2F44C4] start
default	16:41:35.084539-0500	RedLemon	[C40 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	16:41:35.084747-0500	RedLemon	[C40 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), interface: lo0)] event: path:satisfied @0.000s, uuid: 5354C819-ACD2-4DB0-871A-5C9F0F16EF74
default	16:41:35.085128-0500	RedLemon	[C40 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), interface: lo0)] event: flow:start_connect @0.000s
default	16:41:35.085155-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C40] reporting state preparing
default	16:41:35.085293-0500	RedLemon	Task <ED2EB75D-E22F-4749-AEB4-875CCA30790A>.<22> setting up Connection 40
default	16:41:35.085582-0500	RedLemon	nw_socket_handle_socket_event [C40:2] Socket received CONNECTED event
default	16:41:35.085684-0500	RedLemon	nw_flow_connected [C40 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	16:41:35.085726-0500	RedLemon	[C40 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.001s
default	16:41:35.085771-0500	RedLemon	nw_flow_connected [C40 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-636241346)
default	16:41:35.085896-0500	RedLemon	[C40 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.001s
default	16:41:35.086009-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C40] reporting state ready
default	16:41:35.086093-0500	RedLemon	[C40 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.001s
default	16:41:35.086239-0500	RedLemon	Connection 40: connected successfully
default	16:41:35.086321-0500	RedLemon	Connection 40: ready C(N) E(N)
default	16:41:35.086553-0500	RedLemon	Task <ED2EB75D-E22F-4749-AEB4-875CCA30790A>.<22> now using Connection 40
default	16:41:35.086657-0500	RedLemon	Connection 40: received viability advisory(Y)
default	16:41:35.086872-0500	RedLemon	Task <ED2EB75D-E22F-4749-AEB4-875CCA30790A>.<22> sent request, body N 0
default	16:41:35.112747-0500	RedLemon	Task <4343ECAC-554C-42F5-8D8A-46BA0F7DB968>.<698> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	16:41:35.112838-0500	RedLemon	Task <24B712A1-B201-4E90-A5A2-24B606D1C319>.<699> resuming, timeouts(20.0, 604800.0) QOS(0x15) Voucher (null)
default	16:41:35.113070-0500	RedLemon	Task <C83C2578-ECFE-4EEC-A27B-7B3BB2C7C629>.<701> resuming, timeouts(20.0, 604800.0) QOS(0x15) Voucher (null)
default	16:41:35.113064-0500	RedLemon	Task <C563780B-6477-4F59-B3DF-D6D7E420D83A>.<700> resuming, timeouts(20.0, 604800.0) QOS(0x15) Voucher (null)
default	16:41:35.113814-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [154B0809-BCB8-41E0-83F0-63E1AA2A3E6D] (reporting strategy default)> on Task <4343ECAC-554C-42F5-8D8A-46BA0F7DB968>.<698> was not selected for reporting
default	16:41:35.114156-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E2AF620F-571D-4DB5-A22E-E485AAF1F8A5] (reporting strategy default)> on Task <24B712A1-B201-4E90-A5A2-24B606D1C319>.<699> was not selected for reporting
default	16:41:35.115864-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A3B68B93-C771-4387-9AA2-E2E7D6AEFF19] (reporting strategy default)> on Task <C563780B-6477-4F59-B3DF-D6D7E420D83A>.<700> was not selected for reporting
default	16:41:35.116367-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [638DC81D-A992-4F06-A178-69A1F4037DE9] (reporting strategy default)> on Task <C83C2578-ECFE-4EEC-A27B-7B3BB2C7C629>.<701> was not selected for reporting
default	16:41:35.117266-0500	RedLemon	Task <24B712A1-B201-4E90-A5A2-24B606D1C319>.<699> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:35.118019-0500	RedLemon	Task <24B712A1-B201-4E90-A5A2-24B606D1C319>.<699> now using Connection 27
default	16:41:35.129916-0500	RedLemon	0x7fe23b3e4448 ID=4 Task <24B712A1-B201-4E90-A5A2-24B606D1C319>.<699> sent request, body N 0
default	16:41:35.133908-0500	RedLemon	Task <4343ECAC-554C-42F5-8D8A-46BA0F7DB968>.<698> summary for task success {transaction_duration_ms=18, response_status=200, cache_hit=true}
default	16:41:35.133970-0500	RedLemon	Task <C563780B-6477-4F59-B3DF-D6D7E420D83A>.<700> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:35.134125-0500	RedLemon	Task <4343ECAC-554C-42F5-8D8A-46BA0F7DB968>.<698> finished successfully
default	16:41:35.134210-0500	RedLemon	Task <C563780B-6477-4F59-B3DF-D6D7E420D83A>.<700> now using Connection 28
default	16:41:35.134412-0500	RedLemon	Task <C563780B-6477-4F59-B3DF-D6D7E420D83A>.<700> sent request, body N 0
default	16:41:35.134756-0500	RedLemon	Task <C83C2578-ECFE-4EEC-A27B-7B3BB2C7C629>.<701> summary for task success {transaction_duration_ms=4, response_status=200, cache_hit=true}
default	16:41:35.135030-0500	RedLemon	Task <C83C2578-ECFE-4EEC-A27B-7B3BB2C7C629>.<701> finished successfully
default	16:41:35.154179-0500	RedLemon	0x7fe23b3e4448 ID=4 Task <24B712A1-B201-4E90-A5A2-24B606D1C319>.<699> received response, status 200 content U
default	16:41:35.204015-0500	RedLemon	Task <24B712A1-B201-4E90-A5A2-24B606D1C319>.<699> response ended
default	16:41:35.204809-0500	RedLemon	Task <24B712A1-B201-4E90-A5A2-24B606D1C319>.<699> done using Connection 27
default	16:41:35.205128-0500	RedLemon	Task <24B712A1-B201-4E90-A5A2-24B606D1C319>.<699> summary for task success {transaction_duration_ms=89, response_status=200, connection=27, reused=1, request_start_ms=2, request_duration_ms=11, response_start_ms=38, response_duration_ms=50, request_bytes=148, response_bytes=8323, cache_hit=true}
default	16:41:35.205554-0500	RedLemon	Task <24B712A1-B201-4E90-A5A2-24B606D1C319>.<699> finished successfully
default	16:41:35.475831-0500	runningboardd	Invalidating assertion 169-6308-1774 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:35.642010-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:35.642055-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:35.642136-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:35.643619-0500	runningboardd	Invalidating assertion 169-103-1775 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:35.738574-0500	RedLemon	Task <C563780B-6477-4F59-B3DF-D6D7E420D83A>.<700> received response, status 200 content U
default	16:41:35.738668-0500	RedLemon	Task <C563780B-6477-4F59-B3DF-D6D7E420D83A>.<700> done using Connection 28
default	16:41:35.738866-0500	RedLemon	Task <C563780B-6477-4F59-B3DF-D6D7E420D83A>.<700> response ended
default	16:41:35.739003-0500	RedLemon	Task <C563780B-6477-4F59-B3DF-D6D7E420D83A>.<700> summary for task success {transaction_duration_ms=621, response_status=200, connection=28, reused=1, request_start_ms=17, request_duration_ms=0, response_start_ms=621, response_duration_ms=0, request_bytes=484, response_bytes=2105, cache_hit=true}
default	16:41:35.739192-0500	RedLemon	Task <C563780B-6477-4F59-B3DF-D6D7E420D83A>.<700> finished successfully
default	16:41:35.739969-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1776 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:35.740195-0500	runningboardd	Assertion 169-6308-1776 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:35.741949-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:35.742033-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:35.742125-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 185
default	16:41:35.742322-0500	RedLemon	   INPUT[0]: Weapons 2025 UHD BluRay 2160p DDP Atmos 5 1 DV HDR10Plus x265-hallowed mkv | 2160p | zilean
default	16:41:35.742486-0500	RedLemon	   INPUT[1]: Weapons 2025 Hybrid 2160p UHD BluRay TrueHD Atmos 7 1 DV HDR10+ x265-j3rico mkv | 2160p | zilean
default	16:41:35.742634-0500	RedLemon	   INPUT[2]: Weapons 2025 MULTi FRENCH VF2 HDR DV 2160p WEB H265-SUPPLY mkv | 2160p | zilean
default	16:41:35.742782-0500	RedLemon	   INPUT[3]: Weapons 2025 2160p WEB-DL DV-TheEqualizer mp4 | 2160p | zilean
default	16:41:35.742932-0500	RedLemon	   INPUT[4]: Weapons 2025 NORDiC PROPER 2160p SDR WEB-DL DDP5 1 Atmos H 265-NorTekst mkv | 2160p | zilean
default	16:41:35.743078-0500	RedLemon	   INPUT[5]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RUS SUB mkv | 2160p | zilean
default	16:41:35.743223-0500	RedLemon	   INPUT[6]: Weapons 2025 2160p WEB-DL DDP5 1 Atmos SDR H265-AOC | 2160p | zilean
default	16:41:35.743366-0500	RedLemon	   INPUT[7]: Weapons 2025 2160p AMZN WEB-DL DDP5 1 H 265-BYNDR mkv | 2160p | zilean
default	16:41:35.743520-0500	RedLemon	   INPUT[8]: Weapons 2025 2160p iTunes WEB-DL DD5 1 DV H 265-DreamHD mkv | 2160p | zilean
default	16:41:35.743676-0500	RedLemon	   INPUT[9]: Weapons 2025 2160p UHD Blu-ray Remux DV HDR HEVC TrueHD Atmos 7 1-CiNEPHiLES | 2160p | zilean
default	16:41:35.743829-0500	RedLemon	   INPUT[10]: Weapons 2025 2160p UHD Remux HEVC DoVi TrueHD Atmos 7 1-playBD | 2160p | zilean
default	16:41:35.743983-0500	RedLemon	   INPUT[11]: Weapons (2025) MA WEB-DL 2160p HDR 2xUkr Eng [Hurtom] v2 mkv | 2160p | zilean
default	16:41:35.744183-0500	RedLemon	   INPUT[12]: Weapons 2025 MULTi VF2 HDR DV 2160p WEB H265-SUPPLY | 2160p | zilean
default	16:41:35.744369-0500	RedLemon	   INPUT[13]: Weapons 2025 2160p MA WEB-DL DV HDR TYMBLER mkv | 2160p | zilean
default	16:41:35.744534-0500	RedLemon	   INPUT[14]: Weapons 2025 MULTi VF2 HDR 2160p WEB H265-SUPPLY | 2160p | zilean
default	16:41:35.744724-0500	RedLemon	   INPUT[15]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265 mkv | 2160p | zilean
default	16:41:35.744972-0500	RedLemon	   INPUT[16]: Weapons 2025 iTA-ENG WEBDL 2160p HEVC HDR x265-CYBER mkv | 2160p | zilean
default	16:41:35.745168-0500	RedLemon	   INPUT[17]: Weapons 2025 2160p MA WEB-DL HDR H 265 Master5 mkv | 2160p | zilean
default	16:41:35.745341-0500	RedLemon	   INPUT[18]: Weapons 2025 1080p Blu-ray Remux AVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 1080p | zilean
default	16:41:35.745500-0500	RedLemon	   INPUT[19]: Weapons 2025 720p AMZN WEB-DL DDP5 1 H 264 mkv | 720p | zilean
default	16:41:35.745722-0500	RedLemon	   INPUT[20]: Weapons 2025 UHD BluRay 2160p TrueHD Atmos 7 1 DV HEVC REMUX-FraMeSToR | 2160p | zilean
default	16:41:35.744793-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:35.746020-0500	RedLemon	   INPUT[21]: Weapons (2025) En 1080p X265 HEVC 10 bit | 1080p | zilean
default	16:41:35.746296-0500	RedLemon	   INPUT[22]: Weapons 2025 1080p HD x264 ENG YG iso | 1080p | zilean
default	16:41:35.746618-0500	RedLemon	   INPUT[23]: Weapons 2025 2160p HDR10Plus DV WEBRip 6CH x265 HEVC-PSA | 2160p | zilean
default	16:41:35.746809-0500	RedLemon	   INPUT[24]: Weapons 2025 Dub WEB-DLRip-AVC ExKinoRay mkv | Unknown | zilean
default	16:41:35.747526-0500	RedLemon	   INPUT[25]: Weapons 2025 1080p WEBRip DD5 1 10bits x265-Rapta mkv | 1080p | zilean
default	16:41:35.748182-0500	RedLemon	   INPUT[26]: Weapons 2025 iTA-ENG WEBDL 1080p x264-CYBER mkv | 1080p | zilean
default	16:41:35.748414-0500	RedLemon	   INPUT[27]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265 DUAL-C76 mkv | 2160p | zilean
default	16:41:35.748596-0500	RedLemon	   INPUT[28]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:41:35.748774-0500	RedLemon	   INPUT[29]: Weapons 2025 1080p HDTS x264 ENG YG mkv | 1080p | zilean
default	16:41:35.748946-0500	RedLemon	   INPUT[30]: Weapons 2025 1080p ITA-ENG MULTI WEBRip x264 AAC-V3SP4EV3R mkv | 1080p | zilean
default	16:41:35.749094-0500	RedLemon	   INPUT[31]: Weapons 2025 Hybrid 2160p UHD Blu-ray Remux DV HDR10plus HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:41:35.750096-0500	RedLemon	   INPUT[32]: Weapons 2025 MULTi VF2 1080p WEB H264-SUPPLY | 1080p | zilean
default	16:41:35.750368-0500	RedLemon	   INPUT[33]: Weapons 2025 1080p HD x264 ENG YG iso | 1080p | zilean
default	16:41:35.750504-0500	RedLemon	   INPUT[34]: Weapons 2025 MULTi 2160p UHD BluRay REMUX DV HDR HEVC TrueHD Atmos 7 1-R22 | 2160p | zilean
default	16:41:35.750633-0500	RedLemon	   INPUT[35]: Weapons 2025 2160p BDRemux HEVC HDR DV TrueHD Atmos 7 1-DaTmoSX | 2160p | zilean
default	16:41:35.750839-0500	RedLemon	   INPUT[36]: Weapons 2025 WEB-DL 2160p DD5 1 Atmos DV HDR-DVT mkv | 2160p | zilean
default	16:41:35.751039-0500	RedLemon	   INPUT[37]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:41:35.751245-0500	RedLemon	   INPUT[38]: Weapons 2025 1080p HMAX WEB-DL DDP5 1 H 265 DUAL-Potatin mkv | 1080p | zilean
default	16:41:35.751396-0500	RedLemon	   INPUT[39]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:41:35.751533-0500	RedLemon	   INPUT[40]: Weapons 2025 1080p BluRay x265-YAWNTiC mkv | 1080p | zilean
default	16:41:35.751707-0500	RedLemon	   INPUT[41]: Weapons 2025 MULTi 2160p UHD BluRay x265-SESKAPiLE mkv | 2160p | zilean
default	16:41:35.752027-0500	RedLemon	   INPUT[42]: Weapons 2025 Hybrid 2160p UHD Blu-ray Remux DV HDR10plus HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:41:35.752192-0500	RedLemon	   INPUT[43]: Weapons 2025 REPACK 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:41:35.752314-0500	RedLemon	   INPUT[44]: Weapons 2025 2160p UHD BluRay REMUX DV P7 HDR MULTi TrueHD Atmos 7 1 H265-BEN THE MEN | 2160p | zilean
default	16:41:35.752691-0500	RedLemon	   INPUT[45]: Weapons 2025 1080p 10bit BluRay 8CH X265 HEVC-PSA mkv | 1080p | zilean
default	16:41:35.752932-0500	RedLemon	   INPUT[46]: www UIndex org   -    Weapons 2025 1080p BluRay x264-OFT | 1080p | zilean
default	16:41:35.753185-0500	RedLemon	   INPUT[47]: Weapons 2025 BluRay 1080p DDP Atmos 5 1 x264-hallowed mkv | 1080p | zilean
default	16:41:35.753540-0500	RedLemon	   INPUT[48]: Weapons 2025 WEB-DL1080p mkv | 1080p | zilean
default	16:41:35.754534-0500	RedLemon	   INPUT[49]: Weapons 2025 1080p Blu-ray Remux AVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 1080p | zilean
default	16:41:35.754837-0500	RedLemon	   INPUT[50]: Weapons 2025 1080p BluRay AV1 Opus 7 1-AV1Core mkv | 1080p | zilean
default	16:41:35.757395-0500	RedLemon	   INPUT[51]: Weapons (2025) (2160p UHD BluRay x265 10bit DV HDR TrueHD Atmos 7 1 r00t) | 2160p | zilean
default	16:41:35.757847-0500	RedLemon	   INPUT[52]: Weapons (2025) (1080p BluRay x265 10bit EAC3 Atmos 7 1 Ghost) | 1080p | zilean
default	16:41:35.758598-0500	RedLemon	   INPUT[53]: Weapons 2025 MULTi 2160p UHD BluRay REMUX HEVC DV HDR TrueHD 7 1 Atmos-DSiTE | 2160p | zilean
default	16:41:35.758881-0500	RedLemon	   INPUT[54]: Weapons (2025) (2160p WEB-DL Hybrid H265 DV HDR DDP Atmos 5 1 English - HONE) mkv | 2160p | zilean
default	16:41:35.759061-0500	RedLemon	   INPUT[55]: Weapons 2025 2160p MA WEB-DL DDP5 1 Atmos DoVi HDR H 265-HONE mkv | 2160p | zilean
default	16:41:35.759268-0500	RedLemon	   INPUT[56]: Weapons (2025) [MULTi] [2160p] [iT] [WEB-DL] [DV] [HDR] [H 265] [DDP5 1-R22] [Dubbing PL i napisy PL] | 2160p | zilean
default	16:41:35.759582-0500	RedLemon	   INPUT[57]: Weapons 2025 PLDUB MULTi 2160p iT WEB-DL DoVi HDR DDP5 1 x264-P2P mkv | 2160p | zilean
default	16:41:35.759756-0500	RedLemon	   INPUT[58]: Weapons (2025) mkv | Unknown | zilean
default	16:41:35.760150-0500	RedLemon	   INPUT[59]: Weapons (2025) 2160p H265 HDR10 DV iTA EnG AC3 Sub iTA EnG-MIRCrew iso | 2160p | zilean
default	16:41:35.760385-0500	RedLemon	   INPUT[60]: Weapons [2025, WEB-DL 2160p, HDR10, Dolby Vision] [Hybrid] Dub (Movie Dubbing, RHS) + 4x MVO (HDRezka, TVShows, LostFilm, LE-Production) + AVO + Dub (Ukr) + DVO (Ukr) + Original (Eng) + Sub (Rus, Ukr, Eng) | 2160p | zilean
default	16:41:35.760624-0500	RedLemon	   INPUT[61]: Weapons 2025 x265 WEB-DL 2160p SDR mkv | 2160p | zilean
default	16:41:35.760879-0500	RedLemon	   INPUT[62]: Weapons (2025) [2160p] [YTS MX] | 2160p | zilean
default	16:41:35.761122-0500	RedLemon	   INPUT[63]: Weapons 2025 2160p WEB-DL Hybrid H265 DV HDR DDP Atmos 5 1 mkv | 2160p | zilean
default	16:41:35.761291-0500	RedLemon	   INPUT[64]: [superseed byethost7 com] Weapons 2025 PL HDR AI UP 2160p HDTS AC3-ChrisVPS mkv ts | 2160p | zilean
default	16:41:35.761710-0500	RedLemon	   INPUT[65]: Weapons 2025 1080p CAMRip LAT DUB 1XBET mp4 | 1080p | zilean
default	16:41:35.762275-0500	RedLemon	   INPUT[66]: ww UIndex org    -    Weapons 2025 720p AMZN WEB-DL DDP5 1 H 264-BYNDR | 720p | zilean
default	16:41:35.762516-0500	RedLemon	   INPUT[67]: Weapons 2025 720p MA WEB-DL DDP5 1 Atmos H 264-BYNDR | 720p | zilean
default	16:41:35.762706-0500	RedLemon	   INPUT[68]: Weapons 2025 x265 WEB-DL 2160p HDR-DV mkv | 2160p | zilean
default	16:41:35.762990-0500	RedLemon	   INPUT[69]: Weapons 2025 PL HDR AI UP 2160p HDTS AC3-ChrisVPS | 2160p | zilean
default	16:41:35.763211-0500	RedLemon	   INPUT[70]: Weapons 2025 MULTi 2160p WEB-DL DDP5 1 DV HDR HEVC-KiT | 2160p | zilean
default	16:41:35.763567-0500	RedLemon	   INPUT[71]: Weapons 2025 4K HDR DV 2160p WEBDL Ita Eng x265-NAHOM mkv | 2160p | zilean
default	16:41:35.764372-0500	RedLemon	   INPUT[72]: Weapons 2025 2160p iT WEB-DL DV P5 MULTi[Ben The Men] mp4 | 2160p | zilean
default	16:41:35.764926-0500	RedLemon	   INPUT[73]: Weapons 2025 NORDiC REPACK 2160p WEB-DL DDP5 1 Atmos DV HDR H 265-BANDOLEROS mkv | 2160p | zilean
default	16:41:35.765141-0500	RedLemon	   INPUT[74]: Weapons 2025 MULTi 2160p iT WEB-DL DDP5 1 DV HDR H 265-R22 mkv | 2160p | zilean
default	16:41:35.765335-0500	RedLemon	   INPUT[75]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264 mkv | 1080p | zilean
default	16:41:35.765501-0500	RedLemon	   INPUT[76]: Weapons 2025 WEB-DL 2160p HDR Dolby 10bit mkv | 2160p | zilean
default	16:41:35.765630-0500	RedLemon	   INPUT[77]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264-BYNDR mkv | 1080p | zilean
default	16:41:35.765750-0500	RedLemon	   INPUT[78]: Weapons 2025 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:41:35.767143-0500	RedLemon	   INPUT[79]: Weapons 2025 2160p iT WEB-DL DDP5 1 Atmos DV H 265-BYNDR | 2160p | zilean
default	16:41:35.767425-0500	RedLemon	   INPUT[80]: Weapons 2025 REPACK 2160p iT WEB-DL DDP5 1 Atmos DV H 265-BYNDR | 2160p | zilean
default	16:41:35.767576-0500	RedLemon	   INPUT[81]: Weapons 2025 MULTi iNTERNAL UHD BluRay 2160p TrueHD Atmos 7 1 DV HDR10 REMUX-seedpool mkv | 2160p | zilean
default	16:41:35.767714-0500	RedLemon	   INPUT[82]: Weapons 2025 2160p UHD Blu-ray Remux DV HDR HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:41:35.767843-0500	RedLemon	   INPUT[83]: Weapons 2025 Hybrid 2160p UHD Blu-ray Remux DV HDR10plus HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:41:35.767950-0500	RedLemon	   INPUT[84]: Weapons 2025 1080p TSHD (DVO Колодій Трейлерів + місіс kor0bochkina) mkv | 1080p | zilean
default	16:41:35.768089-0500	RedLemon	   INPUT[85]: Weapons 2025 1080p 10bit WEBRip 6CH X265 HEVC-PSA mkv | 1080p | zilean
default	16:41:35.768224-0500	RedLemon	   INPUT[86]: Weapons 2025 1080p DS4K WEBRip 10Bit DDP5 1 Atmos x265-NeoNoir mkv | 1080p | zilean
default	16:41:35.768349-0500	RedLemon	   INPUT[87]: Weapons 2025 PLSUBBED 720p WEB-DL XviD AC3-R22 avi | 720p | zilean
default	16:41:35.768472-0500	RedLemon	   INPUT[88]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264-BYNDR mkv | 1080p | zilean
default	16:41:35.768632-0500	RedLemon	   INPUT[89]: Weapons 2025 REPACK 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:41:35.772249-0500	RedLemon	   INPUT[90]: Weapons 2025 1080p WEBRip DV HDR10  DDP Atmos 5 1 x265-FZHD mkv | 1080p | zilean
default	16:41:35.772989-0500	RedLemon	   INPUT[91]: Weapons (2025) [1080p] [WEBRip] [5 1] [YTS MX] | 1080p | zilean
default	16:41:35.774686-0500	RedLemon	   INPUT[92]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:41:35.775943-0500	RedLemon	   INPUT[93]: Weapons 2025 Hybrid 2160p MA WEB-DL DDP5 1 Atmos DV HDR10P H 265-7HOTDOGS mkv | 2160p | zilean
default	16:41:35.776314-0500	RedLemon	   INPUT[94]: Weapons 2025 MULTi 1080p AMZN WEB-DL x264 AC3-KiT mkv | 1080p | zilean
default	16:41:35.777375-0500	RedLemon	   INPUT[95]: Weapons 2025 MULTi 2160p WEB-DL DDP5 1 DV HDR HEVC-KiT mkv | 2160p | zilean
default	16:41:35.777997-0500	RedLemon	   INPUT[96]: Weapons 2025 2160p iT WEB-DL DV HDR10+[Ben The Men] mp4 | 2160p | zilean
default	16:41:35.778536-0500	RedLemon	   INPUT[97]: Weapons 2025 Ger Eng DL EAC3 2160p MA DV HDR WEB H265-ZeroTwo mkv | 2160p | zilean
default	16:41:35.778778-0500	RedLemon	   INPUT[98]: Weapons 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	16:41:35.779105-0500	RedLemon	   INPUT[99]: Weapons 2025 2160p iT WEB-DL DV HDR10+[Ben The Men] mp4 | 2160p | zilean
default	16:41:35.780678-0500	RedLemon	   INPUT[100]: Weapons 2025 REPACK 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:41:35.780890-0500	RedLemon	   INPUT[101]: Weapons 2025 MULTi 1080p 10bit WEB-DL DD5 1 x265 HEVC-AdL mkv | 1080p | zilean
default	16:41:35.781990-0500	RedLemon	   INPUT[102]: Weapons (2025) (1080p MA WEB-DL x265 10bit EAC3 Atmos 5 1 Ghost) | 1080p | zilean
default	16:41:35.782224-0500	RedLemon	   INPUT[103]: Weapons 2025 1080p HDTS x264 UA-EN mkv | 1080p | zilean
default	16:41:35.782638-0500	RedLemon	   INPUT[104]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264 DUAL-BiOMA mkv | 1080p | zilean
default	16:41:35.783257-0500	RedLemon	   INPUT[105]: Weapons (2025) En 1080p HDR10  X265 HEVC 10 bit mkv | 1080p | zilean
default	16:41:35.785041-0500	RedLemon	   INPUT[106]: Weapons (2025) En 2160p UHD HDR10  X265 HEVC 10 bit | 2160p | zilean
default	16:41:35.785331-0500	RedLemon	   INPUT[107]: Weapons (2025) En 1080p X265 HEVC 10 bit | 1080p | zilean
default	16:41:35.785537-0500	RedLemon	   INPUT[108]: Weapons [2025] mkv | Unknown | zilean
default	16:41:35.785697-0500	RedLemon	   INPUT[109]: Weapons 2025 1080p TS EN-RGB | 1080p | zilean
default	16:41:35.785815-0500	RedLemon	   INPUT[110]: Weapons.2025.2160p.HMAX.WEB-DL.DUAL.DDP5.1.Atmos.DoVi.HDR.H.265-TURG
👤 29 💾 8.33 GB ⚙️ ThePirateBay
Dual Audio | 2160p | torrentio
default	16:41:35.785917-0500	RedLemon	   INPUT[111]: Weapons.2025.bluray.hdr.2160p.av1-7.1.opus-Dust
👤 15 💾 3.19 GB ⚙️ 1337x | 2160p | torrentio
default	16:41:35.786024-0500	RedLemon	   INPUT[112]: Weapons (2025) 2160p H265 BluRay Rip 10 bit DV HDR10+ ita eng AC3 5.1 sub ita eng NUeng Licdom
👤 13 💾 2.91 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:41:35.786938-0500	RedLemon	   INPUT[113]: Weapons (2025) 2160p H265 HDR10 DV iTA EnG AC3 Sub iTA EnG-MIRCrew
👤 11 💾 3.57 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:41:35.791574-0500	RedLemon	   INPUT[114]: Weapons 2025 UHD BluRay 2160p HDR10 DV HEVC TrueHD Atmos 7.1 x265-E
👤 9 💾 26.84 GB ⚙️ 1337x | 2160p | torrentio
default	16:41:35.791784-0500	RedLemon	   INPUT[115]: A.Hora.do.Mal.2025.WEB-DL.2160p.DV.HDR10 .x265.DUAL.5.1-SF
👤 7 💾 23.13 GB ⚙️ BluDV
Dual Audio / 🇬🇧 / 🇵🇹 | 2160p | torrentio
default	16:41:35.791943-0500	RedLemon	   INPUT[116]: La.hora.de.la.desaparicion.2025.WEB-DL.4k.HDR-Dual-Lat
👤 6 💾 22.63 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | Unknown | torrentio
default	16:41:35.792054-0500	RedLemon	   INPUT[117]: Weapons.2025.Hybrid.2160p.WEB-DL.DV.HDR.DDP5.1.Atmos.H265-AOC
👤 5 💾 22.66 GB ⚙️ 1337x | 2160p | torrentio
default	16:41:35.792361-0500	RedLemon	   INPUT[118]: Орудия / Weapons (2025) WEB-DL-HEVC 2160p от ELEKTRI4KA | 4K | SDR | D P A | Movie Dubbing Red Head Sound HDrezka Studio Сербин
👤 34 💾 15.53 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 2160p | torrentio
default	16:41:35.796180-0500	RedLemon	   INPUT[119]: Weapons (La hora de la desaparicion) (2025) [4k 2160p][Esp]
👤 26 💾 23.53 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	16:41:35.796364-0500	RedLemon	   INPUT[120]: Weapons.2025.UHD.2160p.10bit.iTunes.WEBRip.AV1.English.DDP5.1.ESubs-DaddyCooL
👤 17 💾 4.91 GB ⚙️ 1337x | 2160p | torrentio
default	16:41:35.796483-0500	RedLemon	   INPUT[121]: Weapons.2025.2160p.iT.WEB-DL.SDR.ENG.LATINO.DDP5.1.H265.MP4-BTM
👤 7 💾 12.47 GB ⚙️ ThePirateBay
Multi Audio / 🇬🇧 / 🇲🇽 | 2160p | torrentio
default	16:41:35.796586-0500	RedLemon	   INPUT[122]: Weapons 2025 UHD BluRay 1080p DD Atmos 5 1 DoVi HDR10 x265-SM737
👤 25 💾 5.69 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.796683-0500	RedLemon	   INPUT[123]: Weapons.2025.1080p.MA.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 112 💾 1.74 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.796776-0500	RedLemon	   INPUT[124]: Weapons 2025 1080p BluRay
👤 100 💾 2.37 GB ⚙️ YTS | 1080p | torrentio
default	16:41:35.796869-0500	RedLemon	   INPUT[125]: Weapons 2025 1080p WEBRip
👤 100 💾 2.15 GB ⚙️ YTS | 1080p | torrentio
default	16:41:35.796957-0500	RedLemon	   INPUT[126]: Weapons 2025 REPACK 1080p WEB-DL HEVC x265-RMTeam
👤 88 💾 1.35 GB ⚙️ 1337x | 1080p | torrentio
default	16:41:35.798438-0500	RedLemon	   INPUT[127]: A.Hora.do.Mal.2025.1080p.FULL.HD.WEB-DL.DUAL.5.1
👤 84 💾 7.59 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:41:35.798624-0500	RedLemon	   INPUT[128]: A Hora do Mal 2025 WEB-DL 1080p x264 DUAL 5.1
👤 53 💾 2.94 GB ⚙️ BluDV
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:41:35.798773-0500	RedLemon	   INPUT[129]: Weapons.2025.1080p.WEB-DL.MA.h265.EAC3
👤 44 💾 7.58 GB ⚙️ 1337x | 1080p | torrentio
default	16:41:35.799194-0500	RedLemon	   INPUT[130]: Weapons (2025) Eng 1080p WEBRip x264 AAC ESub
👤 42 💾 1.98 GB ⚙️ 1337x | 1080p | torrentio
default	16:41:35.799340-0500	RedLemon	   INPUT[131]: Weapons (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 33 💾 2.89 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:41:35.799463-0500	RedLemon	   INPUT[132]: Weapons.2025.iTA-ENG.Bluray.1080p.x264-CYBER.mkv
👤 31 💾 8.79 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:41:35.799580-0500	RedLemon	   INPUT[133]: Weapons 2025 1080p REPACK WEBRip DDP 5 1 Atmos 10bit H 265-iVy
👤 21 💾 1.83 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.799688-0500	RedLemon	   INPUT[134]: Weapons (La hora de la desaparicion) (2025) [Bluray 1080p][Esp]
👤 18 💾 7.83 GB ⚙️ Wolfmax4k
🇪🇸 | 1080p | torrentio
default	16:41:35.799787-0500	RedLemon	   INPUT[135]: Weapons.2025.MULTi.VF2.1080p.WEB.H264-SUPPLY.mkv
👤 18 💾 8.17 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	16:41:35.799880-0500	RedLemon	   INPUT[136]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264-BYNDR
👤 16 💾 7.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.799978-0500	RedLemon	   INPUT[137]: Weapons.2025.1080p.ITA-ENG-SPA.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 13 💾 1.45 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 / 🇪🇸 | 1080p | torrentio
default	16:41:35.800072-0500	RedLemon	   INPUT[138]: Weapons 2025 1080p Blu-Ray HEVC x265 10Bit DDP5.1 Subs KINGDOM
👤 11 💾 6.09 GB ⚙️ 1337x | 1080p | torrentio
default	16:41:35.800168-0500	RedLemon	   INPUT[139]: A.Hora.do.Mal.2025.1080p.WEB-DL.DUAL.5.1
👤 11 💾 2.94 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:41:35.800367-0500	RedLemon	   INPUT[140]: Weapons 2025 1080p BluRay x265 HEVC 10bit AAC 7 1 HeVK Zach C
👤 10 💾 12.29 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	16:41:35.800683-0500	RedLemon	   INPUT[141]: Weapons 2025 1080p WEB-DL HEVC x265 10Bit DDP5.1 Subs KINGDOM
👤 8 💾 6.25 GB ⚙️ 1337x | 1080p | torrentio
default	16:41:35.800801-0500	RedLemon	   INPUT[142]: Weapons 2025 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR
👤 8 💾 7.64 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.800889-0500	RedLemon	   INPUT[143]: Weapons 2025 1080p WebRip EAC3 5 1 x265-Lootera
👤 8 💾 2.62 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.800983-0500	RedLemon	   INPUT[144]: Weapons 2025 1080p WEB-Rip HEVC x265 10Bit DDP5 1 Subs KINGDOM
Weapons 2025 1080p WEB-Rip  HEVC x265 10Bit DDP5 1 Subs KINGDOM.mkv
👤 7 💾 6.25 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.801074-0500	RedLemon	   INPUT[145]: Weapons.2025.1080p.HMAX.WEB-DL.DUAL.DDP5.1.Atmos.H.265-TURG
👤 6 💾 3.46 GB ⚙️ ThePirateBay
Dual Audio | 1080p | torrentio
default	16:41:35.801158-0500	RedLemon	   INPUT[146]: Weapons 2025 1080p WEB-Rip HEVC x265 10Bit DDP5 1 Subs KINGDOM
👤 6 💾 6.25 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.801470-0500	RedLemon	   INPUT[147]: Veliki.paket.titlovanih.filmova.2025.14.1080p.x264.[ExYuSubs] ⭐
Weapons.2025.1080p.WEBRip.x264.[ExYuSubs]/Weapons.2025.1080p.WEBRip.x264.[ExYuSubs].mp4
👤 5 💾 2.01 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.801670-0500	RedLemon	   INPUT[148]: Weapons.2025.1080p.Blu-ray.Remux.AVC.TrueHD.Atmos.7.1-CiNEPHiLES
👤 5 💾 29.87 GB ⚙️ 1337x | 1080p | torrentio
default	16:41:35.801820-0500	RedLemon	   INPUT[149]: Weapons 2025 1080p BluRay x265-YAWNTiC
👤 5 💾 7.83 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.802020-0500	RedLemon	   INPUT[150]: Орудия / Weapons (2025) WEB-DLRip 1080p | D P A | Movie Dubbing HDrezka Studio Сербин
👤 5 💾 16.32 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:41:35.802161-0500	RedLemon	   INPUT[151]: Weapons 2025 REPACK 1080p WEB-DL HEVC x265-RMTeam
👤 5 💾 1.35 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.802305-0500	RedLemon	   INPUT[152]: Weapons 2025 1080p MA WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 5 💾 1.74 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.802401-0500	RedLemon	   INPUT[153]: Weapons 2025 720p BluRay
👤 100 💾 1.15 GB ⚙️ YTS | 720p | torrentio
default	16:41:35.810317-0500	RedLemon	   INPUT[154]: Weapons 2025 720p WEBRip
👤 100 💾 1.15 GB ⚙️ YTS | 720p | torrentio
default	16:41:35.811209-0500	RedLemon	   INPUT[155]: Орудия / Weapons (2025) BDRip 720p от DoMiNo & селезень | D | Movie Dubbing Red Head Sound
👤 36 💾 5.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:41:35.812640-0500	RedLemon	   INPUT[156]: Weapons (La hora de la desaparicion) (2025) [Bluray 720p][Esp]
👤 36 💾 3.34 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	16:41:35.812936-0500	RedLemon	   INPUT[157]: Weapons.2025.TRUEFRENCH.VF2.720p.WEB.H264-SUPPLY.mkv
👤 32 💾 3.68 GB ⚙️ Torrent9
🇫🇷 | 720p | torrentio
default	16:41:35.813101-0500	RedLemon	   INPUT[158]: Орудия / Weapons (2025) WEB-DL 720p от селезень | D | Movie Dubbing Red Head Sound
👤 26 💾 4.03 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:41:35.813821-0500	RedLemon	   INPUT[159]: Орудия / Weapons (2025) WEB-DL 720p от селезень | P | HDrezka Studio
👤 23 💾 3.45 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:41:35.813972-0500	RedLemon	   INPUT[160]: Орудия / Weapons (2025) WEB-DLRip 720p | D P A
👤 16 💾 7.02 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:41:35.814068-0500	RedLemon	   INPUT[161]: Weapons (2025) 720p WEBRip-LAMA
👤 7 💾 1.15 GB ⚙️ ThePirateBay | 720p | torrentio
default	16:41:35.816040-0500	RedLemon	   INPUT[162]: Weapons 2025 576p WEBRip x265 AAC-SSN
👤 5 💾 1.57 GB ⚙️ ThePirateBay | Unknown | torrentio
default	16:41:35.816219-0500	RedLemon	   INPUT[163]: Weapons 2025 1080p TS EN-RGB
👤 28 💾 5.77 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.816346-0500	RedLemon	   INPUT[164]: Weapons 2025 1080p TELESYNC x264-RGB
👤 11 💾 5.77 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:41:35.816468-0500	RedLemon	   INPUT[165]: Weapons.2025.1080p.TELESYNC.V2.MULTi.x264-SyncUP
👤 7 💾 6.07 GB ⚙️ ThePirateBay
Multi Audio | 1080p | torrentio
default	16:41:35.816581-0500	RedLemon	   INPUT[166]: Weapons.2025.FRENCH.VF2.WEBRip.x264-LACTEL.mkv
👤 96 💾 1.22 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	16:41:35.816698-0500	RedLemon	   INPUT[167]: Орудия / Weapons (2025) WEB-DLRip-AVC от DoMiNo & селезень | P | HDrezka Studio
👤 94 💾 2.29 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:41:35.816809-0500	RedLemon	   INPUT[168]: Орудия / Weapons (2025) BDRip-AVC от селезень | D | Movie Dubbing Red Head Sound
👤 75 💾 2.35 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:41:35.816912-0500	RedLemon	   INPUT[169]: Орудия / Weapons (2025) WEB-DLRip от ELEKTRI4KA | D | Movie Dubbing
👤 44 💾 1.46 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:41:35.817013-0500	RedLemon	   INPUT[170]: Орудия / Weapons (2025) WEB-DLRip от ELEKTRI4KA | P | HDrezka Studio
👤 30 💾 1.47 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:41:35.817112-0500	RedLemon	   INPUT[171]: Орудия / Weapons (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Movie Dubbing Red Head Sound
👤 27 💾 2.29 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:41:35.817219-0500	RedLemon	   INPUT[172]: Орудия / Weapons (2025) WEB-DLRip от DoMiNo & селезень | D | Red Head Sound
👤 14 💾 1.46 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:41:35.817315-0500	RedLemon	   INPUT[173]: Орудия / Weapons (2025) HDRip-AVC от ExKinoRay | D | Red Head Sound
👤 9 💾 745.46 MB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:41:35.817405-0500	RedLemon	   INPUT[174]: Орудия / Weapons (2025) BDRip от MegaPeer | D | Movie Dubbing
👤 6 💾 1.46 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:41:35.817500-0500	RedLemon	   INPUT[175]: Орудия / Weapons (2025) WEB-DLRip-AVC от DoMiNo & селезень | Sub
👤 5 💾 1.95 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:41:35.817589-0500	RedLemon	   INPUT[176]: Weapons (2025) SD H264 MP4 ITA [HD4ME]
👤 5 💾 713.92 MB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | Unknown | torrentio
default	16:41:35.817668-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 2160p | 2160p | comet
default	16:41:35.817918-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 2160p | 2160p | comet
default	16:41:35.818173-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 2160p | 2160p | comet
default	16:41:35.818265-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 2160p | 2160p | comet
default	16:41:35.818344-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 2160p | 2160p | comet
default	16:41:35.818418-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	16:41:35.818491-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	16:41:35.818562-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	16:41:35.818834-0500	RedLemon	🔍 Searching SubDL for subtitles: tt26581740 (movie)
default	16:41:35.819072-0500	RedLemon	Task <612ADD22-193D-46F8-8E96-580DBF6FD770>.<702> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:41:35.880919-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3FC0CC11-6047-4801-9B46-DA1555CDDEB7] (reporting strategy default)> on Task <612ADD22-193D-46F8-8E96-580DBF6FD770>.<702> was not selected for reporting
default	16:41:35.886480-0500	RedLemon	Task <612ADD22-193D-46F8-8E96-580DBF6FD770>.<702> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:35.886847-0500	RedLemon	Task <612ADD22-193D-46F8-8E96-580DBF6FD770>.<702> now using Connection 30
default	16:41:35.887752-0500	RedLemon	0x7fe23e18ced8 ID=4 Task <612ADD22-193D-46F8-8E96-580DBF6FD770>.<702> sent request, body N 0
default	16:41:35.929761-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1777 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:35.929994-0500	runningboardd	Assertion 169-103-1777 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:35.934010-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:35.934055-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:35.934099-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:35.934237-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:35.934279-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:35.934322-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:36.695925-0500	RedLemon	Task <924D342D-2ADE-4BF3-A5D0-214863F371D1>.<703> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:36.696475-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [150CEAE8-A8BD-4DC5-8D10-78778A803E66] (reporting strategy default)> on Task <924D342D-2ADE-4BF3-A5D0-214863F371D1>.<703> was not selected for reporting
default	16:41:36.697704-0500	RedLemon	Task <924D342D-2ADE-4BF3-A5D0-214863F371D1>.<703> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:36.698040-0500	RedLemon	Task <924D342D-2ADE-4BF3-A5D0-214863F371D1>.<703> now using Connection 1
default	16:41:36.699455-0500	RedLemon	0x7fe23e1f1558 ID=2516 Task <924D342D-2ADE-4BF3-A5D0-214863F371D1>.<703> sent request, body N 0
default	16:41:36.768330-0500	RedLemon	0x7fe23e1f1558 ID=2516 Task <924D342D-2ADE-4BF3-A5D0-214863F371D1>.<703> received response, status 200 content U
default	16:41:36.769201-0500	RedLemon	Task <924D342D-2ADE-4BF3-A5D0-214863F371D1>.<703> response ended
default	16:41:36.769854-0500	RedLemon	Task <924D342D-2ADE-4BF3-A5D0-214863F371D1>.<703> done using Connection 1
default	16:41:36.770140-0500	RedLemon	Task <924D342D-2ADE-4BF3-A5D0-214863F371D1>.<703> summary for task success {transaction_duration_ms=73, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=70, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	16:41:36.770500-0500	RedLemon	Task <924D342D-2ADE-4BF3-A5D0-214863F371D1>.<703> finished successfully
default	16:41:36.772972-0500	RedLemon	Task <0FF8E328-6032-4604-BE3F-C597CA86B7E3>.<704> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:36.773377-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [86ED711B-F1B8-494C-87E4-9F987E81569C] (reporting strategy default)> on Task <0FF8E328-6032-4604-BE3F-C597CA86B7E3>.<704> was not selected for reporting
default	16:41:36.774060-0500	RedLemon	Task <0FF8E328-6032-4604-BE3F-C597CA86B7E3>.<704> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:36.774255-0500	RedLemon	Task <0FF8E328-6032-4604-BE3F-C597CA86B7E3>.<704> now using Connection 1
default	16:41:36.775111-0500	RedLemon	0x7fe23e1f1558 ID=2520 Task <0FF8E328-6032-4604-BE3F-C597CA86B7E3>.<704> sent request, body N 0
default	16:41:36.782593-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:36.846954-0500	RedLemon	0x7fe23e1f1558 ID=2520 Task <0FF8E328-6032-4604-BE3F-C597CA86B7E3>.<704> received response, status 200 content U
default	16:41:36.847803-0500	RedLemon	Task <0FF8E328-6032-4604-BE3F-C597CA86B7E3>.<704> response ended
default	16:41:36.848234-0500	RedLemon	Task <0FF8E328-6032-4604-BE3F-C597CA86B7E3>.<704> done using Connection 1
default	16:41:36.848481-0500	RedLemon	Task <0FF8E328-6032-4604-BE3F-C597CA86B7E3>.<704> summary for task success {transaction_duration_ms=74, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=72, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:36.849082-0500	RedLemon	Task <0FF8E328-6032-4604-BE3F-C597CA86B7E3>.<704> finished successfully
default	16:41:36.851181-0500	RedLemon	Task <04C0156D-60CE-4191-A8CE-895514DCAEE9>.<705> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:36.851490-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0DC380ED-AC8D-4E51-8B2C-98C381DA7BB0] (reporting strategy default)> on Task <04C0156D-60CE-4191-A8CE-895514DCAEE9>.<705> was not selected for reporting
default	16:41:36.852159-0500	RedLemon	Task <04C0156D-60CE-4191-A8CE-895514DCAEE9>.<705> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:36.852361-0500	RedLemon	Task <04C0156D-60CE-4191-A8CE-895514DCAEE9>.<705> now using Connection 1
default	16:41:36.853117-0500	RedLemon	0x7fe23b3e4448 ID=2524 Task <04C0156D-60CE-4191-A8CE-895514DCAEE9>.<705> sent request, body N 0
default	16:41:36.863951-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:36.930119-0500	RedLemon	0x7fe23b3e4448 ID=2524 Task <04C0156D-60CE-4191-A8CE-895514DCAEE9>.<705> received response, status 200 content U
default	16:41:36.931063-0500	RedLemon	Task <04C0156D-60CE-4191-A8CE-895514DCAEE9>.<705> response ended
default	16:41:36.932030-0500	RedLemon	Task <04C0156D-60CE-4191-A8CE-895514DCAEE9>.<705> done using Connection 1
default	16:41:36.932775-0500	RedLemon	Task <04C0156D-60CE-4191-A8CE-895514DCAEE9>.<705> summary for task success {transaction_duration_ms=80, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=78, response_duration_ms=2, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:41:36.933156-0500	RedLemon	Task <04C0156D-60CE-4191-A8CE-895514DCAEE9>.<705> finished successfully
default	16:41:36.934700-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:36.944859-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:37.031488-0500	runningboardd	Invalidating assertion 169-6308-1776 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:37.142357-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:37.142402-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:37.142446-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:37.143537-0500	runningboardd	Invalidating assertion 169-103-1777 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:37.308928-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:37.308979-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:37.309031-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:38.096164-0500	RedLemon	[C40] event: client:data_stall @3.011s
error	16:41:38.098752-0500	symptomsd	Unexpected type 4 for interface index 1 from libnetcore event EventDescription sb at 0x7fcd7b93b000 from pid 6308 RedLemon SYMPTOM 0x6767002  flags 0x40000003 qual0 0x1 qual1 0x18a4 key 421890 num additional quals 4
default	16:41:38.100624-0500	symptomsd	Stall symptom detail: (symName/procName/ePid/ifIndex/interfaceType/stallType/endpoint/isFgOrBg): SYMPTOM_LIBNETCORE_DATA_STALL/RedLemon/6308/1/4/1/<private>/0
default	16:41:38.100711-0500	symptomsd	Stall symptom: RedLemon has stale endpoint for stall type (1) on interface type (4), removing it: <private>
default	16:41:38.100778-0500	symptomsd	Stall symptom: RedLemon has 1 stale endpoints total for stall type (4) on interface type (1), removed them
default	16:41:38.100837-0500	symptomsd	Stall symptom SYMPTOM_LIBNETCORE_DATA_STALL: added unique stall type (1) on interface type (4) for existing process RedLemon
default	16:41:38.905226-0500	RedLemon	[C30] event: client:data_stall @115.744s
default	16:41:38.909044-0500	symptomsd	Stall symptom detail: (symName/procName/ePid/ifIndex/interfaceType/stallType/endpoint/isFgOrBg): SYMPTOM_LIBNETCORE_DATA_STALL/RedLemon/6308/5/1/1/<private>/0
default	16:41:38.909154-0500	symptomsd	Stall symptom SYMPTOM_LIBNETCORE_DATA_STALL: added unique stall type (1) on interface type (1) for existing process RedLemon
default	16:41:39.097054-0500	RedLemon	Task <03814F2D-DA58-4D23-B315-4F8D77EB09D5>.<706> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:39.097632-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [93C31EE2-6A5A-4E9D-9304-DAFFEA89819C] (reporting strategy default)> on Task <03814F2D-DA58-4D23-B315-4F8D77EB09D5>.<706> was not selected for reporting
default	16:41:39.098864-0500	RedLemon	Task <03814F2D-DA58-4D23-B315-4F8D77EB09D5>.<706> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:39.099200-0500	RedLemon	Task <03814F2D-DA58-4D23-B315-4F8D77EB09D5>.<706> now using Connection 1
default	16:41:39.100488-0500	RedLemon	0x7fe23c313bd8 ID=2528 Task <03814F2D-DA58-4D23-B315-4F8D77EB09D5>.<706> sent request, body N 0
default	16:41:39.182023-0500	RedLemon	0x7fe23c313bd8 ID=2528 Task <03814F2D-DA58-4D23-B315-4F8D77EB09D5>.<706> received response, status 200 content U
default	16:41:39.182847-0500	RedLemon	Task <03814F2D-DA58-4D23-B315-4F8D77EB09D5>.<706> response ended
default	16:41:39.183290-0500	RedLemon	Task <03814F2D-DA58-4D23-B315-4F8D77EB09D5>.<706> done using Connection 1
default	16:41:39.183542-0500	RedLemon	Task <03814F2D-DA58-4D23-B315-4F8D77EB09D5>.<706> summary for task success {transaction_duration_ms=85, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=83, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	16:41:39.184163-0500	RedLemon	Task <03814F2D-DA58-4D23-B315-4F8D77EB09D5>.<706> finished successfully
default	16:41:39.185239-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1778 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:39.185471-0500	runningboardd	Assertion 169-6308-1778 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:39.185894-0500	RedLemon	Task <3A2727F8-FB48-4B85-B425-947B042E380E>.<707> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:39.186276-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [18A79656-246D-49DD-B154-4EFE456EE256] (reporting strategy default)> on Task <3A2727F8-FB48-4B85-B425-947B042E380E>.<707> was not selected for reporting
default	16:41:39.187025-0500	RedLemon	Task <3A2727F8-FB48-4B85-B425-947B042E380E>.<707> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:39.187316-0500	RedLemon	Task <3A2727F8-FB48-4B85-B425-947B042E380E>.<707> now using Connection 1
default	16:41:39.188425-0500	RedLemon	0x7fe23c313bd8 ID=2532 Task <3A2727F8-FB48-4B85-B425-947B042E380E>.<707> sent request, body N 0
default	16:41:39.189157-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:39.189347-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:39.189404-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:39.191029-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1779 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:39.191355-0500	runningboardd	Assertion 169-103-1779 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:39.192338-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:39.192389-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:39.192435-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:39.204896-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:39.252316-0500	RedLemon	0x7fe23c313bd8 ID=2532 Task <3A2727F8-FB48-4B85-B425-947B042E380E>.<707> received response, status 200 content U
default	16:41:39.252901-0500	RedLemon	Task <3A2727F8-FB48-4B85-B425-947B042E380E>.<707> response ended
default	16:41:39.253366-0500	RedLemon	Task <3A2727F8-FB48-4B85-B425-947B042E380E>.<707> done using Connection 1
default	16:41:39.253593-0500	RedLemon	Task <3A2727F8-FB48-4B85-B425-947B042E380E>.<707> summary for task success {transaction_duration_ms=67, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=65, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:39.254168-0500	RedLemon	Task <3A2727F8-FB48-4B85-B425-947B042E380E>.<707> finished successfully
default	16:41:39.256944-0500	RedLemon	Task <10448ADA-C4B0-449A-B5E7-AEBD7024F644>.<708> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:39.257244-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6EE68E05-2F86-4701-9C16-E7CC732D010A] (reporting strategy default)> on Task <10448ADA-C4B0-449A-B5E7-AEBD7024F644>.<708> was not selected for reporting
default	16:41:39.258152-0500	RedLemon	Task <10448ADA-C4B0-449A-B5E7-AEBD7024F644>.<708> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:39.258394-0500	RedLemon	Task <10448ADA-C4B0-449A-B5E7-AEBD7024F644>.<708> now using Connection 1
default	16:41:39.259133-0500	RedLemon	0x7fe23b3e4448 ID=2536 Task <10448ADA-C4B0-449A-B5E7-AEBD7024F644>.<708> sent request, body N 0
default	16:41:39.275788-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:39.323920-0500	RedLemon	0x7fe23b3e4448 ID=2536 Task <10448ADA-C4B0-449A-B5E7-AEBD7024F644>.<708> received response, status 200 content U
default	16:41:39.324470-0500	RedLemon	Task <10448ADA-C4B0-449A-B5E7-AEBD7024F644>.<708> response ended
default	16:41:39.324899-0500	RedLemon	Task <10448ADA-C4B0-449A-B5E7-AEBD7024F644>.<708> done using Connection 1
default	16:41:39.325067-0500	RedLemon	Task <10448ADA-C4B0-449A-B5E7-AEBD7024F644>.<708> summary for task success {transaction_duration_ms=67, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=66, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:39.325239-0500	RedLemon	Task <10448ADA-C4B0-449A-B5E7-AEBD7024F644>.<708> finished successfully
default	16:41:39.326728-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:39.366242-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:40.242435-0500	runningboardd	Invalidating assertion 169-6308-1778 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:40.411108-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:40.411194-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:40.411267-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:40.413638-0500	runningboardd	Invalidating assertion 169-103-1779 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:40.534265-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:40.534327-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:40.534637-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:41.498286-0500	RedLemon	Task <F38E7E74-D5A4-4904-99B2-07D17BF7EF6D>.<709> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:41.498858-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [600C71C0-2AB1-43CF-A544-9B9F69FBA7C9] (reporting strategy default)> on Task <F38E7E74-D5A4-4904-99B2-07D17BF7EF6D>.<709> was not selected for reporting
default	16:41:41.499730-0500	RedLemon	Task <F38E7E74-D5A4-4904-99B2-07D17BF7EF6D>.<709> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:41.499967-0500	RedLemon	Task <F38E7E74-D5A4-4904-99B2-07D17BF7EF6D>.<709> now using Connection 1
default	16:41:41.500799-0500	RedLemon	0x7fe23c313bd8 ID=2540 Task <F38E7E74-D5A4-4904-99B2-07D17BF7EF6D>.<709> sent request, body N 0
default	16:41:41.738318-0500	RedLemon	0x7fe23c313bd8 ID=2540 Task <F38E7E74-D5A4-4904-99B2-07D17BF7EF6D>.<709> received response, status 200 content U
default	16:41:41.739517-0500	RedLemon	Task <F38E7E74-D5A4-4904-99B2-07D17BF7EF6D>.<709> response ended
default	16:41:41.739959-0500	RedLemon	Task <F38E7E74-D5A4-4904-99B2-07D17BF7EF6D>.<709> done using Connection 1
default	16:41:41.740335-0500	RedLemon	Task <F38E7E74-D5A4-4904-99B2-07D17BF7EF6D>.<709> summary for task success {transaction_duration_ms=240, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=238, response_duration_ms=2, request_bytes=511, response_bytes=838, cache_hit=true}
default	16:41:41.741009-0500	RedLemon	Task <F38E7E74-D5A4-4904-99B2-07D17BF7EF6D>.<709> finished successfully
default	16:41:41.743308-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1780 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:41.743480-0500	RedLemon	Task <CF01D3D6-B367-450C-9949-FF4FF43E153D>.<710> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:41.743539-0500	runningboardd	Assertion 169-6308-1780 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:41.743885-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DDDFBE62-A80F-4654-A170-E53C53569E8D] (reporting strategy default)> on Task <CF01D3D6-B367-450C-9949-FF4FF43E153D>.<710> was not selected for reporting
default	16:41:41.744641-0500	RedLemon	Task <CF01D3D6-B367-450C-9949-FF4FF43E153D>.<710> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:41.744927-0500	RedLemon	Task <CF01D3D6-B367-450C-9949-FF4FF43E153D>.<710> now using Connection 1
default	16:41:41.745899-0500	RedLemon	0x7fe238bd8118 ID=2544 Task <CF01D3D6-B367-450C-9949-FF4FF43E153D>.<710> sent request, body N 0
default	16:41:41.746228-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:41.746282-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:41.746326-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:41.747958-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1781 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:41.748193-0500	runningboardd	Assertion 169-103-1781 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:41.749119-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:41.749228-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:41.749289-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:41.754503-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:41.809261-0500	RedLemon	0x7fe238bd8118 ID=2544 Task <CF01D3D6-B367-450C-9949-FF4FF43E153D>.<710> received response, status 200 content U
default	16:41:41.810065-0500	RedLemon	Task <CF01D3D6-B367-450C-9949-FF4FF43E153D>.<710> response ended
default	16:41:41.810568-0500	RedLemon	Task <CF01D3D6-B367-450C-9949-FF4FF43E153D>.<710> done using Connection 1
default	16:41:41.810796-0500	RedLemon	Task <CF01D3D6-B367-450C-9949-FF4FF43E153D>.<710> summary for task success {transaction_duration_ms=66, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=2, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:41:41.811187-0500	RedLemon	Task <CF01D3D6-B367-450C-9949-FF4FF43E153D>.<710> finished successfully
default	16:41:41.812789-0500	RedLemon	Task <D192DF87-21C4-4847-8E75-EE20003356A4>.<711> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:41.813092-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9318753D-43BB-4318-B7AE-3C0A78D01808] (reporting strategy default)> on Task <D192DF87-21C4-4847-8E75-EE20003356A4>.<711> was not selected for reporting
default	16:41:41.813786-0500	RedLemon	Task <D192DF87-21C4-4847-8E75-EE20003356A4>.<711> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:41.813994-0500	RedLemon	Task <D192DF87-21C4-4847-8E75-EE20003356A4>.<711> now using Connection 1
default	16:41:41.814815-0500	RedLemon	0x7fe23b3e4448 ID=2548 Task <D192DF87-21C4-4847-8E75-EE20003356A4>.<711> sent request, body N 0
default	16:41:41.885200-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:41.931597-0500	RedLemon	0x7fe23b3e4448 ID=2548 Task <D192DF87-21C4-4847-8E75-EE20003356A4>.<711> received response, status 200 content U
default	16:41:41.932542-0500	RedLemon	Task <D192DF87-21C4-4847-8E75-EE20003356A4>.<711> response ended
default	16:41:41.933046-0500	RedLemon	Task <D192DF87-21C4-4847-8E75-EE20003356A4>.<711> done using Connection 1
default	16:41:41.933275-0500	RedLemon	Task <D192DF87-21C4-4847-8E75-EE20003356A4>.<711> summary for task success {transaction_duration_ms=119, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=117, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:41.934063-0500	RedLemon	Task <D192DF87-21C4-4847-8E75-EE20003356A4>.<711> finished successfully
default	16:41:41.936260-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:42.069334-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:42.807907-0500	runningboardd	Invalidating assertion 169-6308-1780 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:42.978178-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:42.978225-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:42.978276-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:42.979171-0500	runningboardd	Invalidating assertion 169-103-1781 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:43.144943-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:43.144996-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:43.145045-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:44.099488-0500	RedLemon	Task <E1C95D58-62E1-42DC-8A43-BBB993BB01F5>.<712> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:44.099997-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [66BC308F-C746-4577-8C5E-D8349F9E20AE] (reporting strategy default)> on Task <E1C95D58-62E1-42DC-8A43-BBB993BB01F5>.<712> was not selected for reporting
default	16:41:44.101006-0500	RedLemon	Task <E1C95D58-62E1-42DC-8A43-BBB993BB01F5>.<712> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:44.101211-0500	RedLemon	Task <E1C95D58-62E1-42DC-8A43-BBB993BB01F5>.<712> now using Connection 1
default	16:41:44.101965-0500	RedLemon	0x7fe23b3e4448 ID=2552 Task <E1C95D58-62E1-42DC-8A43-BBB993BB01F5>.<712> sent request, body N 0
default	16:41:44.168544-0500	RedLemon	0x7fe23b3e4448 ID=2552 Task <E1C95D58-62E1-42DC-8A43-BBB993BB01F5>.<712> received response, status 200 content U
default	16:41:44.169158-0500	RedLemon	Task <E1C95D58-62E1-42DC-8A43-BBB993BB01F5>.<712> response ended
default	16:41:44.169590-0500	RedLemon	Task <E1C95D58-62E1-42DC-8A43-BBB993BB01F5>.<712> done using Connection 1
default	16:41:44.169821-0500	RedLemon	Task <E1C95D58-62E1-42DC-8A43-BBB993BB01F5>.<712> summary for task success {transaction_duration_ms=69, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=67, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	16:41:44.170429-0500	RedLemon	Task <E1C95D58-62E1-42DC-8A43-BBB993BB01F5>.<712> finished successfully
default	16:41:44.172044-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1782 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:44.172220-0500	runningboardd	Assertion 169-6308-1782 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:44.172740-0500	RedLemon	Task <24F73D22-92F0-4792-88A4-EDB80BAF5624>.<713> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:44.173142-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [943EE605-90B1-4766-AD20-DC4659E28DE5] (reporting strategy default)> on Task <24F73D22-92F0-4792-88A4-EDB80BAF5624>.<713> was not selected for reporting
default	16:41:44.173927-0500	RedLemon	Task <24F73D22-92F0-4792-88A4-EDB80BAF5624>.<713> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:44.174226-0500	RedLemon	Task <24F73D22-92F0-4792-88A4-EDB80BAF5624>.<713> now using Connection 1
default	16:41:44.175295-0500	RedLemon	0x7fe23b3e4448 ID=2556 Task <24F73D22-92F0-4792-88A4-EDB80BAF5624>.<713> sent request, body N 0
default	16:41:44.176177-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:44.176287-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:44.176450-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:44.179162-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1783 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:44.179313-0500	runningboardd	Assertion 169-103-1783 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:44.180166-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:44.180216-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:44.180263-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:44.189970-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:44.234066-0500	RedLemon	0x7fe23b3e4448 ID=2556 Task <24F73D22-92F0-4792-88A4-EDB80BAF5624>.<713> received response, status 200 content U
default	16:41:44.234648-0500	RedLemon	Task <24F73D22-92F0-4792-88A4-EDB80BAF5624>.<713> response ended
default	16:41:44.235084-0500	RedLemon	Task <24F73D22-92F0-4792-88A4-EDB80BAF5624>.<713> done using Connection 1
default	16:41:44.235308-0500	RedLemon	Task <24F73D22-92F0-4792-88A4-EDB80BAF5624>.<713> summary for task success {transaction_duration_ms=61, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=60, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:44.235878-0500	RedLemon	Task <24F73D22-92F0-4792-88A4-EDB80BAF5624>.<713> finished successfully
default	16:41:44.237873-0500	RedLemon	Task <3CB57F85-4F59-4FB0-97FA-D81FF9C944A7>.<714> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:44.238228-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [111AE80E-C2FF-475F-A4AE-EA1306280829] (reporting strategy default)> on Task <3CB57F85-4F59-4FB0-97FA-D81FF9C944A7>.<714> was not selected for reporting
default	16:41:44.238979-0500	RedLemon	Task <3CB57F85-4F59-4FB0-97FA-D81FF9C944A7>.<714> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:44.239182-0500	RedLemon	Task <3CB57F85-4F59-4FB0-97FA-D81FF9C944A7>.<714> now using Connection 1
default	16:41:44.239943-0500	RedLemon	0x7fe23b3e4448 ID=2560 Task <3CB57F85-4F59-4FB0-97FA-D81FF9C944A7>.<714> sent request, body N 0
default	16:41:44.280878-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:44.328542-0500	RedLemon	0x7fe23b3e4448 ID=2560 Task <3CB57F85-4F59-4FB0-97FA-D81FF9C944A7>.<714> received response, status 200 content U
default	16:41:44.329339-0500	RedLemon	Task <3CB57F85-4F59-4FB0-97FA-D81FF9C944A7>.<714> response ended
default	16:41:44.329677-0500	RedLemon	Task <3CB57F85-4F59-4FB0-97FA-D81FF9C944A7>.<714> done using Connection 1
default	16:41:44.329818-0500	RedLemon	Task <3CB57F85-4F59-4FB0-97FA-D81FF9C944A7>.<714> summary for task success {transaction_duration_ms=91, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=89, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:44.330272-0500	RedLemon	Task <3CB57F85-4F59-4FB0-97FA-D81FF9C944A7>.<714> finished successfully
default	16:41:44.331661-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:44.369599-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:45.215514-0500	runningboardd	Invalidating assertion 169-6308-1782 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:45.383057-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:45.383135-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:45.383279-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:45.386753-0500	runningboardd	Invalidating assertion 169-103-1783 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:45.501692-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:45.501779-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:45.501869-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:46.426067-0500	RedLemon	Task <8ED91DEA-D0A7-4B95-9820-05D96BB95055>.<715> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:46.426742-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BE59B04C-A178-4634-ACB4-16C3986903CD] (reporting strategy default)> on Task <8ED91DEA-D0A7-4B95-9820-05D96BB95055>.<715> was not selected for reporting
default	16:41:46.427972-0500	RedLemon	Task <8ED91DEA-D0A7-4B95-9820-05D96BB95055>.<715> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:46.428297-0500	RedLemon	Task <8ED91DEA-D0A7-4B95-9820-05D96BB95055>.<715> now using Connection 1
default	16:41:46.429740-0500	RedLemon	0x7fe23b3e4448 ID=2564 Task <8ED91DEA-D0A7-4B95-9820-05D96BB95055>.<715> sent request, body N 0
default	16:41:46.497562-0500	RedLemon	0x7fe23b3e4448 ID=2564 Task <8ED91DEA-D0A7-4B95-9820-05D96BB95055>.<715> received response, status 200 content U
default	16:41:46.498323-0500	RedLemon	Task <8ED91DEA-D0A7-4B95-9820-05D96BB95055>.<715> response ended
default	16:41:46.498982-0500	RedLemon	Task <8ED91DEA-D0A7-4B95-9820-05D96BB95055>.<715> done using Connection 1
default	16:41:46.499265-0500	RedLemon	Task <8ED91DEA-D0A7-4B95-9820-05D96BB95055>.<715> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=69, response_duration_ms=1, request_bytes=511, response_bytes=834, cache_hit=true}
default	16:41:46.499887-0500	RedLemon	Task <8ED91DEA-D0A7-4B95-9820-05D96BB95055>.<715> finished successfully
default	16:41:46.501115-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1784 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:46.501332-0500	runningboardd	Assertion 169-6308-1784 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:46.502131-0500	RedLemon	Task <C4219CE1-7228-4765-904A-9ACDA9844141>.<716> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:46.502510-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B5905B59-64DA-4B26-B228-F130F0584C41] (reporting strategy default)> on Task <C4219CE1-7228-4765-904A-9ACDA9844141>.<716> was not selected for reporting
default	16:41:46.503285-0500	RedLemon	Task <C4219CE1-7228-4765-904A-9ACDA9844141>.<716> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:46.503576-0500	RedLemon	Task <C4219CE1-7228-4765-904A-9ACDA9844141>.<716> now using Connection 1
default	16:41:46.504587-0500	RedLemon	0x7fe23c313bd8 ID=2568 Task <C4219CE1-7228-4765-904A-9ACDA9844141>.<716> sent request, body N 0
default	16:41:46.505012-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:46.505109-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:46.505220-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:46.505862-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1785 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:46.506103-0500	runningboardd	Assertion 169-103-1785 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:46.507229-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:46.507456-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:46.507503-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:46.520612-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:46.567315-0500	RedLemon	0x7fe23c313bd8 ID=2568 Task <C4219CE1-7228-4765-904A-9ACDA9844141>.<716> received response, status 200 content U
default	16:41:46.567981-0500	RedLemon	Task <C4219CE1-7228-4765-904A-9ACDA9844141>.<716> response ended
default	16:41:46.568677-0500	RedLemon	Task <C4219CE1-7228-4765-904A-9ACDA9844141>.<716> done using Connection 1
default	16:41:46.570400-0500	RedLemon	Task <C4219CE1-7228-4765-904A-9ACDA9844141>.<716> summary for task success {transaction_duration_ms=67, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=63, response_duration_ms=2, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:41:46.570625-0500	RedLemon	Task <C4219CE1-7228-4765-904A-9ACDA9844141>.<716> finished successfully
default	16:41:46.572866-0500	RedLemon	Task <50AD7E78-D7F8-4F5B-9B09-6048BFD139C9>.<717> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:46.573156-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [41A15558-B934-4EA8-8528-22F1D0F9270C] (reporting strategy default)> on Task <50AD7E78-D7F8-4F5B-9B09-6048BFD139C9>.<717> was not selected for reporting
default	16:41:46.573925-0500	RedLemon	Task <50AD7E78-D7F8-4F5B-9B09-6048BFD139C9>.<717> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:46.574162-0500	RedLemon	Task <50AD7E78-D7F8-4F5B-9B09-6048BFD139C9>.<717> now using Connection 1
default	16:41:46.574907-0500	RedLemon	0x7fe23c313bd8 ID=2572 Task <50AD7E78-D7F8-4F5B-9B09-6048BFD139C9>.<717> sent request, body N 0
default	16:41:46.582472-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:46.654016-0500	RedLemon	0x7fe23c313bd8 ID=2572 Task <50AD7E78-D7F8-4F5B-9B09-6048BFD139C9>.<717> received response, status 200 content U
default	16:41:46.654596-0500	RedLemon	Task <50AD7E78-D7F8-4F5B-9B09-6048BFD139C9>.<717> response ended
default	16:41:46.654988-0500	RedLemon	Task <50AD7E78-D7F8-4F5B-9B09-6048BFD139C9>.<717> done using Connection 1
default	16:41:46.655157-0500	RedLemon	Task <50AD7E78-D7F8-4F5B-9B09-6048BFD139C9>.<717> summary for task success {transaction_duration_ms=81, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=80, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:46.655338-0500	RedLemon	Task <50AD7E78-D7F8-4F5B-9B09-6048BFD139C9>.<717> finished successfully
default	16:41:46.657376-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:46.668589-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:47.601295-0500	runningboardd	Invalidating assertion 169-6308-1784 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:47.736609-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:47.736685-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:47.736758-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:47.739566-0500	runningboardd	Invalidating assertion 169-103-1785 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:47.904896-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:47.904992-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:47.905204-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:48.701790-0500	RedLemon	Task <61E85094-8129-44E1-8BD6-7B0288C9D371>.<718> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:48.702346-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1B663EBE-9871-4482-9E36-0EF1B3F1488D] (reporting strategy default)> on Task <61E85094-8129-44E1-8BD6-7B0288C9D371>.<718> was not selected for reporting
default	16:41:48.703097-0500	RedLemon	Task <61E85094-8129-44E1-8BD6-7B0288C9D371>.<718> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:48.703310-0500	RedLemon	Task <61E85094-8129-44E1-8BD6-7B0288C9D371>.<718> now using Connection 1
default	16:41:48.704176-0500	RedLemon	0x7fe23c313bd8 ID=2576 Task <61E85094-8129-44E1-8BD6-7B0288C9D371>.<718> sent request, body N 0
default	16:41:48.778575-0500	RedLemon	0x7fe23c313bd8 ID=2576 Task <61E85094-8129-44E1-8BD6-7B0288C9D371>.<718> received response, status 200 content U
default	16:41:48.779776-0500	RedLemon	Task <61E85094-8129-44E1-8BD6-7B0288C9D371>.<718> response ended
default	16:41:48.780337-0500	RedLemon	Task <61E85094-8129-44E1-8BD6-7B0288C9D371>.<718> done using Connection 1
default	16:41:48.780566-0500	RedLemon	Task <61E85094-8129-44E1-8BD6-7B0288C9D371>.<718> summary for task success {transaction_duration_ms=77, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=75, response_duration_ms=2, request_bytes=511, response_bytes=839, cache_hit=true}
default	16:41:48.781127-0500	RedLemon	Task <61E85094-8129-44E1-8BD6-7B0288C9D371>.<718> finished successfully
default	16:41:48.782156-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1786 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:48.782373-0500	runningboardd	Assertion 169-6308-1786 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:48.782816-0500	RedLemon	Task <4F6C1174-94E9-46E7-A7AD-40627F7002EB>.<719> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:48.783196-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7A8988DB-AC83-4FA5-A8A6-E5CAB94524D1] (reporting strategy default)> on Task <4F6C1174-94E9-46E7-A7AD-40627F7002EB>.<719> was not selected for reporting
default	16:41:48.783978-0500	RedLemon	Task <4F6C1174-94E9-46E7-A7AD-40627F7002EB>.<719> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:48.784254-0500	RedLemon	Task <4F6C1174-94E9-46E7-A7AD-40627F7002EB>.<719> now using Connection 1
default	16:41:48.785173-0500	RedLemon	0x7fe23c313bd8 ID=2580 Task <4F6C1174-94E9-46E7-A7AD-40627F7002EB>.<719> sent request, body N 0
default	16:41:48.785361-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:48.785609-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:48.785706-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:48.787137-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1787 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:48.787394-0500	runningboardd	Assertion 169-103-1787 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:48.788182-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:48.788225-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:48.788336-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:48.791726-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:48.852905-0500	RedLemon	0x7fe23c313bd8 ID=2580 Task <4F6C1174-94E9-46E7-A7AD-40627F7002EB>.<719> received response, status 200 content U
default	16:41:48.853487-0500	RedLemon	Task <4F6C1174-94E9-46E7-A7AD-40627F7002EB>.<719> response ended
default	16:41:48.853924-0500	RedLemon	Task <4F6C1174-94E9-46E7-A7AD-40627F7002EB>.<719> done using Connection 1
default	16:41:48.854149-0500	RedLemon	Task <4F6C1174-94E9-46E7-A7AD-40627F7002EB>.<719> summary for task success {transaction_duration_ms=70, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:48.854726-0500	RedLemon	Task <4F6C1174-94E9-46E7-A7AD-40627F7002EB>.<719> finished successfully
default	16:41:48.856918-0500	RedLemon	Task <2546F8EA-698E-4558-B720-597EF04F8331>.<720> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:48.857220-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0B1C5F1D-C1B4-4E35-9600-7DA2FACBA1B4] (reporting strategy default)> on Task <2546F8EA-698E-4558-B720-597EF04F8331>.<720> was not selected for reporting
default	16:41:48.857997-0500	RedLemon	Task <2546F8EA-698E-4558-B720-597EF04F8331>.<720> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:48.858211-0500	RedLemon	Task <2546F8EA-698E-4558-B720-597EF04F8331>.<720> now using Connection 1
default	16:41:48.858943-0500	RedLemon	0x7fe23c313bd8 ID=2584 Task <2546F8EA-698E-4558-B720-597EF04F8331>.<720> sent request, body N 0
default	16:41:48.877273-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:48.931727-0500	RedLemon	0x7fe23c313bd8 ID=2584 Task <2546F8EA-698E-4558-B720-597EF04F8331>.<720> received response, status 200 content U
default	16:41:48.932442-0500	RedLemon	Task <2546F8EA-698E-4558-B720-597EF04F8331>.<720> response ended
default	16:41:48.932892-0500	RedLemon	Task <2546F8EA-698E-4558-B720-597EF04F8331>.<720> done using Connection 1
default	16:41:48.933118-0500	RedLemon	Task <2546F8EA-698E-4558-B720-597EF04F8331>.<720> summary for task success {transaction_duration_ms=75, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=73, response_duration_ms=1, request_bytes=524, response_bytes=841, cache_hit=true}
default	16:41:48.933924-0500	RedLemon	Task <2546F8EA-698E-4558-B720-597EF04F8331>.<720> finished successfully
default	16:41:48.935626-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:48.972971-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:49.887923-0500	runningboardd	Invalidating assertion 169-6308-1786 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:50.003916-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:50.003988-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:50.004381-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:50.006243-0500	runningboardd	Invalidating assertion 169-103-1787 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:50.176171-0500	RedLemon	tcp_input [C37.1.1:3] flags=[F.] seq=2317668901, ack=3554863858, win=8 state=ESTABLISHED rcv_nxt=2317668901, snd_una=3554863858
default	16:41:50.176271-0500	RedLemon	nw_protocol_tcp_log_summary [C37.1.1:3] 
	[A078FD02-8CEF-479D-BB97-788C0732FA69 <private>:57439<-><private>:443]
	Init: 1, Conn_Time: 14.745ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 12, rtt: 28.562ms, rtt_var: 16.812ms rtt_nc: 25.718ms, rtt_var_nc: 15.500ms base rtt: 9ms
	ACKs-compressed: 0, ACKs delayed: 134 delayed ACKs sent: 0
default	16:41:50.176923-0500	RedLemon	Connection 37: read-side closed
default	16:41:50.176956-0500	RedLemon	Connection 37: read-side closed
default	16:41:50.177057-0500	RedLemon	Connection 37: read-side closed
default	16:41:50.177279-0500	RedLemon	Connection 37: cleaning up
default	16:41:50.177346-0500	RedLemon	[C37 B182F655-AFF1-42B4-82A3-2BB77565BD40 Hostname#5a828566:443 quic-connection, url hash: 8005778e, definite, attribution: developer] cancel
default	16:41:50.177480-0500	RedLemon	[C37 B182F655-AFF1-42B4-82A3-2BB77565BD40 Hostname#5a828566:443 quic-connection, url hash: 8005778e, definite, attribution: developer] cancelled
	[C37.1.1 32F6E45D-0EF1-4111-A336-EB823367A2DA 2607:fea8:995b:fd00:7141:6ed:4959:38c8.57439<->IPv6#1a273ade.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 27.027s, DNS @0.001s took 0.050s, TCP @0.053s took 0.016s, TLS 1.3 took 0.043s
	bytes in/out: 1571106/1297, packets in/out: 224/212, rtt: 0.028s, retransmitted bytes: 0, out-of-order bytes: 45696
default	16:41:50.178632-0500	RedLemon	nw_flow_disconnected [C37.1.1 IPv6#1a273ade.443 cancelled channel-flow ((null))] Output protocol disconnected
default	16:41:50.178985-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C37] reporting state cancelled
default	16:41:50.179100-0500	RedLemon	tcp_output [C37.1.1:3] flags=[FP.] seq=3554863897, ack=2317668902, win=19585 state=LAST_ACK rcv_nxt=2317668902, snd_una=3554863858
default	16:41:50.181864-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:50.181960-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:50.182096-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:51.003026-0500	RedLemon	Task <DE73E96E-CE02-49A7-8949-AF65C1E4F3B0>.<721> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:51.003566-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [96317DD8-277B-480C-8A50-E69B8B6FAB15] (reporting strategy default)> on Task <DE73E96E-CE02-49A7-8949-AF65C1E4F3B0>.<721> was not selected for reporting
default	16:41:51.004547-0500	RedLemon	Task <DE73E96E-CE02-49A7-8949-AF65C1E4F3B0>.<721> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:51.004750-0500	RedLemon	Task <DE73E96E-CE02-49A7-8949-AF65C1E4F3B0>.<721> now using Connection 1
default	16:41:51.005614-0500	RedLemon	0x7fe23c313bd8 ID=2588 Task <DE73E96E-CE02-49A7-8949-AF65C1E4F3B0>.<721> sent request, body N 0
default	16:41:51.079833-0500	RedLemon	0x7fe23c313bd8 ID=2588 Task <DE73E96E-CE02-49A7-8949-AF65C1E4F3B0>.<721> received response, status 200 content U
default	16:41:51.080882-0500	RedLemon	Task <DE73E96E-CE02-49A7-8949-AF65C1E4F3B0>.<721> response ended
default	16:41:51.081566-0500	RedLemon	Task <DE73E96E-CE02-49A7-8949-AF65C1E4F3B0>.<721> done using Connection 1
default	16:41:51.081826-0500	RedLemon	Task <DE73E96E-CE02-49A7-8949-AF65C1E4F3B0>.<721> summary for task success {transaction_duration_ms=77, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=75, response_duration_ms=2, request_bytes=511, response_bytes=839, cache_hit=true}
default	16:41:51.082201-0500	RedLemon	Task <DE73E96E-CE02-49A7-8949-AF65C1E4F3B0>.<721> finished successfully
default	16:41:51.083240-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1788 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:51.083442-0500	runningboardd	Assertion 169-6308-1788 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:51.083806-0500	RedLemon	Task <FE45A8CE-C5D4-445B-ABA5-DE1F4CF47E8C>.<722> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:51.084278-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [18C4FACF-5780-46CF-8F36-9C899F10F0A4] (reporting strategy default)> on Task <FE45A8CE-C5D4-445B-ABA5-DE1F4CF47E8C>.<722> was not selected for reporting
default	16:41:51.085202-0500	RedLemon	Task <FE45A8CE-C5D4-445B-ABA5-DE1F4CF47E8C>.<722> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:51.085479-0500	RedLemon	Task <FE45A8CE-C5D4-445B-ABA5-DE1F4CF47E8C>.<722> now using Connection 1
default	16:41:51.086024-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:51.086265-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:51.086395-0500	RedLemon	0x7fe23c313bd8 ID=2592 Task <FE45A8CE-C5D4-445B-ABA5-DE1F4CF47E8C>.<722> sent request, body N 0
default	16:41:51.086623-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:51.088876-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1789 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:51.089030-0500	runningboardd	Assertion 169-103-1789 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:51.089940-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:51.089998-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:51.090049-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:51.103837-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:51.148174-0500	RedLemon	0x7fe23c313bd8 ID=2592 Task <FE45A8CE-C5D4-445B-ABA5-DE1F4CF47E8C>.<722> received response, status 200 content U
default	16:41:51.148752-0500	RedLemon	Task <FE45A8CE-C5D4-445B-ABA5-DE1F4CF47E8C>.<722> response ended
default	16:41:51.149194-0500	RedLemon	Task <FE45A8CE-C5D4-445B-ABA5-DE1F4CF47E8C>.<722> done using Connection 1
default	16:41:51.149422-0500	RedLemon	Task <FE45A8CE-C5D4-445B-ABA5-DE1F4CF47E8C>.<722> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:41:51.149863-0500	RedLemon	Task <FE45A8CE-C5D4-445B-ABA5-DE1F4CF47E8C>.<722> finished successfully
default	16:41:51.151532-0500	RedLemon	Task <8822CCE0-8C15-47F9-80EA-3F932F3ACDA6>.<723> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:51.151844-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [72615144-5C9A-46B1-A67C-28C3387C8A26] (reporting strategy default)> on Task <8822CCE0-8C15-47F9-80EA-3F932F3ACDA6>.<723> was not selected for reporting
default	16:41:51.152612-0500	RedLemon	Task <8822CCE0-8C15-47F9-80EA-3F932F3ACDA6>.<723> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:51.152903-0500	RedLemon	Task <8822CCE0-8C15-47F9-80EA-3F932F3ACDA6>.<723> now using Connection 1
default	16:41:51.154028-0500	RedLemon	0x7fe238b96dd8 ID=2596 Task <8822CCE0-8C15-47F9-80EA-3F932F3ACDA6>.<723> sent request, body N 0
default	16:41:51.220237-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:51.274794-0500	RedLemon	0x7fe238b96dd8 ID=2596 Task <8822CCE0-8C15-47F9-80EA-3F932F3ACDA6>.<723> received response, status 200 content U
default	16:41:51.275372-0500	RedLemon	Task <8822CCE0-8C15-47F9-80EA-3F932F3ACDA6>.<723> response ended
default	16:41:51.276057-0500	RedLemon	Task <8822CCE0-8C15-47F9-80EA-3F932F3ACDA6>.<723> done using Connection 1
default	16:41:51.276362-0500	RedLemon	Task <8822CCE0-8C15-47F9-80EA-3F932F3ACDA6>.<723> summary for task success {transaction_duration_ms=124, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=122, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:41:51.276705-0500	RedLemon	Task <8822CCE0-8C15-47F9-80EA-3F932F3ACDA6>.<723> finished successfully
default	16:41:51.279007-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:51.312028-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:52.129106-0500	runningboardd	Invalidating assertion 169-6308-1788 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:52.300857-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:52.300904-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:52.300946-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:52.301902-0500	runningboardd	Invalidating assertion 169-103-1789 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:52.424449-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:52.424496-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:52.424541-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:53.420922-0500	RedLemon	Task <86EB57F4-93A5-42B6-A286-338B1275E16B>.<724> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:53.421547-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [78875DBE-21A9-4F0B-BF38-A80CAC8F6312] (reporting strategy default)> on Task <86EB57F4-93A5-42B6-A286-338B1275E16B>.<724> was not selected for reporting
default	16:41:53.422753-0500	RedLemon	Task <86EB57F4-93A5-42B6-A286-338B1275E16B>.<724> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:53.423089-0500	RedLemon	Task <86EB57F4-93A5-42B6-A286-338B1275E16B>.<724> now using Connection 1
default	16:41:53.424489-0500	RedLemon	0x7fe23c313bd8 ID=2600 Task <86EB57F4-93A5-42B6-A286-338B1275E16B>.<724> sent request, body N 0
default	16:41:53.495059-0500	RedLemon	0x7fe23c313bd8 ID=2600 Task <86EB57F4-93A5-42B6-A286-338B1275E16B>.<724> received response, status 200 content U
default	16:41:53.495657-0500	RedLemon	Task <86EB57F4-93A5-42B6-A286-338B1275E16B>.<724> response ended
default	16:41:53.496421-0500	RedLemon	Task <86EB57F4-93A5-42B6-A286-338B1275E16B>.<724> done using Connection 1
default	16:41:53.496980-0500	RedLemon	Task <86EB57F4-93A5-42B6-A286-338B1275E16B>.<724> summary for task success {transaction_duration_ms=74, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=72, response_duration_ms=1, request_bytes=511, response_bytes=835, cache_hit=true}
default	16:41:53.497616-0500	RedLemon	Task <86EB57F4-93A5-42B6-A286-338B1275E16B>.<724> finished successfully
default	16:41:53.499342-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1791 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:53.499589-0500	runningboardd	Assertion 169-6308-1791 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:53.499923-0500	RedLemon	Task <E7290E2B-143A-4A5E-B9A2-902E9C7C9CCD>.<725> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:53.500319-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3CD78A9B-37C1-4535-8DB6-A1E8A29FDC44] (reporting strategy default)> on Task <E7290E2B-143A-4A5E-B9A2-902E9C7C9CCD>.<725> was not selected for reporting
default	16:41:53.501143-0500	RedLemon	Task <E7290E2B-143A-4A5E-B9A2-902E9C7C9CCD>.<725> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:53.501427-0500	RedLemon	Task <E7290E2B-143A-4A5E-B9A2-902E9C7C9CCD>.<725> now using Connection 1
default	16:41:53.502453-0500	RedLemon	0x7fe23c313bd8 ID=2604 Task <E7290E2B-143A-4A5E-B9A2-902E9C7C9CCD>.<725> sent request, body N 0
default	16:41:53.502805-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:53.502887-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:53.502934-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:53.504920-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1792 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:53.505079-0500	runningboardd	Assertion 169-103-1792 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:53.506119-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:53.506202-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:53.506251-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:53.515892-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:53.562057-0500	RedLemon	0x7fe23c313bd8 ID=2604 Task <E7290E2B-143A-4A5E-B9A2-902E9C7C9CCD>.<725> received response, status 200 content U
default	16:41:53.562500-0500	RedLemon	Task <E7290E2B-143A-4A5E-B9A2-902E9C7C9CCD>.<725> response ended
default	16:41:53.562923-0500	RedLemon	Task <E7290E2B-143A-4A5E-B9A2-902E9C7C9CCD>.<725> done using Connection 1
default	16:41:53.563114-0500	RedLemon	Task <E7290E2B-143A-4A5E-B9A2-902E9C7C9CCD>.<725> summary for task success {transaction_duration_ms=62, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=61, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:53.563325-0500	RedLemon	Task <E7290E2B-143A-4A5E-B9A2-902E9C7C9CCD>.<725> finished successfully
default	16:41:53.565586-0500	RedLemon	Task <607A5288-1C3D-49DF-85C5-64BD3A9C07F4>.<726> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:53.565872-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [225C9C04-7330-479E-8666-E108C453E4F8] (reporting strategy default)> on Task <607A5288-1C3D-49DF-85C5-64BD3A9C07F4>.<726> was not selected for reporting
default	16:41:53.566611-0500	RedLemon	Task <607A5288-1C3D-49DF-85C5-64BD3A9C07F4>.<726> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:53.566811-0500	RedLemon	Task <607A5288-1C3D-49DF-85C5-64BD3A9C07F4>.<726> now using Connection 1
default	16:41:53.567540-0500	RedLemon	0x7fe23c313bd8 ID=2608 Task <607A5288-1C3D-49DF-85C5-64BD3A9C07F4>.<726> sent request, body N 0
default	16:41:53.582504-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:53.631938-0500	RedLemon	0x7fe23c313bd8 ID=2608 Task <607A5288-1C3D-49DF-85C5-64BD3A9C07F4>.<726> received response, status 200 content U
default	16:41:53.632642-0500	RedLemon	Task <607A5288-1C3D-49DF-85C5-64BD3A9C07F4>.<726> response ended
default	16:41:53.633073-0500	RedLemon	Task <607A5288-1C3D-49DF-85C5-64BD3A9C07F4>.<726> done using Connection 1
default	16:41:53.633296-0500	RedLemon	Task <607A5288-1C3D-49DF-85C5-64BD3A9C07F4>.<726> summary for task success {transaction_duration_ms=67, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=65, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:53.633893-0500	RedLemon	Task <607A5288-1C3D-49DF-85C5-64BD3A9C07F4>.<726> finished successfully
default	16:41:53.635305-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:53.668709-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:54.599745-0500	runningboardd	Invalidating assertion 169-6308-1791 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:54.723299-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:54.723376-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:54.723418-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:54.724373-0500	runningboardd	Invalidating assertion 169-103-1792 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:54.833146-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:54.833220-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:54.833287-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:55.822087-0500	RedLemon	Task <8D1D4611-6438-4958-971D-036D70147AE6>.<727> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:55.822627-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [79824E98-9323-43E6-890E-840FF64CB415] (reporting strategy default)> on Task <8D1D4611-6438-4958-971D-036D70147AE6>.<727> was not selected for reporting
default	16:41:55.823761-0500	RedLemon	Task <8D1D4611-6438-4958-971D-036D70147AE6>.<727> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:55.824186-0500	RedLemon	Task <8D1D4611-6438-4958-971D-036D70147AE6>.<727> now using Connection 1
default	16:41:55.825710-0500	RedLemon	0x7fe23b4363e8 ID=2612 Task <8D1D4611-6438-4958-971D-036D70147AE6>.<727> sent request, body N 0
default	16:41:55.913990-0500	RedLemon	0x7fe23b4363e8 ID=2612 Task <8D1D4611-6438-4958-971D-036D70147AE6>.<727> received response, status 200 content U
default	16:41:55.914537-0500	RedLemon	Task <8D1D4611-6438-4958-971D-036D70147AE6>.<727> response ended
default	16:41:55.914958-0500	RedLemon	Task <8D1D4611-6438-4958-971D-036D70147AE6>.<727> done using Connection 1
default	16:41:55.915139-0500	RedLemon	Task <8D1D4611-6438-4958-971D-036D70147AE6>.<727> summary for task success {transaction_duration_ms=92, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=90, response_duration_ms=1, request_bytes=511, response_bytes=836, cache_hit=true}
default	16:41:55.915417-0500	RedLemon	Task <8D1D4611-6438-4958-971D-036D70147AE6>.<727> finished successfully
default	16:41:55.916731-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1793 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:55.916927-0500	runningboardd	Assertion 169-6308-1793 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:55.917293-0500	RedLemon	Task <068DC80F-02E0-4293-8919-25B4ED8A7160>.<728> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:55.917692-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E6A84B76-0C25-44A1-B092-AF0477317CB8] (reporting strategy default)> on Task <068DC80F-02E0-4293-8919-25B4ED8A7160>.<728> was not selected for reporting
default	16:41:55.918509-0500	RedLemon	Task <068DC80F-02E0-4293-8919-25B4ED8A7160>.<728> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:55.918796-0500	RedLemon	Task <068DC80F-02E0-4293-8919-25B4ED8A7160>.<728> now using Connection 1
default	16:41:55.919894-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:55.920007-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:55.919733-0500	RedLemon	0x7fe23b3e4448 ID=2616 Task <068DC80F-02E0-4293-8919-25B4ED8A7160>.<728> sent request, body N 0
default	16:41:55.920109-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:55.921830-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1794 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:55.921960-0500	runningboardd	Assertion 169-103-1794 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:55.922741-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:55.922786-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:55.923489-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:55.936161-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:55.991257-0500	RedLemon	0x7fe23b3e4448 ID=2616 Task <068DC80F-02E0-4293-8919-25B4ED8A7160>.<728> received response, status 200 content U
default	16:41:55.991909-0500	RedLemon	Task <068DC80F-02E0-4293-8919-25B4ED8A7160>.<728> response ended
default	16:41:55.992343-0500	RedLemon	Task <068DC80F-02E0-4293-8919-25B4ED8A7160>.<728> done using Connection 1
default	16:41:55.992568-0500	RedLemon	Task <068DC80F-02E0-4293-8919-25B4ED8A7160>.<728> summary for task success {transaction_duration_ms=74, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=72, response_duration_ms=1, request_bytes=524, response_bytes=846, cache_hit=true}
default	16:41:55.993120-0500	RedLemon	Task <068DC80F-02E0-4293-8919-25B4ED8A7160>.<728> finished successfully
default	16:41:55.995347-0500	RedLemon	Task <1FBA232E-96BB-4397-A1F9-7D75014D1E37>.<729> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:55.995655-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [09C0E44D-CD9B-4BBD-A526-5945463F03AC] (reporting strategy default)> on Task <1FBA232E-96BB-4397-A1F9-7D75014D1E37>.<729> was not selected for reporting
default	16:41:55.996344-0500	RedLemon	Task <1FBA232E-96BB-4397-A1F9-7D75014D1E37>.<729> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:55.996644-0500	RedLemon	Task <1FBA232E-96BB-4397-A1F9-7D75014D1E37>.<729> now using Connection 1
default	16:41:55.997602-0500	RedLemon	0x7fe23c313bd8 ID=2620 Task <1FBA232E-96BB-4397-A1F9-7D75014D1E37>.<729> sent request, body N 0
default	16:41:56.012975-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:56.058734-0500	RedLemon	0x7fe23c313bd8 ID=2620 Task <1FBA232E-96BB-4397-A1F9-7D75014D1E37>.<729> received response, status 200 content U
default	16:41:56.059506-0500	RedLemon	Task <1FBA232E-96BB-4397-A1F9-7D75014D1E37>.<729> response ended
default	16:41:56.059961-0500	RedLemon	Task <1FBA232E-96BB-4397-A1F9-7D75014D1E37>.<729> done using Connection 1
default	16:41:56.060184-0500	RedLemon	Task <1FBA232E-96BB-4397-A1F9-7D75014D1E37>.<729> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:41:56.060914-0500	RedLemon	Task <1FBA232E-96BB-4397-A1F9-7D75014D1E37>.<729> finished successfully
default	16:41:56.062731-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:56.070995-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:56.981971-0500	runningboardd	Invalidating assertion 169-6308-1793 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:57.090970-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:57.091056-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:57.091130-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:57.093138-0500	runningboardd	Invalidating assertion 169-103-1794 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:57.268848-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:57.268896-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:57.268940-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:58.234667-0500	RedLemon	Task <F65D8DF8-05C4-4E88-B637-E18A35CE31FB>.<730> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:58.235151-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [02BC6C05-C4B7-466D-8780-2103C0D2238B] (reporting strategy default)> on Task <F65D8DF8-05C4-4E88-B637-E18A35CE31FB>.<730> was not selected for reporting
default	16:41:58.236116-0500	RedLemon	Task <F65D8DF8-05C4-4E88-B637-E18A35CE31FB>.<730> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:58.236315-0500	RedLemon	Task <F65D8DF8-05C4-4E88-B637-E18A35CE31FB>.<730> now using Connection 1
default	16:41:58.237138-0500	RedLemon	0x7fe23c313bd8 ID=2624 Task <F65D8DF8-05C4-4E88-B637-E18A35CE31FB>.<730> sent request, body N 0
default	16:41:58.301557-0500	RedLemon	0x7fe23c313bd8 ID=2624 Task <F65D8DF8-05C4-4E88-B637-E18A35CE31FB>.<730> received response, status 200 content U
default	16:41:58.301989-0500	RedLemon	Task <F65D8DF8-05C4-4E88-B637-E18A35CE31FB>.<730> response ended
default	16:41:58.302390-0500	RedLemon	Task <F65D8DF8-05C4-4E88-B637-E18A35CE31FB>.<730> done using Connection 1
default	16:41:58.302649-0500	RedLemon	Task <F65D8DF8-05C4-4E88-B637-E18A35CE31FB>.<730> summary for task success {transaction_duration_ms=66, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=65, response_duration_ms=1, request_bytes=511, response_bytes=836, cache_hit=true}
default	16:41:58.302860-0500	RedLemon	Task <F65D8DF8-05C4-4E88-B637-E18A35CE31FB>.<730> finished successfully
default	16:41:58.303538-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1795 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:58.303741-0500	runningboardd	Assertion 169-6308-1795 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:41:58.304605-0500	RedLemon	Task <327CCA34-BBC5-49C3-A8C4-1A6524F94EAE>.<731> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:58.305011-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DDD40464-9A46-49D3-9782-769F64CD14DF] (reporting strategy default)> on Task <327CCA34-BBC5-49C3-A8C4-1A6524F94EAE>.<731> was not selected for reporting
default	16:41:58.305756-0500	RedLemon	Task <327CCA34-BBC5-49C3-A8C4-1A6524F94EAE>.<731> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:58.306034-0500	RedLemon	Task <327CCA34-BBC5-49C3-A8C4-1A6524F94EAE>.<731> now using Connection 1
default	16:41:58.305773-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:58.306302-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:58.306404-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:58.307116-0500	RedLemon	0x7fe23c313bd8 ID=2628 Task <327CCA34-BBC5-49C3-A8C4-1A6524F94EAE>.<731> sent request, body N 0
default	16:41:58.308918-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1796 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:41:58.309056-0500	runningboardd	Assertion 169-103-1796 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:41:58.310040-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:58.310158-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:58.310216-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:58.316170-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:58.368356-0500	RedLemon	0x7fe23c313bd8 ID=2628 Task <327CCA34-BBC5-49C3-A8C4-1A6524F94EAE>.<731> received response, status 200 content U
default	16:41:58.369121-0500	RedLemon	Task <327CCA34-BBC5-49C3-A8C4-1A6524F94EAE>.<731> response ended
default	16:41:58.369389-0500	RedLemon	Task <327CCA34-BBC5-49C3-A8C4-1A6524F94EAE>.<731> done using Connection 1
default	16:41:58.369539-0500	RedLemon	Task <327CCA34-BBC5-49C3-A8C4-1A6524F94EAE>.<731> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:41:58.369898-0500	RedLemon	Task <327CCA34-BBC5-49C3-A8C4-1A6524F94EAE>.<731> finished successfully
default	16:41:58.371506-0500	RedLemon	Task <0B62583B-A051-4EAA-B56F-DCE5C8BF8A7E>.<732> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:41:58.371805-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7AC19BE2-CE87-4646-ABAC-B6C14A27062E] (reporting strategy default)> on Task <0B62583B-A051-4EAA-B56F-DCE5C8BF8A7E>.<732> was not selected for reporting
default	16:41:58.372561-0500	RedLemon	Task <0B62583B-A051-4EAA-B56F-DCE5C8BF8A7E>.<732> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:41:58.372781-0500	RedLemon	Task <0B62583B-A051-4EAA-B56F-DCE5C8BF8A7E>.<732> now using Connection 1
default	16:41:58.373481-0500	RedLemon	0x7fe23c313bd8 ID=2632 Task <0B62583B-A051-4EAA-B56F-DCE5C8BF8A7E>.<732> sent request, body N 0
default	16:41:58.380131-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:58.429393-0500	RedLemon	0x7fe23c313bd8 ID=2632 Task <0B62583B-A051-4EAA-B56F-DCE5C8BF8A7E>.<732> received response, status 200 content U
default	16:41:58.430089-0500	RedLemon	Task <0B62583B-A051-4EAA-B56F-DCE5C8BF8A7E>.<732> response ended
default	16:41:58.430521-0500	RedLemon	Task <0B62583B-A051-4EAA-B56F-DCE5C8BF8A7E>.<732> done using Connection 1
default	16:41:58.430742-0500	RedLemon	Task <0B62583B-A051-4EAA-B56F-DCE5C8BF8A7E>.<732> summary for task success {transaction_duration_ms=58, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=56, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:41:58.431468-0500	RedLemon	Task <0B62583B-A051-4EAA-B56F-DCE5C8BF8A7E>.<732> finished successfully
default	16:41:58.433712-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:41:58.470469-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:41:59.410805-0500	runningboardd	Invalidating assertion 169-6308-1795 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:41:59.535144-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:59.535219-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:59.535291-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:41:59.536498-0500	runningboardd	Invalidating assertion 169-103-1796 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:41:59.660376-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:41:59.660509-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:41:59.660563-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:00.457669-0500	RedLemon	Task <28AB0D2C-6E02-4B92-99CF-063B1B68E02A>.<733> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:42:00.458354-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BCF76BFC-6265-4293-9504-B7ED94D9E590] (reporting strategy default)> on Task <28AB0D2C-6E02-4B92-99CF-063B1B68E02A>.<733> was not selected for reporting
default	16:42:00.459599-0500	RedLemon	Task <28AB0D2C-6E02-4B92-99CF-063B1B68E02A>.<733> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:42:00.460067-0500	RedLemon	Task <28AB0D2C-6E02-4B92-99CF-063B1B68E02A>.<733> now using Connection 1
default	16:42:00.461260-0500	RedLemon	0x7fe23b3e4448 ID=2636 Task <28AB0D2C-6E02-4B92-99CF-063B1B68E02A>.<733> sent request, body N 0
default	16:42:00.556099-0500	RedLemon	0x7fe23b3e4448 ID=2636 Task <28AB0D2C-6E02-4B92-99CF-063B1B68E02A>.<733> received response, status 200 content U
default	16:42:00.556875-0500	RedLemon	Task <28AB0D2C-6E02-4B92-99CF-063B1B68E02A>.<733> response ended
default	16:42:00.557646-0500	RedLemon	Task <28AB0D2C-6E02-4B92-99CF-063B1B68E02A>.<733> done using Connection 1
default	16:42:00.557950-0500	RedLemon	Task <28AB0D2C-6E02-4B92-99CF-063B1B68E02A>.<733> summary for task success {transaction_duration_ms=99, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=96, response_duration_ms=1, request_bytes=511, response_bytes=836, cache_hit=true}
default	16:42:00.558516-0500	RedLemon	Task <28AB0D2C-6E02-4B92-99CF-063B1B68E02A>.<733> finished successfully
default	16:42:00.560523-0500	RedLemon	Task <E605C02A-6E7F-435A-905C-6254C8491F0C>.<734> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:42:00.561137-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [95011104-4A3D-4FF2-829E-8C36BD8D2DBF] (reporting strategy default)> on Task <E605C02A-6E7F-435A-905C-6254C8491F0C>.<734> was not selected for reporting
default	16:42:00.562189-0500	RedLemon	Task <E605C02A-6E7F-435A-905C-6254C8491F0C>.<734> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:42:00.562582-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1797 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:42:00.562469-0500	RedLemon	Task <E605C02A-6E7F-435A-905C-6254C8491F0C>.<734> now using Connection 1
default	16:42:00.562987-0500	runningboardd	Assertion 169-6308-1797 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:42:00.563458-0500	RedLemon	0x7fe23bc5f238 ID=2640 Task <E605C02A-6E7F-435A-905C-6254C8491F0C>.<734> sent request, body N 0
default	16:42:00.564343-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:00.564399-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:00.564456-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:00.565979-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1798 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:42:00.566380-0500	runningboardd	Assertion 169-103-1798 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:42:00.567977-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:00.568018-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:00.568059-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:00.575602-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:42:00.618227-0500	RedLemon	0x7fe23bc5f238 ID=2640 Task <E605C02A-6E7F-435A-905C-6254C8491F0C>.<734> received response, status 200 content U
default	16:42:00.618983-0500	RedLemon	Task <E605C02A-6E7F-435A-905C-6254C8491F0C>.<734> response ended
default	16:42:00.619627-0500	RedLemon	Task <E605C02A-6E7F-435A-905C-6254C8491F0C>.<734> done using Connection 1
default	16:42:00.619873-0500	RedLemon	Task <E605C02A-6E7F-435A-905C-6254C8491F0C>.<734> summary for task success {transaction_duration_ms=58, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=56, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:42:00.620408-0500	RedLemon	Task <E605C02A-6E7F-435A-905C-6254C8491F0C>.<734> finished successfully
default	16:42:00.622420-0500	RedLemon	Task <AEF4DC27-896F-42D4-9CA1-3341272F2339>.<735> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:42:00.622731-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D54D2896-DC89-4D30-AE54-9E21670FDF79] (reporting strategy default)> on Task <AEF4DC27-896F-42D4-9CA1-3341272F2339>.<735> was not selected for reporting
default	16:42:00.623414-0500	RedLemon	Task <AEF4DC27-896F-42D4-9CA1-3341272F2339>.<735> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:42:00.623606-0500	RedLemon	Task <AEF4DC27-896F-42D4-9CA1-3341272F2339>.<735> now using Connection 1
default	16:42:00.624562-0500	RedLemon	0x7fe23b3e4448 ID=2644 Task <AEF4DC27-896F-42D4-9CA1-3341272F2339>.<735> sent request, body N 0
default	16:42:00.632014-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:42:00.686544-0500	RedLemon	0x7fe23b3e4448 ID=2644 Task <AEF4DC27-896F-42D4-9CA1-3341272F2339>.<735> received response, status 200 content U
default	16:42:00.687127-0500	RedLemon	Task <AEF4DC27-896F-42D4-9CA1-3341272F2339>.<735> response ended
default	16:42:00.687561-0500	RedLemon	Task <AEF4DC27-896F-42D4-9CA1-3341272F2339>.<735> done using Connection 1
default	16:42:00.687784-0500	RedLemon	Task <AEF4DC27-896F-42D4-9CA1-3341272F2339>.<735> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:42:00.688319-0500	RedLemon	Task <AEF4DC27-896F-42D4-9CA1-3341272F2339>.<735> finished successfully
default	16:42:00.690243-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:42:00.723458-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:42:01.667790-0500	runningboardd	Invalidating assertion 169-6308-1797 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:42:01.793414-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:01.793490-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:01.793565-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:01.795105-0500	runningboardd	Invalidating assertion 169-103-1798 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:42:01.903604-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:01.903651-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:01.903697-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:02.883970-0500	RedLemon	Task <E32F2C5D-9D65-475C-877C-ECFEBBF836DE>.<736> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:42:02.885257-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [23972790-124C-4643-A166-4F59B6AFD559] (reporting strategy default)> on Task <E32F2C5D-9D65-475C-877C-ECFEBBF836DE>.<736> was not selected for reporting
default	16:42:02.886312-0500	RedLemon	Task <E32F2C5D-9D65-475C-877C-ECFEBBF836DE>.<736> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:42:02.886612-0500	RedLemon	Task <E32F2C5D-9D65-475C-877C-ECFEBBF836DE>.<736> now using Connection 1
default	16:42:02.887669-0500	RedLemon	0x7fe23b3e4448 ID=2648 Task <E32F2C5D-9D65-475C-877C-ECFEBBF836DE>.<736> sent request, body N 0
default	16:42:02.961513-0500	RedLemon	0x7fe23b3e4448 ID=2648 Task <E32F2C5D-9D65-475C-877C-ECFEBBF836DE>.<736> received response, status 200 content U
default	16:42:02.962301-0500	RedLemon	Task <E32F2C5D-9D65-475C-877C-ECFEBBF836DE>.<736> response ended
default	16:42:02.962739-0500	RedLemon	Task <E32F2C5D-9D65-475C-877C-ECFEBBF836DE>.<736> done using Connection 1
default	16:42:02.962984-0500	RedLemon	Task <E32F2C5D-9D65-475C-877C-ECFEBBF836DE>.<736> summary for task success {transaction_duration_ms=77, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=75, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	16:42:02.963541-0500	RedLemon	Task <E32F2C5D-9D65-475C-877C-ECFEBBF836DE>.<736> finished successfully
default	16:42:02.964822-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1799 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:42:02.965064-0500	runningboardd	Assertion 169-6308-1799 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:42:02.965408-0500	RedLemon	Task <5C00D0A9-02EF-49B4-B994-ECDD5106F48B>.<737> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:42:02.965802-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FACD7C6A-3542-4817-A920-76D27BF92A0A] (reporting strategy default)> on Task <5C00D0A9-02EF-49B4-B994-ECDD5106F48B>.<737> was not selected for reporting
default	16:42:02.966528-0500	RedLemon	Task <5C00D0A9-02EF-49B4-B994-ECDD5106F48B>.<737> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:42:02.966804-0500	RedLemon	Task <5C00D0A9-02EF-49B4-B994-ECDD5106F48B>.<737> now using Connection 1
default	16:42:02.967809-0500	RedLemon	0x7fe23bc5f238 ID=2652 Task <5C00D0A9-02EF-49B4-B994-ECDD5106F48B>.<737> sent request, body N 0
default	16:42:02.969017-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:02.969482-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:02.969546-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:02.971167-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1800 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:42:02.971362-0500	runningboardd	Assertion 169-103-1800 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:42:02.972091-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:42:02.972326-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:02.972379-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:02.972435-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:03.026776-0500	RedLemon	0x7fe23bc5f238 ID=2652 Task <5C00D0A9-02EF-49B4-B994-ECDD5106F48B>.<737> received response, status 200 content U
default	16:42:03.027355-0500	RedLemon	Task <5C00D0A9-02EF-49B4-B994-ECDD5106F48B>.<737> response ended
default	16:42:03.027796-0500	RedLemon	Task <5C00D0A9-02EF-49B4-B994-ECDD5106F48B>.<737> done using Connection 1
default	16:42:03.028031-0500	RedLemon	Task <5C00D0A9-02EF-49B4-B994-ECDD5106F48B>.<737> summary for task success {transaction_duration_ms=61, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=60, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:42:03.028676-0500	RedLemon	Task <5C00D0A9-02EF-49B4-B994-ECDD5106F48B>.<737> finished successfully
default	16:42:03.030797-0500	RedLemon	Task <FA3D45DC-E4B3-4EF9-8A04-8AE7243E0DDC>.<738> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:42:03.031094-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [43416A3A-CD51-4CBD-8C2C-CCB95EB6B810] (reporting strategy default)> on Task <FA3D45DC-E4B3-4EF9-8A04-8AE7243E0DDC>.<738> was not selected for reporting
default	16:42:03.031873-0500	RedLemon	Task <FA3D45DC-E4B3-4EF9-8A04-8AE7243E0DDC>.<738> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:42:03.032074-0500	RedLemon	Task <FA3D45DC-E4B3-4EF9-8A04-8AE7243E0DDC>.<738> now using Connection 1
default	16:42:03.032887-0500	RedLemon	0x7fe23bc5f238 ID=2656 Task <FA3D45DC-E4B3-4EF9-8A04-8AE7243E0DDC>.<738> sent request, body N 0
default	16:42:03.045200-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:42:03.098736-0500	RedLemon	0x7fe23bc5f238 ID=2656 Task <FA3D45DC-E4B3-4EF9-8A04-8AE7243E0DDC>.<738> received response, status 200 content U
default	16:42:03.099322-0500	RedLemon	Task <FA3D45DC-E4B3-4EF9-8A04-8AE7243E0DDC>.<738> response ended
default	16:42:03.099764-0500	RedLemon	Task <FA3D45DC-E4B3-4EF9-8A04-8AE7243E0DDC>.<738> done using Connection 1
default	16:42:03.099992-0500	RedLemon	Task <FA3D45DC-E4B3-4EF9-8A04-8AE7243E0DDC>.<738> summary for task success {transaction_duration_ms=68, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=67, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:42:03.100564-0500	RedLemon	Task <FA3D45DC-E4B3-4EF9-8A04-8AE7243E0DDC>.<738> finished successfully
default	16:42:03.104100-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:42:03.140253-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:42:04.043771-0500	runningboardd	Invalidating assertion 169-6308-1799 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:42:04.194317-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:04.194392-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:04.194470-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:04.195946-0500	runningboardd	Invalidating assertion 169-103-1800 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:42:04.371186-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:04.371259-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:04.371326-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:05.293133-0500	RedLemon	Task <ED2EB75D-E22F-4749-AEB4-875CCA30790A>.<22> summary for task failure {transaction_duration_ms=30209, response_status=-1, connection=40, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=1, secure_connection_duration_ms=0, private_relay=false, request_start_ms=3, request_duration_ms=0, response_start_ms=0, response_duration_ms=0, request_bytes=278, response_bytes=0, cache_hit=false}
default	16:42:05.293500-0500	RedLemon	Task <7717F458-113C-4412-B28F-2900858F80D2>.<739> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
error	16:42:05.293690-0500	RedLemon	Task <ED2EB75D-E22F-4749-AEB4-875CCA30790A>.<22> finished with error [-1001] Error Domain=NSURLErrorDomain Code=-1001 UserInfo={_kCFStreamErrorCodeKey=-2102, NSUnderlyingError=0x7fe23b3b7660 {Error Domain=kCFErrorDomainCFNetwork Code=-1001 UserInfo={_kCFStreamErrorCodeKey=-2102, _kCFStreamErrorDomainKey=4}}, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>, NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _kCFStreamErrorDomainKey=4}
default	16:42:05.294069-0500	RedLemon	Connection 40: cleaning up
default	16:42:05.294337-0500	RedLemon	[C40 B05F6B89-756E-4F74-8D00-A6AECC3AE26D 127.0.0.1:47253 tcp, url hash: a025d583, definite, attribution: developer] cancel
default	16:42:05.294684-0500	RedLemon	[C40 B05F6B89-756E-4F74-8D00-A6AECC3AE26D 127.0.0.1:47253 tcp, url hash: a025d583, definite, attribution: developer] cancelled
	[C40 5354C819-ACD2-4DB0-871A-5C9F0F16EF74 127.0.0.1:49671<->127.0.0.1:47253]
	Connected Path: satisfied (Path is satisfied), viable, interface: lo0
	Privacy Stance: Not Eligible
	Duration: 30.209s, TCP @0.000s took 0.001s
	bytes in/out: 0/278, packets in/out: 0/1, rtt: 0.001s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:42:05.294775-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B683DF8B-63E7-4799-8C94-B9A397C88100] (reporting strategy default)> on Task <7717F458-113C-4412-B28F-2900858F80D2>.<739> was not selected for reporting
default	16:42:05.295588-0500	RedLemon	nw_flow_disconnected [C40 127.0.0.1:47253 cancelled socket-flow ((null))] Output protocol disconnected
default	16:42:05.295994-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C40] reporting state cancelled
default	16:42:05.296155-0500	RedLemon	Task <ED2EB75D-E22F-4749-AEB4-875CCA30790A>.<22> done using Connection 40
default	16:42:05.296521-0500	RedLemon	Task <7717F458-113C-4412-B28F-2900858F80D2>.<739> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:42:05.296858-0500	RedLemon	Task <7717F458-113C-4412-B28F-2900858F80D2>.<739> now using Connection 1
default	16:42:05.298551-0500	RedLemon	0x7fe23b4b6728 ID=2660 Task <7717F458-113C-4412-B28F-2900858F80D2>.<739> sent request, body N 0
default	16:42:05.362227-0500	RedLemon	0x7fe23b4b6728 ID=2660 Task <7717F458-113C-4412-B28F-2900858F80D2>.<739> received response, status 200 content U
default	16:42:05.362734-0500	RedLemon	Task <7717F458-113C-4412-B28F-2900858F80D2>.<739> response ended
default	16:42:05.363127-0500	RedLemon	Task <7717F458-113C-4412-B28F-2900858F80D2>.<739> done using Connection 1
default	16:42:05.363308-0500	RedLemon	Task <7717F458-113C-4412-B28F-2900858F80D2>.<739> summary for task success {transaction_duration_ms=67, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=66, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	16:42:05.363487-0500	RedLemon	Task <7717F458-113C-4412-B28F-2900858F80D2>.<739> finished successfully
default	16:42:05.365860-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1801 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:42:05.366031-0500	runningboardd	Assertion 169-6308-1801 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:42:05.366435-0500	RedLemon	Task <22B168B5-7DF9-4660-975A-AF840BD340BC>.<740> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:42:05.366802-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FF4C7928-BE9F-4233-81F2-528D9DEA9CC8] (reporting strategy default)> on Task <22B168B5-7DF9-4660-975A-AF840BD340BC>.<740> was not selected for reporting
default	16:42:05.367500-0500	RedLemon	Task <22B168B5-7DF9-4660-975A-AF840BD340BC>.<740> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:42:05.367830-0500	RedLemon	Task <22B168B5-7DF9-4660-975A-AF840BD340BC>.<740> now using Connection 1
default	16:42:05.368846-0500	RedLemon	0x7fe23bcf0198 ID=2664 Task <22B168B5-7DF9-4660-975A-AF840BD340BC>.<740> sent request, body N 0
default	16:42:05.369390-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:05.369585-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:05.369674-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:05.373220-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1802 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:42:05.373924-0500	runningboardd	Assertion 169-103-1802 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:42:05.378041-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:05.378218-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:05.378321-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:05.384067-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:42:05.427388-0500	RedLemon	0x7fe23bcf0198 ID=2664 Task <22B168B5-7DF9-4660-975A-AF840BD340BC>.<740> received response, status 200 content U
default	16:42:05.427784-0500	RedLemon	Task <22B168B5-7DF9-4660-975A-AF840BD340BC>.<740> response ended
default	16:42:05.428144-0500	RedLemon	Task <22B168B5-7DF9-4660-975A-AF840BD340BC>.<740> done using Connection 1
default	16:42:05.428294-0500	RedLemon	Task <22B168B5-7DF9-4660-975A-AF840BD340BC>.<740> summary for task success {transaction_duration_ms=61, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=60, response_duration_ms=0, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:42:05.428719-0500	RedLemon	Task <22B168B5-7DF9-4660-975A-AF840BD340BC>.<740> finished successfully
default	16:42:05.430615-0500	RedLemon	Task <3FDA79DB-C53C-425B-A1CD-C94ECB6C4559>.<741> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:42:05.430922-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D8CAD453-222C-4031-901C-13D2760ED9F9] (reporting strategy default)> on Task <3FDA79DB-C53C-425B-A1CD-C94ECB6C4559>.<741> was not selected for reporting
default	16:42:05.431715-0500	RedLemon	Task <3FDA79DB-C53C-425B-A1CD-C94ECB6C4559>.<741> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:42:05.431921-0500	RedLemon	Task <3FDA79DB-C53C-425B-A1CD-C94ECB6C4559>.<741> now using Connection 1
default	16:42:05.432663-0500	RedLemon	0x7fe23bcf0198 ID=2668 Task <3FDA79DB-C53C-425B-A1CD-C94ECB6C4559>.<741> sent request, body N 0
default	16:42:05.447143-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:42:05.495960-0500	RedLemon	0x7fe23bcf0198 ID=2668 Task <3FDA79DB-C53C-425B-A1CD-C94ECB6C4559>.<741> received response, status 200 content U
default	16:42:05.496752-0500	RedLemon	Task <3FDA79DB-C53C-425B-A1CD-C94ECB6C4559>.<741> response ended
default	16:42:05.497423-0500	RedLemon	Task <3FDA79DB-C53C-425B-A1CD-C94ECB6C4559>.<741> done using Connection 1
default	16:42:05.497719-0500	RedLemon	Task <3FDA79DB-C53C-425B-A1CD-C94ECB6C4559>.<741> summary for task success {transaction_duration_ms=66, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:42:05.498167-0500	RedLemon	Task <3FDA79DB-C53C-425B-A1CD-C94ECB6C4559>.<741> finished successfully
default	16:42:05.500070-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:42:05.510087-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:42:06.421061-0500	runningboardd	Invalidating assertion 169-6308-1801 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:42:06.577259-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:06.577418-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:06.577548-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:06.581203-0500	runningboardd	Invalidating assertion 169-103-1802 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:42:06.692666-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:06.692713-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:06.692754-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:16.004371-0500	runningboardd	Invalidating assertion 169-129-1760 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.coreservices.launchservicesd>:129]
default	16:42:16.123440-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:16.123605-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:16.123919-0500	runningboardd	[anon<RedLemon>(501):6308] Set darwin role to: UserInteractiveNonFocal
default	16:42:16.124234-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:18.132322-0500	RedLemon	0x7fe23e18ced8 ID=4 Task <612ADD22-193D-46F8-8E96-580DBF6FD770>.<702> received response, status 520 content K
default	16:42:18.132803-0500	RedLemon	Task <612ADD22-193D-46F8-8E96-580DBF6FD770>.<702> response ended
default	16:42:18.133666-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [anon<RedLemon>(501):6308] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-6308-1813 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:42:18.133189-0500	RedLemon	Task <612ADD22-193D-46F8-8E96-580DBF6FD770>.<702> done using Connection 30
default	16:42:18.133369-0500	RedLemon	Task <612ADD22-193D-46F8-8E96-580DBF6FD770>.<702> summary for task success {transaction_duration_ms=42247, response_status=520, connection=30, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=42246, response_duration_ms=1, request_bytes=167, response_bytes=7670, cache_hit=true}
default	16:42:18.133939-0500	runningboardd	Assertion 169-6308-1813 (target:[anon<RedLemon>(501):6308]) will be created as active as no start-time-defining assertions exist
default	16:42:18.133934-0500	RedLemon	Task <612ADD22-193D-46F8-8E96-580DBF6FD770>.<702> finished successfully
default	16:42:18.134579-0500	RedLemon	❌ Failed to fetch subtitles: Abort.503: SubDL API request failed
default	16:42:18.135998-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:18.136050-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:18.136131-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:18.138665-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1814 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:42:18.138822-0500	runningboardd	Assertion 169-103-1814 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:42:18.140604-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:18.140649-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:18.140691-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:19.143341-0500	runningboardd	Invalidating assertion 169-6308-1813 (target:[anon<RedLemon>(501):6308]) from originator [anon<RedLemon>(501):6308]
default	16:42:19.245222-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:19.245301-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:19.245373-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:19.247435-0500	runningboardd	Invalidating assertion 169-103-1814 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.powerd>:103]
default	16:42:19.414736-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:19.414899-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:19.415029-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:30.215970-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:30.216270-0500	RedLemon	   Payload keys: isPlaying, position, timestamp, senderId, type
default	16:42:30.216715-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:30.216937-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:30.217116-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:30.420922-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:30.421248-0500	RedLemon	   Payload keys: timestamp, position, senderId, type, isPlaying
default	16:42:30.421674-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:30.421896-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:30.422072-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:30.728482-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:30.728846-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, type, position
default	16:42:30.729301-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:30.729482-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:30.729602-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:30.871766-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:30.872104-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:42:30.872741-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:30.872981-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:30.873231-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:31.138000-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:31.138338-0500	RedLemon	   Payload keys: isPlaying, senderId, position, timestamp, type
default	16:42:31.138767-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:31.138967-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:31.139134-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:31.445250-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:31.445574-0500	RedLemon	   Payload keys: timestamp, position, senderId, type, isPlaying
default	16:42:31.445998-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:31.446207-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:31.446388-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:31.854496-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:31.855171-0500	RedLemon	   Payload keys: isPlaying, position, timestamp, senderId, type
default	16:42:31.855690-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:31.855901-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:31.856065-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:31.879231-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:31.879580-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, type, position
default	16:42:31.880069-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:31.880245-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:31.880417-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:32.571146-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:32.571532-0500	RedLemon	   Payload keys: timestamp, position, senderId, type, isPlaying
default	16:42:32.571973-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:32.572185-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:32.572356-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:32.572551-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:32.572828-0500	RedLemon	   Payload keys: position, senderId, timestamp, isPlaying, type
default	16:42:32.573273-0500	RedLemon	✅ Realtime: Decoded message type: ready, sender: 656DAA91-33B4-4688-9135-C982EA52D7C9
default	16:42:32.573504-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: ready
default	16:42:32.573681-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:32.632123-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:32.632462-0500	RedLemon	   Payload keys: isPlaying, senderId, position, timestamp, type
default	16:42:32.632877-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:32.633093-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:32.633264-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:32.983640-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:32.983967-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:42:32.984402-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:32.984602-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:32.984770-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:33.186283-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:33.186707-0500	RedLemon	   Payload keys: isPlaying, position, timestamp, senderId, type
default	16:42:33.187145-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:33.187345-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:33.187505-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:33.390676-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:33.391016-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, type, position
default	16:42:33.391510-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:33.391726-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:33.391897-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:33.703708-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:33.704072-0500	RedLemon	   Payload keys: timestamp, position, senderId, type, isPlaying
default	16:42:33.704546-0500	RedLemon	✅ Realtime: Decoded message type: play, sender: 656DAA91-33B4-4688-9135-C982EA52D7C9
default	16:42:33.704772-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: play
default	16:42:33.704952-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:33.705096-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:33.705270-0500	RedLemon	   Payload keys: position, senderId, timestamp, isPlaying, type
default	16:42:33.705533-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:33.705657-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:33.705760-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:33.902225-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:33.902496-0500	RedLemon	   Payload keys: isPlaying, senderId, position, timestamp, type
default	16:42:33.902934-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:33.903134-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:33.903301-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:34.209706-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:34.210067-0500	RedLemon	   Payload keys: position, senderId, isPlaying, type, timestamp
default	16:42:34.210652-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:34.210838-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:34.211002-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:34.516594-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:34.517007-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:42:34.517581-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:34.517802-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:34.517977-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:34.564915-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "frontmost:6308" ID:169-129-1816 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	16:42:34.565396-0500	runningboardd	Assertion 169-129-1816 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:42:34.587376-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:34.587470-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:34.587547-0500	runningboardd	[anon<RedLemon>(501):6308] Set darwin role to: UserInteractiveFocal
default	16:42:34.587595-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:34.595834-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):6308] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "notification:6308" ID:169-129-1817 target:6308 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	16:42:34.596013-0500	runningboardd	Assertion 169-129-1817 (target:[anon<RedLemon>(501):6308]) will be created as active
default	16:42:34.601754-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:34.601797-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:34.601835-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:34.722631-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:34.722923-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, type, position
default	16:42:34.723541-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:34.723933-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:34.724066-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:35.177587-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:35.177886-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:42:35.178334-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:35.178560-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:35.178740-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:35.193877-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:35.194123-0500	RedLemon	   Payload keys: isPlaying, position, timestamp, senderId, type
default	16:42:35.194456-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:35.194565-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:35.194670-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:35.540699-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:35.541029-0500	RedLemon	   Payload keys: isPlaying, senderId, timestamp, position, type
default	16:42:35.541588-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:35.541855-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:35.542079-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:35.849121-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:35.849570-0500	RedLemon	   Payload keys: senderId, timestamp, type, isPlaying, position
default	16:42:35.850058-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:35.850198-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:35.850353-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:35.951111-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:35.951376-0500	RedLemon	   Payload keys: isPlaying, senderId, timestamp, position, type
default	16:42:35.951704-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:35.951822-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:35.951944-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:36.387887-0500	runningboardd	Invalidating assertion 169-129-1816 (target:[anon<RedLemon>(501):6308]) from originator [daemon<com.apple.coreservices.launchservicesd>:129]
default	16:42:36.462321-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:36.462541-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:42:36.462862-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:36.463000-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:36.463110-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:36.463257-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:36.463445-0500	RedLemon	   Payload keys: position, senderId, isPlaying, type, timestamp
default	16:42:36.463956-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:36.464185-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:36.464303-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:36.503205-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring jetsam update because this process is not memory-managed
default	16:42:36.503314-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring suspend because this process is not lifecycle managed
default	16:42:36.503557-0500	runningboardd	[anon<RedLemon>(501):6308] Set darwin role to: UserInteractiveNonFocal
default	16:42:36.503757-0500	runningboardd	[anon<RedLemon>(501):6308] Ignoring GPU update because this process is not GPU managed
default	16:42:36.871721-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:36.871969-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:42:36.872284-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:36.872389-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:36.872492-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:36.953725-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:36.953921-0500	RedLemon	   Payload keys: position, senderId, isPlaying, type, timestamp
default	16:42:36.954216-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:36.954385-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:36.954495-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:37.281791-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:37.282001-0500	RedLemon	   Payload keys: isPlaying, position, senderId, timestamp, type
default	16:42:37.282306-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:37.282423-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:37.282514-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:37.496016-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:37.496295-0500	RedLemon	   Payload keys: senderId, timestamp, type, isPlaying, position
default	16:42:37.496840-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:37.497057-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:37.497231-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:37.793757-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:37.793960-0500	RedLemon	   Payload keys: isPlaying, senderId, position, timestamp, type
default	16:42:37.794254-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:37.794388-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:37.794493-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:37.998110-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:37.998334-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:42:37.998613-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:37.998735-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:37.998828-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:38.305114-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:38.305361-0500	RedLemon	   Payload keys: timestamp, position, senderId, type, isPlaying
default	16:42:38.305727-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:38.305869-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:38.305973-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:38.509872-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:38.510082-0500	RedLemon	   Payload keys: position, senderId, isPlaying, type, timestamp
default	16:42:38.510447-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:38.510606-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:38.510711-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:38.818432-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:38.818717-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:42:38.819143-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:38.819339-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:38.819515-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:42:39.022526-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:42:39.022833-0500	RedLemon	   Payload keys: position, isPlaying, senderId, timestamp, type
default	16:42:39.023559-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: HN5M
default	16:42:39.023715-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:42:39.023865-0500	RedLemon	✅ Realtime: syncCallback invoked successfully





