default	16:01:47.796858-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "frontmost:5311" ID:169-129-1006 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	16:01:47.797055-0500	runningboardd	Assertion 169-129-1006 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:01:47.799705-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:47.803054-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:47.816112-0500	runningboardd	[anon<RedLemon>(501):5311] Set darwin role to: UserInteractiveFocal
default	16:01:47.820297-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:47.820682-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "notification:5311" ID:169-129-1007 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	16:01:47.821727-0500	runningboardd	Assertion 169-129-1007 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:01:47.833529-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:47.834723-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:47.834800-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:48.340377-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:01:48.340629-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BF7E4AB8-9F1A-4344-8D40-36A1CB47133B] (reporting strategy default)> on Task <EC441997-5359-4D32-992C-843820EC4604>.<321> was not selected for reporting
default	16:01:48.341176-0500	RedLemon	Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:01:48.341379-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:48.341562-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B0DC8680-3CC4-41C7-BB48-3F28739D4BD4] (reporting strategy default)> on Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> was not selected for reporting
default	16:01:48.341600-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	16:01:48.342288-0500	RedLemon	Connection 27: enabling TLS
default	16:01:48.342324-0500	RedLemon	Connection 27: starting, TC(0x0)
default	16:01:48.342366-0500	RedLemon	[C27 7A331C71-87E2-4A8D-96A9-F4B118A73A14 Hostname#afe42ebd:443 quic-connection, url hash: 4c7e9bc6, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{7C5E9FEF-3147-452F-9F12-1E82E6D1FF91}{(null)}{Y}{2} (private), proc: E8E931A4-3EA4-3070-8D28-FBFFFC7A0E59] start
default	16:01:48.342433-0500	RedLemon	[C27 Hostname#afe42ebd:443 initial path ((null))] event: path:start @0.000s
default	16:01:48.342619-0500	RedLemon	[C27 Hostname#afe42ebd:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: B8FD4E44-7D04-4B81-B076-7B3B43608901
default	16:01:48.342757-0500	RedLemon	[C27 Hostname#afe42ebd:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	16:01:48.342788-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C27] reporting state preparing
default	16:01:48.343231-0500	RedLemon	[C27.1 Hostname#afe42ebd:443 initial path ((null))] event: path:start @0.000s
default	16:01:48.343594-0500	RedLemon	[C27.1 Hostname#afe42ebd:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: F7762A65-ED02-46B9-AF3E-BF94574C1A35
default	16:01:48.343878-0500	RedLemon	[C27.1 Hostname#afe42ebd:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	16:01:48.344042-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> setting up Connection 27
default	16:01:48.344563-0500	mDNSResponder	[R467] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'z5LN/js6tAYV2drtLzzUoQ=='>, options: 0x8 {use-failover}, client pid: 5311 (RedLemon)
default	16:01:48.344202-0500	RedLemon	Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:48.344331-0500	RedLemon	Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> waiting for setup of Connection 27
default	16:01:48.388151-0500	mDNSResponder	[R467] getaddrinfo stop -- hostname: <mask.hash: 'z5LN/js6tAYV2drtLzzUoQ=='>, client pid: 5311 (RedLemon)
default	16:01:48.388916-0500	RedLemon	nw_endpoint_resolver_update [C27.1 Hostname#afe42ebd:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#085d3596.443
default	16:01:48.389048-0500	RedLemon	nw_endpoint_resolver_update [C27.1 Hostname#afe42ebd:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#8e3d1c9b:443
default	16:01:48.389523-0500	RedLemon	[C27.1 Hostname#afe42ebd:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.047s
default	16:01:48.390904-0500	RedLemon	[C27.1.1 IPv6#085d3596.443 initial path ((null))] event: path:start @0.048s
default	16:01:48.393646-0500	RedLemon	[C27.1.1 IPv6#085d3596.443 waiting path (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.051s, uuid: AA8F4782-4280-4F9B-A168-989BFF3D24B3
default	16:01:48.393985-0500	RedLemon	[C27.1.1 IPv6#085d3596.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.051s
default	16:01:48.395184-0500	RedLemon	[C27.1.1 IPv6#085d3596.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.052s
default	16:01:48.396274-0500	RedLemon	[C27.1.1 IPv6#085d3596.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.053s
default	16:01:48.396511-0500	RedLemon	tcp_output [C27.1.1:3] flags=[S] seq=1590833403, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1590833403
default	16:01:48.409991-0500	RedLemon	tcp_input [C27.1.1:3] flags=[S.] seq=1577989680, ack=1590833404, win=31416 state=SYN_SENT rcv_nxt=0, snd_una=1590833403
default	16:01:48.410250-0500	RedLemon	nw_flow_connected [C27.1.1 IPv6#085d3596.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:01:48.410463-0500	RedLemon	[C27.1.1 IPv6#085d3596.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.068s
default	16:01:48.410625-0500	RedLemon	[C27.1 Hostname#afe42ebd:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.068s
default	16:01:48.410707-0500	RedLemon	[C27 Hostname#afe42ebd:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.068s
default	16:01:48.411214-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C27.1.1:2][0x7f8630a62f40] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:01:48.411550-0500	RedLemon	boringssl_context_info_handler(2028) [C27.1.1:2][0x7f8630a62f40] Client handshake started
default	16:01:48.412456-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS client enter_early_data
default	16:01:48.412641-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS client read_server_hello
default	16:01:48.607358-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:01:48.607430-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client read_server_hello
default	16:01:48.607752-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:01:48.608232-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client read_certificate_request
default	16:01:48.609638-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client read_server_certificate
default	16:01:48.609755-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:01:48.611177-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C27.1.1:2][0x7f8630a62f40] Performing external trust evaluation
default	16:01:48.611368-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C27.1.1:2][0x7f8630a62f40] Asyncing for external verify block
default	16:01:48.611536-0500	RedLemon	Connection 27: asked to evaluate TLS Trust
default	16:01:48.611869-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> auth completion disp=1 cred=0x0
default	16:01:48.613687-0500	RedLemon	Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:48.614084-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E6732493-0116-40D4-873C-5DCFE5163585] (reporting strategy default)> on Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> was not selected for reporting
default	16:01:48.615209-0500	RedLemon	Connection 28: enabling TLS
default	16:01:48.615281-0500	RedLemon	Connection 28: starting, TC(0x0)
default	16:01:48.615365-0500	RedLemon	[C28 CD116DD6-E75D-4D84-BB8C-38D7CE728AF1 Hostname#23ce8654:443 tcp, url hash: 02510389, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{7028141D-486E-4BFE-B69D-4A7DB634233A}{(null)}{Y}{2} (private), proc: E8E931A4-3EA4-3070-8D28-FBFFFC7A0E59] start
default	16:01:48.615514-0500	RedLemon	[C28 Hostname#23ce8654:443 initial path ((null))] event: path:start @0.000s
default	16:01:48.615856-0500	RedLemon	[C28 Hostname#23ce8654:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: E5F5D1A7-C907-4FBE-A546-DD028A9AFC44
default	16:01:48.616027-0500	RedLemon	[C28 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	16:01:48.616058-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state preparing
default	16:01:48.616231-0500	mDNSResponder	[R468] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'LfJOt0PdXD49Vu8v884VSw=='>, options: 0x8 {use-failover}, client pid: 5311 (RedLemon)
default	16:01:48.616241-0500	RedLemon	Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> setting up Connection 28
default	16:01:48.620434-0500	RedLemon	Connection 27: TLS Trust result 0
default	16:01:48.620490-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C27.1.1:2][0x7f8630a62f40] Returning from external verify block with result: true
default	16:01:48.620565-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C27.1.1:2][0x7f8630a62f40] Certificate verification result: OK
default	16:01:48.620942-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client read_server_finished
default	16:01:48.621176-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:01:48.621206-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:01:48.621234-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client send_client_certificate
default	16:01:48.621263-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client complete_second_flight
default	16:01:48.621423-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS 1.3 client done
default	16:01:48.621709-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS client finish_client_handshake
default	16:01:48.621761-0500	RedLemon	boringssl_context_info_handler(2045) [C27.1.1:2][0x7f8630a62f40] Client handshake state: TLS client done
default	16:01:48.621797-0500	RedLemon	boringssl_context_info_handler(2034) [C27.1.1:2][0x7f8630a62f40] Client handshake done
default	16:01:48.623100-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C27.1.1:2][0x7f8630a62f40] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(211ms) flight_time(196ms) rtt(195ms) write_stalls(0) read_stalls(7)]
default	16:01:48.623264-0500	RedLemon	nw_flow_connected [C27.1.1 IPv6#085d3596.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-88486127)
default	16:01:48.623588-0500	RedLemon	[C27.1.1 IPv6#085d3596.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.281s
default	16:01:48.623747-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C27] reporting state ready
default	16:01:48.624046-0500	RedLemon	[C27.1 Hostname#afe42ebd:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.281s
default	16:01:48.624253-0500	RedLemon	[C27 Hostname#afe42ebd:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.281s
default	16:01:48.624456-0500	RedLemon	[C27.1.1 IPv6#085d3596.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.282s
default	16:01:48.624576-0500	RedLemon	[C27.1 Hostname#afe42ebd:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.282s
default	16:01:48.624639-0500	RedLemon	[C27 Hostname#afe42ebd:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.282s
default	16:01:48.625296-0500	RedLemon	Connection 27: connected successfully
default	16:01:48.625396-0500	RedLemon	Connection 27: TLS handshake complete
default	16:01:48.625780-0500	RedLemon	Connection 27: ready C(N) E(N)
default	16:01:48.627405-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> now using Connection 27
default	16:01:48.627691-0500	RedLemon	Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> now using Connection 27
default	16:01:48.627829-0500	RedLemon	Connection 27: received viability advisory(Y)
default	16:01:48.627979-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> sent request, body N 0
default	16:01:48.628858-0500	RedLemon	Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> sent request, body N 0
default	16:01:48.646378-0500	mDNSResponder	[R468] getaddrinfo stop -- hostname: <mask.hash: 'LfJOt0PdXD49Vu8v884VSw=='>, client pid: 5311 (RedLemon)
default	16:01:48.646922-0500	RedLemon	nw_endpoint_resolver_update [C28 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#9735f8ed:443
default	16:01:48.647248-0500	RedLemon	nw_endpoint_resolver_update [C28 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#bdc5d67c:443
default	16:01:48.647783-0500	RedLemon	[C28 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.032s
default	16:01:48.648386-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 initial path ((null))] event: path:start @0.032s
default	16:01:48.649573-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.034s, uuid: 4098041A-7D28-4A0D-90FE-525CCE3B7E23
default	16:01:48.649755-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.034s
default	16:01:48.650810-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.035s
default	16:01:48.651962-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.036s
default	16:01:48.652415-0500	RedLemon	tcp_output [C28.1:3] flags=[S] seq=1584075386, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1584075386
default	16:01:48.655117-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> received response, status 200 content K
default	16:01:48.695751-0500	RedLemon	Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> received response, status 200 content K
default	16:01:48.701968-0500	RedLemon	tcp_input [C28.1:3] flags=[S.] seq=381011346, ack=1584075387, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1584075386
default	16:01:48.702091-0500	RedLemon	nw_flow_connected [C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:01:48.702263-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.086s
default	16:01:48.702326-0500	RedLemon	[C28 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.086s
default	16:01:48.702693-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C28.1:2][0x7f8633a92500] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:01:48.702836-0500	RedLemon	boringssl_context_info_handler(2028) [C28.1:2][0x7f8633a92500] Client handshake started
default	16:01:48.703022-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS client enter_early_data
default	16:01:48.703123-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS client read_server_hello
default	16:01:48.708041-0500	RedLemon	Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> done using Connection 27
default	16:01:48.708137-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> done using Connection 27
default	16:01:48.708223-0500	RedLemon	Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> response ended
default	16:01:48.708301-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> response ended
default	16:01:48.708815-0500	RedLemon	Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> summary for task success {transaction_duration_ms=367, response_status=200, connection=27, reused=1, request_start_ms=286, request_duration_ms=0, response_start_ms=353, response_duration_ms=12, request_bytes=42, response_bytes=117382, cache_hit=false}
default	16:01:48.708904-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> summary for task success {transaction_duration_ms=367, response_status=200, connection=27, protocol="h2", domain_lookup_duration_ms=46, connect_duration_ms=228, secure_connection_duration_ms=211, private_relay=false, request_start_ms=286, request_duration_ms=0, response_start_ms=313, response_duration_ms=53, request_bytes=129, response_bytes=117975, cache_hit=false}
default	16:01:48.708900-0500	RedLemon	Task <37C6C4C2-508E-46C9-BA23-7EC512C3DF26>.<322> finished successfully
default	16:01:48.712357-0500	RedLemon	Task <EC441997-5359-4D32-992C-843820EC4604>.<321> finished successfully
default	16:01:48.719268-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:01:48.719342-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client read_server_hello
default	16:01:48.719625-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:01:48.721092-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client read_certificate_request
default	16:01:48.721199-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client read_server_certificate
default	16:01:48.721265-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:01:48.721796-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C28.1:2][0x7f8633a92500] Performing external trust evaluation
default	16:01:48.721971-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C28.1:2][0x7f8633a92500] Asyncing for external verify block
default	16:01:48.722124-0500	RedLemon	Connection 28: asked to evaluate TLS Trust
default	16:01:48.722448-0500	RedLemon	Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> auth completion disp=1 cred=0x0
default	16:01:48.729784-0500	RedLemon	Connection 28: TLS Trust result 0
default	16:01:48.729841-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C28.1:2][0x7f8633a92500] Returning from external verify block with result: true
default	16:01:48.729919-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C28.1:2][0x7f8633a92500] Certificate verification result: OK
default	16:01:48.730331-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client read_server_finished
default	16:01:48.730443-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:01:48.730475-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:01:48.730505-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client send_client_certificate
default	16:01:48.730535-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client complete_second_flight
default	16:01:48.730653-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS 1.3 client done
default	16:01:48.731086-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS client finish_client_handshake
default	16:01:48.731132-0500	RedLemon	boringssl_context_info_handler(2045) [C28.1:2][0x7f8633a92500] Client handshake state: TLS client done
default	16:01:48.731215-0500	RedLemon	boringssl_context_info_handler(2034) [C28.1:2][0x7f8633a92500] Client handshake done
default	16:01:48.732177-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C28.1:2][0x7f8633a92500] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(29ms) flight_time(19ms) rtt(17ms) write_stalls(0) read_stalls(8)]
default	16:01:48.732853-0500	RedLemon	nw_flow_connected [C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-88486127)
default	16:01:48.733171-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.117s
default	16:01:48.733395-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state ready
default	16:01:48.733570-0500	RedLemon	[C28 Hostname#23ce8654:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.118s
default	16:01:48.733740-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.118s
default	16:01:48.733808-0500	RedLemon	[C28 Hostname#23ce8654:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.118s
default	16:01:48.733979-0500	RedLemon	Connection 28: connected successfully
default	16:01:48.734030-0500	RedLemon	Connection 28: TLS handshake complete
default	16:01:48.734357-0500	RedLemon	Connection 28: ready C(N) E(N)
default	16:01:48.734553-0500	RedLemon	Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> now using Connection 28
default	16:01:48.734643-0500	RedLemon	Connection 28: received viability advisory(Y)
default	16:01:48.734931-0500	RedLemon	Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> sent request, body N 0
default	16:01:49.071867-0500	RedLemon	Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> received response, status 101 content U
default	16:01:49.072254-0500	RedLemon	Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> response ended
default	16:01:49.072357-0500	RedLemon	Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> done using Connection 28
default	16:01:49.073328-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.457s
default	16:01:49.073390-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state preparing
default	16:01:49.073493-0500	RedLemon	[C28 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.458s
default	16:01:49.074018-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1013 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:49.073707-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.458s
default	16:01:49.073796-0500	RedLemon	[C28 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.458s
default	16:01:49.073908-0500	RedLemon	nw_flow_connected [C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:01:49.074666-0500	runningboardd	Assertion 169-5311-1013 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:01:49.074131-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.458s
default	16:01:49.074220-0500	RedLemon	[C28 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.458s
default	16:01:49.074400-0500	RedLemon	nw_flow_connected [C28.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-88486127)
default	16:01:49.075133-0500	RedLemon	[C28.1 IPv4#9735f8ed:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.459s
default	16:01:49.075210-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state ready
default	16:01:49.075325-0500	RedLemon	[C28 Hostname#23ce8654:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.459s
default	16:01:49.076605-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:49.076658-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:49.076709-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:49.079319-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1014 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:49.079452-0500	runningboardd	Assertion 169-103-1014 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:01:49.080179-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:49.080233-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:49.080279-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:50.152579-0500	runningboardd	Invalidating assertion 169-5311-1013 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:01:50.221755-0500	RedLemon	Task <8ACC8C14-A4D5-4005-9BD8-1F29F0A514B0>.<323> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:50.222034-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C808916F-1710-41FB-9124-C26E55A1558D] (reporting strategy default)> on Task <8ACC8C14-A4D5-4005-9BD8-1F29F0A514B0>.<323> was not selected for reporting
default	16:01:50.222620-0500	RedLemon	Task <8ACC8C14-A4D5-4005-9BD8-1F29F0A514B0>.<323> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:50.222805-0500	RedLemon	Task <8ACC8C14-A4D5-4005-9BD8-1F29F0A514B0>.<323> now using Connection 1
default	16:01:50.223511-0500	RedLemon	0x7f86317890d8 ID=656 Task <8ACC8C14-A4D5-4005-9BD8-1F29F0A514B0>.<323> sent request, body N 0
default	16:01:50.293176-0500	RedLemon	0x7f86317890d8 ID=656 Task <8ACC8C14-A4D5-4005-9BD8-1F29F0A514B0>.<323> received response, status 200 content U
default	16:01:50.294002-0500	RedLemon	Task <8ACC8C14-A4D5-4005-9BD8-1F29F0A514B0>.<323> response ended
default	16:01:50.294672-0500	RedLemon	Task <8ACC8C14-A4D5-4005-9BD8-1F29F0A514B0>.<323> done using Connection 1
default	16:01:50.294928-0500	RedLemon	Task <8ACC8C14-A4D5-4005-9BD8-1F29F0A514B0>.<323> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=70, response_duration_ms=1, request_bytes=534, response_bytes=1912, cache_hit=false}
default	16:01:50.295660-0500	RedLemon	Task <8ACC8C14-A4D5-4005-9BD8-1F29F0A514B0>.<323> finished successfully
default	16:01:50.298150-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1015 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:50.298335-0500	runningboardd	Assertion 169-5311-1015 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:01:50.299690-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:50.299731-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:50.299773-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:50.300232-0500	runningboardd	Attempting to rename power assertion 33541 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1013:com.apple.CFNetwork.StorageDB;169-5311-1015:com.apple.CFNetwork.StorageDB
default	16:01:50.307141-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:50.390510-0500	RedLemon	Task <B7037ADD-1CB7-44E5-8701-EA7700A90B97>.<324> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:50.391088-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5BDC0615-BF8B-4322-B75C-D5893F6248BE] (reporting strategy default)> on Task <B7037ADD-1CB7-44E5-8701-EA7700A90B97>.<324> was not selected for reporting
default	16:01:50.391741-0500	RedLemon	Task <B7037ADD-1CB7-44E5-8701-EA7700A90B97>.<324> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:50.392138-0500	RedLemon	Task <B7037ADD-1CB7-44E5-8701-EA7700A90B97>.<324> now using Connection 1
default	16:01:50.399590-0500	RedLemon	0x7f863087fab8 ID=660 Task <B7037ADD-1CB7-44E5-8701-EA7700A90B97>.<324> sent request, body N 0
default	16:01:50.454200-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:50.454216-0500	runningboardd	Attempting to rename power assertion 33541 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1015:com.apple.CFNetwork.StorageDB
default	16:01:50.457967-0500	RedLemon	0x7f863087fab8 ID=660 Task <B7037ADD-1CB7-44E5-8701-EA7700A90B97>.<324> received response, status 200 content U
default	16:01:50.458461-0500	RedLemon	Task <B7037ADD-1CB7-44E5-8701-EA7700A90B97>.<324> response ended
default	16:01:50.458888-0500	RedLemon	Task <B7037ADD-1CB7-44E5-8701-EA7700A90B97>.<324> done using Connection 1
default	16:01:50.459707-0500	RedLemon	Task <B7037ADD-1CB7-44E5-8701-EA7700A90B97>.<324> summary for task success {transaction_duration_ms=68, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=5, response_start_ms=66, response_duration_ms=1, request_bytes=511, response_bytes=789, cache_hit=false}
default	16:01:50.460464-0500	RedLemon	Task <B7037ADD-1CB7-44E5-8701-EA7700A90B97>.<324> finished successfully
default	16:01:50.461927-0500	RedLemon	Task <E0D3F9ED-E946-44F6-BE46-6AC167253626>.<325> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:50.462469-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [97B1BBCD-665E-414C-A756-8B473DEF0B0D] (reporting strategy default)> on Task <E0D3F9ED-E946-44F6-BE46-6AC167253626>.<325> was not selected for reporting
default	16:01:50.463344-0500	RedLemon	Task <E0D3F9ED-E946-44F6-BE46-6AC167253626>.<325> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:50.463659-0500	RedLemon	Task <E0D3F9ED-E946-44F6-BE46-6AC167253626>.<325> now using Connection 1
default	16:01:50.469543-0500	RedLemon	0x7f862e251c58 ID=664 Task <E0D3F9ED-E946-44F6-BE46-6AC167253626>.<325> sent request, body N 0
default	16:01:50.482122-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:50.514348-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:50.514612-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:50.545792-0500	RedLemon	0x7f862e251c58 ID=664 Task <E0D3F9ED-E946-44F6-BE46-6AC167253626>.<325> received response, status 200 content U
default	16:01:50.546544-0500	RedLemon	Task <E0D3F9ED-E946-44F6-BE46-6AC167253626>.<325> response ended
default	16:01:50.547230-0500	RedLemon	Task <E0D3F9ED-E946-44F6-BE46-6AC167253626>.<325> done using Connection 1
default	16:01:50.547573-0500	RedLemon	Task <E0D3F9ED-E946-44F6-BE46-6AC167253626>.<325> summary for task success {transaction_duration_ms=84, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=5, response_start_ms=82, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	16:01:50.547929-0500	RedLemon	Task <E0D3F9ED-E946-44F6-BE46-6AC167253626>.<325> finished successfully
default	16:01:50.549894-0500	RedLemon	Task <7A0A3ABA-A45B-4AA8-9B88-16DCCCE09CB3>.<326> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:50.550234-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6E31F9D6-D7BD-4B8C-A828-77EB20EFAF36] (reporting strategy default)> on Task <7A0A3ABA-A45B-4AA8-9B88-16DCCCE09CB3>.<326> was not selected for reporting
default	16:01:50.550988-0500	RedLemon	Task <7A0A3ABA-A45B-4AA8-9B88-16DCCCE09CB3>.<326> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:50.551201-0500	RedLemon	Task <7A0A3ABA-A45B-4AA8-9B88-16DCCCE09CB3>.<326> now using Connection 1
default	16:01:50.551983-0500	RedLemon	0x7f8632e1e408 ID=668 Task <7A0A3ABA-A45B-4AA8-9B88-16DCCCE09CB3>.<326> sent request, body N 0
default	16:01:50.566468-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:50.612659-0500	RedLemon	0x7f8632e1e408 ID=668 Task <7A0A3ABA-A45B-4AA8-9B88-16DCCCE09CB3>.<326> received response, status 200 content U
default	16:01:50.613631-0500	RedLemon	Task <7A0A3ABA-A45B-4AA8-9B88-16DCCCE09CB3>.<326> response ended
default	16:01:50.613920-0500	RedLemon	Task <7A0A3ABA-A45B-4AA8-9B88-16DCCCE09CB3>.<326> done using Connection 1
default	16:01:50.614075-0500	RedLemon	Task <7A0A3ABA-A45B-4AA8-9B88-16DCCCE09CB3>.<326> summary for task success {transaction_duration_ms=63, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:01:50.614509-0500	RedLemon	Task <7A0A3ABA-A45B-4AA8-9B88-16DCCCE09CB3>.<326> finished successfully
default	16:01:50.616231-0500	RedLemon	Task <4FC60709-7944-4C1D-A8A5-F7BDA10ED91C>.<327> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:50.616563-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7B01A16D-008D-4A90-A500-765EAEF4C2F9] (reporting strategy default)> on Task <4FC60709-7944-4C1D-A8A5-F7BDA10ED91C>.<327> was not selected for reporting
default	16:01:50.617286-0500	RedLemon	Task <4FC60709-7944-4C1D-A8A5-F7BDA10ED91C>.<327> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:50.617491-0500	RedLemon	Task <4FC60709-7944-4C1D-A8A5-F7BDA10ED91C>.<327> now using Connection 1
default	16:01:50.618233-0500	RedLemon	0x7f863087fab8 ID=672 Task <4FC60709-7944-4C1D-A8A5-F7BDA10ED91C>.<327> sent request, body N 0
default	16:01:50.628249-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:50.680835-0500	RedLemon	0x7f863087fab8 ID=672 Task <4FC60709-7944-4C1D-A8A5-F7BDA10ED91C>.<327> received response, status 200 content U
default	16:01:50.681626-0500	RedLemon	Task <4FC60709-7944-4C1D-A8A5-F7BDA10ED91C>.<327> response ended
default	16:01:50.682126-0500	RedLemon	Task <4FC60709-7944-4C1D-A8A5-F7BDA10ED91C>.<327> done using Connection 1
default	16:01:50.682357-0500	RedLemon	Task <4FC60709-7944-4C1D-A8A5-F7BDA10ED91C>.<327> summary for task success {transaction_duration_ms=65, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=511, response_bytes=837, cache_hit=true}
default	16:01:50.683065-0500	RedLemon	Task <4FC60709-7944-4C1D-A8A5-F7BDA10ED91C>.<327> finished successfully
default	16:01:50.684891-0500	RedLemon	Task <D143EA7B-3581-4174-8251-C895567ED986>.<328> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:50.685189-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4CC0E926-FFFC-4DC5-A45C-0812491E24E9] (reporting strategy default)> on Task <D143EA7B-3581-4174-8251-C895567ED986>.<328> was not selected for reporting
default	16:01:50.685924-0500	RedLemon	Task <D143EA7B-3581-4174-8251-C895567ED986>.<328> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:50.686122-0500	RedLemon	Task <D143EA7B-3581-4174-8251-C895567ED986>.<328> now using Connection 1
default	16:01:50.686903-0500	RedLemon	0x7f8632e1e408 ID=676 Task <D143EA7B-3581-4174-8251-C895567ED986>.<328> sent request, body N 0
default	16:01:50.700414-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:50.753586-0500	RedLemon	0x7f8632e1e408 ID=676 Task <D143EA7B-3581-4174-8251-C895567ED986>.<328> received response, status 200 content U
default	16:01:50.754175-0500	RedLemon	Task <D143EA7B-3581-4174-8251-C895567ED986>.<328> response ended
default	16:01:50.754637-0500	RedLemon	Task <D143EA7B-3581-4174-8251-C895567ED986>.<328> done using Connection 1
default	16:01:50.754870-0500	RedLemon	Task <D143EA7B-3581-4174-8251-C895567ED986>.<328> summary for task success {transaction_duration_ms=69, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=67, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:01:50.755502-0500	RedLemon	Task <D143EA7B-3581-4174-8251-C895567ED986>.<328> finished successfully
default	16:01:50.757164-0500	RedLemon	Task <7FD7F9CD-0D41-420D-9FA2-6E21847E78ED>.<329> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:50.757467-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [96F1E9F8-485C-49DB-9EEA-2D4040805A67] (reporting strategy default)> on Task <7FD7F9CD-0D41-420D-9FA2-6E21847E78ED>.<329> was not selected for reporting
default	16:01:50.758341-0500	RedLemon	Task <7FD7F9CD-0D41-420D-9FA2-6E21847E78ED>.<329> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:50.758668-0500	RedLemon	Task <7FD7F9CD-0D41-420D-9FA2-6E21847E78ED>.<329> now using Connection 1
default	16:01:50.759634-0500	RedLemon	0x7f8633a3da78 ID=680 Task <7FD7F9CD-0D41-420D-9FA2-6E21847E78ED>.<329> sent request, body N 0
default	16:01:50.811408-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:50.853984-0500	RedLemon	0x7f8633a3da78 ID=680 Task <7FD7F9CD-0D41-420D-9FA2-6E21847E78ED>.<329> received response, status 200 content U
default	16:01:50.854581-0500	RedLemon	Task <7FD7F9CD-0D41-420D-9FA2-6E21847E78ED>.<329> response ended
default	16:01:50.855494-0500	RedLemon	Task <7FD7F9CD-0D41-420D-9FA2-6E21847E78ED>.<329> done using Connection 1
default	16:01:50.856013-0500	RedLemon	Task <7FD7F9CD-0D41-420D-9FA2-6E21847E78ED>.<329> summary for task success {transaction_duration_ms=98, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=95, response_duration_ms=1, request_bytes=512, response_bytes=835, cache_hit=true}
default	16:01:50.856316-0500	RedLemon	Task <7FD7F9CD-0D41-420D-9FA2-6E21847E78ED>.<329> finished successfully
default	16:01:50.857939-0500	RedLemon	Task <E803B0DA-AC8C-4F7A-80D6-F4EFAEF0ADA2>.<330> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:50.858413-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0DC9F9F7-C500-4149-A036-CBF3DFE083AA] (reporting strategy default)> on Task <E803B0DA-AC8C-4F7A-80D6-F4EFAEF0ADA2>.<330> was not selected for reporting
default	16:01:50.859112-0500	RedLemon	Task <E803B0DA-AC8C-4F7A-80D6-F4EFAEF0ADA2>.<330> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:50.859317-0500	RedLemon	Task <E803B0DA-AC8C-4F7A-80D6-F4EFAEF0ADA2>.<330> now using Connection 1
default	16:01:50.860083-0500	RedLemon	0x7f8632e1e408 ID=684 Task <E803B0DA-AC8C-4F7A-80D6-F4EFAEF0ADA2>.<330> sent request, body N 0
default	16:01:50.875299-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:50.920527-0500	RedLemon	0x7f8632e1e408 ID=684 Task <E803B0DA-AC8C-4F7A-80D6-F4EFAEF0ADA2>.<330> received response, status 200 content U
default	16:01:50.921339-0500	RedLemon	Task <E803B0DA-AC8C-4F7A-80D6-F4EFAEF0ADA2>.<330> response ended
default	16:01:50.921808-0500	RedLemon	Task <E803B0DA-AC8C-4F7A-80D6-F4EFAEF0ADA2>.<330> done using Connection 1
default	16:01:50.922066-0500	RedLemon	Task <E803B0DA-AC8C-4F7A-80D6-F4EFAEF0ADA2>.<330> summary for task success {transaction_duration_ms=63, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:01:50.922918-0500	RedLemon	Task <E803B0DA-AC8C-4F7A-80D6-F4EFAEF0ADA2>.<330> finished successfully
default	16:01:50.924860-0500	RedLemon	Task <75A75823-A8D1-40A7-8CD2-A2E071835C93>.<331> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:50.925190-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8C043ACD-FEDC-40F3-BC56-AD40DDEA11E8] (reporting strategy default)> on Task <75A75823-A8D1-40A7-8CD2-A2E071835C93>.<331> was not selected for reporting
default	16:01:50.926011-0500	RedLemon	Task <75A75823-A8D1-40A7-8CD2-A2E071835C93>.<331> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:50.926213-0500	RedLemon	Task <75A75823-A8D1-40A7-8CD2-A2E071835C93>.<331> now using Connection 1
default	16:01:50.927016-0500	RedLemon	0x7f8632e1e408 ID=688 Task <75A75823-A8D1-40A7-8CD2-A2E071835C93>.<331> sent request, body N 0
default	16:01:50.935555-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:50.992257-0500	RedLemon	0x7f8632e1e408 ID=688 Task <75A75823-A8D1-40A7-8CD2-A2E071835C93>.<331> received response, status 200 content U
default	16:01:50.992929-0500	RedLemon	Task <75A75823-A8D1-40A7-8CD2-A2E071835C93>.<331> response ended
default	16:01:50.993410-0500	RedLemon	Task <75A75823-A8D1-40A7-8CD2-A2E071835C93>.<331> done using Connection 1
default	16:01:50.993676-0500	RedLemon	Task <75A75823-A8D1-40A7-8CD2-A2E071835C93>.<331> summary for task success {transaction_duration_ms=68, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=66, response_duration_ms=1, request_bytes=511, response_bytes=835, cache_hit=true}
default	16:01:50.994251-0500	RedLemon	Task <75A75823-A8D1-40A7-8CD2-A2E071835C93>.<331> finished successfully
default	16:01:50.996556-0500	RedLemon	Task <1EA868E9-DB7D-43FC-ABD2-36FD25D72A2C>.<332> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:50.996897-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4F249F1C-EBA8-430A-9B4C-D7EEE445C289] (reporting strategy default)> on Task <1EA868E9-DB7D-43FC-ABD2-36FD25D72A2C>.<332> was not selected for reporting
default	16:01:50.997735-0500	RedLemon	Task <1EA868E9-DB7D-43FC-ABD2-36FD25D72A2C>.<332> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:50.997939-0500	RedLemon	Task <1EA868E9-DB7D-43FC-ABD2-36FD25D72A2C>.<332> now using Connection 1
default	16:01:50.998846-0500	RedLemon	0x7f863087fab8 ID=692 Task <1EA868E9-DB7D-43FC-ABD2-36FD25D72A2C>.<332> sent request, body N 0
default	16:01:51.006464-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.065267-0500	RedLemon	0x7f863087fab8 ID=692 Task <1EA868E9-DB7D-43FC-ABD2-36FD25D72A2C>.<332> received response, status 200 content U
default	16:01:51.065896-0500	RedLemon	Task <1EA868E9-DB7D-43FC-ABD2-36FD25D72A2C>.<332> response ended
default	16:01:51.066203-0500	RedLemon	Task <1EA868E9-DB7D-43FC-ABD2-36FD25D72A2C>.<332> done using Connection 1
default	16:01:51.066345-0500	RedLemon	Task <1EA868E9-DB7D-43FC-ABD2-36FD25D72A2C>.<332> summary for task success {transaction_duration_ms=69, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=67, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:01:51.066720-0500	RedLemon	Task <1EA868E9-DB7D-43FC-ABD2-36FD25D72A2C>.<332> finished successfully
default	16:01:51.068368-0500	RedLemon	Task <3FC9C49B-F94E-4F4B-AADE-1561299E5032>.<333> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.068677-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [31AB7D89-EA74-4C85-B528-F0703B71F6F7] (reporting strategy default)> on Task <3FC9C49B-F94E-4F4B-AADE-1561299E5032>.<333> was not selected for reporting
default	16:01:51.069477-0500	RedLemon	Task <3FC9C49B-F94E-4F4B-AADE-1561299E5032>.<333> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.069684-0500	RedLemon	Task <3FC9C49B-F94E-4F4B-AADE-1561299E5032>.<333> now using Connection 1
default	16:01:51.070451-0500	RedLemon	0x7f863087fab8 ID=696 Task <3FC9C49B-F94E-4F4B-AADE-1561299E5032>.<333> sent request, body N 0
default	16:01:51.183260-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.203598-0500	RedLemon	0x7f863087fab8 ID=696 Task <3FC9C49B-F94E-4F4B-AADE-1561299E5032>.<333> received response, status 200 content U
default	16:01:51.204451-0500	RedLemon	Task <3FC9C49B-F94E-4F4B-AADE-1561299E5032>.<333> response ended
default	16:01:51.204927-0500	RedLemon	Task <3FC9C49B-F94E-4F4B-AADE-1561299E5032>.<333> done using Connection 1
default	16:01:51.205163-0500	RedLemon	Task <3FC9C49B-F94E-4F4B-AADE-1561299E5032>.<333> summary for task success {transaction_duration_ms=136, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=134, response_duration_ms=1, request_bytes=511, response_bytes=838, cache_hit=true}
default	16:01:51.205785-0500	RedLemon	Task <3FC9C49B-F94E-4F4B-AADE-1561299E5032>.<333> finished successfully
default	16:01:51.207242-0500	RedLemon	Task <61B7260E-9256-4517-8311-1D56E0B49E49>.<334> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.207570-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7DDB1834-0A5A-4ABE-87E6-90D58417DDC5] (reporting strategy default)> on Task <61B7260E-9256-4517-8311-1D56E0B49E49>.<334> was not selected for reporting
default	16:01:51.208383-0500	RedLemon	Task <61B7260E-9256-4517-8311-1D56E0B49E49>.<334> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.208584-0500	RedLemon	Task <61B7260E-9256-4517-8311-1D56E0B49E49>.<334> now using Connection 1
default	16:01:51.209458-0500	RedLemon	0x7f8632e61b78 ID=700 Task <61B7260E-9256-4517-8311-1D56E0B49E49>.<334> sent request, body N 0
default	16:01:51.311959-0500	runningboardd	Invalidating assertion 169-5311-1015 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:01:51.325726-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.338762-0500	RedLemon	0x7f8632e61b78 ID=700 Task <61B7260E-9256-4517-8311-1D56E0B49E49>.<334> received response, status 200 content U
default	16:01:51.339272-0500	RedLemon	Task <61B7260E-9256-4517-8311-1D56E0B49E49>.<334> response ended
default	16:01:51.339689-0500	RedLemon	Task <61B7260E-9256-4517-8311-1D56E0B49E49>.<334> done using Connection 1
default	16:01:51.339874-0500	RedLemon	Task <61B7260E-9256-4517-8311-1D56E0B49E49>.<334> summary for task success {transaction_duration_ms=131, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=130, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:01:51.340075-0500	RedLemon	Task <61B7260E-9256-4517-8311-1D56E0B49E49>.<334> finished successfully
default	16:01:51.342206-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1017 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:51.342386-0500	RedLemon	Task <7FC1FC8A-5A6E-400D-B80D-060AD6A9BD62>.<335> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.342794-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [389A76C6-3F10-42C6-BFD2-5259A16C4DB1] (reporting strategy default)> on Task <7FC1FC8A-5A6E-400D-B80D-060AD6A9BD62>.<335> was not selected for reporting
default	16:01:51.343535-0500	runningboardd	Assertion 169-5311-1017 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:01:51.344057-0500	RedLemon	Task <7FC1FC8A-5A6E-400D-B80D-060AD6A9BD62>.<335> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.344345-0500	RedLemon	Task <7FC1FC8A-5A6E-400D-B80D-060AD6A9BD62>.<335> now using Connection 1
default	16:01:51.345388-0500	RedLemon	0x7f8632e61b78 ID=704 Task <7FC1FC8A-5A6E-400D-B80D-060AD6A9BD62>.<335> sent request, body N 0
default	16:01:51.347764-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:51.347973-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:51.348527-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:51.350044-0500	runningboardd	Attempting to rename power assertion 33541 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1015:com.apple.CFNetwork.StorageDB;169-5311-1017:com.apple.CFNetwork.StorageDB
default	16:01:51.351341-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.410984-0500	RedLemon	0x7f8632e61b78 ID=704 Task <7FC1FC8A-5A6E-400D-B80D-060AD6A9BD62>.<335> received response, status 200 content U
default	16:01:51.411576-0500	RedLemon	Task <7FC1FC8A-5A6E-400D-B80D-060AD6A9BD62>.<335> response ended
default	16:01:51.412090-0500	RedLemon	Task <7FC1FC8A-5A6E-400D-B80D-060AD6A9BD62>.<335> done using Connection 1
default	16:01:51.412318-0500	RedLemon	Task <7FC1FC8A-5A6E-400D-B80D-060AD6A9BD62>.<335> summary for task success {transaction_duration_ms=69, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=67, response_duration_ms=1, request_bytes=511, response_bytes=834, cache_hit=true}
default	16:01:51.412904-0500	RedLemon	Task <7FC1FC8A-5A6E-400D-B80D-060AD6A9BD62>.<335> finished successfully
default	16:01:51.414889-0500	RedLemon	Task <435D0C06-C41E-4EAD-BF2B-6427653431B3>.<336> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.415198-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F0FDF235-0CB2-44E6-AE36-F0021A0EB571] (reporting strategy default)> on Task <435D0C06-C41E-4EAD-BF2B-6427653431B3>.<336> was not selected for reporting
default	16:01:51.416012-0500	RedLemon	Task <435D0C06-C41E-4EAD-BF2B-6427653431B3>.<336> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.416249-0500	RedLemon	Task <435D0C06-C41E-4EAD-BF2B-6427653431B3>.<336> now using Connection 1
default	16:01:51.417165-0500	RedLemon	0x7f863087fab8 ID=708 Task <435D0C06-C41E-4EAD-BF2B-6427653431B3>.<336> sent request, body N 0
default	16:01:51.431592-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.476265-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:51.476408-0500	runningboardd	Attempting to rename power assertion 33541 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1017:com.apple.CFNetwork.StorageDB
default	16:01:51.476538-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:51.477080-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:51.478008-0500	RedLemon	0x7f863087fab8 ID=708 Task <435D0C06-C41E-4EAD-BF2B-6427653431B3>.<336> received response, status 200 content U
default	16:01:51.478668-0500	RedLemon	Task <435D0C06-C41E-4EAD-BF2B-6427653431B3>.<336> response ended
default	16:01:51.479110-0500	RedLemon	Task <435D0C06-C41E-4EAD-BF2B-6427653431B3>.<336> done using Connection 1
default	16:01:51.479294-0500	RedLemon	Task <435D0C06-C41E-4EAD-BF2B-6427653431B3>.<336> summary for task success {transaction_duration_ms=63, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:01:51.479537-0500	RedLemon	Task <435D0C06-C41E-4EAD-BF2B-6427653431B3>.<336> finished successfully
default	16:01:51.481172-0500	RedLemon	Task <4BD521CA-E02D-4697-93A4-DD76D60D665F>.<337> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.481544-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6317D004-9AF7-4541-8452-56D60CF5E6A0] (reporting strategy default)> on Task <4BD521CA-E02D-4697-93A4-DD76D60D665F>.<337> was not selected for reporting
default	16:01:51.482259-0500	RedLemon	Task <4BD521CA-E02D-4697-93A4-DD76D60D665F>.<337> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.482523-0500	RedLemon	Task <4BD521CA-E02D-4697-93A4-DD76D60D665F>.<337> now using Connection 1
default	16:01:51.483493-0500	RedLemon	0x7f863087fab8 ID=712 Task <4BD521CA-E02D-4697-93A4-DD76D60D665F>.<337> sent request, body N 0
default	16:01:51.499135-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.556623-0500	RedLemon	0x7f863087fab8 ID=712 Task <4BD521CA-E02D-4697-93A4-DD76D60D665F>.<337> received response, status 200 content U
default	16:01:51.557226-0500	RedLemon	Task <4BD521CA-E02D-4697-93A4-DD76D60D665F>.<337> response ended
default	16:01:51.557693-0500	RedLemon	Task <4BD521CA-E02D-4697-93A4-DD76D60D665F>.<337> done using Connection 1
default	16:01:51.557929-0500	RedLemon	Task <4BD521CA-E02D-4697-93A4-DD76D60D665F>.<337> summary for task success {transaction_duration_ms=76, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=74, response_duration_ms=1, request_bytes=512, response_bytes=837, cache_hit=true}
default	16:01:51.558536-0500	RedLemon	Task <4BD521CA-E02D-4697-93A4-DD76D60D665F>.<337> finished successfully
default	16:01:51.560518-0500	RedLemon	Task <8489715A-E927-4329-9685-2619DA246954>.<338> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.560827-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [790E38B5-6C46-4992-8566-21AA8E958718] (reporting strategy default)> on Task <8489715A-E927-4329-9685-2619DA246954>.<338> was not selected for reporting
default	16:01:51.561630-0500	RedLemon	Task <8489715A-E927-4329-9685-2619DA246954>.<338> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.561840-0500	RedLemon	Task <8489715A-E927-4329-9685-2619DA246954>.<338> now using Connection 1
default	16:01:51.562644-0500	RedLemon	0x7f863087fab8 ID=716 Task <8489715A-E927-4329-9685-2619DA246954>.<338> sent request, body N 0
default	16:01:51.577927-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.622510-0500	RedLemon	0x7f863087fab8 ID=716 Task <8489715A-E927-4329-9685-2619DA246954>.<338> received response, status 200 content U
default	16:01:51.623115-0500	RedLemon	Task <8489715A-E927-4329-9685-2619DA246954>.<338> response ended
default	16:01:51.623567-0500	RedLemon	Task <8489715A-E927-4329-9685-2619DA246954>.<338> done using Connection 1
default	16:01:51.623795-0500	RedLemon	Task <8489715A-E927-4329-9685-2619DA246954>.<338> summary for task success {transaction_duration_ms=62, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:01:51.624420-0500	RedLemon	Task <8489715A-E927-4329-9685-2619DA246954>.<338> finished successfully
default	16:01:51.626610-0500	RedLemon	Task <271B9EDC-2BA6-41C1-B87B-CD3042992EF8>.<339> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.626931-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [07781842-AC9B-4832-A5BE-A4CF321E3806] (reporting strategy default)> on Task <271B9EDC-2BA6-41C1-B87B-CD3042992EF8>.<339> was not selected for reporting
default	16:01:51.627729-0500	RedLemon	Task <271B9EDC-2BA6-41C1-B87B-CD3042992EF8>.<339> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.627929-0500	RedLemon	Task <271B9EDC-2BA6-41C1-B87B-CD3042992EF8>.<339> now using Connection 1
default	16:01:51.628746-0500	RedLemon	0x7f8632e1e408 ID=720 Task <271B9EDC-2BA6-41C1-B87B-CD3042992EF8>.<339> sent request, body N 0
default	16:01:51.644393-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.698640-0500	RedLemon	0x7f8632e1e408 ID=720 Task <271B9EDC-2BA6-41C1-B87B-CD3042992EF8>.<339> received response, status 200 content U
default	16:01:51.699228-0500	RedLemon	Task <271B9EDC-2BA6-41C1-B87B-CD3042992EF8>.<339> response ended
default	16:01:51.699723-0500	RedLemon	Task <271B9EDC-2BA6-41C1-B87B-CD3042992EF8>.<339> done using Connection 1
default	16:01:51.699954-0500	RedLemon	Task <271B9EDC-2BA6-41C1-B87B-CD3042992EF8>.<339> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=71, response_duration_ms=1, request_bytes=512, response_bytes=836, cache_hit=true}
default	16:01:51.700711-0500	RedLemon	Task <271B9EDC-2BA6-41C1-B87B-CD3042992EF8>.<339> finished successfully
default	16:01:51.702537-0500	RedLemon	Task <86E6B687-5C9E-443E-BB6E-68CF74DF0A55>.<340> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.702836-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [166B0FE9-62D1-4354-B1D4-F7EBF2B8581F] (reporting strategy default)> on Task <86E6B687-5C9E-443E-BB6E-68CF74DF0A55>.<340> was not selected for reporting
default	16:01:51.703558-0500	RedLemon	Task <86E6B687-5C9E-443E-BB6E-68CF74DF0A55>.<340> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.703768-0500	RedLemon	Task <86E6B687-5C9E-443E-BB6E-68CF74DF0A55>.<340> now using Connection 1
default	16:01:51.704613-0500	RedLemon	0x7f863087fab8 ID=724 Task <86E6B687-5C9E-443E-BB6E-68CF74DF0A55>.<340> sent request, body N 0
default	16:01:51.719706-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.780155-0500	RedLemon	0x7f863087fab8 ID=724 Task <86E6B687-5C9E-443E-BB6E-68CF74DF0A55>.<340> received response, status 200 content U
default	16:01:51.780864-0500	RedLemon	Task <86E6B687-5C9E-443E-BB6E-68CF74DF0A55>.<340> response ended
default	16:01:51.781321-0500	RedLemon	Task <86E6B687-5C9E-443E-BB6E-68CF74DF0A55>.<340> done using Connection 1
default	16:01:51.781552-0500	RedLemon	Task <86E6B687-5C9E-443E-BB6E-68CF74DF0A55>.<340> summary for task success {transaction_duration_ms=78, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=76, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:01:51.782550-0500	RedLemon	Task <86E6B687-5C9E-443E-BB6E-68CF74DF0A55>.<340> finished successfully
default	16:01:51.784601-0500	RedLemon	Task <F895E31B-2116-4161-84D4-E7516DC27EF2>.<341> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.784924-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4B165D87-5F26-43E5-8AC4-5424CAFD7479] (reporting strategy default)> on Task <F895E31B-2116-4161-84D4-E7516DC27EF2>.<341> was not selected for reporting
default	16:01:51.785625-0500	RedLemon	Task <F895E31B-2116-4161-84D4-E7516DC27EF2>.<341> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.785831-0500	RedLemon	Task <F895E31B-2116-4161-84D4-E7516DC27EF2>.<341> now using Connection 1
default	16:01:51.786602-0500	RedLemon	0x7f8632e1e408 ID=728 Task <F895E31B-2116-4161-84D4-E7516DC27EF2>.<341> sent request, body N 0
default	16:01:51.802160-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.856811-0500	RedLemon	0x7f8632e1e408 ID=728 Task <F895E31B-2116-4161-84D4-E7516DC27EF2>.<341> received response, status 200 content U
default	16:01:51.857418-0500	RedLemon	Task <F895E31B-2116-4161-84D4-E7516DC27EF2>.<341> response ended
default	16:01:51.857995-0500	RedLemon	Task <F895E31B-2116-4161-84D4-E7516DC27EF2>.<341> done using Connection 1
default	16:01:51.858233-0500	RedLemon	Task <F895E31B-2116-4161-84D4-E7516DC27EF2>.<341> summary for task success {transaction_duration_ms=73, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=71, response_duration_ms=1, request_bytes=512, response_bytes=838, cache_hit=true}
default	16:01:51.858767-0500	RedLemon	Task <F895E31B-2116-4161-84D4-E7516DC27EF2>.<341> finished successfully
default	16:01:51.860368-0500	RedLemon	Task <0FB62A85-8948-4026-B8B7-450091DAAE0C>.<342> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.860665-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [35A0D0B4-47A2-4699-B456-4A24712433B2] (reporting strategy default)> on Task <0FB62A85-8948-4026-B8B7-450091DAAE0C>.<342> was not selected for reporting
default	16:01:51.861444-0500	RedLemon	Task <0FB62A85-8948-4026-B8B7-450091DAAE0C>.<342> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.861712-0500	RedLemon	Task <0FB62A85-8948-4026-B8B7-450091DAAE0C>.<342> now using Connection 1
default	16:01:51.862874-0500	RedLemon	0x7f8632e1e408 ID=732 Task <0FB62A85-8948-4026-B8B7-450091DAAE0C>.<342> sent request, body N 0
default	16:01:51.877299-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:51.928838-0500	RedLemon	0x7f8632e1e408 ID=732 Task <0FB62A85-8948-4026-B8B7-450091DAAE0C>.<342> received response, status 200 content U
default	16:01:51.929699-0500	RedLemon	Task <0FB62A85-8948-4026-B8B7-450091DAAE0C>.<342> response ended
default	16:01:51.930558-0500	RedLemon	Task <0FB62A85-8948-4026-B8B7-450091DAAE0C>.<342> done using Connection 1
default	16:01:51.931062-0500	RedLemon	Task <0FB62A85-8948-4026-B8B7-450091DAAE0C>.<342> summary for task success {transaction_duration_ms=70, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=67, response_duration_ms=2, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:01:51.931615-0500	RedLemon	Task <0FB62A85-8948-4026-B8B7-450091DAAE0C>.<342> finished successfully
default	16:01:51.933562-0500	RedLemon	Task <95BC9722-23B3-46E8-A99F-9DB6E69805D8>.<343> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:51.933877-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C813717F-66A9-4B97-8DC0-F7D1487796F6] (reporting strategy default)> on Task <95BC9722-23B3-46E8-A99F-9DB6E69805D8>.<343> was not selected for reporting
default	16:01:51.934643-0500	RedLemon	Task <95BC9722-23B3-46E8-A99F-9DB6E69805D8>.<343> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:51.934845-0500	RedLemon	Task <95BC9722-23B3-46E8-A99F-9DB6E69805D8>.<343> now using Connection 1
default	16:01:51.935627-0500	RedLemon	0x7f8632e1e408 ID=736 Task <95BC9722-23B3-46E8-A99F-9DB6E69805D8>.<343> sent request, body N 0
default	16:01:51.952812-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.005486-0500	RedLemon	0x7f8632e1e408 ID=736 Task <95BC9722-23B3-46E8-A99F-9DB6E69805D8>.<343> received response, status 200 content U
default	16:01:52.006086-0500	RedLemon	Task <95BC9722-23B3-46E8-A99F-9DB6E69805D8>.<343> response ended
default	16:01:52.006541-0500	RedLemon	Task <95BC9722-23B3-46E8-A99F-9DB6E69805D8>.<343> done using Connection 1
default	16:01:52.006772-0500	RedLemon	Task <95BC9722-23B3-46E8-A99F-9DB6E69805D8>.<343> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=71, response_duration_ms=1, request_bytes=512, response_bytes=835, cache_hit=true}
default	16:01:52.007353-0500	RedLemon	Task <95BC9722-23B3-46E8-A99F-9DB6E69805D8>.<343> finished successfully
default	16:01:52.009176-0500	RedLemon	Task <DBA64736-79AE-4BF4-B20F-EFA32614846C>.<344> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.009485-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9DEF9AF1-81B1-46EB-9BA2-CC39CCF45013] (reporting strategy default)> on Task <DBA64736-79AE-4BF4-B20F-EFA32614846C>.<344> was not selected for reporting
default	16:01:52.010252-0500	RedLemon	Task <DBA64736-79AE-4BF4-B20F-EFA32614846C>.<344> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.010459-0500	RedLemon	Task <DBA64736-79AE-4BF4-B20F-EFA32614846C>.<344> now using Connection 1
default	16:01:52.011259-0500	RedLemon	0x7f8632e1e408 ID=740 Task <DBA64736-79AE-4BF4-B20F-EFA32614846C>.<344> sent request, body N 0
default	16:01:52.149661-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.194541-0500	RedLemon	0x7f8632e1e408 ID=740 Task <DBA64736-79AE-4BF4-B20F-EFA32614846C>.<344> received response, status 200 content U
default	16:01:52.195430-0500	RedLemon	Task <DBA64736-79AE-4BF4-B20F-EFA32614846C>.<344> response ended
default	16:01:52.196216-0500	RedLemon	Task <DBA64736-79AE-4BF4-B20F-EFA32614846C>.<344> done using Connection 1
default	16:01:52.196587-0500	RedLemon	Task <DBA64736-79AE-4BF4-B20F-EFA32614846C>.<344> summary for task success {transaction_duration_ms=186, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=184, response_duration_ms=2, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:01:52.196934-0500	RedLemon	Task <DBA64736-79AE-4BF4-B20F-EFA32614846C>.<344> finished successfully
default	16:01:52.199059-0500	RedLemon	Task <AE59B0C8-825C-4BF4-8AAD-A4EF7B2E906E>.<345> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.199395-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B6B62FCB-F8A8-4F63-B32E-1B1707290473] (reporting strategy default)> on Task <AE59B0C8-825C-4BF4-8AAD-A4EF7B2E906E>.<345> was not selected for reporting
default	16:01:52.200180-0500	RedLemon	Task <AE59B0C8-825C-4BF4-8AAD-A4EF7B2E906E>.<345> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.200391-0500	RedLemon	Task <AE59B0C8-825C-4BF4-8AAD-A4EF7B2E906E>.<345> now using Connection 1
default	16:01:52.201181-0500	RedLemon	0x7f8632e1e408 ID=744 Task <AE59B0C8-825C-4BF4-8AAD-A4EF7B2E906E>.<345> sent request, body N 0
default	16:01:52.218664-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.287868-0500	RedLemon	0x7f8632e1e408 ID=744 Task <AE59B0C8-825C-4BF4-8AAD-A4EF7B2E906E>.<345> received response, status 200 content U
default	16:01:52.288649-0500	RedLemon	Task <AE59B0C8-825C-4BF4-8AAD-A4EF7B2E906E>.<345> response ended
default	16:01:52.289149-0500	RedLemon	Task <AE59B0C8-825C-4BF4-8AAD-A4EF7B2E906E>.<345> done using Connection 1
default	16:01:52.289407-0500	RedLemon	Task <AE59B0C8-825C-4BF4-8AAD-A4EF7B2E906E>.<345> summary for task success {transaction_duration_ms=89, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=87, response_duration_ms=1, request_bytes=512, response_bytes=837, cache_hit=true}
default	16:01:52.289975-0500	RedLemon	Task <AE59B0C8-825C-4BF4-8AAD-A4EF7B2E906E>.<345> finished successfully
default	16:01:52.291879-0500	RedLemon	Task <0F0197EB-E0A1-436D-8D5C-AFE0364E99EE>.<346> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.292196-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [46BE891F-3D81-4DEF-8826-813245102076] (reporting strategy default)> on Task <0F0197EB-E0A1-436D-8D5C-AFE0364E99EE>.<346> was not selected for reporting
default	16:01:52.292954-0500	RedLemon	Task <0F0197EB-E0A1-436D-8D5C-AFE0364E99EE>.<346> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.293160-0500	RedLemon	Task <0F0197EB-E0A1-436D-8D5C-AFE0364E99EE>.<346> now using Connection 1
default	16:01:52.293972-0500	RedLemon	0x7f8632e1e408 ID=748 Task <0F0197EB-E0A1-436D-8D5C-AFE0364E99EE>.<346> sent request, body N 0
default	16:01:52.302654-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.369416-0500	RedLemon	0x7f8632e1e408 ID=748 Task <0F0197EB-E0A1-436D-8D5C-AFE0364E99EE>.<346> received response, status 200 content U
default	16:01:52.370196-0500	RedLemon	Task <0F0197EB-E0A1-436D-8D5C-AFE0364E99EE>.<346> response ended
default	16:01:52.370649-0500	RedLemon	Task <0F0197EB-E0A1-436D-8D5C-AFE0364E99EE>.<346> done using Connection 1
default	16:01:52.370903-0500	RedLemon	Task <0F0197EB-E0A1-436D-8D5C-AFE0364E99EE>.<346> summary for task success {transaction_duration_ms=78, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=76, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:01:52.371525-0500	RedLemon	Task <0F0197EB-E0A1-436D-8D5C-AFE0364E99EE>.<346> finished successfully
default	16:01:52.372874-0500	runningboardd	Invalidating assertion 169-5311-1017 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:01:52.373775-0500	RedLemon	Task <6A07ACAF-4B44-446B-9FF4-88D6A30DA0EC>.<347> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.374073-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0607FF95-D17E-4CCC-8D1C-0CED28D92A28] (reporting strategy default)> on Task <6A07ACAF-4B44-446B-9FF4-88D6A30DA0EC>.<347> was not selected for reporting
default	16:01:52.374921-0500	RedLemon	Task <6A07ACAF-4B44-446B-9FF4-88D6A30DA0EC>.<347> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.375132-0500	RedLemon	Task <6A07ACAF-4B44-446B-9FF4-88D6A30DA0EC>.<347> now using Connection 1
default	16:01:52.375925-0500	RedLemon	0x7f8632e1e408 ID=752 Task <6A07ACAF-4B44-446B-9FF4-88D6A30DA0EC>.<347> sent request, body N 0
default	16:01:52.382370-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.441612-0500	RedLemon	0x7f8632e1e408 ID=752 Task <6A07ACAF-4B44-446B-9FF4-88D6A30DA0EC>.<347> received response, status 200 content U
default	16:01:52.442219-0500	RedLemon	Task <6A07ACAF-4B44-446B-9FF4-88D6A30DA0EC>.<347> response ended
default	16:01:52.442679-0500	RedLemon	Task <6A07ACAF-4B44-446B-9FF4-88D6A30DA0EC>.<347> done using Connection 1
default	16:01:52.442907-0500	RedLemon	Task <6A07ACAF-4B44-446B-9FF4-88D6A30DA0EC>.<347> summary for task success {transaction_duration_ms=68, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=66, response_duration_ms=1, request_bytes=511, response_bytes=832, cache_hit=true}
default	16:01:52.444087-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1018 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:52.443634-0500	RedLemon	Task <6A07ACAF-4B44-446B-9FF4-88D6A30DA0EC>.<347> finished successfully
default	16:01:52.445198-0500	runningboardd	Assertion 169-5311-1018 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:01:52.445969-0500	RedLemon	Task <04546C24-584B-4FFB-9509-448BAEA04E20>.<348> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.446408-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [69D3608D-54DF-4C7F-8064-313D6B3DA2C7] (reporting strategy default)> on Task <04546C24-584B-4FFB-9509-448BAEA04E20>.<348> was not selected for reporting
default	16:01:52.447221-0500	RedLemon	Task <04546C24-584B-4FFB-9509-448BAEA04E20>.<348> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.447520-0500	RedLemon	Task <04546C24-584B-4FFB-9509-448BAEA04E20>.<348> now using Connection 1
default	16:01:52.447613-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:52.447760-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:52.448148-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:52.449028-0500	runningboardd	Attempting to rename power assertion 33541 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1017:com.apple.CFNetwork.StorageDB;169-5311-1018:com.apple.CFNetwork.StorageDB
default	16:01:52.448596-0500	RedLemon	0x7f862e251c58 ID=756 Task <04546C24-584B-4FFB-9509-448BAEA04E20>.<348> sent request, body N 0
default	16:01:52.452850-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.514044-0500	RedLemon	0x7f862e251c58 ID=756 Task <04546C24-584B-4FFB-9509-448BAEA04E20>.<348> received response, status 200 content U
default	16:01:52.514642-0500	RedLemon	Task <04546C24-584B-4FFB-9509-448BAEA04E20>.<348> response ended
default	16:01:52.515091-0500	RedLemon	Task <04546C24-584B-4FFB-9509-448BAEA04E20>.<348> done using Connection 1
default	16:01:52.515324-0500	RedLemon	Task <04546C24-584B-4FFB-9509-448BAEA04E20>.<348> summary for task success {transaction_duration_ms=68, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=67, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:01:52.515923-0500	RedLemon	Task <04546C24-584B-4FFB-9509-448BAEA04E20>.<348> finished successfully
default	16:01:52.518158-0500	RedLemon	Task <AA8B3FC7-B690-4777-9B86-28A20F88F648>.<349> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.518476-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4CCEFA50-7959-4851-89A0-238FB73E4AEF] (reporting strategy default)> on Task <AA8B3FC7-B690-4777-9B86-28A20F88F648>.<349> was not selected for reporting
default	16:01:52.519155-0500	RedLemon	Task <AA8B3FC7-B690-4777-9B86-28A20F88F648>.<349> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.519360-0500	RedLemon	Task <AA8B3FC7-B690-4777-9B86-28A20F88F648>.<349> now using Connection 1
default	16:01:52.520200-0500	RedLemon	0x7f863087fab8 ID=760 Task <AA8B3FC7-B690-4777-9B86-28A20F88F648>.<349> sent request, body N 0
default	16:01:52.533899-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.547355-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:52.547493-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:52.547636-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:52.547740-0500	runningboardd	Attempting to rename power assertion 33541 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1018:com.apple.CFNetwork.StorageDB
default	16:01:52.603034-0500	RedLemon	0x7f863087fab8 ID=760 Task <AA8B3FC7-B690-4777-9B86-28A20F88F648>.<349> received response, status 200 content U
default	16:01:52.603632-0500	RedLemon	Task <AA8B3FC7-B690-4777-9B86-28A20F88F648>.<349> response ended
default	16:01:52.604080-0500	RedLemon	Task <AA8B3FC7-B690-4777-9B86-28A20F88F648>.<349> done using Connection 1
default	16:01:52.604310-0500	RedLemon	Task <AA8B3FC7-B690-4777-9B86-28A20F88F648>.<349> summary for task success {transaction_duration_ms=85, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=83, response_duration_ms=1, request_bytes=511, response_bytes=835, cache_hit=false}
default	16:01:52.604943-0500	RedLemon	Task <AA8B3FC7-B690-4777-9B86-28A20F88F648>.<349> finished successfully
default	16:01:52.606832-0500	RedLemon	Task <99B654D2-DF1D-4024-8369-C0406F7D3DBD>.<350> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.607144-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A30EF865-052E-4F63-89C2-22ED9F8BB48C] (reporting strategy default)> on Task <99B654D2-DF1D-4024-8369-C0406F7D3DBD>.<350> was not selected for reporting
default	16:01:52.607947-0500	RedLemon	Task <99B654D2-DF1D-4024-8369-C0406F7D3DBD>.<350> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.608159-0500	RedLemon	Task <99B654D2-DF1D-4024-8369-C0406F7D3DBD>.<350> now using Connection 1
default	16:01:52.609018-0500	RedLemon	0x7f863087fab8 ID=764 Task <99B654D2-DF1D-4024-8369-C0406F7D3DBD>.<350> sent request, body N 0
default	16:01:52.619740-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.675256-0500	RedLemon	0x7f863087fab8 ID=764 Task <99B654D2-DF1D-4024-8369-C0406F7D3DBD>.<350> received response, status 200 content U
default	16:01:52.675879-0500	RedLemon	Task <99B654D2-DF1D-4024-8369-C0406F7D3DBD>.<350> response ended
default	16:01:52.676390-0500	RedLemon	Task <99B654D2-DF1D-4024-8369-C0406F7D3DBD>.<350> done using Connection 1
default	16:01:52.676635-0500	RedLemon	Task <99B654D2-DF1D-4024-8369-C0406F7D3DBD>.<350> summary for task success {transaction_duration_ms=69, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=67, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:01:52.677614-0500	RedLemon	Task <99B654D2-DF1D-4024-8369-C0406F7D3DBD>.<350> finished successfully
default	16:01:52.679888-0500	RedLemon	Task <E33F37B2-9134-45E0-B697-52DF73D0743A>.<351> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.680236-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FB0D5CF9-24D7-4C63-9A92-B010E3EE0890] (reporting strategy default)> on Task <E33F37B2-9134-45E0-B697-52DF73D0743A>.<351> was not selected for reporting
default	16:01:52.681011-0500	RedLemon	Task <E33F37B2-9134-45E0-B697-52DF73D0743A>.<351> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.681310-0500	RedLemon	Task <E33F37B2-9134-45E0-B697-52DF73D0743A>.<351> now using Connection 1
default	16:01:52.682255-0500	RedLemon	0x7f862e251c58 ID=768 Task <E33F37B2-9134-45E0-B697-52DF73D0743A>.<351> sent request, body N 0
default	16:01:52.695875-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.754282-0500	RedLemon	0x7f862e251c58 ID=768 Task <E33F37B2-9134-45E0-B697-52DF73D0743A>.<351> received response, status 200 content U
default	16:01:52.754909-0500	RedLemon	Task <E33F37B2-9134-45E0-B697-52DF73D0743A>.<351> response ended
default	16:01:52.755389-0500	RedLemon	Task <E33F37B2-9134-45E0-B697-52DF73D0743A>.<351> done using Connection 1
default	16:01:52.755630-0500	RedLemon	Task <E33F37B2-9134-45E0-B697-52DF73D0743A>.<351> summary for task success {transaction_duration_ms=75, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=73, response_duration_ms=1, request_bytes=512, response_bytes=837, cache_hit=true}
default	16:01:52.756375-0500	RedLemon	Task <E33F37B2-9134-45E0-B697-52DF73D0743A>.<351> finished successfully
default	16:01:52.757987-0500	RedLemon	Task <798B395C-88BE-4F24-95A2-21A7BF0655CB>.<352> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.758287-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8B3ADC85-FF6D-4003-9428-0462F55880A5] (reporting strategy default)> on Task <798B395C-88BE-4F24-95A2-21A7BF0655CB>.<352> was not selected for reporting
default	16:01:52.759083-0500	RedLemon	Task <798B395C-88BE-4F24-95A2-21A7BF0655CB>.<352> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.759296-0500	RedLemon	Task <798B395C-88BE-4F24-95A2-21A7BF0655CB>.<352> now using Connection 1
default	16:01:52.760138-0500	RedLemon	0x7f8632e61b78 ID=772 Task <798B395C-88BE-4F24-95A2-21A7BF0655CB>.<352> sent request, body N 0
default	16:01:52.776164-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.829065-0500	RedLemon	0x7f8632e61b78 ID=772 Task <798B395C-88BE-4F24-95A2-21A7BF0655CB>.<352> received response, status 200 content U
default	16:01:52.830056-0500	RedLemon	Task <798B395C-88BE-4F24-95A2-21A7BF0655CB>.<352> response ended
default	16:01:52.830714-0500	RedLemon	Task <798B395C-88BE-4F24-95A2-21A7BF0655CB>.<352> done using Connection 1
default	16:01:52.831191-0500	RedLemon	Task <798B395C-88BE-4F24-95A2-21A7BF0655CB>.<352> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=70, response_duration_ms=2, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:01:52.831821-0500	RedLemon	Task <798B395C-88BE-4F24-95A2-21A7BF0655CB>.<352> finished successfully
default	16:01:52.833760-0500	RedLemon	Task <DCC84C66-B248-46AD-A988-CDBB693E9B8D>.<353> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.834085-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [011AFF09-AB5D-4177-BE1A-EA531662DDEC] (reporting strategy default)> on Task <DCC84C66-B248-46AD-A988-CDBB693E9B8D>.<353> was not selected for reporting
default	16:01:52.834868-0500	RedLemon	Task <DCC84C66-B248-46AD-A988-CDBB693E9B8D>.<353> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.835072-0500	RedLemon	Task <DCC84C66-B248-46AD-A988-CDBB693E9B8D>.<353> now using Connection 1
default	16:01:52.835884-0500	RedLemon	0x7f863087fab8 ID=776 Task <DCC84C66-B248-46AD-A988-CDBB693E9B8D>.<353> sent request, body N 0
default	16:01:52.851520-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.865521-0500	runningboardd	Assertion did invalidate due to timeout: 169-129-1007 (target:[anon<RedLemon>(501):5311])
default	16:01:52.899241-0500	RedLemon	0x7f863087fab8 ID=776 Task <DCC84C66-B248-46AD-A988-CDBB693E9B8D>.<353> received response, status 200 content U
default	16:01:52.900063-0500	RedLemon	Task <DCC84C66-B248-46AD-A988-CDBB693E9B8D>.<353> response ended
default	16:01:52.900639-0500	RedLemon	Task <DCC84C66-B248-46AD-A988-CDBB693E9B8D>.<353> done using Connection 1
default	16:01:52.900880-0500	RedLemon	Task <DCC84C66-B248-46AD-A988-CDBB693E9B8D>.<353> summary for task success {transaction_duration_ms=66, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=1, request_bytes=511, response_bytes=834, cache_hit=true}
default	16:01:52.901479-0500	RedLemon	Task <DCC84C66-B248-46AD-A988-CDBB693E9B8D>.<353> finished successfully
default	16:01:52.903048-0500	RedLemon	Task <271C81B9-4DC6-412D-AC8D-D8114D915B40>.<354> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.903346-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8EF83623-D6ED-4248-9C7E-551F26FD93E6] (reporting strategy default)> on Task <271C81B9-4DC6-412D-AC8D-D8114D915B40>.<354> was not selected for reporting
default	16:01:52.904165-0500	RedLemon	Task <271C81B9-4DC6-412D-AC8D-D8114D915B40>.<354> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.904366-0500	RedLemon	Task <271C81B9-4DC6-412D-AC8D-D8114D915B40>.<354> now using Connection 1
default	16:01:52.905133-0500	RedLemon	0x7f863087fab8 ID=780 Task <271C81B9-4DC6-412D-AC8D-D8114D915B40>.<354> sent request, body N 0
default	16:01:52.917629-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:52.917674-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:52.917716-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:52.920248-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:52.966757-0500	RedLemon	0x7f863087fab8 ID=780 Task <271C81B9-4DC6-412D-AC8D-D8114D915B40>.<354> received response, status 200 content U
default	16:01:52.967480-0500	RedLemon	Task <271C81B9-4DC6-412D-AC8D-D8114D915B40>.<354> response ended
default	16:01:52.967926-0500	RedLemon	Task <271C81B9-4DC6-412D-AC8D-D8114D915B40>.<354> done using Connection 1
default	16:01:52.968347-0500	RedLemon	Task <271C81B9-4DC6-412D-AC8D-D8114D915B40>.<354> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=840, cache_hit=true}
default	16:01:52.968878-0500	RedLemon	Task <271C81B9-4DC6-412D-AC8D-D8114D915B40>.<354> finished successfully
default	16:01:52.970971-0500	RedLemon	Task <D257585F-5EAC-4D64-83C1-A0A12A145C19>.<355> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:52.971293-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AE26621E-7AA5-42CC-BB38-2F67755DD5ED] (reporting strategy default)> on Task <D257585F-5EAC-4D64-83C1-A0A12A145C19>.<355> was not selected for reporting
default	16:01:52.971952-0500	RedLemon	Task <D257585F-5EAC-4D64-83C1-A0A12A145C19>.<355> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:52.972204-0500	RedLemon	Task <D257585F-5EAC-4D64-83C1-A0A12A145C19>.<355> now using Connection 1
default	16:01:52.972989-0500	RedLemon	0x7f863087fab8 ID=784 Task <D257585F-5EAC-4D64-83C1-A0A12A145C19>.<355> sent request, body N 0
default	16:01:52.988174-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:53.042278-0500	RedLemon	0x7f863087fab8 ID=784 Task <D257585F-5EAC-4D64-83C1-A0A12A145C19>.<355> received response, status 200 content U
default	16:01:53.042886-0500	RedLemon	Task <D257585F-5EAC-4D64-83C1-A0A12A145C19>.<355> response ended
default	16:01:53.043343-0500	RedLemon	Task <D257585F-5EAC-4D64-83C1-A0A12A145C19>.<355> done using Connection 1
default	16:01:53.043572-0500	RedLemon	Task <D257585F-5EAC-4D64-83C1-A0A12A145C19>.<355> summary for task success {transaction_duration_ms=71, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=70, response_duration_ms=1, request_bytes=511, response_bytes=835, cache_hit=false}
default	16:01:53.044282-0500	RedLemon	Task <D257585F-5EAC-4D64-83C1-A0A12A145C19>.<355> finished successfully
default	16:01:53.046511-0500	RedLemon	Task <B933C955-DB06-486A-B2CA-69F5B7F782CC>.<356> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:53.046808-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6C229A4C-35D3-4AA1-A794-B8DA9039284D] (reporting strategy default)> on Task <B933C955-DB06-486A-B2CA-69F5B7F782CC>.<356> was not selected for reporting
default	16:01:53.047594-0500	RedLemon	Task <B933C955-DB06-486A-B2CA-69F5B7F782CC>.<356> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:53.047812-0500	RedLemon	Task <B933C955-DB06-486A-B2CA-69F5B7F782CC>.<356> now using Connection 1
default	16:01:53.048683-0500	RedLemon	0x7f8632e08768 ID=788 Task <B933C955-DB06-486A-B2CA-69F5B7F782CC>.<356> sent request, body N 0
default	16:01:53.064193-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:53.109432-0500	RedLemon	0x7f8632e08768 ID=788 Task <B933C955-DB06-486A-B2CA-69F5B7F782CC>.<356> received response, status 200 content U
default	16:01:53.110207-0500	RedLemon	Task <B933C955-DB06-486A-B2CA-69F5B7F782CC>.<356> response ended
default	16:01:53.110663-0500	RedLemon	Task <B933C955-DB06-486A-B2CA-69F5B7F782CC>.<356> done using Connection 1
default	16:01:53.110922-0500	RedLemon	Task <B933C955-DB06-486A-B2CA-69F5B7F782CC>.<356> summary for task success {transaction_duration_ms=63, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:01:53.111535-0500	RedLemon	Task <B933C955-DB06-486A-B2CA-69F5B7F782CC>.<356> finished successfully
default	16:01:53.113621-0500	RedLemon	Task <1AD1B088-F360-4A4D-9CB4-0CF5BE7DADD2>.<357> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:53.113912-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [01AF402F-6F01-4924-8082-664926C7D660] (reporting strategy default)> on Task <1AD1B088-F360-4A4D-9CB4-0CF5BE7DADD2>.<357> was not selected for reporting
default	16:01:53.114732-0500	RedLemon	Task <1AD1B088-F360-4A4D-9CB4-0CF5BE7DADD2>.<357> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:53.114933-0500	RedLemon	Task <1AD1B088-F360-4A4D-9CB4-0CF5BE7DADD2>.<357> now using Connection 1
default	16:01:53.115736-0500	RedLemon	0x7f863087fab8 ID=792 Task <1AD1B088-F360-4A4D-9CB4-0CF5BE7DADD2>.<357> sent request, body N 0
default	16:01:53.129946-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:53.177812-0500	RedLemon	0x7f863087fab8 ID=792 Task <1AD1B088-F360-4A4D-9CB4-0CF5BE7DADD2>.<357> received response, status 200 content U
default	16:01:53.178416-0500	RedLemon	Task <1AD1B088-F360-4A4D-9CB4-0CF5BE7DADD2>.<357> response ended
default	16:01:53.178869-0500	RedLemon	Task <1AD1B088-F360-4A4D-9CB4-0CF5BE7DADD2>.<357> done using Connection 1
default	16:01:53.179100-0500	RedLemon	Task <1AD1B088-F360-4A4D-9CB4-0CF5BE7DADD2>.<357> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=518, response_bytes=848, cache_hit=true}
default	16:01:53.179699-0500	RedLemon	Task <1AD1B088-F360-4A4D-9CB4-0CF5BE7DADD2>.<357> finished successfully
default	16:01:53.181749-0500	RedLemon	Task <E3630771-C3DA-4ED3-B5DE-D341780ADF2A>.<358> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:53.182065-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CAF18403-2354-4092-A692-333FD74FE4CF] (reporting strategy default)> on Task <E3630771-C3DA-4ED3-B5DE-D341780ADF2A>.<358> was not selected for reporting
default	16:01:53.182852-0500	RedLemon	Task <E3630771-C3DA-4ED3-B5DE-D341780ADF2A>.<358> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:53.183052-0500	RedLemon	Task <E3630771-C3DA-4ED3-B5DE-D341780ADF2A>.<358> now using Connection 1
default	16:01:53.183868-0500	RedLemon	0x7f8632e08768 ID=796 Task <E3630771-C3DA-4ED3-B5DE-D341780ADF2A>.<358> sent request, body N 0
default	16:01:53.198949-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:53.269915-0500	RedLemon	0x7f8632e08768 ID=796 Task <E3630771-C3DA-4ED3-B5DE-D341780ADF2A>.<358> received response, status 200 content U
default	16:01:53.270515-0500	RedLemon	Task <E3630771-C3DA-4ED3-B5DE-D341780ADF2A>.<358> response ended
default	16:01:53.270977-0500	RedLemon	Task <E3630771-C3DA-4ED3-B5DE-D341780ADF2A>.<358> done using Connection 1
default	16:01:53.271208-0500	RedLemon	Task <E3630771-C3DA-4ED3-B5DE-D341780ADF2A>.<358> summary for task success {transaction_duration_ms=88, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=87, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:01:53.271702-0500	RedLemon	Task <E3630771-C3DA-4ED3-B5DE-D341780ADF2A>.<358> finished successfully
default	16:01:53.273988-0500	RedLemon	Task <1C145139-0C8E-4A0D-8458-C65CEF1BADF3>.<359> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:53.274305-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8732FA5F-958D-400F-9118-79499EA329BB] (reporting strategy default)> on Task <1C145139-0C8E-4A0D-8458-C65CEF1BADF3>.<359> was not selected for reporting
default	16:01:53.275054-0500	RedLemon	Task <1C145139-0C8E-4A0D-8458-C65CEF1BADF3>.<359> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:53.275259-0500	RedLemon	Task <1C145139-0C8E-4A0D-8458-C65CEF1BADF3>.<359> now using Connection 1
default	16:01:53.276027-0500	RedLemon	0x7f8632e08768 ID=800 Task <1C145139-0C8E-4A0D-8458-C65CEF1BADF3>.<359> sent request, body N 0
default	16:01:53.292094-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:53.344032-0500	RedLemon	0x7f8632e08768 ID=800 Task <1C145139-0C8E-4A0D-8458-C65CEF1BADF3>.<359> received response, status 200 content U
default	16:01:53.344396-0500	RedLemon	Task <1C145139-0C8E-4A0D-8458-C65CEF1BADF3>.<359> response ended
default	16:01:53.344789-0500	RedLemon	Task <1C145139-0C8E-4A0D-8458-C65CEF1BADF3>.<359> done using Connection 1
default	16:01:53.344963-0500	RedLemon	Task <1C145139-0C8E-4A0D-8458-C65CEF1BADF3>.<359> summary for task success {transaction_duration_ms=70, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=0, request_bytes=521, response_bytes=848, cache_hit=true}
default	16:01:53.345185-0500	RedLemon	Task <1C145139-0C8E-4A0D-8458-C65CEF1BADF3>.<359> finished successfully
default	16:01:53.346769-0500	RedLemon	Task <3593B1D2-6898-40AF-B1E8-80BA20CCE07D>.<360> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:53.347192-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [382C750A-BEDD-4F5F-8EE0-C62B182613B6] (reporting strategy default)> on Task <3593B1D2-6898-40AF-B1E8-80BA20CCE07D>.<360> was not selected for reporting
default	16:01:53.347906-0500	RedLemon	Task <3593B1D2-6898-40AF-B1E8-80BA20CCE07D>.<360> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:53.348198-0500	RedLemon	Task <3593B1D2-6898-40AF-B1E8-80BA20CCE07D>.<360> now using Connection 1
default	16:01:53.349199-0500	RedLemon	0x7f8633a3da78 ID=804 Task <3593B1D2-6898-40AF-B1E8-80BA20CCE07D>.<360> sent request, body N 0
default	16:01:53.499907-0500	runningboardd	Invalidating assertion 169-5311-1018 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:01:53.512178-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:53.571518-0500	RedLemon	0x7f8633a3da78 ID=804 Task <3593B1D2-6898-40AF-B1E8-80BA20CCE07D>.<360> received response, status 200 content U
default	16:01:53.572737-0500	RedLemon	Task <3593B1D2-6898-40AF-B1E8-80BA20CCE07D>.<360> response ended
default	16:01:53.573195-0500	RedLemon	Task <3593B1D2-6898-40AF-B1E8-80BA20CCE07D>.<360> done using Connection 1
default	16:01:53.573542-0500	RedLemon	Task <3593B1D2-6898-40AF-B1E8-80BA20CCE07D>.<360> summary for task success {transaction_duration_ms=226, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=223, response_duration_ms=2, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:01:53.574389-0500	RedLemon	Task <3593B1D2-6898-40AF-B1E8-80BA20CCE07D>.<360> finished successfully
default	16:01:53.575656-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1019 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:53.575829-0500	runningboardd	Assertion 169-5311-1019 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:01:53.576993-0500	runningboardd	Attempting to rename power assertion 33541 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1018:com.apple.CFNetwork.StorageDB;169-5311-1019:com.apple.CFNetwork.StorageDB
default	16:01:53.577009-0500	RedLemon	Task <7CF669E0-218C-488A-A092-CEAA63642D41>.<361> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:53.577455-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0094C84B-1C91-4113-BFAC-AF50DAD29DB5] (reporting strategy default)> on Task <7CF669E0-218C-488A-A092-CEAA63642D41>.<361> was not selected for reporting
default	16:01:53.578265-0500	RedLemon	Task <7CF669E0-218C-488A-A092-CEAA63642D41>.<361> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:53.578552-0500	RedLemon	Task <7CF669E0-218C-488A-A092-CEAA63642D41>.<361> now using Connection 1
default	16:01:53.578557-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:53.578739-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:53.578852-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:53.579565-0500	RedLemon	0x7f862e251c58 ID=808 Task <7CF669E0-218C-488A-A092-CEAA63642D41>.<361> sent request, body N 0
default	16:01:53.584922-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:53.650137-0500	RedLemon	0x7f862e251c58 ID=808 Task <7CF669E0-218C-488A-A092-CEAA63642D41>.<361> received response, status 200 content U
default	16:01:53.650954-0500	RedLemon	Task <7CF669E0-218C-488A-A092-CEAA63642D41>.<361> response ended
default	16:01:53.651427-0500	RedLemon	Task <7CF669E0-218C-488A-A092-CEAA63642D41>.<361> done using Connection 1
default	16:01:53.651662-0500	RedLemon	Task <7CF669E0-218C-488A-A092-CEAA63642D41>.<361> summary for task success {transaction_duration_ms=73, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=71, response_duration_ms=1, request_bytes=521, response_bytes=848, cache_hit=true}
default	16:01:53.652266-0500	RedLemon	Task <7CF669E0-218C-488A-A092-CEAA63642D41>.<361> finished successfully
default	16:01:53.654181-0500	RedLemon	Task <514A08A5-61B5-479A-8156-027464C46F5A>.<362> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher <private>
default	16:01:53.654520-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6E71A258-4380-4A35-B87A-CEC29E1ADE28] (reporting strategy default)> on Task <514A08A5-61B5-479A-8156-027464C46F5A>.<362> was not selected for reporting
default	16:01:53.655249-0500	RedLemon	Task <514A08A5-61B5-479A-8156-027464C46F5A>.<362> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:53.655453-0500	RedLemon	Task <514A08A5-61B5-479A-8156-027464C46F5A>.<362> now using Connection 1
default	16:01:53.656230-0500	RedLemon	0x7f863087fab8 ID=812 Task <514A08A5-61B5-479A-8156-027464C46F5A>.<362> sent request, body N 0
default	16:01:53.665033-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:53.670423-0500	runningboardd	Attempting to rename power assertion 33541 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1019:com.apple.CFNetwork.StorageDB
default	16:01:53.670862-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:53.671228-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:53.671331-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:53.719399-0500	RedLemon	0x7f863087fab8 ID=812 Task <514A08A5-61B5-479A-8156-027464C46F5A>.<362> received response, status 200 content U
default	16:01:53.720201-0500	RedLemon	Task <514A08A5-61B5-479A-8156-027464C46F5A>.<362> response ended
default	16:01:53.720912-0500	RedLemon	Task <514A08A5-61B5-479A-8156-027464C46F5A>.<362> done using Connection 1
default	16:01:53.721211-0500	RedLemon	Task <514A08A5-61B5-479A-8156-027464C46F5A>.<362> summary for task success {transaction_duration_ms=66, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=2, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:01:53.721606-0500	RedLemon	Task <514A08A5-61B5-479A-8156-027464C46F5A>.<362> finished successfully
default	16:01:53.731832-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:53.762137-0500	RedLemon	Task <F7A0EAB7-9F5A-4D05-BF58-20BC3D88F458>.<363> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:01:53.762423-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6D0146B3-F49F-4330-8AA6-94F6A667DA6D] (reporting strategy default)> on Task <F7A0EAB7-9F5A-4D05-BF58-20BC3D88F458>.<363> was not selected for reporting
default	16:01:53.763031-0500	RedLemon	Task <F7A0EAB7-9F5A-4D05-BF58-20BC3D88F458>.<363> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:53.763225-0500	RedLemon	Task <F7A0EAB7-9F5A-4D05-BF58-20BC3D88F458>.<363> now using Connection 27
default	16:01:53.763498-0500	RedLemon	Task <F7A0EAB7-9F5A-4D05-BF58-20BC3D88F458>.<363> sent request, body N 0
default	16:01:53.777903-0500	RedLemon	Task <F7A0EAB7-9F5A-4D05-BF58-20BC3D88F458>.<363> received response, status 200 content K
default	16:01:53.783402-0500	RedLemon	Task <F7A0EAB7-9F5A-4D05-BF58-20BC3D88F458>.<363> done using Connection 27
default	16:01:53.783577-0500	RedLemon	Task <F7A0EAB7-9F5A-4D05-BF58-20BC3D88F458>.<363> response ended
default	16:01:53.784239-0500	RedLemon	Task <F7A0EAB7-9F5A-4D05-BF58-20BC3D88F458>.<363> summary for task success {transaction_duration_ms=21, response_status=200, connection=27, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=15, response_duration_ms=6, request_bytes=42, response_bytes=117420, cache_hit=false}
default	16:01:53.784333-0500	RedLemon	Task <F7A0EAB7-9F5A-4D05-BF58-20BC3D88F458>.<363> finished successfully
default	16:01:54.599441-0500	runningboardd	Invalidating assertion 169-5311-1019 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:01:54.683975-0500	RedLemon	Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> summary for task success {transaction_duration_ms=6069, response_status=101, connection=28, protocol="http/1.1", domain_lookup_duration_ms=32, connect_duration_ms=81, secure_connection_duration_ms=29, private_relay=false, request_start_ms=120, request_duration_ms=0, response_start_ms=457, response_duration_ms=0, request_bytes=828, response_bytes=850, cache_hit=false}
default	16:01:54.684094-0500	RedLemon	Task <FBE04E78-1CD2-4E67-B4DD-52F79583645E>.<1> finished successfully
default	16:01:54.684120-0500	RedLemon	Task <8082C0AC-F2F6-4DAA-B836-B1280273FFA0>.<364> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:54.684570-0500	RedLemon	Task <EE4A601B-3320-4CCD-8FFB-F1962A04A794>.<2> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:54.684634-0500	RedLemon	Connection 28: cleaning up
default	16:01:54.685911-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5F6875E1-DF51-477A-9A60-C190854F6FAD] (reporting strategy default)> on Task <8082C0AC-F2F6-4DAA-B836-B1280273FFA0>.<364> was not selected for reporting
default	16:01:54.685957-0500	RedLemon	[C28 CD116DD6-E75D-4D84-BB8C-38D7CE728AF1 Hostname#23ce8654:443 tcp, url hash: 02510389, tls, definite, attribution: developer] cancel
default	16:01:54.686203-0500	RedLemon	[C28 CD116DD6-E75D-4D84-BB8C-38D7CE728AF1 Hostname#23ce8654:443 tcp, url hash: 02510389, tls, definite, attribution: developer] cancelled
	[C28.1 4098041A-7D28-4A0D-90FE-525CCE3B7E23 10.0.0.113:61363<->IPv4#9735f8ed:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 6.070s, DNS @0.000s took 0.032s, TCP @0.458s took 0.050s, TLS 1.3 took 0.002s
	bytes in/out: 5100/1734, packets in/out: 8/12, rtt: 0.035s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:01:54.686542-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [75D54B63-3364-496A-B278-756D64AEAA19] (reporting strategy default)> on Task <EE4A601B-3320-4CCD-8FFB-F1962A04A794>.<2> was not selected for reporting
default	16:01:54.687262-0500	RedLemon	nw_flow_disconnected [C28.1 IPv4#9735f8ed:443 cancelled channel-flow ((null))] Output protocol disconnected
default	16:01:54.687577-0500	RedLemon	nw_protocol_tcp_log_summary [C28.1:3] 
	[5C6B7865-4CDF-4C45-8C43-4D7AD336FC52 <private>:61363<-><private>:443]
	Init: 1, Conn_Time: 49.667ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 35.312ms, rtt_var: 18.000ms rtt_nc: 44.031ms, rtt_var_nc: 22.812ms base rtt: 12ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:01:54.688133-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C28] reporting state cancelled
default	16:01:54.688365-0500	RedLemon	Task <8082C0AC-F2F6-4DAA-B836-B1280273FFA0>.<364> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:54.688661-0500	RedLemon	Task <8082C0AC-F2F6-4DAA-B836-B1280273FFA0>.<364> now using Connection 1
default	16:01:54.691262-0500	RedLemon	tcp_output [C28.1:3] flags=[F.] seq=1584077145, ack=381016447, win=2048 state=FIN_WAIT_1 rcv_nxt=381016447, snd_una=1584077091
default	16:01:54.691817-0500	RedLemon	Connection 28: done
default	16:01:54.692472-0500	RedLemon	Connection 29: enabling TLS
default	16:01:54.692516-0500	RedLemon	Connection 29: starting, TC(0x0)
default	16:01:54.692574-0500	RedLemon	[C29 4456D29C-37CD-4070-B7FB-DF1FDF2EE6F5 Hostname#23ce8654:443 tcp, url hash: 02510389, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{015D2438-319C-42F4-A75A-D31B0A95594B}{(null)}{Y}{2} (private), proc: E8E931A4-3EA4-3070-8D28-FBFFFC7A0E59] start
default	16:01:54.693078-0500	RedLemon	Task <365D0029-79EE-417E-BF76-8675C080CCE2>.<365> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
error	16:01:54.693608-0500	RedLemon	Read completed with an error <private>
default	16:01:54.694103-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A3CA0EFD-3EE8-4385-A9F2-9D50D5AD8822] (reporting strategy default)> on Task <365D0029-79EE-417E-BF76-8675C080CCE2>.<365> was not selected for reporting
default	16:01:54.693687-0500	RedLemon	[C29 Hostname#23ce8654:443 initial path ((null))] event: path:start @0.001s
default	16:01:54.695403-0500	RedLemon	Task <98C1B9B4-C3BF-453B-9951-F4B8237C8E42>.<366> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:01:54.696674-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1CAB3ECF-C3C6-405D-84E0-2F0F081AA670] (reporting strategy default)> on Task <98C1B9B4-C3BF-453B-9951-F4B8237C8E42>.<366> was not selected for reporting
default	16:01:54.696837-0500	RedLemon	[C29 Hostname#23ce8654:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.004s, uuid: F58B9BF2-636D-4E88-8D28-E8AFF663EF6B
default	16:01:54.698205-0500	RedLemon	[C29 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.005s
default	16:01:54.698399-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C29] reporting state preparing
default	16:01:54.698755-0500	RedLemon	Task <EE4A601B-3320-4CCD-8FFB-F1962A04A794>.<2> setting up Connection 29
default	16:01:54.699089-0500	RedLemon	Task <365D0029-79EE-417E-BF76-8675C080CCE2>.<365> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:54.699409-0500	RedLemon	Task <365D0029-79EE-417E-BF76-8675C080CCE2>.<365> now using Connection 27
default	16:01:54.699498-0500	mDNSResponder	[R469] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'LfJOt0PdXD49Vu8v884VSw=='>, options: 0x8 {use-failover}, client pid: 5311 (RedLemon)
default	16:01:54.699608-0500	RedLemon	Task <98C1B9B4-C3BF-453B-9951-F4B8237C8E42>.<366> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:54.699992-0500	RedLemon	Task <98C1B9B4-C3BF-453B-9951-F4B8237C8E42>.<366> now using Connection 27
default	16:01:54.701503-0500	RedLemon	0x7f862e39d248 ID=816 Task <8082C0AC-F2F6-4DAA-B836-B1280273FFA0>.<364> sent request, body S 83
default	16:01:54.701971-0500	RedLemon	Task <365D0029-79EE-417E-BF76-8675C080CCE2>.<365> sent request, body N 0
default	16:01:54.702234-0500	RedLemon	Task <98C1B9B4-C3BF-453B-9951-F4B8237C8E42>.<366> sent request, body N 0
default	16:01:54.704035-0500	mDNSResponder	[R469] getaddrinfo stop -- hostname: <mask.hash: 'LfJOt0PdXD49Vu8v884VSw=='>, client pid: 5311 (RedLemon)
default	16:01:54.704231-0500	RedLemon	nw_endpoint_resolver_update [C29 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#9735f8ed:443
default	16:01:54.704349-0500	RedLemon	nw_endpoint_resolver_update [C29 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#bdc5d67c:443
default	16:01:54.704461-0500	RedLemon	[C29 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.011s
default	16:01:54.704683-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 initial path ((null))] event: path:start @0.012s
default	16:01:54.705126-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.012s, uuid: 661CA4FA-2366-464F-9F9C-7893C6E93A95
default	16:01:54.705254-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.012s
default	16:01:54.705766-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.013s
default	16:01:54.706793-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.014s
default	16:01:54.706986-0500	RedLemon	tcp_output [C29.1:3] flags=[S] seq=2146973291, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2146973291
default	16:01:54.730891-0500	RedLemon	tcp_input [C28.1:3] flags=[F.] seq=381016447, ack=1584077146, win=16 state=FIN_WAIT_2 rcv_nxt=381016447, snd_una=1584077146
default	16:01:54.765691-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:54.765769-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:54.765846-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:54.767477-0500	runningboardd	Invalidating assertion 169-103-1014 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:01:54.769553-0500	RedLemon	Task <98C1B9B4-C3BF-453B-9951-F4B8237C8E42>.<366> received response, status 200 content K
default	16:01:54.770608-0500	RedLemon	Task <365D0029-79EE-417E-BF76-8675C080CCE2>.<365> received response, status 200 content K
default	16:01:54.771112-0500	RedLemon	Task <98C1B9B4-C3BF-453B-9951-F4B8237C8E42>.<366> done using Connection 27
default	16:01:54.771270-0500	RedLemon	Task <98C1B9B4-C3BF-453B-9951-F4B8237C8E42>.<366> response ended
default	16:01:54.771656-0500	RedLemon	Task <98C1B9B4-C3BF-453B-9951-F4B8237C8E42>.<366> summary for task success {transaction_duration_ms=74, response_status=200, connection=27, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=71, response_duration_ms=1, request_bytes=37, response_bytes=34792, cache_hit=false}
default	16:01:54.771770-0500	RedLemon	Task <98C1B9B4-C3BF-453B-9951-F4B8237C8E42>.<366> finished successfully
default	16:01:54.773396-0500	RedLemon	Task <365D0029-79EE-417E-BF76-8675C080CCE2>.<365> done using Connection 27
default	16:01:54.774005-0500	RedLemon	Task <365D0029-79EE-417E-BF76-8675C080CCE2>.<365> response ended
default	16:01:54.775235-0500	RedLemon	Task <365D0029-79EE-417E-BF76-8675C080CCE2>.<365> summary for task success {transaction_duration_ms=80, response_status=200, connection=27, reused=1, request_start_ms=7, request_duration_ms=0, response_start_ms=75, response_duration_ms=4, request_bytes=42, response_bytes=117388, cache_hit=false}
default	16:01:54.776578-0500	RedLemon	Task <365D0029-79EE-417E-BF76-8675C080CCE2>.<365> finished successfully
default	16:01:54.801867-0500	RedLemon	tcp_output [C29.1:3] flags=[S] seq=2146973291, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2146973291
default	16:01:54.808383-0500	RedLemon	[C29.2 IPv4#bdc5d67c:443 initial path ((null))] event: path:start @0.115s
default	16:01:54.809057-0500	RedLemon	[C29.2 IPv4#bdc5d67c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.116s, uuid: E445D468-5B75-4F5E-BA22-117E6C002EF0
default	16:01:54.809237-0500	RedLemon	[C29.2 IPv4#bdc5d67c:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.116s
default	16:01:54.809940-0500	RedLemon	[C29.2 IPv4#bdc5d67c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.117s
default	16:01:54.810770-0500	RedLemon	[C29.2 IPv4#bdc5d67c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.118s
default	16:01:54.810899-0500	RedLemon	tcp_output [C29.2:3] flags=[S] seq=1840674674, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1840674674
default	16:01:54.819026-0500	RedLemon	tcp_input [C29.1:3] flags=[S.] seq=4035363656, ack=2146973292, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2146973291
default	16:01:54.819463-0500	RedLemon	nw_flow_connected [C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:01:54.819916-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.127s
default	16:01:54.820112-0500	RedLemon	[C29 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.127s
default	16:01:54.820848-0500	RedLemon	nw_protocol_tcp_log_summary [C29.2:3] 
	[BED06804-902A-4706-882B-75DACA06B6B8 <private>:61365<-><private>:443]
	Init: 1, Conn_Time: 0.000ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 0
	rtt_cache: none, rtt_upd: 0, rtt: 0.000ms, rtt_var: 250.000ms rtt_nc: 0.000ms, rtt_var_nc: 250.000ms base rtt: 0ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:01:54.821070-0500	RedLemon	nw_flow_disconnected [C29.2 IPv4#bdc5d67c:443 cancelled channel-flow ((null))] Output protocol disconnected
default	16:01:54.821825-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C29.1:2][0x7f86317494f0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	16:01:54.822299-0500	RedLemon	boringssl_context_info_handler(2028) [C29.1:2][0x7f86317494f0] Client handshake started
default	16:01:54.822768-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS client enter_early_data
default	16:01:54.823041-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS client read_server_hello
default	16:01:54.825604-0500	RedLemon	tcp_input [C29.2:3] flags=[S.] seq=1759999823, ack=1840674675, win=65535 state=CLOSED rcv_nxt=0, snd_una=1840674674
default	16:01:54.849488-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	16:01:54.849621-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client read_server_hello
default	16:01:54.850048-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	16:01:54.850895-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client read_certificate_request
default	16:01:54.851058-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client read_server_certificate
default	16:01:54.851124-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	16:01:54.852324-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C29.1:2][0x7f86317494f0] Performing external trust evaluation
default	16:01:54.852505-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C29.1:2][0x7f86317494f0] Asyncing for external verify block
default	16:01:54.852644-0500	RedLemon	Connection 29: asked to evaluate TLS Trust
default	16:01:54.852922-0500	RedLemon	Task <EE4A601B-3320-4CCD-8FFB-F1962A04A794>.<2> auth completion disp=1 cred=0x0
default	16:01:54.859141-0500	RedLemon	Connection 29: TLS Trust result 0
default	16:01:54.859189-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C29.1:2][0x7f86317494f0] Returning from external verify block with result: true
default	16:01:54.859241-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C29.1:2][0x7f86317494f0] Certificate verification result: OK
default	16:01:54.859550-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client read_server_finished
default	16:01:54.859632-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	16:01:54.859653-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	16:01:54.859671-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client send_client_certificate
default	16:01:54.859688-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client complete_second_flight
default	16:01:54.859766-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS 1.3 client done
default	16:01:54.859888-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS client finish_client_handshake
default	16:01:54.859926-0500	RedLemon	boringssl_context_info_handler(2045) [C29.1:2][0x7f86317494f0] Client handshake state: TLS client done
default	16:01:54.860124-0500	RedLemon	boringssl_context_info_handler(2034) [C29.1:2][0x7f86317494f0] Client handshake done
default	16:01:54.860619-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C29.1:2][0x7f86317494f0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(38ms) flight_time(28ms) rtt(27ms) write_stalls(0) read_stalls(7)]
default	16:01:54.860759-0500	RedLemon	nw_flow_connected [C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-88486127)
default	16:01:54.861043-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.168s
default	16:01:54.861354-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C29] reporting state ready
default	16:01:54.861434-0500	RedLemon	[C29 Hostname#23ce8654:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.168s
default	16:01:54.861562-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.168s
default	16:01:54.861634-0500	RedLemon	[C29 Hostname#23ce8654:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.169s
default	16:01:54.861763-0500	RedLemon	Connection 29: connected successfully
default	16:01:54.861835-0500	RedLemon	Connection 29: TLS handshake complete
default	16:01:54.862075-0500	RedLemon	Connection 29: ready C(N) E(N)
default	16:01:54.862272-0500	RedLemon	Task <EE4A601B-3320-4CCD-8FFB-F1962A04A794>.<2> now using Connection 29
default	16:01:54.862363-0500	RedLemon	Connection 29: received viability advisory(Y)
default	16:01:54.862564-0500	RedLemon	Task <EE4A601B-3320-4CCD-8FFB-F1962A04A794>.<2> sent request, body N 0
default	16:01:54.877893-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:54.877986-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:54.878042-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:54.916091-0500	RedLemon	0x7f862e39d248 ID=816 Task <8082C0AC-F2F6-4DAA-B836-B1280273FFA0>.<364> received response, status 201 content U
default	16:01:54.916873-0500	RedLemon	Task <8082C0AC-F2F6-4DAA-B836-B1280273FFA0>.<364> response ended
default	16:01:54.917561-0500	RedLemon	Task <8082C0AC-F2F6-4DAA-B836-B1280273FFA0>.<364> done using Connection 1
default	16:01:54.917714-0500	RedLemon	Task <8082C0AC-F2F6-4DAA-B836-B1280273FFA0>.<364> summary for task success {transaction_duration_ms=231, response_status=201, connection=1, reused=1, request_start_ms=2, request_duration_ms=12, response_start_ms=229, response_duration_ms=1, request_bytes=496, response_bytes=776, cache_hit=false}
default	16:01:54.918181-0500	RedLemon	Task <8082C0AC-F2F6-4DAA-B836-B1280273FFA0>.<364> finished successfully
default	16:01:54.918437-0500	RedLemon	✅ Guest joined room 789Q in database
default	16:01:54.956983-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:55.016263-0500	RedLemon	Task <EE4A601B-3320-4CCD-8FFB-F1962A04A794>.<2> received response, status 101 content U
default	16:01:55.016815-0500	RedLemon	Task <EE4A601B-3320-4CCD-8FFB-F1962A04A794>.<2> response ended
default	16:01:55.016894-0500	RedLemon	Task <EE4A601B-3320-4CCD-8FFB-F1962A04A794>.<2> done using Connection 29
default	16:01:55.017807-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.325s
default	16:01:55.017883-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C29] reporting state preparing
default	16:01:55.017940-0500	RedLemon	[C29 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.325s
default	16:01:55.018063-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.325s
default	16:01:55.018114-0500	RedLemon	[C29 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.325s
default	16:01:55.018179-0500	RedLemon	nw_flow_connected [C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	16:01:55.018294-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.325s
default	16:01:55.018345-0500	RedLemon	[C29 Hostname#23ce8654:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.325s
default	16:01:55.018446-0500	RedLemon	nw_flow_connected [C29.1 IPv4#9735f8ed:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-88486127)
default	16:01:55.018699-0500	RedLemon	[C29.1 IPv4#9735f8ed:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.326s
default	16:01:55.018743-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C29] reporting state ready
default	16:01:55.018802-0500	RedLemon	[C29 Hostname#23ce8654:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.326s
default	16:01:55.019370-0500	RedLemon	📤 Realtime: Sending message type: chat, sender: 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:01:55.019809-0500	RedLemon	   Payload keys: type, position, chatUsername, senderId, timestamp, chatText
default	16:01:55.020618-0500	RedLemon	✅ Realtime: Message broadcast complete
default	16:01:55.039942-0500	RedLemon	Task <AE66B9A3-53CB-49B4-9A3E-B0404B6FA0FE>.<367> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:55.040569-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B62A2853-D94F-4430-AA80-45BCBB92FD39] (reporting strategy default)> on Task <AE66B9A3-53CB-49B4-9A3E-B0404B6FA0FE>.<367> was not selected for reporting
default	16:01:55.042098-0500	RedLemon	Task <AE66B9A3-53CB-49B4-9A3E-B0404B6FA0FE>.<367> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:55.042431-0500	RedLemon	Task <AE66B9A3-53CB-49B4-9A3E-B0404B6FA0FE>.<367> now using Connection 1
default	16:01:55.043513-0500	RedLemon	0x7f862e39d248 ID=820 Task <AE66B9A3-53CB-49B4-9A3E-B0404B6FA0FE>.<367> sent request, body N 0
default	16:01:55.068197-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:01:55.068442-0500	RedLemon	   Payload keys: timestamp, senderId, chatText, position, chatUsername, type
default	16:01:55.068766-0500	RedLemon	✅ Realtime: Decoded message type: chat, sender: 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:01:55.068897-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: chat
default	16:01:55.069057-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:01:55.086514-0500	RedLemon	📥 Received Realtime message: 'LOBBY_JOIN' from lemontom in room 789Q
default	16:01:55.086662-0500	RedLemon	👋 Received: Guest 'lemontom' joined room 789Q
default	16:01:55.113002-0500	RedLemon	0x7f862e39d248 ID=820 Task <AE66B9A3-53CB-49B4-9A3E-B0404B6FA0FE>.<367> received response, status 200 content U
default	16:01:55.114763-0500	RedLemon	Task <AE66B9A3-53CB-49B4-9A3E-B0404B6FA0FE>.<367> response ended
default	16:01:55.119487-0500	RedLemon	Task <AE66B9A3-53CB-49B4-9A3E-B0404B6FA0FE>.<367> done using Connection 1
default	16:01:55.119767-0500	RedLemon	Task <AE66B9A3-53CB-49B4-9A3E-B0404B6FA0FE>.<367> summary for task success {transaction_duration_ms=78, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=71, response_duration_ms=6, request_bytes=511, response_bytes=832, cache_hit=false}
default	16:01:55.120290-0500	RedLemon	Task <AE66B9A3-53CB-49B4-9A3E-B0404B6FA0FE>.<367> finished successfully
default	16:01:55.123048-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1020 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:55.123492-0500	runningboardd	Assertion 169-5311-1020 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:01:55.124737-0500	RedLemon	Task <81914331-8924-4147-8A6A-14CEB848D804>.<368> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:55.125125-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4CFC8355-7CFD-45A0-B7B0-BEED69A35397] (reporting strategy default)> on Task <81914331-8924-4147-8A6A-14CEB848D804>.<368> was not selected for reporting
default	16:01:55.125904-0500	RedLemon	Task <81914331-8924-4147-8A6A-14CEB848D804>.<368> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:55.126053-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:55.126180-0500	RedLemon	Task <81914331-8924-4147-8A6A-14CEB848D804>.<368> now using Connection 1
default	16:01:55.126209-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:55.127058-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:55.127089-0500	RedLemon	0x7f8631662bf8 ID=824 Task <81914331-8924-4147-8A6A-14CEB848D804>.<368> sent request, body N 0
default	16:01:55.128882-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1021 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:55.129053-0500	runningboardd	Assertion 169-103-1021 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:01:55.129781-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:55.129821-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:55.129861-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:55.141787-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:55.190696-0500	RedLemon	0x7f8631662bf8 ID=824 Task <81914331-8924-4147-8A6A-14CEB848D804>.<368> received response, status 200 content U
default	16:01:55.191346-0500	RedLemon	Task <81914331-8924-4147-8A6A-14CEB848D804>.<368> response ended
default	16:01:55.191828-0500	RedLemon	Task <81914331-8924-4147-8A6A-14CEB848D804>.<368> done using Connection 1
default	16:01:55.192058-0500	RedLemon	Task <81914331-8924-4147-8A6A-14CEB848D804>.<368> summary for task success {transaction_duration_ms=66, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:01:55.192662-0500	RedLemon	Task <81914331-8924-4147-8A6A-14CEB848D804>.<368> finished successfully
default	16:01:55.194771-0500	RedLemon	Task <5AB1E1D2-45EE-41B3-98FD-E5AF6A4FCDD6>.<369> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:55.195079-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [92AA1E85-5E67-4B35-AC8C-59DEBE94A4DF] (reporting strategy default)> on Task <5AB1E1D2-45EE-41B3-98FD-E5AF6A4FCDD6>.<369> was not selected for reporting
default	16:01:55.195753-0500	RedLemon	Task <5AB1E1D2-45EE-41B3-98FD-E5AF6A4FCDD6>.<369> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:55.195972-0500	RedLemon	Task <5AB1E1D2-45EE-41B3-98FD-E5AF6A4FCDD6>.<369> now using Connection 1
default	16:01:55.196723-0500	RedLemon	0x7f86317b3bc8 ID=828 Task <5AB1E1D2-45EE-41B3-98FD-E5AF6A4FCDD6>.<369> sent request, body N 0
default	16:01:55.210391-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:55.283283-0500	RedLemon	0x7f86317b3bc8 ID=828 Task <5AB1E1D2-45EE-41B3-98FD-E5AF6A4FCDD6>.<369> received response, status 200 content U
default	16:01:55.284483-0500	RedLemon	Task <5AB1E1D2-45EE-41B3-98FD-E5AF6A4FCDD6>.<369> response ended
default	16:01:55.284930-0500	RedLemon	Task <5AB1E1D2-45EE-41B3-98FD-E5AF6A4FCDD6>.<369> done using Connection 1
default	16:01:55.285286-0500	RedLemon	Task <5AB1E1D2-45EE-41B3-98FD-E5AF6A4FCDD6>.<369> summary for task success {transaction_duration_ms=89, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=87, response_duration_ms=2, request_bytes=524, response_bytes=841, cache_hit=true}
default	16:01:55.285851-0500	RedLemon	Task <5AB1E1D2-45EE-41B3-98FD-E5AF6A4FCDD6>.<369> finished successfully
default	16:01:55.287626-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:01:55.287786-0500	RedLemon	👋 lemontom joined room
default	16:01:55.287913-0500	RedLemon	👋 lemontom left room
default	16:01:55.288029-0500	RedLemon	👋 ursinho left room
default	16:01:55.288400-0500	RedLemon	Task <2A9F23C9-4866-470A-817F-ADB924C1671A>.<370> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:55.288815-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [309146F9-3278-4B27-BAB6-601AA2343C23] (reporting strategy default)> on Task <2A9F23C9-4866-470A-817F-ADB924C1671A>.<370> was not selected for reporting
default	16:01:55.289596-0500	RedLemon	Task <2A9F23C9-4866-470A-817F-ADB924C1671A>.<370> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:55.289911-0500	RedLemon	Task <2A9F23C9-4866-470A-817F-ADB924C1671A>.<370> now using Connection 1
default	16:01:55.290952-0500	RedLemon	0x7f8631662bf8 ID=832 Task <2A9F23C9-4866-470A-817F-ADB924C1671A>.<370> sent request, body N 0
default	16:01:55.303499-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:55.366744-0500	RedLemon	0x7f8631662bf8 ID=832 Task <2A9F23C9-4866-470A-817F-ADB924C1671A>.<370> received response, status 200 content U
default	16:01:55.367578-0500	RedLemon	Task <2A9F23C9-4866-470A-817F-ADB924C1671A>.<370> response ended
default	16:01:55.368093-0500	RedLemon	Task <2A9F23C9-4866-470A-817F-ADB924C1671A>.<370> done using Connection 1
default	16:01:55.368325-0500	RedLemon	Task <2A9F23C9-4866-470A-817F-ADB924C1671A>.<370> summary for task success {transaction_duration_ms=79, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=77, response_duration_ms=1, request_bytes=500, response_bytes=966, cache_hit=false}
default	16:01:55.368938-0500	RedLemon	Task <2A9F23C9-4866-470A-817F-ADB924C1671A>.<370> finished successfully
default	16:01:55.494297-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:56.226147-0500	runningboardd	Invalidating assertion 169-5311-1020 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:01:56.241408-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:01:56.241712-0500	RedLemon	   Payload keys: type, timestamp, senderId, chatUsername, chatText, position
default	16:01:56.242223-0500	RedLemon	✅ Realtime: Decoded message type: chat, sender: 656DAA91-33B4-4688-9135-C982EA52D7C9
default	16:01:56.242441-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: chat
default	16:01:56.242620-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:01:56.242728-0500	RedLemon	📥 Received Realtime message: 'LOBBY_START_COUNTDOWN' from Host in room 789Q
default	16:01:56.242928-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	16:01:56.263971-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	16:01:56.264342-0500	RedLemon	Task <1176E783-97E6-4FF0-8DCA-00BC6D70EDB8>.<371> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:56.264727-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [88A2B705-9A5B-4931-B5D6-3B493D05A6C9] (reporting strategy default)> on Task <1176E783-97E6-4FF0-8DCA-00BC6D70EDB8>.<371> was not selected for reporting
default	16:01:56.265304-0500	RedLemon	Task <1176E783-97E6-4FF0-8DCA-00BC6D70EDB8>.<371> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:56.265502-0500	RedLemon	Task <1176E783-97E6-4FF0-8DCA-00BC6D70EDB8>.<371> now using Connection 1
default	16:01:56.266252-0500	RedLemon	0x7f8630843e88 ID=836 Task <1176E783-97E6-4FF0-8DCA-00BC6D70EDB8>.<371> sent request, body N 0
default	16:01:56.338116-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:56.338161-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:56.338202-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:56.340531-0500	RedLemon	0x7f8630843e88 ID=836 Task <1176E783-97E6-4FF0-8DCA-00BC6D70EDB8>.<371> received response, status 200 content U
default	16:01:56.340639-0500	runningboardd	Invalidating assertion 169-103-1021 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:01:56.341063-0500	RedLemon	Task <1176E783-97E6-4FF0-8DCA-00BC6D70EDB8>.<371> response ended
default	16:01:56.341459-0500	RedLemon	Task <1176E783-97E6-4FF0-8DCA-00BC6D70EDB8>.<371> done using Connection 1
default	16:01:56.341635-0500	RedLemon	Task <1176E783-97E6-4FF0-8DCA-00BC6D70EDB8>.<371> summary for task success {transaction_duration_ms=76, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=75, response_duration_ms=1, request_bytes=500, response_bytes=956, cache_hit=true}
default	16:01:56.342148-0500	RedLemon	Task <1176E783-97E6-4FF0-8DCA-00BC6D70EDB8>.<371> finished successfully
default	16:01:56.343759-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1022 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:56.344048-0500	runningboardd	Assertion 169-5311-1022 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:01:56.344165-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	16:01:56.344347-0500	RedLemon	🎬 Guest: Fetch took 0.080s, waiting 3.170s (includes 0.25s sync buffer)
default	16:01:56.346086-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:56.346343-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:56.346535-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:56.353020-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1023 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:56.353770-0500	runningboardd	Assertion 169-103-1023 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:01:56.382508-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:57.213551-0500	RedLemon	Task <A57D02AD-A6FA-417F-A01F-021348D6E32F>.<372> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:57.213608-0500	RedLemon	Task <61EA15F6-A4C1-4560-942D-E7724FE3E3A8>.<373> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:57.215282-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7775B4EC-CB47-4EBA-9D2A-405C46B3DCD4] (reporting strategy default)> on Task <A57D02AD-A6FA-417F-A01F-021348D6E32F>.<372> was not selected for reporting
default	16:01:57.215476-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [93128FFE-6F3C-4A64-A74E-AF8230F77FB8] (reporting strategy default)> on Task <61EA15F6-A4C1-4560-942D-E7724FE3E3A8>.<373> was not selected for reporting
default	16:01:57.217176-0500	RedLemon	Task <A57D02AD-A6FA-417F-A01F-021348D6E32F>.<372> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:57.217397-0500	RedLemon	Task <A57D02AD-A6FA-417F-A01F-021348D6E32F>.<372> now using Connection 1
default	16:01:57.218377-0500	RedLemon	Task <61EA15F6-A4C1-4560-942D-E7724FE3E3A8>.<373> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:57.218554-0500	RedLemon	Task <61EA15F6-A4C1-4560-942D-E7724FE3E3A8>.<373> now using Connection 1
default	16:01:57.219417-0500	RedLemon	0x7f8630843e88 ID=840 Task <A57D02AD-A6FA-417F-A01F-021348D6E32F>.<372> sent request, body N 0
default	16:01:57.219470-0500	RedLemon	0x7f8630876768 ID=844 Task <61EA15F6-A4C1-4560-942D-E7724FE3E3A8>.<373> sent request, body N 0
default	16:01:57.295361-0500	RedLemon	0x7f8630876768 ID=844 Task <61EA15F6-A4C1-4560-942D-E7724FE3E3A8>.<373> received response, status 200 content U
default	16:01:57.296291-0500	RedLemon	Task <61EA15F6-A4C1-4560-942D-E7724FE3E3A8>.<373> response ended
default	16:01:57.296772-0500	RedLemon	Task <61EA15F6-A4C1-4560-942D-E7724FE3E3A8>.<373> done using Connection 1
default	16:01:57.297086-0500	RedLemon	Task <61EA15F6-A4C1-4560-942D-E7724FE3E3A8>.<373> summary for task success {transaction_duration_ms=80, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=78, response_duration_ms=1, request_bytes=511, response_bytes=833, cache_hit=true}
default	16:01:57.297755-0500	RedLemon	Task <61EA15F6-A4C1-4560-942D-E7724FE3E3A8>.<373> finished successfully
default	16:01:57.299669-0500	RedLemon	Task <7CF4A606-6FDC-4DAD-9FB2-3B43B6A7A2D1>.<374> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:57.299990-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [61B00CB8-F8D9-4D91-AA76-3652714C00FB] (reporting strategy default)> on Task <7CF4A606-6FDC-4DAD-9FB2-3B43B6A7A2D1>.<374> was not selected for reporting
default	16:01:57.300770-0500	RedLemon	Task <7CF4A606-6FDC-4DAD-9FB2-3B43B6A7A2D1>.<374> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:57.300915-0500	RedLemon	Task <7CF4A606-6FDC-4DAD-9FB2-3B43B6A7A2D1>.<374> now using Connection 1
default	16:01:57.301691-0500	RedLemon	0x7f8632e8bb88 ID=848 Task <7CF4A606-6FDC-4DAD-9FB2-3B43B6A7A2D1>.<374> sent request, body N 0
default	16:01:57.317565-0500	RedLemon	0x7f8630843e88 ID=840 Task <A57D02AD-A6FA-417F-A01F-021348D6E32F>.<372> received response, status 200 content U
default	16:01:57.318346-0500	RedLemon	Task <A57D02AD-A6FA-417F-A01F-021348D6E32F>.<372> response ended
default	16:01:57.318738-0500	RedLemon	Task <A57D02AD-A6FA-417F-A01F-021348D6E32F>.<372> done using Connection 1
default	16:01:57.319001-0500	RedLemon	Task <A57D02AD-A6FA-417F-A01F-021348D6E32F>.<372> summary for task success {transaction_duration_ms=102, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=100, response_duration_ms=1, request_bytes=500, response_bytes=954, cache_hit=true}
default	16:01:57.319355-0500	RedLemon	Task <A57D02AD-A6FA-417F-A01F-021348D6E32F>.<372> finished successfully
default	16:01:57.320045-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:57.321177-0500	RedLemon	🎬 Guest: Detected room playback start via database fallback
default	16:01:57.335661-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:57.370115-0500	RedLemon	0x7f8632e8bb88 ID=848 Task <7CF4A606-6FDC-4DAD-9FB2-3B43B6A7A2D1>.<374> received response, status 200 content U
default	16:01:57.370598-0500	RedLemon	Task <7CF4A606-6FDC-4DAD-9FB2-3B43B6A7A2D1>.<374> response ended
default	16:01:57.371186-0500	RedLemon	Task <7CF4A606-6FDC-4DAD-9FB2-3B43B6A7A2D1>.<374> done using Connection 1
default	16:01:57.371393-0500	RedLemon	Task <7CF4A606-6FDC-4DAD-9FB2-3B43B6A7A2D1>.<374> summary for task success {transaction_duration_ms=71, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:01:57.371622-0500	RedLemon	Task <7CF4A606-6FDC-4DAD-9FB2-3B43B6A7A2D1>.<374> finished successfully
default	16:01:57.373155-0500	runningboardd	Invalidating assertion 169-5311-1022 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:01:57.373714-0500	RedLemon	Task <D5F62432-2AF4-4365-8022-65DF84C23A7B>.<375> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:57.373990-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4D0883F7-8BDB-444A-8D0E-432C42382FD7] (reporting strategy default)> on Task <D5F62432-2AF4-4365-8022-65DF84C23A7B>.<375> was not selected for reporting
default	16:01:57.374669-0500	RedLemon	Task <D5F62432-2AF4-4365-8022-65DF84C23A7B>.<375> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:57.374850-0500	RedLemon	Task <D5F62432-2AF4-4365-8022-65DF84C23A7B>.<375> now using Connection 1
default	16:01:57.375583-0500	RedLemon	0x7f8630843e88 ID=852 Task <D5F62432-2AF4-4365-8022-65DF84C23A7B>.<375> sent request, body N 0
default	16:01:57.385863-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:57.516375-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:57.516520-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:57.516624-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:57.517981-0500	runningboardd	Invalidating assertion 169-103-1023 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:01:57.603101-0500	RedLemon	0x7f8630843e88 ID=852 Task <D5F62432-2AF4-4365-8022-65DF84C23A7B>.<375> received response, status 200 content U
default	16:01:57.603754-0500	RedLemon	Task <D5F62432-2AF4-4365-8022-65DF84C23A7B>.<375> response ended
default	16:01:57.604326-0500	RedLemon	Task <D5F62432-2AF4-4365-8022-65DF84C23A7B>.<375> done using Connection 1
default	16:01:57.604604-0500	RedLemon	Task <D5F62432-2AF4-4365-8022-65DF84C23A7B>.<375> summary for task success {transaction_duration_ms=230, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=228, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:01:57.604823-0500	RedLemon	Task <D5F62432-2AF4-4365-8022-65DF84C23A7B>.<375> finished successfully
default	16:01:57.605628-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1024 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:57.605813-0500	runningboardd	Assertion 169-5311-1024 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:01:57.606853-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:01:57.607400-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:57.607498-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:57.607559-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:57.609859-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1025 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:57.610089-0500	runningboardd	Assertion 169-103-1025 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:01:57.621860-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:58.708513-0500	runningboardd	Invalidating assertion 169-5311-1024 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:01:58.884921-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:58.884968-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:58.885015-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:58.886241-0500	runningboardd	Invalidating assertion 169-103-1025 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:01:59.007092-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:59.007172-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:59.007244-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:59.472541-0500	RedLemon	Task <B554D1A2-C47F-4C52-8545-B5AD3102C886>.<376> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:59.473206-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5D999430-C14A-4E61-AB4C-498B3B08D7B4] (reporting strategy default)> on Task <B554D1A2-C47F-4C52-8545-B5AD3102C886>.<376> was not selected for reporting
default	16:01:59.474495-0500	RedLemon	Task <B554D1A2-C47F-4C52-8545-B5AD3102C886>.<376> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:59.474953-0500	RedLemon	Task <B554D1A2-C47F-4C52-8545-B5AD3102C886>.<376> now using Connection 1
default	16:01:59.476429-0500	RedLemon	0x7f8633a36ad8 ID=856 Task <B554D1A2-C47F-4C52-8545-B5AD3102C886>.<376> sent request, body N 0
default	16:01:59.544940-0500	RedLemon	0x7f8633a36ad8 ID=856 Task <B554D1A2-C47F-4C52-8545-B5AD3102C886>.<376> received response, status 200 content U
default	16:01:59.545528-0500	RedLemon	Task <B554D1A2-C47F-4C52-8545-B5AD3102C886>.<376> response ended
default	16:01:59.546001-0500	RedLemon	Task <B554D1A2-C47F-4C52-8545-B5AD3102C886>.<376> done using Connection 1
default	16:01:59.546303-0500	RedLemon	Task <B554D1A2-C47F-4C52-8545-B5AD3102C886>.<376> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=70, response_duration_ms=1, request_bytes=500, response_bytes=955, cache_hit=true}
default	16:01:59.546557-0500	RedLemon	🎬 Guest: Starting playback after countdown
default	16:01:59.546845-0500	RedLemon	🎬 Guest: Launching player for Weapons
default	16:01:59.547139-0500	RedLemon	Task <B554D1A2-C47F-4C52-8545-B5AD3102C886>.<376> finished successfully
default	16:01:59.547275-0500	RedLemon	   Quality: 1080p
default	16:01:59.548177-0500	RedLemon	   Mode: watchParty
default	16:01:59.548352-0500	RedLemon	📡 Fetching metadata for tt26581740...
default	16:01:59.551636-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1026 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:59.560626-0500	runningboardd	Assertion 169-5311-1026 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:01:59.562236-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:59.562422-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:59.562597-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:59.565083-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1027 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:01:59.565632-0500	runningboardd	Assertion 169-103-1027 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:01:59.567842-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:01:59.567925-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:01:59.568067-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:01:59.587387-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:59.612696-0500	RedLemon	Task <295ED956-2609-4666-87B2-4A4352CD6545>.<377> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:59.613090-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3836CFBA-2E58-4C47-BFE4-E6B2C8EDF9EA] (reporting strategy default)> on Task <295ED956-2609-4666-87B2-4A4352CD6545>.<377> was not selected for reporting
default	16:01:59.613852-0500	RedLemon	🖼️ Loading background art: https://images.metahub.space/background/medium/tt26581740/img
default	16:01:59.613893-0500	RedLemon	Task <295ED956-2609-4666-87B2-4A4352CD6545>.<377> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:59.614155-0500	RedLemon	⏳ Background art loading...
default	16:01:59.614176-0500	RedLemon	Task <295ED956-2609-4666-87B2-4A4352CD6545>.<377> now using Connection 1
default	16:01:59.614351-0500	RedLemon	🎨 Loading logo: https://images.metahub.space/logo/medium/tt26581740/img
default	16:01:59.614588-0500	RedLemon	⏳ Logo loading...
default	16:01:59.616281-0500	RedLemon	0x7f862e2ba528 ID=860 Task <295ED956-2609-4666-87B2-4A4352CD6545>.<377> sent request, body N 0
default	16:01:59.652977-0500	RedLemon	Task <F1296D6A-0400-4C3A-8DC8-F94E3904CF1D>.<378> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:01:59.653395-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C44D25E3-BA36-4CA3-9618-CEE69BF2E200] (reporting strategy default)> on Task <F1296D6A-0400-4C3A-8DC8-F94E3904CF1D>.<378> was not selected for reporting
default	16:01:59.655004-0500	RedLemon	Task <C9D0838C-8155-4344-BB67-0EFB03FD2102>.<379> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	16:01:59.655139-0500	RedLemon	Task <F1296D6A-0400-4C3A-8DC8-F94E3904CF1D>.<378> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:59.656110-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F91EA65F-330B-4237-87A8-F34281443CCC] (reporting strategy default)> on Task <C9D0838C-8155-4344-BB67-0EFB03FD2102>.<379> was not selected for reporting
default	16:01:59.656102-0500	RedLemon	Task <F1296D6A-0400-4C3A-8DC8-F94E3904CF1D>.<378> now using Connection 27
default	16:01:59.657059-0500	RedLemon	Task <C9D0838C-8155-4344-BB67-0EFB03FD2102>.<379> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:59.657249-0500	RedLemon	Task <C9D0838C-8155-4344-BB67-0EFB03FD2102>.<379> now using Connection 27
default	16:01:59.657526-0500	RedLemon	Task <F1296D6A-0400-4C3A-8DC8-F94E3904CF1D>.<378> sent request, body N 0
default	16:01:59.657668-0500	RedLemon	Task <C9D0838C-8155-4344-BB67-0EFB03FD2102>.<379> sent request, body N 0
default	16:01:59.671478-0500	RedLemon	Task <F1296D6A-0400-4C3A-8DC8-F94E3904CF1D>.<378> received response, status 200 content K
default	16:01:59.673154-0500	RedLemon	Task <F1296D6A-0400-4C3A-8DC8-F94E3904CF1D>.<378> done using Connection 27
default	16:01:59.673405-0500	RedLemon	Task <F1296D6A-0400-4C3A-8DC8-F94E3904CF1D>.<378> response ended
default	16:01:59.673960-0500	RedLemon	Task <F1296D6A-0400-4C3A-8DC8-F94E3904CF1D>.<378> summary for task success {transaction_duration_ms=19, response_status=200, connection=27, reused=1, request_start_ms=2, request_duration_ms=0, response_start_ms=17, response_duration_ms=2, request_bytes=37, response_bytes=34633, cache_hit=false}
default	16:01:59.674055-0500	RedLemon	Task <F1296D6A-0400-4C3A-8DC8-F94E3904CF1D>.<378> finished successfully
default	16:01:59.677407-0500	RedLemon	0x7f862e2ba528 ID=860 Task <295ED956-2609-4666-87B2-4A4352CD6545>.<377> received response, status 200 content U
default	16:01:59.678339-0500	RedLemon	Task <295ED956-2609-4666-87B2-4A4352CD6545>.<377> response ended
default	16:01:59.679075-0500	RedLemon	Task <295ED956-2609-4666-87B2-4A4352CD6545>.<377> done using Connection 1
default	16:01:59.679341-0500	RedLemon	Task <295ED956-2609-4666-87B2-4A4352CD6545>.<377> summary for task success {transaction_duration_ms=65, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=2, response_start_ms=63, response_duration_ms=2, request_bytes=511, response_bytes=834, cache_hit=true}
default	16:01:59.679615-0500	RedLemon	Task <295ED956-2609-4666-87B2-4A4352CD6545>.<377> finished successfully
default	16:01:59.684890-0500	RedLemon	Task <C9D0838C-8155-4344-BB67-0EFB03FD2102>.<379> received response, status 200 content K
default	16:01:59.690238-0500	RedLemon	Task <C9D0838C-8155-4344-BB67-0EFB03FD2102>.<379> done using Connection 27
default	16:01:59.690371-0500	RedLemon	Task <C9D0838C-8155-4344-BB67-0EFB03FD2102>.<379> response ended
default	16:01:59.690999-0500	RedLemon	Task <C9D0838C-8155-4344-BB67-0EFB03FD2102>.<379> summary for task success {transaction_duration_ms=34, response_status=200, connection=27, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=28, response_duration_ms=5, request_bytes=42, response_bytes=117406, cache_hit=false}
default	16:01:59.691108-0500	RedLemon	Task <C9D0838C-8155-4344-BB67-0EFB03FD2102>.<379> finished successfully
default	16:01:59.697964-0500	RedLemon	✅ Logo loaded successfully
default	16:01:59.698272-0500	RedLemon	✅ Background art loaded successfully
default	16:01:59.721293-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:59.725121-0500	RedLemon	✅ StreamService: Using provided metadata: Weapons
default	16:01:59.725291-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	16:01:59.725286-0500	RedLemon	Task <1A17AF7B-E32A-4310-9377-8DA45E7C7E26>.<380> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:59.725394-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt26581740, type=movie, year=2025
default	16:01:59.725852-0500	RedLemon	Task <CC449EF5-8DE9-4366-B66C-3C0339D1B475>.<24> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	16:01:59.726238-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [298FBC5F-2A7E-4912-9652-AD2E5561AD58] (reporting strategy default)> on Task <1A17AF7B-E32A-4310-9377-8DA45E7C7E26>.<380> was not selected for reporting
default	16:01:59.727195-0500	RedLemon	Task <1A17AF7B-E32A-4310-9377-8DA45E7C7E26>.<380> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:59.727413-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BF66DFFD-96DF-48DD-B738-E8DB3B0222D3] (reporting strategy default)> on Task <CC449EF5-8DE9-4366-B66C-3C0339D1B475>.<24> was not selected for reporting
default	16:01:59.727551-0500	RedLemon	Task <1A17AF7B-E32A-4310-9377-8DA45E7C7E26>.<380> now using Connection 1
default	16:01:59.729104-0500	RedLemon	Task <CC449EF5-8DE9-4366-B66C-3C0339D1B475>.<24> now using Connection 24
default	16:01:59.729235-0500	RedLemon	0x7f8633a13428 ID=864 Task <1A17AF7B-E32A-4310-9377-8DA45E7C7E26>.<380> sent request, body N 0
default	16:01:59.729607-0500	RedLemon	Task <CC449EF5-8DE9-4366-B66C-3C0339D1B475>.<24> sent request, body N 0
default	16:01:59.745625-0500	RedLemon	Task <CDC1E131-8F29-44E0-BC11-0382260439BC>.<381> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	16:01:59.745625-0500	RedLemon	Task <38630621-FB72-4FF9-B005-63AFD9F471CF>.<382> resuming, timeouts(20.0, 604800.0) QOS(0x15) Voucher (null)
default	16:01:59.745917-0500	RedLemon	Task <5DF163D3-9BF8-4594-BF7C-8DB9369C4E06>.<383> resuming, timeouts(20.0, 604800.0) QOS(0x15) Voucher (null)
default	16:01:59.746021-0500	RedLemon	Task <D0DB2770-9A02-4797-B4BF-11F15BAE11BC>.<384> resuming, timeouts(20.0, 604800.0) QOS(0x15) Voucher (null)
default	16:01:59.754122-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B2EBCB1E-141F-43EB-8BF4-AE16FEF336BB] (reporting strategy default)> on Task <CDC1E131-8F29-44E0-BC11-0382260439BC>.<381> was not selected for reporting
default	16:01:59.754580-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FFA1C10D-CE0F-4E2C-8888-58341549A111] (reporting strategy default)> on Task <38630621-FB72-4FF9-B005-63AFD9F471CF>.<382> was not selected for reporting
default	16:01:59.755134-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E135E977-860A-4E15-98E8-7FA07CCA0B1F] (reporting strategy default)> on Task <5DF163D3-9BF8-4594-BF7C-8DB9369C4E06>.<383> was not selected for reporting
default	16:01:59.758713-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [98828CB4-578B-4AA4-812C-C5BA42571C55] (reporting strategy default)> on Task <D0DB2770-9A02-4797-B4BF-11F15BAE11BC>.<384> was not selected for reporting
default	16:01:59.761622-0500	RedLemon	Task <D0DB2770-9A02-4797-B4BF-11F15BAE11BC>.<384> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:59.761759-0500	RedLemon	Task <CDC1E131-8F29-44E0-BC11-0382260439BC>.<381> summary for task success {transaction_duration_ms=6, response_status=200, cache_hit=true}
default	16:01:59.761964-0500	RedLemon	Task <CDC1E131-8F29-44E0-BC11-0382260439BC>.<381> finished successfully
default	16:01:59.761960-0500	RedLemon	Task <D0DB2770-9A02-4797-B4BF-11F15BAE11BC>.<384> now using Connection 16
default	16:01:59.762059-0500	RedLemon	Task <38630621-FB72-4FF9-B005-63AFD9F471CF>.<382> summary for task success {transaction_duration_ms=4, response_status=200, cache_hit=true}
default	16:01:59.764071-0500	RedLemon	Task <38630621-FB72-4FF9-B005-63AFD9F471CF>.<382> finished successfully
default	16:01:59.765146-0500	RedLemon	Task <5DF163D3-9BF8-4594-BF7C-8DB9369C4E06>.<383> summary for task success {transaction_duration_ms=4, response_status=200, cache_hit=true}
default	16:01:59.765480-0500	RedLemon	Task <5DF163D3-9BF8-4594-BF7C-8DB9369C4E06>.<383> finished successfully
default	16:01:59.765526-0500	RedLemon	Task <D0DB2770-9A02-4797-B4BF-11F15BAE11BC>.<384> sent request, body N 0
default	16:01:59.793401-0500	RedLemon	0x7f8633a13428 ID=864 Task <1A17AF7B-E32A-4310-9377-8DA45E7C7E26>.<380> received response, status 200 content U
default	16:01:59.794025-0500	RedLemon	Task <1A17AF7B-E32A-4310-9377-8DA45E7C7E26>.<380> response ended
default	16:01:59.794703-0500	RedLemon	Task <1A17AF7B-E32A-4310-9377-8DA45E7C7E26>.<380> done using Connection 1
default	16:01:59.795001-0500	RedLemon	Task <1A17AF7B-E32A-4310-9377-8DA45E7C7E26>.<380> summary for task success {transaction_duration_ms=68, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=66, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:01:59.795336-0500	RedLemon	Task <1A17AF7B-E32A-4310-9377-8DA45E7C7E26>.<380> finished successfully
default	16:01:59.797246-0500	RedLemon	Task <728BB7B7-7BF3-42D5-B8E9-3CA3097ABB30>.<385> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:01:59.797552-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6A50F5F7-DDE5-453F-81AC-2F0EC43AB9A0] (reporting strategy default)> on Task <728BB7B7-7BF3-42D5-B8E9-3CA3097ABB30>.<385> was not selected for reporting
default	16:01:59.798325-0500	RedLemon	Task <728BB7B7-7BF3-42D5-B8E9-3CA3097ABB30>.<385> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:01:59.798542-0500	RedLemon	Task <728BB7B7-7BF3-42D5-B8E9-3CA3097ABB30>.<385> now using Connection 1
default	16:01:59.799510-0500	RedLemon	0x7f8631528218 ID=868 Task <728BB7B7-7BF3-42D5-B8E9-3CA3097ABB30>.<385> sent request, body N 0
default	16:01:59.814811-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:01:59.867712-0500	RedLemon	0x7f8631528218 ID=868 Task <728BB7B7-7BF3-42D5-B8E9-3CA3097ABB30>.<385> received response, status 200 content U
default	16:01:59.868099-0500	RedLemon	Task <728BB7B7-7BF3-42D5-B8E9-3CA3097ABB30>.<385> response ended
default	16:01:59.868398-0500	RedLemon	Task <728BB7B7-7BF3-42D5-B8E9-3CA3097ABB30>.<385> done using Connection 1
default	16:01:59.868547-0500	RedLemon	Task <728BB7B7-7BF3-42D5-B8E9-3CA3097ABB30>.<385> summary for task success {transaction_duration_ms=70, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=0, request_bytes=524, response_bytes=841, cache_hit=true}
default	16:01:59.868874-0500	RedLemon	Task <728BB7B7-7BF3-42D5-B8E9-3CA3097ABB30>.<385> finished successfully
default	16:01:59.870363-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:01:59.909482-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:00.437561-0500	RedLemon	Task <D0DB2770-9A02-4797-B4BF-11F15BAE11BC>.<384> received response, status 200 content U
default	16:02:00.437776-0500	RedLemon	Task <D0DB2770-9A02-4797-B4BF-11F15BAE11BC>.<384> done using Connection 16
default	16:02:00.438194-0500	RedLemon	Task <D0DB2770-9A02-4797-B4BF-11F15BAE11BC>.<384> response ended
default	16:02:00.438477-0500	RedLemon	Task <D0DB2770-9A02-4797-B4BF-11F15BAE11BC>.<384> summary for task success {transaction_duration_ms=677, response_status=200, connection=16, reused=1, request_start_ms=4, request_duration_ms=0, response_start_ms=676, response_duration_ms=0, request_bytes=484, response_bytes=2107, cache_hit=true}
default	16:02:00.438827-0500	RedLemon	Task <D0DB2770-9A02-4797-B4BF-11F15BAE11BC>.<384> finished successfully
default	16:02:00.441914-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 185
default	16:02:00.442095-0500	RedLemon	   INPUT[0]: Weapons 2025 UHD BluRay 2160p DDP Atmos 5 1 DV HDR10Plus x265-hallowed mkv | 2160p | zilean
default	16:02:00.442353-0500	RedLemon	   INPUT[1]: Weapons 2025 Hybrid 2160p UHD BluRay TrueHD Atmos 7 1 DV HDR10+ x265-j3rico mkv | 2160p | zilean
default	16:02:00.442529-0500	RedLemon	   INPUT[2]: Weapons 2025 MULTi FRENCH VF2 HDR DV 2160p WEB H265-SUPPLY mkv | 2160p | zilean
default	16:02:00.442697-0500	RedLemon	   INPUT[3]: Weapons 2025 2160p WEB-DL DV-TheEqualizer mp4 | 2160p | zilean
default	16:02:00.442857-0500	RedLemon	   INPUT[4]: Weapons 2025 NORDiC PROPER 2160p SDR WEB-DL DDP5 1 Atmos H 265-NorTekst mkv | 2160p | zilean
default	16:02:00.443012-0500	RedLemon	   INPUT[5]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RUS SUB mkv | 2160p | zilean
default	16:02:00.443169-0500	RedLemon	   INPUT[6]: Weapons 2025 2160p WEB-DL DDP5 1 Atmos SDR H265-AOC | 2160p | zilean
default	16:02:00.443322-0500	RedLemon	   INPUT[7]: Weapons 2025 2160p AMZN WEB-DL DDP5 1 H 265-BYNDR mkv | 2160p | zilean
default	16:02:00.443510-0500	RedLemon	   INPUT[8]: Weapons 2025 2160p iTunes WEB-DL DD5 1 DV H 265-DreamHD mkv | 2160p | zilean
default	16:02:00.443754-0500	RedLemon	   INPUT[9]: Weapons 2025 2160p UHD Blu-ray Remux DV HDR HEVC TrueHD Atmos 7 1-CiNEPHiLES | 2160p | zilean
default	16:02:00.443978-0500	RedLemon	   INPUT[10]: Weapons 2025 2160p UHD Remux HEVC DoVi TrueHD Atmos 7 1-playBD | 2160p | zilean
default	16:02:00.444252-0500	RedLemon	   INPUT[11]: Weapons (2025) MA WEB-DL 2160p HDR 2xUkr Eng [Hurtom] v2 mkv | 2160p | zilean
default	16:02:00.444443-0500	RedLemon	   INPUT[12]: Weapons 2025 MULTi VF2 HDR DV 2160p WEB H265-SUPPLY | 2160p | zilean
default	16:02:00.444621-0500	RedLemon	   INPUT[13]: Weapons 2025 2160p MA WEB-DL DV HDR TYMBLER mkv | 2160p | zilean
default	16:02:00.444799-0500	RedLemon	   INPUT[14]: Weapons 2025 MULTi VF2 HDR 2160p WEB H265-SUPPLY | 2160p | zilean
default	16:02:00.444964-0500	RedLemon	   INPUT[15]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265 mkv | 2160p | zilean
default	16:02:00.445125-0500	RedLemon	   INPUT[16]: Weapons 2025 iTA-ENG WEBDL 2160p HEVC HDR x265-CYBER mkv | 2160p | zilean
default	16:02:00.445283-0500	RedLemon	   INPUT[17]: Weapons 2025 2160p MA WEB-DL HDR H 265 Master5 mkv | 2160p | zilean
default	16:02:00.445559-0500	RedLemon	   INPUT[18]: Weapons 2025 1080p Blu-ray Remux AVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 1080p | zilean
default	16:02:00.445749-0500	RedLemon	   INPUT[19]: Weapons 2025 720p AMZN WEB-DL DDP5 1 H 264 mkv | 720p | zilean
default	16:02:00.445930-0500	RedLemon	   INPUT[20]: Weapons 2025 UHD BluRay 2160p TrueHD Atmos 7 1 DV HEVC REMUX-FraMeSToR | 2160p | zilean
default	16:02:00.446095-0500	RedLemon	   INPUT[21]: Weapons (2025) En 1080p X265 HEVC 10 bit | 1080p | zilean
default	16:02:00.446294-0500	RedLemon	   INPUT[22]: Weapons 2025 1080p HD x264 ENG YG iso | 1080p | zilean
default	16:02:00.447051-0500	RedLemon	   INPUT[23]: Weapons 2025 2160p HDR10Plus DV WEBRip 6CH x265 HEVC-PSA | 2160p | zilean
default	16:02:00.450252-0500	RedLemon	   INPUT[24]: Weapons 2025 Dub WEB-DLRip-AVC ExKinoRay mkv | Unknown | zilean
default	16:02:00.450459-0500	RedLemon	   INPUT[25]: Weapons 2025 1080p WEBRip DD5 1 10bits x265-Rapta mkv | 1080p | zilean
default	16:02:00.450665-0500	RedLemon	   INPUT[26]: Weapons 2025 iTA-ENG WEBDL 1080p x264-CYBER mkv | 1080p | zilean
default	16:02:00.450838-0500	RedLemon	   INPUT[27]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265 DUAL-C76 mkv | 2160p | zilean
default	16:02:00.451173-0500	RedLemon	   INPUT[28]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:02:00.451349-0500	RedLemon	   INPUT[29]: Weapons 2025 1080p HDTS x264 ENG YG mkv | 1080p | zilean
default	16:02:00.451512-0500	RedLemon	   INPUT[30]: Weapons 2025 1080p ITA-ENG MULTI WEBRip x264 AAC-V3SP4EV3R mkv | 1080p | zilean
default	16:02:00.451678-0500	RedLemon	   INPUT[31]: Weapons 2025 Hybrid 2160p UHD Blu-ray Remux DV HDR10plus HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:02:00.451824-0500	RedLemon	   INPUT[32]: Weapons 2025 MULTi VF2 1080p WEB H264-SUPPLY | 1080p | zilean
default	16:02:00.451972-0500	RedLemon	   INPUT[33]: Weapons 2025 1080p HD x264 ENG YG iso | 1080p | zilean
default	16:02:00.456254-0500	RedLemon	   INPUT[34]: Weapons 2025 MULTi 2160p UHD BluRay REMUX DV HDR HEVC TrueHD Atmos 7 1-R22 | 2160p | zilean
default	16:02:00.457021-0500	RedLemon	   INPUT[35]: Weapons 2025 2160p BDRemux HEVC HDR DV TrueHD Atmos 7 1-DaTmoSX | 2160p | zilean
default	16:02:00.457331-0500	RedLemon	   INPUT[36]: Weapons 2025 WEB-DL 2160p DD5 1 Atmos DV HDR-DVT mkv | 2160p | zilean
default	16:02:00.457623-0500	RedLemon	   INPUT[37]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:02:00.459132-0500	RedLemon	   INPUT[38]: Weapons 2025 1080p HMAX WEB-DL DDP5 1 H 265 DUAL-Potatin mkv | 1080p | zilean
default	16:02:00.459475-0500	RedLemon	   INPUT[39]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:02:00.459753-0500	RedLemon	   INPUT[40]: Weapons 2025 1080p BluRay x265-YAWNTiC mkv | 1080p | zilean
default	16:02:00.460028-0500	RedLemon	   INPUT[41]: Weapons 2025 MULTi 2160p UHD BluRay x265-SESKAPiLE mkv | 2160p | zilean
default	16:02:00.460236-0500	RedLemon	   INPUT[42]: Weapons 2025 Hybrid 2160p UHD Blu-ray Remux DV HDR10plus HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:02:00.460402-0500	RedLemon	   INPUT[43]: Weapons 2025 REPACK 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:02:00.460567-0500	RedLemon	   INPUT[44]: Weapons 2025 2160p UHD BluRay REMUX DV P7 HDR MULTi TrueHD Atmos 7 1 H265-BEN THE MEN | 2160p | zilean
default	16:02:00.460738-0500	RedLemon	   INPUT[45]: Weapons 2025 1080p 10bit BluRay 8CH X265 HEVC-PSA mkv | 1080p | zilean
default	16:02:00.460891-0500	RedLemon	   INPUT[46]: www UIndex org   -    Weapons 2025 1080p BluRay x264-OFT | 1080p | zilean
default	16:02:00.461040-0500	RedLemon	   INPUT[47]: Weapons 2025 BluRay 1080p DDP Atmos 5 1 x264-hallowed mkv | 1080p | zilean
default	16:02:00.461184-0500	RedLemon	   INPUT[48]: Weapons 2025 WEB-DL1080p mkv | 1080p | zilean
default	16:02:00.461333-0500	RedLemon	   INPUT[49]: Weapons 2025 1080p Blu-ray Remux AVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 1080p | zilean
default	16:02:00.461479-0500	RedLemon	   INPUT[50]: Weapons 2025 1080p BluRay AV1 Opus 7 1-AV1Core mkv | 1080p | zilean
default	16:02:00.461627-0500	RedLemon	   INPUT[51]: Weapons (2025) (2160p UHD BluRay x265 10bit DV HDR TrueHD Atmos 7 1 r00t) | 2160p | zilean
default	16:02:00.461779-0500	RedLemon	   INPUT[52]: Weapons (2025) (1080p BluRay x265 10bit EAC3 Atmos 7 1 Ghost) | 1080p | zilean
default	16:02:00.461925-0500	RedLemon	   INPUT[53]: Weapons 2025 MULTi 2160p UHD BluRay REMUX HEVC DV HDR TrueHD 7 1 Atmos-DSiTE | 2160p | zilean
default	16:02:00.462073-0500	RedLemon	   INPUT[54]: Weapons (2025) (2160p WEB-DL Hybrid H265 DV HDR DDP Atmos 5 1 English - HONE) mkv | 2160p | zilean
default	16:02:00.462236-0500	RedLemon	   INPUT[55]: Weapons 2025 2160p MA WEB-DL DDP5 1 Atmos DoVi HDR H 265-HONE mkv | 2160p | zilean
default	16:02:00.462424-0500	RedLemon	   INPUT[56]: Weapons (2025) [MULTi] [2160p] [iT] [WEB-DL] [DV] [HDR] [H 265] [DDP5 1-R22] [Dubbing PL i napisy PL] | 2160p | zilean
default	16:02:00.462589-0500	RedLemon	   INPUT[57]: Weapons 2025 PLDUB MULTi 2160p iT WEB-DL DoVi HDR DDP5 1 x264-P2P mkv | 2160p | zilean
default	16:02:00.462795-0500	RedLemon	   INPUT[58]: Weapons (2025) mkv | Unknown | zilean
default	16:02:00.463007-0500	RedLemon	   INPUT[59]: Weapons (2025) 2160p H265 HDR10 DV iTA EnG AC3 Sub iTA EnG-MIRCrew iso | 2160p | zilean
default	16:02:00.463179-0500	RedLemon	   INPUT[60]: Weapons [2025, WEB-DL 2160p, HDR10, Dolby Vision] [Hybrid] Dub (Movie Dubbing, RHS) + 4x MVO (HDRezka, TVShows, LostFilm, LE-Production) + AVO + Dub (Ukr) + DVO (Ukr) + Original (Eng) + Sub (Rus, Ukr, Eng) | 2160p | zilean
default	16:02:00.463342-0500	RedLemon	   INPUT[61]: Weapons 2025 x265 WEB-DL 2160p SDR mkv | 2160p | zilean
default	16:02:00.463556-0500	RedLemon	   INPUT[62]: Weapons (2025) [2160p] [YTS MX] | 2160p | zilean
default	16:02:00.464785-0500	RedLemon	   INPUT[63]: Weapons 2025 2160p WEB-DL Hybrid H265 DV HDR DDP Atmos 5 1 mkv | 2160p | zilean
default	16:02:00.465331-0500	RedLemon	   INPUT[64]: [superseed byethost7 com] Weapons 2025 PL HDR AI UP 2160p HDTS AC3-ChrisVPS mkv ts | 2160p | zilean
default	16:02:00.465809-0500	RedLemon	   INPUT[65]: Weapons 2025 1080p CAMRip LAT DUB 1XBET mp4 | 1080p | zilean
default	16:02:00.466133-0500	RedLemon	   INPUT[66]: ww UIndex org    -    Weapons 2025 720p AMZN WEB-DL DDP5 1 H 264-BYNDR | 720p | zilean
default	16:02:00.466377-0500	RedLemon	   INPUT[67]: Weapons 2025 720p MA WEB-DL DDP5 1 Atmos H 264-BYNDR | 720p | zilean
default	16:02:00.466818-0500	RedLemon	   INPUT[68]: Weapons 2025 x265 WEB-DL 2160p HDR-DV mkv | 2160p | zilean
default	16:02:00.467026-0500	RedLemon	   INPUT[69]: Weapons 2025 PL HDR AI UP 2160p HDTS AC3-ChrisVPS | 2160p | zilean
default	16:02:00.467294-0500	RedLemon	   INPUT[70]: Weapons 2025 MULTi 2160p WEB-DL DDP5 1 DV HDR HEVC-KiT | 2160p | zilean
default	16:02:00.467570-0500	RedLemon	   INPUT[71]: Weapons 2025 4K HDR DV 2160p WEBDL Ita Eng x265-NAHOM mkv | 2160p | zilean
default	16:02:00.468070-0500	RedLemon	   INPUT[72]: Weapons 2025 2160p iT WEB-DL DV P5 MULTi[Ben The Men] mp4 | 2160p | zilean
default	16:02:00.468400-0500	RedLemon	   INPUT[73]: Weapons 2025 NORDiC REPACK 2160p WEB-DL DDP5 1 Atmos DV HDR H 265-BANDOLEROS mkv | 2160p | zilean
default	16:02:00.469307-0500	RedLemon	   INPUT[74]: Weapons 2025 MULTi 2160p iT WEB-DL DDP5 1 DV HDR H 265-R22 mkv | 2160p | zilean
default	16:02:00.470213-0500	RedLemon	   INPUT[75]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264 mkv | 1080p | zilean
default	16:02:00.470788-0500	RedLemon	   INPUT[76]: Weapons 2025 WEB-DL 2160p HDR Dolby 10bit mkv | 2160p | zilean
default	16:02:00.472340-0500	RedLemon	   INPUT[77]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264-BYNDR mkv | 1080p | zilean
default	16:02:00.472929-0500	RedLemon	   INPUT[78]: Weapons 2025 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:02:00.473911-0500	RedLemon	   INPUT[79]: Weapons 2025 2160p iT WEB-DL DDP5 1 Atmos DV H 265-BYNDR | 2160p | zilean
default	16:02:00.474138-0500	RedLemon	   INPUT[80]: Weapons 2025 REPACK 2160p iT WEB-DL DDP5 1 Atmos DV H 265-BYNDR | 2160p | zilean
default	16:02:00.474318-0500	RedLemon	   INPUT[81]: Weapons 2025 MULTi iNTERNAL UHD BluRay 2160p TrueHD Atmos 7 1 DV HDR10 REMUX-seedpool mkv | 2160p | zilean
default	16:02:00.474474-0500	RedLemon	   INPUT[82]: Weapons 2025 2160p UHD Blu-ray Remux DV HDR HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:02:00.474630-0500	RedLemon	   INPUT[83]: Weapons 2025 Hybrid 2160p UHD Blu-ray Remux DV HDR10plus HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:02:00.474746-0500	RedLemon	   INPUT[84]: Weapons 2025 1080p TSHD (DVO Колодій Трейлерів + місіс kor0bochkina) mkv | 1080p | zilean
default	16:02:00.474910-0500	RedLemon	   INPUT[85]: Weapons 2025 1080p 10bit WEBRip 6CH X265 HEVC-PSA mkv | 1080p | zilean
default	16:02:00.475375-0500	RedLemon	   INPUT[86]: Weapons 2025 1080p DS4K WEBRip 10Bit DDP5 1 Atmos x265-NeoNoir mkv | 1080p | zilean
default	16:02:00.475564-0500	RedLemon	   INPUT[87]: Weapons 2025 PLSUBBED 720p WEB-DL XviD AC3-R22 avi | 720p | zilean
default	16:02:00.475708-0500	RedLemon	   INPUT[88]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264-BYNDR mkv | 1080p | zilean
default	16:02:00.475908-0500	RedLemon	   INPUT[89]: Weapons 2025 REPACK 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:02:00.476059-0500	RedLemon	   INPUT[90]: Weapons 2025 1080p WEBRip DV HDR10  DDP Atmos 5 1 x265-FZHD mkv | 1080p | zilean
default	16:02:00.476221-0500	RedLemon	   INPUT[91]: Weapons (2025) [1080p] [WEBRip] [5 1] [YTS MX] | 1080p | zilean
default	16:02:00.476558-0500	RedLemon	   INPUT[92]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:02:00.476752-0500	RedLemon	   INPUT[93]: Weapons 2025 Hybrid 2160p MA WEB-DL DDP5 1 Atmos DV HDR10P H 265-7HOTDOGS mkv | 2160p | zilean
default	16:02:00.477022-0500	RedLemon	   INPUT[94]: Weapons 2025 MULTi 1080p AMZN WEB-DL x264 AC3-KiT mkv | 1080p | zilean
default	16:02:00.477407-0500	RedLemon	   INPUT[95]: Weapons 2025 MULTi 2160p WEB-DL DDP5 1 DV HDR HEVC-KiT mkv | 2160p | zilean
default	16:02:00.477618-0500	RedLemon	   INPUT[96]: Weapons 2025 2160p iT WEB-DL DV HDR10+[Ben The Men] mp4 | 2160p | zilean
default	16:02:00.477778-0500	RedLemon	   INPUT[97]: Weapons 2025 Ger Eng DL EAC3 2160p MA DV HDR WEB H265-ZeroTwo mkv | 2160p | zilean
default	16:02:00.478144-0500	RedLemon	   INPUT[98]: Weapons 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	16:02:00.478298-0500	RedLemon	   INPUT[99]: Weapons 2025 2160p iT WEB-DL DV HDR10+[Ben The Men] mp4 | 2160p | zilean
default	16:02:00.478446-0500	RedLemon	   INPUT[100]: Weapons 2025 REPACK 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:02:00.478590-0500	RedLemon	   INPUT[101]: Weapons 2025 MULTi 1080p 10bit WEB-DL DD5 1 x265 HEVC-AdL mkv | 1080p | zilean
default	16:02:00.478734-0500	RedLemon	   INPUT[102]: Weapons (2025) (1080p MA WEB-DL x265 10bit EAC3 Atmos 5 1 Ghost) | 1080p | zilean
default	16:02:00.478874-0500	RedLemon	   INPUT[103]: Weapons 2025 1080p HDTS x264 UA-EN mkv | 1080p | zilean
default	16:02:00.479029-0500	RedLemon	   INPUT[104]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264 DUAL-BiOMA mkv | 1080p | zilean
default	16:02:00.485433-0500	RedLemon	   INPUT[105]: Weapons (2025) En 1080p HDR10  X265 HEVC 10 bit mkv | 1080p | zilean
default	16:02:00.485995-0500	RedLemon	   INPUT[106]: Weapons (2025) En 2160p UHD HDR10  X265 HEVC 10 bit | 2160p | zilean
default	16:02:00.486238-0500	RedLemon	   INPUT[107]: Weapons (2025) En 1080p X265 HEVC 10 bit | 1080p | zilean
default	16:02:00.486912-0500	RedLemon	   INPUT[108]: Weapons [2025] mkv | Unknown | zilean
default	16:02:00.487128-0500	RedLemon	   INPUT[109]: Weapons 2025 1080p TS EN-RGB | 1080p | zilean
default	16:02:00.487432-0500	RedLemon	   INPUT[110]: Weapons.2025.2160p.HMAX.WEB-DL.DUAL.DDP5.1.Atmos.DoVi.HDR.H.265-TURG
👤 29 💾 8.33 GB ⚙️ ThePirateBay
Dual Audio | 2160p | torrentio
default	16:02:00.487706-0500	RedLemon	   INPUT[111]: Weapons.2025.bluray.hdr.2160p.av1-7.1.opus-Dust
👤 15 💾 3.19 GB ⚙️ 1337x | 2160p | torrentio
default	16:02:00.487912-0500	RedLemon	   INPUT[112]: Weapons (2025) 2160p H265 BluRay Rip 10 bit DV HDR10+ ita eng AC3 5.1 sub ita eng NUeng Licdom
👤 13 💾 2.91 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:02:00.488167-0500	RedLemon	   INPUT[113]: Weapons (2025) 2160p H265 HDR10 DV iTA EnG AC3 Sub iTA EnG-MIRCrew
👤 11 💾 3.57 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:02:00.488363-0500	RedLemon	   INPUT[114]: Weapons 2025 UHD BluRay 2160p HDR10 DV HEVC TrueHD Atmos 7.1 x265-E
👤 9 💾 26.84 GB ⚙️ 1337x | 2160p | torrentio
default	16:02:00.488580-0500	RedLemon	   INPUT[115]: A.Hora.do.Mal.2025.WEB-DL.2160p.DV.HDR10 .x265.DUAL.5.1-SF
👤 7 💾 23.13 GB ⚙️ BluDV
Dual Audio / 🇬🇧 / 🇵🇹 | 2160p | torrentio
default	16:02:00.489101-0500	RedLemon	   INPUT[116]: La.hora.de.la.desaparicion.2025.WEB-DL.4k.HDR-Dual-Lat
👤 6 💾 22.63 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | Unknown | torrentio
default	16:02:00.489883-0500	RedLemon	   INPUT[117]: Weapons.2025.Hybrid.2160p.WEB-DL.DV.HDR.DDP5.1.Atmos.H265-AOC
👤 5 💾 22.66 GB ⚙️ 1337x | 2160p | torrentio
default	16:02:00.490231-0500	RedLemon	   INPUT[118]: Орудия / Weapons (2025) WEB-DL-HEVC 2160p от ELEKTRI4KA | 4K | SDR | D P A | Movie Dubbing Red Head Sound HDrezka Studio Сербин
👤 34 💾 15.53 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 2160p | torrentio
default	16:02:00.490343-0500	RedLemon	   INPUT[119]: Weapons (La hora de la desaparicion) (2025) [4k 2160p][Esp]
👤 26 💾 23.53 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	16:02:00.490441-0500	RedLemon	   INPUT[120]: Weapons.2025.UHD.2160p.10bit.iTunes.WEBRip.AV1.English.DDP5.1.ESubs-DaddyCooL
👤 17 💾 4.91 GB ⚙️ 1337x | 2160p | torrentio
default	16:02:00.490571-0500	RedLemon	   INPUT[121]: Weapons.2025.2160p.iT.WEB-DL.SDR.ENG.LATINO.DDP5.1.H265.MP4-BTM
👤 7 💾 12.47 GB ⚙️ ThePirateBay
Multi Audio / 🇬🇧 / 🇲🇽 | 2160p | torrentio
default	16:02:00.490672-0500	RedLemon	   INPUT[122]: Weapons 2025 UHD BluRay 1080p DD Atmos 5 1 DoVi HDR10 x265-SM737
👤 25 💾 5.69 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.491770-0500	RedLemon	   INPUT[123]: Weapons.2025.1080p.MA.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 112 💾 1.74 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.492062-0500	RedLemon	   INPUT[124]: Weapons 2025 1080p BluRay
👤 100 💾 2.37 GB ⚙️ YTS | 1080p | torrentio
default	16:02:00.492449-0500	RedLemon	   INPUT[125]: Weapons 2025 1080p WEBRip
👤 100 💾 2.15 GB ⚙️ YTS | 1080p | torrentio
default	16:02:00.492578-0500	RedLemon	   INPUT[126]: Weapons 2025 REPACK 1080p WEB-DL HEVC x265-RMTeam
👤 88 💾 1.35 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:00.492680-0500	RedLemon	   INPUT[127]: A.Hora.do.Mal.2025.1080p.FULL.HD.WEB-DL.DUAL.5.1
👤 84 💾 7.59 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:02:00.492795-0500	RedLemon	   INPUT[128]: A Hora do Mal 2025 WEB-DL 1080p x264 DUAL 5.1
👤 53 💾 2.94 GB ⚙️ BluDV
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:02:00.492887-0500	RedLemon	   INPUT[129]: Weapons.2025.1080p.WEB-DL.MA.h265.EAC3
👤 44 💾 7.58 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:00.493110-0500	RedLemon	   INPUT[130]: Weapons (2025) Eng 1080p WEBRip x264 AAC ESub
👤 42 💾 1.98 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:00.493222-0500	RedLemon	   INPUT[131]: Weapons (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 33 💾 2.89 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:02:00.493396-0500	RedLemon	   INPUT[132]: Weapons.2025.iTA-ENG.Bluray.1080p.x264-CYBER.mkv
👤 31 💾 8.79 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:02:00.493495-0500	RedLemon	   INPUT[133]: Weapons 2025 1080p REPACK WEBRip DDP 5 1 Atmos 10bit H 265-iVy
👤 21 💾 1.83 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.493587-0500	RedLemon	   INPUT[134]: Weapons (La hora de la desaparicion) (2025) [Bluray 1080p][Esp]
👤 18 💾 7.83 GB ⚙️ Wolfmax4k
🇪🇸 | 1080p | torrentio
default	16:02:00.493679-0500	RedLemon	   INPUT[135]: Weapons.2025.MULTi.VF2.1080p.WEB.H264-SUPPLY.mkv
👤 18 💾 8.17 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	16:02:00.493765-0500	RedLemon	   INPUT[136]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264-BYNDR
👤 16 💾 7.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.493897-0500	RedLemon	   INPUT[137]: Weapons.2025.1080p.ITA-ENG-SPA.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 13 💾 1.45 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 / 🇪🇸 | 1080p | torrentio
default	16:02:00.493985-0500	RedLemon	   INPUT[138]: Weapons 2025 1080p Blu-Ray HEVC x265 10Bit DDP5.1 Subs KINGDOM
👤 11 💾 6.09 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:00.494302-0500	RedLemon	   INPUT[139]: A.Hora.do.Mal.2025.1080p.WEB-DL.DUAL.5.1
👤 11 💾 2.94 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:02:00.494837-0500	RedLemon	   INPUT[140]: Weapons 2025 1080p BluRay x265 HEVC 10bit AAC 7 1 HeVK Zach C
👤 10 💾 12.29 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	16:02:00.495193-0500	RedLemon	   INPUT[141]: Weapons 2025 1080p WEB-DL HEVC x265 10Bit DDP5.1 Subs KINGDOM
👤 8 💾 6.25 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:00.495353-0500	RedLemon	   INPUT[142]: Weapons 2025 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR
👤 8 💾 7.64 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.496932-0500	RedLemon	   INPUT[143]: Weapons 2025 1080p WebRip EAC3 5 1 x265-Lootera
👤 8 💾 2.62 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.498433-0500	RedLemon	   INPUT[144]: Weapons 2025 1080p WEB-Rip HEVC x265 10Bit DDP5 1 Subs KINGDOM
Weapons 2025 1080p WEB-Rip  HEVC x265 10Bit DDP5 1 Subs KINGDOM.mkv
👤 7 💾 6.25 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.498778-0500	RedLemon	   INPUT[145]: Weapons.2025.1080p.HMAX.WEB-DL.DUAL.DDP5.1.Atmos.H.265-TURG
👤 6 💾 3.46 GB ⚙️ ThePirateBay
Dual Audio | 1080p | torrentio
default	16:02:00.498940-0500	RedLemon	   INPUT[146]: Weapons 2025 1080p WEB-Rip HEVC x265 10Bit DDP5 1 Subs KINGDOM
👤 6 💾 6.25 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.499130-0500	RedLemon	   INPUT[147]: Veliki.paket.titlovanih.filmova.2025.14.1080p.x264.[ExYuSubs] ⭐
Weapons.2025.1080p.WEBRip.x264.[ExYuSubs]/Weapons.2025.1080p.WEBRip.x264.[ExYuSubs].mp4
👤 5 💾 2.01 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.499572-0500	RedLemon	   INPUT[148]: Weapons.2025.1080p.Blu-ray.Remux.AVC.TrueHD.Atmos.7.1-CiNEPHiLES
👤 5 💾 29.87 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:00.499927-0500	RedLemon	   INPUT[149]: Weapons 2025 1080p BluRay x265-YAWNTiC
👤 5 💾 7.83 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.500091-0500	RedLemon	   INPUT[150]: Орудия / Weapons (2025) WEB-DLRip 1080p | D P A | Movie Dubbing HDrezka Studio Сербин
👤 5 💾 16.32 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:02:00.500379-0500	RedLemon	   INPUT[151]: Weapons 2025 REPACK 1080p WEB-DL HEVC x265-RMTeam
👤 5 💾 1.35 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.500766-0500	RedLemon	   INPUT[152]: Weapons 2025 1080p MA WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 5 💾 1.74 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.500937-0500	RedLemon	   INPUT[153]: Weapons 2025 720p BluRay
👤 100 💾 1.15 GB ⚙️ YTS | 720p | torrentio
default	16:02:00.501386-0500	RedLemon	   INPUT[154]: Weapons 2025 720p WEBRip
👤 100 💾 1.15 GB ⚙️ YTS | 720p | torrentio
default	16:02:00.501946-0500	RedLemon	   INPUT[155]: Орудия / Weapons (2025) BDRip 720p от DoMiNo & селезень | D | Movie Dubbing Red Head Sound
👤 36 💾 5.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:02:00.502621-0500	RedLemon	   INPUT[156]: Weapons (La hora de la desaparicion) (2025) [Bluray 720p][Esp]
👤 36 💾 3.34 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	16:02:00.503215-0500	RedLemon	   INPUT[157]: Weapons.2025.TRUEFRENCH.VF2.720p.WEB.H264-SUPPLY.mkv
👤 32 💾 3.68 GB ⚙️ Torrent9
🇫🇷 | 720p | torrentio
default	16:02:00.504702-0500	RedLemon	   INPUT[158]: Орудия / Weapons (2025) WEB-DL 720p от селезень | D | Movie Dubbing Red Head Sound
👤 26 💾 4.03 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:02:00.505393-0500	RedLemon	   INPUT[159]: Орудия / Weapons (2025) WEB-DL 720p от селезень | P | HDrezka Studio
👤 23 💾 3.45 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:02:00.506546-0500	RedLemon	   INPUT[160]: Орудия / Weapons (2025) WEB-DLRip 720p | D P A
👤 16 💾 7.02 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:02:00.506685-0500	RedLemon	   INPUT[161]: Weapons (2025) 720p WEBRip-LAMA
👤 7 💾 1.15 GB ⚙️ ThePirateBay | 720p | torrentio
default	16:02:00.506805-0500	RedLemon	   INPUT[162]: Weapons 2025 576p WEBRip x265 AAC-SSN
👤 5 💾 1.57 GB ⚙️ ThePirateBay | Unknown | torrentio
default	16:02:00.507179-0500	RedLemon	   INPUT[163]: Weapons 2025 1080p TS EN-RGB
👤 28 💾 5.77 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.507296-0500	RedLemon	   INPUT[164]: Weapons 2025 1080p TELESYNC x264-RGB
👤 11 💾 5.77 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:00.507405-0500	RedLemon	   INPUT[165]: Weapons.2025.1080p.TELESYNC.V2.MULTi.x264-SyncUP
👤 7 💾 6.07 GB ⚙️ ThePirateBay
Multi Audio | 1080p | torrentio
default	16:02:00.507513-0500	RedLemon	   INPUT[166]: Weapons.2025.FRENCH.VF2.WEBRip.x264-LACTEL.mkv
👤 96 💾 1.22 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	16:02:00.507630-0500	RedLemon	   INPUT[167]: Орудия / Weapons (2025) WEB-DLRip-AVC от DoMiNo & селезень | P | HDrezka Studio
👤 94 💾 2.29 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:02:00.507744-0500	RedLemon	   INPUT[168]: Орудия / Weapons (2025) BDRip-AVC от селезень | D | Movie Dubbing Red Head Sound
👤 75 💾 2.35 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:02:00.510600-0500	RedLemon	   INPUT[169]: Орудия / Weapons (2025) WEB-DLRip от ELEKTRI4KA | D | Movie Dubbing
👤 44 💾 1.46 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:02:00.511574-0500	RedLemon	   INPUT[170]: Орудия / Weapons (2025) WEB-DLRip от ELEKTRI4KA | P | HDrezka Studio
👤 30 💾 1.47 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:02:00.511816-0500	RedLemon	   INPUT[171]: Орудия / Weapons (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Movie Dubbing Red Head Sound
👤 27 💾 2.29 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:02:00.512010-0500	RedLemon	   INPUT[172]: Орудия / Weapons (2025) WEB-DLRip от DoMiNo & селезень | D | Red Head Sound
👤 14 💾 1.46 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:02:00.512388-0500	RedLemon	   INPUT[173]: Орудия / Weapons (2025) HDRip-AVC от ExKinoRay | D | Red Head Sound
👤 9 💾 745.46 MB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:02:00.512559-0500	RedLemon	   INPUT[174]: Орудия / Weapons (2025) BDRip от MegaPeer | D | Movie Dubbing
👤 6 💾 1.46 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:02:00.512996-0500	RedLemon	   INPUT[175]: Орудия / Weapons (2025) WEB-DLRip-AVC от DoMiNo & селезень | Sub
👤 5 💾 1.95 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:02:00.513149-0500	RedLemon	   INPUT[176]: Weapons (2025) SD H264 MP4 ITA [HD4ME]
👤 5 💾 713.92 MB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | Unknown | torrentio
default	16:02:00.513252-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 2160p | 2160p | comet
default	16:02:00.513341-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 2160p | 2160p | comet
default	16:02:00.513511-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 2160p | 2160p | comet
default	16:02:00.514631-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 2160p | 2160p | comet
default	16:02:00.514806-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 2160p | 2160p | comet
default	16:02:00.514925-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	16:02:00.515027-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	16:02:00.515120-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	16:02:00.515235-0500	RedLemon	🔍 Searching SubDL for subtitles: tt26581740 (movie)
default	16:02:00.515480-0500	RedLemon	Task <13DA7517-9180-4CC5-A302-01A1C0BD1C34>.<386> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:02:00.520539-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [59AB85BE-AC63-444C-9652-1917D3F9143C] (reporting strategy default)> on Task <13DA7517-9180-4CC5-A302-01A1C0BD1C34>.<386> was not selected for reporting
default	16:02:00.520929-0500	RedLemon	🎬 Guest: Starting playback after database fallback detection
default	16:02:00.521068-0500	RedLemon	🎬 Guest: Launching player via database fallback
default	16:02:00.521161-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	16:02:00.521415-0500	RedLemon	   Quality: 1080p
default	16:02:00.521619-0500	RedLemon	   Mode: watchParty
default	16:02:00.521727-0500	RedLemon	📡 Fetching metadata for tt26581740...
default	16:02:00.521903-0500	RedLemon	Task <13DA7517-9180-4CC5-A302-01A1C0BD1C34>.<386> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:00.522300-0500	RedLemon	Task <13DA7517-9180-4CC5-A302-01A1C0BD1C34>.<386> now using Connection 17
default	16:02:00.529329-0500	RedLemon	0x7f862e261fa8 ID=8 Task <13DA7517-9180-4CC5-A302-01A1C0BD1C34>.<386> sent request, body N 0
default	16:02:00.595225-0500	runningboardd	Invalidating assertion 169-5311-1026 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:00.623691-0500	RedLemon	✅ StreamService: Using provided metadata: Weapons
default	16:02:00.623802-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	16:02:00.623889-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt26581740, type=movie, year=2025
default	16:02:00.624300-0500	RedLemon	Task <118AE513-342A-49DD-BD0F-7B21E98141A4>.<25> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	16:02:00.624659-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [88246213-92E3-4D29-802A-DCD48FCEC812] (reporting strategy default)> on Task <118AE513-342A-49DD-BD0F-7B21E98141A4>.<25> was not selected for reporting
default	16:02:00.625574-0500	RedLemon	Connection 30: starting, TC(0x0)
default	16:02:00.625674-0500	RedLemon	[C30 E23A00D1-3B0F-4E60-9696-919BFD0CE734 127.0.0.1:47253 tcp, url hash: c280ff71, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{08570D34-4CCC-4689-AAE7-3DB77F1878CD}{(null)}{Y}{2} (private), proc: E8E931A4-3EA4-3070-8D28-FBFFFC7A0E59] start
default	16:02:00.625730-0500	RedLemon	[C30 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	16:02:00.625823-0500	RedLemon	[C30 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.000s, uuid: 1A83A3C6-4492-4D94-93EE-447AF901F060
default	16:02:00.626214-0500	RedLemon	[C30 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.000s
default	16:02:00.626249-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C30] reporting state preparing
default	16:02:00.626435-0500	RedLemon	Task <118AE513-342A-49DD-BD0F-7B21E98141A4>.<25> setting up Connection 30
default	16:02:00.626992-0500	RedLemon	nw_socket_handle_socket_event [C30:2] Socket received CONNECTED event
default	16:02:00.627137-0500	RedLemon	nw_flow_connected [C30 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	16:02:00.627196-0500	RedLemon	[C30 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.001s
default	16:02:00.627245-0500	RedLemon	nw_flow_connected [C30 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-88486127)
default	16:02:00.627449-0500	RedLemon	[C30 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.001s
default	16:02:00.627583-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C30] reporting state ready
default	16:02:00.627633-0500	RedLemon	[C30 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.001s
default	16:02:00.627690-0500	RedLemon	Connection 30: connected successfully
default	16:02:00.627794-0500	RedLemon	Connection 30: ready C(N) E(N)
default	16:02:00.627954-0500	RedLemon	Task <118AE513-342A-49DD-BD0F-7B21E98141A4>.<25> now using Connection 30
default	16:02:00.628036-0500	RedLemon	Connection 30: received viability advisory(Y)
default	16:02:00.628230-0500	RedLemon	Task <118AE513-342A-49DD-BD0F-7B21E98141A4>.<25> sent request, body N 0
default	16:02:00.635705-0500	RedLemon	Task <049E775C-0916-4C28-88B2-0CEA1CD69617>.<387> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	16:02:00.638791-0500	RedLemon	Task <F0C9DA68-189C-402F-8C65-011CC27693ED>.<388> resuming, timeouts(20.0, 604800.0) QOS(0x15) Voucher (null)
default	16:02:00.642311-0500	RedLemon	Task <7B26123A-82FB-4D92-856D-BF8460CD84EE>.<389> resuming, timeouts(20.0, 604800.0) QOS(0x15) Voucher (null)
default	16:02:00.643089-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [814D86D7-D5AB-407E-9612-1D31A72B596D] (reporting strategy default)> on Task <049E775C-0916-4C28-88B2-0CEA1CD69617>.<387> was not selected for reporting
default	16:02:00.642965-0500	RedLemon	Task <AFB11107-3470-492A-B86A-18CD253B7530>.<390> resuming, timeouts(20.0, 604800.0) QOS(0x15) Voucher (null)
default	16:02:00.644303-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [70125641-8A49-4535-ACA8-7D3AB36F69AC] (reporting strategy default)> on Task <F0C9DA68-189C-402F-8C65-011CC27693ED>.<388> was not selected for reporting
default	16:02:00.645368-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AF3C1AC2-65F3-478E-B97C-47A583CF2D0D] (reporting strategy default)> on Task <7B26123A-82FB-4D92-856D-BF8460CD84EE>.<389> was not selected for reporting
default	16:02:00.645698-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [38D03044-C01F-4F1E-A0AC-16ADC08C680F] (reporting strategy default)> on Task <AFB11107-3470-492A-B86A-18CD253B7530>.<390> was not selected for reporting
default	16:02:00.651926-0500	RedLemon	Task <049E775C-0916-4C28-88B2-0CEA1CD69617>.<387> summary for task success {transaction_duration_ms=5, response_status=200, cache_hit=true}
default	16:02:00.651940-0500	RedLemon	Task <7B26123A-82FB-4D92-856D-BF8460CD84EE>.<389> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:00.652194-0500	RedLemon	Task <7B26123A-82FB-4D92-856D-BF8460CD84EE>.<389> now using Connection 16
default	16:02:00.652259-0500	RedLemon	Task <049E775C-0916-4C28-88B2-0CEA1CD69617>.<387> finished successfully
default	16:02:00.652503-0500	RedLemon	Task <7B26123A-82FB-4D92-856D-BF8460CD84EE>.<389> sent request, body N 0
default	16:02:00.653744-0500	RedLemon	Task <F0C9DA68-189C-402F-8C65-011CC27693ED>.<388> summary for task success {transaction_duration_ms=4, response_status=200, cache_hit=true}
default	16:02:00.654123-0500	RedLemon	Task <F0C9DA68-189C-402F-8C65-011CC27693ED>.<388> finished successfully
default	16:02:00.654696-0500	RedLemon	Task <AFB11107-3470-492A-B86A-18CD253B7530>.<390> summary for task success {transaction_duration_ms=3, response_status=200, cache_hit=true}
default	16:02:00.655098-0500	RedLemon	Task <AFB11107-3470-492A-B86A-18CD253B7530>.<390> finished successfully
default	16:02:00.658524-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1028 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:00.658839-0500	runningboardd	Assertion 169-5311-1028 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:00.660742-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:00.660887-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:00.661047-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:00.661429-0500	runningboardd	Attempting to rename power assertion 33546 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1026:com.apple.CFNetwork.StorageDB;169-5311-1028:com.apple.CFNetwork.StorageDB
default	16:02:00.751616-0500	runningboardd	Attempting to rename power assertion 33546 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1028:com.apple.CFNetwork.StorageDB
default	16:02:00.751730-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:00.751832-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:00.751912-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:01.563940-0500	RedLemon	Task <7B26123A-82FB-4D92-856D-BF8460CD84EE>.<389> received response, status 200 content U
default	16:02:01.564155-0500	RedLemon	Task <7B26123A-82FB-4D92-856D-BF8460CD84EE>.<389> done using Connection 16
default	16:02:01.564623-0500	RedLemon	Task <7B26123A-82FB-4D92-856D-BF8460CD84EE>.<389> response ended
default	16:02:01.564904-0500	RedLemon	Task <7B26123A-82FB-4D92-856D-BF8460CD84EE>.<389> summary for task success {transaction_duration_ms=914, response_status=200, connection=16, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=913, response_duration_ms=0, request_bytes=484, response_bytes=2121, cache_hit=true}
default	16:02:01.565254-0500	RedLemon	Task <7B26123A-82FB-4D92-856D-BF8460CD84EE>.<389> finished successfully
default	16:02:01.568380-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 185
default	16:02:01.568654-0500	RedLemon	   INPUT[0]: Weapons 2025 UHD BluRay 2160p DDP Atmos 5 1 DV HDR10Plus x265-hallowed mkv | 2160p | zilean
default	16:02:01.568927-0500	RedLemon	   INPUT[1]: Weapons 2025 Hybrid 2160p UHD BluRay TrueHD Atmos 7 1 DV HDR10+ x265-j3rico mkv | 2160p | zilean
default	16:02:01.569118-0500	RedLemon	   INPUT[2]: Weapons 2025 MULTi FRENCH VF2 HDR DV 2160p WEB H265-SUPPLY mkv | 2160p | zilean
default	16:02:01.569322-0500	RedLemon	   INPUT[3]: Weapons 2025 2160p WEB-DL DV-TheEqualizer mp4 | 2160p | zilean
default	16:02:01.569530-0500	RedLemon	   INPUT[4]: Weapons 2025 NORDiC PROPER 2160p SDR WEB-DL DDP5 1 Atmos H 265-NorTekst mkv | 2160p | zilean
default	16:02:01.569907-0500	RedLemon	   INPUT[5]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RUS SUB mkv | 2160p | zilean
default	16:02:01.570291-0500	RedLemon	   INPUT[6]: Weapons 2025 2160p WEB-DL DDP5 1 Atmos SDR H265-AOC | 2160p | zilean
default	16:02:01.570549-0500	RedLemon	   INPUT[7]: Weapons 2025 2160p AMZN WEB-DL DDP5 1 H 265-BYNDR mkv | 2160p | zilean
default	16:02:01.570827-0500	RedLemon	   INPUT[8]: Weapons 2025 2160p iTunes WEB-DL DD5 1 DV H 265-DreamHD mkv | 2160p | zilean
default	16:02:01.571024-0500	RedLemon	   INPUT[9]: Weapons 2025 2160p UHD Blu-ray Remux DV HDR HEVC TrueHD Atmos 7 1-CiNEPHiLES | 2160p | zilean
default	16:02:01.571196-0500	RedLemon	   INPUT[10]: Weapons 2025 2160p UHD Remux HEVC DoVi TrueHD Atmos 7 1-playBD | 2160p | zilean
default	16:02:01.571361-0500	RedLemon	   INPUT[11]: Weapons (2025) MA WEB-DL 2160p HDR 2xUkr Eng [Hurtom] v2 mkv | 2160p | zilean
default	16:02:01.571532-0500	RedLemon	   INPUT[12]: Weapons 2025 MULTi VF2 HDR DV 2160p WEB H265-SUPPLY | 2160p | zilean
default	16:02:01.571702-0500	RedLemon	   INPUT[13]: Weapons 2025 2160p MA WEB-DL DV HDR TYMBLER mkv | 2160p | zilean
default	16:02:01.571871-0500	RedLemon	   INPUT[14]: Weapons 2025 MULTi VF2 HDR 2160p WEB H265-SUPPLY | 2160p | zilean
default	16:02:01.572036-0500	RedLemon	   INPUT[15]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265 mkv | 2160p | zilean
default	16:02:01.572192-0500	RedLemon	   INPUT[16]: Weapons 2025 iTA-ENG WEBDL 2160p HEVC HDR x265-CYBER mkv | 2160p | zilean
default	16:02:01.572345-0500	RedLemon	   INPUT[17]: Weapons 2025 2160p MA WEB-DL HDR H 265 Master5 mkv | 2160p | zilean
default	16:02:01.572501-0500	RedLemon	   INPUT[18]: Weapons 2025 1080p Blu-ray Remux AVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 1080p | zilean
default	16:02:01.572737-0500	RedLemon	   INPUT[19]: Weapons 2025 720p AMZN WEB-DL DDP5 1 H 264 mkv | 720p | zilean
default	16:02:01.573025-0500	RedLemon	   INPUT[20]: Weapons 2025 UHD BluRay 2160p TrueHD Atmos 7 1 DV HEVC REMUX-FraMeSToR | 2160p | zilean
default	16:02:01.573268-0500	RedLemon	   INPUT[21]: Weapons (2025) En 1080p X265 HEVC 10 bit | 1080p | zilean
default	16:02:01.573580-0500	RedLemon	   INPUT[22]: Weapons 2025 1080p HD x264 ENG YG iso | 1080p | zilean
default	16:02:01.575185-0500	RedLemon	   INPUT[23]: Weapons 2025 2160p HDR10Plus DV WEBRip 6CH x265 HEVC-PSA | 2160p | zilean
default	16:02:01.575432-0500	RedLemon	   INPUT[24]: Weapons 2025 Dub WEB-DLRip-AVC ExKinoRay mkv | Unknown | zilean
default	16:02:01.575921-0500	RedLemon	   INPUT[25]: Weapons 2025 1080p WEBRip DD5 1 10bits x265-Rapta mkv | 1080p | zilean
default	16:02:01.576136-0500	RedLemon	   INPUT[26]: Weapons 2025 iTA-ENG WEBDL 1080p x264-CYBER mkv | 1080p | zilean
default	16:02:01.576312-0500	RedLemon	   INPUT[27]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265 DUAL-C76 mkv | 2160p | zilean
default	16:02:01.576478-0500	RedLemon	   INPUT[28]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:02:01.576632-0500	RedLemon	   INPUT[29]: Weapons 2025 1080p HDTS x264 ENG YG mkv | 1080p | zilean
default	16:02:01.577083-0500	RedLemon	   INPUT[30]: Weapons 2025 1080p ITA-ENG MULTI WEBRip x264 AAC-V3SP4EV3R mkv | 1080p | zilean
default	16:02:01.577483-0500	RedLemon	   INPUT[31]: Weapons 2025 Hybrid 2160p UHD Blu-ray Remux DV HDR10plus HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:02:01.577683-0500	RedLemon	   INPUT[32]: Weapons 2025 MULTi VF2 1080p WEB H264-SUPPLY | 1080p | zilean
default	16:02:01.577855-0500	RedLemon	   INPUT[33]: Weapons 2025 1080p HD x264 ENG YG iso | 1080p | zilean
default	16:02:01.578016-0500	RedLemon	   INPUT[34]: Weapons 2025 MULTi 2160p UHD BluRay REMUX DV HDR HEVC TrueHD Atmos 7 1-R22 | 2160p | zilean
default	16:02:01.578181-0500	RedLemon	   INPUT[35]: Weapons 2025 2160p BDRemux HEVC HDR DV TrueHD Atmos 7 1-DaTmoSX | 2160p | zilean
default	16:02:01.578330-0500	RedLemon	   INPUT[36]: Weapons 2025 WEB-DL 2160p DD5 1 Atmos DV HDR-DVT mkv | 2160p | zilean
default	16:02:01.579865-0500	RedLemon	   INPUT[37]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:02:01.580202-0500	RedLemon	   INPUT[38]: Weapons 2025 1080p HMAX WEB-DL DDP5 1 H 265 DUAL-Potatin mkv | 1080p | zilean
default	16:02:01.580374-0500	RedLemon	   INPUT[39]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:02:01.580482-0500	RedLemon	   INPUT[40]: Weapons 2025 1080p BluRay x265-YAWNTiC mkv | 1080p | zilean
default	16:02:01.580570-0500	RedLemon	   INPUT[41]: Weapons 2025 MULTi 2160p UHD BluRay x265-SESKAPiLE mkv | 2160p | zilean
default	16:02:01.580656-0500	RedLemon	   INPUT[42]: Weapons 2025 Hybrid 2160p UHD Blu-ray Remux DV HDR10plus HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:02:01.580738-0500	RedLemon	   INPUT[43]: Weapons 2025 REPACK 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:02:01.580823-0500	RedLemon	   INPUT[44]: Weapons 2025 2160p UHD BluRay REMUX DV P7 HDR MULTi TrueHD Atmos 7 1 H265-BEN THE MEN | 2160p | zilean
default	16:02:01.580904-0500	RedLemon	   INPUT[45]: Weapons 2025 1080p 10bit BluRay 8CH X265 HEVC-PSA mkv | 1080p | zilean
default	16:02:01.584589-0500	RedLemon	   INPUT[46]: www UIndex org   -    Weapons 2025 1080p BluRay x264-OFT | 1080p | zilean
default	16:02:01.584853-0500	RedLemon	   INPUT[47]: Weapons 2025 BluRay 1080p DDP Atmos 5 1 x264-hallowed mkv | 1080p | zilean
default	16:02:01.585453-0500	RedLemon	   INPUT[48]: Weapons 2025 WEB-DL1080p mkv | 1080p | zilean
default	16:02:01.585692-0500	RedLemon	   INPUT[49]: Weapons 2025 1080p Blu-ray Remux AVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 1080p | zilean
default	16:02:01.585917-0500	RedLemon	   INPUT[50]: Weapons 2025 1080p BluRay AV1 Opus 7 1-AV1Core mkv | 1080p | zilean
default	16:02:01.586108-0500	RedLemon	   INPUT[51]: Weapons (2025) (2160p UHD BluRay x265 10bit DV HDR TrueHD Atmos 7 1 r00t) | 2160p | zilean
default	16:02:01.586729-0500	RedLemon	   INPUT[52]: Weapons (2025) (1080p BluRay x265 10bit EAC3 Atmos 7 1 Ghost) | 1080p | zilean
default	16:02:01.586973-0500	RedLemon	   INPUT[53]: Weapons 2025 MULTi 2160p UHD BluRay REMUX HEVC DV HDR TrueHD 7 1 Atmos-DSiTE | 2160p | zilean
default	16:02:01.587301-0500	RedLemon	   INPUT[54]: Weapons (2025) (2160p WEB-DL Hybrid H265 DV HDR DDP Atmos 5 1 English - HONE) mkv | 2160p | zilean
default	16:02:01.587515-0500	RedLemon	   INPUT[55]: Weapons 2025 2160p MA WEB-DL DDP5 1 Atmos DoVi HDR H 265-HONE mkv | 2160p | zilean
default	16:02:01.587723-0500	RedLemon	   INPUT[56]: Weapons (2025) [MULTi] [2160p] [iT] [WEB-DL] [DV] [HDR] [H 265] [DDP5 1-R22] [Dubbing PL i napisy PL] | 2160p | zilean
default	16:02:01.587986-0500	RedLemon	   INPUT[57]: Weapons 2025 PLDUB MULTi 2160p iT WEB-DL DoVi HDR DDP5 1 x264-P2P mkv | 2160p | zilean
default	16:02:01.589093-0500	RedLemon	   INPUT[58]: Weapons (2025) mkv | Unknown | zilean
default	16:02:01.589353-0500	RedLemon	   INPUT[59]: Weapons (2025) 2160p H265 HDR10 DV iTA EnG AC3 Sub iTA EnG-MIRCrew iso | 2160p | zilean
default	16:02:01.589543-0500	RedLemon	   INPUT[60]: Weapons [2025, WEB-DL 2160p, HDR10, Dolby Vision] [Hybrid] Dub (Movie Dubbing, RHS) + 4x MVO (HDRezka, TVShows, LostFilm, LE-Production) + AVO + Dub (Ukr) + DVO (Ukr) + Original (Eng) + Sub (Rus, Ukr, Eng) | 2160p | zilean
default	16:02:01.591629-0500	RedLemon	   INPUT[61]: Weapons 2025 x265 WEB-DL 2160p SDR mkv | 2160p | zilean
default	16:02:01.592339-0500	RedLemon	   INPUT[62]: Weapons (2025) [2160p] [YTS MX] | 2160p | zilean
default	16:02:01.592592-0500	RedLemon	   INPUT[63]: Weapons 2025 2160p WEB-DL Hybrid H265 DV HDR DDP Atmos 5 1 mkv | 2160p | zilean
default	16:02:01.592777-0500	RedLemon	   INPUT[64]: [superseed byethost7 com] Weapons 2025 PL HDR AI UP 2160p HDTS AC3-ChrisVPS mkv ts | 2160p | zilean
default	16:02:01.592956-0500	RedLemon	   INPUT[65]: Weapons 2025 1080p CAMRip LAT DUB 1XBET mp4 | 1080p | zilean
default	16:02:01.593122-0500	RedLemon	   INPUT[66]: ww UIndex org    -    Weapons 2025 720p AMZN WEB-DL DDP5 1 H 264-BYNDR | 720p | zilean
default	16:02:01.593280-0500	RedLemon	   INPUT[67]: Weapons 2025 720p MA WEB-DL DDP5 1 Atmos H 264-BYNDR | 720p | zilean
default	16:02:01.594765-0500	RedLemon	   INPUT[68]: Weapons 2025 x265 WEB-DL 2160p HDR-DV mkv | 2160p | zilean
default	16:02:01.595042-0500	RedLemon	   INPUT[69]: Weapons 2025 PL HDR AI UP 2160p HDTS AC3-ChrisVPS | 2160p | zilean
default	16:02:01.595210-0500	RedLemon	   INPUT[70]: Weapons 2025 MULTi 2160p WEB-DL DDP5 1 DV HDR HEVC-KiT | 2160p | zilean
default	16:02:01.597564-0500	RedLemon	   INPUT[71]: Weapons 2025 4K HDR DV 2160p WEBDL Ita Eng x265-NAHOM mkv | 2160p | zilean
default	16:02:01.598375-0500	RedLemon	   INPUT[72]: Weapons 2025 2160p iT WEB-DL DV P5 MULTi[Ben The Men] mp4 | 2160p | zilean
default	16:02:01.598841-0500	RedLemon	   INPUT[73]: Weapons 2025 NORDiC REPACK 2160p WEB-DL DDP5 1 Atmos DV HDR H 265-BANDOLEROS mkv | 2160p | zilean
default	16:02:01.599227-0500	RedLemon	   INPUT[74]: Weapons 2025 MULTi 2160p iT WEB-DL DDP5 1 DV HDR H 265-R22 mkv | 2160p | zilean
default	16:02:01.600317-0500	RedLemon	   INPUT[75]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264 mkv | 1080p | zilean
default	16:02:01.600591-0500	RedLemon	   INPUT[76]: Weapons 2025 WEB-DL 2160p HDR Dolby 10bit mkv | 2160p | zilean
default	16:02:01.600821-0500	RedLemon	   INPUT[77]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264-BYNDR mkv | 1080p | zilean
default	16:02:01.601238-0500	RedLemon	   INPUT[78]: Weapons 2025 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:02:01.601515-0500	RedLemon	   INPUT[79]: Weapons 2025 2160p iT WEB-DL DDP5 1 Atmos DV H 265-BYNDR | 2160p | zilean
default	16:02:01.602024-0500	RedLemon	   INPUT[80]: Weapons 2025 REPACK 2160p iT WEB-DL DDP5 1 Atmos DV H 265-BYNDR | 2160p | zilean
default	16:02:01.602377-0500	RedLemon	   INPUT[81]: Weapons 2025 MULTi iNTERNAL UHD BluRay 2160p TrueHD Atmos 7 1 DV HDR10 REMUX-seedpool mkv | 2160p | zilean
default	16:02:01.602677-0500	RedLemon	   INPUT[82]: Weapons 2025 2160p UHD Blu-ray Remux DV HDR HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:02:01.602879-0500	RedLemon	   INPUT[83]: Weapons 2025 Hybrid 2160p UHD Blu-ray Remux DV HDR10plus HEVC TrueHD Atmos 7 1-CiNEPHiLES mkv | 2160p | zilean
default	16:02:01.603256-0500	RedLemon	   INPUT[84]: Weapons 2025 1080p TSHD (DVO Колодій Трейлерів + місіс kor0bochkina) mkv | 1080p | zilean
default	16:02:01.604192-0500	RedLemon	   INPUT[85]: Weapons 2025 1080p 10bit WEBRip 6CH X265 HEVC-PSA mkv | 1080p | zilean
default	16:02:01.604615-0500	RedLemon	   INPUT[86]: Weapons 2025 1080p DS4K WEBRip 10Bit DDP5 1 Atmos x265-NeoNoir mkv | 1080p | zilean
default	16:02:01.605113-0500	RedLemon	   INPUT[87]: Weapons 2025 PLSUBBED 720p WEB-DL XviD AC3-R22 avi | 720p | zilean
default	16:02:01.605644-0500	RedLemon	   INPUT[88]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264-BYNDR mkv | 1080p | zilean
default	16:02:01.607069-0500	RedLemon	   INPUT[89]: Weapons 2025 REPACK 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:02:01.607660-0500	RedLemon	   INPUT[90]: Weapons 2025 1080p WEBRip DV HDR10  DDP Atmos 5 1 x265-FZHD mkv | 1080p | zilean
default	16:02:01.608396-0500	RedLemon	   INPUT[91]: Weapons (2025) [1080p] [WEBRip] [5 1] [YTS MX] | 1080p | zilean
default	16:02:01.608947-0500	RedLemon	   INPUT[92]: Weapons 2025 2160p iT WEB-DL DDP5 1 DV HDR H 265-RDNYB mkv | 2160p | zilean
default	16:02:01.609195-0500	RedLemon	   INPUT[93]: Weapons 2025 Hybrid 2160p MA WEB-DL DDP5 1 Atmos DV HDR10P H 265-7HOTDOGS mkv | 2160p | zilean
default	16:02:01.609416-0500	RedLemon	   INPUT[94]: Weapons 2025 MULTi 1080p AMZN WEB-DL x264 AC3-KiT mkv | 1080p | zilean
default	16:02:01.609813-0500	RedLemon	   INPUT[95]: Weapons 2025 MULTi 2160p WEB-DL DDP5 1 DV HDR HEVC-KiT mkv | 2160p | zilean
default	16:02:01.609983-0500	RedLemon	   INPUT[96]: Weapons 2025 2160p iT WEB-DL DV HDR10+[Ben The Men] mp4 | 2160p | zilean
default	16:02:01.610133-0500	RedLemon	   INPUT[97]: Weapons 2025 Ger Eng DL EAC3 2160p MA DV HDR WEB H265-ZeroTwo mkv | 2160p | zilean
default	16:02:01.610424-0500	RedLemon	   INPUT[98]: Weapons 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	16:02:01.610584-0500	RedLemon	   INPUT[99]: Weapons 2025 2160p iT WEB-DL DV HDR10+[Ben The Men] mp4 | 2160p | zilean
default	16:02:01.610718-0500	RedLemon	   INPUT[100]: Weapons 2025 REPACK 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR mkv | 1080p | zilean
default	16:02:01.610847-0500	RedLemon	   INPUT[101]: Weapons 2025 MULTi 1080p 10bit WEB-DL DD5 1 x265 HEVC-AdL mkv | 1080p | zilean
default	16:02:01.611172-0500	RedLemon	   INPUT[102]: Weapons (2025) (1080p MA WEB-DL x265 10bit EAC3 Atmos 5 1 Ghost) | 1080p | zilean
default	16:02:01.616477-0500	RedLemon	   INPUT[103]: Weapons 2025 1080p HDTS x264 UA-EN mkv | 1080p | zilean
default	16:02:01.617073-0500	RedLemon	   INPUT[104]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264 DUAL-BiOMA mkv | 1080p | zilean
default	16:02:01.617594-0500	RedLemon	   INPUT[105]: Weapons (2025) En 1080p HDR10  X265 HEVC 10 bit mkv | 1080p | zilean
default	16:02:01.617821-0500	RedLemon	   INPUT[106]: Weapons (2025) En 2160p UHD HDR10  X265 HEVC 10 bit | 2160p | zilean
default	16:02:01.618081-0500	RedLemon	   INPUT[107]: Weapons (2025) En 1080p X265 HEVC 10 bit | 1080p | zilean
default	16:02:01.618489-0500	RedLemon	   INPUT[108]: Weapons [2025] mkv | Unknown | zilean
default	16:02:01.618762-0500	RedLemon	   INPUT[109]: Weapons 2025 1080p TS EN-RGB | 1080p | zilean
default	16:02:01.618972-0500	RedLemon	   INPUT[110]: Weapons.2025.2160p.HMAX.WEB-DL.DUAL.DDP5.1.Atmos.DoVi.HDR.H.265-TURG
👤 29 💾 8.33 GB ⚙️ ThePirateBay
Dual Audio | 2160p | torrentio
default	16:02:01.619170-0500	RedLemon	   INPUT[111]: Weapons.2025.bluray.hdr.2160p.av1-7.1.opus-Dust
👤 15 💾 3.19 GB ⚙️ 1337x | 2160p | torrentio
default	16:02:01.619947-0500	RedLemon	   INPUT[112]: Weapons (2025) 2160p H265 BluRay Rip 10 bit DV HDR10+ ita eng AC3 5.1 sub ita eng NUeng Licdom
👤 13 💾 2.91 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:02:01.620532-0500	RedLemon	   INPUT[113]: Weapons (2025) 2160p H265 HDR10 DV iTA EnG AC3 Sub iTA EnG-MIRCrew
👤 11 💾 3.57 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	16:02:01.620752-0500	RedLemon	   INPUT[114]: Weapons 2025 UHD BluRay 2160p HDR10 DV HEVC TrueHD Atmos 7.1 x265-E
👤 9 💾 26.84 GB ⚙️ 1337x | 2160p | torrentio
default	16:02:01.621027-0500	RedLemon	   INPUT[115]: A.Hora.do.Mal.2025.WEB-DL.2160p.DV.HDR10 .x265.DUAL.5.1-SF
👤 7 💾 23.13 GB ⚙️ BluDV
Dual Audio / 🇬🇧 / 🇵🇹 | 2160p | torrentio
default	16:02:01.621171-0500	RedLemon	   INPUT[116]: La.hora.de.la.desaparicion.2025.WEB-DL.4k.HDR-Dual-Lat
👤 6 💾 22.63 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | Unknown | torrentio
default	16:02:01.621278-0500	RedLemon	   INPUT[117]: Weapons.2025.Hybrid.2160p.WEB-DL.DV.HDR.DDP5.1.Atmos.H265-AOC
👤 5 💾 22.66 GB ⚙️ 1337x | 2160p | torrentio
default	16:02:01.621943-0500	RedLemon	   INPUT[118]: Орудия / Weapons (2025) WEB-DL-HEVC 2160p от ELEKTRI4KA | 4K | SDR | D P A | Movie Dubbing Red Head Sound HDrezka Studio Сербин
👤 34 💾 15.53 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 2160p | torrentio
default	16:02:01.624063-0500	RedLemon	   INPUT[119]: Weapons (La hora de la desaparicion) (2025) [4k 2160p][Esp]
👤 26 💾 23.53 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	16:02:01.625046-0500	RedLemon	   INPUT[120]: Weapons.2025.UHD.2160p.10bit.iTunes.WEBRip.AV1.English.DDP5.1.ESubs-DaddyCooL
👤 17 💾 4.91 GB ⚙️ 1337x | 2160p | torrentio
default	16:02:01.625507-0500	RedLemon	   INPUT[121]: Weapons.2025.2160p.iT.WEB-DL.SDR.ENG.LATINO.DDP5.1.H265.MP4-BTM
👤 7 💾 12.47 GB ⚙️ ThePirateBay
Multi Audio / 🇬🇧 / 🇲🇽 | 2160p | torrentio
default	16:02:01.626400-0500	RedLemon	   INPUT[122]: Weapons 2025 UHD BluRay 1080p DD Atmos 5 1 DoVi HDR10 x265-SM737
👤 25 💾 5.69 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.626826-0500	RedLemon	   INPUT[123]: Weapons.2025.1080p.MA.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 112 💾 1.74 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.627285-0500	RedLemon	   INPUT[124]: Weapons 2025 1080p BluRay
👤 100 💾 2.37 GB ⚙️ YTS | 1080p | torrentio
default	16:02:01.628329-0500	RedLemon	   INPUT[125]: Weapons 2025 1080p WEBRip
👤 100 💾 2.15 GB ⚙️ YTS | 1080p | torrentio
default	16:02:01.630496-0500	RedLemon	   INPUT[126]: Weapons 2025 REPACK 1080p WEB-DL HEVC x265-RMTeam
👤 88 💾 1.35 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:01.631380-0500	RedLemon	   INPUT[127]: A.Hora.do.Mal.2025.1080p.FULL.HD.WEB-DL.DUAL.5.1
👤 84 💾 7.59 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:02:01.631742-0500	RedLemon	   INPUT[128]: A Hora do Mal 2025 WEB-DL 1080p x264 DUAL 5.1
👤 53 💾 2.94 GB ⚙️ BluDV
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:02:01.632416-0500	RedLemon	   INPUT[129]: Weapons.2025.1080p.WEB-DL.MA.h265.EAC3
👤 44 💾 7.58 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:01.632841-0500	RedLemon	   INPUT[130]: Weapons (2025) Eng 1080p WEBRip x264 AAC ESub
👤 42 💾 1.98 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:01.633177-0500	RedLemon	   INPUT[131]: Weapons (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 33 💾 2.89 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:02:01.633399-0500	RedLemon	   INPUT[132]: Weapons.2025.iTA-ENG.Bluray.1080p.x264-CYBER.mkv
👤 31 💾 8.79 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	16:02:01.634393-0500	RedLemon	   INPUT[133]: Weapons 2025 1080p REPACK WEBRip DDP 5 1 Atmos 10bit H 265-iVy
👤 21 💾 1.83 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.635998-0500	RedLemon	   INPUT[134]: Weapons (La hora de la desaparicion) (2025) [Bluray 1080p][Esp]
👤 18 💾 7.83 GB ⚙️ Wolfmax4k
🇪🇸 | 1080p | torrentio
default	16:02:01.636467-0500	RedLemon	   INPUT[135]: Weapons.2025.MULTi.VF2.1080p.WEB.H264-SUPPLY.mkv
👤 18 💾 8.17 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	16:02:01.636735-0500	RedLemon	   INPUT[136]: Weapons 2025 1080p AMZN WEB-DL DDP5 1 H 264-BYNDR
👤 16 💾 7.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.637087-0500	RedLemon	   INPUT[137]: Weapons.2025.1080p.ITA-ENG-SPA.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 13 💾 1.45 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 / 🇪🇸 | 1080p | torrentio
default	16:02:01.637597-0500	RedLemon	   INPUT[138]: Weapons 2025 1080p Blu-Ray HEVC x265 10Bit DDP5.1 Subs KINGDOM
👤 11 💾 6.09 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:01.638004-0500	RedLemon	   INPUT[139]: A.Hora.do.Mal.2025.1080p.WEB-DL.DUAL.5.1
👤 11 💾 2.94 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	16:02:01.638292-0500	RedLemon	   INPUT[140]: Weapons 2025 1080p BluRay x265 HEVC 10bit AAC 7 1 HeVK Zach C
👤 10 💾 12.29 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	16:02:01.638495-0500	RedLemon	   INPUT[141]: Weapons 2025 1080p WEB-DL HEVC x265 10Bit DDP5.1 Subs KINGDOM
👤 8 💾 6.25 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:01.638778-0500	RedLemon	   INPUT[142]: Weapons 2025 1080p MA WEB-DL DDP5 1 Atmos H 264-BYNDR
👤 8 💾 7.64 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.639044-0500	RedLemon	   INPUT[143]: Weapons 2025 1080p WebRip EAC3 5 1 x265-Lootera
👤 8 💾 2.62 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.639585-0500	RedLemon	   INPUT[144]: Weapons 2025 1080p WEB-Rip HEVC x265 10Bit DDP5 1 Subs KINGDOM
Weapons 2025 1080p WEB-Rip  HEVC x265 10Bit DDP5 1 Subs KINGDOM.mkv
👤 7 💾 6.25 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.641129-0500	RedLemon	   INPUT[145]: Weapons.2025.1080p.HMAX.WEB-DL.DUAL.DDP5.1.Atmos.H.265-TURG
👤 6 💾 3.46 GB ⚙️ ThePirateBay
Dual Audio | 1080p | torrentio
default	16:02:01.641601-0500	RedLemon	   INPUT[146]: Weapons 2025 1080p WEB-Rip HEVC x265 10Bit DDP5 1 Subs KINGDOM
👤 6 💾 6.25 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.642091-0500	RedLemon	   INPUT[147]: Veliki.paket.titlovanih.filmova.2025.14.1080p.x264.[ExYuSubs] ⭐
Weapons.2025.1080p.WEBRip.x264.[ExYuSubs]/Weapons.2025.1080p.WEBRip.x264.[ExYuSubs].mp4
👤 5 💾 2.01 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.642596-0500	RedLemon	   INPUT[148]: Weapons.2025.1080p.Blu-ray.Remux.AVC.TrueHD.Atmos.7.1-CiNEPHiLES
👤 5 💾 29.87 GB ⚙️ 1337x | 1080p | torrentio
default	16:02:01.643287-0500	RedLemon	   INPUT[149]: Weapons 2025 1080p BluRay x265-YAWNTiC
👤 5 💾 7.83 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.643534-0500	RedLemon	   INPUT[150]: Орудия / Weapons (2025) WEB-DLRip 1080p | D P A | Movie Dubbing HDrezka Studio Сербин
👤 5 💾 16.32 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	16:02:01.644165-0500	RedLemon	   INPUT[151]: Weapons 2025 REPACK 1080p WEB-DL HEVC x265-RMTeam
👤 5 💾 1.35 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.644646-0500	RedLemon	   INPUT[152]: Weapons 2025 1080p MA WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 5 💾 1.74 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.645083-0500	RedLemon	   INPUT[153]: Weapons 2025 720p BluRay
👤 100 💾 1.15 GB ⚙️ YTS | 720p | torrentio
default	16:02:01.646193-0500	RedLemon	   INPUT[154]: Weapons 2025 720p WEBRip
👤 100 💾 1.15 GB ⚙️ YTS | 720p | torrentio
default	16:02:01.651093-0500	RedLemon	   INPUT[155]: Орудия / Weapons (2025) BDRip 720p от DoMiNo & селезень | D | Movie Dubbing Red Head Sound
👤 36 💾 5.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:02:01.651401-0500	RedLemon	   INPUT[156]: Weapons (La hora de la desaparicion) (2025) [Bluray 720p][Esp]
👤 36 💾 3.34 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	16:02:01.651563-0500	RedLemon	   INPUT[157]: Weapons.2025.TRUEFRENCH.VF2.720p.WEB.H264-SUPPLY.mkv
👤 32 💾 3.68 GB ⚙️ Torrent9
🇫🇷 | 720p | torrentio
default	16:02:01.651783-0500	RedLemon	   INPUT[158]: Орудия / Weapons (2025) WEB-DL 720p от селезень | D | Movie Dubbing Red Head Sound
👤 26 💾 4.03 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:02:01.651969-0500	RedLemon	   INPUT[159]: Орудия / Weapons (2025) WEB-DL 720p от селезень | P | HDrezka Studio
👤 23 💾 3.45 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:02:01.652092-0500	RedLemon	   INPUT[160]: Орудия / Weapons (2025) WEB-DLRip 720p | D P A
👤 16 💾 7.02 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	16:02:01.652194-0500	RedLemon	   INPUT[161]: Weapons (2025) 720p WEBRip-LAMA
👤 7 💾 1.15 GB ⚙️ ThePirateBay | 720p | torrentio
default	16:02:01.652293-0500	RedLemon	   INPUT[162]: Weapons 2025 576p WEBRip x265 AAC-SSN
👤 5 💾 1.57 GB ⚙️ ThePirateBay | Unknown | torrentio
default	16:02:01.652476-0500	RedLemon	   INPUT[163]: Weapons 2025 1080p TS EN-RGB
👤 28 💾 5.77 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.652642-0500	RedLemon	   INPUT[164]: Weapons 2025 1080p TELESYNC x264-RGB
👤 11 💾 5.77 GB ⚙️ ThePirateBay | 1080p | torrentio
default	16:02:01.652832-0500	RedLemon	   INPUT[165]: Weapons.2025.1080p.TELESYNC.V2.MULTi.x264-SyncUP
👤 7 💾 6.07 GB ⚙️ ThePirateBay
Multi Audio | 1080p | torrentio
default	16:02:01.652981-0500	RedLemon	   INPUT[166]: Weapons.2025.FRENCH.VF2.WEBRip.x264-LACTEL.mkv
👤 96 💾 1.22 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	16:02:01.653251-0500	RedLemon	   INPUT[167]: Орудия / Weapons (2025) WEB-DLRip-AVC от DoMiNo & селезень | P | HDrezka Studio
👤 94 💾 2.29 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:02:01.653417-0500	RedLemon	   INPUT[168]: Орудия / Weapons (2025) BDRip-AVC от селезень | D | Movie Dubbing Red Head Sound
👤 75 💾 2.35 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:02:01.653651-0500	RedLemon	   INPUT[169]: Орудия / Weapons (2025) WEB-DLRip от ELEKTRI4KA | D | Movie Dubbing
👤 44 💾 1.46 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:02:01.653887-0500	RedLemon	   INPUT[170]: Орудия / Weapons (2025) WEB-DLRip от ELEKTRI4KA | P | HDrezka Studio
👤 30 💾 1.47 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:02:01.654021-0500	RedLemon	   INPUT[171]: Орудия / Weapons (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Movie Dubbing Red Head Sound
👤 27 💾 2.29 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:02:01.654192-0500	RedLemon	   INPUT[172]: Орудия / Weapons (2025) WEB-DLRip от DoMiNo & селезень | D | Red Head Sound
👤 14 💾 1.46 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:02:01.654309-0500	RedLemon	   INPUT[173]: Орудия / Weapons (2025) HDRip-AVC от ExKinoRay | D | Red Head Sound
👤 9 💾 745.46 MB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:02:01.654462-0500	RedLemon	   INPUT[174]: Орудия / Weapons (2025) BDRip от MegaPeer | D | Movie Dubbing
👤 6 💾 1.46 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	16:02:01.654653-0500	RedLemon	   INPUT[175]: Орудия / Weapons (2025) WEB-DLRip-AVC от DoMiNo & селезень | Sub
👤 5 💾 1.95 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	16:02:01.654880-0500	RedLemon	   INPUT[176]: Weapons (2025) SD H264 MP4 ITA [HD4ME]
👤 5 💾 713.92 MB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | Unknown | torrentio
default	16:02:01.655040-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 2160p | 2160p | comet
default	16:02:01.655205-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 2160p | 2160p | comet
default	16:02:01.655426-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 2160p | 2160p | comet
default	16:02:01.655684-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 2160p | 2160p | comet
default	16:02:01.656560-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 2160p | 2160p | comet
default	16:02:01.657618-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	16:02:01.658215-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	16:02:01.658694-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	16:02:01.659152-0500	RedLemon	🔍 Searching SubDL for subtitles: tt26581740 (movie)
default	16:02:01.659769-0500	RedLemon	Task <F750CDEA-3E4F-4820-ADB0-5EA6C04080C1>.<391> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	16:02:01.663589-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [219E07B0-8C0C-43D1-A9C0-55D8ECBD7665] (reporting strategy default)> on Task <F750CDEA-3E4F-4820-ADB0-5EA6C04080C1>.<391> was not selected for reporting
default	16:02:01.664211-0500	RedLemon	Task <EFE6276B-ECBB-4E05-8DDA-954477C8F8E8>.<392> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:01.664516-0500	RedLemon	Task <F750CDEA-3E4F-4820-ADB0-5EA6C04080C1>.<391> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:01.665642-0500	runningboardd	Invalidating assertion 169-5311-1028 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:01.664680-0500	RedLemon	Task <F750CDEA-3E4F-4820-ADB0-5EA6C04080C1>.<391> now using Connection 17
default	16:02:01.664891-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1498B26C-8AC3-4610-B686-AB06F728A479] (reporting strategy default)> on Task <EFE6276B-ECBB-4E05-8DDA-954477C8F8E8>.<392> was not selected for reporting
default	16:02:01.667051-0500	RedLemon	Task <EFE6276B-ECBB-4E05-8DDA-954477C8F8E8>.<392> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:01.667355-0500	RedLemon	Task <EFE6276B-ECBB-4E05-8DDA-954477C8F8E8>.<392> now using Connection 1
default	16:02:01.668356-0500	RedLemon	0x7f862e2ba528 ID=12 Task <F750CDEA-3E4F-4820-ADB0-5EA6C04080C1>.<391> sent request, body N 0
default	16:02:01.668472-0500	RedLemon	0x7f862e25fe88 ID=872 Task <EFE6276B-ECBB-4E05-8DDA-954477C8F8E8>.<392> sent request, body N 0
default	16:02:01.739526-0500	RedLemon	0x7f862e25fe88 ID=872 Task <EFE6276B-ECBB-4E05-8DDA-954477C8F8E8>.<392> received response, status 200 content U
default	16:02:01.740272-0500	RedLemon	Task <EFE6276B-ECBB-4E05-8DDA-954477C8F8E8>.<392> response ended
default	16:02:01.740767-0500	RedLemon	Task <EFE6276B-ECBB-4E05-8DDA-954477C8F8E8>.<392> done using Connection 1
default	16:02:01.740999-0500	RedLemon	Task <EFE6276B-ECBB-4E05-8DDA-954477C8F8E8>.<392> summary for task success {transaction_duration_ms=75, response_status=200, connection=1, reused=1, request_start_ms=2, request_duration_ms=1, response_start_ms=73, response_duration_ms=1, request_bytes=500, response_bytes=953, cache_hit=false}
default	16:02:01.741550-0500	RedLemon	Task <EFE6276B-ECBB-4E05-8DDA-954477C8F8E8>.<392> finished successfully
default	16:02:01.742952-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1029 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:01.743161-0500	runningboardd	Assertion 169-5311-1029 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:01.744378-0500	runningboardd	Attempting to rename power assertion 33546 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1028:com.apple.CFNetwork.StorageDB;169-5311-1029:com.apple.CFNetwork.StorageDB
default	16:02:01.744659-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:01.744765-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:01.744860-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:01.782185-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:01.841701-0500	runningboardd	Attempting to rename power assertion 33546 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1029:com.apple.CFNetwork.StorageDB
default	16:02:01.841774-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:01.841847-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:01.841939-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:01.951224-0500	RedLemon	Task <99805A74-37E3-4039-883A-897FE3624A55>.<393> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:01.951832-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4C4566E7-C3B4-4660-9C0E-EAE5D7481B52] (reporting strategy default)> on Task <99805A74-37E3-4039-883A-897FE3624A55>.<393> was not selected for reporting
default	16:02:01.952491-0500	RedLemon	Task <99805A74-37E3-4039-883A-897FE3624A55>.<393> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:01.952722-0500	RedLemon	Task <99805A74-37E3-4039-883A-897FE3624A55>.<393> now using Connection 1
default	16:02:01.953599-0500	RedLemon	0x7f863156b3a8 ID=876 Task <99805A74-37E3-4039-883A-897FE3624A55>.<393> sent request, body N 0
default	16:02:02.018668-0500	RedLemon	0x7f863156b3a8 ID=876 Task <99805A74-37E3-4039-883A-897FE3624A55>.<393> received response, status 200 content U
default	16:02:02.019145-0500	RedLemon	Task <99805A74-37E3-4039-883A-897FE3624A55>.<393> response ended
default	16:02:02.019423-0500	RedLemon	Task <99805A74-37E3-4039-883A-897FE3624A55>.<393> done using Connection 1
default	16:02:02.019596-0500	RedLemon	Task <99805A74-37E3-4039-883A-897FE3624A55>.<393> summary for task success {transaction_duration_ms=67, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=66, response_duration_ms=1, request_bytes=511, response_bytes=833, cache_hit=true}
default	16:02:02.019929-0500	RedLemon	Task <99805A74-37E3-4039-883A-897FE3624A55>.<393> finished successfully
default	16:02:02.021323-0500	RedLemon	Task <625B05D3-25F4-4600-A02B-E798B5BF44DE>.<394> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:02.021629-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0DC11C7C-251D-4995-B458-5FBBE2C0D8EC] (reporting strategy default)> on Task <625B05D3-25F4-4600-A02B-E798B5BF44DE>.<394> was not selected for reporting
default	16:02:02.022303-0500	RedLemon	Task <625B05D3-25F4-4600-A02B-E798B5BF44DE>.<394> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:02.022501-0500	RedLemon	Task <625B05D3-25F4-4600-A02B-E798B5BF44DE>.<394> now using Connection 1
default	16:02:02.023269-0500	RedLemon	0x7f863179fe78 ID=880 Task <625B05D3-25F4-4600-A02B-E798B5BF44DE>.<394> sent request, body N 0
default	16:02:02.089616-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:02.150042-0500	RedLemon	0x7f863179fe78 ID=880 Task <625B05D3-25F4-4600-A02B-E798B5BF44DE>.<394> received response, status 200 content U
default	16:02:02.151387-0500	RedLemon	Task <625B05D3-25F4-4600-A02B-E798B5BF44DE>.<394> response ended
default	16:02:02.152081-0500	RedLemon	Task <625B05D3-25F4-4600-A02B-E798B5BF44DE>.<394> done using Connection 1
default	16:02:02.152369-0500	RedLemon	Task <625B05D3-25F4-4600-A02B-E798B5BF44DE>.<394> summary for task success {transaction_duration_ms=130, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=127, response_duration_ms=2, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:02:02.152833-0500	RedLemon	Task <625B05D3-25F4-4600-A02B-E798B5BF44DE>.<394> finished successfully
default	16:02:02.154577-0500	RedLemon	Task <4D2AF094-8237-4FE2-AE15-59F1192DD719>.<395> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:02.154891-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A3D24430-155A-444B-B974-32D0DAA33707] (reporting strategy default)> on Task <4D2AF094-8237-4FE2-AE15-59F1192DD719>.<395> was not selected for reporting
default	16:02:02.155709-0500	RedLemon	Task <4D2AF094-8237-4FE2-AE15-59F1192DD719>.<395> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:02.155910-0500	RedLemon	Task <4D2AF094-8237-4FE2-AE15-59F1192DD719>.<395> now using Connection 1
default	16:02:02.156640-0500	RedLemon	0x7f8632dbf1b8 ID=884 Task <4D2AF094-8237-4FE2-AE15-59F1192DD719>.<395> sent request, body N 0
default	16:02:02.178417-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:02.229059-0500	RedLemon	0x7f8632dbf1b8 ID=884 Task <4D2AF094-8237-4FE2-AE15-59F1192DD719>.<395> received response, status 200 content U
default	16:02:02.229648-0500	RedLemon	Task <4D2AF094-8237-4FE2-AE15-59F1192DD719>.<395> response ended
default	16:02:02.230093-0500	RedLemon	Task <4D2AF094-8237-4FE2-AE15-59F1192DD719>.<395> done using Connection 1
default	16:02:02.230321-0500	RedLemon	Task <4D2AF094-8237-4FE2-AE15-59F1192DD719>.<395> summary for task success {transaction_duration_ms=75, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=73, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	16:02:02.230829-0500	RedLemon	Task <4D2AF094-8237-4FE2-AE15-59F1192DD719>.<395> finished successfully
default	16:02:02.233167-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:02.272372-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:02.839675-0500	RedLemon	[C24] event: client:data_stall @38.641s
default	16:02:02.841279-0500	runningboardd	Invalidating assertion 169-5311-1029 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
error	16:02:02.842432-0500	symptomsd	Unexpected type 4 for interface index 1 from libnetcore event EventDescription sb at 0x7fcd7b83bb00 from pid 5311 RedLemon SYMPTOM 0x6767002  flags 0x40000003 qual0 0x1 qual1 0x14bf key 421890 num additional quals 4
default	16:02:02.844415-0500	symptomsd	Stall symptom detail: (symName/procName/ePid/ifIndex/interfaceType/stallType/endpoint/isFgOrBg): SYMPTOM_LIBNETCORE_DATA_STALL/RedLemon/5311/1/4/1/<private>/0
default	16:02:02.844544-0500	symptomsd	Stall symptom: RedLemon has stale endpoint for stall type (1) on interface type (4), removing it: <private>
default	16:02:02.844623-0500	symptomsd	Stall symptom: RedLemon has 1 stale endpoints total for stall type (4) on interface type (1), removed them
default	16:02:02.844687-0500	symptomsd	Stall symptom SYMPTOM_LIBNETCORE_DATA_STALL: added unique stall type (1) on interface type (4) for existing process RedLemon
default	16:02:02.987034-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:02.987075-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:02.987119-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:02.988409-0500	runningboardd	Invalidating assertion 169-103-1027 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:03.142143-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:03.142234-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:03.142319-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:03.844532-0500	RedLemon	[C17] event: client:data_stall @124.247s
default	16:02:03.845068-0500	RedLemon	Task <7E4BF719-A3E4-4EAE-BAD6-0D77CDBCC0CD>.<396> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:03.845844-0500	RedLemon	[C30] event: client:data_stall @3.220s
default	16:02:03.846558-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [256177B5-8AA8-4621-BDC4-2499B8523D5E] (reporting strategy default)> on Task <7E4BF719-A3E4-4EAE-BAD6-0D77CDBCC0CD>.<396> was not selected for reporting
default	16:02:03.848169-0500	RedLemon	Task <7E4BF719-A3E4-4EAE-BAD6-0D77CDBCC0CD>.<396> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:03.848572-0500	RedLemon	Task <7E4BF719-A3E4-4EAE-BAD6-0D77CDBCC0CD>.<396> now using Connection 1
default	16:02:03.850069-0500	RedLemon	0x7f863179fe78 ID=888 Task <7E4BF719-A3E4-4EAE-BAD6-0D77CDBCC0CD>.<396> sent request, body N 0
default	16:02:03.852371-0500	symptomsd	Stall symptom detail: (symName/procName/ePid/ifIndex/interfaceType/stallType/endpoint/isFgOrBg): SYMPTOM_LIBNETCORE_DATA_STALL/RedLemon/5311/5/1/1/<private>/0
default	16:02:03.852483-0500	symptomsd	Stall symptom: RedLemon has stale endpoint for stall type (1) on interface type (1), removing it: <private>
default	16:02:03.852551-0500	symptomsd	Stall symptom: RedLemon has stale endpoint for stall type (1) on interface type (1), removing it: <private>
default	16:02:03.852633-0500	symptomsd	Stall symptom: RedLemon has 1 stale endpoints total for stall type (1) on interface type (2), removed them
default	16:02:03.852701-0500	symptomsd	Stall symptom SYMPTOM_LIBNETCORE_DATA_STALL: added unique stall type (1) on interface type (1) for existing process RedLemon
error	16:02:03.853785-0500	symptomsd	Unexpected type 4 for interface index 1 from libnetcore event EventDescription sb at 0x7fcd7b923e00 from pid 5311 RedLemon SYMPTOM 0x6767002  flags 0x40000003 qual0 0x1 qual1 0x14bf key 421890 num additional quals 4
default	16:02:03.855123-0500	symptomsd	Stall symptom detail: (symName/procName/ePid/ifIndex/interfaceType/stallType/endpoint/isFgOrBg): SYMPTOM_LIBNETCORE_DATA_STALL/RedLemon/5311/1/4/1/<private>/0
default	16:02:03.855195-0500	symptomsd	Stall symptom SYMPTOM_LIBNETCORE_DATA_STALL: RedLemon has preexisting endpoint match for stall type (1) within time range on interface type (4), updating timestamp: <private>
default	16:02:03.927026-0500	RedLemon	0x7f863179fe78 ID=888 Task <7E4BF719-A3E4-4EAE-BAD6-0D77CDBCC0CD>.<396> received response, status 200 content U
default	16:02:03.927695-0500	RedLemon	Task <7E4BF719-A3E4-4EAE-BAD6-0D77CDBCC0CD>.<396> response ended
default	16:02:03.928181-0500	RedLemon	Task <7E4BF719-A3E4-4EAE-BAD6-0D77CDBCC0CD>.<396> done using Connection 1
default	16:02:03.928411-0500	RedLemon	Task <7E4BF719-A3E4-4EAE-BAD6-0D77CDBCC0CD>.<396> summary for task success {transaction_duration_ms=80, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=79, response_duration_ms=1, request_bytes=500, response_bytes=954, cache_hit=true}
default	16:02:03.929003-0500	RedLemon	Task <7E4BF719-A3E4-4EAE-BAD6-0D77CDBCC0CD>.<396> finished successfully
default	16:02:03.930581-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1030 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:03.930794-0500	runningboardd	Assertion 169-5311-1030 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:03.932535-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:03.932583-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:03.932701-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:03.934066-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1031 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:03.934308-0500	runningboardd	Assertion 169-103-1031 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:02:03.935914-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:03.935965-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:03.936012-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:03.965658-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:04.374672-0500	RedLemon	Task <0DE7EF11-E4E5-40F6-AE5F-650261EDF7AF>.<397> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:04.375128-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [775789C2-8D8E-4AF0-B0BE-F98806D6CE98] (reporting strategy default)> on Task <0DE7EF11-E4E5-40F6-AE5F-650261EDF7AF>.<397> was not selected for reporting
default	16:02:04.376446-0500	RedLemon	Task <0DE7EF11-E4E5-40F6-AE5F-650261EDF7AF>.<397> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:04.376785-0500	RedLemon	Task <0DE7EF11-E4E5-40F6-AE5F-650261EDF7AF>.<397> now using Connection 1
default	16:02:04.378231-0500	RedLemon	0x7f86315c33d8 ID=892 Task <0DE7EF11-E4E5-40F6-AE5F-650261EDF7AF>.<397> sent request, body N 0
default	16:02:04.448755-0500	RedLemon	0x7f86315c33d8 ID=892 Task <0DE7EF11-E4E5-40F6-AE5F-650261EDF7AF>.<397> received response, status 200 content U
default	16:02:04.449441-0500	RedLemon	Task <0DE7EF11-E4E5-40F6-AE5F-650261EDF7AF>.<397> response ended
default	16:02:04.450158-0500	RedLemon	Task <0DE7EF11-E4E5-40F6-AE5F-650261EDF7AF>.<397> done using Connection 1
default	16:02:04.450777-0500	RedLemon	Task <0DE7EF11-E4E5-40F6-AE5F-650261EDF7AF>.<397> summary for task success {transaction_duration_ms=75, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=72, response_duration_ms=1, request_bytes=511, response_bytes=833, cache_hit=true}
default	16:02:04.451095-0500	RedLemon	Task <0DE7EF11-E4E5-40F6-AE5F-650261EDF7AF>.<397> finished successfully
default	16:02:04.453454-0500	RedLemon	Task <40354BA8-5208-4DC2-846E-86AC51DBA2E9>.<398> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:04.453772-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [14A68491-9F08-41C2-AB86-DF316EC5C227] (reporting strategy default)> on Task <40354BA8-5208-4DC2-846E-86AC51DBA2E9>.<398> was not selected for reporting
default	16:02:04.454488-0500	RedLemon	Task <40354BA8-5208-4DC2-846E-86AC51DBA2E9>.<398> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:04.454691-0500	RedLemon	Task <40354BA8-5208-4DC2-846E-86AC51DBA2E9>.<398> now using Connection 1
default	16:02:04.455463-0500	RedLemon	0x7f863179fe78 ID=896 Task <40354BA8-5208-4DC2-846E-86AC51DBA2E9>.<398> sent request, body N 0
default	16:02:04.469934-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:04.524813-0500	RedLemon	0x7f863179fe78 ID=896 Task <40354BA8-5208-4DC2-846E-86AC51DBA2E9>.<398> received response, status 200 content U
default	16:02:04.526031-0500	RedLemon	Task <40354BA8-5208-4DC2-846E-86AC51DBA2E9>.<398> response ended
default	16:02:04.526503-0500	RedLemon	Task <40354BA8-5208-4DC2-846E-86AC51DBA2E9>.<398> done using Connection 1
default	16:02:04.526871-0500	RedLemon	Task <40354BA8-5208-4DC2-846E-86AC51DBA2E9>.<398> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=70, response_duration_ms=2, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:02:04.527509-0500	RedLemon	Task <40354BA8-5208-4DC2-846E-86AC51DBA2E9>.<398> finished successfully
default	16:02:04.529489-0500	RedLemon	Task <F89BCBF8-87F5-40F7-BDD3-1DD5179C9AD9>.<399> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:04.529799-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9F2D4162-7FE4-4A65-B434-A41E7A87EBA9] (reporting strategy default)> on Task <F89BCBF8-87F5-40F7-BDD3-1DD5179C9AD9>.<399> was not selected for reporting
default	16:02:04.530615-0500	RedLemon	Task <F89BCBF8-87F5-40F7-BDD3-1DD5179C9AD9>.<399> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:04.530817-0500	RedLemon	Task <F89BCBF8-87F5-40F7-BDD3-1DD5179C9AD9>.<399> now using Connection 1
default	16:02:04.531584-0500	RedLemon	0x7f863179fe78 ID=900 Task <F89BCBF8-87F5-40F7-BDD3-1DD5179C9AD9>.<399> sent request, body N 0
default	16:02:04.540298-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:04.604927-0500	RedLemon	0x7f863179fe78 ID=900 Task <F89BCBF8-87F5-40F7-BDD3-1DD5179C9AD9>.<399> received response, status 200 content U
default	16:02:04.605519-0500	RedLemon	Task <F89BCBF8-87F5-40F7-BDD3-1DD5179C9AD9>.<399> response ended
default	16:02:04.605959-0500	RedLemon	Task <F89BCBF8-87F5-40F7-BDD3-1DD5179C9AD9>.<399> done using Connection 1
default	16:02:04.606188-0500	RedLemon	Task <F89BCBF8-87F5-40F7-BDD3-1DD5179C9AD9>.<399> summary for task success {transaction_duration_ms=76, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=74, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:02:04.606844-0500	RedLemon	Task <F89BCBF8-87F5-40F7-BDD3-1DD5179C9AD9>.<399> finished successfully
default	16:02:04.608937-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:04.643593-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:04.941548-0500	runningboardd	Invalidating assertion 169-5311-1030 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:05.086462-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:05.086546-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:05.086675-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:05.088481-0500	runningboardd	Invalidating assertion 169-103-1031 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:05.219839-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:05.219938-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:05.220029-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:05.953279-0500	RedLemon	Task <6AE51730-51E6-4A6D-B183-E4D74DEA38C7>.<400> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:05.953815-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [95C36DEA-E142-47AF-BEA2-B878B383088C] (reporting strategy default)> on Task <6AE51730-51E6-4A6D-B183-E4D74DEA38C7>.<400> was not selected for reporting
default	16:02:05.954746-0500	RedLemon	Task <6AE51730-51E6-4A6D-B183-E4D74DEA38C7>.<400> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:05.954940-0500	RedLemon	Task <6AE51730-51E6-4A6D-B183-E4D74DEA38C7>.<400> now using Connection 1
default	16:02:05.955727-0500	RedLemon	0x7f8631531168 ID=904 Task <6AE51730-51E6-4A6D-B183-E4D74DEA38C7>.<400> sent request, body N 0
default	16:02:06.028023-0500	RedLemon	0x7f8631531168 ID=904 Task <6AE51730-51E6-4A6D-B183-E4D74DEA38C7>.<400> received response, status 200 content U
default	16:02:06.029205-0500	RedLemon	Task <6AE51730-51E6-4A6D-B183-E4D74DEA38C7>.<400> response ended
default	16:02:06.029653-0500	RedLemon	Task <6AE51730-51E6-4A6D-B183-E4D74DEA38C7>.<400> done using Connection 1
default	16:02:06.030030-0500	RedLemon	Task <6AE51730-51E6-4A6D-B183-E4D74DEA38C7>.<400> summary for task success {transaction_duration_ms=75, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=73, response_duration_ms=2, request_bytes=500, response_bytes=956, cache_hit=true}
default	16:02:06.030646-0500	RedLemon	Task <6AE51730-51E6-4A6D-B183-E4D74DEA38C7>.<400> finished successfully
default	16:02:06.032058-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1032 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:06.032248-0500	runningboardd	Assertion 169-5311-1032 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:06.033334-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:06.033390-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:06.033580-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:06.036652-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1033 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:06.036828-0500	runningboardd	Assertion 169-103-1033 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:02:06.037837-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:06.037890-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:06.037944-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:06.043560-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:06.809189-0500	RedLemon	Task <DC6F4FE5-CA57-435A-91C4-BF5BE10FBD9E>.<401> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:06.809789-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A15242DD-76DC-4FFF-98E4-F381FABFF730] (reporting strategy default)> on Task <DC6F4FE5-CA57-435A-91C4-BF5BE10FBD9E>.<401> was not selected for reporting
default	16:02:06.811045-0500	RedLemon	Task <DC6F4FE5-CA57-435A-91C4-BF5BE10FBD9E>.<401> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:06.811383-0500	RedLemon	Task <DC6F4FE5-CA57-435A-91C4-BF5BE10FBD9E>.<401> now using Connection 1
default	16:02:06.812781-0500	RedLemon	0x7f8631531168 ID=908 Task <DC6F4FE5-CA57-435A-91C4-BF5BE10FBD9E>.<401> sent request, body N 0
default	16:02:06.888592-0500	RedLemon	0x7f8631531168 ID=908 Task <DC6F4FE5-CA57-435A-91C4-BF5BE10FBD9E>.<401> received response, status 200 content U
default	16:02:06.889370-0500	RedLemon	Task <DC6F4FE5-CA57-435A-91C4-BF5BE10FBD9E>.<401> response ended
default	16:02:06.889744-0500	RedLemon	Task <DC6F4FE5-CA57-435A-91C4-BF5BE10FBD9E>.<401> done using Connection 1
default	16:02:06.889928-0500	RedLemon	Task <DC6F4FE5-CA57-435A-91C4-BF5BE10FBD9E>.<401> summary for task success {transaction_duration_ms=79, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=78, response_duration_ms=1, request_bytes=511, response_bytes=835, cache_hit=true}
default	16:02:06.890299-0500	RedLemon	Task <DC6F4FE5-CA57-435A-91C4-BF5BE10FBD9E>.<401> finished successfully
default	16:02:06.892290-0500	RedLemon	Task <6085209B-28A6-4100-AA72-052624CB6380>.<402> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:06.892620-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BE74C932-54C1-4523-90BC-8E4E3D8D1659] (reporting strategy default)> on Task <6085209B-28A6-4100-AA72-052624CB6380>.<402> was not selected for reporting
default	16:02:06.893373-0500	RedLemon	Task <6085209B-28A6-4100-AA72-052624CB6380>.<402> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:06.893575-0500	RedLemon	Task <6085209B-28A6-4100-AA72-052624CB6380>.<402> now using Connection 1
default	16:02:06.894361-0500	RedLemon	0x7f863179fe78 ID=912 Task <6085209B-28A6-4100-AA72-052624CB6380>.<402> sent request, body N 0
default	16:02:06.908441-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:06.962379-0500	RedLemon	0x7f863179fe78 ID=912 Task <6085209B-28A6-4100-AA72-052624CB6380>.<402> received response, status 200 content U
default	16:02:06.963087-0500	RedLemon	Task <6085209B-28A6-4100-AA72-052624CB6380>.<402> response ended
default	16:02:06.963453-0500	RedLemon	Task <6085209B-28A6-4100-AA72-052624CB6380>.<402> done using Connection 1
default	16:02:06.963618-0500	RedLemon	Task <6085209B-28A6-4100-AA72-052624CB6380>.<402> summary for task success {transaction_duration_ms=70, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=1, request_bytes=524, response_bytes=841, cache_hit=true}
default	16:02:06.964014-0500	RedLemon	Task <6085209B-28A6-4100-AA72-052624CB6380>.<402> finished successfully
default	16:02:06.966208-0500	RedLemon	Task <7B6348D1-4103-4AA4-85D9-4915F1DB283A>.<403> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:06.966562-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C6810714-81A8-4872-BEB4-6F96596FCCF7] (reporting strategy default)> on Task <7B6348D1-4103-4AA4-85D9-4915F1DB283A>.<403> was not selected for reporting
default	16:02:06.967566-0500	RedLemon	Task <7B6348D1-4103-4AA4-85D9-4915F1DB283A>.<403> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:06.967817-0500	RedLemon	Task <7B6348D1-4103-4AA4-85D9-4915F1DB283A>.<403> now using Connection 1
default	16:02:06.969330-0500	RedLemon	0x7f862e3fce28 ID=916 Task <7B6348D1-4103-4AA4-85D9-4915F1DB283A>.<403> sent request, body N 0
default	16:02:06.977035-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:07.040873-0500	RedLemon	0x7f862e3fce28 ID=916 Task <7B6348D1-4103-4AA4-85D9-4915F1DB283A>.<403> received response, status 200 content U
default	16:02:07.041266-0500	RedLemon	Task <7B6348D1-4103-4AA4-85D9-4915F1DB283A>.<403> response ended
default	16:02:07.041567-0500	RedLemon	Task <7B6348D1-4103-4AA4-85D9-4915F1DB283A>.<403> done using Connection 1
default	16:02:07.041760-0500	RedLemon	Task <7B6348D1-4103-4AA4-85D9-4915F1DB283A>.<403> summary for task success {transaction_duration_ms=74, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=73, response_duration_ms=0, request_bytes=524, response_bytes=841, cache_hit=true}
default	16:02:07.042099-0500	RedLemon	Task <7B6348D1-4103-4AA4-85D9-4915F1DB283A>.<403> finished successfully
default	16:02:07.043030-0500	runningboardd	Invalidating assertion 169-5311-1032 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:07.043729-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:07.064806-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:07.064851-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:07.064990-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:07.067291-0500	runningboardd	Invalidating assertion 169-103-1033 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:07.083106-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:07.083270-0500	RedLemon	CoreAnimation: warning, deleted thread with uncommitted CATransaction; set CA_DEBUG_TRANSACTIONS=1 in environment to log backtraces, or set CA_ASSERT_MAIN_THREAD_TRANSACTIONS=1 to abort when an implicit transaction isn't created on a main thread.
default	16:02:07.178234-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:07.178308-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:07.178381-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:08.168637-0500	RedLemon	Task <DBBB6C3D-DA78-4084-B2B6-CB00047814B9>.<404> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:08.169337-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1044CB48-91CD-4A0F-82A6-867224913EBA] (reporting strategy default)> on Task <DBBB6C3D-DA78-4084-B2B6-CB00047814B9>.<404> was not selected for reporting
default	16:02:08.170643-0500	RedLemon	Task <DBBB6C3D-DA78-4084-B2B6-CB00047814B9>.<404> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:08.171089-0500	RedLemon	Task <DBBB6C3D-DA78-4084-B2B6-CB00047814B9>.<404> now using Connection 1
default	16:02:08.172451-0500	RedLemon	0x7f863179fe78 ID=920 Task <DBBB6C3D-DA78-4084-B2B6-CB00047814B9>.<404> sent request, body N 0
default	16:02:08.240017-0500	RedLemon	0x7f863179fe78 ID=920 Task <DBBB6C3D-DA78-4084-B2B6-CB00047814B9>.<404> received response, status 200 content U
default	16:02:08.240602-0500	RedLemon	Task <DBBB6C3D-DA78-4084-B2B6-CB00047814B9>.<404> response ended
default	16:02:08.241040-0500	RedLemon	Task <DBBB6C3D-DA78-4084-B2B6-CB00047814B9>.<404> done using Connection 1
default	16:02:08.241266-0500	RedLemon	Task <DBBB6C3D-DA78-4084-B2B6-CB00047814B9>.<404> summary for task success {transaction_duration_ms=71, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=69, response_duration_ms=1, request_bytes=500, response_bytes=954, cache_hit=true}
default	16:02:08.241801-0500	RedLemon	Task <DBBB6C3D-DA78-4084-B2B6-CB00047814B9>.<404> finished successfully
default	16:02:08.243561-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1036 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:08.243797-0500	runningboardd	Assertion 169-5311-1036 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:08.245290-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:08.245388-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:08.245502-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:08.246784-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1037 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:08.247025-0500	runningboardd	Assertion 169-103-1037 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:02:08.248455-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:08.248503-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:08.248610-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:08.281011-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:09.219095-0500	RedLemon	Task <8580CC24-346F-4BAB-A6A8-365020FFC885>.<405> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:09.219784-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DC4F4085-D15C-41D5-956A-3C60ED705E37] (reporting strategy default)> on Task <8580CC24-346F-4BAB-A6A8-365020FFC885>.<405> was not selected for reporting
default	16:02:09.221254-0500	RedLemon	Task <8580CC24-346F-4BAB-A6A8-365020FFC885>.<405> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:09.221590-0500	RedLemon	Task <8580CC24-346F-4BAB-A6A8-365020FFC885>.<405> now using Connection 1
default	16:02:09.222870-0500	RedLemon	0x7f86308dd908 ID=924 Task <8580CC24-346F-4BAB-A6A8-365020FFC885>.<405> sent request, body N 0
default	16:02:09.275996-0500	runningboardd	Invalidating assertion 169-5311-1036 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:09.286636-0500	RedLemon	0x7f86308dd908 ID=924 Task <8580CC24-346F-4BAB-A6A8-365020FFC885>.<405> received response, status 200 content U
default	16:02:09.287890-0500	RedLemon	Task <8580CC24-346F-4BAB-A6A8-365020FFC885>.<405> response ended
default	16:02:09.288352-0500	RedLemon	Task <8580CC24-346F-4BAB-A6A8-365020FFC885>.<405> done using Connection 1
default	16:02:09.288578-0500	RedLemon	Task <8580CC24-346F-4BAB-A6A8-365020FFC885>.<405> summary for task success {transaction_duration_ms=68, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=65, response_duration_ms=2, request_bytes=511, response_bytes=833, cache_hit=true}
default	16:02:09.289247-0500	RedLemon	Task <8580CC24-346F-4BAB-A6A8-365020FFC885>.<405> finished successfully
default	16:02:09.290350-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1038 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:09.290540-0500	runningboardd	Assertion 169-5311-1038 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:09.291062-0500	RedLemon	Task <48272622-3CAA-498C-9EF6-94A2AEE22C89>.<406> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:09.291452-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D110AFF6-7563-4B4B-9182-452DB5980081] (reporting strategy default)> on Task <48272622-3CAA-498C-9EF6-94A2AEE22C89>.<406> was not selected for reporting
default	16:02:09.292186-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1036:com.apple.CFNetwork.StorageDB;169-5311-1038:com.apple.CFNetwork.StorageDB
default	16:02:09.292287-0500	RedLemon	Task <48272622-3CAA-498C-9EF6-94A2AEE22C89>.<406> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:09.292563-0500	RedLemon	Task <48272622-3CAA-498C-9EF6-94A2AEE22C89>.<406> now using Connection 1
default	16:02:09.293380-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:09.293428-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:09.293579-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:09.293483-0500	RedLemon	0x7f86308dd908 ID=928 Task <48272622-3CAA-498C-9EF6-94A2AEE22C89>.<406> sent request, body N 0
default	16:02:09.307923-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:09.358795-0500	RedLemon	0x7f86308dd908 ID=928 Task <48272622-3CAA-498C-9EF6-94A2AEE22C89>.<406> received response, status 200 content U
default	16:02:09.359719-0500	RedLemon	Task <48272622-3CAA-498C-9EF6-94A2AEE22C89>.<406> response ended
default	16:02:09.360204-0500	RedLemon	Task <48272622-3CAA-498C-9EF6-94A2AEE22C89>.<406> done using Connection 1
default	16:02:09.360440-0500	RedLemon	Task <48272622-3CAA-498C-9EF6-94A2AEE22C89>.<406> summary for task success {transaction_duration_ms=68, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=66, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:02:09.360824-0500	RedLemon	Task <48272622-3CAA-498C-9EF6-94A2AEE22C89>.<406> finished successfully
default	16:02:09.363118-0500	RedLemon	Task <A3005870-4218-4EBD-B6CE-35704AB3FDFF>.<407> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:09.363456-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [663322C3-9289-406B-9F3E-D959C6AA217B] (reporting strategy default)> on Task <A3005870-4218-4EBD-B6CE-35704AB3FDFF>.<407> was not selected for reporting
default	16:02:09.364125-0500	RedLemon	Task <A3005870-4218-4EBD-B6CE-35704AB3FDFF>.<407> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:09.364311-0500	RedLemon	Task <A3005870-4218-4EBD-B6CE-35704AB3FDFF>.<407> now using Connection 1
default	16:02:09.364980-0500	RedLemon	0x7f863179fe78 ID=932 Task <A3005870-4218-4EBD-B6CE-35704AB3FDFF>.<407> sent request, body N 0
default	16:02:09.381594-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:09.426783-0500	RedLemon	0x7f863179fe78 ID=932 Task <A3005870-4218-4EBD-B6CE-35704AB3FDFF>.<407> received response, status 200 content U
default	16:02:09.427373-0500	RedLemon	Task <A3005870-4218-4EBD-B6CE-35704AB3FDFF>.<407> response ended
default	16:02:09.427819-0500	RedLemon	Task <A3005870-4218-4EBD-B6CE-35704AB3FDFF>.<407> done using Connection 1
default	16:02:09.428049-0500	RedLemon	Task <A3005870-4218-4EBD-B6CE-35704AB3FDFF>.<407> summary for task success {transaction_duration_ms=64, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=840, cache_hit=true}
default	16:02:09.428617-0500	RedLemon	Task <A3005870-4218-4EBD-B6CE-35704AB3FDFF>.<407> finished successfully
default	16:02:09.430349-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:09.430495-0500	RedLemon	👋 ursinho left room
default	16:02:09.446326-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:09.446388-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:09.446383-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1038:com.apple.CFNetwork.StorageDB
default	16:02:09.446434-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:09.502197-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:09.758759-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:09.759191-0500	RedLemon	   Payload keys: senderId, isPlaying, position, type, timestamp
default	16:02:09.759711-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:09.759900-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:09.760282-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:09.760363-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:09.902982-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:09.903281-0500	RedLemon	   Payload keys: timestamp, type, position, isPlaying, senderId
default	16:02:09.903608-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:09.903748-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:09.903860-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:09.903938-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:10.167772-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:10.168152-0500	RedLemon	   Payload keys: timestamp, isPlaying, type, position, senderId
default	16:02:10.168668-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:10.168898-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:10.169078-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:10.169184-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:10.388382-0500	RedLemon	Task <641F7840-9985-462D-9E4E-A1586501AE69>.<408> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:10.389173-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AA330507-C25F-4580-8E2A-A7832A9C41AD] (reporting strategy default)> on Task <641F7840-9985-462D-9E4E-A1586501AE69>.<408> was not selected for reporting
default	16:02:10.390449-0500	RedLemon	Task <641F7840-9985-462D-9E4E-A1586501AE69>.<408> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:10.390743-0500	RedLemon	Task <641F7840-9985-462D-9E4E-A1586501AE69>.<408> now using Connection 1
default	16:02:10.391716-0500	RedLemon	0x7f862e3fce28 ID=936 Task <641F7840-9985-462D-9E4E-A1586501AE69>.<408> sent request, body N 0
default	16:02:10.392292-0500	runningboardd	Invalidating assertion 169-5311-1038 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:10.504101-0500	RedLemon	0x7f862e3fce28 ID=936 Task <641F7840-9985-462D-9E4E-A1586501AE69>.<408> received response, status 200 content U
default	16:02:10.504791-0500	RedLemon	Task <641F7840-9985-462D-9E4E-A1586501AE69>.<408> response ended
default	16:02:10.505254-0500	RedLemon	Task <641F7840-9985-462D-9E4E-A1586501AE69>.<408> done using Connection 1
default	16:02:10.505481-0500	RedLemon	Task <641F7840-9985-462D-9E4E-A1586501AE69>.<408> summary for task success {transaction_duration_ms=115, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=113, response_duration_ms=1, request_bytes=500, response_bytes=954, cache_hit=true}
default	16:02:10.506006-0500	RedLemon	Task <641F7840-9985-462D-9E4E-A1586501AE69>.<408> finished successfully
default	16:02:10.507735-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1039 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:10.507925-0500	runningboardd	Assertion 169-5311-1039 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:10.508935-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:10.508980-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:10.509025-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:10.509143-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1038:com.apple.CFNetwork.StorageDB;169-5311-1039:com.apple.CFNetwork.StorageDB
default	16:02:10.511559-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:10.511728-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:10.511755-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1039:com.apple.CFNetwork.StorageDB
default	16:02:10.511786-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:10.544933-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:10.593264-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:10.593558-0500	RedLemon	   Payload keys: position, isPlaying, timestamp, type, senderId
default	16:02:10.594017-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:10.594233-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:10.594407-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:10.594505-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:10.669953-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:10.670244-0500	RedLemon	   Payload keys: senderId, isPlaying, position, type, timestamp
default	16:02:10.670794-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:10.670994-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:10.671164-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:10.671252-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:10.985270-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:10.985578-0500	RedLemon	   Payload keys: position, isPlaying, timestamp, type, senderId
default	16:02:10.986099-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:10.986330-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:10.986505-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:10.986747-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:11.189126-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:11.189424-0500	RedLemon	   Payload keys: senderId, type, isPlaying, position, timestamp
default	16:02:11.189913-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:11.190146-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:11.190337-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:11.190393-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:11.497543-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:11.497946-0500	RedLemon	   Payload keys: senderId, isPlaying, position, type, timestamp
default	16:02:11.498483-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:11.498712-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:11.498888-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:11.498970-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:11.578097-0500	RedLemon	Task <A57F69D5-5561-4CE7-A7D2-6A53963C5973>.<409> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:11.578305-0500	runningboardd	Invalidating assertion 169-5311-1039 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:11.578775-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [86487153-3C97-4D9A-813E-52E2D5CA142D] (reporting strategy default)> on Task <A57F69D5-5561-4CE7-A7D2-6A53963C5973>.<409> was not selected for reporting
default	16:02:11.579907-0500	RedLemon	Task <A57F69D5-5561-4CE7-A7D2-6A53963C5973>.<409> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:11.580214-0500	RedLemon	Task <A57F69D5-5561-4CE7-A7D2-6A53963C5973>.<409> now using Connection 1
default	16:02:11.581486-0500	RedLemon	0x7f86308dd908 ID=940 Task <A57F69D5-5561-4CE7-A7D2-6A53963C5973>.<409> sent request, body N 0
default	16:02:11.659778-0500	RedLemon	0x7f86308dd908 ID=940 Task <A57F69D5-5561-4CE7-A7D2-6A53963C5973>.<409> received response, status 200 content U
default	16:02:11.660465-0500	RedLemon	Task <A57F69D5-5561-4CE7-A7D2-6A53963C5973>.<409> response ended
default	16:02:11.660986-0500	RedLemon	Task <A57F69D5-5561-4CE7-A7D2-6A53963C5973>.<409> done using Connection 1
default	16:02:11.661223-0500	RedLemon	Task <A57F69D5-5561-4CE7-A7D2-6A53963C5973>.<409> summary for task success {transaction_duration_ms=81, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=80, response_duration_ms=1, request_bytes=511, response_bytes=832, cache_hit=true}
default	16:02:11.661911-0500	RedLemon	Task <A57F69D5-5561-4CE7-A7D2-6A53963C5973>.<409> finished successfully
default	16:02:11.663166-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1040 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:11.663410-0500	runningboardd	Assertion 169-5311-1040 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:11.663849-0500	RedLemon	Task <983402F8-3CD9-45B9-9E16-05A575EAC90E>.<410> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:11.664236-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6812DF93-6DAF-489B-934E-8D044C5FCBE7] (reporting strategy default)> on Task <983402F8-3CD9-45B9-9E16-05A575EAC90E>.<410> was not selected for reporting
default	16:02:11.664989-0500	RedLemon	Task <983402F8-3CD9-45B9-9E16-05A575EAC90E>.<410> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:11.665111-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:11.665158-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:11.665338-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:11.665276-0500	RedLemon	Task <983402F8-3CD9-45B9-9E16-05A575EAC90E>.<410> now using Connection 1
default	16:02:11.665651-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1039:com.apple.CFNetwork.StorageDB;169-5311-1040:com.apple.CFNetwork.StorageDB
default	16:02:11.666379-0500	RedLemon	0x7f863179fe78 ID=944 Task <983402F8-3CD9-45B9-9E16-05A575EAC90E>.<410> sent request, body N 0
default	16:02:11.689471-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1040:com.apple.CFNetwork.StorageDB
default	16:02:11.689922-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:11.690023-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:11.690191-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:11.690483-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:11.739862-0500	RedLemon	0x7f863179fe78 ID=944 Task <983402F8-3CD9-45B9-9E16-05A575EAC90E>.<410> received response, status 200 content U
default	16:02:11.740448-0500	RedLemon	Task <983402F8-3CD9-45B9-9E16-05A575EAC90E>.<410> response ended
default	16:02:11.740890-0500	RedLemon	Task <983402F8-3CD9-45B9-9E16-05A575EAC90E>.<410> done using Connection 1
default	16:02:11.741122-0500	RedLemon	Task <983402F8-3CD9-45B9-9E16-05A575EAC90E>.<410> summary for task success {transaction_duration_ms=76, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=75, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:02:11.741672-0500	RedLemon	Task <983402F8-3CD9-45B9-9E16-05A575EAC90E>.<410> finished successfully
default	16:02:11.743935-0500	RedLemon	Task <97EF4F7A-8AFE-4A04-864D-C4120872AD05>.<411> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:11.744426-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AC7EB5E1-084B-4145-9684-A959E87369D9] (reporting strategy default)> on Task <97EF4F7A-8AFE-4A04-864D-C4120872AD05>.<411> was not selected for reporting
default	16:02:11.745202-0500	RedLemon	Task <97EF4F7A-8AFE-4A04-864D-C4120872AD05>.<411> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:11.745417-0500	RedLemon	Task <97EF4F7A-8AFE-4A04-864D-C4120872AD05>.<411> now using Connection 1
default	16:02:11.746217-0500	RedLemon	0x7f863179fe78 ID=948 Task <97EF4F7A-8AFE-4A04-864D-C4120872AD05>.<411> sent request, body N 0
default	16:02:11.775468-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:11.828080-0500	RedLemon	0x7f863179fe78 ID=948 Task <97EF4F7A-8AFE-4A04-864D-C4120872AD05>.<411> received response, status 200 content U
default	16:02:11.828877-0500	RedLemon	Task <97EF4F7A-8AFE-4A04-864D-C4120872AD05>.<411> response ended
default	16:02:11.829330-0500	RedLemon	Task <97EF4F7A-8AFE-4A04-864D-C4120872AD05>.<411> done using Connection 1
default	16:02:11.829562-0500	RedLemon	Task <97EF4F7A-8AFE-4A04-864D-C4120872AD05>.<411> summary for task success {transaction_duration_ms=84, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=83, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:02:11.830302-0500	RedLemon	Task <97EF4F7A-8AFE-4A04-864D-C4120872AD05>.<411> finished successfully
default	16:02:11.831909-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:11.873799-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:12.111500-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:12.111902-0500	RedLemon	   Payload keys: senderId, type, position, timestamp, isPlaying
default	16:02:12.112409-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:12.112534-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:12.112634-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:12.112704-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:12.112760-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:12.112924-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:12.113209-0500	RedLemon	✅ Realtime: Decoded message type: ready, sender: 656DAA91-33B4-4688-9135-C982EA52D7C9
default	16:02:12.113337-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: ready
default	16:02:12.113436-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:12.113497-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:12.154398-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:12.154727-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:12.155491-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:12.155666-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:12.155826-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:12.155915-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:12.418020-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:12.418334-0500	RedLemon	   Payload keys: position, isPlaying, timestamp, type, senderId
default	16:02:12.418844-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:12.419059-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:12.419166-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:12.419219-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:12.654017-0500	RedLemon	Task <42F54EF3-031D-414A-B55D-47D023FB26BE>.<412> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:12.654663-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [63D9B98A-74AE-40BF-9340-A45C74032572] (reporting strategy default)> on Task <42F54EF3-031D-414A-B55D-47D023FB26BE>.<412> was not selected for reporting
default	16:02:12.656210-0500	RedLemon	Task <42F54EF3-031D-414A-B55D-47D023FB26BE>.<412> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:12.656595-0500	RedLemon	Task <42F54EF3-031D-414A-B55D-47D023FB26BE>.<412> now using Connection 1
default	16:02:12.657524-0500	RedLemon	0x7f86316dd2d8 ID=952 Task <42F54EF3-031D-414A-B55D-47D023FB26BE>.<412> sent request, body N 0
default	16:02:12.665930-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:12.666244-0500	RedLemon	   Payload keys: isPlaying, timestamp, position, senderId, type
default	16:02:12.666805-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:12.667018-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:12.667229-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:12.667327-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:12.723012-0500	runningboardd	Invalidating assertion 169-5311-1040 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:12.730633-0500	RedLemon	0x7f86316dd2d8 ID=952 Task <42F54EF3-031D-414A-B55D-47D023FB26BE>.<412> received response, status 200 content U
default	16:02:12.736299-0500	RedLemon	Task <42F54EF3-031D-414A-B55D-47D023FB26BE>.<412> response ended
default	16:02:12.737056-0500	RedLemon	Task <42F54EF3-031D-414A-B55D-47D023FB26BE>.<412> done using Connection 1
default	16:02:12.737370-0500	RedLemon	Task <42F54EF3-031D-414A-B55D-47D023FB26BE>.<412> summary for task success {transaction_duration_ms=82, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=75, response_duration_ms=6, request_bytes=500, response_bytes=956, cache_hit=true}
default	16:02:12.737776-0500	RedLemon	Task <42F54EF3-031D-414A-B55D-47D023FB26BE>.<412> finished successfully
default	16:02:12.738816-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1041 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:12.739048-0500	runningboardd	Assertion 169-5311-1041 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:12.740334-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:12.740335-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1040:com.apple.CFNetwork.StorageDB;169-5311-1041:com.apple.CFNetwork.StorageDB
default	16:02:12.740377-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:12.740418-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:12.754872-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:12.895203-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:12.895250-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:12.894900-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1041:com.apple.CFNetwork.StorageDB
default	16:02:12.895296-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:13.033591-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:13.033905-0500	RedLemon	   Payload keys: isPlaying, timestamp, position, senderId, type
default	16:02:13.034338-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:13.034539-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:13.034724-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:13.034817-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:13.084863-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:13.085166-0500	RedLemon	   Payload keys: senderId, type, position, timestamp, isPlaying
default	16:02:13.085608-0500	RedLemon	✅ Realtime: Decoded message type: play, sender: 656DAA91-33B4-4688-9135-C982EA52D7C9
default	16:02:13.085832-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: play
default	16:02:13.086009-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:13.086097-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:13.159673-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:13.160176-0500	RedLemon	   Payload keys: isPlaying, timestamp, position, senderId, type
default	16:02:13.160651-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:13.160825-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:13.160998-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:13.161086-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:13.442594-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:13.442893-0500	RedLemon	   Payload keys: senderId, type, position, timestamp, isPlaying
default	16:02:13.443381-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:13.443579-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:13.443744-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:13.443866-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:13.749413-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:13.749728-0500	RedLemon	   Payload keys: isPlaying, timestamp, position, senderId, type
default	16:02:13.750185-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:13.750370-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:13.750540-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:13.750631-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:13.840929-0500	RedLemon	Task <F98C66B6-0F05-4EAF-A5FC-C3D18BBECC12>.<413> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:13.841522-0500	runningboardd	Invalidating assertion 169-5311-1041 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:13.841579-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [85871BA0-9237-474B-B4DA-7E487FA98021] (reporting strategy default)> on Task <F98C66B6-0F05-4EAF-A5FC-C3D18BBECC12>.<413> was not selected for reporting
default	16:02:13.842757-0500	RedLemon	Task <F98C66B6-0F05-4EAF-A5FC-C3D18BBECC12>.<413> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:13.843061-0500	RedLemon	Task <F98C66B6-0F05-4EAF-A5FC-C3D18BBECC12>.<413> now using Connection 1
default	16:02:13.843952-0500	RedLemon	0x7f863179fe78 ID=956 Task <F98C66B6-0F05-4EAF-A5FC-C3D18BBECC12>.<413> sent request, body N 0
default	16:02:13.910904-0500	RedLemon	0x7f863179fe78 ID=956 Task <F98C66B6-0F05-4EAF-A5FC-C3D18BBECC12>.<413> received response, status 200 content U
default	16:02:13.911494-0500	RedLemon	Task <F98C66B6-0F05-4EAF-A5FC-C3D18BBECC12>.<413> response ended
default	16:02:13.912013-0500	RedLemon	Task <F98C66B6-0F05-4EAF-A5FC-C3D18BBECC12>.<413> done using Connection 1
default	16:02:13.912360-0500	RedLemon	Task <F98C66B6-0F05-4EAF-A5FC-C3D18BBECC12>.<413> summary for task success {transaction_duration_ms=70, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=68, response_duration_ms=1, request_bytes=511, response_bytes=832, cache_hit=true}
default	16:02:13.912554-0500	RedLemon	Task <F98C66B6-0F05-4EAF-A5FC-C3D18BBECC12>.<413> finished successfully
default	16:02:13.914228-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1042 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:13.914459-0500	RedLemon	Task <02F8E14E-7AF2-4696-8C97-E2346EC8D743>.<414> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:13.914846-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DFFFB3D5-D8D4-4AC1-AB28-36AD67769336] (reporting strategy default)> on Task <02F8E14E-7AF2-4696-8C97-E2346EC8D743>.<414> was not selected for reporting
default	16:02:13.915610-0500	runningboardd	Assertion 169-5311-1042 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:13.915678-0500	RedLemon	Task <02F8E14E-7AF2-4696-8C97-E2346EC8D743>.<414> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:13.916009-0500	RedLemon	Task <02F8E14E-7AF2-4696-8C97-E2346EC8D743>.<414> now using Connection 1
default	16:02:13.917258-0500	RedLemon	0x7f86308dd908 ID=960 Task <02F8E14E-7AF2-4696-8C97-E2346EC8D743>.<414> sent request, body N 0
default	16:02:13.917959-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:13.918000-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:13.918037-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:13.918325-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1041:com.apple.CFNetwork.StorageDB;169-5311-1042:com.apple.CFNetwork.StorageDB
default	16:02:14.004158-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:14.004441-0500	RedLemon	   Payload keys: senderId, type, position, timestamp, isPlaying
default	16:02:14.005008-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:14.005228-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:14.005399-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:14.005491-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:14.015115-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1042:com.apple.CFNetwork.StorageDB
default	16:02:14.015990-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:14.016426-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:14.016609-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:14.035145-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:14.100320-0500	RedLemon	0x7f86308dd908 ID=960 Task <02F8E14E-7AF2-4696-8C97-E2346EC8D743>.<414> received response, status 200 content U
default	16:02:14.100898-0500	RedLemon	Task <02F8E14E-7AF2-4696-8C97-E2346EC8D743>.<414> response ended
default	16:02:14.101345-0500	RedLemon	Task <02F8E14E-7AF2-4696-8C97-E2346EC8D743>.<414> done using Connection 1
default	16:02:14.101573-0500	RedLemon	Task <02F8E14E-7AF2-4696-8C97-E2346EC8D743>.<414> summary for task success {transaction_duration_ms=186, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=184, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:02:14.102133-0500	RedLemon	Task <02F8E14E-7AF2-4696-8C97-E2346EC8D743>.<414> finished successfully
default	16:02:14.104598-0500	RedLemon	Task <8E9793AF-86C2-4CC7-92DD-E6AE9EADB5DB>.<415> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:14.104890-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C92187C8-49BA-41E2-BE58-AA150FFC005F] (reporting strategy default)> on Task <8E9793AF-86C2-4CC7-92DD-E6AE9EADB5DB>.<415> was not selected for reporting
default	16:02:14.105664-0500	RedLemon	Task <8E9793AF-86C2-4CC7-92DD-E6AE9EADB5DB>.<415> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:14.105874-0500	RedLemon	Task <8E9793AF-86C2-4CC7-92DD-E6AE9EADB5DB>.<415> now using Connection 1
default	16:02:14.106618-0500	RedLemon	0x7f86308dd908 ID=964 Task <8E9793AF-86C2-4CC7-92DD-E6AE9EADB5DB>.<415> sent request, body N 0
default	16:02:14.121243-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:14.219717-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:14.220128-0500	RedLemon	   Payload keys: isPlaying, timestamp, position, senderId, type
default	16:02:14.220598-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:14.220833-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:14.221112-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:14.221223-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:14.241092-0500	RedLemon	0x7f86308dd908 ID=964 Task <8E9793AF-86C2-4CC7-92DD-E6AE9EADB5DB>.<415> received response, status 200 content U
default	16:02:14.241642-0500	RedLemon	Task <8E9793AF-86C2-4CC7-92DD-E6AE9EADB5DB>.<415> response ended
default	16:02:14.242196-0500	RedLemon	Task <8E9793AF-86C2-4CC7-92DD-E6AE9EADB5DB>.<415> done using Connection 1
default	16:02:14.242506-0500	RedLemon	Task <8E9793AF-86C2-4CC7-92DD-E6AE9EADB5DB>.<415> summary for task success {transaction_duration_ms=137, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=135, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:02:14.243216-0500	RedLemon	Task <8E9793AF-86C2-4CC7-92DD-E6AE9EADB5DB>.<415> finished successfully
default	16:02:14.245110-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:14.282440-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:14.568521-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:14.568795-0500	RedLemon	   Payload keys: timestamp, type, position, senderId, isPlaying
default	16:02:14.569324-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:14.569555-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:14.569732-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:14.569808-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:14.773480-0500	RedLemon	tcp_input [C27.1.1:3] flags=[F.] seq=1578651441, ack=1590834571, win=8 state=ESTABLISHED rcv_nxt=1578651441, snd_una=1590834571
default	16:02:14.773602-0500	RedLemon	nw_protocol_tcp_log_summary [C27.1.1:3] 
	[A01E4290-D838-4B97-BD6B-40851DF1CC53 <private>:55994<-><private>:443]
	Init: 1, Conn_Time: 13.735ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 9, rtt: 26.843ms, rtt_var: 17.062ms rtt_nc: 22.968ms, rtt_var_nc: 15.437ms base rtt: 7ms
	ACKs-compressed: 0, ACKs delayed: 21 delayed ACKs sent: 0
default	16:02:14.774277-0500	RedLemon	Connection 27: read-side closed
default	16:02:14.774313-0500	RedLemon	Connection 27: read-side closed
default	16:02:14.774343-0500	RedLemon	Connection 27: read-side closed
default	16:02:14.774532-0500	RedLemon	Connection 27: cleaning up
default	16:02:14.774595-0500	RedLemon	[C27 7A331C71-87E2-4A8D-96A9-F4B118A73A14 Hostname#afe42ebd:443 quic-connection, url hash: 4c7e9bc6, definite, attribution: developer] cancel
default	16:02:14.774718-0500	RedLemon	[C27 7A331C71-87E2-4A8D-96A9-F4B118A73A14 Hostname#afe42ebd:443 quic-connection, url hash: 4c7e9bc6, definite, attribution: developer] cancelled
	[C27.1.1 AA8F4782-4280-4F9B-A168-989BFF3D24B3 2607:fea8:995b:fd00:7141:6ed:4959:38c8.55994<->IPv6#085d3596.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 26.432s, DNS @0.001s took 0.046s, TCP @0.053s took 0.015s, TLS 1.3 took 0.213s
	bytes in/out: 668900/1723, packets in/out: 119/155, rtt: 0.026s, retransmitted bytes: 517, out-of-order bytes: 58548
default	16:02:14.775376-0500	RedLemon	nw_flow_disconnected [C27.1.1 IPv6#085d3596.443 cancelled channel-flow ((null))] Output protocol disconnected
default	16:02:14.775731-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C27] reporting state cancelled
default	16:02:14.775927-0500	RedLemon	Connection 27: done
default	16:02:14.776010-0500	RedLemon	tcp_output [C27.1.1:3] flags=[FP.] seq=1590834610, ack=1578651442, win=4747 state=LAST_ACK rcv_nxt=1578651442, snd_una=1590834571
default	16:02:14.776232-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:14.776444-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:02:14.776767-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:14.776917-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:14.777095-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:14.777096-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:14.857136-0500	RedLemon	Task <C89A7A00-1365-427B-A982-061961EA71AA>.<416> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:14.857569-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4BC0F0D3-FD09-4A22-9622-8DE2741E5E65] (reporting strategy default)> on Task <C89A7A00-1365-427B-A982-061961EA71AA>.<416> was not selected for reporting
default	16:02:14.858314-0500	RedLemon	Task <C89A7A00-1365-427B-A982-061961EA71AA>.<416> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:14.858572-0500	RedLemon	Task <C89A7A00-1365-427B-A982-061961EA71AA>.<416> now using Connection 1
default	16:02:14.859498-0500	RedLemon	0x7f86308dd908 ID=968 Task <C89A7A00-1365-427B-A982-061961EA71AA>.<416> sent request, body N 0
default	16:02:14.923038-0500	runningboardd	Invalidating assertion 169-5311-1042 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:14.971381-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:14.971609-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:02:14.972146-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:14.972313-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:14.972446-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:14.972506-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:15.001544-0500	RedLemon	0x7f86308dd908 ID=968 Task <C89A7A00-1365-427B-A982-061961EA71AA>.<416> received response, status 200 content U
default	16:02:15.002046-0500	RedLemon	Task <C89A7A00-1365-427B-A982-061961EA71AA>.<416> response ended
default	16:02:15.002438-0500	RedLemon	Task <C89A7A00-1365-427B-A982-061961EA71AA>.<416> done using Connection 1
default	16:02:15.002615-0500	RedLemon	Task <C89A7A00-1365-427B-A982-061961EA71AA>.<416> summary for task success {transaction_duration_ms=144, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=143, response_duration_ms=1, request_bytes=500, response_bytes=955, cache_hit=true}
default	16:02:15.002933-0500	RedLemon	Task <C89A7A00-1365-427B-A982-061961EA71AA>.<416> finished successfully
default	16:02:15.003721-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1043 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:15.004189-0500	runningboardd	Assertion 169-5311-1043 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:15.005645-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:15.005686-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:15.005724-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:15.005844-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501);169-5311-1042:com.apple.CFNetwork.StorageDB;169-5311-1043:com.apple.CFNetwork.StorageDB
default	16:02:15.015485-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:15.092684-0500	runningboardd	Attempting to rename power assertion 33549 for target anon<RedLemon>(501) to anon<RedLemon>(501)169-5311-1043:com.apple.CFNetwork.StorageDB
default	16:02:15.092900-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:15.093075-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:15.093126-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:15.285617-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:15.285927-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, position, type
default	16:02:15.286427-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:15.286638-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:15.286815-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:15.286915-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:15.490390-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:15.490731-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:02:15.491204-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:15.491416-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:15.491591-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:15.491667-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:15.797687-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:15.797971-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, position, type
default	16:02:15.798656-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:15.798857-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:15.799027-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:15.799114-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:16.002149-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:16.002420-0500	RedLemon	   Payload keys: timestamp, type, position, senderId, isPlaying
default	16:02:16.002860-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:16.003086-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:16.003262-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:16.003355-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:16.186965-0500	runningboardd	Invalidating assertion 169-5311-1043 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:16.291007-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:16.291541-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:16.291626-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:16.293530-0500	runningboardd	Invalidating assertion 169-103-1037 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:16.309417-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:16.309757-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:02:16.310148-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:16.310283-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:16.310386-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:16.310444-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:16.413455-0500	RedLemon	Task <B9F84CAF-DE48-4094-A009-4AAFB69EA511>.<417> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:16.413856-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5A721545-1A44-47F4-BF94-A0BD53D994EF] (reporting strategy default)> on Task <B9F84CAF-DE48-4094-A009-4AAFB69EA511>.<417> was not selected for reporting
default	16:02:16.414712-0500	RedLemon	Task <B9F84CAF-DE48-4094-A009-4AAFB69EA511>.<417> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:16.415014-0500	RedLemon	Task <B9F84CAF-DE48-4094-A009-4AAFB69EA511>.<417> now using Connection 1
default	16:02:16.416054-0500	RedLemon	0x7f863179fe78 ID=972 Task <B9F84CAF-DE48-4094-A009-4AAFB69EA511>.<417> sent request, body N 0
default	16:02:16.417244-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:16.417298-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:16.417376-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:16.475229-0500	RedLemon	0x7f863179fe78 ID=972 Task <B9F84CAF-DE48-4094-A009-4AAFB69EA511>.<417> received response, status 200 content U
default	16:02:16.476016-0500	RedLemon	Task <B9F84CAF-DE48-4094-A009-4AAFB69EA511>.<417> response ended
default	16:02:16.476474-0500	RedLemon	Task <B9F84CAF-DE48-4094-A009-4AAFB69EA511>.<417> done using Connection 1
default	16:02:16.476701-0500	RedLemon	Task <B9F84CAF-DE48-4094-A009-4AAFB69EA511>.<417> summary for task success {transaction_duration_ms=62, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=60, response_duration_ms=1, request_bytes=511, response_bytes=833, cache_hit=true}
default	16:02:16.477349-0500	RedLemon	Task <B9F84CAF-DE48-4094-A009-4AAFB69EA511>.<417> finished successfully
default	16:02:16.478655-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1044 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:16.478859-0500	runningboardd	Assertion 169-5311-1044 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:16.479293-0500	RedLemon	Task <78235187-C5A1-4E01-85E5-04B0958B5D9D>.<418> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:16.479693-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [750E0110-EE5B-46CD-87E8-377689F334D8] (reporting strategy default)> on Task <78235187-C5A1-4E01-85E5-04B0958B5D9D>.<418> was not selected for reporting
default	16:02:16.480485-0500	RedLemon	Task <78235187-C5A1-4E01-85E5-04B0958B5D9D>.<418> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:16.480763-0500	RedLemon	Task <78235187-C5A1-4E01-85E5-04B0958B5D9D>.<418> now using Connection 1
default	16:02:16.481739-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:16.481955-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:16.482014-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:16.481837-0500	RedLemon	0x7f862e298b08 ID=976 Task <78235187-C5A1-4E01-85E5-04B0958B5D9D>.<418> sent request, body N 0
default	16:02:16.484294-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1045 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:16.484461-0500	runningboardd	Assertion 169-103-1045 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:02:16.485373-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:16.485435-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:16.485544-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:16.487219-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:16.487423-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:02:16.487864-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:16.488008-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:16.488122-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:16.488188-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:16.618489-0500	RedLemon	0x7f862e298b08 ID=976 Task <78235187-C5A1-4E01-85E5-04B0958B5D9D>.<418> received response, status 200 content U
default	16:02:16.619076-0500	RedLemon	Task <78235187-C5A1-4E01-85E5-04B0958B5D9D>.<418> response ended
default	16:02:16.619514-0500	RedLemon	Task <78235187-C5A1-4E01-85E5-04B0958B5D9D>.<418> done using Connection 1
default	16:02:16.619741-0500	RedLemon	Task <78235187-C5A1-4E01-85E5-04B0958B5D9D>.<418> summary for task success {transaction_duration_ms=139, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=138, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:02:16.620292-0500	RedLemon	Task <78235187-C5A1-4E01-85E5-04B0958B5D9D>.<418> finished successfully
default	16:02:16.621153-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:16.622699-0500	RedLemon	Task <4FFA7415-01CA-4555-9E80-AFAFCDDF9A1D>.<419> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:16.623275-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0FF866D2-2ECA-458F-9CB4-D49423A48A6B] (reporting strategy default)> on Task <4FFA7415-01CA-4555-9E80-AFAFCDDF9A1D>.<419> was not selected for reporting
default	16:02:16.624105-0500	RedLemon	Task <4FFA7415-01CA-4555-9E80-AFAFCDDF9A1D>.<419> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:16.624392-0500	RedLemon	Task <4FFA7415-01CA-4555-9E80-AFAFCDDF9A1D>.<419> now using Connection 1
default	16:02:16.625344-0500	RedLemon	0x7f863179fe78 ID=980 Task <4FFA7415-01CA-4555-9E80-AFAFCDDF9A1D>.<419> sent request, body N 0
default	16:02:16.635562-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:16.692925-0500	RedLemon	0x7f863179fe78 ID=980 Task <4FFA7415-01CA-4555-9E80-AFAFCDDF9A1D>.<419> received response, status 200 content U
default	16:02:16.693608-0500	RedLemon	Task <4FFA7415-01CA-4555-9E80-AFAFCDDF9A1D>.<419> response ended
default	16:02:16.694063-0500	RedLemon	Task <4FFA7415-01CA-4555-9E80-AFAFCDDF9A1D>.<419> done using Connection 1
default	16:02:16.694292-0500	RedLemon	Task <4FFA7415-01CA-4555-9E80-AFAFCDDF9A1D>.<419> summary for task success {transaction_duration_ms=70, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:02:16.694936-0500	RedLemon	Task <4FFA7415-01CA-4555-9E80-AFAFCDDF9A1D>.<419> finished successfully
default	16:02:16.696389-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:16.728682-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:16.729274-0500	RedLemon	   Payload keys: senderId, isPlaying, position, type, timestamp
default	16:02:16.729744-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:16.729867-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:16.729981-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:16.730046-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:16.743334-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:17.026020-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:17.026391-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:02:17.026771-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:17.026879-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:17.026985-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:17.027036-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:17.147382-0500	RedLemon	Task <F9C09A1E-8DFE-4B98-B862-12217809B66E>.<420> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:17.147978-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3BEB441D-38E5-4764-9D8E-A73304956CE7] (reporting strategy default)> on Task <F9C09A1E-8DFE-4B98-B862-12217809B66E>.<420> was not selected for reporting
default	16:02:17.149138-0500	RedLemon	Task <F9C09A1E-8DFE-4B98-B862-12217809B66E>.<420> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:17.149444-0500	RedLemon	Task <F9C09A1E-8DFE-4B98-B862-12217809B66E>.<420> now using Connection 1
default	16:02:17.150667-0500	RedLemon	0x7f86315c33d8 ID=984 Task <F9C09A1E-8DFE-4B98-B862-12217809B66E>.<420> sent request, body N 0
default	16:02:17.214715-0500	RedLemon	0x7f86315c33d8 ID=984 Task <F9C09A1E-8DFE-4B98-B862-12217809B66E>.<420> received response, status 200 content U
default	16:02:17.215317-0500	RedLemon	Task <F9C09A1E-8DFE-4B98-B862-12217809B66E>.<420> response ended
default	16:02:17.215761-0500	RedLemon	Task <F9C09A1E-8DFE-4B98-B862-12217809B66E>.<420> done using Connection 1
default	16:02:17.215986-0500	RedLemon	Task <F9C09A1E-8DFE-4B98-B862-12217809B66E>.<420> summary for task success {transaction_duration_ms=67, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=66, response_duration_ms=1, request_bytes=500, response_bytes=955, cache_hit=true}
default	16:02:17.216527-0500	RedLemon	Task <F9C09A1E-8DFE-4B98-B862-12217809B66E>.<420> finished successfully
default	16:02:17.236790-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:17.237118-0500	RedLemon	   Payload keys: timestamp, type, position, isPlaying, senderId
default	16:02:17.237639-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:17.237929-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:17.238121-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:17.238205-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:17.247072-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:17.538304-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:17.538719-0500	RedLemon	   Payload keys: senderId, isPlaying, position, type, timestamp
default	16:02:17.539274-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:17.539484-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:17.539660-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:17.539748-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:17.580851-0500	runningboardd	Invalidating assertion 169-5311-1044 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:17.726418-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:17.726494-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:17.726567-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:17.728121-0500	runningboardd	Invalidating assertion 169-103-1045 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:17.743750-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:17.744065-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:02:17.744566-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:17.744775-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:17.744950-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:17.745076-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:17.897006-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:17.897089-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:17.897169-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:18.050393-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:18.050962-0500	RedLemon	   Payload keys: senderId, isPlaying, position, type, timestamp
default	16:02:18.051522-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:18.051799-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:18.052009-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:18.052090-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:18.254864-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:18.255160-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:02:18.255659-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:18.255876-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:18.256095-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:18.256131-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:18.561969-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:18.562278-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:18.562725-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:18.562943-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:18.563118-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:18.563210-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:18.766891-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:18.767215-0500	RedLemon	   Payload keys: senderId, isPlaying, position, type, timestamp
default	16:02:18.767674-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:18.767945-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:18.768147-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:18.768230-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:18.859272-0500	RedLemon	Task <6A255483-7CAA-49B3-9A2C-2E82933D0B27>.<421> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:18.859698-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5805A6B5-6247-43EB-99B8-4295DE6328DF] (reporting strategy default)> on Task <6A255483-7CAA-49B3-9A2C-2E82933D0B27>.<421> was not selected for reporting
default	16:02:18.860486-0500	RedLemon	Task <6A255483-7CAA-49B3-9A2C-2E82933D0B27>.<421> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:18.860680-0500	RedLemon	Task <6A255483-7CAA-49B3-9A2C-2E82933D0B27>.<421> now using Connection 1
default	16:02:18.861408-0500	RedLemon	0x7f863179fe78 ID=988 Task <6A255483-7CAA-49B3-9A2C-2E82933D0B27>.<421> sent request, body N 0
default	16:02:18.928219-0500	RedLemon	0x7f863179fe78 ID=988 Task <6A255483-7CAA-49B3-9A2C-2E82933D0B27>.<421> received response, status 200 content U
default	16:02:18.928787-0500	RedLemon	Task <6A255483-7CAA-49B3-9A2C-2E82933D0B27>.<421> response ended
default	16:02:18.929181-0500	RedLemon	Task <6A255483-7CAA-49B3-9A2C-2E82933D0B27>.<421> done using Connection 1
default	16:02:18.929374-0500	RedLemon	Task <6A255483-7CAA-49B3-9A2C-2E82933D0B27>.<421> summary for task success {transaction_duration_ms=69, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=67, response_duration_ms=1, request_bytes=511, response_bytes=833, cache_hit=true}
default	16:02:18.929780-0500	RedLemon	Task <6A255483-7CAA-49B3-9A2C-2E82933D0B27>.<421> finished successfully
default	16:02:18.931850-0500	RedLemon	Task <FABBF6B7-06F9-48DD-9AF1-666E281D9410>.<422> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:18.931876-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1046 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:18.932410-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7986BB02-A565-415B-9E10-74996ED712A1] (reporting strategy default)> on Task <FABBF6B7-06F9-48DD-9AF1-666E281D9410>.<422> was not selected for reporting
default	16:02:18.933232-0500	runningboardd	Assertion 169-5311-1046 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:18.933393-0500	RedLemon	Task <FABBF6B7-06F9-48DD-9AF1-666E281D9410>.<422> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:18.933707-0500	RedLemon	Task <FABBF6B7-06F9-48DD-9AF1-666E281D9410>.<422> now using Connection 1
default	16:02:18.934811-0500	RedLemon	0x7f863179fe78 ID=992 Task <FABBF6B7-06F9-48DD-9AF1-666E281D9410>.<422> sent request, body N 0
default	16:02:18.936367-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:18.936528-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:18.936676-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:18.938822-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1047 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:18.938978-0500	runningboardd	Assertion 169-103-1047 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:02:18.940356-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:18.940471-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:18.940782-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:18.940857-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:18.997133-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:18.997416-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, type, senderId
default	16:02:18.998061-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:18.998339-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:18.998519-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:18.998598-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:19.009664-0500	RedLemon	0x7f863179fe78 ID=992 Task <FABBF6B7-06F9-48DD-9AF1-666E281D9410>.<422> received response, status 200 content U
default	16:02:19.010232-0500	RedLemon	Task <FABBF6B7-06F9-48DD-9AF1-666E281D9410>.<422> response ended
default	16:02:19.010694-0500	RedLemon	Task <FABBF6B7-06F9-48DD-9AF1-666E281D9410>.<422> done using Connection 1
default	16:02:19.010992-0500	RedLemon	Task <FABBF6B7-06F9-48DD-9AF1-666E281D9410>.<422> summary for task success {transaction_duration_ms=78, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=76, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:02:19.011832-0500	RedLemon	Task <FABBF6B7-06F9-48DD-9AF1-666E281D9410>.<422> finished successfully
default	16:02:19.015444-0500	RedLemon	Task <9B530908-352C-430B-BF6E-D94A420FD068>.<423> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:19.015976-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4F5F7AB6-6373-4E1A-949A-491798CCE683] (reporting strategy default)> on Task <9B530908-352C-430B-BF6E-D94A420FD068>.<423> was not selected for reporting
default	16:02:19.016731-0500	RedLemon	Task <9B530908-352C-430B-BF6E-D94A420FD068>.<423> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:19.016946-0500	RedLemon	Task <9B530908-352C-430B-BF6E-D94A420FD068>.<423> now using Connection 1
default	16:02:19.017791-0500	RedLemon	0x7f86315c33d8 ID=996 Task <9B530908-352C-430B-BF6E-D94A420FD068>.<423> sent request, body N 0
default	16:02:19.024230-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:19.081379-0500	RedLemon	0x7f86315c33d8 ID=996 Task <9B530908-352C-430B-BF6E-D94A420FD068>.<423> received response, status 200 content U
default	16:02:19.081860-0500	RedLemon	Task <9B530908-352C-430B-BF6E-D94A420FD068>.<423> response ended
default	16:02:19.082293-0500	RedLemon	Task <9B530908-352C-430B-BF6E-D94A420FD068>.<423> done using Connection 1
default	16:02:19.082474-0500	RedLemon	Task <9B530908-352C-430B-BF6E-D94A420FD068>.<423> summary for task success {transaction_duration_ms=66, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:02:19.082685-0500	RedLemon	Task <9B530908-352C-430B-BF6E-D94A420FD068>.<423> finished successfully
default	16:02:19.084229-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:19.089531-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:19.278924-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:19.279330-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, position, type
default	16:02:19.279788-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:19.280000-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:19.280184-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:19.280275-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:19.415077-0500	RedLemon	Task <FED45FA1-253A-4449-AD69-6D563E87A6AD>.<424> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:19.415544-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [866B4BC4-195F-46A9-84F0-FF8475DB5167] (reporting strategy default)> on Task <FED45FA1-253A-4449-AD69-6D563E87A6AD>.<424> was not selected for reporting
default	16:02:19.416768-0500	RedLemon	Task <FED45FA1-253A-4449-AD69-6D563E87A6AD>.<424> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:19.417081-0500	RedLemon	Task <FED45FA1-253A-4449-AD69-6D563E87A6AD>.<424> now using Connection 1
default	16:02:19.418267-0500	RedLemon	0x7f86315c33d8 ID=1000 Task <FED45FA1-253A-4449-AD69-6D563E87A6AD>.<424> sent request, body N 0
default	16:02:19.434658-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:19.434969-0500	RedLemon	   Payload keys: senderId, isPlaying, position, type, timestamp
default	16:02:19.435484-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:19.435700-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:19.435874-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:19.435961-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:19.488765-0500	RedLemon	0x7f86315c33d8 ID=1000 Task <FED45FA1-253A-4449-AD69-6D563E87A6AD>.<424> received response, status 200 content U
default	16:02:19.489475-0500	RedLemon	Task <FED45FA1-253A-4449-AD69-6D563E87A6AD>.<424> response ended
default	16:02:19.490151-0500	RedLemon	Task <FED45FA1-253A-4449-AD69-6D563E87A6AD>.<424> done using Connection 1
default	16:02:19.490447-0500	RedLemon	Task <FED45FA1-253A-4449-AD69-6D563E87A6AD>.<424> summary for task success {transaction_duration_ms=74, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=72, response_duration_ms=1, request_bytes=500, response_bytes=956, cache_hit=true}
default	16:02:19.491616-0500	RedLemon	Task <FED45FA1-253A-4449-AD69-6D563E87A6AD>.<424> finished successfully
default	16:02:19.531800-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:19.791111-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:19.791448-0500	RedLemon	   Payload keys: position, isPlaying, timestamp, type, senderId
default	16:02:19.792376-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:19.792721-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:19.792927-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:19.793051-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:19.996627-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:19.996942-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, position, type
default	16:02:19.997606-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:19.997788-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:19.997966-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:19.998064-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:20.033191-0500	runningboardd	Invalidating assertion 169-5311-1046 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:20.184020-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:20.184099-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:20.184170-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:20.186180-0500	runningboardd	Invalidating assertion 169-103-1047 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:20.302824-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:20.303137-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:02:20.303572-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:20.303791-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:20.303962-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:20.304042-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:20.342423-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:20.342504-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:20.342578-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:20.507620-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:20.507885-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:20.508315-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:20.508524-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:20.508781-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:20.508701-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:20.814826-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:20.815177-0500	RedLemon	   Payload keys: timestamp, type, position, senderId, isPlaying
default	16:02:20.815659-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:20.815877-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:20.816056-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:20.816155-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:21.215924-0500	RedLemon	Task <67613D99-7552-47C2-9810-7C657F482DE5>.<425> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:21.216495-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [EAB46561-49F0-4513-AE3A-90885A875011] (reporting strategy default)> on Task <67613D99-7552-47C2-9810-7C657F482DE5>.<425> was not selected for reporting
default	16:02:21.217709-0500	RedLemon	Task <67613D99-7552-47C2-9810-7C657F482DE5>.<425> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:21.218012-0500	RedLemon	Task <67613D99-7552-47C2-9810-7C657F482DE5>.<425> now using Connection 1
default	16:02:21.219407-0500	RedLemon	0x7f8632dd12b8 ID=1004 Task <67613D99-7552-47C2-9810-7C657F482DE5>.<425> sent request, body N 0
default	16:02:21.223788-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:21.223995-0500	RedLemon	   Payload keys: position, isPlaying, timestamp, type, senderId
default	16:02:21.224395-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:21.224548-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:21.224654-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:21.224709-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:21.262875-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:21.263091-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:02:21.263653-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:21.263937-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:21.264188-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:21.264333-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:21.293695-0500	RedLemon	0x7f8632dd12b8 ID=1004 Task <67613D99-7552-47C2-9810-7C657F482DE5>.<425> received response, status 200 content U
default	16:02:21.294558-0500	RedLemon	Task <67613D99-7552-47C2-9810-7C657F482DE5>.<425> response ended
default	16:02:21.295193-0500	RedLemon	Task <67613D99-7552-47C2-9810-7C657F482DE5>.<425> done using Connection 1
default	16:02:21.295553-0500	RedLemon	Task <67613D99-7552-47C2-9810-7C657F482DE5>.<425> summary for task success {transaction_duration_ms=78, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=76, response_duration_ms=1, request_bytes=511, response_bytes=834, cache_hit=true}
default	16:02:21.295759-0500	RedLemon	Task <67613D99-7552-47C2-9810-7C657F482DE5>.<425> finished successfully
default	16:02:21.298576-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1048 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:21.298999-0500	runningboardd	Assertion 169-5311-1048 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:21.299088-0500	RedLemon	Task <E1733E4D-D1D3-4D8A-9998-4B5E6EE21EBB>.<426> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:21.299912-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6444D7A1-C818-4296-B7D6-75207D30BB2E] (reporting strategy default)> on Task <E1733E4D-D1D3-4D8A-9998-4B5E6EE21EBB>.<426> was not selected for reporting
default	16:02:21.301217-0500	RedLemon	Task <E1733E4D-D1D3-4D8A-9998-4B5E6EE21EBB>.<426> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:21.301529-0500	RedLemon	Task <E1733E4D-D1D3-4D8A-9998-4B5E6EE21EBB>.<426> now using Connection 1
default	16:02:21.302521-0500	RedLemon	0x7f862e298b08 ID=1008 Task <E1733E4D-D1D3-4D8A-9998-4B5E6EE21EBB>.<426> sent request, body N 0
default	16:02:21.302678-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:21.302721-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:21.302757-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:21.305255-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1049 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:21.305892-0500	runningboardd	Assertion 169-103-1049 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:02:21.307385-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:21.307682-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:21.307848-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:21.326297-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:21.386143-0500	RedLemon	0x7f862e298b08 ID=1008 Task <E1733E4D-D1D3-4D8A-9998-4B5E6EE21EBB>.<426> received response, status 200 content U
default	16:02:21.386732-0500	RedLemon	Task <E1733E4D-D1D3-4D8A-9998-4B5E6EE21EBB>.<426> response ended
default	16:02:21.387164-0500	RedLemon	Task <E1733E4D-D1D3-4D8A-9998-4B5E6EE21EBB>.<426> done using Connection 1
default	16:02:21.387389-0500	RedLemon	Task <E1733E4D-D1D3-4D8A-9998-4B5E6EE21EBB>.<426> summary for task success {transaction_duration_ms=86, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=85, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:02:21.388037-0500	RedLemon	Task <E1733E4D-D1D3-4D8A-9998-4B5E6EE21EBB>.<426> finished successfully
default	16:02:21.390295-0500	RedLemon	Task <5BEA7D7D-1F74-46DC-BA8E-750D18621887>.<427> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:21.390608-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E798BBA0-D7D5-4891-960A-17BA0117B4C3] (reporting strategy default)> on Task <5BEA7D7D-1F74-46DC-BA8E-750D18621887>.<427> was not selected for reporting
default	16:02:21.391432-0500	RedLemon	Task <5BEA7D7D-1F74-46DC-BA8E-750D18621887>.<427> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:21.391796-0500	RedLemon	Task <5BEA7D7D-1F74-46DC-BA8E-750D18621887>.<427> now using Connection 1
default	16:02:21.392966-0500	RedLemon	0x7f8633a32ed8 ID=1012 Task <5BEA7D7D-1F74-46DC-BA8E-750D18621887>.<427> sent request, body N 0
default	16:02:21.409929-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:21.462650-0500	RedLemon	0x7f8633a32ed8 ID=1012 Task <5BEA7D7D-1F74-46DC-BA8E-750D18621887>.<427> received response, status 200 content U
default	16:02:21.463232-0500	RedLemon	Task <5BEA7D7D-1F74-46DC-BA8E-750D18621887>.<427> response ended
default	16:02:21.463660-0500	RedLemon	Task <5BEA7D7D-1F74-46DC-BA8E-750D18621887>.<427> done using Connection 1
default	16:02:21.463886-0500	RedLemon	Task <5BEA7D7D-1F74-46DC-BA8E-750D18621887>.<427> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=71, response_duration_ms=1, request_bytes=524, response_bytes=839, cache_hit=true}
default	16:02:21.464436-0500	RedLemon	Task <5BEA7D7D-1F74-46DC-BA8E-750D18621887>.<427> finished successfully
default	16:02:21.466234-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:21.476654-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:21.476912-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:21.477381-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:21.477514-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:21.477669-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:21.477618-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:21.504209-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:21.691672-0500	RedLemon	Task <AB308DF7-6284-4217-83DA-57E3517ADF02>.<428> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:21.692352-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F3A68244-8304-4E60-88D2-99B21F999901] (reporting strategy default)> on Task <AB308DF7-6284-4217-83DA-57E3517ADF02>.<428> was not selected for reporting
default	16:02:21.693871-0500	RedLemon	Task <AB308DF7-6284-4217-83DA-57E3517ADF02>.<428> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:21.694310-0500	RedLemon	Task <AB308DF7-6284-4217-83DA-57E3517ADF02>.<428> now using Connection 1
default	16:02:21.695662-0500	RedLemon	0x7f862e298b08 ID=1016 Task <AB308DF7-6284-4217-83DA-57E3517ADF02>.<428> sent request, body N 0
default	16:02:21.731102-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:21.731429-0500	RedLemon	   Payload keys: position, isPlaying, timestamp, type, senderId
default	16:02:21.731882-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:21.732167-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:21.732424-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:21.732510-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:21.763257-0500	RedLemon	0x7f862e298b08 ID=1016 Task <AB308DF7-6284-4217-83DA-57E3517ADF02>.<428> received response, status 200 content U
default	16:02:21.763940-0500	RedLemon	Task <AB308DF7-6284-4217-83DA-57E3517ADF02>.<428> response ended
default	16:02:21.764434-0500	RedLemon	Task <AB308DF7-6284-4217-83DA-57E3517ADF02>.<428> done using Connection 1
default	16:02:21.764719-0500	RedLemon	Task <AB308DF7-6284-4217-83DA-57E3517ADF02>.<428> summary for task success {transaction_duration_ms=71, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=70, response_duration_ms=1, request_bytes=500, response_bytes=955, cache_hit=true}
default	16:02:21.765239-0500	RedLemon	Task <AB308DF7-6284-4217-83DA-57E3517ADF02>.<428> finished successfully
default	16:02:21.804047-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:22.043694-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:22.044022-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:02:22.044543-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:22.044765-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:22.044946-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:22.045027-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:22.248492-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:22.248754-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, position, type
default	16:02:22.249356-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:22.249567-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:22.249739-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:22.249830-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:22.349762-0500	runningboardd	Invalidating assertion 169-5311-1048 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:22.454046-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:22.454602-0500	RedLemon	   Payload keys: senderId, isPlaying, position, type, timestamp
default	16:02:22.455177-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:22.455343-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:22.455507-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:22.455581-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:22.477159-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:22.477231-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:22.477309-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:22.480869-0500	runningboardd	Invalidating assertion 169-103-1049 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:22.654301-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:22.654381-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:22.654454-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:22.760667-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:22.761008-0500	RedLemon	   Payload keys: isPlaying, senderId, type, timestamp, position
default	16:02:22.761476-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:22.761678-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:22.761853-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:22.761941-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:22.938067-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:22.938405-0500	RedLemon	   Payload keys: isPlaying, timestamp, senderId, position, type
default	16:02:22.938853-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:22.939055-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:22.939229-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:22.939326-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:23.272183-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:23.272522-0500	RedLemon	   Payload keys: senderId, isPlaying, position, type, timestamp
default	16:02:23.272979-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:23.273189-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:23.273365-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:23.273462-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:23.476964-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:23.477360-0500	RedLemon	   Payload keys: isPlaying, senderId, type, timestamp, position
default	16:02:23.477917-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:23.478137-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:23.478317-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:23.478406-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:23.625720-0500	RedLemon	Task <B45BA417-CA1B-4BF9-B433-7ED2C864125F>.<429> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:23.626368-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [675F17F3-63BE-485C-BC06-5DF56F179396] (reporting strategy default)> on Task <B45BA417-CA1B-4BF9-B433-7ED2C864125F>.<429> was not selected for reporting
default	16:02:23.627871-0500	RedLemon	Task <B45BA417-CA1B-4BF9-B433-7ED2C864125F>.<429> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:23.628308-0500	RedLemon	Task <B45BA417-CA1B-4BF9-B433-7ED2C864125F>.<429> now using Connection 1
default	16:02:23.629225-0500	RedLemon	0x7f863179fe78 ID=1020 Task <B45BA417-CA1B-4BF9-B433-7ED2C864125F>.<429> sent request, body N 0
default	16:02:23.704864-0500	RedLemon	0x7f863179fe78 ID=1020 Task <B45BA417-CA1B-4BF9-B433-7ED2C864125F>.<429> received response, status 200 content U
default	16:02:23.705454-0500	RedLemon	Task <B45BA417-CA1B-4BF9-B433-7ED2C864125F>.<429> response ended
default	16:02:23.705895-0500	RedLemon	Task <B45BA417-CA1B-4BF9-B433-7ED2C864125F>.<429> done using Connection 1
default	16:02:23.706121-0500	RedLemon	Task <B45BA417-CA1B-4BF9-B433-7ED2C864125F>.<429> summary for task success {transaction_duration_ms=79, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=77, response_duration_ms=1, request_bytes=511, response_bytes=836, cache_hit=true}
default	16:02:23.706675-0500	RedLemon	Task <B45BA417-CA1B-4BF9-B433-7ED2C864125F>.<429> finished successfully
default	16:02:23.708349-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1050 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:23.708695-0500	runningboardd	Assertion 169-5311-1050 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:23.708811-0500	RedLemon	Task <8FFFECB5-F54E-4452-A7CF-F83CE75FC35C>.<430> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:23.709233-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [483918DD-52FF-4C78-B536-4A4D2205A776] (reporting strategy default)> on Task <8FFFECB5-F54E-4452-A7CF-F83CE75FC35C>.<430> was not selected for reporting
default	16:02:23.710006-0500	RedLemon	Task <8FFFECB5-F54E-4452-A7CF-F83CE75FC35C>.<430> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:23.710280-0500	RedLemon	Task <8FFFECB5-F54E-4452-A7CF-F83CE75FC35C>.<430> now using Connection 1
default	16:02:23.711357-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:23.711687-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:23.711431-0500	RedLemon	0x7f863179fe78 ID=1024 Task <8FFFECB5-F54E-4452-A7CF-F83CE75FC35C>.<430> sent request, body N 0
default	16:02:23.711853-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:23.713813-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1051 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:23.714009-0500	runningboardd	Assertion 169-103-1051 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:02:23.714828-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:23.714921-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:23.714972-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:23.725480-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:23.729197-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:23.729481-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:23.730029-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:23.730246-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:23.730420-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:23.730515-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:23.775577-0500	RedLemon	0x7f863179fe78 ID=1024 Task <8FFFECB5-F54E-4452-A7CF-F83CE75FC35C>.<430> received response, status 200 content U
default	16:02:23.776246-0500	RedLemon	Task <8FFFECB5-F54E-4452-A7CF-F83CE75FC35C>.<430> response ended
default	16:02:23.776684-0500	RedLemon	Task <8FFFECB5-F54E-4452-A7CF-F83CE75FC35C>.<430> done using Connection 1
default	16:02:23.777018-0500	RedLemon	Task <8FFFECB5-F54E-4452-A7CF-F83CE75FC35C>.<430> summary for task success {transaction_duration_ms=67, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=65, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:02:23.777595-0500	RedLemon	Task <8FFFECB5-F54E-4452-A7CF-F83CE75FC35C>.<430> finished successfully
default	16:02:23.778255-0500	RedLemon	Task <D4043B01-3F59-4E3E-8392-3E4626755001>.<431> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:23.779304-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BB3FEF81-A853-4041-ABE8-8FE96DAB5A56] (reporting strategy default)> on Task <D4043B01-3F59-4E3E-8392-3E4626755001>.<431> was not selected for reporting
default	16:02:23.780122-0500	RedLemon	Task <D4043B01-3F59-4E3E-8392-3E4626755001>.<431> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:23.780333-0500	RedLemon	Task <196C08A3-CD7F-49E5-8422-833FB35EF751>.<432> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:23.780447-0500	RedLemon	Task <D4043B01-3F59-4E3E-8392-3E4626755001>.<431> now using Connection 1
default	16:02:23.780946-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E5523659-C788-46F2-AB88-379C633C5D60] (reporting strategy default)> on Task <196C08A3-CD7F-49E5-8422-833FB35EF751>.<432> was not selected for reporting
default	16:02:23.782001-0500	RedLemon	Task <196C08A3-CD7F-49E5-8422-833FB35EF751>.<432> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:23.782181-0500	RedLemon	Task <196C08A3-CD7F-49E5-8422-833FB35EF751>.<432> now using Connection 1
default	16:02:23.783169-0500	RedLemon	0x7f8630843c88 ID=1028 Task <D4043B01-3F59-4E3E-8392-3E4626755001>.<431> sent request, body N 0
default	16:02:23.783215-0500	RedLemon	0x7f8632dd12b8 ID=1032 Task <196C08A3-CD7F-49E5-8422-833FB35EF751>.<432> sent request, body N 0
default	16:02:23.797488-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:23.841190-0500	RedLemon	0x7f8630843c88 ID=1028 Task <D4043B01-3F59-4E3E-8392-3E4626755001>.<431> received response, status 200 content U
default	16:02:23.841958-0500	RedLemon	Task <D4043B01-3F59-4E3E-8392-3E4626755001>.<431> response ended
default	16:02:23.842366-0500	RedLemon	Task <D4043B01-3F59-4E3E-8392-3E4626755001>.<431> done using Connection 1
default	16:02:23.842592-0500	RedLemon	Task <D4043B01-3F59-4E3E-8392-3E4626755001>.<431> summary for task success {transaction_duration_ms=62, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=2, response_start_ms=61, response_duration_ms=1, request_bytes=500, response_bytes=954, cache_hit=true}
default	16:02:23.843364-0500	RedLemon	Task <D4043B01-3F59-4E3E-8392-3E4626755001>.<431> finished successfully
default	16:02:23.855925-0500	RedLemon	0x7f8632dd12b8 ID=1032 Task <196C08A3-CD7F-49E5-8422-833FB35EF751>.<432> received response, status 200 content U
default	16:02:23.856689-0500	RedLemon	Task <196C08A3-CD7F-49E5-8422-833FB35EF751>.<432> response ended
default	16:02:23.857125-0500	RedLemon	Task <196C08A3-CD7F-49E5-8422-833FB35EF751>.<432> done using Connection 1
default	16:02:23.857376-0500	RedLemon	Task <196C08A3-CD7F-49E5-8422-833FB35EF751>.<432> summary for task success {transaction_duration_ms=76, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=74, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:02:23.857943-0500	RedLemon	Task <196C08A3-CD7F-49E5-8422-833FB35EF751>.<432> finished successfully
default	16:02:23.860413-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:23.939199-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:23.939603-0500	RedLemon	   Payload keys: isPlaying, senderId, type, timestamp, position
default	16:02:23.940052-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:23.940265-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:23.940439-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:23.940526-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:23.991308-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:24.398780-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:24.399122-0500	RedLemon	   Payload keys: position, isPlaying, timestamp, type, senderId
default	16:02:24.399746-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:24.399972-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:24.400137-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:24.400207-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:24.458843-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:24.459216-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:24.459942-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:24.460179-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:24.460445-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:24.460445-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:24.698363-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:24.698537-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:02:24.698807-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:24.698940-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:24.699048-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:24.699107-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:24.784030-0500	RedLemon	Connection 25: cleaning up
default	16:02:24.784192-0500	RedLemon	[C25 637C87C6-7FA3-44B3-A886-28C9A553C8B5 Hostname#314b9ea3:443 quic-connection, url hash: 8980cd49, definite, attribution: developer] cancel
default	16:02:24.784415-0500	RedLemon	[C25 637C87C6-7FA3-44B3-A886-28C9A553C8B5 Hostname#314b9ea3:443 quic-connection, url hash: 8980cd49, definite, attribution: developer] cancelled
	[C25.1.1 70E0EEBB-BE92-4F86-8D52-32A3AA575C96 2607:fea8:995b:fd00:7141:6ed:4959:38c8.55992<->IPv6#ee94bece.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 60.449s, DNS @0.006s took 0.124s, TCP @0.227s took 0.026s, TLS 1.2 took 0.161s
	bytes in/out: 4307/1152, packets in/out: 7/10, rtt: 0.020s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:02:24.784974-0500	runningboardd	Invalidating assertion 169-5311-1050 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:24.785372-0500	RedLemon	nw_protocol_tcp_log_summary [C25.1.1:3] 
	[EB902F84-7B64-4106-B17F-3F8C0C1CAB34 <private>:55992<-><private>:443]
	Init: 1, Conn_Time: 24.738ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 5, rtt: 20.562ms, rtt_var: 6.812ms rtt_nc: 24.281ms, rtt_var_nc: 6.375ms base rtt: 20ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	16:02:24.785547-0500	RedLemon	nw_flow_disconnected [C25.1.1 IPv6#ee94bece.443 cancelled channel-flow ((null))] Output protocol disconnected
default	16:02:24.786495-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C25] reporting state cancelled
default	16:02:24.787671-0500	RedLemon	Connection 25: done
default	16:02:24.787734-0500	RedLemon	tcp_output [C25.1.1:3] flags=[F.] seq=1171606442, ack=2151223566, win=2048 state=FIN_WAIT_1 rcv_nxt=2151223566, snd_una=1171606411
default	16:02:24.802339-0500	RedLemon	tcp_output [C25.1.1:3] flags=[FP.] seq=1171606411, ack=2151223566, win=2048 state=FIN_WAIT_1 rcv_nxt=2151223566, snd_una=1171606411
default	16:02:24.808007-0500	RedLemon	tcp_input [C25.1.1:3] flags=[F.] seq=2151223566, ack=1171606443, win=16 state=FIN_WAIT_2 rcv_nxt=2151223566, snd_una=1171606443
default	16:02:24.896796-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:24.896843-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:24.896974-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:24.898509-0500	runningboardd	Invalidating assertion 169-103-1051 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:24.945067-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:24.945516-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:24.946027-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:24.946228-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:24.946403-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:24.946497-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:25.075109-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:25.075249-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:25.075342-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:25.320696-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:25.320964-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:25.321400-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:25.321610-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:25.321785-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:25.321876-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:25.525965-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:25.526693-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:25.527205-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:25.527420-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:25.527601-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:25.527693-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:25.730130-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:25.730510-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:25.731113-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:25.731277-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:25.731435-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:25.731499-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:26.029629-0500	RedLemon	Task <53E7F8F5-3844-4AA0-8EC2-30193CE6B94E>.<434> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:26.029624-0500	RedLemon	Task <2601307A-AAC1-4DD1-A7C8-50D759C34C2F>.<433> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:26.030452-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D9237AC4-B302-4D59-AC2E-D7B69FF9D9A4] (reporting strategy default)> on Task <2601307A-AAC1-4DD1-A7C8-50D759C34C2F>.<433> was not selected for reporting
default	16:02:26.030515-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [66AB13B1-96EC-4164-9BFE-D346006D3235] (reporting strategy default)> on Task <53E7F8F5-3844-4AA0-8EC2-30193CE6B94E>.<434> was not selected for reporting
default	16:02:26.031512-0500	RedLemon	Task <2601307A-AAC1-4DD1-A7C8-50D759C34C2F>.<433> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:26.031749-0500	RedLemon	Task <2601307A-AAC1-4DD1-A7C8-50D759C34C2F>.<433> now using Connection 1
default	16:02:26.032656-0500	RedLemon	Task <53E7F8F5-3844-4AA0-8EC2-30193CE6B94E>.<434> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:26.032812-0500	RedLemon	Task <53E7F8F5-3844-4AA0-8EC2-30193CE6B94E>.<434> now using Connection 1
default	16:02:26.033653-0500	RedLemon	0x7f862e298b08 ID=1036 Task <2601307A-AAC1-4DD1-A7C8-50D759C34C2F>.<433> sent request, body N 0
default	16:02:26.033751-0500	RedLemon	0x7f86316e74a8 ID=1040 Task <53E7F8F5-3844-4AA0-8EC2-30193CE6B94E>.<434> sent request, body N 0
default	16:02:26.036787-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:26.036981-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:02:26.037312-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:26.037442-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:26.037555-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:26.037619-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:26.100222-0500	RedLemon	0x7f86316e74a8 ID=1040 Task <53E7F8F5-3844-4AA0-8EC2-30193CE6B94E>.<434> received response, status 200 content U
default	16:02:26.100718-0500	RedLemon	Task <53E7F8F5-3844-4AA0-8EC2-30193CE6B94E>.<434> response ended
default	16:02:26.101069-0500	RedLemon	Task <53E7F8F5-3844-4AA0-8EC2-30193CE6B94E>.<434> done using Connection 1
default	16:02:26.101340-0500	RedLemon	Task <53E7F8F5-3844-4AA0-8EC2-30193CE6B94E>.<434> summary for task success {transaction_duration_ms=70, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=68, response_duration_ms=1, request_bytes=500, response_bytes=956, cache_hit=true}
default	16:02:26.101557-0500	RedLemon	Task <53E7F8F5-3844-4AA0-8EC2-30193CE6B94E>.<434> finished successfully
default	16:02:26.102334-0500	RedLemon	0x7f862e298b08 ID=1036 Task <2601307A-AAC1-4DD1-A7C8-50D759C34C2F>.<433> received response, status 200 content U
default	16:02:26.102861-0500	RedLemon	Task <2601307A-AAC1-4DD1-A7C8-50D759C34C2F>.<433> response ended
default	16:02:26.103363-0500	RedLemon	Task <2601307A-AAC1-4DD1-A7C8-50D759C34C2F>.<433> done using Connection 1
default	16:02:26.103538-0500	RedLemon	Task <2601307A-AAC1-4DD1-A7C8-50D759C34C2F>.<433> summary for task success {transaction_duration_ms=72, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=71, response_duration_ms=1, request_bytes=511, response_bytes=833, cache_hit=true}
default	16:02:26.103945-0500	RedLemon	Task <2601307A-AAC1-4DD1-A7C8-50D759C34C2F>.<433> finished successfully
default	16:02:26.104810-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1052 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:26.105074-0500	runningboardd	Assertion 169-5311-1052 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:26.105762-0500	RedLemon	Task <8E0982B6-AFD4-4141-A3AE-61F50286B294>.<435> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:26.106128-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0AB308EE-E0EF-457B-8BD8-B500DA65BBD9] (reporting strategy default)> on Task <8E0982B6-AFD4-4141-A3AE-61F50286B294>.<435> was not selected for reporting
default	16:02:26.106873-0500	RedLemon	Task <8E0982B6-AFD4-4141-A3AE-61F50286B294>.<435> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:26.107155-0500	RedLemon	Task <8E0982B6-AFD4-4141-A3AE-61F50286B294>.<435> now using Connection 1
default	16:02:26.107580-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:26.107790-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:26.108172-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:26.108067-0500	RedLemon	0x7f8630a807f8 ID=1044 Task <8E0982B6-AFD4-4141-A3AE-61F50286B294>.<435> sent request, body N 0
default	16:02:26.110261-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1053 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:26.110424-0500	runningboardd	Assertion 169-103-1053 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:02:26.112076-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:26.112129-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:26.112171-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:26.117022-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:26.121918-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:26.174772-0500	RedLemon	0x7f8630a807f8 ID=1044 Task <8E0982B6-AFD4-4141-A3AE-61F50286B294>.<435> received response, status 200 content U
default	16:02:26.175385-0500	RedLemon	Task <8E0982B6-AFD4-4141-A3AE-61F50286B294>.<435> response ended
default	16:02:26.175900-0500	RedLemon	Task <8E0982B6-AFD4-4141-A3AE-61F50286B294>.<435> done using Connection 1
default	16:02:26.176254-0500	RedLemon	Task <8E0982B6-AFD4-4141-A3AE-61F50286B294>.<435> summary for task success {transaction_duration_ms=69, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=67, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:02:26.176987-0500	RedLemon	Task <8E0982B6-AFD4-4141-A3AE-61F50286B294>.<435> finished successfully
default	16:02:26.178917-0500	RedLemon	Task <1679F65D-0331-4295-90C7-11B5BB88532E>.<436> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:26.179234-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A7584DA5-1B9D-4EE9-AE1A-54D2E71EDF61] (reporting strategy default)> on Task <1679F65D-0331-4295-90C7-11B5BB88532E>.<436> was not selected for reporting
default	16:02:26.179958-0500	RedLemon	Task <1679F65D-0331-4295-90C7-11B5BB88532E>.<436> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:26.180187-0500	RedLemon	Task <1679F65D-0331-4295-90C7-11B5BB88532E>.<436> now using Connection 1
default	16:02:26.181000-0500	RedLemon	0x7f8630843c88 ID=1048 Task <1679F65D-0331-4295-90C7-11B5BB88532E>.<436> sent request, body N 0
default	16:02:26.188909-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:26.209944-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:26.210242-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:26.210679-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:26.210901-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:26.211071-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:26.211159-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:26.248130-0500	RedLemon	0x7f8630843c88 ID=1048 Task <1679F65D-0331-4295-90C7-11B5BB88532E>.<436> received response, status 200 content U
default	16:02:26.248872-0500	RedLemon	Task <1679F65D-0331-4295-90C7-11B5BB88532E>.<436> response ended
default	16:02:26.249342-0500	RedLemon	Task <1679F65D-0331-4295-90C7-11B5BB88532E>.<436> done using Connection 1
default	16:02:26.249561-0500	RedLemon	Task <1679F65D-0331-4295-90C7-11B5BB88532E>.<436> summary for task success {transaction_duration_ms=70, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=68, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	16:02:26.249927-0500	RedLemon	Task <1679F65D-0331-4295-90C7-11B5BB88532E>.<436> finished successfully
default	16:02:26.252024-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:26.288904-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:26.548939-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:26.549248-0500	RedLemon	   Payload keys: timestamp, isPlaying, position, senderId, type
default	16:02:26.549686-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:26.549899-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:26.550069-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:26.550148-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:26.868453-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:26.868699-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:26.869139-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:26.869343-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:26.869514-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:26.869610-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:26.978954-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:26.979239-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:26.979794-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:26.980035-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:26.980215-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:26.980292-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:27.212805-0500	runningboardd	Invalidating assertion 169-5311-1052 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:27.215604-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:27.215934-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:27.216432-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:27.216639-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:27.216819-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:27.216908-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:27.389039-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:27.389233-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:27.389297-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:27.391038-0500	runningboardd	Invalidating assertion 169-103-1053 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:27.521023-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:27.521116-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:27.521200-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:27.549340-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:27.549530-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:27.549840-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:27.550017-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:27.550128-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:27.550184-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:27.658179-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:27.658485-0500	RedLemon	   Payload keys: senderId, type, timestamp, isPlaying, position
default	16:02:27.658920-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:27.659132-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:27.659300-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:27.659389-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:28.085046-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:28.085361-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:28.085964-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:28.086142-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:28.086316-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:28.086410-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:28.158015-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:28.158324-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:28.158866-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:28.159075-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:28.159255-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:28.159341-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:28.261459-0500	RedLemon	Task <F06B8A96-FFB7-4F32-A4D1-49AE1A94206E>.<437> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:28.261522-0500	RedLemon	Task <8E241A31-FEBB-48A9-A486-A9392494F79C>.<438> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:28.263411-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [520ED423-1F22-4C1D-BB26-741FD033B345] (reporting strategy default)> on Task <F06B8A96-FFB7-4F32-A4D1-49AE1A94206E>.<437> was not selected for reporting
default	16:02:28.263545-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [829D9856-92C6-4D07-BFB4-97CC6F4CF624] (reporting strategy default)> on Task <8E241A31-FEBB-48A9-A486-A9392494F79C>.<438> was not selected for reporting
default	16:02:28.265178-0500	RedLemon	Task <F06B8A96-FFB7-4F32-A4D1-49AE1A94206E>.<437> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:28.265407-0500	RedLemon	Task <F06B8A96-FFB7-4F32-A4D1-49AE1A94206E>.<437> now using Connection 1
default	16:02:28.266419-0500	RedLemon	Task <8E241A31-FEBB-48A9-A486-A9392494F79C>.<438> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:28.266609-0500	RedLemon	Task <8E241A31-FEBB-48A9-A486-A9392494F79C>.<438> now using Connection 1
default	16:02:28.267421-0500	RedLemon	0x7f8630843c88 ID=1052 Task <F06B8A96-FFB7-4F32-A4D1-49AE1A94206E>.<437> sent request, body N 0
default	16:02:28.267463-0500	RedLemon	0x7f8631531168 ID=1056 Task <8E241A31-FEBB-48A9-A486-A9392494F79C>.<438> sent request, body N 0
default	16:02:28.372483-0500	RedLemon	0x7f8631531168 ID=1056 Task <8E241A31-FEBB-48A9-A486-A9392494F79C>.<438> received response, status 200 content U
default	16:02:28.372900-0500	RedLemon	Task <8E241A31-FEBB-48A9-A486-A9392494F79C>.<438> response ended
default	16:02:28.373218-0500	RedLemon	Task <8E241A31-FEBB-48A9-A486-A9392494F79C>.<438> done using Connection 1
default	16:02:28.373867-0500	RedLemon	0x7f8630843c88 ID=1052 Task <F06B8A96-FFB7-4F32-A4D1-49AE1A94206E>.<437> received response, status 200 content U
default	16:02:28.374155-0500	RedLemon	Task <8E241A31-FEBB-48A9-A486-A9392494F79C>.<438> summary for task success {transaction_duration_ms=109, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=107, response_duration_ms=1, request_bytes=511, response_bytes=834, cache_hit=true}
default	16:02:28.374337-0500	RedLemon	Task <8E241A31-FEBB-48A9-A486-A9392494F79C>.<438> finished successfully
default	16:02:28.375020-0500	RedLemon	Task <F06B8A96-FFB7-4F32-A4D1-49AE1A94206E>.<437> response ended
default	16:02:28.376321-0500	RedLemon	Task <80817D19-B246-48A0-AE40-5DC3927F8CDB>.<439> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:28.376360-0500	RedLemon	Task <F06B8A96-FFB7-4F32-A4D1-49AE1A94206E>.<437> done using Connection 1
default	16:02:28.377182-0500	RedLemon	Task <F06B8A96-FFB7-4F32-A4D1-49AE1A94206E>.<437> summary for task success {transaction_duration_ms=112, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=109, response_duration_ms=3, request_bytes=500, response_bytes=955, cache_hit=true}
default	16:02:28.377805-0500	RedLemon	Task <F06B8A96-FFB7-4F32-A4D1-49AE1A94206E>.<437> finished successfully
default	16:02:28.377948-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8A00DD28-EFBA-4CC6-8024-DAE0A77A22B4] (reporting strategy default)> on Task <80817D19-B246-48A0-AE40-5DC3927F8CDB>.<439> was not selected for reporting
default	16:02:28.378892-0500	RedLemon	Task <80817D19-B246-48A0-AE40-5DC3927F8CDB>.<439> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:28.379307-0500	RedLemon	Task <80817D19-B246-48A0-AE40-5DC3927F8CDB>.<439> now using Connection 1
default	16:02:28.381119-0500	RedLemon	0x7f862e298b08 ID=1060 Task <80817D19-B246-48A0-AE40-5DC3927F8CDB>.<439> sent request, body N 0
default	16:02:28.381825-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1055 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:28.382127-0500	runningboardd	Assertion 169-5311-1055 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:28.383980-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:28.384027-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:28.384105-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:28.385479-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:28.386702-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1056 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:28.386854-0500	runningboardd	Assertion 169-103-1056 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:02:28.387753-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:28.387799-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:28.387842-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:28.439819-0500	RedLemon	0x7f862e298b08 ID=1060 Task <80817D19-B246-48A0-AE40-5DC3927F8CDB>.<439> received response, status 200 content U
default	16:02:28.440452-0500	RedLemon	Task <80817D19-B246-48A0-AE40-5DC3927F8CDB>.<439> response ended
default	16:02:28.440912-0500	RedLemon	Task <80817D19-B246-48A0-AE40-5DC3927F8CDB>.<439> done using Connection 1
default	16:02:28.441169-0500	RedLemon	Task <80817D19-B246-48A0-AE40-5DC3927F8CDB>.<439> summary for task success {transaction_duration_ms=62, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=61, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:02:28.441690-0500	RedLemon	Task <80817D19-B246-48A0-AE40-5DC3927F8CDB>.<439> finished successfully
default	16:02:28.443943-0500	RedLemon	Task <A3BA6E70-CDDF-414C-83E0-AFED91A94D61>.<440> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:28.444253-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [023C46A1-2342-4386-8950-630CD6169152] (reporting strategy default)> on Task <A3BA6E70-CDDF-414C-83E0-AFED91A94D61>.<440> was not selected for reporting
default	16:02:28.444961-0500	RedLemon	Task <A3BA6E70-CDDF-414C-83E0-AFED91A94D61>.<440> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:28.445152-0500	RedLemon	Task <A3BA6E70-CDDF-414C-83E0-AFED91A94D61>.<440> now using Connection 1
default	16:02:28.445911-0500	RedLemon	0x7f8630843c88 ID=1064 Task <A3BA6E70-CDDF-414C-83E0-AFED91A94D61>.<440> sent request, body N 0
default	16:02:28.452404-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:28.454552-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:28.454843-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:28.455297-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:28.455492-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:28.455672-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:28.455769-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:28.580437-0500	RedLemon	0x7f8630843c88 ID=1064 Task <A3BA6E70-CDDF-414C-83E0-AFED91A94D61>.<440> received response, status 200 content U
default	16:02:28.581109-0500	RedLemon	Task <A3BA6E70-CDDF-414C-83E0-AFED91A94D61>.<440> response ended
default	16:02:28.581871-0500	RedLemon	Task <A3BA6E70-CDDF-414C-83E0-AFED91A94D61>.<440> done using Connection 1
default	16:02:28.583312-0500	RedLemon	Task <A3BA6E70-CDDF-414C-83E0-AFED91A94D61>.<440> summary for task success {transaction_duration_ms=138, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=135, response_duration_ms=2, request_bytes=524, response_bytes=839, cache_hit=true}
default	16:02:28.583839-0500	RedLemon	Task <A3BA6E70-CDDF-414C-83E0-AFED91A94D61>.<440> finished successfully
default	16:02:28.585808-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:28.616462-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:28.656694-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:28.656897-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:28.657195-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:28.657329-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:28.657434-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:28.657490-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:29.006515-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:29.006824-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:29.007272-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:29.007479-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:29.007652-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:29.007746-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:29.211611-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:29.212001-0500	RedLemon	   Payload keys: senderId, position, isPlaying, timestamp, type
default	16:02:29.212471-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:29.212676-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:29.212855-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:29.212989-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:29.486534-0500	runningboardd	Invalidating assertion 169-5311-1055 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:29.518583-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:29.518922-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:29.519525-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:29.519754-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:29.519948-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:29.520029-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:29.664828-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:29.664908-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:29.664987-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:29.666682-0500	runningboardd	Invalidating assertion 169-103-1056 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:29.723565-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:29.723951-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:29.724392-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:29.724606-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:29.724780-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:29.724873-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:29.787956-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:29.788031-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:29.788100-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:29.953289-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:29.953506-0500	RedLemon	   Payload keys: senderId, type, position, timestamp, isPlaying
default	16:02:29.953814-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:29.953943-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:29.954052-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:29.954109-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:30.338179-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:30.338504-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:30.338990-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:30.339215-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:30.339402-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:30.339495-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:30.542154-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:30.542463-0500	RedLemon	   Payload keys: senderId, timestamp, isPlaying, position, type
default	16:02:30.542984-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:30.543188-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:30.543369-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:30.543459-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:30.566011-0500	RedLemon	Task <CC449EF5-8DE9-4366-B66C-3C0339D1B475>.<24> summary for task failure {transaction_duration_ms=30838, response_status=-1, connection=24, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=0, response_duration_ms=0, request_bytes=278, response_bytes=0, cache_hit=false}
default	16:02:30.566279-0500	RedLemon	Task <A2AFBC12-BF88-49A3-8E0C-2372F0F8F57A>.<441> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
error	16:02:30.566437-0500	RedLemon	Task <CC449EF5-8DE9-4366-B66C-3C0339D1B475>.<24> finished with error [-1001] Error Domain=NSURLErrorDomain Code=-1001 UserInfo={_kCFStreamErrorCodeKey=-2102, NSUnderlyingError=0x7f86308857d0 {Error Domain=kCFErrorDomainCFNetwork Code=-1001 UserInfo={_kCFStreamErrorCodeKey=-2102, _kCFStreamErrorDomainKey=4}}, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>, NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _kCFStreamErrorDomainKey=4}
default	16:02:30.566793-0500	RedLemon	Connection 24: cleaning up
default	16:02:30.567128-0500	RedLemon	[C24 2FF68A92-E19D-4FFF-AE49-994009A9A420 127.0.0.1:47253 tcp, url hash: 9000dee9, definite, attribution: developer] cancel
default	16:02:30.567464-0500	RedLemon	[C24 2FF68A92-E19D-4FFF-AE49-994009A9A420 127.0.0.1:47253 tcp, url hash: 9000dee9, definite, attribution: developer] cancelled
	[C24 1A83A3C6-4492-4D94-93EE-447AF901F060 127.0.0.1:49322<->127.0.0.1:47253]
	Connected Path: satisfied (Path is satisfied), viable, interface: lo0
	Privacy Stance: Not Eligible
	Duration: 66.369s, TCP @0.001s took 0.003s
	bytes in/out: 234596/523, packets in/out: 15/2, rtt: 0.001s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:02:30.567493-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [731836FA-EF71-4022-88D8-0AFEA3E12A24] (reporting strategy default)> on Task <A2AFBC12-BF88-49A3-8E0C-2372F0F8F57A>.<441> was not selected for reporting
default	16:02:30.568171-0500	RedLemon	nw_flow_disconnected [C24 127.0.0.1:47253 cancelled socket-flow ((null))] Output protocol disconnected
default	16:02:30.568360-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C24] reporting state cancelled
default	16:02:30.568536-0500	RedLemon	Task <CC449EF5-8DE9-4366-B66C-3C0339D1B475>.<24> done using Connection 24
default	16:02:30.568952-0500	RedLemon	Task <A2AFBC12-BF88-49A3-8E0C-2372F0F8F57A>.<441> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:30.569340-0500	RedLemon	Task <A2AFBC12-BF88-49A3-8E0C-2372F0F8F57A>.<441> now using Connection 1
default	16:02:30.571351-0500	RedLemon	0x7f862e298b08 ID=1068 Task <A2AFBC12-BF88-49A3-8E0C-2372F0F8F57A>.<441> sent request, body N 0
default	16:02:30.639785-0500	RedLemon	Task <118AE513-342A-49DD-BD0F-7B21E98141A4>.<25> summary for task failure {transaction_duration_ms=30014, response_status=-1, connection=30, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=1, secure_connection_duration_ms=0, private_relay=false, request_start_ms=3, request_duration_ms=0, response_start_ms=0, response_duration_ms=0, request_bytes=278, response_bytes=0, cache_hit=false}
error	16:02:30.640276-0500	RedLemon	Task <118AE513-342A-49DD-BD0F-7B21E98141A4>.<25> finished with error [-1001] Error Domain=NSURLErrorDomain Code=-1001 UserInfo={_kCFStreamErrorCodeKey=-2102, NSUnderlyingError=0x7f863089cf90 {Error Domain=kCFErrorDomainCFNetwork Code=-1001 UserInfo={_kCFStreamErrorCodeKey=-2102, _kCFStreamErrorDomainKey=4}}, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>, NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _kCFStreamErrorDomainKey=4}
default	16:02:30.640522-0500	RedLemon	Connection 30: cleaning up
default	16:02:30.640610-0500	RedLemon	[C30 E23A00D1-3B0F-4E60-9696-919BFD0CE734 127.0.0.1:47253 tcp, url hash: c280ff71, definite, attribution: developer] cancel
default	16:02:30.640774-0500	RedLemon	[C30 E23A00D1-3B0F-4E60-9696-919BFD0CE734 127.0.0.1:47253 tcp, url hash: c280ff71, definite, attribution: developer] cancelled
	[C30 1A83A3C6-4492-4D94-93EE-447AF901F060 127.0.0.1:49328<->127.0.0.1:47253]
	Connected Path: satisfied (Path is satisfied), viable, interface: lo0
	Privacy Stance: Not Eligible
	Duration: 30.015s, TCP @0.000s took 0.001s
	bytes in/out: 0/278, packets in/out: 0/1, rtt: 0.001s, retransmitted bytes: 0, out-of-order bytes: 0
default	16:02:30.641067-0500	RedLemon	nw_flow_disconnected [C30 127.0.0.1:47253 cancelled socket-flow ((null))] Output protocol disconnected
default	16:02:30.641110-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C30] reporting state cancelled
default	16:02:30.641161-0500	RedLemon	Task <118AE513-342A-49DD-BD0F-7B21E98141A4>.<25> done using Connection 30
default	16:02:30.641638-0500	RedLemon	Task <F7E37484-A578-41D7-9AF7-CA8648F91AA1>.<442> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:30.642004-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6B4B81E7-F1A5-4F3C-9258-540541B2C4FC] (reporting strategy default)> on Task <F7E37484-A578-41D7-9AF7-CA8648F91AA1>.<442> was not selected for reporting
default	16:02:30.642796-0500	RedLemon	Task <F7E37484-A578-41D7-9AF7-CA8648F91AA1>.<442> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:30.642995-0500	RedLemon	Task <F7E37484-A578-41D7-9AF7-CA8648F91AA1>.<442> now using Connection 1
default	16:02:30.643975-0500	RedLemon	0x7f8632e5b438 ID=1072 Task <F7E37484-A578-41D7-9AF7-CA8648F91AA1>.<442> sent request, body N 0
default	16:02:30.644602-0500	RedLemon	0x7f862e298b08 ID=1068 Task <A2AFBC12-BF88-49A3-8E0C-2372F0F8F57A>.<441> received response, status 200 content U
default	16:02:30.645458-0500	RedLemon	Task <A2AFBC12-BF88-49A3-8E0C-2372F0F8F57A>.<441> response ended
default	16:02:30.645870-0500	RedLemon	Task <A2AFBC12-BF88-49A3-8E0C-2372F0F8F57A>.<441> done using Connection 1
default	16:02:30.646290-0500	RedLemon	Task <A2AFBC12-BF88-49A3-8E0C-2372F0F8F57A>.<441> summary for task success {transaction_duration_ms=77, response_status=200, connection=1, reused=1, request_start_ms=1, request_duration_ms=2, response_start_ms=76, response_duration_ms=1, request_bytes=500, response_bytes=956, cache_hit=true}
default	16:02:30.646627-0500	RedLemon	Task <A2AFBC12-BF88-49A3-8E0C-2372F0F8F57A>.<441> finished successfully
default	16:02:30.655128-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:30.655765-0500	RedLemon	   Payload keys: senderId, isPlaying, type, timestamp, position
default	16:02:30.656496-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:30.656831-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:30.657108-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:30.661094-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [anon<RedLemon>(501):5311] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:169-5311-1057 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:30.661597-0500	runningboardd	Assertion 169-5311-1057 (target:[anon<RedLemon>(501):5311]) will be created as active as no start-time-defining assertions exist
default	16:02:30.663395-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:30.663434-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:30.663470-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:30.678548-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):5311] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:169-103-1058 target:5311 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	16:02:30.678962-0500	runningboardd	Assertion 169-103-1058 (target:[anon<RedLemon>(501):5311]) will be created as active
default	16:02:30.683748-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:30.684593-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:30.684937-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:30.685230-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:30.704731-0500	RedLemon	0x7f8632e5b438 ID=1072 Task <F7E37484-A578-41D7-9AF7-CA8648F91AA1>.<442> received response, status 200 content U
default	16:02:30.705351-0500	RedLemon	Task <F7E37484-A578-41D7-9AF7-CA8648F91AA1>.<442> response ended
default	16:02:30.705737-0500	RedLemon	Task <F7E37484-A578-41D7-9AF7-CA8648F91AA1>.<442> done using Connection 1
default	16:02:30.705913-0500	RedLemon	Task <F7E37484-A578-41D7-9AF7-CA8648F91AA1>.<442> summary for task success {transaction_duration_ms=63, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=1, request_bytes=511, response_bytes=830, cache_hit=true}
default	16:02:30.706206-0500	RedLemon	Task <F7E37484-A578-41D7-9AF7-CA8648F91AA1>.<442> finished successfully
default	16:02:30.715253-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	16:02:30.715928-0500	RedLemon	Task <571255AD-64FF-4CA4-BF61-E2023F136C94>.<443> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:30.716339-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4810C59A-9631-4C35-A02C-7AFF072BAEFC] (reporting strategy default)> on Task <571255AD-64FF-4CA4-BF61-E2023F136C94>.<443> was not selected for reporting
default	16:02:30.717026-0500	RedLemon	Task <571255AD-64FF-4CA4-BF61-E2023F136C94>.<443> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:30.717202-0500	RedLemon	Task <571255AD-64FF-4CA4-BF61-E2023F136C94>.<443> now using Connection 1
default	16:02:30.717896-0500	RedLemon	0x7f8632e5b438 ID=1076 Task <571255AD-64FF-4CA4-BF61-E2023F136C94>.<443> sent request, body N 0
default	16:02:30.718552-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:30.781851-0500	RedLemon	0x7f8632e5b438 ID=1076 Task <571255AD-64FF-4CA4-BF61-E2023F136C94>.<443> received response, status 200 content U
default	16:02:30.782437-0500	RedLemon	Task <571255AD-64FF-4CA4-BF61-E2023F136C94>.<443> response ended
default	16:02:30.782875-0500	RedLemon	Task <571255AD-64FF-4CA4-BF61-E2023F136C94>.<443> done using Connection 1
default	16:02:30.783103-0500	RedLemon	Task <571255AD-64FF-4CA4-BF61-E2023F136C94>.<443> summary for task success {transaction_duration_ms=66, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	16:02:30.783711-0500	RedLemon	Task <571255AD-64FF-4CA4-BF61-E2023F136C94>.<443> finished successfully
default	16:02:30.785717-0500	RedLemon	Task <13F02049-DE35-46D0-9FF2-78A2F25C0A4C>.<444> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	16:02:30.786001-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [505860D7-C9BD-4027-865E-26973F154A43] (reporting strategy default)> on Task <13F02049-DE35-46D0-9FF2-78A2F25C0A4C>.<444> was not selected for reporting
default	16:02:30.786803-0500	RedLemon	Task <13F02049-DE35-46D0-9FF2-78A2F25C0A4C>.<444> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	16:02:30.787010-0500	RedLemon	Task <13F02049-DE35-46D0-9FF2-78A2F25C0A4C>.<444> now using Connection 1
default	16:02:30.787729-0500	RedLemon	0x7f8632ddee28 ID=1080 Task <13F02049-DE35-46D0-9FF2-78A2F25C0A4C>.<444> sent request, body N 0
default	16:02:30.812084-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:30.867656-0500	RedLemon	0x7f8632ddee28 ID=1080 Task <13F02049-DE35-46D0-9FF2-78A2F25C0A4C>.<444> received response, status 200 content U
default	16:02:30.868247-0500	RedLemon	Task <13F02049-DE35-46D0-9FF2-78A2F25C0A4C>.<444> response ended
default	16:02:30.868704-0500	RedLemon	Task <13F02049-DE35-46D0-9FF2-78A2F25C0A4C>.<444> done using Connection 1
default	16:02:30.868937-0500	RedLemon	Task <13F02049-DE35-46D0-9FF2-78A2F25C0A4C>.<444> summary for task success {transaction_duration_ms=82, response_status=200, connection=1, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=81, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	16:02:30.869683-0500	RedLemon	Task <13F02049-DE35-46D0-9FF2-78A2F25C0A4C>.<444> finished successfully
default	16:02:30.871556-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	16:02:30.910702-0500	RedLemon	Connection 1: encountered bidirectional stream limit updated event
default	16:02:30.954319-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:30.954509-0500	RedLemon	   Payload keys: timestamp, senderId, position, isPlaying, type
default	16:02:30.954807-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:30.954936-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:30.955108-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:31.259365-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:31.259623-0500	RedLemon	   Payload keys: position, isPlaying, senderId, type, timestamp
default	16:02:31.260062-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:31.260277-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:31.260449-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:31.465210-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:31.465616-0500	RedLemon	   Payload keys: position, timestamp, isPlaying, type, senderId
default	16:02:31.466125-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:31.466345-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:31.466526-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:31.736105-0500	runningboardd	Invalidating assertion 169-5311-1057 (target:[anon<RedLemon>(501):5311]) from originator [anon<RedLemon>(501):5311]
default	16:02:31.771347-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:31.771656-0500	RedLemon	   Payload keys: senderId, isPlaying, type, timestamp, position
default	16:02:31.772154-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:31.772367-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:31.772541-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:31.864368-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:31.864450-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:31.864527-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:31.866686-0500	runningboardd	Invalidating assertion 169-103-1058 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.powerd>:103]
default	16:02:31.976056-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:31.976372-0500	RedLemon	   Payload keys: timestamp, senderId, isPlaying, position, type
default	16:02:31.976867-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:31.977077-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:31.977252-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:32.039998-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:32.040076-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:32.040152-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:32.283283-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:32.283818-0500	RedLemon	   Payload keys: type, isPlaying, position, senderId, timestamp
default	16:02:32.284354-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:32.284528-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:32.284687-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:32.488296-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:32.488624-0500	RedLemon	   Payload keys: position, timestamp, isPlaying, type, senderId
default	16:02:32.489123-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:32.489308-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:32.489473-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:32.795270-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:32.795667-0500	RedLemon	   Payload keys: senderId, isPlaying, type, timestamp, position
default	16:02:32.796160-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:32.796407-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:32.796581-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:33.102793-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:33.103115-0500	RedLemon	   Payload keys: position, timestamp, isPlaying, type, senderId
default	16:02:33.103600-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:33.103830-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:33.104006-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:33.168692-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:33.168982-0500	RedLemon	   Payload keys: type, isPlaying, position, senderId, timestamp
default	16:02:33.169527-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:33.169708-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:33.169878-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:33.512696-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:33.513011-0500	RedLemon	   Payload keys: senderId, isPlaying, type, timestamp, position
default	16:02:33.513540-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:33.513742-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:33.513919-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:33.716981-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:33.717294-0500	RedLemon	   Payload keys: timestamp, senderId, position, isPlaying, type
default	16:02:33.717758-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:33.717972-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:33.718147-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:34.024209-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:34.024508-0500	RedLemon	   Payload keys: type, isPlaying, position, senderId, timestamp
default	16:02:34.025008-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:34.025204-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:34.025376-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:34.228497-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:34.228905-0500	RedLemon	   Payload keys: senderId, isPlaying, type, timestamp, position
default	16:02:34.229299-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:34.229439-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:34.229582-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:34.433746-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:34.434046-0500	RedLemon	   Payload keys: type, isPlaying, position, senderId, timestamp
default	16:02:34.434533-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:34.434740-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:34.434907-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:34.741048-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:34.741355-0500	RedLemon	   Payload keys: position, isPlaying, senderId, type, timestamp
default	16:02:34.741795-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:34.742005-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:34.742294-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:34.945739-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:34.946141-0500	RedLemon	   Payload keys: position, timestamp, isPlaying, type, senderId
default	16:02:34.946660-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:34.946871-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:34.947036-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:35.253036-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:35.253413-0500	RedLemon	   Payload keys: position, senderId, type, isPlaying, timestamp
default	16:02:35.253849-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:35.254045-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:35.254230-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:35.457942-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:35.458261-0500	RedLemon	   Payload keys: position, isPlaying, senderId, type, timestamp
default	16:02:35.458702-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:35.458934-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:35.459116-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:35.662314-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:35.662626-0500	RedLemon	   Payload keys: senderId, isPlaying, type, timestamp, position
default	16:02:35.663153-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:35.663355-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:35.663526-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:35.711539-0500	runningboardd	Invalidating assertion 169-129-1006 (target:[anon<RedLemon>(501):5311]) from originator [daemon<com.apple.coreservices.launchservicesd>:129]
default	16:02:35.824701-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring jetsam update because this process is not memory-managed
default	16:02:35.824742-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring suspend because this process is not lifecycle managed
default	16:02:35.824810-0500	runningboardd	[anon<RedLemon>(501):5311] Set darwin role to: UserInteractiveNonFocal
default	16:02:35.824856-0500	runningboardd	[anon<RedLemon>(501):5311] Ignoring GPU update because this process is not GPU managed
default	16:02:35.969455-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:35.969676-0500	RedLemon	   Payload keys: type, isPlaying, position, senderId, timestamp
default	16:02:35.969969-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:35.970151-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:35.970274-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:36.174453-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:36.174647-0500	RedLemon	   Payload keys: position, isPlaying, type, senderId, timestamp
default	16:02:36.174921-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:36.175048-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:36.175143-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:36.481527-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:36.481887-0500	RedLemon	   Payload keys: senderId, isPlaying, type, timestamp, position
default	16:02:36.482523-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:36.482803-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:36.482986-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:36.687141-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:36.687455-0500	RedLemon	   Payload keys: position, timestamp, isPlaying, type, senderId
default	16:02:36.687880-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:36.688019-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:36.688121-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:36.993376-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:36.993592-0500	RedLemon	   Payload keys: type, isPlaying, position, senderId, timestamp
default	16:02:36.993885-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:36.994010-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:36.994118-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:37.241489-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:37.241832-0500	RedLemon	   Payload keys: senderId, isPlaying, type, timestamp, position
default	16:02:37.242270-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:37.242475-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:37.242645-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:37.505517-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:37.505826-0500	RedLemon	   Payload keys: type, isPlaying, position, senderId, timestamp
default	16:02:37.506279-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:37.506570-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:37.506783-0500	RedLemon	✅ Realtime: syncCallback invoked successfully
default	16:02:37.710459-0500	RedLemon	📨 Realtime: Received broadcast message
default	16:02:37.710771-0500	RedLemon	   Payload keys: senderId, isPlaying, type, timestamp, position
default	16:02:37.711210-0500	RedLemon	✅ Realtime: Decoded message type: playbackState, sender: 789Q
default	16:02:37.711406-0500	RedLemon	📞 Realtime: Invoking syncCallback for message type: playbackState
default	16:02:37.711596-0500	RedLemon	✅ Realtime: syncCallback invoked successfully




