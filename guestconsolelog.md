default	15:40:08.497963-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "frontmost:4995" ID:166-129-1708 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	15:40:08.498195-0500	runningboardd	Assertion 166-129-1708 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:08.500993-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:08.501627-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:08.502674-0500	runningboardd	[anon<RedLemon>(501):4995] Set darwin role to: UserInteractiveFocal
default	15:40:08.503300-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "notification:4995" ID:166-129-1709 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	15:40:08.504632-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:08.506098-0500	runningboardd	Assertion 166-129-1709 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:08.515842-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:08.516124-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:08.516205-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
fault	15:40:09.230465-0500	RedLemon	No symbol named '<private>' found in system symbol set
default	15:40:09.433244-0500	RedLemon	Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:09.432499-0500	RedLemon	Task <081F3E0C-E275-47F1-A401-066DD1557E61>.<290> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:09.435746-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B3FACBE3-AF85-4810-9504-E7B0EB9A816E] (reporting strategy default)> on Task <081F3E0C-E275-47F1-A401-066DD1557E61>.<290> was not selected for reporting
default	15:40:09.435806-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [86F81F80-5A20-4ED4-B602-6000B89F6B76] (reporting strategy default)> on Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> was not selected for reporting
default	15:40:09.436728-0500	RedLemon	Task <081F3E0C-E275-47F1-A401-066DD1557E61>.<290> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:09.439021-0500	RedLemon	Task <081F3E0C-E275-47F1-A401-066DD1557E61>.<290> now using Connection 3
default	15:40:09.442734-0500	RedLemon	0x7fe765ab46d8 ID=220 Task <081F3E0C-E275-47F1-A401-066DD1557E61>.<290> sent request, body N 0
default	15:40:09.443485-0500	RedLemon	Connection 31: enabling TLS
default	15:40:09.443783-0500	RedLemon	Connection 31: starting, TC(0x0)
default	15:40:09.443825-0500	RedLemon	[C31 44EB64EB-91FA-45BA-9258-2359CB2690B9 Hostname#cb87f9a4:443 tcp, url hash: 16c5b4e0, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{C777FD25-3D67-4760-83F4-E04489F7229A}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:09.444628-0500	RedLemon	[C31 Hostname#cb87f9a4:443 initial path ((null))] event: path:start @0.000s
default	15:40:09.444961-0500	RedLemon	[C31 Hostname#cb87f9a4:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: 2B50492E-59DB-44F3-8302-87F3B455C166
default	15:40:09.445126-0500	RedLemon	[C31 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	15:40:09.445162-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state preparing
default	15:40:09.445897-0500	RedLemon	Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> setting up Connection 31
default	15:40:09.445740-0500	mDNSResponder	[R1207] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'UKEj+SxGrd32X1Y1OFZKQw=='>, options: 0x8 {use-failover}, client pid: 4995 (RedLemon)
default	15:40:09.471486-0500	mDNSResponder	[R1207] getaddrinfo stop -- hostname: <mask.hash: 'UKEj+SxGrd32X1Y1OFZKQw=='>, client pid: 4995 (RedLemon)
default	15:40:09.472167-0500	RedLemon	nw_endpoint_resolver_update [C31 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#adac733c:443
default	15:40:09.472286-0500	RedLemon	nw_endpoint_resolver_update [C31 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#60c5f8f1:443
default	15:40:09.472409-0500	RedLemon	[C31 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.028s
default	15:40:09.473417-0500	RedLemon	[C31.1 IPv4#adac733c:443 initial path ((null))] event: path:start @0.029s
default	15:40:09.473829-0500	RedLemon	[C31.1 IPv4#adac733c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.029s, uuid: E7F952C7-0637-4DF0-8476-258DEB269ADE
default	15:40:09.473963-0500	RedLemon	[C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.030s
default	15:40:09.475496-0500	RedLemon	[C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.031s
default	15:40:09.477281-0500	RedLemon	[C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.033s
default	15:40:09.477926-0500	RedLemon	tcp_output [C31.1:3] flags=[S] seq=1082761430, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1082761430
default	15:40:09.496692-0500	RedLemon	tcp_input [C31.1:3] flags=[S.] seq=1282191244, ack=1082761431, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1082761430
default	15:40:09.496884-0500	RedLemon	nw_flow_connected [C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:09.497169-0500	RedLemon	[C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.053s
default	15:40:09.497268-0500	RedLemon	[C31 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.053s
default	15:40:09.497973-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C31.1:2][0x7fe7659fa0c0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:40:09.498142-0500	RedLemon	boringssl_context_info_handler(2028) [C31.1:2][0x7fe7659fa0c0] Client handshake started
default	15:40:09.498441-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS client enter_early_data
default	15:40:09.498634-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS client read_server_hello
default	15:40:09.517697-0500	RedLemon	0x7fe765ab46d8 ID=220 Task <081F3E0C-E275-47F1-A401-066DD1557E61>.<290> received response, status 200 content U
default	15:40:09.518970-0500	RedLemon	Task <081F3E0C-E275-47F1-A401-066DD1557E61>.<290> response ended
default	15:40:09.519817-0500	RedLemon	Task <081F3E0C-E275-47F1-A401-066DD1557E61>.<290> done using Connection 3
default	15:40:09.520124-0500	RedLemon	Task <081F3E0C-E275-47F1-A401-066DD1557E61>.<290> summary for task success {transaction_duration_ms=83, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=3, response_start_ms=81, response_duration_ms=2, request_bytes=522, response_bytes=1905, cache_hit=false}
default	15:40:09.520802-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1715 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:09.520822-0500	RedLemon	Task <081F3E0C-E275-47F1-A401-066DD1557E61>.<290> finished successfully
default	15:40:09.521121-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:40:09.521440-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client read_server_hello
default	15:40:09.521910-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:40:09.522573-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client read_certificate_request
default	15:40:09.522655-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client read_server_certificate
default	15:40:09.522789-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:40:09.523600-0500	runningboardd	Assertion 166-4995-1715 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:09.524008-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C31.1:2][0x7fe7659fa0c0] Performing external trust evaluation
default	15:40:09.524192-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C31.1:2][0x7fe7659fa0c0] Asyncing for external verify block
default	15:40:09.525593-0500	RedLemon	Connection 31: asked to evaluate TLS Trust
default	15:40:09.526410-0500	RedLemon	Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> auth completion disp=1 cred=0x0
default	15:40:09.530494-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:09.530566-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:09.530776-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:09.534039-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-1716 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:09.534194-0500	runningboardd	Assertion 166-103-1716 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:09.536809-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:09.536850-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:09.537012-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:09.538897-0500	RedLemon	Connection 31: TLS Trust result 0
default	15:40:09.538949-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C31.1:2][0x7fe7659fa0c0] Returning from external verify block with result: true
default	15:40:09.539022-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C31.1:2][0x7fe7659fa0c0] Certificate verification result: OK
default	15:40:09.539552-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client read_server_finished
default	15:40:09.539679-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:40:09.539714-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:40:09.539745-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:40:09.539774-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:40:09.539885-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS 1.3 client done
default	15:40:09.540040-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS client finish_client_handshake
default	15:40:09.540076-0500	RedLemon	boringssl_context_info_handler(2045) [C31.1:2][0x7fe7659fa0c0] Client handshake state: TLS client done
default	15:40:09.540102-0500	RedLemon	boringssl_context_info_handler(2034) [C31.1:2][0x7fe7659fa0c0] Client handshake done
default	15:40:09.540847-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C31.1:2][0x7fe7659fa0c0] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(42ms) flight_time(24ms) rtt(23ms) write_stalls(0) read_stalls(4)]
default	15:40:09.541069-0500	RedLemon	nw_flow_connected [C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:09.541368-0500	RedLemon	[C31.1 IPv4#adac733c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.097s
default	15:40:09.541915-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state ready
default	15:40:09.542165-0500	RedLemon	[C31 Hostname#cb87f9a4:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.098s
default	15:40:09.542392-0500	RedLemon	[C31.1 IPv4#adac733c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.098s
default	15:40:09.542493-0500	RedLemon	[C31 Hostname#cb87f9a4:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.098s
default	15:40:09.542634-0500	RedLemon	Connection 31: connected successfully
default	15:40:09.542701-0500	RedLemon	Connection 31: TLS handshake complete
default	15:40:09.543004-0500	RedLemon	Connection 31: ready C(N) E(N)
default	15:40:09.543240-0500	RedLemon	Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> now using Connection 31
default	15:40:09.543433-0500	RedLemon	Connection 31: received viability advisory(Y)
default	15:40:09.543778-0500	RedLemon	Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> sent request, body N 0
default	15:40:09.552819-0500	RedLemon	Task <990E11E3-11FE-4D56-8082-36806213F137>.<291> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:09.553158-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9A5CC3C2-30C5-4692-AE38-AB2EB750ACF1] (reporting strategy default)> on Task <990E11E3-11FE-4D56-8082-36806213F137>.<291> was not selected for reporting
default	15:40:09.553911-0500	RedLemon	Task <990E11E3-11FE-4D56-8082-36806213F137>.<291> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:09.554088-0500	RedLemon	Task <990E11E3-11FE-4D56-8082-36806213F137>.<291> now using Connection 3
default	15:40:09.554728-0500	RedLemon	0x7fe7684d5998 ID=224 Task <990E11E3-11FE-4D56-8082-36806213F137>.<291> sent request, body N 0
default	15:40:09.573261-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:09.626189-0500	RedLemon	0x7fe7684d5998 ID=224 Task <990E11E3-11FE-4D56-8082-36806213F137>.<291> received response, status 200 content U
default	15:40:09.627226-0500	RedLemon	Task <990E11E3-11FE-4D56-8082-36806213F137>.<291> response ended
default	15:40:09.629312-0500	RedLemon	Task <990E11E3-11FE-4D56-8082-36806213F137>.<291> done using Connection 3
default	15:40:09.629760-0500	RedLemon	Task <990E11E3-11FE-4D56-8082-36806213F137>.<291> summary for task success {transaction_duration_ms=76, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=71, response_duration_ms=3, request_bytes=511, response_bytes=792, cache_hit=false}
default	15:40:09.629962-0500	RedLemon	Task <990E11E3-11FE-4D56-8082-36806213F137>.<291> finished successfully
default	15:40:09.630975-0500	RedLemon	📋 Found 1 participants in room ABRD
default	15:40:09.631479-0500	RedLemon	Task <92873A6D-265D-4AFB-A049-DA9589870633>.<292> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:09.632843-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4C338715-287D-45F4-B4CE-CB387BCDF327] (reporting strategy default)> on Task <92873A6D-265D-4AFB-A049-DA9589870633>.<292> was not selected for reporting
default	15:40:09.633867-0500	RedLemon	Task <92873A6D-265D-4AFB-A049-DA9589870633>.<292> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:09.634160-0500	RedLemon	Task <92873A6D-265D-4AFB-A049-DA9589870633>.<292> now using Connection 3
default	15:40:09.635085-0500	RedLemon	0x7fe76852dbd8 ID=228 Task <92873A6D-265D-4AFB-A049-DA9589870633>.<292> sent request, body N 0
default	15:40:09.648663-0500	RedLemon	Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> received response, status 101 content U
default	15:40:09.648991-0500	RedLemon	Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> response ended
default	15:40:09.649044-0500	RedLemon	Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> done using Connection 31
default	15:40:09.650151-0500	RedLemon	[C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.206s
default	15:40:09.650191-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state preparing
default	15:40:09.650249-0500	RedLemon	[C31 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.206s
default	15:40:09.650367-0500	RedLemon	[C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.206s
default	15:40:09.650481-0500	RedLemon	[C31 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.206s
default	15:40:09.650566-0500	RedLemon	nw_flow_connected [C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:09.651962-0500	RedLemon	[C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.207s
default	15:40:09.652137-0500	RedLemon	[C31 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.208s
default	15:40:09.652878-0500	RedLemon	nw_flow_connected [C31.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:09.655002-0500	RedLemon	[C31.1 IPv4#adac733c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.211s
default	15:40:09.655069-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state ready
default	15:40:09.655199-0500	RedLemon	[C31 Hostname#cb87f9a4:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.211s
default	15:40:09.691895-0500	RedLemon	0x7fe76852dbd8 ID=228 Task <92873A6D-265D-4AFB-A049-DA9589870633>.<292> received response, status 200 content U
default	15:40:09.692835-0500	RedLemon	Task <92873A6D-265D-4AFB-A049-DA9589870633>.<292> response ended
default	15:40:09.693639-0500	RedLemon	Task <92873A6D-265D-4AFB-A049-DA9589870633>.<292> done using Connection 3
default	15:40:09.695367-0500	RedLemon	Task <92873A6D-265D-4AFB-A049-DA9589870633>.<292> summary for task success {transaction_duration_ms=62, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=58, response_duration_ms=3, request_bytes=512, response_bytes=837, cache_hit=true}
default	15:40:09.695758-0500	RedLemon	Task <92873A6D-265D-4AFB-A049-DA9589870633>.<292> finished successfully
default	15:40:09.697266-0500	RedLemon	📋 Found 2 participants in room HTCE
default	15:40:09.697637-0500	RedLemon	Task <54322B2C-DBA1-497A-9BDC-7A6C12201E41>.<293> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:09.697989-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [CEEA2E7E-8824-4610-897C-93D5DF1F6407] (reporting strategy default)> on Task <54322B2C-DBA1-497A-9BDC-7A6C12201E41>.<293> was not selected for reporting
default	15:40:09.698671-0500	RedLemon	Task <54322B2C-DBA1-497A-9BDC-7A6C12201E41>.<293> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:09.698925-0500	RedLemon	Task <54322B2C-DBA1-497A-9BDC-7A6C12201E41>.<293> now using Connection 3
default	15:40:09.699755-0500	RedLemon	0x7fe76852dbd8 ID=232 Task <54322B2C-DBA1-497A-9BDC-7A6C12201E41>.<293> sent request, body N 0
default	15:40:09.772188-0500	RedLemon	0x7fe76852dbd8 ID=232 Task <54322B2C-DBA1-497A-9BDC-7A6C12201E41>.<293> received response, status 200 content U
default	15:40:09.772648-0500	RedLemon	Task <54322B2C-DBA1-497A-9BDC-7A6C12201E41>.<293> response ended
default	15:40:09.773041-0500	RedLemon	Task <54322B2C-DBA1-497A-9BDC-7A6C12201E41>.<293> done using Connection 3
default	15:40:09.773227-0500	RedLemon	Task <54322B2C-DBA1-497A-9BDC-7A6C12201E41>.<293> summary for task success {transaction_duration_ms=74, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=73, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	15:40:09.773715-0500	RedLemon	Task <54322B2C-DBA1-497A-9BDC-7A6C12201E41>.<293> finished successfully
default	15:40:09.775361-0500	RedLemon	   - ursinho (guest)
default	15:40:09.775811-0500	RedLemon	Task <6517BD72-8AA6-4D50-92A9-D2DB3E4F045D>.<294> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:09.776200-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DFB2D12E-075B-4827-B4F0-85EA4109096E] (reporting strategy default)> on Task <6517BD72-8AA6-4D50-92A9-D2DB3E4F045D>.<294> was not selected for reporting
default	15:40:09.777403-0500	RedLemon	Task <6517BD72-8AA6-4D50-92A9-D2DB3E4F045D>.<294> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:09.777657-0500	RedLemon	Task <6517BD72-8AA6-4D50-92A9-D2DB3E4F045D>.<294> now using Connection 3
default	15:40:09.778502-0500	RedLemon	0x7fe7684d5998 ID=236 Task <6517BD72-8AA6-4D50-92A9-D2DB3E4F045D>.<294> sent request, body N 0
default	15:40:09.844830-0500	RedLemon	0x7fe7684d5998 ID=236 Task <6517BD72-8AA6-4D50-92A9-D2DB3E4F045D>.<294> received response, status 200 content U
default	15:40:09.845827-0500	RedLemon	Task <6517BD72-8AA6-4D50-92A9-D2DB3E4F045D>.<294> response ended
default	15:40:09.846491-0500	RedLemon	Task <6517BD72-8AA6-4D50-92A9-D2DB3E4F045D>.<294> done using Connection 3
default	15:40:09.846730-0500	RedLemon	Task <6517BD72-8AA6-4D50-92A9-D2DB3E4F045D>.<294> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=67, response_duration_ms=2, request_bytes=511, response_bytes=838, cache_hit=true}
default	15:40:09.847007-0500	RedLemon	Task <6517BD72-8AA6-4D50-92A9-D2DB3E4F045D>.<294> finished successfully
default	15:40:09.848277-0500	RedLemon	📋 Found 2 participants in room V9GR
default	15:40:09.848602-0500	RedLemon	Task <460FAFA4-09C0-457B-BF39-47E44B8BB4AB>.<295> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:09.848865-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6451E8A5-72E5-4A96-9F04-2002D5F3A145] (reporting strategy default)> on Task <460FAFA4-09C0-457B-BF39-47E44B8BB4AB>.<295> was not selected for reporting
default	15:40:09.849628-0500	RedLemon	Task <460FAFA4-09C0-457B-BF39-47E44B8BB4AB>.<295> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:09.849817-0500	RedLemon	Task <460FAFA4-09C0-457B-BF39-47E44B8BB4AB>.<295> now using Connection 3
default	15:40:09.850498-0500	RedLemon	0x7fe7684d5998 ID=240 Task <460FAFA4-09C0-457B-BF39-47E44B8BB4AB>.<295> sent request, body N 0
default	15:40:09.930361-0500	RedLemon	0x7fe7684d5998 ID=240 Task <460FAFA4-09C0-457B-BF39-47E44B8BB4AB>.<295> received response, status 200 content U
default	15:40:09.930927-0500	RedLemon	Task <460FAFA4-09C0-457B-BF39-47E44B8BB4AB>.<295> response ended
default	15:40:09.931258-0500	RedLemon	Task <460FAFA4-09C0-457B-BF39-47E44B8BB4AB>.<295> done using Connection 3
default	15:40:09.931405-0500	RedLemon	Task <460FAFA4-09C0-457B-BF39-47E44B8BB4AB>.<295> summary for task success {transaction_duration_ms=82, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=80, response_duration_ms=1, request_bytes=524, response_bytes=845, cache_hit=true}
default	15:40:09.931840-0500	RedLemon	Task <460FAFA4-09C0-457B-BF39-47E44B8BB4AB>.<295> finished successfully
default	15:40:09.933191-0500	RedLemon	   - lemontom (guest)
default	15:40:09.933670-0500	RedLemon	Task <4D0A0315-F364-4446-8687-8D13373237F6>.<296> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:09.933945-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8DC212B3-5C5C-4B37-95CC-90D8D25D613D] (reporting strategy default)> on Task <4D0A0315-F364-4446-8687-8D13373237F6>.<296> was not selected for reporting
default	15:40:09.935084-0500	RedLemon	Task <4D0A0315-F364-4446-8687-8D13373237F6>.<296> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:09.935353-0500	RedLemon	Task <4D0A0315-F364-4446-8687-8D13373237F6>.<296> now using Connection 3
default	15:40:09.936640-0500	RedLemon	0x7fe7684d5998 ID=244 Task <4D0A0315-F364-4446-8687-8D13373237F6>.<296> sent request, body N 0
default	15:40:10.001801-0500	RedLemon	0x7fe7684d5998 ID=244 Task <4D0A0315-F364-4446-8687-8D13373237F6>.<296> received response, status 200 content U
default	15:40:10.003041-0500	RedLemon	Task <4D0A0315-F364-4446-8687-8D13373237F6>.<296> response ended
default	15:40:10.003707-0500	RedLemon	Task <4D0A0315-F364-4446-8687-8D13373237F6>.<296> done using Connection 3
default	15:40:10.004004-0500	RedLemon	Task <4D0A0315-F364-4446-8687-8D13373237F6>.<296> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=67, response_duration_ms=2, request_bytes=511, response_bytes=834, cache_hit=true}
default	15:40:10.004251-0500	RedLemon	Task <4D0A0315-F364-4446-8687-8D13373237F6>.<296> finished successfully
default	15:40:10.005649-0500	RedLemon	📋 Found 2 participants in room 7KB4
default	15:40:10.005978-0500	RedLemon	Task <7802B05E-10F2-42E8-97F4-1DA2DF3AE8EA>.<297> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.006236-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DA791772-685B-4567-8F1C-F8D015D2641F] (reporting strategy default)> on Task <7802B05E-10F2-42E8-97F4-1DA2DF3AE8EA>.<297> was not selected for reporting
default	15:40:10.006937-0500	RedLemon	Task <7802B05E-10F2-42E8-97F4-1DA2DF3AE8EA>.<297> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.007143-0500	RedLemon	Task <7802B05E-10F2-42E8-97F4-1DA2DF3AE8EA>.<297> now using Connection 3
default	15:40:10.007899-0500	RedLemon	0x7fe76852dbd8 ID=248 Task <7802B05E-10F2-42E8-97F4-1DA2DF3AE8EA>.<297> sent request, body N 0
default	15:40:10.072194-0500	RedLemon	0x7fe76852dbd8 ID=248 Task <7802B05E-10F2-42E8-97F4-1DA2DF3AE8EA>.<297> received response, status 200 content U
default	15:40:10.073668-0500	RedLemon	Task <7802B05E-10F2-42E8-97F4-1DA2DF3AE8EA>.<297> response ended
default	15:40:10.074160-0500	RedLemon	Task <7802B05E-10F2-42E8-97F4-1DA2DF3AE8EA>.<297> done using Connection 3
default	15:40:10.074521-0500	RedLemon	Task <7802B05E-10F2-42E8-97F4-1DA2DF3AE8EA>.<297> summary for task success {transaction_duration_ms=67, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=65, response_duration_ms=2, request_bytes=524, response_bytes=840, cache_hit=true}
default	15:40:10.074927-0500	RedLemon	Task <7802B05E-10F2-42E8-97F4-1DA2DF3AE8EA>.<297> finished successfully
default	15:40:10.076607-0500	RedLemon	   - ursinho (guest)
default	15:40:10.076984-0500	RedLemon	Task <31BAC11D-DF43-4527-A3AF-783066D8F9DB>.<298> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.077263-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [33DDCCAF-348D-46EB-9CBC-E0FCAB06D7DE] (reporting strategy default)> on Task <31BAC11D-DF43-4527-A3AF-783066D8F9DB>.<298> was not selected for reporting
default	15:40:10.078625-0500	RedLemon	Task <31BAC11D-DF43-4527-A3AF-783066D8F9DB>.<298> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.078900-0500	RedLemon	Task <31BAC11D-DF43-4527-A3AF-783066D8F9DB>.<298> now using Connection 3
default	15:40:10.079832-0500	RedLemon	0x7fe7659b9a08 ID=252 Task <31BAC11D-DF43-4527-A3AF-783066D8F9DB>.<298> sent request, body N 0
default	15:40:10.141015-0500	RedLemon	0x7fe7659b9a08 ID=252 Task <31BAC11D-DF43-4527-A3AF-783066D8F9DB>.<298> received response, status 200 content U
default	15:40:10.141611-0500	RedLemon	Task <31BAC11D-DF43-4527-A3AF-783066D8F9DB>.<298> response ended
default	15:40:10.142046-0500	RedLemon	Task <31BAC11D-DF43-4527-A3AF-783066D8F9DB>.<298> done using Connection 3
default	15:40:10.142273-0500	RedLemon	Task <31BAC11D-DF43-4527-A3AF-783066D8F9DB>.<298> summary for task success {transaction_duration_ms=64, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=518, response_bytes=849, cache_hit=true}
default	15:40:10.142920-0500	RedLemon	Task <31BAC11D-DF43-4527-A3AF-783066D8F9DB>.<298> finished successfully
default	15:40:10.144814-0500	RedLemon	📋 Found 2 participants in room event_tt0325980
default	15:40:10.145176-0500	RedLemon	Task <DDB2E5C7-23FA-441E-BDDA-35B5E2ACB353>.<299> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.145474-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8AD2C002-1CE4-4C0A-8CDC-C2352BF6835C] (reporting strategy default)> on Task <DDB2E5C7-23FA-441E-BDDA-35B5E2ACB353>.<299> was not selected for reporting
default	15:40:10.146501-0500	RedLemon	Task <DDB2E5C7-23FA-441E-BDDA-35B5E2ACB353>.<299> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.146780-0500	RedLemon	Task <DDB2E5C7-23FA-441E-BDDA-35B5E2ACB353>.<299> now using Connection 3
default	15:40:10.148214-0500	RedLemon	0x7fe76852dbd8 ID=256 Task <DDB2E5C7-23FA-441E-BDDA-35B5E2ACB353>.<299> sent request, body N 0
default	15:40:10.214437-0500	RedLemon	0x7fe76852dbd8 ID=256 Task <DDB2E5C7-23FA-441E-BDDA-35B5E2ACB353>.<299> received response, status 200 content U
default	15:40:10.215024-0500	RedLemon	Task <DDB2E5C7-23FA-441E-BDDA-35B5E2ACB353>.<299> response ended
default	15:40:10.215462-0500	RedLemon	Task <DDB2E5C7-23FA-441E-BDDA-35B5E2ACB353>.<299> done using Connection 3
default	15:40:10.215632-0500	RedLemon	Task <DDB2E5C7-23FA-441E-BDDA-35B5E2ACB353>.<299> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=68, response_duration_ms=1, request_bytes=524, response_bytes=841, cache_hit=true}
default	15:40:10.215997-0500	RedLemon	Task <DDB2E5C7-23FA-441E-BDDA-35B5E2ACB353>.<299> finished successfully
default	15:40:10.217355-0500	RedLemon	   - ursinho (guest)
default	15:40:10.217813-0500	RedLemon	Task <67627267-25CC-4E5F-BC8A-1225482BDE15>.<300> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.218087-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [39ACC470-E3A5-482B-874C-63D9D4B3EE9F] (reporting strategy default)> on Task <67627267-25CC-4E5F-BC8A-1225482BDE15>.<300> was not selected for reporting
default	15:40:10.218784-0500	RedLemon	Task <67627267-25CC-4E5F-BC8A-1225482BDE15>.<300> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.219069-0500	RedLemon	Task <67627267-25CC-4E5F-BC8A-1225482BDE15>.<300> now using Connection 3
default	15:40:10.220380-0500	RedLemon	0x7fe7659b9a08 ID=260 Task <67627267-25CC-4E5F-BC8A-1225482BDE15>.<300> sent request, body N 0
default	15:40:10.280628-0500	RedLemon	0x7fe7659b9a08 ID=260 Task <67627267-25CC-4E5F-BC8A-1225482BDE15>.<300> received response, status 200 content U
default	15:40:10.281227-0500	RedLemon	Task <67627267-25CC-4E5F-BC8A-1225482BDE15>.<300> response ended
default	15:40:10.281657-0500	RedLemon	Task <67627267-25CC-4E5F-BC8A-1225482BDE15>.<300> done using Connection 3
default	15:40:10.281879-0500	RedLemon	Task <67627267-25CC-4E5F-BC8A-1225482BDE15>.<300> summary for task success {transaction_duration_ms=63, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=61, response_duration_ms=1, request_bytes=511, response_bytes=840, cache_hit=false}
default	15:40:10.282499-0500	RedLemon	Task <67627267-25CC-4E5F-BC8A-1225482BDE15>.<300> finished successfully
default	15:40:10.284598-0500	RedLemon	📋 Found 2 participants in room G2A4
default	15:40:10.285058-0500	RedLemon	Task <1494F20E-2B39-4B6D-BD57-82864CDF4175>.<301> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.285603-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FCC1453B-D271-4AE3-93B6-796BCD672EC4] (reporting strategy default)> on Task <1494F20E-2B39-4B6D-BD57-82864CDF4175>.<301> was not selected for reporting
default	15:40:10.286273-0500	RedLemon	Task <1494F20E-2B39-4B6D-BD57-82864CDF4175>.<301> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.286498-0500	RedLemon	Task <1494F20E-2B39-4B6D-BD57-82864CDF4175>.<301> now using Connection 3
default	15:40:10.287229-0500	RedLemon	0x7fe7684d5998 ID=264 Task <1494F20E-2B39-4B6D-BD57-82864CDF4175>.<301> sent request, body N 0
default	15:40:10.354926-0500	RedLemon	0x7fe7684d5998 ID=264 Task <1494F20E-2B39-4B6D-BD57-82864CDF4175>.<301> received response, status 200 content U
default	15:40:10.355705-0500	RedLemon	Task <1494F20E-2B39-4B6D-BD57-82864CDF4175>.<301> response ended
default	15:40:10.356149-0500	RedLemon	Task <1494F20E-2B39-4B6D-BD57-82864CDF4175>.<301> done using Connection 3
default	15:40:10.356782-0500	RedLemon	Task <1494F20E-2B39-4B6D-BD57-82864CDF4175>.<301> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=68, response_duration_ms=2, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:40:10.356998-0500	RedLemon	Task <1494F20E-2B39-4B6D-BD57-82864CDF4175>.<301> finished successfully
default	15:40:10.359019-0500	RedLemon	   - ursinho (guest)
default	15:40:10.359416-0500	RedLemon	Task <9233CD8E-1B88-471C-9B16-3CDBF51F4A79>.<302> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.359817-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [45776F48-F0A2-45BA-99D0-8D4322577891] (reporting strategy default)> on Task <9233CD8E-1B88-471C-9B16-3CDBF51F4A79>.<302> was not selected for reporting
default	15:40:10.360553-0500	RedLemon	Task <9233CD8E-1B88-471C-9B16-3CDBF51F4A79>.<302> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.361017-0500	RedLemon	Task <9233CD8E-1B88-471C-9B16-3CDBF51F4A79>.<302> now using Connection 3
default	15:40:10.362016-0500	RedLemon	0x7fe765ab46d8 ID=268 Task <9233CD8E-1B88-471C-9B16-3CDBF51F4A79>.<302> sent request, body N 0
default	15:40:10.421159-0500	RedLemon	0x7fe765ab46d8 ID=268 Task <9233CD8E-1B88-471C-9B16-3CDBF51F4A79>.<302> received response, status 200 content U
default	15:40:10.421967-0500	RedLemon	Task <9233CD8E-1B88-471C-9B16-3CDBF51F4A79>.<302> response ended
default	15:40:10.422909-0500	RedLemon	Task <9233CD8E-1B88-471C-9B16-3CDBF51F4A79>.<302> done using Connection 3
default	15:40:10.423787-0500	RedLemon	Task <9233CD8E-1B88-471C-9B16-3CDBF51F4A79>.<302> summary for task success {transaction_duration_ms=63, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=60, response_duration_ms=2, request_bytes=512, response_bytes=836, cache_hit=false}
default	15:40:10.423990-0500	RedLemon	Task <9233CD8E-1B88-471C-9B16-3CDBF51F4A79>.<302> finished successfully
default	15:40:10.425308-0500	RedLemon	📋 Found 2 participants in room TEXY
default	15:40:10.425656-0500	RedLemon	Task <148AD560-E82F-4347-98F1-CE5C63A0CE55>.<303> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.425939-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1C30506C-C630-4852-A49A-55A3F6011A0B] (reporting strategy default)> on Task <148AD560-E82F-4347-98F1-CE5C63A0CE55>.<303> was not selected for reporting
default	15:40:10.426745-0500	RedLemon	Task <148AD560-E82F-4347-98F1-CE5C63A0CE55>.<303> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.427061-0500	RedLemon	Task <148AD560-E82F-4347-98F1-CE5C63A0CE55>.<303> now using Connection 3
default	15:40:10.428208-0500	RedLemon	0x7fe765ab46d8 ID=272 Task <148AD560-E82F-4347-98F1-CE5C63A0CE55>.<303> sent request, body N 0
default	15:40:10.496582-0500	RedLemon	0x7fe765ab46d8 ID=272 Task <148AD560-E82F-4347-98F1-CE5C63A0CE55>.<303> received response, status 200 content U
default	15:40:10.497411-0500	RedLemon	Task <148AD560-E82F-4347-98F1-CE5C63A0CE55>.<303> response ended
default	15:40:10.498399-0500	RedLemon	Task <148AD560-E82F-4347-98F1-CE5C63A0CE55>.<303> done using Connection 3
default	15:40:10.498773-0500	RedLemon	Task <148AD560-E82F-4347-98F1-CE5C63A0CE55>.<303> summary for task success {transaction_duration_ms=72, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=69, response_duration_ms=2, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:40:10.499298-0500	RedLemon	Task <148AD560-E82F-4347-98F1-CE5C63A0CE55>.<303> finished successfully
default	15:40:10.501408-0500	RedLemon	   - ursinho (guest)
default	15:40:10.501830-0500	RedLemon	Task <2F584D2B-539A-4E0D-B87B-41F54A45B968>.<304> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.502532-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6F2AB6C5-36BC-4918-AE62-F35821A9A5B9] (reporting strategy default)> on Task <2F584D2B-539A-4E0D-B87B-41F54A45B968>.<304> was not selected for reporting
default	15:40:10.503484-0500	RedLemon	Task <2F584D2B-539A-4E0D-B87B-41F54A45B968>.<304> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.503993-0500	RedLemon	Task <2F584D2B-539A-4E0D-B87B-41F54A45B968>.<304> now using Connection 3
default	15:40:10.505794-0500	RedLemon	0x7fe76852dbd8 ID=276 Task <2F584D2B-539A-4E0D-B87B-41F54A45B968>.<304> sent request, body N 0
default	15:40:10.564927-0500	RedLemon	0x7fe76852dbd8 ID=276 Task <2F584D2B-539A-4E0D-B87B-41F54A45B968>.<304> received response, status 200 content U
default	15:40:10.565440-0500	RedLemon	Task <2F584D2B-539A-4E0D-B87B-41F54A45B968>.<304> response ended
default	15:40:10.565840-0500	RedLemon	Task <2F584D2B-539A-4E0D-B87B-41F54A45B968>.<304> done using Connection 3
default	15:40:10.566015-0500	RedLemon	Task <2F584D2B-539A-4E0D-B87B-41F54A45B968>.<304> summary for task success {transaction_duration_ms=62, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=61, response_duration_ms=1, request_bytes=511, response_bytes=839, cache_hit=false}
default	15:40:10.566433-0500	RedLemon	Task <2F584D2B-539A-4E0D-B87B-41F54A45B968>.<304> finished successfully
default	15:40:10.568573-0500	RedLemon	📋 Found 2 participants in room M3R5
default	15:40:10.568964-0500	RedLemon	Task <D3E20D13-1A61-4F3A-BE10-7C6B4D738894>.<305> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.569360-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [24AF21EA-E4DA-41EB-AD62-DE9FC616B476] (reporting strategy default)> on Task <D3E20D13-1A61-4F3A-BE10-7C6B4D738894>.<305> was not selected for reporting
default	15:40:10.569955-0500	runningboardd	Invalidating assertion 166-4995-1715 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:10.570100-0500	RedLemon	Task <D3E20D13-1A61-4F3A-BE10-7C6B4D738894>.<305> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.570362-0500	RedLemon	Task <D3E20D13-1A61-4F3A-BE10-7C6B4D738894>.<305> now using Connection 3
default	15:40:10.571250-0500	RedLemon	0x7fe76852dbd8 ID=280 Task <D3E20D13-1A61-4F3A-BE10-7C6B4D738894>.<305> sent request, body N 0
default	15:40:10.635704-0500	RedLemon	0x7fe76852dbd8 ID=280 Task <D3E20D13-1A61-4F3A-BE10-7C6B4D738894>.<305> received response, status 200 content U
default	15:40:10.636590-0500	RedLemon	Task <D3E20D13-1A61-4F3A-BE10-7C6B4D738894>.<305> response ended
default	15:40:10.637274-0500	RedLemon	Task <D3E20D13-1A61-4F3A-BE10-7C6B4D738894>.<305> done using Connection 3
default	15:40:10.637711-0500	RedLemon	Task <D3E20D13-1A61-4F3A-BE10-7C6B4D738894>.<305> summary for task success {transaction_duration_ms=68, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=65, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:40:10.637898-0500	RedLemon	Task <D3E20D13-1A61-4F3A-BE10-7C6B4D738894>.<305> finished successfully
default	15:40:10.639564-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1717 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:10.640104-0500	RedLemon	   - lemontom (guest)
default	15:40:10.640561-0500	RedLemon	Task <F0835889-05A5-4ECC-A59F-753254269BAF>.<306> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.641305-0500	runningboardd	Assertion 166-4995-1717 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:10.641278-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [A028C8E2-EB93-4D94-919C-39F733CEB724] (reporting strategy default)> on Task <F0835889-05A5-4ECC-A59F-753254269BAF>.<306> was not selected for reporting
default	15:40:10.642036-0500	RedLemon	Task <F0835889-05A5-4ECC-A59F-753254269BAF>.<306> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.642308-0500	RedLemon	Task <F0835889-05A5-4ECC-A59F-753254269BAF>.<306> now using Connection 3
default	15:40:10.643393-0500	RedLemon	0x7fe7684d5998 ID=284 Task <F0835889-05A5-4ECC-A59F-753254269BAF>.<306> sent request, body N 0
default	15:40:10.644625-0500	runningboardd	Attempting to rename power assertion 33910 for target anon<RedLemon>(501) to anon<RedLemon>(501);166-4995-1715:com.apple.CFNetwork.StorageDB;166-4995-1717:com.apple.CFNetwork.StorageDB
default	15:40:10.645030-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:10.645073-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:10.645163-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:10.656475-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:10.721797-0500	runningboardd	Invalidating assertion 166-129-1708 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.coreservices.launchservicesd>:129]
default	15:40:10.722125-0500	RedLemon	0x7fe7684d5998 ID=284 Task <F0835889-05A5-4ECC-A59F-753254269BAF>.<306> received response, status 200 content U
default	15:40:10.718744-0500	runningboardd	Attempting to rename power assertion 33910 for target anon<RedLemon>(501) to anon<RedLemon>(501)166-4995-1717:com.apple.CFNetwork.StorageDB
default	15:40:10.739375-0500	RedLemon	Task <F0835889-05A5-4ECC-A59F-753254269BAF>.<306> response ended
default	15:40:10.741170-0500	RedLemon	Task <F0835889-05A5-4ECC-A59F-753254269BAF>.<306> done using Connection 3
default	15:40:10.742361-0500	RedLemon	Task <F0835889-05A5-4ECC-A59F-753254269BAF>.<306> summary for task success {transaction_duration_ms=100, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=80, response_duration_ms=19, request_bytes=511, response_bytes=838, cache_hit=false}
default	15:40:10.743187-0500	RedLemon	Task <F0835889-05A5-4ECC-A59F-753254269BAF>.<306> finished successfully
default	15:40:10.744992-0500	RedLemon	📋 Found 2 participants in room SH6C
default	15:40:10.745484-0500	RedLemon	Task <AB447C30-E79F-4DB1-A91F-0710C12B113D>.<307> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.746649-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [53835C6C-D521-447E-A1C8-6ED2F9DC9AB2] (reporting strategy default)> on Task <AB447C30-E79F-4DB1-A91F-0710C12B113D>.<307> was not selected for reporting
default	15:40:10.747701-0500	RedLemon	Task <AB447C30-E79F-4DB1-A91F-0710C12B113D>.<307> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.748064-0500	RedLemon	Task <AB447C30-E79F-4DB1-A91F-0710C12B113D>.<307> now using Connection 3
default	15:40:10.751091-0500	RedLemon	0x7fe765ab46d8 ID=288 Task <AB447C30-E79F-4DB1-A91F-0710C12B113D>.<307> sent request, body N 0
default	15:40:10.771104-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:10.771157-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:10.771292-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:10.806132-0500	RedLemon	0x7fe765ab46d8 ID=288 Task <AB447C30-E79F-4DB1-A91F-0710C12B113D>.<307> received response, status 200 content U
default	15:40:10.806709-0500	RedLemon	Task <AB447C30-E79F-4DB1-A91F-0710C12B113D>.<307> response ended
default	15:40:10.807086-0500	RedLemon	Task <AB447C30-E79F-4DB1-A91F-0710C12B113D>.<307> done using Connection 3
default	15:40:10.807269-0500	RedLemon	Task <AB447C30-E79F-4DB1-A91F-0710C12B113D>.<307> summary for task success {transaction_duration_ms=60, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=3, response_start_ms=58, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	15:40:10.807586-0500	RedLemon	Task <AB447C30-E79F-4DB1-A91F-0710C12B113D>.<307> finished successfully
default	15:40:10.809654-0500	RedLemon	   - ursinho (guest)
default	15:40:10.810034-0500	RedLemon	Task <C3B79DD1-4DCF-41AE-9698-5780B55F9E11>.<308> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.810575-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [622384FF-A9A3-4D5E-AFBC-ACA9BAAC63A1] (reporting strategy default)> on Task <C3B79DD1-4DCF-41AE-9698-5780B55F9E11>.<308> was not selected for reporting
default	15:40:10.811290-0500	RedLemon	Task <C3B79DD1-4DCF-41AE-9698-5780B55F9E11>.<308> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.811605-0500	RedLemon	Task <C3B79DD1-4DCF-41AE-9698-5780B55F9E11>.<308> now using Connection 3
default	15:40:10.812594-0500	RedLemon	0x7fe7659c4a98 ID=292 Task <C3B79DD1-4DCF-41AE-9698-5780B55F9E11>.<308> sent request, body N 0
default	15:40:10.832895-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:10.833122-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:10.833472-0500	runningboardd	[anon<RedLemon>(501):4995] Set darwin role to: UserInteractiveNonFocal
default	15:40:10.833522-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:10.876061-0500	RedLemon	0x7fe7659c4a98 ID=292 Task <C3B79DD1-4DCF-41AE-9698-5780B55F9E11>.<308> received response, status 200 content U
default	15:40:10.876640-0500	RedLemon	Task <C3B79DD1-4DCF-41AE-9698-5780B55F9E11>.<308> response ended
default	15:40:10.877083-0500	RedLemon	Task <C3B79DD1-4DCF-41AE-9698-5780B55F9E11>.<308> done using Connection 3
default	15:40:10.877293-0500	RedLemon	Task <C3B79DD1-4DCF-41AE-9698-5780B55F9E11>.<308> summary for task success {transaction_duration_ms=66, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=1, request_bytes=511, response_bytes=839, cache_hit=false}
default	15:40:10.877504-0500	RedLemon	Task <C3B79DD1-4DCF-41AE-9698-5780B55F9E11>.<308> finished successfully
default	15:40:10.878951-0500	RedLemon	📋 Found 2 participants in room J3Q8
default	15:40:10.879329-0500	RedLemon	Task <0E10FEDA-0633-4AE8-B546-3949F5A6FE0A>.<309> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.879713-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [21C7E750-E3AE-4AD7-9C60-7A21438B1AE1] (reporting strategy default)> on Task <0E10FEDA-0633-4AE8-B546-3949F5A6FE0A>.<309> was not selected for reporting
default	15:40:10.880444-0500	RedLemon	Task <0E10FEDA-0633-4AE8-B546-3949F5A6FE0A>.<309> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.880670-0500	RedLemon	Task <0E10FEDA-0633-4AE8-B546-3949F5A6FE0A>.<309> now using Connection 3
default	15:40:10.881556-0500	RedLemon	0x7fe7683d4a28 ID=296 Task <0E10FEDA-0633-4AE8-B546-3949F5A6FE0A>.<309> sent request, body N 0
default	15:40:10.944334-0500	RedLemon	0x7fe7683d4a28 ID=296 Task <0E10FEDA-0633-4AE8-B546-3949F5A6FE0A>.<309> received response, status 200 content U
default	15:40:10.945234-0500	RedLemon	Task <0E10FEDA-0633-4AE8-B546-3949F5A6FE0A>.<309> response ended
default	15:40:10.945836-0500	RedLemon	Task <0E10FEDA-0633-4AE8-B546-3949F5A6FE0A>.<309> done using Connection 3
default	15:40:10.946576-0500	RedLemon	Task <0E10FEDA-0633-4AE8-B546-3949F5A6FE0A>.<309> summary for task success {transaction_duration_ms=66, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=2, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:40:10.946985-0500	RedLemon	Task <0E10FEDA-0633-4AE8-B546-3949F5A6FE0A>.<309> finished successfully
default	15:40:10.949723-0500	RedLemon	   - ursinho (guest)
default	15:40:10.950133-0500	RedLemon	Task <5AB89E84-DFB8-4F9E-B10A-9DF0443730D0>.<310> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:10.950803-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [35DDEFF5-4B62-41B5-845E-95A2EB5F03AF] (reporting strategy default)> on Task <5AB89E84-DFB8-4F9E-B10A-9DF0443730D0>.<310> was not selected for reporting
default	15:40:10.951625-0500	RedLemon	Task <5AB89E84-DFB8-4F9E-B10A-9DF0443730D0>.<310> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:10.952078-0500	RedLemon	Task <5AB89E84-DFB8-4F9E-B10A-9DF0443730D0>.<310> now using Connection 3
default	15:40:10.953007-0500	RedLemon	0x7fe7683d4a28 ID=300 Task <5AB89E84-DFB8-4F9E-B10A-9DF0443730D0>.<310> sent request, body N 0
default	15:40:11.011976-0500	RedLemon	0x7fe7683d4a28 ID=300 Task <5AB89E84-DFB8-4F9E-B10A-9DF0443730D0>.<310> received response, status 200 content U
default	15:40:11.012788-0500	RedLemon	Task <5AB89E84-DFB8-4F9E-B10A-9DF0443730D0>.<310> response ended
default	15:40:11.013789-0500	RedLemon	Task <5AB89E84-DFB8-4F9E-B10A-9DF0443730D0>.<310> done using Connection 3
default	15:40:11.014273-0500	RedLemon	Task <5AB89E84-DFB8-4F9E-B10A-9DF0443730D0>.<310> summary for task success {transaction_duration_ms=62, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=60, response_duration_ms=2, request_bytes=512, response_bytes=838, cache_hit=false}
default	15:40:11.015022-0500	RedLemon	Task <5AB89E84-DFB8-4F9E-B10A-9DF0443730D0>.<310> finished successfully
default	15:40:11.016364-0500	RedLemon	📋 Found 2 participants in room PRMH
default	15:40:11.016710-0500	RedLemon	Task <534A841B-B664-4398-BA84-DD161F2A20BC>.<311> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.017057-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1DE5E413-AC29-4248-8446-B9FCDCF17E2B] (reporting strategy default)> on Task <534A841B-B664-4398-BA84-DD161F2A20BC>.<311> was not selected for reporting
default	15:40:11.017683-0500	RedLemon	Task <534A841B-B664-4398-BA84-DD161F2A20BC>.<311> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.017971-0500	RedLemon	Task <534A841B-B664-4398-BA84-DD161F2A20BC>.<311> now using Connection 3
default	15:40:11.018825-0500	RedLemon	0x7fe7659c4a98 ID=304 Task <534A841B-B664-4398-BA84-DD161F2A20BC>.<311> sent request, body N 0
default	15:40:11.085311-0500	RedLemon	0x7fe7659c4a98 ID=304 Task <534A841B-B664-4398-BA84-DD161F2A20BC>.<311> received response, status 200 content U
default	15:40:11.086157-0500	RedLemon	Task <534A841B-B664-4398-BA84-DD161F2A20BC>.<311> response ended
default	15:40:11.086827-0500	RedLemon	Task <534A841B-B664-4398-BA84-DD161F2A20BC>.<311> done using Connection 3
default	15:40:11.087114-0500	RedLemon	Task <534A841B-B664-4398-BA84-DD161F2A20BC>.<311> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=67, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=false}
default	15:40:11.087500-0500	RedLemon	Task <534A841B-B664-4398-BA84-DD161F2A20BC>.<311> finished successfully
default	15:40:11.089747-0500	RedLemon	   - ursinho (guest)
default	15:40:11.090099-0500	RedLemon	Task <351273DC-630B-4A65-9C2F-6A7AEFAD67D6>.<312> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.090382-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DED18509-EC05-48DA-B12C-66ECECEEF8D6] (reporting strategy default)> on Task <351273DC-630B-4A65-9C2F-6A7AEFAD67D6>.<312> was not selected for reporting
default	15:40:11.091002-0500	RedLemon	Task <351273DC-630B-4A65-9C2F-6A7AEFAD67D6>.<312> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.091204-0500	RedLemon	Task <351273DC-630B-4A65-9C2F-6A7AEFAD67D6>.<312> now using Connection 3
default	15:40:11.091953-0500	RedLemon	0x7fe7683d4a28 ID=308 Task <351273DC-630B-4A65-9C2F-6A7AEFAD67D6>.<312> sent request, body N 0
default	15:40:11.152964-0500	RedLemon	0x7fe7683d4a28 ID=308 Task <351273DC-630B-4A65-9C2F-6A7AEFAD67D6>.<312> received response, status 200 content U
default	15:40:11.153570-0500	RedLemon	Task <351273DC-630B-4A65-9C2F-6A7AEFAD67D6>.<312> response ended
default	15:40:11.154064-0500	RedLemon	Task <351273DC-630B-4A65-9C2F-6A7AEFAD67D6>.<312> done using Connection 3
default	15:40:11.154344-0500	RedLemon	Task <351273DC-630B-4A65-9C2F-6A7AEFAD67D6>.<312> summary for task success {transaction_duration_ms=63, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=1, request_bytes=511, response_bytes=834, cache_hit=false}
default	15:40:11.155030-0500	RedLemon	Task <351273DC-630B-4A65-9C2F-6A7AEFAD67D6>.<312> finished successfully
default	15:40:11.156825-0500	RedLemon	📋 Found 2 participants in room 5QC6
default	15:40:11.157149-0500	RedLemon	Task <2A8B0E8E-6D46-42A0-8900-DC090BBF1406>.<313> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.157427-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9799C416-9F25-4BE2-8734-2EBC80033DEF] (reporting strategy default)> on Task <2A8B0E8E-6D46-42A0-8900-DC090BBF1406>.<313> was not selected for reporting
default	15:40:11.158123-0500	RedLemon	Task <2A8B0E8E-6D46-42A0-8900-DC090BBF1406>.<313> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.158314-0500	RedLemon	Task <2A8B0E8E-6D46-42A0-8900-DC090BBF1406>.<313> now using Connection 3
default	15:40:11.159008-0500	RedLemon	0x7fe7683d4a28 ID=312 Task <2A8B0E8E-6D46-42A0-8900-DC090BBF1406>.<313> sent request, body N 0
default	15:40:11.220944-0500	RedLemon	0x7fe7683d4a28 ID=312 Task <2A8B0E8E-6D46-42A0-8900-DC090BBF1406>.<313> received response, status 200 content U
default	15:40:11.221568-0500	RedLemon	Task <2A8B0E8E-6D46-42A0-8900-DC090BBF1406>.<313> response ended
default	15:40:11.222078-0500	RedLemon	Task <2A8B0E8E-6D46-42A0-8900-DC090BBF1406>.<313> done using Connection 3
default	15:40:11.222317-0500	RedLemon	Task <2A8B0E8E-6D46-42A0-8900-DC090BBF1406>.<313> summary for task success {transaction_duration_ms=64, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=841, cache_hit=true}
default	15:40:11.222968-0500	RedLemon	Task <2A8B0E8E-6D46-42A0-8900-DC090BBF1406>.<313> finished successfully
default	15:40:11.225307-0500	RedLemon	   - ursinho (guest)
default	15:40:11.225610-0500	RedLemon	Task <D2EF2056-7D3A-49E9-BB6D-638C11D88DB0>.<314> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.225928-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F6759633-F291-4250-A9A2-51D64ABB00C7] (reporting strategy default)> on Task <D2EF2056-7D3A-49E9-BB6D-638C11D88DB0>.<314> was not selected for reporting
default	15:40:11.226802-0500	RedLemon	Task <D2EF2056-7D3A-49E9-BB6D-638C11D88DB0>.<314> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.227102-0500	RedLemon	Task <D2EF2056-7D3A-49E9-BB6D-638C11D88DB0>.<314> now using Connection 3
default	15:40:11.228243-0500	RedLemon	0x7fe765ab46d8 ID=316 Task <D2EF2056-7D3A-49E9-BB6D-638C11D88DB0>.<314> sent request, body N 0
default	15:40:11.289519-0500	RedLemon	0x7fe765ab46d8 ID=316 Task <D2EF2056-7D3A-49E9-BB6D-638C11D88DB0>.<314> received response, status 200 content U
default	15:40:11.290201-0500	RedLemon	Task <D2EF2056-7D3A-49E9-BB6D-638C11D88DB0>.<314> response ended
default	15:40:11.290499-0500	RedLemon	Task <D2EF2056-7D3A-49E9-BB6D-638C11D88DB0>.<314> done using Connection 3
default	15:40:11.290642-0500	RedLemon	Task <D2EF2056-7D3A-49E9-BB6D-638C11D88DB0>.<314> summary for task success {transaction_duration_ms=64, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=62, response_duration_ms=1, request_bytes=511, response_bytes=839, cache_hit=false}
default	15:40:11.290994-0500	RedLemon	Task <D2EF2056-7D3A-49E9-BB6D-638C11D88DB0>.<314> finished successfully
default	15:40:11.292296-0500	RedLemon	📋 Found 2 participants in room SGV2
default	15:40:11.292623-0500	RedLemon	Task <267D69BB-3D60-486A-9DB1-DC96A4073514>.<315> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.292906-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8BD6F7B0-9D30-4CDB-B142-577B4CD5EC90] (reporting strategy default)> on Task <267D69BB-3D60-486A-9DB1-DC96A4073514>.<315> was not selected for reporting
default	15:40:11.293612-0500	RedLemon	Task <267D69BB-3D60-486A-9DB1-DC96A4073514>.<315> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.293798-0500	RedLemon	Task <267D69BB-3D60-486A-9DB1-DC96A4073514>.<315> now using Connection 3
default	15:40:11.294502-0500	RedLemon	0x7fe7683d4a28 ID=320 Task <267D69BB-3D60-486A-9DB1-DC96A4073514>.<315> sent request, body N 0
default	15:40:11.355521-0500	RedLemon	0x7fe7683d4a28 ID=320 Task <267D69BB-3D60-486A-9DB1-DC96A4073514>.<315> received response, status 200 content U
default	15:40:11.356081-0500	RedLemon	Task <267D69BB-3D60-486A-9DB1-DC96A4073514>.<315> response ended
default	15:40:11.356336-0500	RedLemon	Task <267D69BB-3D60-486A-9DB1-DC96A4073514>.<315> done using Connection 3
default	15:40:11.356461-0500	RedLemon	Task <267D69BB-3D60-486A-9DB1-DC96A4073514>.<315> summary for task success {transaction_duration_ms=63, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:40:11.356817-0500	RedLemon	Task <267D69BB-3D60-486A-9DB1-DC96A4073514>.<315> finished successfully
default	15:40:11.358105-0500	RedLemon	   - ursinho (guest)
default	15:40:11.358431-0500	RedLemon	Task <475A9EE8-9960-4833-A907-0E599855837B>.<316> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.358690-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [88D38616-AC8C-4BBF-8BD2-3752F24891B2] (reporting strategy default)> on Task <475A9EE8-9960-4833-A907-0E599855837B>.<316> was not selected for reporting
default	15:40:11.359276-0500	RedLemon	Task <475A9EE8-9960-4833-A907-0E599855837B>.<316> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.359462-0500	RedLemon	Task <475A9EE8-9960-4833-A907-0E599855837B>.<316> now using Connection 3
default	15:40:11.360065-0500	RedLemon	0x7fe7683d4a28 ID=324 Task <475A9EE8-9960-4833-A907-0E599855837B>.<316> sent request, body N 0
default	15:40:11.376267-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:11.431065-0500	RedLemon	0x7fe7683d4a28 ID=324 Task <475A9EE8-9960-4833-A907-0E599855837B>.<316> received response, status 200 content U
default	15:40:11.431677-0500	RedLemon	Task <475A9EE8-9960-4833-A907-0E599855837B>.<316> response ended
default	15:40:11.432174-0500	RedLemon	Task <475A9EE8-9960-4833-A907-0E599855837B>.<316> done using Connection 3
default	15:40:11.432411-0500	RedLemon	Task <475A9EE8-9960-4833-A907-0E599855837B>.<316> summary for task success {transaction_duration_ms=73, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=71, response_duration_ms=1, request_bytes=511, response_bytes=832, cache_hit=false}
default	15:40:11.432893-0500	RedLemon	Task <475A9EE8-9960-4833-A907-0E599855837B>.<316> finished successfully
default	15:40:11.434746-0500	RedLemon	📋 Found 2 participants in room URC9
default	15:40:11.435308-0500	RedLemon	Task <DF26033A-9F24-4ECF-9A1D-DD6D7501BCCC>.<317> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.435576-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [EC6696DB-B6A7-4EEA-BE3E-B1B6B761FE48] (reporting strategy default)> on Task <DF26033A-9F24-4ECF-9A1D-DD6D7501BCCC>.<317> was not selected for reporting
default	15:40:11.436301-0500	RedLemon	Task <DF26033A-9F24-4ECF-9A1D-DD6D7501BCCC>.<317> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.436502-0500	RedLemon	Task <DF26033A-9F24-4ECF-9A1D-DD6D7501BCCC>.<317> now using Connection 3
default	15:40:11.437239-0500	RedLemon	0x7fe7680a6168 ID=328 Task <DF26033A-9F24-4ECF-9A1D-DD6D7501BCCC>.<317> sent request, body N 0
default	15:40:11.497700-0500	RedLemon	0x7fe7680a6168 ID=328 Task <DF26033A-9F24-4ECF-9A1D-DD6D7501BCCC>.<317> received response, status 200 content U
default	15:40:11.498361-0500	RedLemon	Task <DF26033A-9F24-4ECF-9A1D-DD6D7501BCCC>.<317> response ended
default	15:40:11.499254-0500	RedLemon	Task <DF26033A-9F24-4ECF-9A1D-DD6D7501BCCC>.<317> done using Connection 3
default	15:40:11.499881-0500	RedLemon	Task <DF26033A-9F24-4ECF-9A1D-DD6D7501BCCC>.<317> summary for task success {transaction_duration_ms=63, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:40:11.500514-0500	RedLemon	Task <DF26033A-9F24-4ECF-9A1D-DD6D7501BCCC>.<317> finished successfully
default	15:40:11.502505-0500	RedLemon	   - ursinho (guest)
default	15:40:11.502870-0500	RedLemon	Task <FC6C31F6-8057-45EF-B889-28E7B6535B90>.<318> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.503176-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C2C78F47-DD55-4230-B596-C78423EAE679] (reporting strategy default)> on Task <FC6C31F6-8057-45EF-B889-28E7B6535B90>.<318> was not selected for reporting
default	15:40:11.503797-0500	RedLemon	Task <FC6C31F6-8057-45EF-B889-28E7B6535B90>.<318> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.504008-0500	RedLemon	Task <FC6C31F6-8057-45EF-B889-28E7B6535B90>.<318> now using Connection 3
default	15:40:11.504715-0500	RedLemon	0x7fe7683d4a28 ID=332 Task <FC6C31F6-8057-45EF-B889-28E7B6535B90>.<318> sent request, body N 0
default	15:40:11.567810-0500	RedLemon	0x7fe7683d4a28 ID=332 Task <FC6C31F6-8057-45EF-B889-28E7B6535B90>.<318> received response, status 200 content U
default	15:40:11.568821-0500	RedLemon	Task <FC6C31F6-8057-45EF-B889-28E7B6535B90>.<318> response ended
default	15:40:11.569369-0500	RedLemon	Task <FC6C31F6-8057-45EF-B889-28E7B6535B90>.<318> done using Connection 3
default	15:40:11.569514-0500	RedLemon	Task <FC6C31F6-8057-45EF-B889-28E7B6535B90>.<318> summary for task success {transaction_duration_ms=66, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=1, request_bytes=512, response_bytes=836, cache_hit=false}
default	15:40:11.569832-0500	RedLemon	Task <FC6C31F6-8057-45EF-B889-28E7B6535B90>.<318> finished successfully
default	15:40:11.571173-0500	RedLemon	📋 Found 2 participants in room JRCM
default	15:40:11.571696-0500	RedLemon	Task <FCD32DC5-2C9E-4085-993A-CF0740F7C96E>.<319> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.572525-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [81CFE588-F8FF-4BCD-BB48-1110934DD9E7] (reporting strategy default)> on Task <FCD32DC5-2C9E-4085-993A-CF0740F7C96E>.<319> was not selected for reporting
default	15:40:11.573426-0500	RedLemon	Task <FCD32DC5-2C9E-4085-993A-CF0740F7C96E>.<319> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.573642-0500	RedLemon	Task <FCD32DC5-2C9E-4085-993A-CF0740F7C96E>.<319> now using Connection 3
default	15:40:11.574594-0500	RedLemon	0x7fe765ab46d8 ID=336 Task <FCD32DC5-2C9E-4085-993A-CF0740F7C96E>.<319> sent request, body N 0
default	15:40:11.635827-0500	RedLemon	0x7fe765ab46d8 ID=336 Task <FCD32DC5-2C9E-4085-993A-CF0740F7C96E>.<319> received response, status 200 content U
default	15:40:11.636924-0500	RedLemon	Task <FCD32DC5-2C9E-4085-993A-CF0740F7C96E>.<319> response ended
default	15:40:11.637828-0500	RedLemon	Task <FCD32DC5-2C9E-4085-993A-CF0740F7C96E>.<319> done using Connection 3
default	15:40:11.638344-0500	RedLemon	Task <FCD32DC5-2C9E-4085-993A-CF0740F7C96E>.<319> summary for task success {transaction_duration_ms=65, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=2, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:40:11.638748-0500	RedLemon	Task <FCD32DC5-2C9E-4085-993A-CF0740F7C96E>.<319> finished successfully
default	15:40:11.640389-0500	RedLemon	   - ursinho (guest)
default	15:40:11.640743-0500	RedLemon	Task <BB87EFFD-6C92-43F6-90CD-EBB8974A950F>.<320> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.641120-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6F88878F-F763-4B81-ABB6-C6159A8FF60B] (reporting strategy default)> on Task <BB87EFFD-6C92-43F6-90CD-EBB8974A950F>.<320> was not selected for reporting
default	15:40:11.641691-0500	RedLemon	Task <BB87EFFD-6C92-43F6-90CD-EBB8974A950F>.<320> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.641894-0500	RedLemon	Task <BB87EFFD-6C92-43F6-90CD-EBB8974A950F>.<320> now using Connection 3
default	15:40:11.642576-0500	RedLemon	0x7fe7683d4a28 ID=340 Task <BB87EFFD-6C92-43F6-90CD-EBB8974A950F>.<320> sent request, body N 0
default	15:40:11.653817-0500	runningboardd	Invalidating assertion 166-4995-1717 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:11.707917-0500	RedLemon	0x7fe7683d4a28 ID=340 Task <BB87EFFD-6C92-43F6-90CD-EBB8974A950F>.<320> received response, status 200 content U
default	15:40:11.709397-0500	RedLemon	Task <BB87EFFD-6C92-43F6-90CD-EBB8974A950F>.<320> response ended
default	15:40:11.710289-0500	RedLemon	Task <BB87EFFD-6C92-43F6-90CD-EBB8974A950F>.<320> done using Connection 3
default	15:40:11.711180-0500	RedLemon	Task <BB87EFFD-6C92-43F6-90CD-EBB8974A950F>.<320> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=66, response_duration_ms=2, request_bytes=512, response_bytes=840, cache_hit=false}
default	15:40:11.711678-0500	RedLemon	Task <BB87EFFD-6C92-43F6-90CD-EBB8974A950F>.<320> finished successfully
default	15:40:11.712513-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1722 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:11.712707-0500	runningboardd	Assertion 166-4995-1722 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:11.713207-0500	RedLemon	📋 Found 2 participants in room NTDS
default	15:40:11.713593-0500	RedLemon	Task <14AA37EE-DFF2-4BCB-AB74-7C2DF332D861>.<321> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.714031-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F769FC09-12BC-4EC8-AA20-342BB18E65FA] (reporting strategy default)> on Task <14AA37EE-DFF2-4BCB-AB74-7C2DF332D861>.<321> was not selected for reporting
default	15:40:11.714799-0500	RedLemon	Task <14AA37EE-DFF2-4BCB-AB74-7C2DF332D861>.<321> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.714977-0500	runningboardd	Attempting to rename power assertion 33910 for target anon<RedLemon>(501) to anon<RedLemon>(501);166-4995-1717:com.apple.CFNetwork.StorageDB;166-4995-1722:com.apple.CFNetwork.StorageDB
default	15:40:11.715075-0500	RedLemon	Task <14AA37EE-DFF2-4BCB-AB74-7C2DF332D861>.<321> now using Connection 3
default	15:40:11.716064-0500	RedLemon	0x7fe7683d4a28 ID=344 Task <14AA37EE-DFF2-4BCB-AB74-7C2DF332D861>.<321> sent request, body N 0
default	15:40:11.716439-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:11.716490-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:11.716533-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:11.756724-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:11.756804-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:11.757708-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:11.758270-0500	runningboardd	Attempting to rename power assertion 33910 for target anon<RedLemon>(501) to anon<RedLemon>(501)166-4995-1722:com.apple.CFNetwork.StorageDB
default	15:40:11.777076-0500	RedLemon	0x7fe7683d4a28 ID=344 Task <14AA37EE-DFF2-4BCB-AB74-7C2DF332D861>.<321> received response, status 200 content U
default	15:40:11.777554-0500	RedLemon	Task <14AA37EE-DFF2-4BCB-AB74-7C2DF332D861>.<321> response ended
default	15:40:11.777843-0500	RedLemon	Task <14AA37EE-DFF2-4BCB-AB74-7C2DF332D861>.<321> done using Connection 3
default	15:40:11.777987-0500	RedLemon	Task <14AA37EE-DFF2-4BCB-AB74-7C2DF332D861>.<321> summary for task success {transaction_duration_ms=63, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=0, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:40:11.778333-0500	RedLemon	Task <14AA37EE-DFF2-4BCB-AB74-7C2DF332D861>.<321> finished successfully
default	15:40:11.779913-0500	RedLemon	   - ursinho (guest)
default	15:40:11.780289-0500	RedLemon	Task <0BE94B20-8E1C-4375-9ADA-761508CFAA27>.<322> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.780586-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [32BBC2A3-F206-40F8-BD90-89F0CD7A7902] (reporting strategy default)> on Task <0BE94B20-8E1C-4375-9ADA-761508CFAA27>.<322> was not selected for reporting
default	15:40:11.781223-0500	RedLemon	Task <0BE94B20-8E1C-4375-9ADA-761508CFAA27>.<322> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.781423-0500	RedLemon	Task <0BE94B20-8E1C-4375-9ADA-761508CFAA27>.<322> now using Connection 3
default	15:40:11.782533-0500	RedLemon	0x7fe7680a6168 ID=348 Task <0BE94B20-8E1C-4375-9ADA-761508CFAA27>.<322> sent request, body N 0
default	15:40:11.843358-0500	RedLemon	0x7fe7680a6168 ID=348 Task <0BE94B20-8E1C-4375-9ADA-761508CFAA27>.<322> received response, status 200 content U
default	15:40:11.844125-0500	RedLemon	Task <0BE94B20-8E1C-4375-9ADA-761508CFAA27>.<322> response ended
default	15:40:11.844630-0500	RedLemon	Task <0BE94B20-8E1C-4375-9ADA-761508CFAA27>.<322> done using Connection 3
default	15:40:11.844863-0500	RedLemon	Task <0BE94B20-8E1C-4375-9ADA-761508CFAA27>.<322> summary for task success {transaction_duration_ms=63, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=62, response_duration_ms=1, request_bytes=511, response_bytes=838, cache_hit=false}
default	15:40:11.845398-0500	RedLemon	Task <0BE94B20-8E1C-4375-9ADA-761508CFAA27>.<322> finished successfully
default	15:40:11.846955-0500	RedLemon	📋 Found 2 participants in room 3PBW
default	15:40:11.847322-0500	RedLemon	Task <C03A3A99-AEA1-4BA9-8555-54CA38209022>.<323> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.847682-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6B35DA77-F13D-4510-882E-2E467EAC03C5] (reporting strategy default)> on Task <C03A3A99-AEA1-4BA9-8555-54CA38209022>.<323> was not selected for reporting
default	15:40:11.848448-0500	RedLemon	Task <C03A3A99-AEA1-4BA9-8555-54CA38209022>.<323> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.848644-0500	RedLemon	Task <C03A3A99-AEA1-4BA9-8555-54CA38209022>.<323> now using Connection 3
default	15:40:11.849312-0500	RedLemon	0x7fe7683d4a28 ID=352 Task <C03A3A99-AEA1-4BA9-8555-54CA38209022>.<323> sent request, body N 0
default	15:40:11.854183-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:11.857793-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "frontmost:4995" ID:166-129-1723 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"RoleUserInteractiveFocal" sourceEnvironment:"(null)">
	]>
default	15:40:11.858068-0500	runningboardd	Assertion 166-129-1723 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:11.872910-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:11.876241-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:11.876331-0500	runningboardd	[anon<RedLemon>(501):4995] Set darwin role to: UserInteractiveFocal
default	15:40:11.876391-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:11.886691-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.coreservices.launchservicesd>:129] with description <RBSAssertionDescriptor| "notification:4995" ID:166-129-1724 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.launchservicesd" name:"LSNotification" sourceEnvironment:"(null)">
	]>
default	15:40:11.886868-0500	runningboardd	Assertion 166-129-1724 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:11.890402-0500	runningboardd	Invalidating assertion 166-129-1709 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.coreservices.launchservicesd>:129]
default	15:40:11.911550-0500	RedLemon	0x7fe7683d4a28 ID=352 Task <C03A3A99-AEA1-4BA9-8555-54CA38209022>.<323> received response, status 200 content U
default	15:40:11.912873-0500	RedLemon	Task <C03A3A99-AEA1-4BA9-8555-54CA38209022>.<323> response ended
default	15:40:11.918561-0500	RedLemon	Task <C03A3A99-AEA1-4BA9-8555-54CA38209022>.<323> done using Connection 3
default	15:40:11.919308-0500	RedLemon	Task <C03A3A99-AEA1-4BA9-8555-54CA38209022>.<323> summary for task success {transaction_duration_ms=71, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=7, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:40:11.919806-0500	RedLemon	Task <C03A3A99-AEA1-4BA9-8555-54CA38209022>.<323> finished successfully
default	15:40:11.922259-0500	RedLemon	   - ursinho (guest)
default	15:40:11.922766-0500	RedLemon	Task <A62AB053-418E-4449-97C4-05F450725DE0>.<324> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.923146-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6E0E8A40-9B22-4F12-8538-AD80B4984295] (reporting strategy default)> on Task <A62AB053-418E-4449-97C4-05F450725DE0>.<324> was not selected for reporting
default	15:40:11.923804-0500	RedLemon	Task <A62AB053-418E-4449-97C4-05F450725DE0>.<324> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.924078-0500	RedLemon	Task <A62AB053-418E-4449-97C4-05F450725DE0>.<324> now using Connection 3
default	15:40:11.925066-0500	RedLemon	0x7fe7680a6168 ID=356 Task <A62AB053-418E-4449-97C4-05F450725DE0>.<324> sent request, body N 0
default	15:40:11.990631-0500	RedLemon	0x7fe7680a6168 ID=356 Task <A62AB053-418E-4449-97C4-05F450725DE0>.<324> received response, status 200 content U
default	15:40:11.991554-0500	RedLemon	Task <A62AB053-418E-4449-97C4-05F450725DE0>.<324> response ended
default	15:40:11.993174-0500	RedLemon	Task <A62AB053-418E-4449-97C4-05F450725DE0>.<324> done using Connection 3
default	15:40:11.993700-0500	RedLemon	Task <A62AB053-418E-4449-97C4-05F450725DE0>.<324> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=66, response_duration_ms=2, request_bytes=511, response_bytes=837, cache_hit=false}
default	15:40:11.993993-0500	RedLemon	Task <A62AB053-418E-4449-97C4-05F450725DE0>.<324> finished successfully
default	15:40:11.996210-0500	RedLemon	📋 Found 2 participants in room 3LBS
default	15:40:11.996572-0500	RedLemon	Task <84768A4A-F641-48D0-83B9-C5C4A759FAB3>.<325> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:11.996978-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [15ACF88C-3CEE-4103-A986-F1B3F9FCE73C] (reporting strategy default)> on Task <84768A4A-F641-48D0-83B9-C5C4A759FAB3>.<325> was not selected for reporting
default	15:40:11.997688-0500	RedLemon	Task <84768A4A-F641-48D0-83B9-C5C4A759FAB3>.<325> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:11.997956-0500	RedLemon	Task <84768A4A-F641-48D0-83B9-C5C4A759FAB3>.<325> now using Connection 3
default	15:40:11.998811-0500	RedLemon	0x7fe765baefb8 ID=360 Task <84768A4A-F641-48D0-83B9-C5C4A759FAB3>.<325> sent request, body N 0
default	15:40:12.062236-0500	RedLemon	0x7fe765baefb8 ID=360 Task <84768A4A-F641-48D0-83B9-C5C4A759FAB3>.<325> received response, status 200 content U
default	15:40:12.062827-0500	RedLemon	Task <84768A4A-F641-48D0-83B9-C5C4A759FAB3>.<325> response ended
default	15:40:12.063261-0500	RedLemon	Task <84768A4A-F641-48D0-83B9-C5C4A759FAB3>.<325> done using Connection 3
default	15:40:12.063486-0500	RedLemon	Task <84768A4A-F641-48D0-83B9-C5C4A759FAB3>.<325> summary for task success {transaction_duration_ms=66, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=64, response_duration_ms=1, request_bytes=524, response_bytes=842, cache_hit=true}
default	15:40:12.064027-0500	RedLemon	Task <84768A4A-F641-48D0-83B9-C5C4A759FAB3>.<325> finished successfully
default	15:40:12.066031-0500	RedLemon	   - ursinho (guest)
default	15:40:12.066384-0500	RedLemon	Task <20E7B5F2-5048-4EB6-A72D-F8DDD40E1D4A>.<326> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.066790-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9B554B17-5C42-43F9-8118-770E896C13A5] (reporting strategy default)> on Task <20E7B5F2-5048-4EB6-A72D-F8DDD40E1D4A>.<326> was not selected for reporting
default	15:40:12.067392-0500	RedLemon	Task <20E7B5F2-5048-4EB6-A72D-F8DDD40E1D4A>.<326> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.067580-0500	RedLemon	Task <20E7B5F2-5048-4EB6-A72D-F8DDD40E1D4A>.<326> now using Connection 3
default	15:40:12.068285-0500	RedLemon	0x7fe765baefb8 ID=364 Task <20E7B5F2-5048-4EB6-A72D-F8DDD40E1D4A>.<326> sent request, body N 0
default	15:40:12.137303-0500	RedLemon	0x7fe765baefb8 ID=364 Task <20E7B5F2-5048-4EB6-A72D-F8DDD40E1D4A>.<326> received response, status 200 content U
default	15:40:12.138029-0500	RedLemon	Task <20E7B5F2-5048-4EB6-A72D-F8DDD40E1D4A>.<326> response ended
default	15:40:12.138394-0500	RedLemon	Task <20E7B5F2-5048-4EB6-A72D-F8DDD40E1D4A>.<326> done using Connection 3
default	15:40:12.138535-0500	RedLemon	Task <20E7B5F2-5048-4EB6-A72D-F8DDD40E1D4A>.<326> summary for task success {transaction_duration_ms=71, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=1, request_bytes=511, response_bytes=834, cache_hit=false}
default	15:40:12.138822-0500	RedLemon	Task <20E7B5F2-5048-4EB6-A72D-F8DDD40E1D4A>.<326> finished successfully
default	15:40:12.140114-0500	RedLemon	📋 Found 2 participants in room 3E65
default	15:40:12.140446-0500	RedLemon	Task <F8D2143F-1A85-4AF8-A000-68F7F070BFF9>.<327> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.140849-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [20D80DF6-F4C7-478E-9030-359B48A7DD31] (reporting strategy default)> on Task <F8D2143F-1A85-4AF8-A000-68F7F070BFF9>.<327> was not selected for reporting
default	15:40:12.141449-0500	RedLemon	Task <F8D2143F-1A85-4AF8-A000-68F7F070BFF9>.<327> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.141658-0500	RedLemon	Task <F8D2143F-1A85-4AF8-A000-68F7F070BFF9>.<327> now using Connection 3
default	15:40:12.143011-0500	RedLemon	0x7fe7680a6168 ID=368 Task <F8D2143F-1A85-4AF8-A000-68F7F070BFF9>.<327> sent request, body N 0
default	15:40:12.154479-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:12.209139-0500	RedLemon	0x7fe7680a6168 ID=368 Task <F8D2143F-1A85-4AF8-A000-68F7F070BFF9>.<327> received response, status 200 content U
default	15:40:12.210001-0500	RedLemon	Task <F8D2143F-1A85-4AF8-A000-68F7F070BFF9>.<327> response ended
default	15:40:12.210273-0500	RedLemon	Task <F8D2143F-1A85-4AF8-A000-68F7F070BFF9>.<327> done using Connection 3
default	15:40:12.210412-0500	RedLemon	Task <F8D2143F-1A85-4AF8-A000-68F7F070BFF9>.<327> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=67, response_duration_ms=1, request_bytes=524, response_bytes=841, cache_hit=true}
default	15:40:12.210732-0500	RedLemon	Task <F8D2143F-1A85-4AF8-A000-68F7F070BFF9>.<327> finished successfully
default	15:40:12.212181-0500	RedLemon	   - ursinho (guest)
default	15:40:12.212531-0500	RedLemon	Task <1E6958FA-DC85-4625-81E9-C77F243B7C33>.<328> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.212801-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FF1CAE8D-9DDA-4586-8E04-2CC991D5DA97] (reporting strategy default)> on Task <1E6958FA-DC85-4625-81E9-C77F243B7C33>.<328> was not selected for reporting
default	15:40:12.213454-0500	RedLemon	Task <1E6958FA-DC85-4625-81E9-C77F243B7C33>.<328> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.213700-0500	RedLemon	Task <1E6958FA-DC85-4625-81E9-C77F243B7C33>.<328> now using Connection 3
default	15:40:12.214402-0500	RedLemon	0x7fe765baefb8 ID=372 Task <1E6958FA-DC85-4625-81E9-C77F243B7C33>.<328> sent request, body N 0
default	15:40:12.275194-0500	RedLemon	0x7fe765baefb8 ID=372 Task <1E6958FA-DC85-4625-81E9-C77F243B7C33>.<328> received response, status 200 content U
default	15:40:12.275598-0500	RedLemon	Task <1E6958FA-DC85-4625-81E9-C77F243B7C33>.<328> response ended
default	15:40:12.275865-0500	RedLemon	Task <1E6958FA-DC85-4625-81E9-C77F243B7C33>.<328> done using Connection 3
default	15:40:12.276014-0500	RedLemon	Task <1E6958FA-DC85-4625-81E9-C77F243B7C33>.<328> summary for task success {transaction_duration_ms=62, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=61, response_duration_ms=0, request_bytes=512, response_bytes=836, cache_hit=false}
default	15:40:12.276412-0500	RedLemon	Task <1E6958FA-DC85-4625-81E9-C77F243B7C33>.<328> finished successfully
default	15:40:12.277689-0500	RedLemon	📋 Found 2 participants in room DYVS
default	15:40:12.278023-0500	RedLemon	Task <21A859CE-E852-4DB3-99D3-A19343DE6D6A>.<329> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.278294-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [927C0D8C-29CA-41CA-A8C4-A4F1931504A4] (reporting strategy default)> on Task <21A859CE-E852-4DB3-99D3-A19343DE6D6A>.<329> was not selected for reporting
default	15:40:12.279031-0500	RedLemon	Task <21A859CE-E852-4DB3-99D3-A19343DE6D6A>.<329> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.279227-0500	RedLemon	Task <21A859CE-E852-4DB3-99D3-A19343DE6D6A>.<329> now using Connection 3
default	15:40:12.280551-0500	RedLemon	0x7fe7680a6168 ID=376 Task <21A859CE-E852-4DB3-99D3-A19343DE6D6A>.<329> sent request, body N 0
default	15:40:12.346003-0500	RedLemon	0x7fe7680a6168 ID=376 Task <21A859CE-E852-4DB3-99D3-A19343DE6D6A>.<329> received response, status 200 content U
default	15:40:12.346385-0500	RedLemon	Task <21A859CE-E852-4DB3-99D3-A19343DE6D6A>.<329> response ended
default	15:40:12.346654-0500	RedLemon	Task <21A859CE-E852-4DB3-99D3-A19343DE6D6A>.<329> done using Connection 3
default	15:40:12.346793-0500	RedLemon	Task <21A859CE-E852-4DB3-99D3-A19343DE6D6A>.<329> summary for task success {transaction_duration_ms=68, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=67, response_duration_ms=0, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:40:12.347157-0500	RedLemon	Task <21A859CE-E852-4DB3-99D3-A19343DE6D6A>.<329> finished successfully
default	15:40:12.348588-0500	RedLemon	   - ursinho (guest)
default	15:40:12.348938-0500	RedLemon	Task <2CB83A56-516D-453F-9D90-E60F58D2BBC1>.<330> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.349208-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5256E962-4F55-44C8-BB56-9CCFE3C45046] (reporting strategy default)> on Task <2CB83A56-516D-453F-9D90-E60F58D2BBC1>.<330> was not selected for reporting
default	15:40:12.349850-0500	RedLemon	Task <2CB83A56-516D-453F-9D90-E60F58D2BBC1>.<330> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.350061-0500	RedLemon	Task <2CB83A56-516D-453F-9D90-E60F58D2BBC1>.<330> now using Connection 3
default	15:40:12.350797-0500	RedLemon	0x7fe765baefb8 ID=380 Task <2CB83A56-516D-453F-9D90-E60F58D2BBC1>.<330> sent request, body N 0
default	15:40:12.364413-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:12.418315-0500	RedLemon	0x7fe765baefb8 ID=380 Task <2CB83A56-516D-453F-9D90-E60F58D2BBC1>.<330> received response, status 200 content U
default	15:40:12.419169-0500	RedLemon	Task <2CB83A56-516D-453F-9D90-E60F58D2BBC1>.<330> response ended
default	15:40:12.419848-0500	RedLemon	Task <2CB83A56-516D-453F-9D90-E60F58D2BBC1>.<330> done using Connection 3
default	15:40:12.420171-0500	RedLemon	Task <2CB83A56-516D-453F-9D90-E60F58D2BBC1>.<330> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=68, response_duration_ms=1, request_bytes=512, response_bytes=834, cache_hit=false}
default	15:40:12.420491-0500	RedLemon	Task <2CB83A56-516D-453F-9D90-E60F58D2BBC1>.<330> finished successfully
default	15:40:12.422580-0500	RedLemon	📋 Found 2 participants in room CTKZ
default	15:40:12.422960-0500	RedLemon	Task <3CC0F978-500C-4763-957B-F5113E7659DC>.<331> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.423432-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [099D66AB-52D8-4679-94A0-38C68C0D2C9B] (reporting strategy default)> on Task <3CC0F978-500C-4763-957B-F5113E7659DC>.<331> was not selected for reporting
default	15:40:12.424181-0500	RedLemon	Task <3CC0F978-500C-4763-957B-F5113E7659DC>.<331> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.424438-0500	RedLemon	Task <3CC0F978-500C-4763-957B-F5113E7659DC>.<331> now using Connection 3
default	15:40:12.425352-0500	RedLemon	0x7fe7680a6168 ID=384 Task <3CC0F978-500C-4763-957B-F5113E7659DC>.<331> sent request, body N 0
default	15:40:12.487016-0500	RedLemon	0x7fe7680a6168 ID=384 Task <3CC0F978-500C-4763-957B-F5113E7659DC>.<331> received response, status 200 content U
default	15:40:12.487879-0500	RedLemon	Task <3CC0F978-500C-4763-957B-F5113E7659DC>.<331> response ended
default	15:40:12.488163-0500	RedLemon	Task <3CC0F978-500C-4763-957B-F5113E7659DC>.<331> done using Connection 3
default	15:40:12.488326-0500	RedLemon	Task <3CC0F978-500C-4763-957B-F5113E7659DC>.<331> summary for task success {transaction_duration_ms=64, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=1, request_bytes=524, response_bytes=843, cache_hit=true}
default	15:40:12.488776-0500	RedLemon	Task <3CC0F978-500C-4763-957B-F5113E7659DC>.<331> finished successfully
default	15:40:12.490514-0500	RedLemon	   - ursinho (guest)
default	15:40:12.490935-0500	RedLemon	Task <D35F18D1-2449-4816-B521-C0BCC7AD813D>.<332> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.491552-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3359A321-3AC2-42EC-BFB6-76CA0C2ADE8D] (reporting strategy default)> on Task <D35F18D1-2449-4816-B521-C0BCC7AD813D>.<332> was not selected for reporting
default	15:40:12.492305-0500	RedLemon	Task <D35F18D1-2449-4816-B521-C0BCC7AD813D>.<332> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.492572-0500	RedLemon	Task <D35F18D1-2449-4816-B521-C0BCC7AD813D>.<332> now using Connection 3
default	15:40:12.493525-0500	RedLemon	0x7fe765baefb8 ID=388 Task <D35F18D1-2449-4816-B521-C0BCC7AD813D>.<332> sent request, body N 0
default	15:40:12.506596-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:12.558840-0500	RedLemon	0x7fe765baefb8 ID=388 Task <D35F18D1-2449-4816-B521-C0BCC7AD813D>.<332> received response, status 200 content U
default	15:40:12.560180-0500	RedLemon	Task <D35F18D1-2449-4816-B521-C0BCC7AD813D>.<332> response ended
default	15:40:12.560831-0500	RedLemon	Task <D35F18D1-2449-4816-B521-C0BCC7AD813D>.<332> done using Connection 3
default	15:40:12.561017-0500	RedLemon	Task <D35F18D1-2449-4816-B521-C0BCC7AD813D>.<332> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=66, response_duration_ms=2, request_bytes=511, response_bytes=787, cache_hit=false}
default	15:40:12.561228-0500	RedLemon	Task <D35F18D1-2449-4816-B521-C0BCC7AD813D>.<332> finished successfully
default	15:40:12.562211-0500	RedLemon	📋 Found 1 participants in room 3QYV
default	15:40:12.562571-0500	RedLemon	Task <CE6B4B75-604F-4F08-91EA-B3C433750688>.<333> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.562835-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [901F4F2C-8F53-4B3C-9D86-FB978FD51C4E] (reporting strategy default)> on Task <CE6B4B75-604F-4F08-91EA-B3C433750688>.<333> was not selected for reporting
default	15:40:12.563546-0500	RedLemon	Task <CE6B4B75-604F-4F08-91EA-B3C433750688>.<333> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.563838-0500	RedLemon	Task <CE6B4B75-604F-4F08-91EA-B3C433750688>.<333> now using Connection 3
default	15:40:12.565109-0500	RedLemon	0x7fe7680a6168 ID=392 Task <CE6B4B75-604F-4F08-91EA-B3C433750688>.<333> sent request, body N 0
default	15:40:12.579108-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:12.631737-0500	RedLemon	0x7fe7680a6168 ID=392 Task <CE6B4B75-604F-4F08-91EA-B3C433750688>.<333> received response, status 200 content U
default	15:40:12.632356-0500	RedLemon	Task <CE6B4B75-604F-4F08-91EA-B3C433750688>.<333> response ended
default	15:40:12.632873-0500	RedLemon	Task <CE6B4B75-604F-4F08-91EA-B3C433750688>.<333> done using Connection 3
default	15:40:12.633105-0500	RedLemon	Task <CE6B4B75-604F-4F08-91EA-B3C433750688>.<333> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=68, response_duration_ms=1, request_bytes=511, response_bytes=839, cache_hit=false}
default	15:40:12.634135-0500	RedLemon	Task <CE6B4B75-604F-4F08-91EA-B3C433750688>.<333> finished successfully
default	15:40:12.636023-0500	RedLemon	📋 Found 2 participants in room G7ML
default	15:40:12.636482-0500	RedLemon	Task <27144790-A278-4752-882A-E61009501AC2>.<334> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.636892-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [77A78354-95AC-431A-9544-FE68B820463E] (reporting strategy default)> on Task <27144790-A278-4752-882A-E61009501AC2>.<334> was not selected for reporting
default	15:40:12.637572-0500	RedLemon	Task <27144790-A278-4752-882A-E61009501AC2>.<334> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.637784-0500	RedLemon	Task <27144790-A278-4752-882A-E61009501AC2>.<334> now using Connection 3
default	15:40:12.638484-0500	RedLemon	0x7fe765baefb8 ID=396 Task <27144790-A278-4752-882A-E61009501AC2>.<334> sent request, body N 0
default	15:40:12.652070-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:12.706002-0500	RedLemon	0x7fe765baefb8 ID=396 Task <27144790-A278-4752-882A-E61009501AC2>.<334> received response, status 200 content U
default	15:40:12.706830-0500	RedLemon	Task <27144790-A278-4752-882A-E61009501AC2>.<334> response ended
default	15:40:12.707329-0500	RedLemon	Task <27144790-A278-4752-882A-E61009501AC2>.<334> done using Connection 3
default	15:40:12.707472-0500	RedLemon	Task <27144790-A278-4752-882A-E61009501AC2>.<334> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=68, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:40:12.707823-0500	RedLemon	Task <27144790-A278-4752-882A-E61009501AC2>.<334> finished successfully
default	15:40:12.709239-0500	RedLemon	   - lemontom (guest)
default	15:40:12.709587-0500	RedLemon	Task <F7543D45-2581-4A35-8DEB-25EA0DE1DCA9>.<335> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.709862-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [67CA5FFC-2312-4A63-A646-A3C1E519C65A] (reporting strategy default)> on Task <F7543D45-2581-4A35-8DEB-25EA0DE1DCA9>.<335> was not selected for reporting
default	15:40:12.710516-0500	RedLemon	Task <F7543D45-2581-4A35-8DEB-25EA0DE1DCA9>.<335> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.710714-0500	RedLemon	Task <F7543D45-2581-4A35-8DEB-25EA0DE1DCA9>.<335> now using Connection 3
default	15:40:12.711467-0500	RedLemon	0x7fe7680a6168 ID=400 Task <F7543D45-2581-4A35-8DEB-25EA0DE1DCA9>.<335> sent request, body N 0
default	15:40:12.717521-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:12.719131-0500	runningboardd	Invalidating assertion 166-4995-1722 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:12.769859-0500	RedLemon	0x7fe7680a6168 ID=400 Task <F7543D45-2581-4A35-8DEB-25EA0DE1DCA9>.<335> received response, status 200 content U
default	15:40:12.771121-0500	RedLemon	Task <F7543D45-2581-4A35-8DEB-25EA0DE1DCA9>.<335> response ended
default	15:40:12.771496-0500	RedLemon	Task <F7543D45-2581-4A35-8DEB-25EA0DE1DCA9>.<335> done using Connection 3
default	15:40:12.771646-0500	RedLemon	Task <F7543D45-2581-4A35-8DEB-25EA0DE1DCA9>.<335> summary for task success {transaction_duration_ms=61, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=59, response_duration_ms=2, request_bytes=518, response_bytes=801, cache_hit=false}
default	15:40:12.772036-0500	RedLemon	Task <F7543D45-2581-4A35-8DEB-25EA0DE1DCA9>.<335> finished successfully
default	15:40:12.772928-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1727 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:12.773011-0500	RedLemon	📋 Found 1 participants in room event_tt0167404
default	15:40:12.773422-0500	RedLemon	Task <9EA841C5-48C4-4618-B475-4068BA1C5023>.<336> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:12.773502-0500	runningboardd	Assertion 166-4995-1727 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:12.773813-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0EEFC732-1329-4907-B4CE-46427BFBBA7F] (reporting strategy default)> on Task <9EA841C5-48C4-4618-B475-4068BA1C5023>.<336> was not selected for reporting
default	15:40:12.774621-0500	RedLemon	Task <9EA841C5-48C4-4618-B475-4068BA1C5023>.<336> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:12.774951-0500	RedLemon	Task <9EA841C5-48C4-4618-B475-4068BA1C5023>.<336> now using Connection 3
default	15:40:12.776447-0500	RedLemon	0x7fe765ace9e8 ID=404 Task <9EA841C5-48C4-4618-B475-4068BA1C5023>.<336> sent request, body N 0
default	15:40:12.777021-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:12.777077-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:12.777124-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:12.777343-0500	runningboardd	Attempting to rename power assertion 33910 for target anon<RedLemon>(501) to anon<RedLemon>(501);166-4995-1722:com.apple.CFNetwork.StorageDB;166-4995-1727:com.apple.CFNetwork.StorageDB
default	15:40:12.779675-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:12.840425-0500	RedLemon	0x7fe765ace9e8 ID=404 Task <9EA841C5-48C4-4618-B475-4068BA1C5023>.<336> received response, status 200 content U
default	15:40:12.840971-0500	RedLemon	Task <9EA841C5-48C4-4618-B475-4068BA1C5023>.<336> response ended
default	15:40:12.841439-0500	RedLemon	Task <9EA841C5-48C4-4618-B475-4068BA1C5023>.<336> done using Connection 3
default	15:40:12.841661-0500	RedLemon	Task <9EA841C5-48C4-4618-B475-4068BA1C5023>.<336> summary for task success {transaction_duration_ms=67, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=65, response_duration_ms=1, request_bytes=521, response_bytes=804, cache_hit=false}
default	15:40:12.841869-0500	RedLemon	Task <9EA841C5-48C4-4618-B475-4068BA1C5023>.<336> finished successfully
default	15:40:12.842878-0500	RedLemon	📋 Found 1 participants in room tv_event_tt0903747
default	15:40:12.857593-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:12.865389-0500	runningboardd	Attempting to rename power assertion 33910 for target anon<RedLemon>(501) to anon<RedLemon>(501)166-4995-1727:com.apple.CFNetwork.StorageDB
default	15:40:12.866084-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:12.866162-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:12.866349-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:12.923784-0500	RedLemon	Task <86CFBD33-F33B-4ACD-87E5-5A85A75AD627>.<337> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:12.924031-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C90DA743-136B-4826-83DA-3B083C00BA01] (reporting strategy default)> on Task <86CFBD33-F33B-4ACD-87E5-5A85A75AD627>.<337> was not selected for reporting
default	15:40:12.925909-0500	RedLemon	Task <86CFBD33-F33B-4ACD-87E5-5A85A75AD627>.<337> summary for task success {transaction_duration_ms=1, response_status=200, cache_hit=true}
default	15:40:12.926007-0500	RedLemon	Task <86CFBD33-F33B-4ACD-87E5-5A85A75AD627>.<337> finished successfully
default	15:40:13.015507-0500	RedLemon	Task <6B7781E6-DD05-4FE2-8FD1-306ECFA78D96>.<338> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:13.015788-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2B4C7F77-9E22-4A3F-9132-AAB411F5D425] (reporting strategy default)> on Task <6B7781E6-DD05-4FE2-8FD1-306ECFA78D96>.<338> was not selected for reporting
default	15:40:13.016248-0500	RedLemon	Task <3CDFCC6E-8257-4AA8-A33F-03F4727ED848>.<339> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:13.016616-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [389D7655-90DD-4F86-8F76-0ED73CE69D40] (reporting strategy default)> on Task <3CDFCC6E-8257-4AA8-A33F-03F4727ED848>.<339> was not selected for reporting
default	15:40:13.017054-0500	RedLemon	Task <A730380C-C3C9-4F81-BD43-4E50D652DFDA>.<340> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:13.017406-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4A162703-2E09-4ECC-9D48-7483520E950F] (reporting strategy default)> on Task <A730380C-C3C9-4F81-BD43-4E50D652DFDA>.<340> was not selected for reporting
default	15:40:13.017873-0500	RedLemon	Task <FC3B596B-A548-4ECC-9EF2-D6D1987E04B9>.<341> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:13.018404-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6132D576-2C04-4810-ACCE-B07C6B6EE8F4] (reporting strategy default)> on Task <FC3B596B-A548-4ECC-9EF2-D6D1987E04B9>.<341> was not selected for reporting
default	15:40:13.019036-0500	RedLemon	Task <6B7781E6-DD05-4FE2-8FD1-306ECFA78D96>.<338> summary for task success {transaction_duration_ms=3, response_status=200, cache_hit=true}
default	15:40:13.019129-0500	RedLemon	Task <6B7781E6-DD05-4FE2-8FD1-306ECFA78D96>.<338> finished successfully
default	15:40:13.020382-0500	RedLemon	Task <3CDFCC6E-8257-4AA8-A33F-03F4727ED848>.<339> summary for task success {transaction_duration_ms=3, response_status=200, cache_hit=true}
default	15:40:13.020482-0500	RedLemon	Task <3CDFCC6E-8257-4AA8-A33F-03F4727ED848>.<339> finished successfully
default	15:40:13.020899-0500	RedLemon	Task <A730380C-C3C9-4F81-BD43-4E50D652DFDA>.<340> summary for task success {transaction_duration_ms=2, response_status=200, cache_hit=true}
default	15:40:13.021029-0500	RedLemon	Task <A730380C-C3C9-4F81-BD43-4E50D652DFDA>.<340> finished successfully
default	15:40:13.021162-0500	RedLemon	Task <FC3B596B-A548-4ECC-9EF2-D6D1987E04B9>.<341> summary for task success {transaction_duration_ms=2, response_status=200, cache_hit=true}
default	15:40:13.021507-0500	RedLemon	Task <FC3B596B-A548-4ECC-9EF2-D6D1987E04B9>.<341> finished successfully
default	15:40:13.065404-0500	RedLemon	Task <67A25769-D4B2-493A-942F-4BD04BC051A7>.<5> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	15:40:13.065404-0500	RedLemon	Task <3D38FCD5-982E-4B20-BC0F-A4AE927E05F0>.<4> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	15:40:13.066308-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0500EF4F-A760-45FE-8524-F5B6A8DDE064] (reporting strategy default)> on Task <67A25769-D4B2-493A-942F-4BD04BC051A7>.<5> was not selected for reporting
default	15:40:13.066698-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [612AE64A-6F5C-4760-BC48-AFE130B3048E] (reporting strategy default)> on Task <3D38FCD5-982E-4B20-BC0F-A4AE927E05F0>.<4> was not selected for reporting
default	15:40:13.067994-0500	RedLemon	Connection 32: starting, TC(0x0)
default	15:40:13.068059-0500	RedLemon	[C32 A11A9DDF-FE08-4B01-8CD6-81C05F4620D6 127.0.0.1:47253 tcp, url hash: d897201a, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{DF8E6062-D3DA-43A8-BF32-E11E22AF5862}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:13.068216-0500	RedLemon	[C32 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	15:40:13.068476-0500	RedLemon	[C32 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), interface: lo0)] event: path:satisfied @0.000s, uuid: AD76D507-3445-47B8-850C-D1E6E20A7DF1
default	15:40:13.069716-0500	RedLemon	[C32 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), interface: lo0)] event: flow:start_connect @0.001s
default	15:40:13.069757-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C32] reporting state preparing
default	15:40:13.070084-0500	RedLemon	Task <67A25769-D4B2-493A-942F-4BD04BC051A7>.<5> setting up Connection 32
default	15:40:13.070470-0500	RedLemon	Connection 33: starting, TC(0x0)
default	15:40:13.070538-0500	RedLemon	[C33 EAB48B23-C40A-427A-8E58-BEAFECA777A4 127.0.0.1:47253 tcp, url hash: d897201a, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{DF8E6062-D3DA-43A8-BF32-E11E22AF5862}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:13.070621-0500	RedLemon	[C33 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	15:40:13.070905-0500	RedLemon	[C33 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.000s, uuid: AD76D507-3445-47B8-850C-D1E6E20A7DF1
default	15:40:13.072424-0500	RedLemon	[C33 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.001s
default	15:40:13.072529-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C33] reporting state preparing
default	15:40:13.072815-0500	RedLemon	Task <3D38FCD5-982E-4B20-BC0F-A4AE927E05F0>.<4> setting up Connection 33
default	15:40:13.074552-0500	RedLemon	nw_socket_handle_socket_event [C32:2] Socket received CONNECTED event
default	15:40:13.074763-0500	RedLemon	nw_flow_connected [C32 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	15:40:13.075099-0500	RedLemon	[C32 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.006s
default	15:40:13.075700-0500	RedLemon	nw_flow_connected [C32 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:13.076069-0500	RedLemon	[C32 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.007s
default	15:40:13.076370-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C32] reporting state ready
default	15:40:13.076648-0500	RedLemon	[C32 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.008s
default	15:40:13.076719-0500	RedLemon	Connection 32: connected successfully
default	15:40:13.076801-0500	RedLemon	Connection 32: ready C(N) E(N)
default	15:40:13.076946-0500	RedLemon	Task <67A25769-D4B2-493A-942F-4BD04BC051A7>.<5> now using Connection 32
default	15:40:13.077039-0500	RedLemon	Connection 32: received viability advisory(Y)
default	15:40:13.077317-0500	RedLemon	Task <67A25769-D4B2-493A-942F-4BD04BC051A7>.<5> sent request, body N 0
default	15:40:13.077480-0500	RedLemon	nw_socket_handle_socket_event [C33:2] Socket received CONNECTED event
default	15:40:13.077693-0500	RedLemon	nw_flow_connected [C33 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	15:40:13.077780-0500	RedLemon	[C33 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.007s
default	15:40:13.077867-0500	RedLemon	nw_flow_connected [C33 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:13.078052-0500	RedLemon	[C33 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.007s
default	15:40:13.078229-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C33] reporting state ready
default	15:40:13.078435-0500	RedLemon	[C33 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.007s
default	15:40:13.078546-0500	RedLemon	Connection 33: connected successfully
default	15:40:13.078641-0500	RedLemon	Connection 33: ready C(N) E(N)
default	15:40:13.078826-0500	RedLemon	Task <3D38FCD5-982E-4B20-BC0F-A4AE927E05F0>.<4> now using Connection 33
default	15:40:13.079021-0500	RedLemon	Connection 33: received viability advisory(Y)
default	15:40:13.079360-0500	RedLemon	Task <3D38FCD5-982E-4B20-BC0F-A4AE927E05F0>.<4> sent request, body N 0
default	15:40:13.080017-0500	mDNSResponder	[R1210] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'C0GfvWP01hqgkphZQU0SPg=='>, Addr) START PID[4995](RedLemon)
default	15:40:13.081022-0500	mDNSResponder	[R1211] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'C0GfvWP01hqgkphZQU0SPg=='>, AAAA) START PID[4995](RedLemon)
default	15:40:13.082576-0500	mDNSResponder	[R1212] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'C0GfvWP01hqgkphZQU0SPg=='>, Addr) START PID[4995](RedLemon)
default	15:40:13.083220-0500	mDNSResponder	[R1213] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'C0GfvWP01hqgkphZQU0SPg=='>, AAAA) START PID[4995](RedLemon)
default	15:40:13.104104-0500	mDNSResponder	[R1212] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'yqG0QqTRy0lWD6GQKAfmMg=='>, Addr) STOP PID[4995](RedLemon)
default	15:40:13.104387-0500	mDNSResponder	[R1213] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'yqG0QqTRy0lWD6GQKAfmMg=='>, AAAA) STOP PID[4995](RedLemon)
default	15:40:13.104773-0500	mDNSResponder	[R1210] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'yqG0QqTRy0lWD6GQKAfmMg=='>, Addr) STOP PID[4995](RedLemon)
default	15:40:13.104911-0500	mDNSResponder	[R1211] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'yqG0QqTRy0lWD6GQKAfmMg=='>, AAAA) STOP PID[4995](RedLemon)
default	15:40:13.218112-0500	RedLemon	Task <67A25769-D4B2-493A-942F-4BD04BC051A7>.<5> received response, status 200 content K
default	15:40:13.218386-0500	RedLemon	Task <67A25769-D4B2-493A-942F-4BD04BC051A7>.<5> response ended
default	15:40:13.218457-0500	RedLemon	Task <67A25769-D4B2-493A-942F-4BD04BC051A7>.<5> done using Connection 32
default	15:40:13.218624-0500	RedLemon	Task <67A25769-D4B2-493A-942F-4BD04BC051A7>.<5> summary for task success {transaction_duration_ms=151, response_status=200, connection=32, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=6, secure_connection_duration_ms=0, private_relay=false, request_start_ms=10, request_duration_ms=0, response_start_ms=151, response_duration_ms=0, request_bytes=244, response_bytes=3061, cache_hit=false}
default	15:40:13.218900-0500	RedLemon	Task <67A25769-D4B2-493A-942F-4BD04BC051A7>.<5> finished successfully
default	15:40:13.219038-0500	RedLemon	📡 Raw metadata response length: 2959 bytes
default	15:40:13.219191-0500	RedLemon	✅ Raw response CONTAINS 'videos' field
default	15:40:13.219971-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: 0
default	15:40:13.220592-0500	RedLemon	Task <3D38FCD5-982E-4B20-BC0F-A4AE927E05F0>.<4> received response, status 200 content K
default	15:40:13.221134-0500	RedLemon	Task <3D38FCD5-982E-4B20-BC0F-A4AE927E05F0>.<4> response ended
default	15:40:13.221190-0500	RedLemon	Task <3D38FCD5-982E-4B20-BC0F-A4AE927E05F0>.<4> done using Connection 33
default	15:40:13.221287-0500	RedLemon	Task <3D38FCD5-982E-4B20-BC0F-A4AE927E05F0>.<4> summary for task success {transaction_duration_ms=154, response_status=200, connection=33, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=6, secure_connection_duration_ms=0, private_relay=false, request_start_ms=12, request_duration_ms=0, response_start_ms=153, response_duration_ms=0, request_bytes=244, response_bytes=3061, cache_hit=false}
default	15:40:13.221497-0500	RedLemon	Task <3D38FCD5-982E-4B20-BC0F-A4AE927E05F0>.<4> finished successfully
default	15:40:13.221620-0500	RedLemon	📡 Raw metadata response length: 2959 bytes
default	15:40:13.221775-0500	RedLemon	✅ Raw response CONTAINS 'videos' field
default	15:40:13.222373-0500	RedLemon	📦 Decoded CinemetaMeta - videos count: 0
default	15:40:13.276148-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:13.276536-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [339EAC57-5384-4E7D-96EA-BE52EB318FE4] (reporting strategy default)> on Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> was not selected for reporting
default	15:40:13.277229-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:13.277530-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	15:40:13.277935-0500	RedLemon	Connection 34: enabling TLS
default	15:40:13.277965-0500	RedLemon	Connection 34: starting, TC(0x0)
default	15:40:13.278007-0500	RedLemon	[C34 FE779C47-BBD6-489A-9BAC-68B59CB2E7C4 Hostname#80ea675c:443 quic-connection, url hash: 7ed9a4ad, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{1435407D-6715-4454-9491-992EFDB80106}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:13.278080-0500	RedLemon	[C34 Hostname#80ea675c:443 initial path ((null))] event: path:start @0.000s
default	15:40:13.278367-0500	RedLemon	[C34 Hostname#80ea675c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: F7A5F531-3E8D-4703-863E-CFA7604578E1
default	15:40:13.278554-0500	RedLemon	[C34 Hostname#80ea675c:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	15:40:13.278624-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C34] reporting state preparing
default	15:40:13.282834-0500	RedLemon	[C34.1 Hostname#80ea675c:443 initial path ((null))] event: path:start @0.004s
default	15:40:13.283392-0500	RedLemon	[C34.1 Hostname#80ea675c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.005s, uuid: E2F33171-E2B6-4E45-8D28-23EBC2F97FF6
default	15:40:13.283668-0500	RedLemon	[C34.1 Hostname#80ea675c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.005s
default	15:40:13.283860-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> setting up Connection 34
default	15:40:13.283951-0500	mDNSResponder	[R1214] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'zlPy1f3ZueoTFr97yod54g=='>, options: 0x8 {use-failover}, client pid: 4995 (RedLemon)
default	15:40:13.334636-0500	RedLemon	nw_endpoint_resolver_update [C34.1 Hostname#80ea675c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#0ba69465.443
default	15:40:13.334796-0500	RedLemon	nw_endpoint_resolver_update [C34.1 Hostname#80ea675c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#220602f8:443
default	15:40:13.334999-0500	RedLemon	[C34.1 Hostname#80ea675c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.056s
default	15:40:13.335259-0500	RedLemon	[C34.1.1 IPv6#0ba69465.443 initial path ((null))] event: path:start @0.057s
default	15:40:13.336081-0500	RedLemon	[C34.1.1 IPv6#0ba69465.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.058s, uuid: D1F6FFC4-E6D9-4BA6-8C8A-2E585BC1104A
default	15:40:13.336301-0500	RedLemon	[C34.1.1 IPv6#0ba69465.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.058s
default	15:40:13.337024-0500	RedLemon	[C34.1.1 IPv6#0ba69465.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.058s
default	15:40:13.338536-0500	RedLemon	[C34.1.1 IPv6#0ba69465.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.060s
default	15:40:13.338784-0500	RedLemon	tcp_output [C34.1.1:3] flags=[S] seq=2165033265, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2165033265
default	15:40:13.339744-0500	RedLemon	nw_endpoint_resolver_update [C34.1 Hostname#80ea675c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#220602f8:443
default	15:40:13.339999-0500	RedLemon	[C34.1 Hostname#80ea675c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.061s
default	15:40:13.352039-0500	RedLemon	tcp_input [C34.1.1:3] flags=[S.] seq=3102528281, ack=2165033266, win=31416 state=SYN_SENT rcv_nxt=0, snd_una=2165033265
default	15:40:13.352197-0500	RedLemon	nw_flow_connected [C34.1.1 IPv6#0ba69465.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:13.352396-0500	RedLemon	[C34.1.1 IPv6#0ba69465.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.074s
default	15:40:13.352511-0500	RedLemon	[C34.1 Hostname#80ea675c:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.074s
default	15:40:13.352561-0500	RedLemon	[C34 Hostname#80ea675c:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.074s
default	15:40:13.352962-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C34.1.1:2][0x7fe7680fadc0] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:40:13.353230-0500	RedLemon	boringssl_context_info_handler(2028) [C34.1.1:2][0x7fe7680fadc0] Client handshake started
default	15:40:13.353425-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS client enter_early_data
default	15:40:13.353560-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS client read_server_hello
default	15:40:13.377485-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:40:13.377621-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client read_server_hello
default	15:40:13.378209-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:40:13.378804-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client read_certificate_request
default	15:40:13.379853-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client read_server_certificate
default	15:40:13.379952-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:40:13.380506-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C34.1.1:2][0x7fe7680fadc0] Performing external trust evaluation
default	15:40:13.380649-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C34.1.1:2][0x7fe7680fadc0] Asyncing for external verify block
default	15:40:13.380815-0500	RedLemon	Connection 34: asked to evaluate TLS Trust
default	15:40:13.381099-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> auth completion disp=1 cred=0x0
default	15:40:13.386590-0500	RedLemon	Connection 34: TLS Trust result 0
default	15:40:13.386661-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C34.1.1:2][0x7fe7680fadc0] Returning from external verify block with result: true
default	15:40:13.386780-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C34.1.1:2][0x7fe7680fadc0] Certificate verification result: OK
default	15:40:13.387099-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client read_server_finished
default	15:40:13.387356-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:40:13.387397-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:40:13.387433-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client send_client_certificate
default	15:40:13.387466-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client complete_second_flight
default	15:40:13.387598-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS 1.3 client done
default	15:40:13.387828-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS client finish_client_handshake
default	15:40:13.387922-0500	RedLemon	boringssl_context_info_handler(2045) [C34.1.1:2][0x7fe7680fadc0] Client handshake state: TLS client done
default	15:40:13.387968-0500	RedLemon	boringssl_context_info_handler(2034) [C34.1.1:2][0x7fe7680fadc0] Client handshake done
default	15:40:13.388592-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C34.1.1:2][0x7fe7680fadc0] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0403) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(35ms) flight_time(25ms) rtt(24ms) write_stalls(0) read_stalls(7)]
default	15:40:13.388751-0500	RedLemon	nw_flow_connected [C34.1.1 IPv6#0ba69465.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:13.389147-0500	RedLemon	[C34.1.1 IPv6#0ba69465.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.111s
default	15:40:13.389302-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C34] reporting state ready
default	15:40:13.389437-0500	RedLemon	[C34.1 Hostname#80ea675c:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.111s
default	15:40:13.389492-0500	RedLemon	[C34 Hostname#80ea675c:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.111s
default	15:40:13.389678-0500	RedLemon	[C34.1.1 IPv6#0ba69465.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.111s
default	15:40:13.389806-0500	RedLemon	[C34.1 Hostname#80ea675c:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.111s
default	15:40:13.389862-0500	RedLemon	[C34 Hostname#80ea675c:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.111s
default	15:40:13.389992-0500	RedLemon	Connection 34: connected successfully
default	15:40:13.390033-0500	RedLemon	Connection 34: TLS handshake complete
default	15:40:13.390221-0500	RedLemon	Connection 34: ready C(N) E(N)
default	15:40:13.390517-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> now using Connection 34
default	15:40:13.390588-0500	RedLemon	Connection 34: received viability advisory(Y)
default	15:40:13.390671-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> sent request, body N 0
default	15:40:13.422578-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> received response, status 200 content K
default	15:40:13.432949-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> done using Connection 34
default	15:40:13.433110-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> response ended
default	15:40:13.433568-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> summary for task success {transaction_duration_ms=156, response_status=200, connection=34, protocol="h2", domain_lookup_duration_ms=51, connect_duration_ms=51, secure_connection_duration_ms=35, private_relay=false, request_start_ms=113, request_duration_ms=0, response_start_ms=145, response_duration_ms=10, request_bytes=124, response_bytes=42034, cache_hit=false}
default	15:40:13.433667-0500	RedLemon	Task <48208AD2-B014-4B41-B156-34E4AB863EBA>.<342> finished successfully
default	15:40:13.446451-0500	mDNSResponder	[R1214] getaddrinfo stop -- hostname: <mask.hash: 'zlPy1f3ZueoTFr97yod54g=='>, client pid: 4995 (RedLemon)
default	15:40:13.869764-0500	runningboardd	Invalidating assertion 166-4995-1727 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:14.035083-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:14.035160-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:14.035257-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:14.037262-0500	runningboardd	Invalidating assertion 166-103-1716 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.powerd>:103]
default	15:40:14.205477-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:14.205565-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:14.205641-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:14.533698-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:14.534054-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [49C88CBF-2058-4E4A-848A-A14B98F9B3B2] (reporting strategy default)> on Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> was not selected for reporting
default	15:40:14.534435-0500	RedLemon	Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> summary for task success {transaction_duration_ms=5098, response_status=101, connection=31, protocol="http/1.1", domain_lookup_duration_ms=27, connect_duration_ms=64, secure_connection_duration_ms=42, private_relay=false, request_start_ms=107, request_duration_ms=0, response_start_ms=212, response_duration_ms=0, request_bytes=828, response_bytes=850, cache_hit=false}
default	15:40:14.534414-0500	RedLemon	Task <1F605509-12A2-4E49-BAAD-14783F408346>.<343> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:14.534663-0500	RedLemon	Task <BF9A32DB-1FF3-49C1-9107-DAB6F0BF537A>.<1> finished successfully
default	15:40:14.534722-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:14.535378-0500	RedLemon	Connection 31: cleaning up
default	15:40:14.535598-0500	RedLemon	[C31 44EB64EB-91FA-45BA-9258-2359CB2690B9 Hostname#cb87f9a4:443 tcp, url hash: 16c5b4e0, tls, definite, attribution: developer] cancel
default	15:40:14.535795-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B3D6324C-EDD6-4AC4-B98C-6E804F0FC7DF] (reporting strategy default)> on Task <1F605509-12A2-4E49-BAAD-14783F408346>.<343> was not selected for reporting
default	15:40:14.535953-0500	RedLemon	[C31 44EB64EB-91FA-45BA-9258-2359CB2690B9 Hostname#cb87f9a4:443 tcp, url hash: 16c5b4e0, tls, definite, attribution: developer] cancelled
	[C31.1 E7F952C7-0637-4DF0-8476-258DEB269ADE 10.0.0.113:57889<->IPv4#adac733c:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 5.091s, DNS @0.001s took 0.027s, TCP @0.206s took 0.020s, TLS 1.3 took 0.005s
	bytes in/out: 5122/1734, packets in/out: 8/11, rtt: 0.027s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:40:14.540270-0500	RedLemon	nw_flow_disconnected [C31.1 IPv4#adac733c:443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:40:14.540544-0500	RedLemon	Task <43061C2C-84FE-4A26-BB2C-5CA01C5813EF>.<344> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:14.540901-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [2B8F4985-AE4A-49F2-9208-0C60F7678F7B] (reporting strategy default)> on Task <43061C2C-84FE-4A26-BB2C-5CA01C5813EF>.<344> was not selected for reporting
default	15:40:14.541224-0500	RedLemon	nw_protocol_tcp_log_summary [C31.1:3] 
	[C5477CF8-7238-4D62-BAA1-9C68A1125917 <private>:57889<-><private>:443]
	Init: 1, Conn_Time: 18.940ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 27.562ms, rtt_var: 9.312ms rtt_nc: 22.375ms, rtt_var_nc: 10.312ms base rtt: 11ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:40:14.541424-0500	RedLemon	Task <965564DA-5AFF-4A51-B369-A74B662162F7>.<345> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:14.542082-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E1B5C238-3568-4817-B33C-318D78F767CE] (reporting strategy default)> on Task <965564DA-5AFF-4A51-B369-A74B662162F7>.<345> was not selected for reporting
default	15:40:14.542689-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C31] reporting state cancelled
default	15:40:14.542917-0500	RedLemon	Task <1F605509-12A2-4E49-BAAD-14783F408346>.<343> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:14.543200-0500	RedLemon	Task <1F605509-12A2-4E49-BAAD-14783F408346>.<343> now using Connection 3
default	15:40:14.544322-0500	RedLemon	Task <43061C2C-84FE-4A26-BB2C-5CA01C5813EF>.<344> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:14.544562-0500	RedLemon	Task <43061C2C-84FE-4A26-BB2C-5CA01C5813EF>.<344> now using Connection 34
default	15:40:14.544806-0500	RedLemon	Task <965564DA-5AFF-4A51-B369-A74B662162F7>.<345> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:14.544986-0500	RedLemon	Task <965564DA-5AFF-4A51-B369-A74B662162F7>.<345> now using Connection 34
default	15:40:14.545661-0500	RedLemon	tcp_output [C31.1:3] flags=[F.] seq=1082763189, ack=1282196367, win=2048 state=FIN_WAIT_1 rcv_nxt=1282196367, snd_una=1082763135
default	15:40:14.546206-0500	RedLemon	Connection 31: done
default	15:40:14.546514-0500	RedLemon	Task <43061C2C-84FE-4A26-BB2C-5CA01C5813EF>.<344> sent request, body N 0
default	15:40:14.546566-0500	RedLemon	Task <965564DA-5AFF-4A51-B369-A74B662162F7>.<345> sent request, body N 0
default	15:40:14.547079-0500	RedLemon	Connection 35: enabling TLS
default	15:40:14.547163-0500	RedLemon	Connection 35: starting, TC(0x0)
error	15:40:14.548825-0500	RedLemon	Read completed with an error <private>
default	15:40:14.547211-0500	RedLemon	[C35 AA8C9F64-3D11-49D8-8F30-7CABE5E5A8FB Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{3BD6871A-E5C5-4568-B741-4F20FDE5359E}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:14.549069-0500	RedLemon	[C35 Hostname#4638943b:443 initial path ((null))] event: path:start @0.000s
default	15:40:14.549537-0500	RedLemon	[C35 Hostname#4638943b:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 352CAF6E-DF75-4FE6-A64E-44F68649D268
default	15:40:14.550637-0500	mDNSResponder	[R1215] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 4995 (RedLemon)
default	15:40:14.549778-0500	RedLemon	[C35 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:40:14.549823-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C35] reporting state preparing
default	15:40:14.550024-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> setting up Connection 35
default	15:40:14.556840-0500	RedLemon	0x7fe7694c7368 ID=408 Task <1F605509-12A2-4E49-BAAD-14783F408346>.<343> sent request, body S 83
default	15:40:14.557259-0500	RedLemon	tcp_input [C31.1:3] flags=[F.] seq=1282196367, ack=1082763189, win=16 state=FIN_WAIT_1 rcv_nxt=1282196367, snd_una=1082763189
default	15:40:14.557925-0500	RedLemon	tcp_output [C31.1:3] flags=[F.] seq=1082763189, ack=1282196368, win=2048 state=CLOSING rcv_nxt=1282196368, snd_una=1082763189
default	15:40:14.560841-0500	RedLemon	Task <43061C2C-84FE-4A26-BB2C-5CA01C5813EF>.<344> received response, status 200 content K
default	15:40:14.563051-0500	RedLemon	Task <965564DA-5AFF-4A51-B369-A74B662162F7>.<345> received response, status 200 content K
default	15:40:14.573595-0500	RedLemon	Task <965564DA-5AFF-4A51-B369-A74B662162F7>.<345> done using Connection 34
default	15:40:14.573785-0500	RedLemon	Task <965564DA-5AFF-4A51-B369-A74B662162F7>.<345> response ended
default	15:40:14.574295-0500	RedLemon	Task <965564DA-5AFF-4A51-B369-A74B662162F7>.<345> summary for task success {transaction_duration_ms=31, response_status=200, connection=34, reused=1, request_start_ms=3, request_duration_ms=0, response_start_ms=20, response_duration_ms=10, request_bytes=36, response_bytes=63210, cache_hit=false}
default	15:40:14.574388-0500	RedLemon	Task <965564DA-5AFF-4A51-B369-A74B662162F7>.<345> finished successfully
default	15:40:14.586417-0500	RedLemon	Task <43061C2C-84FE-4A26-BB2C-5CA01C5813EF>.<344> done using Connection 34
default	15:40:14.586529-0500	RedLemon	Task <43061C2C-84FE-4A26-BB2C-5CA01C5813EF>.<344> response ended
default	15:40:14.587090-0500	RedLemon	Task <43061C2C-84FE-4A26-BB2C-5CA01C5813EF>.<344> summary for task success {transaction_duration_ms=45, response_status=200, connection=34, reused=1, request_start_ms=5, request_duration_ms=0, response_start_ms=19, response_duration_ms=25, request_bytes=41, response_bytes=118254, cache_hit=false}
default	15:40:14.587177-0500	RedLemon	Task <43061C2C-84FE-4A26-BB2C-5CA01C5813EF>.<344> finished successfully
default	15:40:14.592279-0500	mDNSResponder	[R1215] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 4995 (RedLemon)
default	15:40:14.592500-0500	RedLemon	nw_endpoint_resolver_update [C35 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#880cfe6d:443
default	15:40:14.592606-0500	RedLemon	[C35 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.043s
default	15:40:14.592925-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 initial path ((null))] event: path:start @0.043s
default	15:40:14.593560-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.044s, uuid: 3980E058-0F78-4ACC-A5E8-2F4B1833BFA3
default	15:40:14.593687-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.044s
default	15:40:14.594347-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.045s
default	15:40:14.595302-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.046s
default	15:40:14.595510-0500	RedLemon	tcp_output [C35.1:3] flags=[S] seq=1472744239, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1472744239
default	15:40:14.622234-0500	RedLemon	0x7fe7694c7368 ID=408 Task <1F605509-12A2-4E49-BAAD-14783F408346>.<343> received response, status 201 content U
default	15:40:14.622821-0500	RedLemon	Task <1F605509-12A2-4E49-BAAD-14783F408346>.<343> response ended
default	15:40:14.623318-0500	RedLemon	Task <1F605509-12A2-4E49-BAAD-14783F408346>.<343> done using Connection 3
default	15:40:14.623459-0500	RedLemon	Task <1F605509-12A2-4E49-BAAD-14783F408346>.<343> summary for task success {transaction_duration_ms=87, response_status=201, connection=3, reused=1, request_start_ms=6, request_duration_ms=13, response_start_ms=85, response_duration_ms=1, request_bytes=496, response_bytes=776, cache_hit=false}
default	15:40:14.624037-0500	RedLemon	Task <1F605509-12A2-4E49-BAAD-14783F408346>.<343> finished successfully
default	15:40:14.624413-0500	RedLemon	✅ Guest joined room ABRD in database
default	15:40:14.625170-0500	RedLemon	Task <8C580944-B9FD-4E11-99E4-9A6F24BB8F78>.<2> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:14.625750-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E540A393-A30B-453E-8CB2-571048CA144E] (reporting strategy default)> on Task <8C580944-B9FD-4E11-99E4-9A6F24BB8F78>.<2> was not selected for reporting
default	15:40:14.626965-0500	RedLemon	Connection 36: enabling TLS
default	15:40:14.627024-0500	RedLemon	Connection 36: starting, TC(0x0)
default	15:40:14.627085-0500	RedLemon	[C36 0ABCF39B-89D9-4046-B4FB-060B31D4BBE7 Hostname#cb87f9a4:443 tcp, url hash: 16c5b4e0, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{377E83B1-2C1E-4A4F-AA52-E382E95ABC97}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:14.627279-0500	RedLemon	[C36 Hostname#cb87f9a4:443 initial path ((null))] event: path:start @0.000s
default	15:40:14.627808-0500	RedLemon	[C36 Hostname#cb87f9a4:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 10FD4A79-558D-40DF-8E18-90A82E9D0F76
default	15:40:14.628091-0500	RedLemon	[C36 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:40:14.628139-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C36] reporting state preparing
default	15:40:14.629175-0500	RedLemon	Task <8C580944-B9FD-4E11-99E4-9A6F24BB8F78>.<2> setting up Connection 36
default	15:40:14.628583-0500	mDNSResponder	[R1216] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'UKEj+SxGrd32X1Y1OFZKQw=='>, options: 0x8 {use-failover}, client pid: 4995 (RedLemon)
default	15:40:14.646629-0500	mDNSResponder	[R1216] getaddrinfo stop -- hostname: <mask.hash: 'UKEj+SxGrd32X1Y1OFZKQw=='>, client pid: 4995 (RedLemon)
default	15:40:14.646801-0500	RedLemon	nw_endpoint_resolver_update [C36 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#adac733c:443
default	15:40:14.647032-0500	RedLemon	nw_endpoint_resolver_update [C36 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#60c5f8f1:443
default	15:40:14.647166-0500	RedLemon	[C36 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.020s
default	15:40:14.647422-0500	RedLemon	[C36.1 IPv4#adac733c:443 initial path ((null))] event: path:start @0.020s
default	15:40:14.647855-0500	RedLemon	[C36.1 IPv4#adac733c:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.020s, uuid: F3FB63AB-C3FF-42B2-95B4-2571A4ACB7D7
default	15:40:14.647979-0500	RedLemon	[C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.020s
default	15:40:14.648515-0500	RedLemon	[C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.021s
default	15:40:14.649147-0500	RedLemon	[C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.021s
default	15:40:14.649401-0500	RedLemon	tcp_output [C36.1:3] flags=[S] seq=3679160940, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3679160940
default	15:40:14.662441-0500	RedLemon	tcp_input [C36.1:3] flags=[S.] seq=1292939893, ack=3679160941, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3679160940
default	15:40:14.662606-0500	RedLemon	nw_flow_connected [C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:14.662795-0500	RedLemon	[C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.035s
default	15:40:14.663018-0500	RedLemon	[C36 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.035s
default	15:40:14.663753-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C36.1:2][0x7fe768369440] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:40:14.664154-0500	RedLemon	boringssl_context_info_handler(2028) [C36.1:2][0x7fe768369440] Client handshake started
default	15:40:14.664370-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS client enter_early_data
default	15:40:14.664570-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS client read_server_hello
default	15:40:14.665772-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:14.685745-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:40:14.685873-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client read_server_hello
default	15:40:14.686419-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:40:14.687716-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client read_certificate_request
default	15:40:14.687863-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client read_server_certificate
default	15:40:14.687980-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:40:14.688476-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C36.1:2][0x7fe768369440] Performing external trust evaluation
default	15:40:14.688671-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C36.1:2][0x7fe768369440] Asyncing for external verify block
default	15:40:14.688846-0500	RedLemon	Connection 36: asked to evaluate TLS Trust
default	15:40:14.689137-0500	RedLemon	Task <8C580944-B9FD-4E11-99E4-9A6F24BB8F78>.<2> auth completion disp=1 cred=0x0
default	15:40:14.695543-0500	RedLemon	Connection 36: TLS Trust result 0
default	15:40:14.695590-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C36.1:2][0x7fe768369440] Returning from external verify block with result: true
default	15:40:14.695641-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C36.1:2][0x7fe768369440] Certificate verification result: OK
default	15:40:14.695950-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client read_server_finished
default	15:40:14.696026-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:40:14.696044-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:40:14.696063-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client send_client_certificate
default	15:40:14.696082-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client complete_second_flight
default	15:40:14.696151-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS 1.3 client done
default	15:40:14.696310-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS client finish_client_handshake
default	15:40:14.696355-0500	RedLemon	boringssl_context_info_handler(2045) [C36.1:2][0x7fe768369440] Client handshake state: TLS client done
default	15:40:14.696388-0500	RedLemon	boringssl_context_info_handler(2034) [C36.1:2][0x7fe768369440] Client handshake done
default	15:40:14.696988-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C36.1:2][0x7fe768369440] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(1) sct_received(0) connect_time(32ms) flight_time(23ms) rtt(21ms) write_stalls(0) read_stalls(7)]
default	15:40:14.697144-0500	RedLemon	nw_flow_connected [C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:14.697395-0500	RedLemon	[C36.1 IPv4#adac733c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.070s
default	15:40:14.697626-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C36] reporting state ready
default	15:40:14.697743-0500	RedLemon	[C36 Hostname#cb87f9a4:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.070s
default	15:40:14.697860-0500	RedLemon	[C36.1 IPv4#adac733c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.070s
default	15:40:14.697921-0500	RedLemon	[C36 Hostname#cb87f9a4:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.070s
default	15:40:14.698066-0500	RedLemon	Connection 36: connected successfully
default	15:40:14.698117-0500	RedLemon	Connection 36: TLS handshake complete
default	15:40:14.698384-0500	RedLemon	Connection 36: ready C(N) E(N)
default	15:40:14.698590-0500	RedLemon	Task <8C580944-B9FD-4E11-99E4-9A6F24BB8F78>.<2> now using Connection 36
default	15:40:14.698662-0500	RedLemon	Connection 36: received viability advisory(Y)
default	15:40:14.698849-0500	RedLemon	Task <8C580944-B9FD-4E11-99E4-9A6F24BB8F78>.<2> sent request, body N 0
default	15:40:14.714095-0500	RedLemon	tcp_input [C35.1:3] flags=[S.] seq=598693378, ack=1472744240, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=1472744239
default	15:40:14.714318-0500	RedLemon	nw_flow_connected [C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:14.714566-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.165s
default	15:40:14.714689-0500	RedLemon	[C35 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.165s
default	15:40:14.715282-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C35.1:2][0x7fe7659c0030] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:40:14.715467-0500	RedLemon	boringssl_context_info_handler(2028) [C35.1:2][0x7fe7659c0030] Client handshake started
default	15:40:14.715773-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS client enter_early_data
default	15:40:14.715976-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS client read_server_hello
default	15:40:14.897614-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:40:14.897751-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client read_server_hello
default	15:40:14.898231-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:40:14.898926-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client read_certificate_request
default	15:40:14.899569-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client read_server_certificate
default	15:40:14.899710-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:40:14.900655-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C35.1:2][0x7fe7659c0030] Performing external trust evaluation
default	15:40:14.900773-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C35.1:2][0x7fe7659c0030] Asyncing for external verify block
default	15:40:14.901797-0500	RedLemon	Connection 35: asked to evaluate TLS Trust
default	15:40:14.902153-0500	RedLemon	Task <8C580944-B9FD-4E11-99E4-9A6F24BB8F78>.<2> received response, status 101 content U
default	15:40:14.902688-0500	RedLemon	Task <8C580944-B9FD-4E11-99E4-9A6F24BB8F78>.<2> response ended
default	15:40:14.902761-0500	RedLemon	Task <8C580944-B9FD-4E11-99E4-9A6F24BB8F78>.<2> done using Connection 36
default	15:40:14.903242-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> auth completion disp=1 cred=0x0
default	15:40:14.903379-0500	RedLemon	[C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.276s
default	15:40:14.903424-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C36] reporting state preparing
default	15:40:14.903536-0500	RedLemon	[C36 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.276s
default	15:40:14.903687-0500	RedLemon	[C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.276s
default	15:40:14.903743-0500	RedLemon	[C36 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.276s
default	15:40:14.903815-0500	RedLemon	nw_flow_connected [C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:14.903942-0500	RedLemon	[C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.276s
default	15:40:14.903996-0500	RedLemon	[C36 Hostname#cb87f9a4:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.276s
default	15:40:14.904403-0500	RedLemon	nw_flow_connected [C36.1 IPv4#adac733c:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:14.904912-0500	RedLemon	[C36.1 IPv4#adac733c:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.277s
default	15:40:14.904954-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C36] reporting state ready
default	15:40:14.905116-0500	RedLemon	[C36 Hostname#cb87f9a4:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.277s
default	15:40:14.916296-0500	RedLemon	Connection 35: TLS Trust result 0
default	15:40:14.916373-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C35.1:2][0x7fe7659c0030] Returning from external verify block with result: true
default	15:40:14.916492-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C35.1:2][0x7fe7659c0030] Certificate verification result: OK
default	15:40:14.916954-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client read_server_finished
default	15:40:14.917251-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:40:14.917284-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:40:14.917321-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client send_client_certificate
default	15:40:14.917354-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client complete_second_flight
default	15:40:14.917455-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS 1.3 client done
default	15:40:14.917818-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS client finish_client_handshake
default	15:40:14.917862-0500	RedLemon	boringssl_context_info_handler(2045) [C35.1:2][0x7fe7659c0030] Client handshake state: TLS client done
default	15:40:14.917898-0500	RedLemon	boringssl_context_info_handler(2034) [C35.1:2][0x7fe7659c0030] Client handshake done
default	15:40:14.918556-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C35.1:2][0x7fe7659c0030] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(203ms) flight_time(183ms) rtt(182ms) write_stalls(0) read_stalls(4)]
default	15:40:14.918715-0500	RedLemon	nw_flow_connected [C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:14.919049-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.370s
default	15:40:14.919642-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C35] reporting state ready
default	15:40:14.919785-0500	RedLemon	[C35 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.370s
default	15:40:14.920083-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.371s
default	15:40:14.920126-0500	RedLemon	Task <03D76DE3-A95F-4B7B-BB87-D1901FB00E40>.<346> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:14.920242-0500	RedLemon	[C35 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.371s
default	15:40:14.920797-0500	RedLemon	Connection 35: connected successfully
default	15:40:14.920891-0500	RedLemon	Connection 35: TLS handshake complete
default	15:40:14.921015-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C6094604-409C-4C9F-B780-7662D9865D57] (reporting strategy default)> on Task <03D76DE3-A95F-4B7B-BB87-D1901FB00E40>.<346> was not selected for reporting
default	15:40:14.921289-0500	RedLemon	Connection 35: ready C(N) E(N)
default	15:40:14.921478-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> now using Connection 35
default	15:40:14.921581-0500	RedLemon	Connection 35: received viability advisory(Y)
default	15:40:14.921699-0500	RedLemon	Task <03D76DE3-A95F-4B7B-BB87-D1901FB00E40>.<346> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:14.921928-0500	RedLemon	Task <03D76DE3-A95F-4B7B-BB87-D1901FB00E40>.<346> now using Connection 3
default	15:40:14.922936-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> sent request, body N 0
default	15:40:14.922993-0500	RedLemon	0x7fe7683d4a28 ID=412 Task <03D76DE3-A95F-4B7B-BB87-D1901FB00E40>.<346> sent request, body N 0
default	15:40:14.957048-0500	RedLemon	📥 Received Realtime message: 'LOBBY_JOIN' from lemontom in room ABRD
default	15:40:14.957221-0500	RedLemon	👋 Received: Guest 'lemontom' joined room ABRD
default	15:40:14.989701-0500	RedLemon	0x7fe7683d4a28 ID=412 Task <03D76DE3-A95F-4B7B-BB87-D1901FB00E40>.<346> received response, status 200 content U
default	15:40:14.991255-0500	RedLemon	Task <03D76DE3-A95F-4B7B-BB87-D1901FB00E40>.<346> response ended
default	15:40:14.991564-0500	RedLemon	Task <03D76DE3-A95F-4B7B-BB87-D1901FB00E40>.<346> done using Connection 3
default	15:40:14.992296-0500	RedLemon	Task <03D76DE3-A95F-4B7B-BB87-D1901FB00E40>.<346> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=67, response_duration_ms=2, request_bytes=511, response_bytes=839, cache_hit=false}
default	15:40:14.992429-0500	RedLemon	Task <03D76DE3-A95F-4B7B-BB87-D1901FB00E40>.<346> finished successfully
default	15:40:14.993304-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1728 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:14.993540-0500	runningboardd	Assertion 166-4995-1728 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:14.994267-0500	RedLemon	Task <3AB01B07-6D1D-4AA7-B436-5A6FFF87F1CB>.<347> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:14.994685-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0067D307-2ED1-41F1-96C0-7E4FA12FF9CF] (reporting strategy default)> on Task <3AB01B07-6D1D-4AA7-B436-5A6FFF87F1CB>.<347> was not selected for reporting
default	15:40:14.995484-0500	RedLemon	Task <3AB01B07-6D1D-4AA7-B436-5A6FFF87F1CB>.<347> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:14.995768-0500	RedLemon	Task <3AB01B07-6D1D-4AA7-B436-5A6FFF87F1CB>.<347> now using Connection 3
default	15:40:14.995728-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:14.995978-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:14.996206-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:14.996768-0500	RedLemon	0x7fe76b090f88 ID=416 Task <3AB01B07-6D1D-4AA7-B436-5A6FFF87F1CB>.<347> sent request, body N 0
default	15:40:15.006388-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-1729 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:15.006630-0500	runningboardd	Assertion 166-103-1729 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:15.007796-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:15.007838-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:15.007878-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:15.019498-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:15.051572-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> received response, status 101 content U
default	15:40:15.051837-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> response ended
default	15:40:15.051927-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> done using Connection 35
default	15:40:15.052783-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.503s
default	15:40:15.052850-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C35] reporting state preparing
default	15:40:15.052953-0500	RedLemon	[C35 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.503s
default	15:40:15.053163-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.504s
default	15:40:15.053247-0500	RedLemon	[C35 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.504s
default	15:40:15.053320-0500	RedLemon	nw_flow_connected [C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:15.053431-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.504s
default	15:40:15.053479-0500	RedLemon	[C35 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.504s
default	15:40:15.053580-0500	RedLemon	nw_flow_connected [C35.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:15.053859-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.504s
default	15:40:15.053987-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C35] reporting state ready
default	15:40:15.054166-0500	RedLemon	[C35 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.505s
default	15:40:15.064155-0500	RedLemon	0x7fe76b090f88 ID=416 Task <3AB01B07-6D1D-4AA7-B436-5A6FFF87F1CB>.<347> received response, status 200 content U
default	15:40:15.064941-0500	RedLemon	Task <3AB01B07-6D1D-4AA7-B436-5A6FFF87F1CB>.<347> response ended
default	15:40:15.065363-0500	RedLemon	Task <3AB01B07-6D1D-4AA7-B436-5A6FFF87F1CB>.<347> done using Connection 3
default	15:40:15.065567-0500	RedLemon	Task <3AB01B07-6D1D-4AA7-B436-5A6FFF87F1CB>.<347> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=68, response_duration_ms=1, request_bytes=524, response_bytes=841, cache_hit=true}
default	15:40:15.065906-0500	RedLemon	Task <3AB01B07-6D1D-4AA7-B436-5A6FFF87F1CB>.<347> finished successfully
default	15:40:15.067858-0500	RedLemon	Task <617656D6-6188-4295-BF15-CF663A1D2A97>.<348> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:15.068140-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [BB7019A7-E775-4D9D-985E-F9F07563D17F] (reporting strategy default)> on Task <617656D6-6188-4295-BF15-CF663A1D2A97>.<348> was not selected for reporting
default	15:40:15.068856-0500	RedLemon	Task <617656D6-6188-4295-BF15-CF663A1D2A97>.<348> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:15.069062-0500	RedLemon	Task <617656D6-6188-4295-BF15-CF663A1D2A97>.<348> now using Connection 3
default	15:40:15.069804-0500	RedLemon	0x7fe7684972c8 ID=420 Task <617656D6-6188-4295-BF15-CF663A1D2A97>.<348> sent request, body N 0
default	15:40:15.081582-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:15.142410-0500	RedLemon	0x7fe7684972c8 ID=420 Task <617656D6-6188-4295-BF15-CF663A1D2A97>.<348> received response, status 200 content U
default	15:40:15.143012-0500	RedLemon	Task <617656D6-6188-4295-BF15-CF663A1D2A97>.<348> response ended
default	15:40:15.143465-0500	RedLemon	Task <617656D6-6188-4295-BF15-CF663A1D2A97>.<348> done using Connection 3
default	15:40:15.143690-0500	RedLemon	Task <617656D6-6188-4295-BF15-CF663A1D2A97>.<348> summary for task success {transaction_duration_ms=75, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=73, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:40:15.144328-0500	RedLemon	Task <617656D6-6188-4295-BF15-CF663A1D2A97>.<348> finished successfully
default	15:40:15.146235-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	15:40:15.146419-0500	RedLemon	👋 lemontom joined room
default	15:40:15.146770-0500	RedLemon	Task <B2002819-9DD2-4CAB-B95F-62C9B4CD0383>.<349> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:15.147195-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F369F6BF-25D6-429F-8286-603CAD5F40CB] (reporting strategy default)> on Task <B2002819-9DD2-4CAB-B95F-62C9B4CD0383>.<349> was not selected for reporting
default	15:40:15.147914-0500	RedLemon	Task <B2002819-9DD2-4CAB-B95F-62C9B4CD0383>.<349> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:15.148241-0500	RedLemon	Task <B2002819-9DD2-4CAB-B95F-62C9B4CD0383>.<349> now using Connection 3
default	15:40:15.149246-0500	RedLemon	0x7fe765ab48b8 ID=424 Task <B2002819-9DD2-4CAB-B95F-62C9B4CD0383>.<349> sent request, body N 0
default	15:40:15.173564-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:15.173912-0500	RedLemon	nw_flow_disconnected [C35.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:40:15.174200-0500	RedLemon	nw_protocol_tcp_log_summary [C35.1:3] 
	[A821C959-CE96-4EA1-8FBF-E2F247407843 <private>:57890<-><private>:443]
	Init: 1, Conn_Time: 118.784ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 143.625ms, rtt_var: 29.750ms rtt_nc: 125.937ms, rtt_var_nc: 36.062ms base rtt: 119ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:40:15.174895-0500	RedLemon	[C35.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.625s, error Socket is not connected
default	15:40:15.174925-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C35] reporting state failed error Socket is not connected
default	15:40:15.174962-0500	RedLemon	[C35 Hostname#4638943b:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.625s
error	15:40:15.174995-0500	RedLemon	nw_read_request_report [C35] Receive failed with error "Socket is not connected"
error	15:40:15.175034-0500	RedLemon	nw_flow_service_reads [C35.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	15:40:15.175071-0500	RedLemon	tcp_output [C35.1:3] flags=[R.] seq=1472745427, ack=598696408, win=2047 state=CLOSED rcv_nxt=598696408, snd_una=1472745296
default	15:40:15.175205-0500	RedLemon	tcp_input [C35.1:3] flags=[F.] seq=598696408, ack=1472745296, win=249 state=CLOSED rcv_nxt=598696408, snd_una=1472745296
error	15:40:15.175265-0500	RedLemon	Connection 35: received failure notification
default	15:40:15.175400-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> summary for task success {transaction_duration_ms=641, response_status=101, connection=35, protocol="http/1.1", domain_lookup_duration_ms=43, connect_duration_ms=324, secure_connection_duration_ms=203, private_relay=false, request_start_ms=388, request_duration_ms=0, response_start_ms=517, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	15:40:15.175422-0500	RedLemon	nw_flow_add_write_request [C35.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	15:40:15.175472-0500	RedLemon	nw_write_request_report [C35] Send failed with error "Socket is not connected"
default	15:40:15.175470-0500	RedLemon	Task <6178A0DD-8A56-43AF-AB54-4CD02D827956>.<1> finished successfully
default	15:40:15.175523-0500	RedLemon	Connection 35: cleaning up
default	15:40:15.175683-0500	RedLemon	[C35 AA8C9F64-3D11-49D8-8F30-7CABE5E5A8FB Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancel
default	15:40:15.175909-0500	RedLemon	[C35 AA8C9F64-3D11-49D8-8F30-7CABE5E5A8FB Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancelled
	[C35.1 3980E058-0F78-4ACC-A5E8-2F4B1833BFA3 10.0.0.113:57890<->IPv4#880cfe6d:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.626s, DNS @0.000s took 0.043s, TCP @0.504s took 0.119s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:40:15.176474-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C35] reporting state cancelled error Socket is not connected
default	15:40:15.176649-0500	RedLemon	Connection 35: done
default	15:40:15.218616-0500	RedLemon	0x7fe765ab48b8 ID=424 Task <B2002819-9DD2-4CAB-B95F-62C9B4CD0383>.<349> received response, status 200 content U
default	15:40:15.219229-0500	RedLemon	Task <B2002819-9DD2-4CAB-B95F-62C9B4CD0383>.<349> response ended
default	15:40:15.219906-0500	RedLemon	Task <B2002819-9DD2-4CAB-B95F-62C9B4CD0383>.<349> done using Connection 3
default	15:40:15.220143-0500	RedLemon	Task <B2002819-9DD2-4CAB-B95F-62C9B4CD0383>.<349> summary for task success {transaction_duration_ms=72, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=70, response_duration_ms=1, request_bytes=500, response_bytes=967, cache_hit=false}
default	15:40:15.220482-0500	RedLemon	Task <B2002819-9DD2-4CAB-B95F-62C9B4CD0383>.<349> finished successfully
default	15:40:15.258065-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:16.096556-0500	runningboardd	Invalidating assertion 166-4995-1728 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:16.266515-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:16.267188-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [4CF955BB-6767-4FA1-A50E-A3EBBCA5FD78] (reporting strategy default)> on Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> was not selected for reporting
default	15:40:16.268441-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:16.269407-0500	RedLemon	Connection 37: enabling TLS
default	15:40:16.269496-0500	RedLemon	Connection 37: starting, TC(0x0)
default	15:40:16.269597-0500	RedLemon	[C37 5C8C51AA-B8BA-46A8-BB66-8F3CA2E0BA78 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{6C11A7D9-A0BE-4F1C-8E26-351195699622}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:16.269741-0500	RedLemon	[C37 Hostname#4638943b:443 initial path ((null))] event: path:start @0.000s
default	15:40:16.270178-0500	RedLemon	[C37 Hostname#4638943b:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 2EE731DB-9F24-4CF6-BEA2-AD1F00EDACC5
default	15:40:16.270369-0500	RedLemon	[C37 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:40:16.270407-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C37] reporting state preparing
default	15:40:16.270653-0500	mDNSResponder	[R1217] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 4995 (RedLemon)
default	15:40:16.270570-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> setting up Connection 37
default	15:40:16.271992-0500	mDNSResponder	[R1217] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 4995 (RedLemon)
default	15:40:16.272082-0500	RedLemon	nw_endpoint_resolver_update [C37 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#880cfe6d:443
default	15:40:16.272301-0500	RedLemon	[C37 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	15:40:16.272574-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 initial path ((null))] event: path:start @0.002s
default	15:40:16.273159-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: CC0FFEB7-4296-40D8-98C4-CADDC4DCA90B
default	15:40:16.273304-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.003s
default	15:40:16.273893-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.004s
default	15:40:16.274718-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.005s
default	15:40:16.274960-0500	RedLemon	tcp_output [C37.1:3] flags=[S] seq=2002634317, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=2002634317
default	15:40:16.275221-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:16.275306-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:16.275357-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:16.276503-0500	runningboardd	Invalidating assertion 166-103-1729 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.powerd>:103]
default	15:40:16.395185-0500	RedLemon	tcp_input [C37.1:3] flags=[S.] seq=3693289498, ack=2002634318, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=2002634317
default	15:40:16.395406-0500	RedLemon	nw_flow_connected [C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:16.395657-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.125s
default	15:40:16.395778-0500	RedLemon	[C37 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.126s
default	15:40:16.396395-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C37.1:2][0x7fe7659c9d10] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:40:16.396586-0500	RedLemon	boringssl_context_info_handler(2028) [C37.1:2][0x7fe7659c9d10] Client handshake started
default	15:40:16.396903-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS client enter_early_data
default	15:40:16.397113-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS client read_server_hello
default	15:40:16.437016-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:16.437084-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:16.437182-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:16.536866-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:40:16.536999-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client read_server_hello
default	15:40:16.537550-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:40:16.538292-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client read_certificate_request
default	15:40:16.538602-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client read_server_certificate
default	15:40:16.538712-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:40:16.539608-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C37.1:2][0x7fe7659c9d10] Performing external trust evaluation
default	15:40:16.539760-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C37.1:2][0x7fe7659c9d10] Asyncing for external verify block
default	15:40:16.540232-0500	RedLemon	Connection 37: asked to evaluate TLS Trust
default	15:40:16.540505-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> auth completion disp=1 cred=0x0
default	15:40:16.540937-0500	RedLemon	📥 Received Realtime message: 'LOBBY_START_COUNTDOWN' from Host in room ABRD
default	15:40:16.541063-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	15:40:16.547154-0500	RedLemon	Connection 37: TLS Trust result 0
default	15:40:16.555536-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C37.1:2][0x7fe7659c9d10] Returning from external verify block with result: true
default	15:40:16.555644-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C37.1:2][0x7fe7659c9d10] Certificate verification result: OK
default	15:40:16.557821-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client read_server_finished
default	15:40:16.558326-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:40:16.558368-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:40:16.558794-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client send_client_certificate
default	15:40:16.558907-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client complete_second_flight
default	15:40:16.559380-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS 1.3 client done
default	15:40:16.559560-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS client finish_client_handshake
default	15:40:16.559639-0500	RedLemon	boringssl_context_info_handler(2045) [C37.1:2][0x7fe7659c9d10] Client handshake state: TLS client done
default	15:40:16.559973-0500	RedLemon	boringssl_context_info_handler(2034) [C37.1:2][0x7fe7659c9d10] Client handshake done
default	15:40:16.560734-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C37.1:2][0x7fe7659c9d10] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(164ms) flight_time(142ms) rtt(140ms) write_stalls(0) read_stalls(4)]
default	15:40:16.561043-0500	RedLemon	nw_flow_connected [C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:16.561306-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.291s
default	15:40:16.561563-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C37] reporting state ready
default	15:40:16.561705-0500	RedLemon	[C37 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.292s
default	15:40:16.561902-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.292s
default	15:40:16.561964-0500	RedLemon	[C37 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.292s
default	15:40:16.562383-0500	RedLemon	Connection 37: connected successfully
default	15:40:16.562587-0500	RedLemon	Connection 37: TLS handshake complete
default	15:40:16.562917-0500	RedLemon	🎬 Guest: Received LOBBY_START_COUNTDOWN signal
default	15:40:16.562948-0500	RedLemon	Connection 37: ready C(N) E(N)
default	15:40:16.563368-0500	RedLemon	Task <5DD5297A-A281-45BA-A9AE-7461FCFC04D2>.<350> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:16.563404-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> now using Connection 37
default	15:40:16.563513-0500	RedLemon	Connection 37: received viability advisory(Y)
default	15:40:16.563744-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> sent request, body N 0
default	15:40:16.563908-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [99935164-1822-404E-8078-DC62B63322F8] (reporting strategy default)> on Task <5DD5297A-A281-45BA-A9AE-7461FCFC04D2>.<350> was not selected for reporting
default	15:40:16.564527-0500	RedLemon	Task <5DD5297A-A281-45BA-A9AE-7461FCFC04D2>.<350> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:16.564747-0500	RedLemon	Task <5DD5297A-A281-45BA-A9AE-7461FCFC04D2>.<350> now using Connection 3
default	15:40:16.565814-0500	RedLemon	0x7fe7683d4a28 ID=428 Task <5DD5297A-A281-45BA-A9AE-7461FCFC04D2>.<350> sent request, body N 0
default	15:40:16.638298-0500	RedLemon	0x7fe7683d4a28 ID=428 Task <5DD5297A-A281-45BA-A9AE-7461FCFC04D2>.<350> received response, status 200 content U
default	15:40:16.638792-0500	RedLemon	Task <5DD5297A-A281-45BA-A9AE-7461FCFC04D2>.<350> response ended
default	15:40:16.639174-0500	RedLemon	Task <5DD5297A-A281-45BA-A9AE-7461FCFC04D2>.<350> done using Connection 3
default	15:40:16.639333-0500	RedLemon	Task <5DD5297A-A281-45BA-A9AE-7461FCFC04D2>.<350> summary for task success {transaction_duration_ms=75, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=73, response_duration_ms=1, request_bytes=500, response_bytes=959, cache_hit=false}
default	15:40:16.639528-0500	RedLemon	Task <5DD5297A-A281-45BA-A9AE-7461FCFC04D2>.<350> finished successfully
default	15:40:16.642322-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	15:40:16.642302-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1730 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:16.642520-0500	RedLemon	🎬 Guest: Fetch took 0.079s, waiting 3.171s (includes 0.25s sync buffer)
default	15:40:16.643697-0500	runningboardd	Assertion 166-4995-1730 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:16.644855-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:16.644897-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:16.644936-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:16.647090-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-1731 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:16.647252-0500	runningboardd	Assertion 166-103-1731 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:16.648039-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:16.648085-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:16.648184-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:16.676634-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:16.687700-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> received response, status 101 content U
default	15:40:16.687993-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> response ended
default	15:40:16.688071-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> done using Connection 37
default	15:40:16.688786-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.419s
default	15:40:16.688851-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C37] reporting state preparing
default	15:40:16.688947-0500	RedLemon	[C37 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.419s
default	15:40:16.689151-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.419s
default	15:40:16.689234-0500	RedLemon	[C37 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.419s
default	15:40:16.689342-0500	RedLemon	nw_flow_connected [C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:16.689532-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.419s
default	15:40:16.689615-0500	RedLemon	[C37 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.419s
default	15:40:16.689905-0500	RedLemon	nw_flow_connected [C37.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:16.690521-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.420s
default	15:40:16.690840-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C37] reporting state ready
default	15:40:16.691138-0500	RedLemon	[C37 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.421s
default	15:40:16.816416-0500	RedLemon	nw_flow_disconnected [C37.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:40:16.816688-0500	RedLemon	nw_protocol_tcp_log_summary [C37.1:3] 
	[82B954D2-9808-44BE-80E9-7B3801DE5417 <private>:57892<-><private>:443]
	Init: 1, Conn_Time: 120.458ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 140.531ms, rtt_var: 21.937ms rtt_nc: 124.000ms, rtt_var_nc: 29.250ms base rtt: 119ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
error	15:40:16.817267-0500	RedLemon	nw_read_request_report [C37] Receive failed with error "Socket is not connected"
default	15:40:16.817361-0500	RedLemon	tcp_input [C37.1:3] flags=[F.] seq=3693292529, ack=2002635373, win=249 state=ESTABLISHED rcv_nxt=3693292529, snd_una=2002635373
default	15:40:16.817943-0500	RedLemon	[C37.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.548s, error Socket is not connected
default	15:40:16.817996-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C37] reporting state failed error Socket is not connected
default	15:40:16.818057-0500	RedLemon	[C37 Hostname#4638943b:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.548s
error	15:40:16.818157-0500	RedLemon	tcp_output [C37.1:3] flags=[R.] seq=2002635504, ack=3693292530, win=2047 state=CLOSED rcv_nxt=3693292530, snd_una=2002635373
error	15:40:16.818314-0500	RedLemon	Connection 37: received failure notification
default	15:40:16.818434-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> summary for task success {transaction_duration_ms=550, response_status=101, connection=37, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=286, secure_connection_duration_ms=164, private_relay=false, request_start_ms=295, request_duration_ms=0, response_start_ms=419, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
default	15:40:16.818691-0500	RedLemon	Task <6F4FB43C-01FB-402C-9389-13628B66DDB4>.<1> finished successfully
error	15:40:16.818582-0500	RedLemon	nw_flow_add_write_request [C37.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	15:40:16.818986-0500	RedLemon	nw_write_request_report [C37] Send failed with error "Socket is not connected"
default	15:40:16.819046-0500	RedLemon	Connection 37: cleaning up
default	15:40:16.819088-0500	RedLemon	[C37 5C8C51AA-B8BA-46A8-BB66-8F3CA2E0BA78 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancel
default	15:40:16.819183-0500	RedLemon	[C37 5C8C51AA-B8BA-46A8-BB66-8F3CA2E0BA78 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancelled
	[C37.1 CC0FFEB7-4296-40D8-98C4-CADDC4DCA90B 10.0.0.113:57892<->IPv4#880cfe6d:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.549s, DNS @0.000s took 0.002s, TCP @0.419s took 0.120s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:40:16.819484-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C37] reporting state cancelled error Socket is not connected
default	15:40:16.819575-0500	RedLemon	Connection 37: done
default	15:40:16.948724-0500	runningboardd	Assertion did invalidate due to timeout: 166-129-1724 (target:[anon<RedLemon>(501):4995])
default	15:40:17.115613-0500	RedLemon	Task <72F035C0-3F40-4A4B-BBD6-79BD99920B06>.<351> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:17.115613-0500	RedLemon	Task <84DDB568-7A6A-428D-B7FD-535A3C31878E>.<352> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:17.116733-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [512086A3-62FD-43CD-B3DA-BA44869B0DCF] (reporting strategy default)> on Task <72F035C0-3F40-4A4B-BBD6-79BD99920B06>.<351> was not selected for reporting
default	15:40:17.116873-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [3D8C96D2-4D7F-43B2-A27C-38B7D8C62519] (reporting strategy default)> on Task <84DDB568-7A6A-428D-B7FD-535A3C31878E>.<352> was not selected for reporting
default	15:40:17.118078-0500	RedLemon	Task <72F035C0-3F40-4A4B-BBD6-79BD99920B06>.<351> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:17.118356-0500	RedLemon	Task <72F035C0-3F40-4A4B-BBD6-79BD99920B06>.<351> now using Connection 3
default	15:40:17.119405-0500	RedLemon	Task <84DDB568-7A6A-428D-B7FD-535A3C31878E>.<352> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:17.119596-0500	RedLemon	Task <84DDB568-7A6A-428D-B7FD-535A3C31878E>.<352> now using Connection 3
default	15:40:17.120589-0500	RedLemon	0x7fe7684972c8 ID=432 Task <72F035C0-3F40-4A4B-BBD6-79BD99920B06>.<351> sent request, body N 0
default	15:40:17.120640-0500	RedLemon	0x7fe7684e89a8 ID=436 Task <84DDB568-7A6A-428D-B7FD-535A3C31878E>.<352> sent request, body N 0
default	15:40:17.122888-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:17.122989-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:17.123128-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:17.180305-0500	RedLemon	0x7fe7684972c8 ID=432 Task <72F035C0-3F40-4A4B-BBD6-79BD99920B06>.<351> received response, status 200 content U
default	15:40:17.180924-0500	RedLemon	Task <72F035C0-3F40-4A4B-BBD6-79BD99920B06>.<351> response ended
default	15:40:17.181358-0500	RedLemon	Task <72F035C0-3F40-4A4B-BBD6-79BD99920B06>.<351> done using Connection 3
default	15:40:17.181596-0500	RedLemon	Task <72F035C0-3F40-4A4B-BBD6-79BD99920B06>.<351> summary for task success {transaction_duration_ms=64, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=2, response_start_ms=62, response_duration_ms=1, request_bytes=500, response_bytes=955, cache_hit=true}
default	15:40:17.182245-0500	RedLemon	Task <72F035C0-3F40-4A4B-BBD6-79BD99920B06>.<351> finished successfully
default	15:40:17.184312-0500	RedLemon	🎬 Guest: Detected room playback start via database fallback
default	15:40:17.189424-0500	RedLemon	0x7fe7684e89a8 ID=436 Task <84DDB568-7A6A-428D-B7FD-535A3C31878E>.<352> received response, status 200 content U
default	15:40:17.200258-0500	RedLemon	Task <84DDB568-7A6A-428D-B7FD-535A3C31878E>.<352> response ended
default	15:40:17.201169-0500	RedLemon	Task <84DDB568-7A6A-428D-B7FD-535A3C31878E>.<352> done using Connection 3
default	15:40:17.201698-0500	RedLemon	Task <84DDB568-7A6A-428D-B7FD-535A3C31878E>.<352> summary for task success {transaction_duration_ms=84, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=71, response_duration_ms=12, request_bytes=511, response_bytes=840, cache_hit=true}
default	15:40:17.202276-0500	RedLemon	Task <84DDB568-7A6A-428D-B7FD-535A3C31878E>.<352> finished successfully
default	15:40:17.202610-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:17.204122-0500	RedLemon	Task <BABC214B-93EA-412B-B4DE-0FB9B8C78391>.<353> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:17.204526-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9E2D64C1-6A3B-4142-B44C-0AB065DB9A8E] (reporting strategy default)> on Task <BABC214B-93EA-412B-B4DE-0FB9B8C78391>.<353> was not selected for reporting
default	15:40:17.205322-0500	RedLemon	Task <BABC214B-93EA-412B-B4DE-0FB9B8C78391>.<353> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:17.205604-0500	RedLemon	Task <BABC214B-93EA-412B-B4DE-0FB9B8C78391>.<353> now using Connection 3
default	15:40:17.206552-0500	RedLemon	0x7fe7684e89a8 ID=440 Task <BABC214B-93EA-412B-B4DE-0FB9B8C78391>.<353> sent request, body N 0
default	15:40:17.268825-0500	RedLemon	0x7fe7684e89a8 ID=440 Task <BABC214B-93EA-412B-B4DE-0FB9B8C78391>.<353> received response, status 200 content U
default	15:40:17.269460-0500	RedLemon	Task <BABC214B-93EA-412B-B4DE-0FB9B8C78391>.<353> response ended
default	15:40:17.269903-0500	RedLemon	Task <BABC214B-93EA-412B-B4DE-0FB9B8C78391>.<353> done using Connection 3
default	15:40:17.270097-0500	RedLemon	Task <BABC214B-93EA-412B-B4DE-0FB9B8C78391>.<353> summary for task success {transaction_duration_ms=65, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=63, response_duration_ms=1, request_bytes=524, response_bytes=841, cache_hit=true}
default	15:40:17.270318-0500	RedLemon	Task <BABC214B-93EA-412B-B4DE-0FB9B8C78391>.<353> finished successfully
default	15:40:17.272350-0500	RedLemon	Task <C9439A77-97FC-45F3-A00E-D64CAC3A5540>.<354> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:17.272715-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6C4B03CF-2F99-4A86-8182-2BD73DC8B8A3] (reporting strategy default)> on Task <C9439A77-97FC-45F3-A00E-D64CAC3A5540>.<354> was not selected for reporting
default	15:40:17.273617-0500	RedLemon	Task <C9439A77-97FC-45F3-A00E-D64CAC3A5540>.<354> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:17.273909-0500	RedLemon	Task <C9439A77-97FC-45F3-A00E-D64CAC3A5540>.<354> now using Connection 3
default	15:40:17.274928-0500	RedLemon	0x7fe765a1caf8 ID=444 Task <C9439A77-97FC-45F3-A00E-D64CAC3A5540>.<354> sent request, body N 0
default	15:40:17.289598-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:17.338890-0500	RedLemon	0x7fe765a1caf8 ID=444 Task <C9439A77-97FC-45F3-A00E-D64CAC3A5540>.<354> received response, status 200 content U
default	15:40:17.339514-0500	RedLemon	Task <C9439A77-97FC-45F3-A00E-D64CAC3A5540>.<354> response ended
default	15:40:17.340075-0500	RedLemon	Task <C9439A77-97FC-45F3-A00E-D64CAC3A5540>.<354> done using Connection 3
default	15:40:17.340404-0500	RedLemon	Task <C9439A77-97FC-45F3-A00E-D64CAC3A5540>.<354> summary for task success {transaction_duration_ms=67, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=65, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:40:17.340972-0500	RedLemon	Task <C9439A77-97FC-45F3-A00E-D64CAC3A5540>.<354> finished successfully
default	15:40:17.343230-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	15:40:17.381172-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:17.746279-0500	runningboardd	Invalidating assertion 166-4995-1730 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:17.884433-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:17.884521-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:17.884601-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:17.886529-0500	runningboardd	Invalidating assertion 166-103-1731 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.powerd>:103]
default	15:40:17.994287-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:17.994333-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:17.994379-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:18.993998-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:18.994419-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [07FFB627-509E-469F-A8C6-1460C81DD80F] (reporting strategy default)> on Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> was not selected for reporting
default	15:40:18.995532-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:18.996009-0500	RedLemon	Connection 38: enabling TLS
default	15:40:18.996047-0500	RedLemon	Connection 38: starting, TC(0x0)
default	15:40:18.996097-0500	RedLemon	[C38 10A78833-B3B6-4184-9963-E15554CB1044 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{0A5B6F4A-5575-42A9-95D5-1AEF7AEC2F32}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:18.996179-0500	RedLemon	[C38 Hostname#4638943b:443 initial path ((null))] event: path:start @0.000s
default	15:40:18.996531-0500	RedLemon	[C38 Hostname#4638943b:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 861384BF-33AC-43DE-A0D2-00EB523E451F
default	15:40:18.996707-0500	RedLemon	[C38 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:40:18.996747-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state preparing
default	15:40:18.996939-0500	mDNSResponder	[R1218] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 4995 (RedLemon)
default	15:40:18.996910-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> setting up Connection 38
default	15:40:18.998037-0500	mDNSResponder	[R1218] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 4995 (RedLemon)
default	15:40:18.998327-0500	RedLemon	nw_endpoint_resolver_update [C38 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#880cfe6d:443
default	15:40:18.998450-0500	RedLemon	[C38 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	15:40:18.998648-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 initial path ((null))] event: path:start @0.002s
default	15:40:18.998975-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.002s, uuid: 7BEB7B33-D929-4336-AAA4-C9949D44F9A3
default	15:40:18.999087-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.002s
default	15:40:19.999566-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.003s
default	15:40:19.000268-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.004s
default	15:40:19.000417-0500	RedLemon	tcp_output [C38.1:3] flags=[S] seq=1230296534, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1230296534
default	15:40:19.197801-0500	RedLemon	tcp_input [C38.1:3] flags=[S.] seq=2547016660, ack=1230296535, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=1230296534
default	15:40:19.197993-0500	RedLemon	nw_flow_connected [C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:19.198215-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.202s
default	15:40:19.198314-0500	RedLemon	[C38 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.202s
default	15:40:19.198883-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C38.1:2][0x7fe765a77220] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:40:19.199079-0500	RedLemon	boringssl_context_info_handler(2028) [C38.1:2][0x7fe765a77220] Client handshake started
default	15:40:19.199393-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS client enter_early_data
default	15:40:19.199606-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS client read_server_hello
default	15:40:19.316798-0500	RedLemon	Task <3D4962F1-5C00-423D-A109-B03C0687B4A4>.<355> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:19.317531-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F2514DE6-4103-4AB6-BF08-75CF26C68C16] (reporting strategy default)> on Task <3D4962F1-5C00-423D-A109-B03C0687B4A4>.<355> was not selected for reporting
default	15:40:19.318773-0500	RedLemon	Task <3D4962F1-5C00-423D-A109-B03C0687B4A4>.<355> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:19.319214-0500	RedLemon	Task <3D4962F1-5C00-423D-A109-B03C0687B4A4>.<355> now using Connection 3
default	15:40:19.320620-0500	RedLemon	0x7fe76b06b748 ID=448 Task <3D4962F1-5C00-423D-A109-B03C0687B4A4>.<355> sent request, body N 0
default	15:40:19.330945-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:40:19.331021-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client read_server_hello
default	15:40:19.331304-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:40:19.331716-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client read_certificate_request
default	15:40:19.332273-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client read_server_certificate
default	15:40:19.332338-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:40:19.332907-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C38.1:2][0x7fe765a77220] Performing external trust evaluation
default	15:40:19.333043-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C38.1:2][0x7fe765a77220] Asyncing for external verify block
default	15:40:19.333189-0500	RedLemon	Connection 38: asked to evaluate TLS Trust
default	15:40:19.333429-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> auth completion disp=1 cred=0x0
default	15:40:19.338336-0500	RedLemon	Connection 38: TLS Trust result 0
default	15:40:19.338382-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C38.1:2][0x7fe765a77220] Returning from external verify block with result: true
default	15:40:19.338432-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C38.1:2][0x7fe765a77220] Certificate verification result: OK
default	15:40:19.338980-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client read_server_finished
default	15:40:19.339214-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:40:19.339251-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:40:19.339283-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client send_client_certificate
default	15:40:19.339317-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client complete_second_flight
default	15:40:19.339432-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS 1.3 client done
default	15:40:19.339603-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS client finish_client_handshake
default	15:40:19.339646-0500	RedLemon	boringssl_context_info_handler(2045) [C38.1:2][0x7fe765a77220] Client handshake state: TLS client done
default	15:40:19.339678-0500	RedLemon	boringssl_context_info_handler(2034) [C38.1:2][0x7fe765a77220] Client handshake done
default	15:40:19.340178-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C38.1:2][0x7fe765a77220] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(140ms) flight_time(132ms) rtt(131ms) write_stalls(0) read_stalls(7)]
default	15:40:19.340352-0500	RedLemon	nw_flow_connected [C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:19.340576-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.344s
default	15:40:19.340909-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state ready
default	15:40:19.340979-0500	RedLemon	[C38 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.344s
default	15:40:19.341133-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.344s
default	15:40:19.341192-0500	RedLemon	[C38 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.345s
default	15:40:19.341526-0500	RedLemon	Connection 38: connected successfully
default	15:40:19.341624-0500	RedLemon	Connection 38: TLS handshake complete
default	15:40:19.341960-0500	RedLemon	Connection 38: ready C(N) E(N)
default	15:40:19.342186-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> now using Connection 38
default	15:40:19.342324-0500	RedLemon	Connection 38: received viability advisory(Y)
default	15:40:19.342618-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> sent request, body N 0
default	15:40:19.386256-0500	RedLemon	0x7fe76b06b748 ID=448 Task <3D4962F1-5C00-423D-A109-B03C0687B4A4>.<355> received response, status 200 content U
default	15:40:19.386854-0500	RedLemon	Task <3D4962F1-5C00-423D-A109-B03C0687B4A4>.<355> response ended
default	15:40:19.387300-0500	RedLemon	Task <3D4962F1-5C00-423D-A109-B03C0687B4A4>.<355> done using Connection 3
default	15:40:19.387527-0500	RedLemon	Task <3D4962F1-5C00-423D-A109-B03C0687B4A4>.<355> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=67, response_duration_ms=1, request_bytes=500, response_bytes=959, cache_hit=true}
default	15:40:19.388056-0500	RedLemon	Task <5EAFC799-D367-43EF-B49B-12C17757E90A>.<356> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:19.388361-0500	RedLemon	Task <3D4962F1-5C00-423D-A109-B03C0687B4A4>.<355> finished successfully
default	15:40:19.389457-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [20B5A65C-F97E-4DD4-9208-8F59FB0E46D1] (reporting strategy default)> on Task <5EAFC799-D367-43EF-B49B-12C17757E90A>.<356> was not selected for reporting
default	15:40:19.390300-0500	RedLemon	Task <5EAFC799-D367-43EF-B49B-12C17757E90A>.<356> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:19.390600-0500	RedLemon	Task <5EAFC799-D367-43EF-B49B-12C17757E90A>.<356> now using Connection 3
default	15:40:19.391596-0500	RedLemon	0x7fe765a978b8 ID=452 Task <5EAFC799-D367-43EF-B49B-12C17757E90A>.<356> sent request, body N 0
default	15:40:19.391438-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1732 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:19.391885-0500	runningboardd	Assertion 166-4995-1732 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:19.393280-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:19.393331-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:19.393374-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:19.396399-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-1733 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:19.396687-0500	runningboardd	Assertion 166-103-1733 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:19.397726-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:19.397769-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:19.397814-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:19.404006-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:19.453058-0500	RedLemon	0x7fe765a978b8 ID=452 Task <5EAFC799-D367-43EF-B49B-12C17757E90A>.<356> received response, status 200 content U
default	15:40:19.453717-0500	RedLemon	Task <5EAFC799-D367-43EF-B49B-12C17757E90A>.<356> response ended
default	15:40:19.454206-0500	RedLemon	Task <5EAFC799-D367-43EF-B49B-12C17757E90A>.<356> done using Connection 3
default	15:40:19.454441-0500	RedLemon	Task <5EAFC799-D367-43EF-B49B-12C17757E90A>.<356> summary for task success {transaction_duration_ms=64, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=62, response_duration_ms=1, request_bytes=511, response_bytes=840, cache_hit=true}
default	15:40:19.454936-0500	RedLemon	Task <5EAFC799-D367-43EF-B49B-12C17757E90A>.<356> finished successfully
default	15:40:19.456598-0500	RedLemon	Task <32146578-095A-4CD5-BEBA-77255F3B7184>.<357> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:19.456866-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DD43407E-7919-4718-AB0E-386FB3F96E3F] (reporting strategy default)> on Task <32146578-095A-4CD5-BEBA-77255F3B7184>.<357> was not selected for reporting
default	15:40:19.457664-0500	RedLemon	Task <32146578-095A-4CD5-BEBA-77255F3B7184>.<357> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:19.457871-0500	RedLemon	Task <32146578-095A-4CD5-BEBA-77255F3B7184>.<357> now using Connection 3
default	15:40:19.458837-0500	RedLemon	0x7fe7683d4a28 ID=456 Task <32146578-095A-4CD5-BEBA-77255F3B7184>.<357> sent request, body N 0
default	15:40:19.466718-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> received response, status 101 content U
default	15:40:19.467042-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> response ended
default	15:40:19.467120-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> done using Connection 38
default	15:40:19.467839-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.471s
default	15:40:19.467905-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state preparing
default	15:40:19.468010-0500	RedLemon	[C38 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.471s
default	15:40:19.468193-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.472s
default	15:40:19.468245-0500	RedLemon	[C38 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.472s
default	15:40:19.468312-0500	RedLemon	nw_flow_connected [C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:19.468493-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.472s
default	15:40:19.468584-0500	RedLemon	[C38 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.472s
default	15:40:19.468760-0500	RedLemon	nw_flow_connected [C38.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:19.469167-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.473s
default	15:40:19.469202-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state ready
default	15:40:19.469274-0500	RedLemon	[C38 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.473s
default	15:40:19.471070-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:19.513691-0500	RedLemon	0x7fe7683d4a28 ID=456 Task <32146578-095A-4CD5-BEBA-77255F3B7184>.<357> received response, status 200 content U
default	15:40:19.514297-0500	RedLemon	Task <32146578-095A-4CD5-BEBA-77255F3B7184>.<357> response ended
default	15:40:19.514799-0500	RedLemon	Task <32146578-095A-4CD5-BEBA-77255F3B7184>.<357> done using Connection 3
default	15:40:19.515038-0500	RedLemon	Task <32146578-095A-4CD5-BEBA-77255F3B7184>.<357> summary for task success {transaction_duration_ms=57, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=56, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:40:19.515758-0500	RedLemon	Task <32146578-095A-4CD5-BEBA-77255F3B7184>.<357> finished successfully
default	15:40:19.517452-0500	RedLemon	Task <BDA1AB7E-6EBE-4EAC-9CF3-72220A1B6A15>.<358> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:19.517724-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AAC8C424-7457-453A-8EB8-E0364D6C5E9C] (reporting strategy default)> on Task <BDA1AB7E-6EBE-4EAC-9CF3-72220A1B6A15>.<358> was not selected for reporting
default	15:40:19.518471-0500	RedLemon	Task <BDA1AB7E-6EBE-4EAC-9CF3-72220A1B6A15>.<358> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:19.518665-0500	RedLemon	Task <BDA1AB7E-6EBE-4EAC-9CF3-72220A1B6A15>.<358> now using Connection 3
default	15:40:19.519352-0500	RedLemon	0x7fe7683d4a28 ID=460 Task <BDA1AB7E-6EBE-4EAC-9CF3-72220A1B6A15>.<358> sent request, body N 0
default	15:40:19.538419-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:19.587599-0500	RedLemon	0x7fe7683d4a28 ID=460 Task <BDA1AB7E-6EBE-4EAC-9CF3-72220A1B6A15>.<358> received response, status 200 content U
default	15:40:19.588439-0500	RedLemon	Task <BDA1AB7E-6EBE-4EAC-9CF3-72220A1B6A15>.<358> response ended
default	15:40:19.589018-0500	RedLemon	Task <BDA1AB7E-6EBE-4EAC-9CF3-72220A1B6A15>.<358> done using Connection 3
default	15:40:19.589263-0500	RedLemon	Task <BDA1AB7E-6EBE-4EAC-9CF3-72220A1B6A15>.<358> summary for task success {transaction_duration_ms=71, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=69, response_duration_ms=1, request_bytes=524, response_bytes=844, cache_hit=true}
default	15:40:19.589606-0500	RedLemon	Task <BDA1AB7E-6EBE-4EAC-9CF3-72220A1B6A15>.<358> finished successfully
default	15:40:19.590404-0500	RedLemon	nw_flow_disconnected [C38.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:40:19.590914-0500	RedLemon	nw_protocol_tcp_log_summary [C38.1:3] 
	[A1E39A6D-BB00-459D-A32B-FD3EF9B0F6F3 <private>:57893<-><private>:443]
	Init: 1, Conn_Time: 197.545ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 4, rtt: 144.343ms, rtt_var: 32.750ms rtt_nc: 173.000ms, rtt_var_nc: 80.062ms base rtt: 117ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:40:19.591249-0500	RedLemon	tcp_input [C38.1:3] flags=[F.] seq=2547019690, ack=1230297589, win=249 state=ESTABLISHED rcv_nxt=2547019690, snd_una=1230297589
error	15:40:19.591590-0500	RedLemon	nw_read_request_report [C38] Receive failed with error "Socket is not connected"
default	15:40:19.592308-0500	RedLemon	🔍 Current guest participant found in polling: lemontom with ID 96E01CDB-36C0-4228-A6E4-A29A3C66BC8E
default	15:40:19.593101-0500	RedLemon	[C38.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.596s, error Socket is not connected
default	15:40:19.593269-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state failed error Socket is not connected
default	15:40:19.593400-0500	RedLemon	[C38 Hostname#4638943b:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.597s
error	15:40:19.593496-0500	RedLemon	tcp_output [C38.1:3] flags=[R.] seq=1230297720, ack=2547019691, win=2047 state=CLOSED rcv_nxt=2547019691, snd_una=1230297589
error	15:40:19.593723-0500	RedLemon	Connection 38: received failure notification
default	15:40:19.593799-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> summary for task success {transaction_duration_ms=598, response_status=101, connection=38, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=340, secure_connection_duration_ms=140, private_relay=false, request_start_ms=347, request_duration_ms=0, response_start_ms=471, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	15:40:19.593833-0500	RedLemon	nw_flow_add_write_request [C38.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
default	15:40:19.593868-0500	RedLemon	Task <5359B905-D012-497D-B673-4F37F3DD21B4>.<1> finished successfully
error	15:40:19.593887-0500	RedLemon	nw_write_request_report [C38] Send failed with error "Socket is not connected"
default	15:40:19.593966-0500	RedLemon	Connection 38: cleaning up
default	15:40:19.594027-0500	RedLemon	[C38 10A78833-B3B6-4184-9963-E15554CB1044 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancel
default	15:40:19.594297-0500	RedLemon	[C38 10A78833-B3B6-4184-9963-E15554CB1044 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancelled
	[C38.1 7BEB7B33-D929-4336-AAA4-C9949D44F9A3 10.0.0.113:57893<->IPv4#880cfe6d:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.598s, DNS @0.000s took 0.002s, TCP @0.472s took 0.198s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:40:19.594785-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C38] reporting state cancelled error Socket is not connected
default	15:40:19.594899-0500	RedLemon	Connection 38: done
default	15:40:19.597731-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:20.116991-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
default	15:40:20.117685-0500	RedLemon	🎬 Guest: Starting playback after countdown
default	15:40:20.117908-0500	RedLemon	🎬 Guest: Launching player for Frankenstein
default	15:40:20.118290-0500	RedLemon	   Quality: 1080p
default	15:40:20.118607-0500	RedLemon	   Mode: watchParty
default	15:40:20.118824-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	15:40:20.176923-0500	RedLemon	🖼️ Loading background art: https://images.metahub.space/background/medium/tt1312221/img
default	15:40:20.177218-0500	RedLemon	⏳ Background art loading...
default	15:40:20.177373-0500	RedLemon	🎨 Loading logo: https://images.metahub.space/logo/medium/tt1312221/img
default	15:40:20.177521-0500	RedLemon	⏳ Logo loading...
default	15:40:20.208241-0500	RedLemon	Task <AF48E089-5067-4683-AB60-93674E015BB7>.<359> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:20.208560-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9074C014-00E6-4D23-86BC-BCC50E3D2640] (reporting strategy default)> on Task <AF48E089-5067-4683-AB60-93674E015BB7>.<359> was not selected for reporting
default	15:40:20.209150-0500	RedLemon	Task <BBB83897-660F-4F75-AE88-3C81097DA840>.<360> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:20.209183-0500	RedLemon	Task <AF48E089-5067-4683-AB60-93674E015BB7>.<359> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:20.209352-0500	RedLemon	Task <AF48E089-5067-4683-AB60-93674E015BB7>.<359> now using Connection 34
default	15:40:20.209670-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [71F53CBD-A511-4FFA-ACFE-D4CF63CF12A8] (reporting strategy default)> on Task <BBB83897-660F-4F75-AE88-3C81097DA840>.<360> was not selected for reporting
default	15:40:20.210633-0500	RedLemon	Task <BBB83897-660F-4F75-AE88-3C81097DA840>.<360> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:20.210861-0500	RedLemon	Task <BBB83897-660F-4F75-AE88-3C81097DA840>.<360> now using Connection 34
default	15:40:20.211111-0500	RedLemon	Task <AF48E089-5067-4683-AB60-93674E015BB7>.<359> sent request, body N 0
default	15:40:20.211246-0500	RedLemon	Task <BBB83897-660F-4F75-AE88-3C81097DA840>.<360> sent request, body N 0
default	15:40:20.223617-0500	RedLemon	Task <AF48E089-5067-4683-AB60-93674E015BB7>.<359> received response, status 200 content K
default	15:40:20.226130-0500	RedLemon	Task <AF48E089-5067-4683-AB60-93674E015BB7>.<359> done using Connection 34
default	15:40:20.226357-0500	RedLemon	Task <AF48E089-5067-4683-AB60-93674E015BB7>.<359> response ended
default	15:40:20.226763-0500	RedLemon	Task <AF48E089-5067-4683-AB60-93674E015BB7>.<359> summary for task success {transaction_duration_ms=17, response_status=200, connection=34, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=14, response_duration_ms=2, request_bytes=36, response_bytes=63076, cache_hit=false}
default	15:40:20.226872-0500	RedLemon	Task <AF48E089-5067-4683-AB60-93674E015BB7>.<359> finished successfully
default	15:40:20.235188-0500	RedLemon	Task <BBB83897-660F-4F75-AE88-3C81097DA840>.<360> received response, status 200 content K
default	15:40:20.242649-0500	RedLemon	Task <BBB83897-660F-4F75-AE88-3C81097DA840>.<360> done using Connection 34
default	15:40:20.242902-0500	RedLemon	Task <BBB83897-660F-4F75-AE88-3C81097DA840>.<360> response ended
default	15:40:20.244048-0500	RedLemon	Task <BBB83897-660F-4F75-AE88-3C81097DA840>.<360> summary for task success {transaction_duration_ms=34, response_status=200, connection=34, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=25, response_duration_ms=7, request_bytes=41, response_bytes=117936, cache_hit=false}
default	15:40:20.244406-0500	RedLemon	Task <BBB83897-660F-4F75-AE88-3C81097DA840>.<360> finished successfully
default	15:40:20.251288-0500	RedLemon	✅ Background art loaded successfully
default	15:40:20.251523-0500	RedLemon	✅ Logo loaded successfully
default	15:40:20.253340-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	15:40:20.253488-0500	RedLemon	Task <FAE2F6DD-33B0-4881-8746-63D6475219F6>.<362> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:20.253488-0500	RedLemon	Task <4ED9508A-B116-4874-BAB4-8CC026EA7480>.<361> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:20.253520-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	15:40:20.253603-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	15:40:20.254228-0500	RedLemon	Task <84F6106D-852F-476A-B7B8-5B83B656FE90>.<6> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	15:40:20.254554-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DA5D7297-F692-4DF7-8C82-BEE71770DAEB] (reporting strategy default)> on Task <FAE2F6DD-33B0-4881-8746-63D6475219F6>.<362> was not selected for reporting
default	15:40:20.254643-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [66A638C3-3EE3-4846-B0B6-71293C8924BE] (reporting strategy default)> on Task <4ED9508A-B116-4874-BAB4-8CC026EA7480>.<361> was not selected for reporting
default	15:40:20.255253-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [389766CA-35F6-4944-96B6-1A17B35F46FB] (reporting strategy default)> on Task <84F6106D-852F-476A-B7B8-5B83B656FE90>.<6> was not selected for reporting
default	15:40:20.255367-0500	RedLemon	Task <FAE2F6DD-33B0-4881-8746-63D6475219F6>.<362> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	15:40:20.255662-0500	RedLemon	⚠️ Lobby: Failed to poll participants: Error Domain=NSURLErrorDomain Code=-999 "cancelled" UserInfo={NSErrorFailingURLStringKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/room_participants?room_id=eq.ABRD&select=*, NSErrorFailingURLKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/room_participants?room_id=eq.ABRD&select=*, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <FAE2F6DD-33B0-4881-8746-63D6475219F6>.<362>"
), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <FAE2F6DD-33B0-4881-8746-63D6475219F6>.<362>, NSLocalizedDescription=cancelled}
default	15:40:20.256082-0500	RedLemon	Task <84F6106D-852F-476A-B7B8-5B83B656FE90>.<6> now using Connection 32
default	15:40:20.256134-0500	RedLemon	Task <4ED9508A-B116-4874-BAB4-8CC026EA7480>.<361> finished with error [-999] Error Domain=NSURLErrorDomain Code=-999 UserInfo={NSErrorFailingURLStringKey=<private>, NSErrorFailingURLKey=<private>, _NSURLErrorRelatedURLSessionTaskErrorKey=<private>, _NSURLErrorFailingURLSessionTaskErrorKey=<private>, NSLocalizedDescription=<private>}
default	15:40:20.256426-0500	RedLemon	⚠️ Lobby: Failed to poll room state: Error Domain=NSURLErrorDomain Code=-999 "cancelled" UserInfo={NSErrorFailingURLStringKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/rooms?select=*&id=eq.ABRD, NSErrorFailingURLKey=https://nhvsojszwfvcinkyvzmf.supabase.co/rest/v1/rooms?select=*&id=eq.ABRD, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <4ED9508A-B116-4874-BAB4-8CC026EA7480>.<361>"
), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <4ED9508A-B116-4874-BAB4-8CC026EA7480>.<361>, NSLocalizedDescription=cancelled}
default	15:40:20.270625-0500	RedLemon	Task <84F6106D-852F-476A-B7B8-5B83B656FE90>.<6> sent request, body N 0
default	15:40:20.273029-0500	RedLemon	Task <2A88F08A-838C-4E36-9434-3E87A64BB5CA>.<364> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:20.273183-0500	RedLemon	Task <671BFF1D-5661-4E16-BD9A-512560AE2666>.<363> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:20.273591-0500	RedLemon	Task <7BB8144A-3BF1-4D9C-87FF-1BCEA1CA6751>.<365> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:20.273756-0500	RedLemon	Task <8DD46C60-8ADB-4009-AFD7-8BEF268A5DB5>.<366> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:20.276112-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [757F707A-8768-4830-8D08-AD1FC21E8CAF] (reporting strategy default)> on Task <8DD46C60-8ADB-4009-AFD7-8BEF268A5DB5>.<366> was not selected for reporting
default	15:40:20.275163-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B9B96A4D-7221-4DDD-9366-988FCCB950D5] (reporting strategy default)> on Task <671BFF1D-5661-4E16-BD9A-512560AE2666>.<363> was not selected for reporting
default	15:40:20.276592-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5054B15B-AB54-4A92-84EC-A699CEE5182C] (reporting strategy default)> on Task <7BB8144A-3BF1-4D9C-87FF-1BCEA1CA6751>.<365> was not selected for reporting
default	15:40:20.276736-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8FA395E1-7AF0-4920-8D74-0209CB6E5380] (reporting strategy default)> on Task <2A88F08A-838C-4E36-9434-3E87A64BB5CA>.<364> was not selected for reporting
default	15:40:20.295363-0500	RedLemon	Task <2A88F08A-838C-4E36-9434-3E87A64BB5CA>.<364> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:20.295641-0500	RedLemon	Task <8DD46C60-8ADB-4009-AFD7-8BEF268A5DB5>.<366> summary for task success {transaction_duration_ms=3, response_status=200, cache_hit=true}
default	15:40:20.295906-0500	RedLemon	Task <8DD46C60-8ADB-4009-AFD7-8BEF268A5DB5>.<366> finished successfully
default	15:40:20.296030-0500	RedLemon	Task <671BFF1D-5661-4E16-BD9A-512560AE2666>.<363> summary for task success {transaction_duration_ms=2, response_status=200, cache_hit=true}
default	15:40:20.296221-0500	RedLemon	Task <671BFF1D-5661-4E16-BD9A-512560AE2666>.<363> finished successfully
default	15:40:20.296217-0500	RedLemon	Task <2A88F08A-838C-4E36-9434-3E87A64BB5CA>.<364> now using Connection 21
default	15:40:20.296308-0500	RedLemon	Task <7BB8144A-3BF1-4D9C-87FF-1BCEA1CA6751>.<365> summary for task success {transaction_duration_ms=2, response_status=200, cache_hit=true}
default	15:40:20.296441-0500	RedLemon	Task <2A88F08A-838C-4E36-9434-3E87A64BB5CA>.<364> sent request, body N 0
default	15:40:20.296473-0500	RedLemon	Task <7BB8144A-3BF1-4D9C-87FF-1BCEA1CA6751>.<365> finished successfully
default	15:40:20.377971-0500	RedLemon	🎬 Guest: Starting playback after database fallback detection
default	15:40:20.378613-0500	RedLemon	🎬 Guest: Launching player via database fallback
default	15:40:20.378801-0500	RedLemon	⚠️ Guest: No season/episode found in DB or local state
default	15:40:20.379281-0500	RedLemon	   Quality: 1080p
default	15:40:20.379597-0500	RedLemon	   Mode: watchParty
default	15:40:20.379745-0500	RedLemon	📡 Fetching metadata for tt1312221...
default	15:40:20.466952-0500	runningboardd	Invalidating assertion 166-4995-1732 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:20.470837-0500	RedLemon	✅ StreamService: Using provided metadata: Frankenstein
default	15:40:20.470941-0500	RedLemon	🔍 StreamService: Fetching stream bucket...
default	15:40:20.471007-0500	RedLemon	🔍 CLIENT: Resolving streams - imdbId=tt1312221, type=movie, year=2025
default	15:40:20.471378-0500	RedLemon	Task <E4DEEB2E-0828-49FA-8ECF-A3EE1BA396BD>.<7> resuming, timeouts(30.0, 300.0) QOS(0x19) Voucher (null)
default	15:40:20.471616-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5F3267A5-DDAB-450A-96D2-57B0796AABE1] (reporting strategy default)> on Task <E4DEEB2E-0828-49FA-8ECF-A3EE1BA396BD>.<7> was not selected for reporting
default	15:40:20.472193-0500	RedLemon	Task <E4DEEB2E-0828-49FA-8ECF-A3EE1BA396BD>.<7> now using Connection 33
default	15:40:20.472450-0500	RedLemon	Task <E4DEEB2E-0828-49FA-8ECF-A3EE1BA396BD>.<7> sent request, body N 0
default	15:40:20.474126-0500	RedLemon	Task <25071659-2A67-4DE1-805B-2178E1ABC631>.<370> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:20.474126-0500	RedLemon	Task <AFE9E8C4-2BB9-4936-B64E-08BE0C9CB81A>.<367> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:20.474126-0500	RedLemon	Task <6D776395-A356-4481-AA6F-DB5F096FC0B2>.<369> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:20.474126-0500	RedLemon	Task <A100CDE8-2251-45EF-A932-983ED9962D81>.<368> resuming, timeouts(10.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:20.475280-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [88A7A4DC-4854-45E0-B6EA-8EA756E6E8AE] (reporting strategy default)> on Task <AFE9E8C4-2BB9-4936-B64E-08BE0C9CB81A>.<367> was not selected for reporting
default	15:40:20.476244-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [113B107B-FE1F-4721-98E4-E67C71017E7A] (reporting strategy default)> on Task <25071659-2A67-4DE1-805B-2178E1ABC631>.<370> was not selected for reporting
default	15:40:20.476617-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [DD43FF86-8D79-4AB3-A26E-85F438D833FF] (reporting strategy default)> on Task <A100CDE8-2251-45EF-A932-983ED9962D81>.<368> was not selected for reporting
default	15:40:20.475900-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7BAFB151-095F-4CBF-94C4-ADCA5FDC0429] (reporting strategy default)> on Task <6D776395-A356-4481-AA6F-DB5F096FC0B2>.<369> was not selected for reporting
default	15:40:20.486165-0500	RedLemon	Task <6D776395-A356-4481-AA6F-DB5F096FC0B2>.<369> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:20.486243-0500	RedLemon	Task <AFE9E8C4-2BB9-4936-B64E-08BE0C9CB81A>.<367> summary for task success {transaction_duration_ms=10, response_status=200, cache_hit=true}
default	15:40:20.486428-0500	RedLemon	Task <AFE9E8C4-2BB9-4936-B64E-08BE0C9CB81A>.<367> finished successfully
default	15:40:20.486536-0500	RedLemon	Task <6D776395-A356-4481-AA6F-DB5F096FC0B2>.<369> now using Connection 21
default	15:40:20.488461-0500	RedLemon	Task <25071659-2A67-4DE1-805B-2178E1ABC631>.<370> summary for task success {transaction_duration_ms=6, response_status=200, cache_hit=true}
default	15:40:20.488709-0500	RedLemon	Task <25071659-2A67-4DE1-805B-2178E1ABC631>.<370> finished successfully
default	15:40:20.488749-0500	RedLemon	Task <6D776395-A356-4481-AA6F-DB5F096FC0B2>.<369> sent request, body N 0
default	15:40:20.490483-0500	RedLemon	Task <A100CDE8-2251-45EF-A932-983ED9962D81>.<368> summary for task success {transaction_duration_ms=6, response_status=200, cache_hit=true}
default	15:40:20.490727-0500	RedLemon	Task <A100CDE8-2251-45EF-A932-983ED9962D81>.<368> finished successfully
default	15:40:20.495006-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1734 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:20.496332-0500	runningboardd	Assertion 166-4995-1734 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:20.502764-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:20.503115-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:20.503416-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:20.503743-0500	runningboardd	Attempting to rename power assertion 33913 for target anon<RedLemon>(501) to anon<RedLemon>(501);166-4995-1732:com.apple.CFNetwork.StorageDB;166-4995-1734:com.apple.CFNetwork.StorageDB
default	15:40:20.636393-0500	runningboardd	Attempting to rename power assertion 33913 for target anon<RedLemon>(501) to anon<RedLemon>(501)166-4995-1734:com.apple.CFNetwork.StorageDB
default	15:40:20.636464-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:20.636941-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:20.637098-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:20.734836-0500	RedLemon	Task <6D776395-A356-4481-AA6F-DB5F096FC0B2>.<369> received response, status 200 content U
default	15:40:20.785954-0500	RedLemon	Task <6D776395-A356-4481-AA6F-DB5F096FC0B2>.<369> done using Connection 21
default	15:40:20.786253-0500	RedLemon	Task <6D776395-A356-4481-AA6F-DB5F096FC0B2>.<369> response ended
default	15:40:20.786519-0500	RedLemon	Task <6D776395-A356-4481-AA6F-DB5F096FC0B2>.<369> summary for task success {transaction_duration_ms=301, response_status=200, connection=21, reused=1, request_start_ms=3, request_duration_ms=0, response_start_ms=249, response_duration_ms=51, request_bytes=483, response_bytes=6669, cache_hit=true}
default	15:40:20.786870-0500	RedLemon	Task <6D776395-A356-4481-AA6F-DB5F096FC0B2>.<369> finished successfully
default	15:40:20.796961-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 207
default	15:40:20.797168-0500	RedLemon	   INPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	15:40:20.797329-0500	RedLemon	   INPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean
default	15:40:20.797481-0500	RedLemon	   INPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean
default	15:40:20.797630-0500	RedLemon	   INPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	15:40:20.797768-0500	RedLemon	   INPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:40:20.797910-0500	RedLemon	   INPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	15:40:20.798058-0500	RedLemon	   INPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	15:40:20.798203-0500	RedLemon	   INPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	15:40:20.798345-0500	RedLemon	   INPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	15:40:20.798500-0500	RedLemon	   INPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean
default	15:40:20.798650-0500	RedLemon	   INPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	15:40:20.798947-0500	RedLemon	   INPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	15:40:20.799195-0500	RedLemon	   INPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean
default	15:40:20.799463-0500	RedLemon	   INPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:40:20.799647-0500	RedLemon	   INPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:40:20.799807-0500	RedLemon	   INPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean
default	15:40:20.799954-0500	RedLemon	   INPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	15:40:20.800105-0500	RedLemon	   INPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	15:40:20.800426-0500	RedLemon	   INPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	15:40:20.800681-0500	RedLemon	   INPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	15:40:20.800964-0500	RedLemon	   INPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	15:40:20.801223-0500	RedLemon	   INPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	15:40:20.801418-0500	RedLemon	   INPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	15:40:20.801604-0500	RedLemon	   INPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	15:40:20.802761-0500	RedLemon	   INPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	15:40:20.803287-0500	RedLemon	   INPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean
default	15:40:20.803467-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	15:40:20.803601-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	15:40:20.803915-0500	RedLemon	   INPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	15:40:20.804126-0500	RedLemon	   INPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	15:40:20.804280-0500	RedLemon	   INPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	15:40:20.804423-0500	RedLemon	   INPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	15:40:20.804543-0500	RedLemon	   INPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	15:40:20.804694-0500	RedLemon	   INPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	15:40:20.804820-0500	RedLemon	   INPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	15:40:20.805139-0500	RedLemon	   INPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	15:40:20.805319-0500	RedLemon	   INPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	15:40:20.805458-0500	RedLemon	   INPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	15:40:20.805583-0500	RedLemon	   INPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	15:40:20.805947-0500	RedLemon	   INPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	15:40:20.806082-0500	RedLemon	   INPUT[40]: FRANKENSTEIN mkv | Unknown | zilean
default	15:40:20.806214-0500	RedLemon	   INPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	15:40:20.806344-0500	RedLemon	   INPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	15:40:20.806472-0500	RedLemon	   INPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	15:40:20.806602-0500	RedLemon	   INPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	15:40:20.807388-0500	RedLemon	   INPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	15:40:20.810602-0500	RedLemon	   INPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	15:40:20.810996-0500	RedLemon	   INPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	15:40:20.811312-0500	RedLemon	   INPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	15:40:20.811583-0500	RedLemon	   INPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	15:40:20.811861-0500	RedLemon	   INPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	15:40:20.812042-0500	RedLemon	   INPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	15:40:20.812195-0500	RedLemon	   INPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	15:40:20.812374-0500	RedLemon	   INPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	15:40:20.812522-0500	RedLemon	   INPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	15:40:20.812661-0500	RedLemon	   INPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	15:40:20.812796-0500	RedLemon	   INPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	15:40:20.812983-0500	RedLemon	   INPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	15:40:20.813494-0500	RedLemon	   INPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	15:40:20.813687-0500	RedLemon	   INPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	15:40:20.813888-0500	RedLemon	   INPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	15:40:20.814093-0500	RedLemon	   INPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	15:40:20.814240-0500	RedLemon	   INPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	15:40:20.814438-0500	RedLemon	   INPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	15:40:20.814625-0500	RedLemon	   INPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	15:40:20.814769-0500	RedLemon	   INPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	15:40:20.814939-0500	RedLemon	   INPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	15:40:20.815180-0500	RedLemon	   INPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	15:40:20.815370-0500	RedLemon	   INPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	15:40:20.816581-0500	RedLemon	   INPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	15:40:20.816896-0500	RedLemon	   INPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	15:40:20.817440-0500	RedLemon	   INPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	15:40:20.817667-0500	RedLemon	   INPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	15:40:20.817846-0500	RedLemon	   INPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
default	15:40:20.817981-0500	RedLemon	   INPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	15:40:20.820872-0500	RedLemon	   INPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	15:40:20.821027-0500	RedLemon	   INPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	15:40:20.824666-0500	RedLemon	   INPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	15:40:20.825459-0500	RedLemon	   INPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	15:40:20.826008-0500	RedLemon	   INPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	15:40:20.826210-0500	RedLemon	   INPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	15:40:20.826534-0500	RedLemon	   INPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:40:20.826877-0500	RedLemon	   INPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	15:40:20.827039-0500	RedLemon	   INPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:40:20.827169-0500	RedLemon	   INPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
default	15:40:20.827389-0500	RedLemon	   INPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	15:40:20.827761-0500	RedLemon	   INPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	15:40:20.827868-0500	RedLemon	   INPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	15:40:20.827981-0500	RedLemon	   INPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	15:40:20.828229-0500	RedLemon	   INPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:40:20.828372-0500	RedLemon	   INPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	15:40:20.828485-0500	RedLemon	   INPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:20.828912-0500	RedLemon	   INPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	15:40:20.829046-0500	RedLemon	   INPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:20.829335-0500	RedLemon	   INPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:40:20.829457-0500	RedLemon	   INPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:40:20.829564-0500	RedLemon	   INPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:20.830039-0500	RedLemon	   INPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:20.830435-0500	RedLemon	   INPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:20.835208-0500	RedLemon	   INPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:40:20.837347-0500	RedLemon	   INPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	15:40:20.837480-0500	RedLemon	   INPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	15:40:20.837733-0500	RedLemon	   INPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:20.837831-0500	RedLemon	   INPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	15:40:20.838201-0500	RedLemon	   INPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:20.838308-0500	RedLemon	   INPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:20.838711-0500	RedLemon	   INPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:20.936206-0500	RedLemon	   INPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	15:40:20.939724-0500	RedLemon	   INPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	15:40:20.939846-0500	RedLemon	   INPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	15:40:20.939949-0500	RedLemon	   INPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	15:40:20.940056-0500	RedLemon	   INPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:20.940165-0500	RedLemon	   INPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	15:40:20.940268-0500	RedLemon	   INPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:20.940362-0500	RedLemon	   INPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	15:40:20.940468-0500	RedLemon	   INPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:40:20.940582-0500	RedLemon	   INPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:40:20.940680-0500	RedLemon	   INPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	15:40:20.941495-0500	RedLemon	   INPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:40:20.941626-0500	RedLemon	   INPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:20.941735-0500	RedLemon	   INPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	15:40:20.941837-0500	RedLemon	   INPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:20.942025-0500	RedLemon	   INPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:20.942161-0500	RedLemon	   INPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:20.942553-0500	RedLemon	   INPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	15:40:20.942717-0500	RedLemon	   INPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:20.942837-0500	RedLemon	   INPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:20.942956-0500	RedLemon	   INPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:40:20.943067-0500	RedLemon	   INPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	15:40:20.943181-0500	RedLemon	   INPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	15:40:20.943291-0500	RedLemon	   INPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	15:40:20.945593-0500	RedLemon	   INPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	15:40:20.945719-0500	RedLemon	   INPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:40:20.945825-0500	RedLemon	   INPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	15:40:20.945921-0500	RedLemon	   INPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:40:20.947379-0500	RedLemon	   INPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	15:40:20.947504-0500	RedLemon	   INPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	15:40:20.949023-0500	RedLemon	   INPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:40:20.949661-0500	RedLemon	   INPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	15:40:20.949776-0500	RedLemon	   INPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:20.949873-0500	RedLemon	   INPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	15:40:20.949975-0500	RedLemon	   INPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	15:40:20.950078-0500	RedLemon	   INPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	15:40:20.950187-0500	RedLemon	   INPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	15:40:20.951836-0500	RedLemon	   INPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	15:40:20.952171-0500	RedLemon	   INPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	15:40:20.952382-0500	RedLemon	   INPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	15:40:20.952503-0500	RedLemon	   INPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	15:40:20.952693-0500	RedLemon	   INPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	15:40:20.952832-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.953043-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.953192-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.953381-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.953547-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.953767-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.953874-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.953965-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954050-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954132-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954214-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954293-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954374-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954456-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954534-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954611-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954688-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954780-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954865-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.954946-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.955025-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.955104-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.955180-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.955297-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.955388-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.955558-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:20.955776-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.955890-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.955984-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.956072-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.956150-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.956228-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.956310-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.956391-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.956470-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.956549-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.956626-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957056-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957155-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957242-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957324-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957407-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957488-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957561-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957636-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957707-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957786-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957864-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.957942-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.958020-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:20.958098-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	15:40:20.958177-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 720p | 720p | comet
default	15:40:20.958252-0500	RedLemon	   INPUT[201]: [RD⚡] Comet 720p | 720p | comet
default	15:40:20.958332-0500	RedLemon	   INPUT[202]: [RD⚡] Comet 480p | 480p | comet
default	15:40:20.958414-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	15:40:20.958609-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	15:40:20.958729-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	15:40:20.958853-0500	RedLemon	   INPUT[206]: [RD⚡] Comet unknown | unknown | comet
default	15:40:20.959022-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	15:40:20.959295-0500	RedLemon	Task <AECD69AF-C4AB-4523-97C6-D88F1CC84EC6>.<371> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:20.959640-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [84095B26-F8AF-4DE5-A290-4842A0CBFEA0] (reporting strategy default)> on Task <AECD69AF-C4AB-4523-97C6-D88F1CC84EC6>.<371> was not selected for reporting
default	15:40:20.960442-0500	RedLemon	Task <AECD69AF-C4AB-4523-97C6-D88F1CC84EC6>.<371> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:20.960689-0500	RedLemon	Task <AECD69AF-C4AB-4523-97C6-D88F1CC84EC6>.<371> now using Connection 24
default	15:40:20.961648-0500	RedLemon	0x7fe7659ece38 ID=4 Task <AECD69AF-C4AB-4523-97C6-D88F1CC84EC6>.<371> sent request, body N 0
default	15:40:21.024142-0500	RedLemon	Task <2A88F08A-838C-4E36-9434-3E87A64BB5CA>.<364> received response, status 200 content U
default	15:40:21.129736-0500	RedLemon	0x7fe7659ece38 ID=4 Task <AECD69AF-C4AB-4523-97C6-D88F1CC84EC6>.<371> received response, status 200 content K
default	15:40:21.130372-0500	RedLemon	Task <AECD69AF-C4AB-4523-97C6-D88F1CC84EC6>.<371> response ended
default	15:40:21.130865-0500	RedLemon	Task <AECD69AF-C4AB-4523-97C6-D88F1CC84EC6>.<371> done using Connection 24
default	15:40:21.131165-0500	RedLemon	Task <AECD69AF-C4AB-4523-97C6-D88F1CC84EC6>.<371> summary for task success {transaction_duration_ms=171, response_status=200, connection=24, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=169, response_duration_ms=1, request_bytes=166, response_bytes=1385, cache_hit=true}
default	15:40:21.131625-0500	RedLemon	Task <AECD69AF-C4AB-4523-97C6-D88F1CC84EC6>.<371> finished successfully
default	15:40:21.133599-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	15:40:21.133869-0500	RedLemon	✅ Filtered to 4 English subtitles
default	15:40:21.134319-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	15:40:21.134485-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	15:40:21.134936-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.135103-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.135221-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.135523-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.135660-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.135778-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.136080-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.136239-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.136545-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.136703-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.136987-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.137094-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.137213-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.137535-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.137742-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.138195-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.138338-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.138948-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.139216-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.139369-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.139688-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.139848-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.140172-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.140470-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.140607-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.140907-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.141060-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.141382-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.141511-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.141803-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.141940-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.142235-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.142441-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.143105-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.143471-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.144556-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.145003-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.145253-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.145724-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.145878-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.146158-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.146296-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.146393-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.146656-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.146791-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.147078-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.147336-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.147788-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.147975-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.148274-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.148408-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.148807-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.148937-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.149230-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.149386-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.149722-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.150038-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.150557-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.150923-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.151168-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.151689-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.151824-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.152260-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.152364-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.152476-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.152767-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.152934-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.153256-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.153562-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.153844-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.154457-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.155811-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.156553-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.157047-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.157301-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.157603-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.157898-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.158195-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.160993-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.163674-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.164160-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.164459-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.165033-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.165201-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.165546-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.165648-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.166057-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.166186-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.166558-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.166708-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.167140-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.167710-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.168410-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.168734-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.169091-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.169945-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.170362-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.170691-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.170838-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.171133-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.171245-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.171472-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.171545-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.172751-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.173125-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.173962-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.174185-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.174570-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.174671-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.174961-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.175081-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.175431-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.175590-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.176533-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.176737-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.177017-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.178987-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.179547-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.179910-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.181523-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.182107-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.182991-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.183284-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.183542-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.186634-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.187592-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.188019-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.188733-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.188946-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.189285-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.190016-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.190486-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.190838-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.191006-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.191303-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.191405-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.191648-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.194643-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.195373-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.195575-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.196212-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.197396-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.198168-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.198468-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.198779-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.199249-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.199421-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.199804-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.199978-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.202385-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.203212-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.203562-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.204263-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.204698-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.205100-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.205420-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.205562-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.205862-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.206207-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.206624-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.207298-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.207622-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.208220-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.215033-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.215713-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.215861-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.215965-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.216249-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.216407-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.216555-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.217905-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.218890-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.219374-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.219554-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.220416-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.220585-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.220719-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.221056-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.221569-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.222318-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.222944-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.223390-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.223695-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.223839-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.224126-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.226495-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.226711-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.227129-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.227463-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.228977-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.231622-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.231983-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.232858-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.233047-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.233539-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.234394-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.235604-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.235795-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.236504-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.236721-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.237319-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.237528-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.237675-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.238964-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.239154-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.239334-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.239772-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.240168-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.240510-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.240865-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.241395-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.241558-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.243104-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.243344-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.244077-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.244301-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.245805-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.248645-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.248567-0500	RedLemon	Task <2A88F08A-838C-4E36-9434-3E87A64BB5CA>.<364> done using Connection 21
default	15:40:21.249253-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.249659-0500	RedLemon	Task <2A88F08A-838C-4E36-9434-3E87A64BB5CA>.<364> response ended
default	15:40:21.250085-0500	RedLemon	Task <2A88F08A-838C-4E36-9434-3E87A64BB5CA>.<364> summary for task success {transaction_duration_ms=955, response_status=200, connection=21, reused=1, request_start_ms=2, request_duration_ms=0, response_start_ms=729, response_duration_ms=225, request_bytes=483, response_bytes=6873, cache_hit=true}
default	15:40:21.250180-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.250463-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.250482-0500	RedLemon	Task <2A88F08A-838C-4E36-9434-3E87A64BB5CA>.<364> finished successfully
default	15:40:21.250675-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.254118-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.254338-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.255287-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.255475-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.255842-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.256767-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.257139-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.257277-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.257575-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.257736-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.258004-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.261473-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.262085-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.262250-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.262566-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.262729-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.262984-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.263418-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.263693-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.264727-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.265050-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.265369-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.265964-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.266165-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.266627-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.268193-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.269093-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.269885-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.270054-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.270195-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.271187-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.273082-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.273469-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.273590-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.273808-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.273916-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.274127-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.274256-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.277226-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.277386-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.278672-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.278968-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.279100-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.279871-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.280270-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.281368-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.282470-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.283153-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.283912-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.284390-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.285119-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.285665-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.286108-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.286269-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.286561-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.286856-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.287205-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.287695-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.288513-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.288841-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.288995-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.289426-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.289558-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.289700-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.290199-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.290520-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.290947-0500	RedLemon	🔍 DEBUG: attachSubtitles INPUT - streams.count: 207
default	15:40:21.290960-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.291161-0500	RedLemon	   INPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	15:40:21.291178-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.291335-0500	RedLemon	   INPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean
default	15:40:21.291379-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.291488-0500	RedLemon	   INPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean
default	15:40:21.291635-0500	RedLemon	   INPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	15:40:21.291712-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.291774-0500	RedLemon	   INPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:40:21.291836-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.291906-0500	RedLemon	   INPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	15:40:21.292171-0500	RedLemon	   INPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean
default	15:40:21.292387-0500	RedLemon	   INPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean
default	15:40:21.292830-0500	RedLemon	   INPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	15:40:21.293123-0500	RedLemon	   INPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean
default	15:40:21.293438-0500	RedLemon	   INPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean
default	15:40:21.294398-0500	RedLemon	   INPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	15:40:21.294831-0500	RedLemon	   INPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean
default	15:40:21.295275-0500	RedLemon	   INPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:40:21.295679-0500	RedLemon	   INPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean
default	15:40:21.296045-0500	RedLemon	   INPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean
default	15:40:21.297035-0500	RedLemon	   INPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean
default	15:40:21.297625-0500	RedLemon	   INPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean
default	15:40:21.298037-0500	RedLemon	   INPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean
default	15:40:21.298090-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.298513-0500	RedLemon	   INPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean
default	15:40:21.299133-0500	RedLemon	   INPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean
default	15:40:21.299515-0500	RedLemon	   INPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean
default	15:40:21.299932-0500	RedLemon	   INPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean
default	15:40:21.300293-0500	RedLemon	   INPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean
default	15:40:21.301132-0500	RedLemon	   INPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean
default	15:40:21.301420-0500	RedLemon	   INPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean
default	15:40:21.301609-0500	RedLemon	   INPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean
default	15:40:21.301773-0500	RedLemon	   INPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean
default	15:40:21.301914-0500	RedLemon	   INPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean
default	15:40:21.302062-0500	RedLemon	   INPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean
default	15:40:21.302259-0500	RedLemon	   INPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean
default	15:40:21.302406-0500	RedLemon	   INPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean
default	15:40:21.302541-0500	RedLemon	   INPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean
default	15:40:21.302676-0500	RedLemon	   INPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean
default	15:40:21.302814-0500	RedLemon	   INPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean
default	15:40:21.302949-0500	RedLemon	   INPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	15:40:21.303087-0500	RedLemon	   INPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean
default	15:40:21.303229-0500	RedLemon	   INPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean
default	15:40:21.303364-0500	RedLemon	   INPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean
default	15:40:21.303503-0500	RedLemon	   INPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean
default	15:40:21.303642-0500	RedLemon	   INPUT[40]: FRANKENSTEIN mkv | Unknown | zilean
default	15:40:21.303775-0500	RedLemon	   INPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean
default	15:40:21.303952-0500	RedLemon	   INPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean
default	15:40:21.304188-0500	RedLemon	   INPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean
default	15:40:21.304478-0500	RedLemon	   INPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean
default	15:40:21.305053-0500	RedLemon	   INPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean
default	15:40:21.305227-0500	RedLemon	   INPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean
default	15:40:21.305385-0500	RedLemon	   INPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean
default	15:40:21.305533-0500	RedLemon	   INPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean
default	15:40:21.305677-0500	RedLemon	   INPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean
default	15:40:21.305960-0500	RedLemon	   INPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean
default	15:40:21.304555-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.306236-0500	RedLemon	   INPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean
default	15:40:21.306627-0500	RedLemon	   INPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean
default	15:40:21.306623-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.306796-0500	RedLemon	   INPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean
default	15:40:21.307204-0500	RedLemon	   INPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean
default	15:40:21.307440-0500	RedLemon	   INPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean
default	15:40:21.307641-0500	RedLemon	   INPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean
default	15:40:21.307871-0500	RedLemon	   INPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean
default	15:40:21.308057-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.308049-0500	RedLemon	   INPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean
default	15:40:21.308280-0500	RedLemon	   INPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean
default	15:40:21.308464-0500	RedLemon	   INPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean
default	15:40:21.308734-0500	RedLemon	   INPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean
default	15:40:21.309053-0500	RedLemon	   INPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean
default	15:40:21.309057-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.309279-0500	RedLemon	   INPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean
default	15:40:21.309518-0500	RedLemon	   INPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean
default	15:40:21.309720-0500	RedLemon	   INPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean
default	15:40:21.309895-0500	RedLemon	   INPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean
default	15:40:21.310748-0500	RedLemon	   INPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean
default	15:40:21.311611-0500	RedLemon	   INPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean
default	15:40:21.311845-0500	RedLemon	   INPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean
default	15:40:21.312115-0500	RedLemon	   INPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean
default	15:40:21.312299-0500	RedLemon	   INPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean
default	15:40:21.312412-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.312545-0500	RedLemon	   INPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean
default	15:40:21.312771-0500	RedLemon	   INPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean
default	15:40:21.313086-0500	RedLemon	   INPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean
default	15:40:21.313365-0500	RedLemon	   INPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean
default	15:40:21.313580-0500	RedLemon	   INPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean
default	15:40:21.313771-0500	RedLemon	   INPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean
default	15:40:21.314090-0500	RedLemon	   INPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean
default	15:40:21.314349-0500	RedLemon	   INPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean
default	15:40:21.314388-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.314681-0500	RedLemon	   INPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean
default	15:40:21.314857-0500	RedLemon	   INPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:40:21.314990-0500	RedLemon	   INPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio
default	15:40:21.315113-0500	RedLemon	   INPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:40:21.315228-0500	RedLemon	   INPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio
default	15:40:21.315335-0500	RedLemon	   INPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio
default	15:40:21.315437-0500	RedLemon	   INPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio
default	15:40:21.315535-0500	RedLemon	   INPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio
default	15:40:21.315872-0500	RedLemon	   INPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio
default	15:40:21.316178-0500	RedLemon	   INPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio
default	15:40:21.316356-0500	RedLemon	   INPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio
default	15:40:21.316400-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.316481-0500	RedLemon	   INPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:21.316586-0500	RedLemon	   INPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio
default	15:40:21.316684-0500	RedLemon	   INPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:21.316787-0500	RedLemon	   INPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:40:21.316890-0500	RedLemon	   INPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:40:21.317011-0500	RedLemon	   INPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:21.317643-0500	RedLemon	   INPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:21.317958-0500	RedLemon	   INPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:21.318161-0500	RedLemon	   INPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:40:21.318559-0500	RedLemon	   INPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio
default	15:40:21.318723-0500	RedLemon	   INPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	15:40:21.318980-0500	RedLemon	   INPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:21.319135-0500	RedLemon	   INPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio
default	15:40:21.319289-0500	RedLemon	   INPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:21.319626-0500	RedLemon	   INPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:21.319833-0500	RedLemon	   INPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:21.320018-0500	RedLemon	   INPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	15:40:21.320287-0500	RedLemon	   INPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio
default	15:40:21.320436-0500	RedLemon	   INPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio
default	15:40:21.320599-0500	RedLemon	   INPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio
default	15:40:21.320729-0500	RedLemon	   INPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:21.321048-0500	RedLemon	   INPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio
default	15:40:21.321198-0500	RedLemon	   INPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:21.321759-0500	RedLemon	   INPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio
default	15:40:21.321868-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.321948-0500	RedLemon	   INPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:40:21.322417-0500	RedLemon	   INPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:40:21.322671-0500	RedLemon	   INPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio
default	15:40:21.322804-0500	RedLemon	   INPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio
default	15:40:21.322993-0500	RedLemon	   INPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:21.323131-0500	RedLemon	   INPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio
default	15:40:21.323240-0500	RedLemon	   INPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:21.323394-0500	RedLemon	   INPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:21.323514-0500	RedLemon	   INPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:21.323621-0500	RedLemon	   INPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio
default	15:40:21.323760-0500	RedLemon	   INPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio
default	15:40:21.323889-0500	RedLemon	   INPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:21.324012-0500	RedLemon	   INPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio
default	15:40:21.324124-0500	RedLemon	   INPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio
default	15:40:21.324242-0500	RedLemon	   INPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio
default	15:40:21.324350-0500	RedLemon	   INPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio
default	15:40:21.324451-0500	RedLemon	   INPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio
default	15:40:21.324587-0500	RedLemon	   INPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:40:21.324843-0500	RedLemon	   INPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio
default	15:40:21.324976-0500	RedLemon	   INPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:40:21.325134-0500	RedLemon	   INPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio
default	15:40:21.325280-0500	RedLemon	   INPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio
default	15:40:21.325578-0500	RedLemon	   INPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio
default	15:40:21.325714-0500	RedLemon	   INPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio
default	15:40:21.326014-0500	RedLemon	   INPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio
default	15:40:21.326616-0500	RedLemon	   INPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio
default	15:40:21.326934-0500	RedLemon	   INPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio
default	15:40:21.327110-0500	RedLemon	   INPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	15:40:21.327198-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.327450-0500	RedLemon	   INPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio
default	15:40:21.327666-0500	RedLemon	   INPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	15:40:21.327842-0500	RedLemon	   INPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio
default	15:40:21.328027-0500	RedLemon	   INPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio
default	15:40:21.328155-0500	RedLemon	   INPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio
default	15:40:21.328381-0500	RedLemon	   INPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio
default	15:40:21.328494-0500	RedLemon	   INPUT[149]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.328632-0500	RedLemon	   INPUT[150]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.328718-0500	RedLemon	   INPUT[151]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.328838-0500	RedLemon	   INPUT[152]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.329040-0500	RedLemon	   INPUT[153]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.329235-0500	RedLemon	   INPUT[154]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.329426-0500	RedLemon	   INPUT[155]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.329622-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.329626-0500	RedLemon	   INPUT[156]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.329739-0500	RedLemon	   INPUT[157]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.329829-0500	RedLemon	   INPUT[158]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.329977-0500	RedLemon	   INPUT[159]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.330075-0500	RedLemon	   INPUT[160]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.330166-0500	RedLemon	   INPUT[161]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.330378-0500	RedLemon	   INPUT[162]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.330679-0500	RedLemon	   INPUT[163]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.330948-0500	RedLemon	   INPUT[164]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.331249-0500	RedLemon	   INPUT[165]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.331407-0500	RedLemon	   INPUT[166]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.331661-0500	RedLemon	   INPUT[167]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.331811-0500	RedLemon	   INPUT[168]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.331919-0500	RedLemon	   INPUT[169]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.332052-0500	RedLemon	   INPUT[170]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.332145-0500	RedLemon	   INPUT[171]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.332334-0500	RedLemon	   INPUT[172]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.332465-0500	RedLemon	   INPUT[173]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.332557-0500	RedLemon	   INPUT[174]: [RD⚡] Comet 2160p | 2160p | comet
default	15:40:21.332648-0500	RedLemon	   INPUT[175]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.332731-0500	RedLemon	   INPUT[176]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.332838-0500	RedLemon	   INPUT[177]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.332952-0500	RedLemon	   INPUT[178]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.333087-0500	RedLemon	   INPUT[179]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.333273-0500	RedLemon	   INPUT[180]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.333412-0500	RedLemon	   INPUT[181]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.333508-0500	RedLemon	   INPUT[182]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.333785-0500	RedLemon	   INPUT[183]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.334109-0500	RedLemon	   INPUT[184]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.334218-0500	RedLemon	   INPUT[185]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.334315-0500	RedLemon	   INPUT[186]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.334403-0500	RedLemon	   INPUT[187]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.334487-0500	RedLemon	   INPUT[188]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.334573-0500	RedLemon	   INPUT[189]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.334706-0500	RedLemon	   INPUT[190]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.334805-0500	RedLemon	   INPUT[191]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.334896-0500	RedLemon	   INPUT[192]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.334980-0500	RedLemon	   INPUT[193]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.335062-0500	RedLemon	   INPUT[194]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.335190-0500	RedLemon	   INPUT[195]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.335278-0500	RedLemon	   INPUT[196]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.335361-0500	RedLemon	   INPUT[197]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.335443-0500	RedLemon	   INPUT[198]: [RD⚡] Comet 1080p | 1080p | comet
default	15:40:21.335989-0500	RedLemon	   INPUT[199]: [RD⚡] Comet 720p | 720p | comet
default	15:40:21.336169-0500	RedLemon	   INPUT[200]: [RD⚡] Comet 720p | 720p | comet
default	15:40:21.336277-0500	RedLemon	   INPUT[201]: [RD⚡] Comet 720p | 720p | comet
default	15:40:21.336364-0500	RedLemon	   INPUT[202]: [RD⚡] Comet 480p | 480p | comet
default	15:40:21.336579-0500	RedLemon	   INPUT[203]: [RD⚡] Comet unknown | unknown | comet
default	15:40:21.336733-0500	RedLemon	   INPUT[204]: [RD⚡] Comet unknown | unknown | comet
default	15:40:21.336815-0500	RedLemon	   INPUT[205]: [RD⚡] Comet unknown | unknown | comet
default	15:40:21.336939-0500	RedLemon	   INPUT[206]: [RD⚡] Comet unknown | unknown | comet
default	15:40:21.337110-0500	RedLemon	🔍 Searching SubDL for subtitles: tt1312221 (movie)
default	15:40:21.337600-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.337728-0500	RedLemon	Task <1BF878CC-EC66-4681-A7AA-D502158E85B0>.<372> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:21.338046-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.338407-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [88D81F2A-4342-4BE4-979A-43A01ED05B38] (reporting strategy default)> on Task <1BF878CC-EC66-4681-A7AA-D502158E85B0>.<372> was not selected for reporting
default	15:40:21.338681-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.339041-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.339365-0500	RedLemon	Task <1BF878CC-EC66-4681-A7AA-D502158E85B0>.<372> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:21.339622-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.339632-0500	RedLemon	Task <1BF878CC-EC66-4681-A7AA-D502158E85B0>.<372> now using Connection 24
default	15:40:21.340048-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.340672-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.340856-0500	RedLemon	0x7fe7683af7c8 ID=8 Task <1BF878CC-EC66-4681-A7AA-D502158E85B0>.<372> sent request, body N 0
default	15:40:21.341476-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.341753-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.342518-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.343000-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.345740-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.346076-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.346714-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.346889-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.347743-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.348305-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.348650-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.348961-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.349504-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.349874-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.350330-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.350836-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.351130-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.351743-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.351924-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.352309-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.352711-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.353343-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.353748-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.354160-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.354465-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.355001-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.355212-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.355509-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.356072-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.356327-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.356939-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.357156-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.358100-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.358316-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.358975-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.359348-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.359925-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.360503-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.360711-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.361360-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.362076-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.366266-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.367168-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.367986-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.368489-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.368845-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.369332-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.370354-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.371234-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.371803-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.372378-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.373100-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.373305-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.373553-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.374042-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.374221-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.374743-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.375195-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.375461-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.376141-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.376661-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.377512-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.378662-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.379189-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.379437-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.380305-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.381592-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.383725-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.384500-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.385478-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.385961-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.386543-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.386823-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.387392-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.387788-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.388739-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.388991-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.389586-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.390589-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.391150-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.391289-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.391885-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.392534-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.394074-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.395136-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.396157-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.396424-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.396672-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.397281-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.397552-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.397834-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.398369-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.398577-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.399059-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.399275-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.399827-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.400003-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.400665-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.400952-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.401556-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.402450-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.403244-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.403851-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.404079-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.404697-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.405003-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.405395-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.405603-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.406158-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.410381-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.416089-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.422374-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.423230-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.423568-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.423707-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.423815-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.424264-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.424417-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.424812-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.424951-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.425051-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.427794-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.428014-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.428162-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.428591-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.428931-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.431284-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.431678-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.432768-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.433166-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.433866-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.436935-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.437156-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.437947-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.438122-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.438261-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.438585-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.439013-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.439428-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.439807-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.439980-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.440256-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.440809-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.441080-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.441427-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.441560-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.444129-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.444531-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.444737-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.445146-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.445312-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.445807-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.446774-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.446954-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.447221-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.448790-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.449753-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.451176-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.453269-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.453459-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.454054-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.454266-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.454416-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.455311-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.455538-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.456439-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.456829-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.456958-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.457376-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.457647-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.457961-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.458256-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.458401-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.458666-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.462444-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.462701-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.463037-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.463416-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.466048-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.466927-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.467955-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.469564-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.469922-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.470240-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.470722-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.470890-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.471784-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.473124-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.473299-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.473927-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.474066-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.474168-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.474489-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.474772-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.474885-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.475240-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.477382-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.478144-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.478575-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.478867-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.479285-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.479548-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.479897-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.480551-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.480830-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.483220-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.483583-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.483789-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.485965-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.486799-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.486990-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.488367-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.488790-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.489213-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.490250-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.490597-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.490948-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.491080-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.491194-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.491539-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.491672-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.492016-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.492285-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.492409-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.492801-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.495104-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.495343-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.497476-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.498219-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.498783-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.499197-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.499490-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.500355-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.500636-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.503881-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.504379-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.504872-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.505134-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.505230-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.505299-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.505450-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.505518-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.506956-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.507323-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.507467-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.508162-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.508284-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.511902-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.512350-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.513351-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.513637-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.515162-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.516278-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.516606-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.518497-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.519248-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.519685-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.520418-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.522054-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.522753-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.523005-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.523416-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.523633-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.523791-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.524795-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.524924-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.525559-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.527617-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.528227-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.529541-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.530261-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.530436-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.531939-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.532428-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.533574-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.535054-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.537398-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.537589-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.538701-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.539280-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.540025-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.540445-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.540754-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.541369-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.541619-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.542395-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.543154-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.543576-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.546415-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.547101-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.549499-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.550661-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.551264-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.551599-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.552568-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.552783-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.553280-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.555233-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.556082-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.556590-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.556993-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.557883-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.558046-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.558624-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.559741-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.560378-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.562668-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.563154-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.564399-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.565053-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.565668-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.566907-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.567297-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.569443-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.569909-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.570564-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.570847-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.571338-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.571969-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.572423-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.572652-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.573154-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.573436-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.573930-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.574412-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.574759-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.575875-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.576381-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.578555-0500	RedLemon	SWIFT TASK CONTINUATION MISUSE: waitForAuthAck(timeout:) leaked its continuation!
default	15:40:21.579122-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.579452-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.579621-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.580461-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.580710-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.580928-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.581532-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.581842-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.582312-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.582524-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.582676-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.583190-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.583439-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.583796-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.584800-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.585566-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.586831-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.587394-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.587555-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.588361-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.588964-0500	runningboardd	Invalidating assertion 166-4995-1734 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:21.588953-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.589737-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.590012-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.590667-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.591166-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.591443-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.592591-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.592833-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.593286-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.593944-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.594388-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.594609-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.595252-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.595516-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.595788-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.596381-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.596570-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.599183-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.600052-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.600493-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.602205-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.602499-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.603470-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.603732-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.604496-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.605026-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.605607-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.605974-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.606726-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.607075-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.607290-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.607722-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.607918-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.608356-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.609038-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.609729-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.610254-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.611207-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.612660-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.612912-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.613198-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.613934-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.614429-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.615139-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.615478-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.616019-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.616595-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.617207-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.617839-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.618168-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.618638-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.619103-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.619374-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.620557-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.620831-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.621656-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.622415-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.623567-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.623941-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.624644-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.625368-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.625900-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.626255-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.626729-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.627794-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.628753-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.628998-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.629662-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.629858-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.630811-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.631983-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.632533-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.634269-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.635567-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.635899-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.636720-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.636949-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.637211-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.638370-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.638659-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.639509-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.639883-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.640074-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.640547-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.640773-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.641191-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.641347-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.641872-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.642070-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.642677-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.642863-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.643162-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.643749-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.645704-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.645992-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.646508-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.646799-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.647001-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.647445-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.647613-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.647849-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.648258-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.648436-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.648932-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.649132-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.649389-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.649889-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.650058-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.650300-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.651348-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.651712-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.652311-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.652995-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.653182-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.653348-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.653884-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.654036-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.654298-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.654448-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.654593-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.655015-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.655167-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.655555-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.655675-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.655812-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.656286-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.656390-0500	RedLemon	0x7fe7683af7c8 ID=8 Task <1BF878CC-EC66-4681-A7AA-D502158E85B0>.<372> received response, status 200 content K
default	15:40:21.656544-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.656689-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.656877-0500	RedLemon	Task <1BF878CC-EC66-4681-A7AA-D502158E85B0>.<372> response ended
default	15:40:21.657140-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.657440-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.657561-0500	RedLemon	Task <1BF878CC-EC66-4681-A7AA-D502158E85B0>.<372> done using Connection 24
default	15:40:21.657581-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.657994-0500	RedLemon	Task <1BF878CC-EC66-4681-A7AA-D502158E85B0>.<372> summary for task success {transaction_duration_ms=319, response_status=200, connection=24, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=317, response_duration_ms=1, request_bytes=166, response_bytes=1385, cache_hit=true}
default	15:40:21.658103-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.658190-0500	RedLemon	Task <1BF878CC-EC66-4681-A7AA-D502158E85B0>.<372> finished successfully
default	15:40:21.658245-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.658365-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.658693-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.658953-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.659107-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.659976-0500	RedLemon	✅ Found 4 total subtitle options from SubDL
default	15:40:21.660077-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.660191-0500	RedLemon	✅ Filtered to 4 English subtitles
default	15:40:21.660238-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.660336-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.660439-0500	RedLemon	✅ Filtered out 0 problematic subtitle versions
default	15:40:21.660589-0500	RedLemon	✅ Movie or no episode specified, using top 3 English subtitle options
default	15:40:21.660612-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.660736-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.660830-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.661027-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.661060-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.661185-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.661230-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.661505-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.661561-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.661695-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.661714-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.661879-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.662026-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.662152-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.662260-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.662400-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.662568-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.662580-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.662771-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.662827-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.662895-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.662946-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.663175-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.663278-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.663374-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.663572-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.663623-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.663747-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.663767-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.663974-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.664084-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.664293-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.664408-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.664437-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.664514-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.664642-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.664757-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.664827-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.664872-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.665108-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.665117-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.665370-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.665385-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.665486-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.665515-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.665728-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.665858-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.666029-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.666111-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.666207-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.666207-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.666356-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.666450-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.666553-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.666749-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.666775-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.666898-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.666930-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.667119-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.667126-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.667277-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.667385-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.667732-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.667814-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.667870-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.668015-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.668118-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.668246-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.668428-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.668467-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.668577-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.668670-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.668693-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.668842-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.668905-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.669020-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.669230-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.669241-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.669357-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.669471-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.669610-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.669641-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.669711-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.669944-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.670008-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.670052-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.670177-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.670298-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.670428-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.670653-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.670766-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.670885-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.670949-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.671056-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.671148-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.671159-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.671247-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.671406-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.671626-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.671641-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.671756-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.671869-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.672010-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.672144-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.672252-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.672307-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.672427-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.672600-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.672774-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.672776-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.672902-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.673018-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.673127-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.673185-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.673249-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.673505-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.673598-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.673747-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.673790-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.673856-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.674118-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.674194-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.674330-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.674356-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.674439-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.674700-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.674802-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.674942-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.675029-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.675048-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.675168-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.675328-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.675487-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.675628-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.675745-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.675857-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.675973-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.676194-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.676198-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.676379-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.676693-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.676776-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.676925-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.676981-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.677021-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.677242-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.677318-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.677372-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.677566-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.677774-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.678069-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.678359-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.678390-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.678550-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.678674-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.678688-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.678786-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.678985-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.679027-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.679122-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.679151-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.679411-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.679447-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.679519-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.679560-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.679656-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.679761-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.679872-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.679907-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.680030-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.680124-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.680248-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.680342-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.680494-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.680521-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.680742-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.680785-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.680864-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.680897-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.680968-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.681157-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.681205-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.681288-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.681301-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.681638-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.681675-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.681745-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.681826-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.681924-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.682082-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.682267-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.682337-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.682404-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.682466-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.682521-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.682581-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.682812-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.682846-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.682945-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.682987-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.683109-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.683186-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.683296-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.683475-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.683521-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.683614-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.683643-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.683706-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.683886-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.684000-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.684026-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.684094-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.684114-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.684322-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.684400-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.684426-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.684520-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.684552-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.684675-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.685039-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.685182-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.685405-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.685420-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.685534-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.685626-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.685693-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.685866-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.685975-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.686078-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.686196-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.686322-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.686351-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.686450-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.686495-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.686713-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.686912-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.686944-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.687053-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.687194-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.687294-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.687419-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.687438-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.687658-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.687755-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.687975-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.688081-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.688101-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.688250-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.688338-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.688453-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.688668-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.688781-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.688792-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.688977-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.689007-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.689111-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.689210-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.689448-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.689465-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.689578-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.689706-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.689816-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.689940-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.690150-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.690254-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.690361-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.690378-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.690602-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.690733-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.690939-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.690989-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.691159-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.691189-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.691293-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.691504-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.691625-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.691731-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.691873-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.692008-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.692114-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.692166-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.692378-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.692593-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.692615-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.692719-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.692724-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.692966-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.693049-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.693092-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.693172-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.693186-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.693411-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.693485-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.693483-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.693559-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.693645-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.693768-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.693811-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.693937-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.694072-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.694147-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.694185-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.694392-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.694551-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.694737-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.694844-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.694864-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.694952-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.695107-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.695198-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.695321-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.695558-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.695656-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.695802-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.695815-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.695914-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.696151-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.696281-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.696281-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.696546-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.696585-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.696724-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.696780-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.696839-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.696882-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.697107-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.697222-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.697222-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.697493-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.697650-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.697743-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.697819-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.697858-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.698086-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.698208-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.698312-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.698462-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.698530-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.698523-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.698678-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.698745-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.698849-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.699008-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.699090-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.699213-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.699300-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.699415-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.699448-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.699561-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.699649-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.699696-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.699820-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.699871-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.699976-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.700074-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.700151-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.700314-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.700328-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.700434-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.700853-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.700872-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.700962-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.701199-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.701201-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.701339-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.701402-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.701678-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.701813-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.701921-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.702111-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.702434-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.702434-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.702562-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.702639-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.702830-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.702994-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.703125-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.703123-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.703443-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.703543-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.703551-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.703691-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.703933-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.704020-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.704149-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.704252-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.704404-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.704538-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.704567-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.704663-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.704947-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.705071-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.705193-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.705338-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.705446-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.705668-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.705689-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.705781-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.705827-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.706031-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.706157-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.706279-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.706410-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.706518-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.706547-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.706737-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.706768-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.706912-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.707063-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.707176-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.707201-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.707295-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.707304-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.707541-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.707545-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.707659-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.707664-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.707760-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.707766-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.707992-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.708034-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.708100-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.708158-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.708199-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.708435-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.708442-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.708565-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.708645-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.708669-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.708911-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.709033-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.709146-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.709172-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.709367-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.709444-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.709575-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.709590-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.709913-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.709929-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.710041-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.710145-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.710697-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.710202-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.711009-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.711311-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.711605-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.711725-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.711828-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.711977-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.712127-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.712301-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.712310-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.712558-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.712670-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.712672-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.712856-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.712994-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.713126-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.713238-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.713377-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.713500-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.713584-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.713813-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.713949-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.713962-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.714086-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.714159-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.714332-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.714555-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.714570-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.714745-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.714863-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.715013-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.715142-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.715295-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.715507-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.715624-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.715739-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.715744-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.716018-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.716120-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.716171-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.716291-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.716345-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.716644-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.716695-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.716810-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.717056-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.717154-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.717179-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.717334-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.717479-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.717642-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.717696-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.717767-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.717907-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.718282-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.718147-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.718673-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.718806-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.718972-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.719145-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.719150-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.719258-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.719360-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.719605-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.719649-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.719775-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.719919-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.720025-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.720110-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.720149-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.720238-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.720427-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.720541-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.720648-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.720729-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.720881-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.720892-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.721025-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.721230-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.721345-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.721440-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.721437-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.721656-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.721672-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.721776-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.721877-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.722110-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.722110-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.722251-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.722317-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.722512-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.722517-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.722615-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.722845-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.722954-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.722975-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.723159-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.723176-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.723292-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.723551-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.723556-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.723673-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.723743-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.723758-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.724054-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.724054-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.724184-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.724296-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.724450-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.724571-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.724654-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.724845-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.724905-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.725023-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.725115-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.725219-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.725379-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.725428-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.725573-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.725749-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.725749-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.725888-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.726109-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.726152-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.726243-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.726253-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.726480-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.726500-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.726567-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.726610-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.726624-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.726846-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.726866-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.726954-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.726990-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.727056-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.727256-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.727299-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.727359-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.727423-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.727615-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.727655-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.727736-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.727772-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.727861-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.727998-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.728084-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.728135-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.728188-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.728285-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.728415-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.728528-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.728537-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.728661-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.728784-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.728899-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.728919-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.729016-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.729167-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.729254-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.729298-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.729367-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.729571-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.729574-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.729677-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.729697-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.729918-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.729934-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.729993-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.730051-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.730143-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.730225-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.730350-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.730364-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.730477-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.730622-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.730707-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.730725-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.730830-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.730976-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.731026-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.731091-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.731121-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.731210-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.731347-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.731441-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.731467-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.731558-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.731657-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.731739-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.731847-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.731909-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.732034-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.732078-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.732264-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.732382-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.732387-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.732466-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.732680-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.732732-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.732791-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.732894-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.733014-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.733129-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.733251-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.733377-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.733479-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.733556-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.733594-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.733685-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.733942-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.733962-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.734117-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.734214-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.734323-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.734395-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.734603-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.734621-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.734764-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.734894-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.734992-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.735054-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.735205-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.735222-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.735528-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.735538-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.735647-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.735868-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.735994-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.736098-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.736246-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.736337-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.736346-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.736552-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.736661-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.736677-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.736778-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.736926-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.737030-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.737056-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.737148-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.737318-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.737411-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.737409-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.737540-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.737658-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.737771-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.737799-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.737898-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.738035-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.738142-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.738168-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.738220-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.738440-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.738441-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.738544-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.738571-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.738778-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.738818-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.738851-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.738940-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.739036-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.739073-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.739197-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.739269-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.739373-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.739465-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.739480-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.739562-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.739736-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.739800-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.739824-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.739913-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.740066-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.740158-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.740168-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.740291-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.740413-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.740525-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.740540-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.740606-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.740776-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.740807-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.744066-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.744508-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.744709-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.744815-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.744832-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.745135-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.745162-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.745421-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.745423-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.745573-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.746263-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.746320-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.746543-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.746757-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.746892-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.746892-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.747014-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.747172-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.747317-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.747337-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.747446-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.747622-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.747659-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.747720-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.747766-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.747847-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.747941-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.748039-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.748047-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.748136-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.748229-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.748262-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.748372-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.748451-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.748563-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.748625-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.748713-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.748779-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.748884-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.748930-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.748966-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.749022-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.749170-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.749264-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.749264-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.749351-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.749460-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.749622-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.749739-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.749984-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.750014-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.750133-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.750154-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.750349-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.750462-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.750483-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.750566-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.750674-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.751029-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.751058-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.751169-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.751169-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.751465-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.751568-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.751568-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.751703-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.751823-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.751889-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.751929-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.752156-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.752249-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.752274-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.752425-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.752521-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.752621-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.752628-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.752854-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.752964-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.753134-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.753189-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.756319-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.756350-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.756653-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.756670-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.756764-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.756860-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.757013-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.757013-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.757143-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.757325-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.757359-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.757481-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.757509-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.757669-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.757754-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.757857-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.757985-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.758100-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.758213-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.758213-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.758466-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.758481-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.758598-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.758682-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.758826-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.758869-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.759095-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.759131-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.759247-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.759354-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.759357-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.759470-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.759615-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.759666-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.759744-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.759773-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.759985-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.760046-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.760104-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.760159-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.760195-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.760411-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.760411-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.760516-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.760523-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.760612-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.760782-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.760848-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.760919-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.760965-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.761173-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.761198-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.761270-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.761317-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.761410-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.761512-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.761617-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.761636-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.761745-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.761847-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.761872-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.762001-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.762103-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.762229-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.762279-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.762382-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.762476-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.762562-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.762615-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.762629-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.762742-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.762835-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.762943-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.762991-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.763046-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.763112-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.763293-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.763329-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.763418-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.763446-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.763729-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.766530-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.766565-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.766794-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.766977-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.767155-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.767488-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.767513-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.767652-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.767800-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.767827-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.767965-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.768187-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.768302-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.768387-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.768400-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.768666-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.768558-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.768824-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.769016-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.769061-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.769246-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.769247-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.769354-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.769371-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.769594-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.769720-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.769758-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.769812-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.769934-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.770037-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.770041-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.770145-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.770246-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.770481-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.770503-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.770607-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.770737-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.770848-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.770966-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.771037-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.771054-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.771225-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.771267-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.771369-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.771404-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.771466-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.771687-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.771740-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.771809-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.771905-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.772042-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.772099-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.772157-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.772244-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.772449-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.772470-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.772548-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.772644-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.772707-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.772890-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.773011-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.773232-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.773231-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.773345-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.773432-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.773477-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.773629-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.773650-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.773756-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.773852-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.774070-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.774065-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.774183-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.774231-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.774401-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.774418-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.774529-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.774617-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.774806-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.774907-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.774919-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.775007-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.775118-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.801356-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.801505-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.801871-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.802192-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.802325-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.802697-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.803157-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.803276-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.803606-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.803874-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.804053-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.804663-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.804804-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.804919-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.805318-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.805474-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.805788-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.805934-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.806021-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.806281-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.806401-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.806505-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.806757-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.806905-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.807291-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.807440-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.807543-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.808007-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.808171-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.808419-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.808712-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.809237-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.809931-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.810097-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.811558-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.811714-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.812072-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.812233-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.812731-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.813154-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.813615-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.814083-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.814302-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.814450-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.814964-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.815068-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.816373-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.816762-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.817572-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.817975-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.818131-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.818519-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.818631-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.819149-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.819304-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.820569-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.821084-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.822067-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.822395-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.823097-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.823266-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.823569-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.823956-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.824457-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.824608-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.824990-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.825135-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.825490-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.825812-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.825985-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.826489-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.826643-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.827064-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.827480-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.827686-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.829863-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.832568-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.832998-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.835237-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.835720-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.835988-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.836637-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.836785-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.837357-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.837593-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.838062-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.838277-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.838433-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.838927-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.839073-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.839386-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.839709-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.839854-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.840141-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.840254-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.840516-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.840653-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.840779-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.841274-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.841468-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.842217-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.842504-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.843597-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.843756-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.844963-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.845932-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.846159-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.846426-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.847028-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.847414-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.847584-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.848185-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.848428-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.849011-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.849272-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.849844-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.850054-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.850224-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.850641-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.850868-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.851152-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.851528-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.851929-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.852694-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.852926-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.853061-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.853389-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.853537-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.853678-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.854021-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.854196-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.854559-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.854744-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.854866-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.855237-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.855261-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.855431-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.855837-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.855959-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.856395-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.856595-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.856827-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.857289-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.857453-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.857564-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.858213-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.858567-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.858733-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.859349-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.859528-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.859549-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.859663-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.860017-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.860177-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.860502-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.860677-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.860819-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.861104-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.861210-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.861418-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.861504-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.861573-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.862163-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.862770-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.862983-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.863909-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.864037-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.864155-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.864444-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.864603-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.864908-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.865102-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.865468-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.865636-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.865937-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.866359-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.866518-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.866652-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.866965-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.867113-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.867575-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.867750-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.867852-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.868407-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.868587-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.869200-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.869366-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.869689-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.869836-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.869940-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.870215-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.870372-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.870678-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.870831-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.871157-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.871316-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.871427-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.871720-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.871865-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.872003-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.872322-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.873500-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.874361-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.874912-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.875691-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.875885-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.876705-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.877329-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.878046-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.878741-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.878981-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.879116-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.879468-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.880212-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.881896-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.882699-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.883181-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.883979-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.884351-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.884646-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.885171-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.885582-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.886109-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.886373-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.886833-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.886955-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.887264-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.887414-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.887550-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.887839-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.888041-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.888202-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.888516-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.888670-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.888789-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.889064-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.889205-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.889333-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.889632-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.889794-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.890218-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.890397-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.890518-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.891196-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.891380-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.891531-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.891868-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.892067-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.893959-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.894361-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.895011-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.896291-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.896934-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.897106-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.898308-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.898926-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.899552-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.899898-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.903739-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.904351-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.904530-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.904675-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.905097-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.905272-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.905491-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.905613-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.905710-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.905873-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.905977-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.906085-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.906496-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.906671-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.907002-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.907221-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.907321-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.907591-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.907711-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.907809-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.907991-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.908126-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.908371-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.908462-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.908524-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.908680-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.908749-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.908807-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.908957-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.909240-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.910274-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.910474-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.910608-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.910944-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.911098-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.911231-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.911556-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.911756-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.912071-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.912231-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.912347-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.912646-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.912792-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.912914-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.913249-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.913429-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.913750-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.913892-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.913996-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.914969-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.915155-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.915282-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.915916-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.916866-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.917562-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.917742-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.917865-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.919267-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.919436-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.919574-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.919832-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.919950-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.920129-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.920208-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.920267-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.920412-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.920480-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.920708-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.920994-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.921133-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.921377-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.921466-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.921525-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.921667-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.921731-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.921789-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.921926-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.922143-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.922713-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.922867-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.922987-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.923223-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.923310-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.923378-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.923538-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.923626-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.924324-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.924531-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.925519-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.926353-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.926479-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.926716-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.927246-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.927442-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.927949-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.928173-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.928303-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.928857-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.929017-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.929136-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.929335-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.929440-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.929614-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.929691-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.929749-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.930069-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.930344-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.930536-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.930757-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.930912-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.931185-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.931282-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.931346-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.931505-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.931575-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.931636-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.931794-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.932070-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.932363-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.932495-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.932607-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.932841-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.932926-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.932993-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.933384-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.933511-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.933697-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.933767-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.933911-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.934111-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.935353-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.935591-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.935878-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.935987-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.892226-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.936275-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.936398-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.936641-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.936645-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.936799-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.936897-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.936899-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.937113-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.937185-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.937238-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.937329-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.937381-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.937396-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.937536-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.937616-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.937674-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.937786-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.938122-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.938482-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.938633-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.938956-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.939124-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.939450-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.939551-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.939733-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.939810-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.940303-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.940550-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.940550-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.940910-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.941037-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.941391-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.941541-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.941812-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.942022-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.941930-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.942379-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.942497-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.942809-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.942958-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.943269-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.943453-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.943783-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.943914-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.944211-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.944359-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.944664-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:21.945059-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.945502-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 207
default	15:40:21.945717-0500	RedLemon	   OUTPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.945897-0500	RedLemon	   OUTPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean | Subtitles: 3
default	15:40:21.946093-0500	RedLemon	   OUTPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.946269-0500	RedLemon	   OUTPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.946451-0500	RedLemon	   OUTPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.946624-0500	RedLemon	   OUTPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:40:21.946790-0500	RedLemon	   OUTPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:40:21.947352-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.947590-0500	RedLemon	   OUTPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.948158-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.948725-0500	RedLemon	   OUTPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.948981-0500	RedLemon	   OUTPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:40:21.949187-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.949479-0500	RedLemon	   OUTPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.949944-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.950604-0500	RedLemon	   OUTPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	15:40:21.951153-0500	RedLemon	   OUTPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.951453-0500	RedLemon	   OUTPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.951683-0500	RedLemon	   OUTPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.951994-0500	RedLemon	   OUTPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.952348-0500	RedLemon	   OUTPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.952857-0500	RedLemon	   OUTPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:40:21.953043-0500	RedLemon	   OUTPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.953190-0500	RedLemon	   OUTPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	15:40:21.953337-0500	RedLemon	   OUTPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.953481-0500	RedLemon	   OUTPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	15:40:21.953618-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.953748-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.953876-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.954010-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	15:40:21.954138-0500	RedLemon	   OUTPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:40:21.954269-0500	RedLemon	   OUTPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	15:40:21.954404-0500	RedLemon	   OUTPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.954555-0500	RedLemon	   OUTPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.954704-0500	RedLemon	   OUTPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	15:40:21.954843-0500	RedLemon	   OUTPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	15:40:21.954972-0500	RedLemon	   OUTPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.955108-0500	RedLemon	   OUTPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	15:40:21.955250-0500	RedLemon	   OUTPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	15:40:21.955396-0500	RedLemon	   OUTPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	15:40:21.955549-0500	RedLemon	   OUTPUT[40]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	15:40:21.955699-0500	RedLemon	   OUTPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	15:40:21.955849-0500	RedLemon	   OUTPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.956000-0500	RedLemon	   OUTPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	15:40:21.956151-0500	RedLemon	   OUTPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	15:40:21.956295-0500	RedLemon	   OUTPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.956440-0500	RedLemon	   OUTPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:40:21.956686-0500	RedLemon	   OUTPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.956774-0500	RedLemon	   OUTPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	15:40:21.956855-0500	RedLemon	   OUTPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.956928-0500	RedLemon	   OUTPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	15:40:21.956995-0500	RedLemon	   OUTPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.957061-0500	RedLemon	   OUTPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.957200-0500	RedLemon	   OUTPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	15:40:21.957329-0500	RedLemon	   OUTPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.957452-0500	RedLemon	   OUTPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	15:40:21.957564-0500	RedLemon	   OUTPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	15:40:21.957674-0500	RedLemon	   OUTPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	15:40:21.957783-0500	RedLemon	   OUTPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.957895-0500	RedLemon	   OUTPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.957976-0500	RedLemon	   OUTPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.958048-0500	RedLemon	   OUTPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	15:40:21.958117-0500	RedLemon	   OUTPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	15:40:21.958184-0500	RedLemon	   OUTPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	15:40:21.958514-0500	RedLemon	   OUTPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	15:40:21.958679-0500	RedLemon	   OUTPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	15:40:21.958830-0500	RedLemon	   OUTPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.958940-0500	RedLemon	   OUTPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	15:40:21.959188-0500	RedLemon	   OUTPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.959338-0500	RedLemon	   OUTPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.959451-0500	RedLemon	   OUTPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	15:40:21.959574-0500	RedLemon	   OUTPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	15:40:21.959677-0500	RedLemon	   OUTPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	15:40:21.959794-0500	RedLemon	   OUTPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	15:40:21.959927-0500	RedLemon	   OUTPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	15:40:21.960059-0500	RedLemon	   OUTPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.960175-0500	RedLemon	   OUTPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.960302-0500	RedLemon	   OUTPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	15:40:21.960423-0500	RedLemon	   OUTPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	15:40:21.960539-0500	RedLemon	   OUTPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	15:40:21.960661-0500	RedLemon	   OUTPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	15:40:21.960773-0500	RedLemon	   OUTPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:40:21.960881-0500	RedLemon	   OUTPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	15:40:21.960999-0500	RedLemon	   OUTPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:40:21.961102-0500	RedLemon	   OUTPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	15:40:21.961198-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	15:40:21.961291-0500	RedLemon	   OUTPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	15:40:21.961395-0500	RedLemon	   OUTPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	15:40:21.961503-0500	RedLemon	   OUTPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	15:40:21.961601-0500	RedLemon	   OUTPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:40:21.961692-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	15:40:21.961796-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:21.961910-0500	RedLemon	   OUTPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	15:40:21.962007-0500	RedLemon	   OUTPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:21.962086-0500	RedLemon	   OUTPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:40:21.962146-0500	RedLemon	   OUTPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:40:21.962214-0500	RedLemon	   OUTPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:21.962472-0500	RedLemon	   OUTPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:21.962583-0500	RedLemon	   OUTPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:21.962690-0500	RedLemon	   OUTPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:40:21.963542-0500	RedLemon	   OUTPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	15:40:21.963720-0500	RedLemon	   OUTPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	15:40:21.963886-0500	RedLemon	   OUTPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:21.963982-0500	RedLemon	   OUTPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:40:21.964067-0500	RedLemon	   OUTPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:21.964163-0500	RedLemon	   OUTPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:21.964260-0500	RedLemon	   OUTPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:21.965429-0500	RedLemon	   OUTPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:40:21.965599-0500	RedLemon	   OUTPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:40:21.965734-0500	RedLemon	   OUTPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	15:40:21.965917-0500	RedLemon	   OUTPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:40:21.966073-0500	RedLemon	   OUTPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:21.966273-0500	RedLemon	   OUTPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:40:21.966603-0500	RedLemon	   OUTPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:21.966686-0500	RedLemon	   OUTPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:40:21.966811-0500	RedLemon	   OUTPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:40:21.966932-0500	RedLemon	   OUTPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:40:21.967036-0500	RedLemon	   OUTPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:40:21.967143-0500	RedLemon	   OUTPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:40:21.967247-0500	RedLemon	   OUTPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:21.967487-0500	RedLemon	   OUTPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:40:21.967649-0500	RedLemon	   OUTPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:21.967803-0500	RedLemon	   OUTPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:21.967983-0500	RedLemon	   OUTPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:21.968173-0500	RedLemon	   OUTPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:21.968312-0500	RedLemon	   OUTPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:21.968422-0500	RedLemon	   OUTPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:21.968528-0500	RedLemon	   OUTPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:40:21.968627-0500	RedLemon	   OUTPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:40:21.968732-0500	RedLemon	   OUTPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	15:40:21.968833-0500	RedLemon	   OUTPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	15:40:21.968935-0500	RedLemon	   OUTPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	15:40:21.969038-0500	RedLemon	   OUTPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:40:21.969140-0500	RedLemon	   OUTPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	15:40:21.969549-0500	RedLemon	   OUTPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:40:21.969769-0500	RedLemon	   OUTPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	15:40:21.969901-0500	RedLemon	   OUTPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	15:40:21.970019-0500	RedLemon	   OUTPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:40:21.970138-0500	RedLemon	   OUTPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	15:40:21.970247-0500	RedLemon	   OUTPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:21.970508-0500	RedLemon	   OUTPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	15:40:21.970786-0500	RedLemon	   OUTPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:40:21.970911-0500	RedLemon	   OUTPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:40:21.971024-0500	RedLemon	   OUTPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:40:21.971256-0500	RedLemon	   OUTPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:40:21.971436-0500	RedLemon	   OUTPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	15:40:21.971560-0500	RedLemon	   OUTPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:40:21.971667-0500	RedLemon	   OUTPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	15:40:21.971844-0500	RedLemon	   OUTPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	15:40:21.971978-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972081-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972174-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972270-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972362-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972450-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972505-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972558-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972639-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972721-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972803-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972884-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.972965-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973052-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973143-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973229-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973314-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973395-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973476-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973562-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973644-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973731-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973788-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973843-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973895-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973942-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:21.973995-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974049-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974128-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974209-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974287-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974365-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974455-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974538-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974618-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974687-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974739-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974787-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974848-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.974930-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.975009-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.975087-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.975167-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.975246-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.975418-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.975516-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.975814-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.976185-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.976424-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.977019-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:21.977145-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:40:21.977255-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:40:21.977350-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:40:21.977448-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	15:40:21.977544-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:40:21.977632-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:40:21.977741-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:40:21.977829-0500	RedLemon	   OUTPUT[206]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:40:21.984149-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.984415-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.986475-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.987202-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.987520-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.988085-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.988636-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.988817-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:21.993817-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.994033-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:21.994746-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:21.995744-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:21.996447-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:21.997160-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:21.998095-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:21.998327-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:21.999088-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.999650-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.999824-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.000117-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.001140-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.001329-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.003673-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.003870-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.005738-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.006526-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.008845-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.009082-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.009248-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.012515-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.013360-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.013603-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.017477-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.017739-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.019443-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.019551-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.019623-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.020236-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.020492-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.020649-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.021266-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.021454-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.021584-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.022723-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.022891-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.027371-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.028927-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.029161-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.029712-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.029875-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.029975-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.030549-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.030719-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.031012-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.031569-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.031730-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.032402-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.032594-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.032695-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.033833-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.034279-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.034460-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.035155-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.035402-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.037259-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.037848-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.038079-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.038570-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.040374-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.040601-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.041270-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.041599-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.041758-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.042094-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.042783-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.042944-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.044235-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.044455-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.044799-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.044991-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.045808-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.048163-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.048428-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.053149-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.053392-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.053730-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.055074-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.055478-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.055638-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.056372-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.056627-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.057265-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.057416-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.057547-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.057873-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.058039-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.058379-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.060520-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.060910-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.061091-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.061238-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.064584-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.064966-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.066646-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.066865-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.066987-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.068542-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.068805-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.072238-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.072904-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.073122-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.073484-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.074105-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.074284-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.074397-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.075088-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.075308-0500	RedLemon	  [2] Score: 100 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.076205-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.079004-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.079260-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.083668-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.083913-0500	RedLemon	  [1] Score: 100 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.085424-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.085937-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.086363-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.086852-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.087258-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.087476-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.088877-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.089040-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.090070-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.090238-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.090657-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.090823-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.091346-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.091777-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.091913-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.097605-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.098222-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.097960-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:22.098048-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:22.098584-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.098113-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:22.099406-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1735 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:22.099757-0500	runningboardd	Assertion 166-4995-1735 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:22.100233-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.100635-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.102768-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.103126-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.105242-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.105454-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.105617-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.105983-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.106113-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.106442-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.107470-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.107655-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.108114-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.108227-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.108616-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.108961-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.111568-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.111792-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.115047-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.117244-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.120455-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.120934-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.122282-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.122561-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.123020-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.123358-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.123502-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.123838-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.123996-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.125193-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.125325-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.126004-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.126372-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.126934-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.133745-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.133882-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.139834-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.140018-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.140393-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.140814-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.140955-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.141300-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.141408-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.144718-0500	RedLemon	  [2] Score: 0 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.148216-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.148972-0500	runningboardd	Invalidating assertion 166-103-1733 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.powerd>:103]
default	15:40:22.148638-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.149249-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:22.149298-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:22.149342-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:22.149584-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.155159-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-1736 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:22.155349-0500	runningboardd	Assertion 166-103-1736 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:22.167263-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.180546-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.182326-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.182574-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.182738-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.183183-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.183415-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.183640-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.184380-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.184540-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.184669-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.191251-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.191447-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.192265-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.192456-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.200242-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.200745-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.213922-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.214036-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.214338-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.214463-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.214799-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.215080-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.216315-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.216712-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.216883-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.217294-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.217623-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.217763-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.228894-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.229115-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.229659-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.230125-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.230284-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.238079-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.239738-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.240242-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.256498-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.256979-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.257144-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.257496-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.257704-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.257858-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.261486-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.263290-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.263416-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.264616-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.265831-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.266122-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.267314-0500	RedLemon	  [1] Score: 0 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.271953-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.272155-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.272494-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.272675-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.272809-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.273215-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.273355-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.273734-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.273860-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.275453-0500	RedLemon	    🎯 Release group match: 2025 = 2025
default	15:40:22.275665-0500	RedLemon	  [3] Score: 1000 | Frankenstein (2025) eng
default	15:40:22.275827-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.279545-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.279706-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.280090-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.280273-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.280651-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.280827-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.281675-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.282120-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.283051-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.283375-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.284137-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.284379-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.285206-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.285619-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.288054-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.289051-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.289407-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.289582-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.290241-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.290379-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.290636-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.290743-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.290996-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.291138-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.291418-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.291524-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.291764-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.291876-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.292871-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.293421-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.293956-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.294102-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.294600-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.295162-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.295702-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.295907-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.296559-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.296713-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.299040-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.299422-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.300034-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.300240-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.300658-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.300811-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.301832-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.302009-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.302769-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.306164-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.306855-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.307009-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.308065-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.308301-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.309464-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.309688-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.310708-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.310878-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.311222-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.311383-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.312436-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.312629-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.312982-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.313127-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.313740-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.314609-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.316096-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.317104-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.318748-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.319179-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.319974-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.320290-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.320951-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.321121-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.321404-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.321515-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.321760-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.321892-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.322134-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.322653-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.322957-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.323060-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.323316-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.323446-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.324568-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.324747-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.326201-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.326375-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.326875-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.327235-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.327534-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.327783-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.328077-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.328183-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.328423-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.328552-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.329174-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.329344-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.329632-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.330192-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.330950-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.331085-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.331595-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.331783-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.332123-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.332254-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.332653-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.332801-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.333288-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.333472-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.334018-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.334388-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.334738-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.334881-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.335159-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.335314-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.336050-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.336194-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.336755-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.336895-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.337373-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.337534-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.339615-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.339751-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.340020-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.340344-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.340615-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.340749-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.341018-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.341129-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.341597-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.341783-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.342233-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.342391-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.342710-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.342869-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.343311-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.343453-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.344193-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.344620-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.345973-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.346124-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.346422-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.346554-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.346940-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.347115-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.348731-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.348887-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.349370-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.349997-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.350517-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.351524-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.352096-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.352247-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.352538-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.352685-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.352972-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.353132-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.353627-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.353754-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.354015-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.354137-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.354604-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.354962-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.355190-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.355273-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.355331-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.355468-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.355534-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.355590-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.357291-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.357481-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.357747-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.357877-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.357978-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.358213-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.358326-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.358576-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.359046-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.359550-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.360148-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.360301-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.360397-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.360625-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.360730-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.360826-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.361074-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.361560-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.365080-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.366835-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.367255-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.368585-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.369385-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.369539-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.370054-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.370327-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.370651-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.370804-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.371145-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.371542-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.371686-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.372041-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.372265-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.372651-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.372956-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.373091-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.373189-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.373414-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.373521-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.373615-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.374255-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.374411-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.375164-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.375324-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.375432-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.375926-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.376072-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.376486-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.377908-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.378585-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.378957-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.379117-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.379292-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.379854-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.380199-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.380346-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.380914-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.381079-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.381326-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.381441-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.381525-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.381968-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.382152-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.382277-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.383003-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.383163-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.383415-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.383534-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.383630-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.383846-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.383949-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.386444-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.386991-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.387234-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.387588-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.388211-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.388395-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.388783-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.388921-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.389142-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.389473-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.389630-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.389878-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.390000-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.390096-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.390702-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.390845-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.390957-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.391370-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.391541-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.392294-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.392452-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.392975-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.393640-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.393784-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.393904-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.394366-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.394692-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.395224-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.395755-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.395901-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.396446-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.396601-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.396725-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.399147-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.399513-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.399972-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.400079-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.400160-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.400335-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.400415-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.400635-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.402164-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.402344-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.402650-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.402796-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.403134-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.403980-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.404089-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.404158-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.404328-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.404409-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.406656-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.406805-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.406897-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.407123-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.407228-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.407322-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.407547-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.415617-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.416205-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.416343-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.416440-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.416666-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.416774-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.416873-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.419274-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.419424-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.419656-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.419770-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.422312-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.423450-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.423677-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.423811-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.424170-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.425492-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.430434-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.432149-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.432436-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.432826-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.432985-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.433137-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.433439-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.433588-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.435672-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.435817-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.436253-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.436566-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.439146-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.439315-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.439868-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.441083-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.441409-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.441545-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.441652-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.441891-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.442014-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.443083-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.443435-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.443614-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.443927-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.444071-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.444186-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.444482-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.444634-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.444763-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.445116-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.447617-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.449642-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.450027-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.450319-0500	RedLemon	  [1] Score: 50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.452583-0500	RedLemon	    📺 Resolution match: 1080p
default	15:40:22.453114-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.453267-0500	RedLemon	  [2] Score: 50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.453612-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.453772-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.454624-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.454741-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.454969-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.455073-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.455302-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.455424-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.458678-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.458894-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.462605-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.462760-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.463287-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.463454-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.464129-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.464277-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.464600-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.464761-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.465452-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.465588-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.465784-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.465919-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.466837-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.467005-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.467714-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.467886-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.468180-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.468290-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.469109-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.469264-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.469549-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.469687-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.470726-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.470881-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.471158-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.471287-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.471544-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.471693-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.472778-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.472932-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.473227-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.473350-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.473607-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.473747-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.474019-0500	RedLemon	    ⚠️ Format mismatch: subtitle has web-dl but stream doesn't
default	15:40:22.474554-0500	RedLemon	  [1] Score: -50 | Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:22.474833-0500	RedLemon	    ⚠️ Format mismatch: subtitle has webrip but stream doesn't
default	15:40:22.475759-0500	RedLemon	  [2] Score: -50 | Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:22.476047-0500	RedLemon	  [3] Score: 0 | Frankenstein (2025) eng
default	15:40:22.476531-0500	RedLemon	✅ Selected 3 subtitle options for stream
default	15:40:22.476649-0500	RedLemon	🔍 DEBUG: attachSubtitles OUTPUT - streams.count: 207
default	15:40:22.476825-0500	RedLemon	   OUTPUT[0]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.476994-0500	RedLemon	   OUTPUT[1]: ww UIndex org   -    Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV H 265-SNAKE | 1080p | zilean | Subtitles: 3
default	15:40:22.477154-0500	RedLemon	   OUTPUT[2]: Frankenstein 2025 WEB-DL 1080p-Dual-Lat mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.477317-0500	RedLemon	   OUTPUT[3]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.477468-0500	RedLemon	   OUTPUT[4]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.477636-0500	RedLemon	   OUTPUT[5]: Frankenstein 2025 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:40:22.477792-0500	RedLemon	   OUTPUT[6]: Frankenstein 2004 1080p WEBRip x264 AAC5 1-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:40:22.477977-0500	RedLemon	   OUTPUT[7]: Frankenstein 2025 Ger Eng EAC3 Atmos DL 2160p WEB DV HDR h265-VECTOR mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.478144-0500	RedLemon	   OUTPUT[8]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.478323-0500	RedLemon	   OUTPUT[9]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos HDR H 265-SNAKE mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.478502-0500	RedLemon	   OUTPUT[10]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR Hybrid H265 DUAL-AOC mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.478667-0500	RedLemon	   OUTPUT[11]: Frankenstein 2025 [10Bit SDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:40:22.478827-0500	RedLemon	   OUTPUT[12]: Frankenstein 2025 MULTi 1080p NF WEB-DL H264 DDP5 1 Atmos-K83 mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.479011-0500	RedLemon	   OUTPUT[13]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.479182-0500	RedLemon	   OUTPUT[14]: Frankenstein 2025 MULTi 2160p NF WEB-D HDR H265 DDP5 1 Atmos-K83 mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.479340-0500	RedLemon	   OUTPUT[15]: Frankenstein 2025 2160p NF WEB-DL DV P5 ENG LATINO DDP5 1 Atmos H265 MP4-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	15:40:22.479496-0500	RedLemon	   OUTPUT[16]: Frankenstein (2025) 2160p SDR NETFLiX WEBRiP x264 24-bit WAV-CREATiVE24 mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.479641-0500	RedLemon	   OUTPUT[17]: Frankenstein 2025 MULTi 2160p NF WEB SDR H265-THESYNDiCATE mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.479793-0500	RedLemon	   OUTPUT[18]: Frankenstein 2025 MULTi 1080p WEB x264-TFA mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.479948-0500	RedLemon	   OUTPUT[19]: Frankenstein 2025 MULTi 1080p WEB H265-TFA mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.481183-0500	RedLemon	   OUTPUT[20]: Frankenstein 2025 2160p Hybrid MULTI WEB-DL DV HDR H265-AOC mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.482127-0500	RedLemon	   OUTPUT[21]: Frankenstein 1994 [10Bit SDR] [2160p BluRay H265 AC3-AS76-FT] [Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:40:22.482408-0500	RedLemon	   OUTPUT[22]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264 DUAL-BiOMA mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.483424-0500	RedLemon	   OUTPUT[23]: Frankenstein 2025 MULTi 1080p NF WEB-DL x264-OzW | 1080p | zilean | Subtitles: 3
default	15:40:22.483663-0500	RedLemon	   OUTPUT[24]: Frankenstein 2025 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-BYNDR mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.483795-0500	RedLemon	   OUTPUT[25]: Frankenstein 2025 2160p NF WEB-DL HDR MULTi DDP5 1 Atmos H265-BEN THE MEN | 2160p | zilean | Subtitles: 3
default	15:40:22.483875-0500	RedLemon	   OUTPUT[26]: Frankenstein 2025 1080p WEB h264-ETHEL mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.483963-0500	RedLemon	   OUTPUT[27]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos H 264-FLUX mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.484030-0500	RedLemon	   OUTPUT[28]: Frankenstein 2025 MULTi 2160p NF WEB-DL HEVC HDR AtmosDoVi H265-RX mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.484097-0500	RedLemon	   OUTPUT[29]: Frankenstein 2025 MULTi 2160p NF WEB-DL DDP5 1 Atmos DV HDR H 265-OzW | 2160p | zilean | Subtitles: 3
default	15:40:22.486340-0500	RedLemon	   OUTPUT[30]: Frankenstein 2025 [10Bit DV-HDR] [2160p WEB-DL H265 EAC3 Atmos-AS76-FT] [ENG-Lektor PL] [Alusia] | 2160p | zilean | Subtitles: 3
default	15:40:22.486546-0500	RedLemon	   OUTPUT[31]: Frankenstein 2015 720p BluRay x264-[YTS LT] mp4 | 720p | zilean | Subtitles: 3
default	15:40:22.486676-0500	RedLemon	   OUTPUT[32]: frankenstein 1931 1080p bluray x264-hd4u mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.486793-0500	RedLemon	   OUTPUT[33]: Frankenstein 1994 UHD BluRay 2160p DTS-HD MA 5 1 DV HEVC REMUX-FraMeSToR mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.486903-0500	RedLemon	   OUTPUT[34]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [720p] [WEBRip] [YTS MX] | 720p | zilean | Subtitles: 3
default	15:40:22.487019-0500	RedLemon	   OUTPUT[35]: Frankenstein (2011) [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	15:40:22.487131-0500	RedLemon	   OUTPUT[36]: Frankenstein 1931 4K HDR 2160p BDRemux Ita Eng x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.488646-0500	RedLemon	   OUTPUT[37]: Frankenstein - 2007 - DVDRip - A KARMADrome KvCD by The Poison Dwarf bin | Unknown | zilean | Subtitles: 3
default	15:40:22.488847-0500	RedLemon	   OUTPUT[38]: Frankenstein 1931 1080p BluRay x264-[YTS AM] mp4 | 1080p | zilean | Subtitles: 3
default	15:40:22.489003-0500	RedLemon	   OUTPUT[39]: Frankenstein (2015) [BluRay] [1080p] [YTS LT] | 1080p | zilean | Subtitles: 3
default	15:40:22.489312-0500	RedLemon	   OUTPUT[40]: FRANKENSTEIN mkv | Unknown | zilean | Subtitles: 3
default	15:40:22.489847-0500	RedLemon	   OUTPUT[41]: Frankenstein 2004 1080p BluRay H264 AAC-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	15:40:22.490042-0500	RedLemon	   OUTPUT[42]: Frankenstein 1931 2160p BluRay REMUX HEVC DTS-HD MA 2 0-FGT mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.491019-0500	RedLemon	   OUTPUT[43]: Frankenstein 1931 2160p UHD BluRay x265-B0MBARDiERS | 2160p | zilean | Subtitles: 3
default	15:40:22.491211-0500	RedLemon	   OUTPUT[44]: Frankenstein (1931) (1080p BluRay x265 HEVC 10bit AAC 2 0 Tigole) | 1080p | zilean | Subtitles: 3
default	15:40:22.491334-0500	RedLemon	   OUTPUT[45]: Frankenstein 2015 BDRip 1080p ELEKTRI4KA UNIONGANG mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.491452-0500	RedLemon	   OUTPUT[46]: Frankenstein 1970 1958 1080p BluRay x264 AAC-[YTS MX] mp4 | 1080p | zilean | Subtitles: 3
default	15:40:22.491573-0500	RedLemon	   OUTPUT[47]: Frankenstein 1931 4K HDR 2160p BDRip Ita Eng Ger x265-NAHOM mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.491698-0500	RedLemon	   OUTPUT[48]: Frankenstein (2011) [CUMBERBATCH CREATURE VERSION] [1080p] [WEBRip] [YTS MX] | 1080p | zilean | Subtitles: 3
default	15:40:22.492017-0500	RedLemon	   OUTPUT[49]: Frankenstein (1931) 1080p AC3 2ch x264 BDRip LatTeam mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.492214-0500	RedLemon	   OUTPUT[50]: Frankenstein 1931 1080p BluRay H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	15:40:22.492358-0500	RedLemon	   OUTPUT[51]: Frankenstein 1931 Restored 1080p BluRay x265 hevc 10bit AAC 2 0 commentary-HeVK mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.492491-0500	RedLemon	   OUTPUT[52]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DDP2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.493357-0500	RedLemon	   OUTPUT[53]: Frankenstein 2015 1080p WEBRip AAC x264-ETRG mp4 | 1080p | zilean | Subtitles: 3
default	15:40:22.493561-0500	RedLemon	   OUTPUT[54]: Frankenstein 1931 Restored Bluray 1080p DTS-HD-2 0 x264-Grym mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.493712-0500	RedLemon	   OUTPUT[55]: Frankenstein 1931 RESTORED 1080p BluRay REMUX-DDB | 1080p | zilean | Subtitles: 3
default	15:40:22.493861-0500	RedLemon	   OUTPUT[56]: Frankenstein 1931 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	15:40:22.494003-0500	RedLemon	   OUTPUT[57]: Frankenstein (1931 - James Whale) [BDRip720p Ita-Eng] mkv | 720p | zilean | Subtitles: 3
default	15:40:22.494153-0500	RedLemon	   OUTPUT[58]: Frankenstein 1931 2160p UHD BluRay x265 10bit HDR DTS-HD MA 2 0-RARBG mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.494303-0500	RedLemon	   OUTPUT[59]: Frankenstein 1994 2160p UHD Blu-ray Remux HEVC DV DTS-HD MA 5 1-HDT mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.494457-0500	RedLemon	   OUTPUT[60]: Frankenstein 1931 [BDRip-1080p-MultiLang-MultiSub-Chapters][RiP By MaX] mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.494615-0500	RedLemon	   OUTPUT[61]: Frankenstein_remux_1931 mkv | Unknown | zilean | Subtitles: 3
default	15:40:22.494776-0500	RedLemon	   OUTPUT[62]: Frankenstein 1910 WEBRIP 576p x264 RUS liosaa mkv | Unknown | zilean | Subtitles: 3
default	15:40:22.494935-0500	RedLemon	   OUTPUT[63]: Frankenstein (1931) (2160p BluRay x265 10bit HDR Tigole) mkv | 2160p | zilean | Subtitles: 3
default	15:40:22.495292-0500	RedLemon	   OUTPUT[64]: Frankenstein 2015 1080p BluRay AVC AC-3 DD 5 1 x264-PANAM | 1080p | zilean | Subtitles: 3
default	15:40:22.495506-0500	RedLemon	   OUTPUT[65]: Frankenstein 1970 1958 1080p BluRay x265-RARBG mp4 | 1080p | zilean | Subtitles: 3
default	15:40:22.497934-0500	RedLemon	   OUTPUT[66]: I, Frankenstein 2014 1080p AMZN WEB-DL DDP5 1 H264-GPRS mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.498989-0500	RedLemon	   OUTPUT[67]: I Frankenstein 2014 1080p BluRay x265-RARBG | 1080p | zilean | Subtitles: 3
default	15:40:22.499316-0500	RedLemon	   OUTPUT[68]: I Frankenstein 2014 1080p BluRay x264-SPARKS mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.499541-0500	RedLemon	   OUTPUT[69]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.500250-0500	RedLemon	   OUTPUT[70]: I Frankenstein 2014 1080p BRRip H264 AAC-RARBG | 1080p | zilean | Subtitles: 3
default	15:40:22.500472-0500	RedLemon	   OUTPUT[71]: I Frankenstein 2014 1080p BRRip x264 AAC-JYK mp4 | 1080p | zilean | Subtitles: 3
default	15:40:22.501620-0500	RedLemon	   OUTPUT[72]: I, Frankenstein 2014 1080p BluRay x264 YIFY mp4 | 1080p | zilean | Subtitles: 3
default	15:40:22.501815-0500	RedLemon	   OUTPUT[73]: I Frankenstein (2014) 3D HSBS 1080p BluRay H264 DolbyD 5 1 + nickarad mp4 | 1080p | zilean | Subtitles: 3
default	15:40:22.501956-0500	RedLemon	   OUTPUT[74]: I, Frankenstein (2014) 1080p BDRip x264 English AC3 5 1 - MeGUiL | 1080p | zilean | Subtitles: 3
default	15:40:22.502079-0500	RedLemon	   OUTPUT[75]: I Frankenstein 2014 1080p BluRay x265 10bit-z97 mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.502196-0500	RedLemon	   OUTPUT[76]: I, Frankenstein (2014) 1080p 10bit Bluray x265 HEVC [Hindi 2 0 + DD 5 1 English] ESubs ~ TombDoc mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.502315-0500	RedLemon	   OUTPUT[77]: I Frankenstein 2014 1080p BluRay Remux DTS-HD MA 7 1 | 1080p | zilean | Subtitles: 3
default	15:40:22.502430-0500	RedLemon	   OUTPUT[78]: I Frankenstein (2014) VF2-ENG AC3 BluRay 1080p x264 GHT | 1080p | zilean | Subtitles: 3
default	15:40:22.502557-0500	RedLemon	   OUTPUT[79]: I Frankenstein 2014 JPN BluRay Remux 1080p AVC Atmos 7 1-decibeL | 1080p | zilean | Subtitles: 3
default	15:40:22.503227-0500	RedLemon	   OUTPUT[80]: i frankenstein 2014 1080p bluray x264-sparks mkv | 1080p | zilean | Subtitles: 3
default	15:40:22.503350-0500	RedLemon	   OUTPUT[81]: Frankenstein.2025.4K.HDR.DV.2160p.WEBDL Ita Eng x265-NAHOM
👤 151 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:40:22.503459-0500	RedLemon	   OUTPUT[82]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p от Scarabey | 4K | HDR | Dolby Vision | D | Red Head Sound
👤 58 💾 21.86 GB ⚙️ Rutor
🇷🇺 | 2160p | torrentio | Subtitles: 3
default	15:40:22.503561-0500	RedLemon	   OUTPUT[83]: Frankenstein (2025) 2160p H265 WebDl Rip 10 bit DV HDR10 ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 43 💾 5.76 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:40:22.503673-0500	RedLemon	   OUTPUT[84]: Frankenstein.2025.MULTi.2160p.NF.WEB.DV.HDR.H265-THESYNDiCATE.mkv
👤 21 💾 21.86 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 2160p | torrentio | Subtitles: 3
default	15:40:22.504683-0500	RedLemon	   OUTPUT[85]: Frankenstein 2025 WEB DL 2160p HDR10 DV HEVC DDP Atmos 5 1 x265 E
👤 10 💾 17.17 GB ⚙️ TorrentGalaxy | 2160p | torrentio | Subtitles: 3
default	15:40:22.504856-0500	RedLemon	   OUTPUT[86]: Frankenstein (2025) [4k 2160p][Esp]
👤 115 💾 21.99 GB ⚙️ Wolfmax4k
🇪🇸 | 2160p | torrentio | Subtitles: 3
default	15:40:22.504956-0500	RedLemon	   OUTPUT[87]: Frankenstein 2025 2160p WEBRip
👤 100 💾 6.81 GB ⚙️ YTS | 2160p | torrentio | Subtitles: 3
default	15:40:22.505067-0500	RedLemon	   OUTPUT[88]: Франкенштейн / Frankenstein (2025) WEB-DL-HEVC 2160p | 4K | SDR | D | Videofilm Int
👤 23 💾 15.59 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 / 🇺🇦 | 2160p | torrentio | Subtitles: 3
default	15:40:22.505171-0500	RedLemon	   OUTPUT[89]: Frankenstein (2025) 2160p H265 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 12 💾 22 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 2160p | torrentio | Subtitles: 3
default	15:40:22.505270-0500	RedLemon	   OUTPUT[90]: Frankenstein 2025 NF WEBRip SDR 10Bit 1260p DDP5.1 Atmos HEVC-3Li
👤 15 💾 7.9 GB ⚙️ 1337x | Unknown | torrentio | Subtitles: 3
default	15:40:22.505367-0500	RedLemon	   OUTPUT[91]: Frankenstein 2025 1080p NF WEB-DL DDP5 1 Atmos DV HDR H 265-WADU
👤 15 💾 4.24 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:22.505970-0500	RedLemon	   OUTPUT[92]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от EniaHD | D
👤 4549 💾 7.48 GB ⚙️ Rutor | 1080p | torrentio | Subtitles: 3
default	15:40:22.506278-0500	RedLemon	   OUTPUT[93]: Frankenstein.2025.1080p.WEBRip.10Bit.DDP5.1.x265-NeoNoir
👤 1394 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:22.506398-0500	RedLemon	   OUTPUT[94]: I.frankenstein.2014.1080p-dual-lat.mp4
👤 161 💾 1.35 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:40:22.506496-0500	RedLemon	   OUTPUT[95]: Frankenstein.2025.1080p-dual-lat-cinecalidad.ro.mp4
👤 160 💾 2.72 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:40:22.506599-0500	RedLemon	   OUTPUT[96]: Frankenstein.2025.1080p.ITA-ENG.MULTI.WEBRip.x265.AAC-V3SP4EV3R.mkv
👤 131 💾 2.23 GB ⚙️ ilCorSaRoNeRo
Multi Audio / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:22.506702-0500	RedLemon	   OUTPUT[97]: Frankenstein (2025) FullHD 1080p.H264 Webdl Ita Eng AC3 5.1 Multisub - realDMDJ
👤 129 💾 3.24 GB ⚙️ ilCorSaRoNeRo
Multi Subs / 🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:22.506793-0500	RedLemon	   OUTPUT[98]: Frankenstein (2025) 1080p WEBRip 5.1-LAMA
👤 125 💾 2.81 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:22.507057-0500	RedLemon	   OUTPUT[99]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p | D | Red Head Sound
👤 114 💾 6.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:40:22.507193-0500	RedLemon	   OUTPUT[100]: Frankenstein 2025 1080p WEBRip
👤 100 💾 2.55 GB ⚙️ YTS | 1080p | torrentio | Subtitles: 3
default	15:40:22.507308-0500	RedLemon	   OUTPUT[101]: Frankenstein 2025 1080p WEB DL HEVC x265 5 1 BONE
👤 87 💾 2.02 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	15:40:22.507416-0500	RedLemon	   OUTPUT[102]: Frankenstein 2025 1080p 10bit WEBRip 6CH x265 HEVC-PSA
👤 86 💾 2.14 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:22.507520-0500	RedLemon	   OUTPUT[103]: Frankenstein.2025.1080p.WEBRip.x265-KONTRAST
👤 73 💾 3.44 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:40:22.507626-0500	RedLemon	   OUTPUT[104]: Frankenstein 2025 1080p HDRip x264-RGB
👤 56 💾 1.09 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:22.507747-0500	RedLemon	   OUTPUT[105]: Pluribus S01E04 Please Carol.1080p.ATVP.WEB-DL.DD5.1.Atmos H264.TRIal.YG⭐
👤 54 💾 3.9 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:22.508179-0500	RedLemon	   OUTPUT[106]: Frankenstein 2025 iTA ENG WEBDL 1080p x264 CYBER mkv
👤 47 💾 8.02 GB ⚙️ TorrentGalaxy
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:22.508328-0500	RedLemon	   OUTPUT[107]: Frankenstein.2025.1080p.10bit.DS4K.NF.WEBRip.[Org.DDPA5.1-Hindi DDPA5.1-English].ESub.HEVC-The.PunisheR
👤 37 💾 6.98 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:40:22.508435-0500	RedLemon	   OUTPUT[108]: Франкенштейн / Frankenstein (2025) WEB-DL 1080p от Scarabey | D | Red Head Sound
👤 35 💾 6.66 GB ⚙️ Rutor
🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:40:22.508532-0500	RedLemon	   OUTPUT[109]: Frankenstein.2025.MULTi.1080p.WEB.x264-TFA.mkv
👤 35 💾 7.89 GB ⚙️ Torrent9
Multi Audio / 🇫🇷 | 1080p | torrentio | Subtitles: 3
default	15:40:22.508625-0500	RedLemon	   OUTPUT[110]: Frankenstein (2025) 1080p x264 [Tam Tel Hin Eng] DDP ESub [i2p]
👤 27 💾 4.96 GB ⚙️ 1337x
🇬🇧 / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:40:22.508721-0500	RedLemon	   OUTPUT[111]: Frankenstein (2025) 1080p H265 ITA ENG EAC3 Atmos SUB ITA ENG WEBRip [5.04 GB] - UBi CreW
👤 24 💾 5.05 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:22.508821-0500	RedLemon	   OUTPUT[112]: Frankenstein (2025) (1080p NF WEB-DL x265 10bit EAC3 Atmos 5.1 Ghost) [QxR]
Frankenstein (2025) (1080p NF WEB-DL x265 Ghost).mkv
👤 24 💾 6.04 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:40:22.508924-0500	RedLemon	   OUTPUT[113]: Frankenstein (2025) 1080p H265 WebDl Rip ita eng AC3 5.1 sub ita eng NUita NUeng Licdom
👤 24 💾 3.34 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:22.509242-0500	RedLemon	   OUTPUT[114]: Frankenstein.2025.1080p.NF.WEBRip.AAC5.1.10bits.x265-Rapta
👤 14 💾 1.88 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:40:22.509659-0500	RedLemon	   OUTPUT[115]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 11 💾 10.61 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:40:22.509820-0500	RedLemon	   OUTPUT[116]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от селезень | D | Videofilm Int
👤 10 💾 10.12 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:40:22.510148-0500	RedLemon	   OUTPUT[117]: Frankenstein.2025.1080p.NF.WEB.DL.Multi.DDP5.1.Atmos.H.265-themoviesboss
👤 9 💾 5.73 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 1080p | torrentio | Subtitles: 3
default	15:40:22.510282-0500	RedLemon	   OUTPUT[118]: Frankenstein.2025.1080p-Dual-Lat
👤 8 💾 3.22 GB ⚙️ Cinecalidad
Dual Audio / 🇲🇽 | 1080p | torrentio | Subtitles: 3
default	15:40:22.510561-0500	RedLemon	   OUTPUT[119]: Frankenstein (2025) 1080p H264 ITA ENG EAC3 5.1 Sub ITA ENG NUITA NUENG-FHC_CREW
👤 8 💾 6.79 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:22.510689-0500	RedLemon	   OUTPUT[120]: Frankenstein (2025) Eng 1080p WEBRip x265 DDP 5.1 ESub
👤 7 💾 2.15 GB ⚙️ 1337x | 1080p | torrentio | Subtitles: 3
default	15:40:22.510792-0500	RedLemon	   OUTPUT[121]: Frankenstein 2025 1080p WEBRip 10Bit DDP5 1 x265-NeoNoir
👤 7 💾 1.93 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:22.510896-0500	RedLemon	   OUTPUT[122]: Frankenstein (2025) AC3 5.1 ITA.ENG 1080p H265 sub NUita.eng Sp33dy94 MIRCrew
👤 6 💾 3.23 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:22.512084-0500	RedLemon	   OUTPUT[123]: Frankenstein 2025 1080p WEB-DL HEVC x265 5 1 BONE
👤 6 💾 2.02 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:22.512236-0500	RedLemon	   OUTPUT[124]: Frankenstein.2025.1080p.WEB-DL.DUAL.5.1
👤 6 💾 3.91 GB ⚙️ Comando
Dual Audio / 🇬🇧 / 🇵🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:22.512358-0500	RedLemon	   OUTPUT[125]: Frankenstein (2025) 1080p x265 ita eng ac3 sub ita eng nuita nueng - MIRCrew
👤 5 💾 3.19 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 1080p | torrentio | Subtitles: 3
default	15:40:22.512470-0500	RedLemon	   OUTPUT[126]: Frankenstein (2025) 1080p WEBRip x265 10bit 5.1-LAMA
👤 5 💾 2.55 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:22.512588-0500	RedLemon	   OUTPUT[127]: Франкенштейн / Frankenstein (2025) WEB-DLRip 1080p от ExKinoRay | D
👤 5 💾 10.18 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 1080p | torrentio | Subtitles: 3
default	15:40:22.512690-0500	RedLemon	   OUTPUT[128]: Frankenstein 80 (1972) 720p BluRay-WORLD
👤 339 💾 823.54 MB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:40:22.513178-0500	RedLemon	   OUTPUT[129]: Франкенштейн / Frankenstein (2025) WEB-DL 720p от селезень | D | Videofilm Int
👤 260 💾 2.77 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | 720p | torrentio | Subtitles: 3
default	15:40:22.513318-0500	RedLemon	   OUTPUT[130]: Frankenstein (2025) [Bluray 720p][Esp]
👤 114 💾 6.52 GB ⚙️ Wolfmax4k
🇪🇸 | 720p | torrentio | Subtitles: 3
default	15:40:22.513416-0500	RedLemon	   OUTPUT[131]: Frankenstein 2025 720p WEBRip
👤 100 💾 1.37 GB ⚙️ YTS | 720p | torrentio | Subtitles: 3
default	15:40:22.513509-0500	RedLemon	   OUTPUT[132]: Frankenstein (2025) 720p WEBRip-LAMA
👤 44 💾 1.37 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:40:22.513613-0500	RedLemon	   OUTPUT[133]: Frankenstein (2025).mkv 720p WEB-DL DDP 5.1 ATMOS iTA ENG H264 - FHC_CREW.mkv
👤 18 💾 3.46 GB ⚙️ 1337x
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	15:40:22.514111-0500	RedLemon	   OUTPUT[134]: Frankenstein 2025 720p NF WEB-DL DDP5 1 Atmos H 264-FLUX
👤 15 💾 2.64 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:40:22.514223-0500	RedLemon	   OUTPUT[135]: Frankenstein.2025.720p.NF.WebRip.Multi.AAC2.0.H.264-themoviesboss
👤 15 💾 1.48 GB ⚙️ 1337x
Multi Audio / 🇮🇳 | 720p | torrentio | Subtitles: 3
default	15:40:22.514331-0500	RedLemon	   OUTPUT[136]: Frankenstein (2025) 720p h264 Ac3 5.1 Ita Eng Sub Ita NUita Eng-MIRCrew
👤 12 💾 2.81 GB ⚙️ ilCorSaRoNeRo
🇬🇧 / 🇮🇹 | 720p | torrentio | Subtitles: 3
default	15:40:22.514619-0500	RedLemon	   OUTPUT[137]: Frankenstein 2025 720p 10bit WEBRip 6CH x265 HEVC-PSA
👤 12 💾 1.07 GB ⚙️ ThePirateBay | 720p | torrentio | Subtitles: 3
default	15:40:22.514727-0500	RedLemon	   OUTPUT[138]: Frankenstein (2025) [NF] [480p] [WEB-DL] [XviD] [DD5.1-K83] [Lektor PL]
👤 5 💾 2.46 GB ⚙️ BestTorrents
🇵🇱 | 480p | torrentio | Subtitles: 3
default	15:40:22.514822-0500	RedLemon	   OUTPUT[139]: Frankenstein 2025 1080p HDCAM x264-RGB
👤 13 💾 4.16 GB ⚙️ ThePirateBay | 1080p | torrentio | Subtitles: 3
default	15:40:22.514915-0500	RedLemon	   OUTPUT[140]: Frankenstein 2025 1080p CAM x264-RGB
👤 7 💾 4.16 GB ⚙️ TorrentGalaxy | 1080p | torrentio | Subtitles: 3
default	15:40:22.515016-0500	RedLemon	   OUTPUT[141]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.)
👤 876 💾 2.17 GB ⚙️ Rutracker
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:40:22.515125-0500	RedLemon	   OUTPUT[142]: Франкенштейн / Frankenstein [2025 WEB-DLRip] Dub (Videofilm Int.) + Sub (Rus Eng) + Original Eng
👤 192 💾 2.92 GB ⚙️ Rutracker
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:40:22.515583-0500	RedLemon	   OUTPUT[143]: Франкенштейн / Frankenstein (2025) WEB-DLRip-AVC от DoMiNo & селезень | D | Videofilm Int
👤 143 💾 1.46 GB ⚙️ Rutor
🇬🇧 / 🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:40:22.515718-0500	RedLemon	   OUTPUT[144]: Франкенштейн / Frankenstein (2025) WEB-DLRip от MegaPeer | D | Videofilm Int
👤 24 💾 2.18 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:40:22.515969-0500	RedLemon	   OUTPUT[145]: Frankenstein (2025) [PL] [WEB-DL] [XviD-OzW] [Lektor PL]
👤 11 💾 1.38 GB ⚙️ BestTorrents
🇵🇱 | Unknown | torrentio | Subtitles: 3
default	15:40:22.516208-0500	RedLemon	   OUTPUT[146]: Франкенштейн / Frankenstein (2025) WEB-DLRip от Leon-masl | D L
👤 6 💾 2.19 GB ⚙️ Rutor
🇷🇺 | Unknown | torrentio | Subtitles: 3
default	15:40:22.516313-0500	RedLemon	   OUTPUT[147]: Frankenstein (2025) [Bluray][Esp]
👤 5 💾 1.83 GB ⚙️ Wolfmax4k
🇪🇸 | Unknown | torrentio | Subtitles: 3
default	15:40:22.516407-0500	RedLemon	   OUTPUT[148]: frankenstein.2025.french.web.x264-higgsboson.mkv
👤 357 💾 1.19 GB ⚙️ Torrent9
🇫🇷 | Unknown | torrentio | Subtitles: 3
default	15:40:22.516493-0500	RedLemon	   OUTPUT[149]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.516572-0500	RedLemon	   OUTPUT[150]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.516652-0500	RedLemon	   OUTPUT[151]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.517035-0500	RedLemon	   OUTPUT[152]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.517136-0500	RedLemon	   OUTPUT[153]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.517226-0500	RedLemon	   OUTPUT[154]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.517313-0500	RedLemon	   OUTPUT[155]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.517398-0500	RedLemon	   OUTPUT[156]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.517482-0500	RedLemon	   OUTPUT[157]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.517566-0500	RedLemon	   OUTPUT[158]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.517659-0500	RedLemon	   OUTPUT[159]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.517745-0500	RedLemon	   OUTPUT[160]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.519398-0500	RedLemon	   OUTPUT[161]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.519496-0500	RedLemon	   OUTPUT[162]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.519583-0500	RedLemon	   OUTPUT[163]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.519890-0500	RedLemon	   OUTPUT[164]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.519980-0500	RedLemon	   OUTPUT[165]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.520317-0500	RedLemon	   OUTPUT[166]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.520533-0500	RedLemon	   OUTPUT[167]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.520643-0500	RedLemon	   OUTPUT[168]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.520725-0500	RedLemon	   OUTPUT[169]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.520802-0500	RedLemon	   OUTPUT[170]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.520881-0500	RedLemon	   OUTPUT[171]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.521119-0500	RedLemon	   OUTPUT[172]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.521359-0500	RedLemon	   OUTPUT[173]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.521612-0500	RedLemon	   OUTPUT[174]: [RD⚡] Comet 2160p | 2160p | comet | Subtitles: 3
default	15:40:22.521821-0500	RedLemon	   OUTPUT[175]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.521996-0500	RedLemon	   OUTPUT[176]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.522619-0500	RedLemon	   OUTPUT[177]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.522787-0500	RedLemon	   OUTPUT[178]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.523009-0500	RedLemon	   OUTPUT[179]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.523113-0500	RedLemon	   OUTPUT[180]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.523250-0500	RedLemon	   OUTPUT[181]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.523458-0500	RedLemon	   OUTPUT[182]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.523546-0500	RedLemon	   OUTPUT[183]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.523632-0500	RedLemon	   OUTPUT[184]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.523899-0500	RedLemon	   OUTPUT[185]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.524315-0500	RedLemon	   OUTPUT[186]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.524436-0500	RedLemon	   OUTPUT[187]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.524703-0500	RedLemon	   OUTPUT[188]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.524908-0500	RedLemon	   OUTPUT[189]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.525038-0500	RedLemon	   OUTPUT[190]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.525142-0500	RedLemon	   OUTPUT[191]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.525362-0500	RedLemon	   OUTPUT[192]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.525465-0500	RedLemon	   OUTPUT[193]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.525553-0500	RedLemon	   OUTPUT[194]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.525633-0500	RedLemon	   OUTPUT[195]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.525712-0500	RedLemon	   OUTPUT[196]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.525788-0500	RedLemon	   OUTPUT[197]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.525870-0500	RedLemon	   OUTPUT[198]: [RD⚡] Comet 1080p | 1080p | comet | Subtitles: 3
default	15:40:22.525957-0500	RedLemon	   OUTPUT[199]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:40:22.526041-0500	RedLemon	   OUTPUT[200]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:40:22.526345-0500	RedLemon	   OUTPUT[201]: [RD⚡] Comet 720p | 720p | comet | Subtitles: 3
default	15:40:22.526439-0500	RedLemon	   OUTPUT[202]: [RD⚡] Comet 480p | 480p | comet | Subtitles: 3
default	15:40:22.526525-0500	RedLemon	   OUTPUT[203]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:40:22.526602-0500	RedLemon	   OUTPUT[204]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:40:22.526679-0500	RedLemon	   OUTPUT[205]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:40:22.526753-0500	RedLemon	   OUTPUT[206]: [RD⚡] Comet unknown | unknown | comet | Subtitles: 3
default	15:40:22.735970-0500	RedLemon	Task <E4DEEB2E-0828-49FA-8ECF-A3EE1BA396BD>.<7> received response, status 200 content K
default	15:40:22.736839-0500	RedLemon	Task <E4DEEB2E-0828-49FA-8ECF-A3EE1BA396BD>.<7> response ended
default	15:40:22.736900-0500	RedLemon	Task <E4DEEB2E-0828-49FA-8ECF-A3EE1BA396BD>.<7> done using Connection 33
default	15:40:22.737071-0500	RedLemon	Task <E4DEEB2E-0828-49FA-8ECF-A3EE1BA396BD>.<7> summary for task success {transaction_duration_ms=2265, response_status=200, connection=33, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=2264, response_duration_ms=1, request_bytes=277, response_bytes=19768, cache_hit=false}
default	15:40:22.737262-0500	RedLemon	Task <E4DEEB2E-0828-49FA-8ECF-A3EE1BA396BD>.<7> finished successfully
default	15:40:22.742790-0500	RedLemon	Task <C305F744-D81A-4100-B316-28CABA913810>.<373> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:22.743153-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [58248732-0EAA-430B-8F0C-4623D01100BB] (reporting strategy default)> on Task <C305F744-D81A-4100-B316-28CABA913810>.<373> was not selected for reporting
default	15:40:22.745138-0500	RedLemon	Connection 39: starting, TC(0x0)
default	15:40:22.745213-0500	RedLemon	[C39 B1038230-A0FE-4758-A59F-3D558FAB0C36 127.0.0.1:47253 tcp, url hash: 97ba3142, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{1435407D-6715-4454-9491-992EFDB80106}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:22.745300-0500	RedLemon	[C39 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	15:40:22.745701-0500	RedLemon	[C39 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), interface: lo0)] event: path:satisfied @0.000s, uuid: C5D61964-DD1F-4DD7-B752-BBECD7C28999
default	15:40:22.747457-0500	RedLemon	[C39 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), interface: lo0)] event: flow:start_connect @0.002s
default	15:40:22.747493-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C39] reporting state preparing
default	15:40:22.747756-0500	RedLemon	Task <C305F744-D81A-4100-B316-28CABA913810>.<373> setting up Connection 39
default	15:40:22.748106-0500	RedLemon	nw_socket_handle_socket_event [C39:2] Socket received CONNECTED event
default	15:40:22.748217-0500	RedLemon	nw_flow_connected [C39 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	15:40:22.748265-0500	RedLemon	[C39 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.003s
default	15:40:22.748311-0500	RedLemon	nw_flow_connected [C39 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:22.748440-0500	RedLemon	[C39 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.003s
default	15:40:22.748544-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C39] reporting state ready
default	15:40:22.748586-0500	RedLemon	[C39 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.003s
default	15:40:22.749268-0500	RedLemon	Connection 39: connected successfully
default	15:40:22.749512-0500	RedLemon	Connection 39: ready C(N) E(N)
default	15:40:22.749747-0500	RedLemon	Task <C305F744-D81A-4100-B316-28CABA913810>.<373> now using Connection 39
default	15:40:22.749958-0500	RedLemon	Connection 39: received viability advisory(Y)
default	15:40:22.751493-0500	RedLemon	Task <C305F744-D81A-4100-B316-28CABA913810>.<373> sent request, body S 90
default	15:40:22.752728-0500	RedLemon	🔓 Unlock request: infoHash=54753892d63a..., fileIdx=0
default	15:40:22.752860-0500	RedLemon	✅ Token found, attempting unlock...
default	15:40:22.753174-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:22.753690-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [482E7B4F-2173-45F3-9018-8F330DE246F0] (reporting strategy default)> on Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> was not selected for reporting
default	15:40:22.755080-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:22.755301-0500	RedLemon	Connection 0: creating secure tcp or quic connection
default	15:40:22.755666-0500	RedLemon	Connection 40: enabling TLS
default	15:40:22.755703-0500	RedLemon	Connection 40: starting, TC(0x0)
default	15:40:22.755753-0500	RedLemon	[C40 542448C5-0FB6-421D-96F2-D80C820FECD9 Hostname#ce24cee7:443 quic-connection, url hash: 8f997cc5, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{1435407D-6715-4454-9491-992EFDB80106}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:22.755832-0500	RedLemon	[C40 Hostname#ce24cee7:443 initial path ((null))] event: path:start @0.000s
default	15:40:22.756114-0500	RedLemon	[C40 Hostname#ce24cee7:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 88CFFF26-CDC2-43A2-9E70-00B277F86920
default	15:40:22.756261-0500	RedLemon	[C40 Hostname#ce24cee7:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: transform:start @0.000s
default	15:40:22.756293-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C40] reporting state preparing
default	15:40:22.756532-0500	RedLemon	[C40.1 Hostname#ce24cee7:443 initial path ((null))] event: path:start @0.000s
default	15:40:22.757173-0500	mDNSResponder	[R1219] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'UQeHIChhSN1OpIMvufZIzg=='>, options: 0x8 {use-failover}, client pid: 4995 (RedLemon)
default	15:40:22.756824-0500	RedLemon	[C40.1 Hostname#ce24cee7:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.001s, uuid: 22F4D72C-6EEF-4089-B306-15A224ACB4C3
default	15:40:22.756990-0500	RedLemon	[C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	15:40:22.757134-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> setting up Connection 40
default	15:40:22.788599-0500	RedLemon	nw_endpoint_resolver_update [C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#aa89da2d.443
default	15:40:22.788779-0500	RedLemon	nw_endpoint_resolver_update [C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#98405893.443
default	15:40:22.788892-0500	RedLemon	nw_endpoint_resolver_update [C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#9e81d27a:443
default	15:40:22.789004-0500	RedLemon	nw_endpoint_resolver_update [C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#6183f258:443
default	15:40:22.789423-0500	RedLemon	[C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.033s
default	15:40:22.789721-0500	RedLemon	[C40.1.1 IPv6#aa89da2d.443 initial path ((null))] event: path:start @0.033s
default	15:40:22.790288-0500	RedLemon	[C40.1.1 IPv6#aa89da2d.443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.034s, uuid: 6E8BA607-234C-4054-BEF0-2E534EAD1158
default	15:40:22.790479-0500	RedLemon	[C40.1.1 IPv6#aa89da2d.443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.034s
default	15:40:22.791521-0500	RedLemon	[C40.1.1 IPv6#aa89da2d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.035s
default	15:40:22.792253-0500	RedLemon	[C40.1.1 IPv6#aa89da2d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.036s
default	15:40:22.792454-0500	RedLemon	tcp_output [C40.1.1:3] flags=[S] seq=3987466642, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=3987466642
default	15:40:22.794217-0500	mDNSResponder	[R1219] getaddrinfo stop -- hostname: <mask.hash: 'UQeHIChhSN1OpIMvufZIzg=='>, client pid: 4995 (RedLemon)
default	15:40:22.795058-0500	RedLemon	nw_endpoint_resolver_update [C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv6#98405893.443
default	15:40:22.795207-0500	RedLemon	nw_endpoint_resolver_update [C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#9e81d27a:443
default	15:40:22.795320-0500	RedLemon	nw_endpoint_resolver_update [C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#6183f258:443
default	15:40:22.795502-0500	RedLemon	[C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.039s
default	15:40:22.865333-0500	RedLemon	Task <84F6106D-852F-476A-B7B8-5B83B656FE90>.<6> received response, status 200 content K
default	15:40:22.865852-0500	RedLemon	Task <84F6106D-852F-476A-B7B8-5B83B656FE90>.<6> response ended
default	15:40:22.865931-0500	RedLemon	Task <84F6106D-852F-476A-B7B8-5B83B656FE90>.<6> done using Connection 32
default	15:40:22.866210-0500	RedLemon	Task <84F6106D-852F-476A-B7B8-5B83B656FE90>.<6> summary for task success {transaction_duration_ms=2610, response_status=200, connection=32, reused=1, request_start_ms=1, request_duration_ms=13, response_start_ms=2609, response_duration_ms=0, request_bytes=277, response_bytes=19768, cache_hit=false}
default	15:40:22.866908-0500	RedLemon	Task <84F6106D-852F-476A-B7B8-5B83B656FE90>.<6> finished successfully
default	15:40:22.871504-0500	RedLemon	Task <9593F633-BC0F-4299-85D0-CFFD53A50D0C>.<375> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:22.871897-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [26E9D50B-905D-4422-9050-68B31581E4DA] (reporting strategy default)> on Task <9593F633-BC0F-4299-85D0-CFFD53A50D0C>.<375> was not selected for reporting
default	15:40:22.873394-0500	RedLemon	Connection 41: starting, TC(0x0)
default	15:40:22.873456-0500	RedLemon	[C41 FE17228B-3A05-4062-A1EA-FB7E5629F363 127.0.0.1:47253 tcp, url hash: 97ba3142, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{1435407D-6715-4454-9491-992EFDB80106}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:22.873532-0500	RedLemon	[C41 127.0.0.1:47253 initial path ((null))] event: path:start @0.000s
default	15:40:22.873646-0500	RedLemon	[C41 127.0.0.1:47253 waiting path (satisfied (Path is satisfied), viable, interface: lo0)] event: path:satisfied @0.000s, uuid: C5D61964-DD1F-4DD7-B752-BBECD7C28999
default	15:40:22.874109-0500	RedLemon	[C41 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:start_connect @0.000s
default	15:40:22.874141-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C41] reporting state preparing
default	15:40:22.874342-0500	RedLemon	Task <9593F633-BC0F-4299-85D0-CFFD53A50D0C>.<375> setting up Connection 41
default	15:40:22.874963-0500	RedLemon	nw_socket_handle_socket_event [C41:2] Socket received CONNECTED event
default	15:40:22.875158-0500	RedLemon	nw_flow_connected [C41 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Transport protocol connected (socket)
default	15:40:22.875216-0500	RedLemon	[C41 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_transport @0.001s
default	15:40:22.875267-0500	RedLemon	nw_flow_connected [C41 127.0.0.1:47253 in_progress socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:22.875569-0500	RedLemon	[C41 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:finish_connect @0.002s
default	15:40:22.875752-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C41] reporting state ready
default	15:40:22.875824-0500	RedLemon	[C41 127.0.0.1:47253 ready socket-flow (satisfied (Path is satisfied), viable, interface: lo0)] event: flow:changed_viability @0.002s
default	15:40:22.875895-0500	RedLemon	Connection 41: connected successfully
default	15:40:22.875973-0500	RedLemon	Connection 41: ready C(N) E(N)
default	15:40:22.876270-0500	RedLemon	Task <9593F633-BC0F-4299-85D0-CFFD53A50D0C>.<375> now using Connection 41
default	15:40:22.876488-0500	RedLemon	Connection 41: received viability advisory(Y)
default	15:40:22.877291-0500	RedLemon	Task <9593F633-BC0F-4299-85D0-CFFD53A50D0C>.<375> sent request, body S 90
default	15:40:22.879515-0500	RedLemon	🔓 Unlock request: infoHash=54753892d63a..., fileIdx=0
default	15:40:22.879646-0500	RedLemon	✅ Token found, attempting unlock...
default	15:40:22.903731-0500	RedLemon	tcp_input [C40.1.1:3] flags=[S.] seq=3303737669, ack=3987466643, win=64800 state=SYN_SENT rcv_nxt=0, snd_una=3987466642
default	15:40:22.903939-0500	RedLemon	nw_flow_connected [C40.1.1 IPv6#aa89da2d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:22.904390-0500	RedLemon	[C40.1.1 IPv6#aa89da2d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.148s
default	15:40:22.904515-0500	RedLemon	[C40.1 Hostname#ce24cee7:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.148s
default	15:40:22.904630-0500	RedLemon	[C40 Hostname#ce24cee7:443 in_progress transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.148s
default	15:40:22.905420-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C40.1.1:2][0x7fe76b04b460] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:40:22.905812-0500	RedLemon	boringssl_context_info_handler(2028) [C40.1.1:2][0x7fe76b04b460] Client handshake started
default	15:40:22.906009-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS client enter_early_data
default	15:40:22.906152-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS client read_server_hello
default	15:40:23.090884-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:40:23.091008-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client read_server_hello
default	15:40:23.091471-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:40:23.092036-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client read_certificate_request
default	15:40:23.093286-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client read_server_certificate
default	15:40:23.093399-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:40:23.094099-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C40.1.1:2][0x7fe76b04b460] Performing external trust evaluation
default	15:40:23.094228-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C40.1.1:2][0x7fe76b04b460] Asyncing for external verify block
default	15:40:23.094580-0500	RedLemon	Connection 40: asked to evaluate TLS Trust
default	15:40:23.094882-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> auth completion disp=1 cred=0x0
default	15:40:23.099023-0500	RedLemon	Connection 40: TLS Trust result 0
default	15:40:23.099072-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C40.1.1:2][0x7fe76b04b460] Returning from external verify block with result: true
default	15:40:23.099128-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C40.1.1:2][0x7fe76b04b460] Certificate verification result: OK
default	15:40:23.099416-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client read_server_finished
default	15:40:23.099699-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:40:23.099734-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:40:23.099766-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client send_client_certificate
default	15:40:23.099797-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client complete_second_flight
default	15:40:23.099910-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS 1.3 client done
default	15:40:23.100087-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS client finish_client_handshake
default	15:40:23.100126-0500	RedLemon	boringssl_context_info_handler(2045) [C40.1.1:2][0x7fe76b04b460] Client handshake state: TLS client done
default	15:40:23.100159-0500	RedLemon	boringssl_context_info_handler(2034) [C40.1.1:2][0x7fe76b04b460] Client handshake done
default	15:40:23.100733-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C40.1.1:2][0x7fe76b04b460] TLS connected [version(0x0304) ciphersuite(TLS_AES_256_GCM_SHA384) group(0x001d) signature_alg(0x0804) alpn(h2) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(195ms) flight_time(186ms) rtt(185ms) write_stalls(0) read_stalls(4)]
default	15:40:23.100886-0500	RedLemon	nw_flow_connected [C40.1.1 IPv6#aa89da2d.443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:23.101268-0500	RedLemon	[C40.1.1 IPv6#aa89da2d.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.345s
default	15:40:23.101622-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C40] reporting state ready
default	15:40:23.101759-0500	RedLemon	[C40.1 Hostname#ce24cee7:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.345s
default	15:40:23.101809-0500	RedLemon	[C40 Hostname#ce24cee7:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.346s
default	15:40:23.101988-0500	RedLemon	[C40.1.1 IPv6#aa89da2d.443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.346s
default	15:40:23.102107-0500	RedLemon	[C40.1 Hostname#ce24cee7:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.346s
default	15:40:23.102155-0500	RedLemon	[C40 Hostname#ce24cee7:443 ready transform (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.346s
default	15:40:23.102287-0500	RedLemon	Connection 40: connected successfully
default	15:40:23.102343-0500	RedLemon	Connection 40: TLS handshake complete
default	15:40:23.102608-0500	RedLemon	Connection 40: ready C(N) E(N)
default	15:40:23.103087-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> now using Connection 40
default	15:40:23.103244-0500	RedLemon	Connection 40: received viability advisory(Y)
default	15:40:23.103488-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> sent request, body S 291
default	15:40:23.212692-0500	runningboardd	Invalidating assertion 166-4995-1735 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:23.270765-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:40:23.381753-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:23.381803-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:23.381850-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:23.383120-0500	runningboardd	Invalidating assertion 166-103-1736 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.powerd>:103]
default	15:40:23.499484-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> received response, status 201 content U
default	15:40:23.499639-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> done using Connection 40
default	15:40:23.499867-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> response ended
default	15:40:23.500089-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> summary for task success {transaction_duration_ms=745, response_status=201, connection=40, protocol="h2", domain_lookup_duration_ms=32, connect_duration_ms=309, secure_connection_duration_ms=195, private_relay=false, request_start_ms=348, request_duration_ms=0, response_start_ms=745, response_duration_ms=0, request_bytes=508, response_bytes=196, cache_hit=false}
default	15:40:23.500456-0500	RedLemon	Task <60674D80-B27A-4B4C-A159-9448C44E2608>.<374> finished successfully
default	15:40:23.501027-0500	RedLemon	Task <96859089-B74A-4C2F-AACA-651A3CEB3A9E>.<376> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:23.501609-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [52FDF58A-A545-4FF7-925A-04A4EF71961A] (reporting strategy default)> on Task <96859089-B74A-4C2F-AACA-651A3CEB3A9E>.<376> was not selected for reporting
default	15:40:23.502501-0500	RedLemon	Task <96859089-B74A-4C2F-AACA-651A3CEB3A9E>.<376> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:23.502645-0500	RedLemon	Task <96859089-B74A-4C2F-AACA-651A3CEB3A9E>.<376> now using Connection 40
default	15:40:23.502830-0500	RedLemon	Task <96859089-B74A-4C2F-AACA-651A3CEB3A9E>.<376> sent request, body N 0
default	15:40:23.548096-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:23.548141-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:23.548197-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:23.548969-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:40:23.667768-0500	RedLemon	Task <96859089-B74A-4C2F-AACA-651A3CEB3A9E>.<376> received response, status 200 content U
default	15:40:23.667963-0500	RedLemon	Task <96859089-B74A-4C2F-AACA-651A3CEB3A9E>.<376> done using Connection 40
default	15:40:23.668041-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:23.668489-0500	RedLemon	Task <96859089-B74A-4C2F-AACA-651A3CEB3A9E>.<376> response ended
default	15:40:23.669115-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [0284DB9D-D2FF-41F9-86C8-1053E42C4DEC] (reporting strategy default)> on Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> was not selected for reporting
default	15:40:23.668819-0500	RedLemon	Task <96859089-B74A-4C2F-AACA-651A3CEB3A9E>.<376> summary for task success {transaction_duration_ms=166, response_status=200, connection=40, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=165, response_duration_ms=0, request_bytes=98, response_bytes=461, cache_hit=false}
default	15:40:23.670068-0500	RedLemon	Task <96859089-B74A-4C2F-AACA-651A3CEB3A9E>.<376> finished successfully
default	15:40:23.670337-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:23.670804-0500	RedLemon	Task <5231C811-BF9D-4477-A218-A19B3F3D6AA0>.<377> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:23.671050-0500	RedLemon	Connection 42: enabling TLS
default	15:40:23.671089-0500	RedLemon	Connection 42: starting, TC(0x0)
default	15:40:23.671220-0500	RedLemon	[C42 3800F307-8F36-43E5-82CF-845E19BE1DA6 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{E17121F3-110B-486B-9783-F4C085CB273C}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:23.671498-0500	RedLemon	[C42 Hostname#4638943b:443 initial path ((null))] event: path:start @0.000s
default	15:40:23.671703-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9228423A-7A01-45DE-AF24-84381CC57ECF] (reporting strategy default)> on Task <5231C811-BF9D-4477-A218-A19B3F3D6AA0>.<377> was not selected for reporting
default	15:40:23.671952-0500	RedLemon	[C42 Hostname#4638943b:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: F3D54E15-E8E8-4660-BA00-BDCA321032F2
default	15:40:23.672259-0500	RedLemon	[C42 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:40:23.672302-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state preparing
default	15:40:23.672545-0500	mDNSResponder	[R1220] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 4995 (RedLemon)
default	15:40:23.672585-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> setting up Connection 42
default	15:40:23.672780-0500	RedLemon	Task <5231C811-BF9D-4477-A218-A19B3F3D6AA0>.<377> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:23.673052-0500	RedLemon	Task <5231C811-BF9D-4477-A218-A19B3F3D6AA0>.<377> now using Connection 40
default	15:40:23.673978-0500	mDNSResponder	[R1220] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 4995 (RedLemon)
default	15:40:23.673919-0500	RedLemon	Task <5231C811-BF9D-4477-A218-A19B3F3D6AA0>.<377> sent request, body S 7
default	15:40:23.674510-0500	RedLemon	nw_endpoint_resolver_update [C42 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#880cfe6d:443
default	15:40:23.674489-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1737 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:23.674629-0500	RedLemon	[C42 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.003s
default	15:40:23.674843-0500	runningboardd	Assertion 166-4995-1737 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:23.674889-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 initial path ((null))] event: path:start @0.003s
default	15:40:23.675378-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: C785DB37-64F6-4AC5-8D5E-9AB10608E925
default	15:40:23.675533-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.004s
default	15:40:23.676098-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.004s
default	15:40:23.676979-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.005s
default	15:40:23.677213-0500	RedLemon	tcp_output [C42.1:3] flags=[S] seq=1725057055, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=1725057055
default	15:40:23.677735-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:23.677788-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:23.677833-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:23.680721-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-1738 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:23.680875-0500	runningboardd	Assertion 166-103-1738 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:23.681900-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:23.681941-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:23.681979-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:23.765379-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:40:23.808690-0500	RedLemon	tcp_input [C42.1:3] flags=[S.] seq=2206381764, ack=1725057056, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=1725057055
default	15:40:23.808948-0500	RedLemon	nw_flow_connected [C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:23.809202-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.137s
default	15:40:23.809308-0500	RedLemon	[C42 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.137s
default	15:40:23.809931-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C42.1:2][0x7fe765a6cb30] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:40:23.810154-0500	RedLemon	boringssl_context_info_handler(2028) [C42.1:2][0x7fe765a6cb30] Client handshake started
default	15:40:23.810476-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS client enter_early_data
default	15:40:23.810693-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS client read_server_hello
default	15:40:24.013545-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:40:24.013680-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client read_server_hello
default	15:40:24.014250-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:40:24.015383-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client read_certificate_request
default	15:40:24.015726-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client read_server_certificate
default	15:40:24.015820-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:40:24.016463-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C42.1:2][0x7fe765a6cb30] Performing external trust evaluation
default	15:40:24.016608-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C42.1:2][0x7fe765a6cb30] Asyncing for external verify block
default	15:40:24.017105-0500	RedLemon	Connection 42: asked to evaluate TLS Trust
default	15:40:24.017447-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> auth completion disp=1 cred=0x0
default	15:40:24.017817-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:40:24.023121-0500	RedLemon	Connection 42: TLS Trust result 0
default	15:40:24.023183-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C42.1:2][0x7fe765a6cb30] Returning from external verify block with result: true
default	15:40:24.023237-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C42.1:2][0x7fe765a6cb30] Certificate verification result: OK
default	15:40:24.023550-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client read_server_finished
default	15:40:24.024744-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:40:24.024785-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:40:24.024820-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client send_client_certificate
default	15:40:24.024853-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client complete_second_flight
default	15:40:24.024982-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS 1.3 client done
default	15:40:24.025216-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS client finish_client_handshake
default	15:40:24.025258-0500	RedLemon	boringssl_context_info_handler(2045) [C42.1:2][0x7fe765a6cb30] Client handshake state: TLS client done
default	15:40:24.025293-0500	RedLemon	boringssl_context_info_handler(2034) [C42.1:2][0x7fe765a6cb30] Client handshake done
default	15:40:24.026253-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C42.1:2][0x7fe765a6cb30] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(216ms) flight_time(205ms) rtt(203ms) write_stalls(0) read_stalls(4)]
default	15:40:24.026448-0500	RedLemon	nw_flow_connected [C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:24.026690-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.355s
default	15:40:24.027532-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state ready
default	15:40:24.028006-0500	RedLemon	[C42 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.356s
default	15:40:24.028157-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.356s
default	15:40:24.028228-0500	RedLemon	[C42 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.356s
default	15:40:24.028556-0500	RedLemon	Connection 42: connected successfully
default	15:40:24.028620-0500	RedLemon	Connection 42: TLS handshake complete
default	15:40:24.028851-0500	RedLemon	Connection 42: ready C(N) E(N)
default	15:40:24.029078-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> now using Connection 42
default	15:40:24.029655-0500	RedLemon	Connection 42: received viability advisory(Y)
default	15:40:24.030785-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> sent request, body N 0
default	15:40:24.216984-0500	RedLemon	Task <5231C811-BF9D-4477-A218-A19B3F3D6AA0>.<377> received response, status 204 content U
default	15:40:24.217183-0500	RedLemon	Task <5231C811-BF9D-4477-A218-A19B3F3D6AA0>.<377> done using Connection 40
default	15:40:24.217437-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> received response, status 101 content U
default	15:40:24.217746-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> response ended
default	15:40:24.217839-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> done using Connection 42
default	15:40:24.218040-0500	RedLemon	Task <5231C811-BF9D-4477-A218-A19B3F3D6AA0>.<377> response ended
default	15:40:24.218281-0500	RedLemon	Task <5231C811-BF9D-4477-A218-A19B3F3D6AA0>.<377> summary for task success {transaction_duration_ms=546, response_status=204, connection=40, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=544, response_duration_ms=1, request_bytes=124, response_bytes=48, cache_hit=false}
default	15:40:24.218653-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.547s
default	15:40:24.218919-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state preparing
default	15:40:24.219073-0500	RedLemon	[C42 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.547s
default	15:40:24.219351-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.547s
default	15:40:24.219430-0500	RedLemon	[C42 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.548s
default	15:40:24.219512-0500	RedLemon	nw_flow_connected [C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:24.219691-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.548s
default	15:40:24.219794-0500	RedLemon	[C42 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.548s
default	15:40:24.219856-0500	RedLemon	Task <5231C811-BF9D-4477-A218-A19B3F3D6AA0>.<377> finished successfully
default	15:40:24.220082-0500	RedLemon	nw_flow_connected [C42.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:24.220118-0500	RedLemon	Task <E5626673-781C-4AB5-A673-5E722163B97E>.<378> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:24.220571-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.549s
default	15:40:24.220690-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state ready
default	15:40:24.220848-0500	RedLemon	[C42 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.549s
default	15:40:24.221076-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [6EBC3761-5237-40F7-9B26-B71FC20CE0F3] (reporting strategy default)> on Task <E5626673-781C-4AB5-A673-5E722163B97E>.<378> was not selected for reporting
default	15:40:24.221842-0500	RedLemon	Task <E5626673-781C-4AB5-A673-5E722163B97E>.<378> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:24.221992-0500	RedLemon	Task <E5626673-781C-4AB5-A673-5E722163B97E>.<378> now using Connection 40
default	15:40:24.222161-0500	RedLemon	Task <E5626673-781C-4AB5-A673-5E722163B97E>.<378> sent request, body N 0
default	15:40:24.260262-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:40:24.341243-0500	RedLemon	nw_flow_disconnected [C42.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:40:24.341761-0500	RedLemon	nw_protocol_tcp_log_summary [C42.1:3] 
	[D90BFE6A-425F-483A-B7BB-62D79F630514 <private>:57894<-><private>:443]
	Init: 1, Conn_Time: 131.736ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 152.625ms, rtt_var: 36.437ms rtt_nc: 144.343ms, rtt_var_nc: 54.437ms base rtt: 119ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:40:24.342761-0500	RedLemon	[C42.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.671s, error Socket is not connected
default	15:40:24.342808-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state failed error Socket is not connected
default	15:40:24.342864-0500	RedLemon	[C42 Hostname#4638943b:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.671s
error	15:40:24.342921-0500	RedLemon	nw_read_request_report [C42] Receive failed with error "Socket is not connected"
error	15:40:24.342981-0500	RedLemon	nw_flow_service_reads [C42.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	15:40:24.343039-0500	RedLemon	tcp_output [C42.1:3] flags=[R.] seq=1725058241, ack=2206384795, win=2047 state=CLOSED rcv_nxt=2206384795, snd_una=1725058110
default	15:40:24.343214-0500	RedLemon	tcp_input [C42.1:3] flags=[F.] seq=2206384795, ack=1725058110, win=249 state=CLOSED rcv_nxt=2206384795, snd_una=1725058110
error	15:40:24.343312-0500	RedLemon	Connection 42: received failure notification
default	15:40:24.343517-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> summary for task success {transaction_duration_ms=673, response_status=101, connection=42, protocol="http/1.1", domain_lookup_duration_ms=3, connect_duration_ms=350, secure_connection_duration_ms=216, private_relay=false, request_start_ms=360, request_duration_ms=0, response_start_ms=547, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	15:40:24.343564-0500	RedLemon	nw_flow_add_write_request [C42.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
default	15:40:24.343611-0500	RedLemon	Task <A7F72961-4DA8-44F5-B921-CB45AC67A7A6>.<1> finished successfully
error	15:40:24.343739-0500	RedLemon	nw_write_request_report [C42] Send failed with error "Socket is not connected"
default	15:40:24.344043-0500	RedLemon	Connection 42: cleaning up
default	15:40:24.344312-0500	RedLemon	[C42 3800F307-8F36-43E5-82CF-845E19BE1DA6 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancel
default	15:40:24.344736-0500	RedLemon	[C42 3800F307-8F36-43E5-82CF-845E19BE1DA6 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancelled
	[C42.1 C785DB37-64F6-4AC5-8D5E-9AB10608E925 10.0.0.113:57894<->IPv4#880cfe6d:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.673s, DNS @0.000s took 0.003s, TCP @0.547s took 0.132s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:40:24.345335-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C42] reporting state cancelled error Socket is not connected
default	15:40:24.345475-0500	RedLemon	Connection 42: done
default	15:40:24.388374-0500	RedLemon	Task <E5626673-781C-4AB5-A673-5E722163B97E>.<378> received response, status 200 content U
default	15:40:24.388555-0500	RedLemon	Task <E5626673-781C-4AB5-A673-5E722163B97E>.<378> done using Connection 40
default	15:40:24.388844-0500	RedLemon	Task <E5626673-781C-4AB5-A673-5E722163B97E>.<378> response ended
default	15:40:24.389128-0500	RedLemon	Task <E5626673-781C-4AB5-A673-5E722163B97E>.<378> summary for task success {transaction_duration_ms=167, response_status=200, connection=40, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=166, response_duration_ms=0, request_bytes=98, response_bytes=501, cache_hit=true}
default	15:40:24.389488-0500	RedLemon	Task <E5626673-781C-4AB5-A673-5E722163B97E>.<378> finished successfully
default	15:40:24.390193-0500	RedLemon	Task <F27BDD4D-FC60-4FD4-8AFE-E652F70718A9>.<379> resuming, timeouts(60.0, 604800.0) QOS(0x15) Voucher (null)
default	15:40:24.390862-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5987D5D4-B981-42F8-9D20-3A9BE5961E10] (reporting strategy default)> on Task <F27BDD4D-FC60-4FD4-8AFE-E652F70718A9>.<379> was not selected for reporting
default	15:40:24.392011-0500	RedLemon	Task <F27BDD4D-FC60-4FD4-8AFE-E652F70718A9>.<379> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:24.392227-0500	RedLemon	Task <F27BDD4D-FC60-4FD4-8AFE-E652F70718A9>.<379> now using Connection 40
default	15:40:24.392698-0500	RedLemon	Task <F27BDD4D-FC60-4FD4-8AFE-E652F70718A9>.<379> sent request, body S 47
default	15:40:24.528666-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:40:24.613174-0500	RedLemon	Task <F27BDD4D-FC60-4FD4-8AFE-E652F70718A9>.<379> received response, status 200 content U
default	15:40:24.613399-0500	RedLemon	Task <F27BDD4D-FC60-4FD4-8AFE-E652F70718A9>.<379> done using Connection 40
default	15:40:24.613724-0500	RedLemon	Task <F27BDD4D-FC60-4FD4-8AFE-E652F70718A9>.<379> response ended
default	15:40:24.614053-0500	RedLemon	Task <F27BDD4D-FC60-4FD4-8AFE-E652F70718A9>.<379> summary for task success {transaction_duration_ms=222, response_status=200, connection=40, reused=1, request_start_ms=1, request_duration_ms=0, response_start_ms=221, response_duration_ms=0, request_bytes=150, response_bytes=502, cache_hit=true}
default	15:40:24.614408-0500	RedLemon	Task <F27BDD4D-FC60-4FD4-8AFE-E652F70718A9>.<379> finished successfully
default	15:40:24.615312-0500	RedLemon	✅ Unlocked successfully: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	15:40:24.615349-0500	RedLemon	✅ Unlocked successfully: Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	15:40:24.616441-0500	RedLemon	Task <9593F633-BC0F-4299-85D0-CFFD53A50D0C>.<375> received response, status 200 content K
default	15:40:24.616633-0500	RedLemon	Task <9593F633-BC0F-4299-85D0-CFFD53A50D0C>.<375> response ended
default	15:40:24.616709-0500	RedLemon	Task <9593F633-BC0F-4299-85D0-CFFD53A50D0C>.<375> done using Connection 41
default	15:40:24.616877-0500	RedLemon	Task <C305F744-D81A-4100-B316-28CABA913810>.<373> received response, status 200 content K
default	15:40:24.616883-0500	RedLemon	Task <9593F633-BC0F-4299-85D0-CFFD53A50D0C>.<375> summary for task success {transaction_duration_ms=1744, response_status=200, connection=41, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=2, secure_connection_duration_ms=0, private_relay=false, request_start_ms=4, request_duration_ms=0, response_start_ms=1744, response_duration_ms=0, request_bytes=372, response_bytes=358, cache_hit=true}
default	15:40:24.617047-0500	RedLemon	Task <C305F744-D81A-4100-B316-28CABA913810>.<373> response ended
default	15:40:24.617108-0500	RedLemon	Task <9593F633-BC0F-4299-85D0-CFFD53A50D0C>.<375> finished successfully
default	15:40:24.617204-0500	RedLemon	Task <C305F744-D81A-4100-B316-28CABA913810>.<373> done using Connection 39
default	15:40:24.617408-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	15:40:24.617512-0500	RedLemon	Task <C305F744-D81A-4100-B316-28CABA913810>.<373> summary for task success {transaction_duration_ms=1874, response_status=200, connection=39, protocol="http/1.1", domain_lookup_duration_ms=0, connect_duration_ms=1, secure_connection_duration_ms=0, private_relay=false, request_start_ms=6, request_duration_ms=1, response_start_ms=1873, response_duration_ms=0, request_bytes=372, response_bytes=358, cache_hit=true}
default	15:40:24.617676-0500	RedLemon	Task <003CF7C2-B69B-46C3-9924-838B4BBCE913>.<380> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:24.617676-0500	RedLemon	Task <308291E3-3797-49B1-9EF6-9AFDBFE19007>.<381> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:24.617726-0500	RedLemon	Task <34CB0F71-6150-4934-9EEF-743E461DE3C2>.<382> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:24.619250-0500	RedLemon	Task <C305F744-D81A-4100-B316-28CABA913810>.<373> finished successfully
default	15:40:24.619530-0500	RedLemon	📥 StreamService: Pre-downloading 3 subtitles...
default	15:40:24.619628-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [E864AA1E-8960-4BB0-BD18-D29F0A5D8029] (reporting strategy default)> on Task <003CF7C2-B69B-46C3-9924-838B4BBCE913>.<380> was not selected for reporting
default	15:40:24.619522-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [146AB851-9252-4CF0-8A16-104C521BD6C2] (reporting strategy default)> on Task <308291E3-3797-49B1-9EF6-9AFDBFE19007>.<381> was not selected for reporting
default	15:40:24.619910-0500	RedLemon	Task <A60C4266-7E71-411A-B8BC-3A0D6E8B8E9D>.<384> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:24.619950-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [D8E8998B-DF9B-46B1-A5D4-E21E7E20882A] (reporting strategy default)> on Task <34CB0F71-6150-4934-9EEF-743E461DE3C2>.<382> was not selected for reporting
default	15:40:24.619910-0500	RedLemon	Task <492D7D55-6EA1-48AE-B542-1842B6C20813>.<383> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:24.620040-0500	RedLemon	Task <77748F36-28B1-4B75-A42B-AC33E415E457>.<385> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:24.622309-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [ED58D05C-FD65-45D3-9278-6309A0825A04] (reporting strategy default)> on Task <77748F36-28B1-4B75-A42B-AC33E415E457>.<385> was not selected for reporting
default	15:40:24.622884-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C1D47E5C-0FBB-4370-8984-A8F466F8D0D6] (reporting strategy default)> on Task <492D7D55-6EA1-48AE-B542-1842B6C20813>.<383> was not selected for reporting
default	15:40:24.623483-0500	RedLemon	Task <003CF7C2-B69B-46C3-9924-838B4BBCE913>.<380> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:24.623733-0500	RedLemon	Task <003CF7C2-B69B-46C3-9924-838B4BBCE913>.<380> now using Connection 28
default	15:40:24.623955-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [FA3464A0-4996-4E7D-BEF8-F148D9A1F577] (reporting strategy default)> on Task <A60C4266-7E71-411A-B8BC-3A0D6E8B8E9D>.<384> was not selected for reporting
default	15:40:24.626027-0500	RedLemon	Task <308291E3-3797-49B1-9EF6-9AFDBFE19007>.<381> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:24.626440-0500	RedLemon	Task <308291E3-3797-49B1-9EF6-9AFDBFE19007>.<381> now using Connection 28
default	15:40:24.629074-0500	RedLemon	Task <34CB0F71-6150-4934-9EEF-743E461DE3C2>.<382> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:24.629287-0500	RedLemon	Task <34CB0F71-6150-4934-9EEF-743E461DE3C2>.<382> now using Connection 28
default	15:40:24.630832-0500	RedLemon	Task <77748F36-28B1-4B75-A42B-AC33E415E457>.<385> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:24.630970-0500	RedLemon	Task <77748F36-28B1-4B75-A42B-AC33E415E457>.<385> now using Connection 28
default	15:40:24.631642-0500	RedLemon	Task <492D7D55-6EA1-48AE-B542-1842B6C20813>.<383> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:24.631793-0500	RedLemon	Task <492D7D55-6EA1-48AE-B542-1842B6C20813>.<383> now using Connection 28
default	15:40:24.632616-0500	RedLemon	Task <A60C4266-7E71-411A-B8BC-3A0D6E8B8E9D>.<384> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:24.632772-0500	RedLemon	Task <A60C4266-7E71-411A-B8BC-3A0D6E8B8E9D>.<384> now using Connection 28
default	15:40:24.633502-0500	RedLemon	0x7fe7659ee378 ID=12 Task <003CF7C2-B69B-46C3-9924-838B4BBCE913>.<380> sent request, body N 0
default	15:40:24.633563-0500	RedLemon	0x7fe7659ff4f8 ID=16 Task <308291E3-3797-49B1-9EF6-9AFDBFE19007>.<381> sent request, body N 0
default	15:40:24.633609-0500	RedLemon	0x7fe768f4b9b8 ID=20 Task <34CB0F71-6150-4934-9EEF-743E461DE3C2>.<382> sent request, body N 0
default	15:40:24.633650-0500	RedLemon	0x7fe765af2af8 ID=24 Task <77748F36-28B1-4B75-A42B-AC33E415E457>.<385> sent request, body N 0
default	15:40:24.633687-0500	RedLemon	0x7fe765aa1ef8 ID=28 Task <492D7D55-6EA1-48AE-B542-1842B6C20813>.<383> sent request, body N 0
default	15:40:24.633723-0500	RedLemon	0x7fe765a91878 ID=32 Task <A60C4266-7E71-411A-B8BC-3A0D6E8B8E9D>.<384> sent request, body N 0
default	15:40:24.687161-0500	runningboardd	Invalidating assertion 166-4995-1737 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:24.758311-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:40:24.799067-0500	RedLemon	0x7fe768f4b9b8 ID=20 Task <34CB0F71-6150-4934-9EEF-743E461DE3C2>.<382> received response, status 200 content U
default	15:40:24.804712-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1739 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:24.806134-0500	runningboardd	Assertion 166-4995-1739 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:24.807265-0500	runningboardd	Attempting to rename power assertion 33915 for target anon<RedLemon>(501) to anon<RedLemon>(501);166-4995-1737:com.apple.CFNetwork.StorageDB;166-4995-1739:com.apple.CFNetwork.StorageDB
default	15:40:24.807568-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:24.807615-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:24.807657-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:24.810159-0500	RedLemon	Task <34CB0F71-6150-4934-9EEF-743E461DE3C2>.<382> response ended
default	15:40:24.810569-0500	RedLemon	Task <34CB0F71-6150-4934-9EEF-743E461DE3C2>.<382> done using Connection 28
default	15:40:24.810786-0500	RedLemon	Task <34CB0F71-6150-4934-9EEF-743E461DE3C2>.<382> summary for task success {transaction_duration_ms=188, response_status=200, connection=28, reused=1, request_start_ms=7, request_duration_ms=4, response_start_ms=176, response_duration_ms=11, request_bytes=112, response_bytes=39898, cache_hit=true}
default	15:40:24.811008-0500	RedLemon	Task <34CB0F71-6150-4934-9EEF-743E461DE3C2>.<382> finished successfully
default	15:40:24.811312-0500	RedLemon	0x7fe7659ff4f8 ID=16 Task <308291E3-3797-49B1-9EF6-9AFDBFE19007>.<381> received response, status 200 content U
default	15:40:24.856239-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:24.856300-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:24.856307-0500	runningboardd	Attempting to rename power assertion 33915 for target anon<RedLemon>(501) to anon<RedLemon>(501)166-4995-1739:com.apple.CFNetwork.StorageDB
default	15:40:24.856347-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:24.881043-0500	RedLemon	Task <308291E3-3797-49B1-9EF6-9AFDBFE19007>.<381> response ended
default	15:40:24.881381-0500	RedLemon	Task <308291E3-3797-49B1-9EF6-9AFDBFE19007>.<381> done using Connection 28
default	15:40:24.881594-0500	RedLemon	Task <308291E3-3797-49B1-9EF6-9AFDBFE19007>.<381> summary for task success {transaction_duration_ms=260, response_status=200, connection=28, reused=1, request_start_ms=5, request_duration_ms=7, response_start_ms=190, response_duration_ms=70, request_bytes=112, response_bytes=91139, cache_hit=true}
default	15:40:24.881803-0500	RedLemon	Task <308291E3-3797-49B1-9EF6-9AFDBFE19007>.<381> finished successfully
default	15:40:24.945154-0500	RedLemon	0x7fe765af2af8 ID=24 Task <77748F36-28B1-4B75-A42B-AC33E415E457>.<385> received response, status 200 content U
default	15:40:24.949361-0500	RedLemon	0x7fe7659ee378 ID=12 Task <003CF7C2-B69B-46C3-9924-838B4BBCE913>.<380> received response, status 200 content K
default	15:40:24.950563-0500	RedLemon	Task <003CF7C2-B69B-46C3-9924-838B4BBCE913>.<380> response ended
default	15:40:24.950942-0500	RedLemon	Task <003CF7C2-B69B-46C3-9924-838B4BBCE913>.<380> done using Connection 28
default	15:40:24.951160-0500	RedLemon	Task <003CF7C2-B69B-46C3-9924-838B4BBCE913>.<380> summary for task success {transaction_duration_ms=330, response_status=200, connection=28, reused=1, request_start_ms=3, request_duration_ms=9, response_start_ms=328, response_duration_ms=1, request_bytes=112, response_bytes=3282, cache_hit=true}
default	15:40:24.951525-0500	RedLemon	Task <003CF7C2-B69B-46C3-9924-838B4BBCE913>.<380> finished successfully
default	15:40:24.952332-0500	RedLemon	0x7fe765aa1ef8 ID=28 Task <492D7D55-6EA1-48AE-B542-1842B6C20813>.<383> received response, status 200 content U
default	15:40:24.953236-0500	RedLemon	Task <77748F36-28B1-4B75-A42B-AC33E415E457>.<385> response ended
default	15:40:24.953615-0500	RedLemon	Task <77748F36-28B1-4B75-A42B-AC33E415E457>.<385> done using Connection 28
default	15:40:24.953859-0500	RedLemon	Task <77748F36-28B1-4B75-A42B-AC33E415E457>.<385> summary for task success {transaction_duration_ms=329, response_status=200, connection=28, reused=1, request_start_ms=6, request_duration_ms=2, response_start_ms=320, response_duration_ms=8, request_bytes=112, response_bytes=39903, cache_hit=true}
default	15:40:24.954058-0500	RedLemon	Task <77748F36-28B1-4B75-A42B-AC33E415E457>.<385> finished successfully
default	15:40:24.955806-0500	RedLemon	0x7fe765a91878 ID=32 Task <A60C4266-7E71-411A-B8BC-3A0D6E8B8E9D>.<384> received response, status 200 content K
default	15:40:24.956319-0500	RedLemon	Task <A60C4266-7E71-411A-B8BC-3A0D6E8B8E9D>.<384> response ended
default	15:40:24.956744-0500	RedLemon	Task <A60C4266-7E71-411A-B8BC-3A0D6E8B8E9D>.<384> done using Connection 28
default	15:40:24.957081-0500	RedLemon	Task <A60C4266-7E71-411A-B8BC-3A0D6E8B8E9D>.<384> summary for task success {transaction_duration_ms=330, response_status=200, connection=28, reused=1, request_start_ms=6, request_duration_ms=0, response_start_ms=329, response_duration_ms=1, request_bytes=112, response_bytes=3280, cache_hit=true}
default	15:40:24.957284-0500	RedLemon	Task <A60C4266-7E71-411A-B8BC-3A0D6E8B8E9D>.<384> finished successfully
default	15:40:24.965163-0500	RedLemon	🎬🎬🎬 MPVPlayerView INIT called - streamURL: https://chi5-4.download.real-debrid.com/d/LM3TU4MXUKIL2111/F, subtitles: 3
default	15:40:24.967740-0500	RedLemon	Task <492D7D55-6EA1-48AE-B542-1842B6C20813>.<383> response ended
default	15:40:24.968102-0500	RedLemon	Task <492D7D55-6EA1-48AE-B542-1842B6C20813>.<383> done using Connection 28
default	15:40:24.968295-0500	RedLemon	Task <492D7D55-6EA1-48AE-B542-1842B6C20813>.<383> summary for task success {transaction_duration_ms=342, response_status=200, connection=28, reused=1, request_start_ms=6, request_duration_ms=1, response_start_ms=326, response_duration_ms=16, request_bytes=112, response_bytes=91147, cache_hit=true}
default	15:40:24.968734-0500	RedLemon	Task <492D7D55-6EA1-48AE-B542-1842B6C20813>.<383> finished successfully
default	15:40:25.024732-0500	RedLemon	✅ Stream ready, starting playback...
default	15:40:25.024825-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	15:40:25.024986-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7fe768084e90>
default	15:40:25.025078-0500	RedLemon	   Is fullscreen: 0
default	15:40:25.025154-0500	RedLemon	   ✅ WindowManager: Toggling fullscreen ON
default	15:40:25.073846-0500	RedLemon	🖼️ Setting up MPV with native macOS video output...
default	15:40:25.077245-0500	RedLemon	✅ MPV initialized with native GPU rendering
default	15:40:25.080234-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task starting
default	15:40:25.080446-0500	RedLemon	🎉 Starting watch party sync - Room: ABRD, Host: NO
default	15:40:25.080641-0500	RedLemon	🎉 Watch Party Mode ENABLED. isInWatchParty = YES
default	15:40:25.080786-0500	RedLemon	⚠️ Received Realtime message with no chat text
default	15:40:25.138880-0500	runningboardd	Invalidating assertion 166-157-1674 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.WindowServer(88)>:157]
default	15:40:25.154089-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.WindowServer(88)>:157] with description <RBSAssertionDescriptor| "AppVisible" ID:166-157-1740 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:25.154412-0500	runningboardd	Assertion 166-157-1740 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:25.209182-0500	RedLemon	✅ Stream ready, starting playback...
default	15:40:25.209352-0500	RedLemon	🖥️ WindowManager: enterFullscreen() called
default	15:40:25.209589-0500	RedLemon	   Window: <SwiftUI.SwiftUIWindow: 0x7fe768084e90>
default	15:40:25.209693-0500	RedLemon	   Is fullscreen: 1
default	15:40:25.209794-0500	RedLemon	   ⚠️ WindowManager: Already in fullscreen
default	15:40:25.210032-0500	RedLemon	🔄 Starting chat polling for room: ABRD
default	15:40:25.210180-0500	RedLemon	✅ Watch party sync started successfully - isInWatchParty is now TRUE
default	15:40:25.210295-0500	RedLemon	🎬🎬🎬 About to call loadStream - isInWatchParty: YES
default	15:40:25.210386-0500	RedLemon	🎬🎬🎬 Subtitles: 3
default	15:40:25.210550-0500	RedLemon	🎬🎬🎬 LOADSTREAM CALLED - streamTitle: Frankenstein
default	15:40:25.210752-0500	RedLemon	🎬🎬🎬 streamURL: https://chi5-4.download.real-debrid.com/d/LM3TU4MXUKIL2111/F
default	15:40:25.210864-0500	RedLemon	🎬🎬🎬 subtitles: 3
default	15:40:25.211409-0500	RedLemon	🎬 MPV loadVideo called with URL: https://chi5-4.download.real-debrid.com/d/LM3TU4MXUKIL2111/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1., autoplay: false
default	15:40:25.211561-0500	RedLemon	⏸️ Loading in paused mode (watch party)
default	15:40:25.211678-0500	RedLemon	🔗 URL: https://chi5-4.download.real-debrid.com/d/LM3TU4MXUKIL2111/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv
default	15:40:25.211976-0500	RedLemon	🎬 MPV executing: loadfile "https://chi5-4.download.real-debrid.com/d/LM3TU4MXUKIL2111/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.mkv"
default	15:40:25.212275-0500	RedLemon	🎬 MPV loadfile result: 0
default	15:40:25.212587-0500	RedLemon	✅ MPV loadfile succeeded, immediately paused for watch party
default	15:40:25.212903-0500	RedLemon	✅ Subtitles already downloaded, loading as additional options...
default	15:40:25.213177-0500	RedLemon	🎬🎬🎬 MPVPlayerView .task completed
default	15:40:25.338917-0500	mDNSResponder	[R1221] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, Addr) START PID[4995](RedLemon)
default	15:40:25.342180-0500	mDNSResponder	[R1222] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, AAAA) START PID[4995](RedLemon)
default	15:40:25.367547-0500	mDNSResponder	[R1221] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, Addr) STOP PID[4995](RedLemon)
default	15:40:25.367701-0500	mDNSResponder	[R1222] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, AAAA) STOP PID[4995](RedLemon)
default	15:40:25.424247-0500	RedLemon	Task <2154FD97-1603-41BB-A7DD-6564385DD818>.<386> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:25.424844-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [5CBA7BC6-EF66-412C-8D3C-110878B1C009] (reporting strategy default)> on Task <2154FD97-1603-41BB-A7DD-6564385DD818>.<386> was not selected for reporting
default	15:40:25.425468-0500	RedLemon	Task <2154FD97-1603-41BB-A7DD-6564385DD818>.<386> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:25.425735-0500	RedLemon	Task <2154FD97-1603-41BB-A7DD-6564385DD818>.<386> now using Connection 3
default	15:40:25.426122-0500	RedLemon	📝 Loading external subtitle 1 (Frankenstein (2025) eng): /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_0A68CBE1-3D41-45FF-8834-1C146D43F8DE/Frankenstein (2025) eng.srt
default	15:40:25.426362-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_0A68CBE1-3D41-4
default	15:40:25.427135-0500	RedLemon	0x7fe7684649a8 ID=464 Task <2154FD97-1603-41BB-A7DD-6564385DD818>.<386> sent request, body N 0
default	15:40:25.462508-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:40:25.462760-0500	RedLemon	📝 Loading external subtitle 2 (Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX): /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_E8E22101-59AB-45D9-AF31-F814EEC418D0/Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX.eng.srt
default	15:40:25.463112-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_E8E22101-59AB-4
default	15:40:25.492671-0500	RedLemon	0x7fe7684649a8 ID=464 Task <2154FD97-1603-41BB-A7DD-6564385DD818>.<386> received response, status 200 content K
default	15:40:25.493333-0500	RedLemon	Task <2154FD97-1603-41BB-A7DD-6564385DD818>.<386> response ended
default	15:40:25.493532-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:40:25.493763-0500	RedLemon	📝 Loading external subtitle 3 (Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA): /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_BE236F54-0C67-4B8C-99EE-3FB129507A26/Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA.srt
default	15:40:25.494028-0500	RedLemon	📝 Loading subtitle from: /private/var/folders/jc/l80q3kbs1sd9bjsvc347d22r0000gn/T/extract_BE236F54-0C67-4
default	15:40:25.494311-0500	RedLemon	Task <2154FD97-1603-41BB-A7DD-6564385DD818>.<386> done using Connection 3
default	15:40:25.494791-0500	RedLemon	Task <2154FD97-1603-41BB-A7DD-6564385DD818>.<386> summary for task success {transaction_duration_ms=69, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=67, response_duration_ms=1, request_bytes=530, response_bytes=661, cache_hit=false}
default	15:40:25.495403-0500	RedLemon	Task <2154FD97-1603-41BB-A7DD-6564385DD818>.<386> finished successfully
default	15:40:25.529253-0500	RedLemon	✅ External subtitle added to track list (not auto-selected)
default	15:40:25.529413-0500	RedLemon	ℹ️ External subtitles loaded as additional options (embedded subs take priority)
default	15:40:25.535662-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:25.544907-0500	RedLemon	Task <8CFF90BB-7EA6-4F23-AA09-7D6CF153833F>.<387> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:25.545277-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [36CC46B3-A633-4094-80B6-6DF421DA369F] (reporting strategy default)> on Task <8CFF90BB-7EA6-4F23-AA09-7D6CF153833F>.<387> was not selected for reporting
default	15:40:25.547585-0500	RedLemon	Task <8CFF90BB-7EA6-4F23-AA09-7D6CF153833F>.<387> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:25.548223-0500	RedLemon	Task <8CFF90BB-7EA6-4F23-AA09-7D6CF153833F>.<387> now using Connection 34
default	15:40:25.551510-0500	RedLemon	Task <8CFF90BB-7EA6-4F23-AA09-7D6CF153833F>.<387> sent request, body N 0
default	15:40:25.572000-0500	RedLemon	Task <8CFF90BB-7EA6-4F23-AA09-7D6CF153833F>.<387> received response, status 200 content K
default	15:40:25.574964-0500	RedLemon	Task <8CFF90BB-7EA6-4F23-AA09-7D6CF153833F>.<387> done using Connection 34
default	15:40:25.575745-0500	RedLemon	Task <8CFF90BB-7EA6-4F23-AA09-7D6CF153833F>.<387> response ended
default	15:40:25.576428-0500	RedLemon	Task <8CFF90BB-7EA6-4F23-AA09-7D6CF153833F>.<387> summary for task success {transaction_duration_ms=30, response_status=200, connection=34, reused=1, request_start_ms=5, request_duration_ms=0, response_start_ms=26, response_duration_ms=4, request_bytes=41, response_bytes=117950, cache_hit=false}
default	15:40:25.576529-0500	RedLemon	Task <8CFF90BB-7EA6-4F23-AA09-7D6CF153833F>.<387> finished successfully
default	15:40:25.715559-0500	runningboardd	Invalidating assertion 166-157-1740 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.WindowServer(88)>:157]
default	15:40:25.732234-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.WindowServer(88)>:157] with description <RBSAssertionDescriptor| "AppVisible" ID:166-157-1743 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"AppVisible" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:25.732480-0500	runningboardd	Assertion 166-157-1743 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:25.872459-0500	mDNSResponder	[R1223] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, Addr) START PID[4995](RedLemon)
default	15:40:25.873631-0500	mDNSResponder	[R1224] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, AAAA) START PID[4995](RedLemon)
default	15:40:25.874521-0500	mDNSResponder	[R1223] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, Addr) STOP PID[4995](RedLemon)
default	15:40:25.874738-0500	mDNSResponder	[R1224] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, AAAA) STOP PID[4995](RedLemon)
default	15:40:25.905446-0500	runningboardd	Invalidating assertion 166-4995-1739 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:26.082016-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:26.082065-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:26.082112-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:26.083591-0500	runningboardd	Invalidating assertion 166-103-1738 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.powerd>:103]
default	15:40:26.250652-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:26.250754-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:26.250832-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:26.519964-0500	RedLemon	👋 Watch Party: Sending READY signal
default	15:40:26.524492-0500	RedLemon	✅ Watch Party: READY signal sent successfully
default	15:40:27.058613-0500	mDNSResponder	[R1225] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, Addr) START PID[4995](RedLemon)
default	15:40:27.059063-0500	mDNSResponder	[R1226] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, AAAA) START PID[4995](RedLemon)
default	15:40:27.059792-0500	mDNSResponder	[R1225] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, Addr) STOP PID[4995](RedLemon)
default	15:40:27.059874-0500	mDNSResponder	[R1226] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, AAAA) STOP PID[4995](RedLemon)
default	15:40:27.211818-0500	RedLemon	Task <2EF3F5D5-47BA-4035-88D1-0170B8DA0157>.<388> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:27.212532-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [9EDDF150-955C-44C3-8D52-23CBA8816150] (reporting strategy default)> on Task <2EF3F5D5-47BA-4035-88D1-0170B8DA0157>.<388> was not selected for reporting
default	15:40:27.214021-0500	RedLemon	Task <2EF3F5D5-47BA-4035-88D1-0170B8DA0157>.<388> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:27.214344-0500	RedLemon	Task <2EF3F5D5-47BA-4035-88D1-0170B8DA0157>.<388> now using Connection 3
default	15:40:27.215523-0500	RedLemon	0x7fe768582d28 ID=468 Task <2EF3F5D5-47BA-4035-88D1-0170B8DA0157>.<388> sent request, body N 0
default	15:40:27.270855-0500	RedLemon	0x7fe768582d28 ID=468 Task <2EF3F5D5-47BA-4035-88D1-0170B8DA0157>.<388> received response, status 200 content K
default	15:40:27.271593-0500	RedLemon	Task <2EF3F5D5-47BA-4035-88D1-0170B8DA0157>.<388> response ended
default	15:40:27.272310-0500	RedLemon	Task <2EF3F5D5-47BA-4035-88D1-0170B8DA0157>.<388> done using Connection 3
default	15:40:27.272708-0500	RedLemon	Task <2EF3F5D5-47BA-4035-88D1-0170B8DA0157>.<388> summary for task success {transaction_duration_ms=59, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=1, response_start_ms=57, response_duration_ms=1, request_bytes=530, response_bytes=664, cache_hit=false}
default	15:40:27.273040-0500	RedLemon	Task <2EF3F5D5-47BA-4035-88D1-0170B8DA0157>.<388> finished successfully
default	15:40:27.273927-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1744 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:27.274203-0500	runningboardd	Assertion 166-4995-1744 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:27.274990-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:27.275113-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:27.275197-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:27.277035-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-1745 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:27.277255-0500	runningboardd	Assertion 166-103-1745 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:27.278599-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:27.278708-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:27.278796-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:27.283075-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:27.736392-0500	RedLemon	                AUHAL.cpp:386   AUHAL: (0x7fe765168240) Listening to HAL system property 1682929012
default	15:40:27.736603-0500	RedLemon	                AUHAL.cpp:397   AUHAL: (0x7fe765168240) Selecting device 49 from constructor
default	15:40:27.736773-0500	RedLemon	                AUHAL.cpp:570   SelectDevice: -> (0x7fe765168240)
default	15:40:27.736854-0500	RedLemon	                AUHAL.cpp:627   SelectDevice: (0x7fe765168240) not already running
default	15:40:27.736886-0500	RedLemon	                AUHAL.cpp:702   SelectDevice: (0x7fe765168240) nothing to teardown
default	15:40:27.736924-0500	RedLemon	                AUHAL.cpp:706   SelectDevice: (0x7fe765168240) connecting device 49
default	15:40:27.737281-0500	RedLemon	                AUHAL.cpp:3107  IsDeviceUsable: (0x7fe765168240) Device ID: 49 (Input:No | Output:Yes): true
default	15:40:27.737611-0500	RedLemon	                AUHAL.cpp:716   SelectDevice: (0x7fe765168240) created ioproc 0xb for device 49
default	15:40:27.737680-0500	RedLemon	                AUHAL.cpp:1452  UpdateStreamFormats: -> (0x7fe765168240)
default	15:40:27.737982-0500	RedLemon	                AUHAL.cpp:1516  UpdateStreamFormats: 
  output stream 0 [0x32]:  2 ch,  44100 Hz, Float32, interleaved
default	15:40:27.738101-0500	RedLemon	                AUHAL.cpp:1527  UpdateStreamFormats: 1 output streams; not all mono
default	15:40:27.738137-0500	RedLemon	                AUHAL.cpp:1537  UpdateStreamFormats: 
  Output render format:  2 ch,  44100 Hz, Float32, interleaved
default	15:40:27.738173-0500	RedLemon	                AUHAL.cpp:1527  UpdateStreamFormats: 0 input streams; not all mono
default	15:40:27.738585-0500	RedLemon	                AUHAL.cpp:1602  UpdateStreamFormats: AUHAL(0x7fe765168240) Calling PropertyChanged() for kAudioUnitProperty_StreamFormat, Scope:Output, Bus:Output
default	15:40:27.738647-0500	RedLemon	                AUHAL.cpp:1615  UpdateStreamFormats: <-
default	15:40:27.738949-0500	RedLemon	                AUHAL.cpp:820   SelectDevice: (0x7fe765168240) removing 0 device listeners from device 0
default	15:40:27.739080-0500	RedLemon	                AUHAL.cpp:829   SelectDevice: (0x7fe765168240) adding 6 device listeners to device 49
default	15:40:27.739469-0500	RedLemon	                AUHAL.cpp:820   SelectDevice: (0x7fe765168240) removing 0 device delegate listeners from device 0
default	15:40:27.739525-0500	RedLemon	                AUHAL.cpp:829   SelectDevice: (0x7fe765168240) adding 0 device delegate listeners to device 49
default	15:40:27.739558-0500	RedLemon	                AUHAL.cpp:842   SelectDevice: <- (0x7fe765168240)
default	15:40:27.740200-0500	RedLemon	                AUHAL.cpp:1711  SetStreamUsage: Output stream enables: Stream 0 is ENABLED
default	15:40:27.741091-0500	RedLemon	                AUHAL.cpp:1711  SetStreamUsage: Output stream enables: Stream 0 is ENABLED
default	15:40:27.741322-0500	RedLemon	                AUHAL.cpp:2060  SetProperty: (0x7fe765168240) caller requesting device change from 49 to 49
default	15:40:27.741369-0500	RedLemon	                AUHAL.cpp:570   SelectDevice: -> (0x7fe765168240)
default	15:40:27.741400-0500	RedLemon	                AUHAL.cpp:613   SelectDevice: <- (0x7fe765168240) exiting with nothing to do
default	15:40:27.959682-0500	RedLemon	⏱️ Duration update: 9145.8s. WatchParty: YES, SentReady: YES
default	15:40:27.959903-0500	RedLemon	🔍 MPV track-list/count: 43
default	15:40:27.960048-0500	RedLemon	🔍 Track 0 type: sub
default	15:40:27.960186-0500	RedLemon	✅ Found subtitle track: ID=1, lang=en, title=Frankenstein (2025) eng
default	15:40:27.960306-0500	RedLemon	🔍 Track 1 type: sub
default	15:40:27.960445-0500	RedLemon	✅ Found subtitle track: ID=2, lang=en, title=Frankenstein.2025.1080p.NF.WEB-DL.DDP5.1.Atmos.H.264-FLUX
default	15:40:27.960568-0500	RedLemon	🔍 Track 2 type: sub
default	15:40:27.960681-0500	RedLemon	✅ Found subtitle track: ID=3, lang=en, title=Frankenstein.2025.1080p.WEBRip.x264.AAC5.1-LAMA
default	15:40:27.960789-0500	RedLemon	🔍 Track 3 type: video
default	15:40:27.960889-0500	RedLemon	🔍 Track 4 type: audio
default	15:40:27.961002-0500	RedLemon	🔍 Track 5 type: sub
default	15:40:27.961121-0500	RedLemon	✅ Found subtitle track: ID=4, lang=en, title=Forced
default	15:40:27.961232-0500	RedLemon	🔍 Track 6 type: sub
default	15:40:27.961339-0500	RedLemon	✅ Found subtitle track: ID=5, lang=en, title=nil
default	15:40:27.961453-0500	RedLemon	🔍 Track 7 type: sub
default	15:40:27.961577-0500	RedLemon	✅ Found subtitle track: ID=6, lang=en, title=SDH
default	15:40:27.961688-0500	RedLemon	🔍 Track 8 type: sub
default	15:40:27.961807-0500	RedLemon	✅ Found subtitle track: ID=7, lang=ar, title=nil
default	15:40:27.962017-0500	RedLemon	🔍 Track 9 type: sub
default	15:40:27.962210-0500	RedLemon	✅ Found subtitle track: ID=8, lang=ca, title=nil
default	15:40:27.962347-0500	RedLemon	🔍 Track 10 type: sub
default	15:40:27.962488-0500	RedLemon	✅ Found subtitle track: ID=9, lang=cs, title=nil
default	15:40:27.962656-0500	RedLemon	🔍 Track 11 type: sub
default	15:40:27.962806-0500	RedLemon	✅ Found subtitle track: ID=10, lang=da, title=nil
default	15:40:27.962922-0500	RedLemon	🔍 Track 12 type: sub
default	15:40:27.963025-0500	RedLemon	✅ Found subtitle track: ID=11, lang=de, title=nil
default	15:40:27.963126-0500	RedLemon	🔍 Track 13 type: sub
default	15:40:27.963259-0500	RedLemon	✅ Found subtitle track: ID=12, lang=el, title=nil
default	15:40:27.963396-0500	RedLemon	🔍 Track 14 type: sub
default	15:40:27.963485-0500	RedLemon	✅ Found subtitle track: ID=13, lang=es-419, title=Latin American
default	15:40:27.963551-0500	RedLemon	🔍 Track 15 type: sub
default	15:40:27.963613-0500	RedLemon	✅ Found subtitle track: ID=14, lang=es-ES, title=nil
default	15:40:27.963668-0500	RedLemon	🔍 Track 16 type: sub
default	15:40:27.963850-0500	RedLemon	✅ Found subtitle track: ID=15, lang=eu, title=nil
default	15:40:27.964015-0500	RedLemon	🔍 Track 17 type: sub
default	15:40:27.964221-0500	RedLemon	✅ Found subtitle track: ID=16, lang=fi, title=nil
default	15:40:27.964454-0500	RedLemon	🔍 Track 18 type: sub
default	15:40:27.964689-0500	RedLemon	✅ Found subtitle track: ID=17, lang=fil, title=nil
default	15:40:27.964899-0500	RedLemon	🔍 Track 19 type: sub
default	15:40:27.965228-0500	RedLemon	✅ Found subtitle track: ID=18, lang=fr, title=nil
default	15:40:27.965363-0500	RedLemon	🔍 Track 20 type: sub
default	15:40:27.965491-0500	RedLemon	✅ Found subtitle track: ID=19, lang=gl, title=nil
default	15:40:27.965610-0500	RedLemon	🔍 Track 21 type: sub
default	15:40:27.965732-0500	RedLemon	✅ Found subtitle track: ID=20, lang=he, title=nil
default	15:40:27.965851-0500	RedLemon	🔍 Track 22 type: sub
default	15:40:27.966005-0500	RedLemon	✅ Found subtitle track: ID=21, lang=hr, title=nil
default	15:40:27.966135-0500	RedLemon	🔍 Track 23 type: sub
default	15:40:27.966254-0500	RedLemon	✅ Found subtitle track: ID=22, lang=hu, title=nil
default	15:40:27.966379-0500	RedLemon	🔍 Track 24 type: sub
default	15:40:27.966500-0500	RedLemon	✅ Found subtitle track: ID=23, lang=id, title=nil
default	15:40:27.966631-0500	RedLemon	🔍 Track 25 type: sub
default	15:40:27.966761-0500	RedLemon	✅ Found subtitle track: ID=24, lang=it, title=nil
default	15:40:27.966939-0500	RedLemon	🔍 Track 26 type: sub
default	15:40:27.967081-0500	RedLemon	✅ Found subtitle track: ID=25, lang=ja, title=nil
default	15:40:27.967206-0500	RedLemon	🔍 Track 27 type: sub
default	15:40:27.967333-0500	RedLemon	✅ Found subtitle track: ID=26, lang=ko, title=nil
default	15:40:27.967453-0500	RedLemon	🔍 Track 28 type: sub
default	15:40:27.967578-0500	RedLemon	✅ Found subtitle track: ID=27, lang=ms, title=nil
default	15:40:27.967699-0500	RedLemon	🔍 Track 29 type: sub
default	15:40:27.967819-0500	RedLemon	✅ Found subtitle track: ID=28, lang=nb, title=nil
default	15:40:27.967945-0500	RedLemon	🔍 Track 30 type: sub
default	15:40:27.968130-0500	RedLemon	✅ Found subtitle track: ID=29, lang=nl, title=nil
default	15:40:27.968278-0500	RedLemon	🔍 Track 31 type: sub
default	15:40:27.968395-0500	RedLemon	✅ Found subtitle track: ID=30, lang=pl, title=nil
default	15:40:27.968517-0500	RedLemon	🔍 Track 32 type: sub
default	15:40:27.968638-0500	RedLemon	✅ Found subtitle track: ID=31, lang=pt-BR, title=Brazilian
default	15:40:27.968745-0500	RedLemon	🔍 Track 33 type: sub
default	15:40:27.968812-0500	RedLemon	✅ Found subtitle track: ID=32, lang=pt-PT, title=nil
default	15:40:27.968872-0500	RedLemon	🔍 Track 34 type: sub
default	15:40:27.968945-0500	RedLemon	✅ Found subtitle track: ID=33, lang=ro, title=nil
default	15:40:27.969043-0500	RedLemon	🔍 Track 35 type: sub
default	15:40:27.969207-0500	RedLemon	✅ Found subtitle track: ID=34, lang=ru, title=nil
default	15:40:27.969363-0500	RedLemon	🔍 Track 36 type: sub
default	15:40:27.969527-0500	RedLemon	✅ Found subtitle track: ID=35, lang=sv, title=nil
default	15:40:27.969665-0500	RedLemon	🔍 Track 37 type: sub
default	15:40:27.969800-0500	RedLemon	✅ Found subtitle track: ID=36, lang=th, title=nil
default	15:40:27.969932-0500	RedLemon	🔍 Track 38 type: sub
default	15:40:27.970063-0500	RedLemon	✅ Found subtitle track: ID=37, lang=tr, title=nil
default	15:40:27.970191-0500	RedLemon	🔍 Track 39 type: sub
default	15:40:27.970484-0500	RedLemon	✅ Found subtitle track: ID=38, lang=uk, title=nil
default	15:40:27.970642-0500	RedLemon	🔍 Track 40 type: sub
default	15:40:27.970803-0500	RedLemon	✅ Found subtitle track: ID=39, lang=vi, title=nil
default	15:40:27.971012-0500	RedLemon	🔍 Track 41 type: sub
default	15:40:27.971335-0500	RedLemon	✅ Found subtitle track: ID=40, lang=zh-Hans, title=Simplified
default	15:40:27.971463-0500	RedLemon	🔍 Track 42 type: sub
default	15:40:27.971545-0500	RedLemon	✅ Found subtitle track: ID=41, lang=zh-Hant, title=Traditional
default	15:40:27.971606-0500	RedLemon	📊 Total subtitle tracks found: 42 (including Off if needed)
default	15:40:28.036444-0500	mDNSResponder	[R1227] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, Addr) START PID[4995](RedLemon)
default	15:40:28.037749-0500	mDNSResponder	[R1228] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, AAAA) START PID[4995](RedLemon)
default	15:40:28.038616-0500	mDNSResponder	[R1227] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, Addr) STOP PID[4995](RedLemon)
default	15:40:28.038703-0500	mDNSResponder	[R1228] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, AAAA) STOP PID[4995](RedLemon)
default	15:40:28.063009-0500	RedLemon	⏱️ Duration update: 9145.8s. WatchParty: YES, SentReady: YES
default	15:40:28.173835-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:28.174405-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [63AE1B74-B61B-4453-8BC8-E43BA781DD6F] (reporting strategy default)> on Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> was not selected for reporting
default	15:40:28.175401-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:28.176116-0500	RedLemon	Connection 43: enabling TLS
default	15:40:28.176177-0500	RedLemon	Connection 43: starting, TC(0x0)
default	15:40:28.176258-0500	RedLemon	[C43 7B45AF7F-B996-4DAA-BA2A-34FF60271C09 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{0864D7AF-C5A4-4B15-AB72-F8387B2D909D}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:28.176390-0500	RedLemon	[C43 Hostname#4638943b:443 initial path ((null))] event: path:start @0.000s
default	15:40:28.176907-0500	RedLemon	[C43 Hostname#4638943b:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 794D97DD-AA5C-444A-9B1A-A4AB02C8D7A1
default	15:40:28.177192-0500	RedLemon	[C43 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.000s
default	15:40:28.177253-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state preparing
default	15:40:28.177562-0500	mDNSResponder	[R1229] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 4995 (RedLemon)
default	15:40:28.177509-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> setting up Connection 43
default	15:40:28.178756-0500	mDNSResponder	[R1229] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 4995 (RedLemon)
default	15:40:28.178937-0500	RedLemon	nw_endpoint_resolver_update [C43 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#880cfe6d:443
default	15:40:28.179075-0500	RedLemon	[C43 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.002s
default	15:40:28.179327-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 initial path ((null))] event: path:start @0.003s
default	15:40:28.179811-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.003s, uuid: 827F19FE-4BCD-4880-AC76-73E1E0CE612D
default	15:40:28.180236-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.003s
default	15:40:28.180932-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.004s
default	15:40:28.181629-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.005s
default	15:40:28.181767-0500	RedLemon	tcp_output [C43.1:3] flags=[S] seq=416832035, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=416832035
default	15:40:28.279437-0500	runningboardd	Invalidating assertion 166-4995-1744 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:28.348710-0500	RedLemon	tcp_input [C43.1:3] flags=[S.] seq=2503990810, ack=416832036, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=416832035
default	15:40:28.348906-0500	RedLemon	nw_flow_connected [C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:28.349103-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.172s
default	15:40:28.349195-0500	RedLemon	[C43 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.172s
default	15:40:28.349764-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C43.1:2][0x7fe7692dbb10] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:40:28.349957-0500	RedLemon	boringssl_context_info_handler(2028) [C43.1:2][0x7fe7692dbb10] Client handshake started
default	15:40:28.350261-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS client enter_early_data
default	15:40:28.350461-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS client read_server_hello
default	15:40:28.387335-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:28.387382-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:28.387428-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:28.389066-0500	runningboardd	Invalidating assertion 166-103-1745 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.powerd>:103]
default	15:40:28.476677-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:40:28.476809-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client read_server_hello
default	15:40:28.477296-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:40:28.477863-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client read_certificate_request
default	15:40:28.479036-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client read_server_certificate
default	15:40:28.479177-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:40:28.480262-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C43.1:2][0x7fe7692dbb10] Performing external trust evaluation
default	15:40:28.480544-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C43.1:2][0x7fe7692dbb10] Asyncing for external verify block
default	15:40:28.480700-0500	RedLemon	Connection 43: asked to evaluate TLS Trust
default	15:40:28.480983-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> auth completion disp=1 cred=0x0
default	15:40:28.486474-0500	RedLemon	Connection 43: TLS Trust result 0
default	15:40:28.486524-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C43.1:2][0x7fe7692dbb10] Returning from external verify block with result: true
default	15:40:28.486613-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C43.1:2][0x7fe7692dbb10] Certificate verification result: OK
default	15:40:28.486924-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client read_server_finished
default	15:40:28.487082-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:40:28.487103-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:40:28.487145-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client send_client_certificate
default	15:40:28.487174-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client complete_second_flight
default	15:40:28.487313-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS 1.3 client done
default	15:40:28.487478-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS client finish_client_handshake
default	15:40:28.487548-0500	RedLemon	boringssl_context_info_handler(2045) [C43.1:2][0x7fe7692dbb10] Client handshake state: TLS client done
default	15:40:28.487588-0500	RedLemon	boringssl_context_info_handler(2034) [C43.1:2][0x7fe7692dbb10] Client handshake done
default	15:40:28.488173-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C43.1:2][0x7fe7692dbb10] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(138ms) flight_time(127ms) rtt(126ms) write_stalls(0) read_stalls(7)]
default	15:40:28.488370-0500	RedLemon	nw_flow_connected [C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:28.488739-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.312s
default	15:40:28.488903-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state ready
default	15:40:28.488969-0500	RedLemon	[C43 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.312s
default	15:40:28.489053-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.312s
default	15:40:28.489099-0500	RedLemon	[C43 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.312s
default	15:40:28.489367-0500	RedLemon	Connection 43: connected successfully
default	15:40:28.489413-0500	RedLemon	Connection 43: TLS handshake complete
default	15:40:28.489665-0500	RedLemon	Connection 43: ready C(N) E(N)
default	15:40:28.489902-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> now using Connection 43
default	15:40:28.489995-0500	RedLemon	Connection 43: received viability advisory(Y)
default	15:40:28.490217-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> sent request, body N 0
default	15:40:28.539601-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:28.539681-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:28.539764-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:28.660660-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> received response, status 101 content U
default	15:40:28.660928-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> response ended
default	15:40:28.661005-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> done using Connection 43
default	15:40:28.661703-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.485s
default	15:40:28.661775-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state preparing
default	15:40:28.661849-0500	RedLemon	[C43 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.485s
default	15:40:28.662003-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.485s
default	15:40:28.662113-0500	RedLemon	[C43 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.485s
default	15:40:28.662380-0500	RedLemon	nw_flow_connected [C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:28.662623-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.486s
default	15:40:28.662683-0500	RedLemon	[C43 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.486s
default	15:40:28.662817-0500	RedLemon	nw_flow_connected [C43.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:28.663258-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.486s
default	15:40:28.663321-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state ready
default	15:40:28.663417-0500	RedLemon	[C43 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.487s
default	15:40:28.792270-0500	RedLemon	nw_flow_disconnected [C43.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:40:28.792826-0500	RedLemon	nw_protocol_tcp_log_summary [C43.1:3] 
	[6B14CF42-453B-4AB9-B275-28EC8F8EA381 <private>:57895<-><private>:443]
	Init: 1, Conn_Time: 167.117ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 146.187ms, rtt_var: 23.812ms rtt_nc: 158.031ms, rtt_var_nc: 50.500ms base rtt: 124ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:40:28.793814-0500	RedLemon	[C43.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.617s, error Socket is not connected
default	15:40:28.793859-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state failed error Socket is not connected
default	15:40:28.793917-0500	RedLemon	[C43 Hostname#4638943b:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.617s
error	15:40:28.793977-0500	RedLemon	nw_read_request_report [C43] Receive failed with error "Socket is not connected"
error	15:40:28.794107-0500	RedLemon	nw_flow_service_reads [C43.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
error	15:40:28.794193-0500	RedLemon	tcp_output [C43.1:3] flags=[R.] seq=416833223, ack=2503993842, win=2047 state=CLOSED rcv_nxt=2503993842, snd_una=416833092
default	15:40:28.794377-0500	RedLemon	tcp_input [C43.1:3] flags=[F.] seq=2503993842, ack=416833092, win=249 state=CLOSED rcv_nxt=2503993842, snd_una=416833092
error	15:40:28.794528-0500	RedLemon	Connection 43: received failure notification
default	15:40:28.794859-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> summary for task success {transaction_duration_ms=619, response_status=101, connection=43, protocol="http/1.1", domain_lookup_duration_ms=2, connect_duration_ms=307, secure_connection_duration_ms=138, private_relay=false, request_start_ms=315, request_duration_ms=0, response_start_ms=485, response_duration_ms=0, request_bytes=359, response_bytes=330, cache_hit=false}
error	15:40:28.794872-0500	RedLemon	nw_flow_add_write_request [C43.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	15:40:28.794941-0500	RedLemon	nw_write_request_report [C43] Send failed with error "Socket is not connected"
default	15:40:28.794939-0500	RedLemon	Task <6221556A-C38F-4406-8509-49521502C9B4>.<1> finished successfully
default	15:40:28.795013-0500	RedLemon	Connection 43: cleaning up
default	15:40:28.795088-0500	RedLemon	[C43 7B45AF7F-B996-4DAA-BA2A-34FF60271C09 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancel
default	15:40:28.795229-0500	RedLemon	[C43 7B45AF7F-B996-4DAA-BA2A-34FF60271C09 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancelled
	[C43.1 827F19FE-4BCD-4880-AC76-73E1E0CE612D 10.0.0.113:57895<->IPv4#880cfe6d:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.618s, DNS @0.000s took 0.002s, TCP @0.485s took 0.167s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:40:28.795878-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C43] reporting state cancelled error Socket is not connected
default	15:40:28.795986-0500	RedLemon	Connection 43: done
default	15:40:28.898575-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [daemon<com.apple.powerd>:103] with description <RBSAssertionDescriptor| "App is holding power assertion" ID:166-103-1747 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.appnap" name:"PowerAssertion" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:28.899051-0500	runningboardd	Assertion 166-103-1747 (target:[anon<RedLemon>(501):4995]) will be created as active
default	15:40:28.903492-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:28.903759-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:28.903805-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:28.919090-0500	CAReportingService	    CAReportingService.mm:465   sessions for client 197 : (
    "reporterID=846108557317,serviceName=audiodeviceusage,ownerPid=197,clientProcessName=(null),HostApplicationDisplayID=com.redlemon.app,started=1,singleMessageSession=0",
    "reporterID=846108557313,serviceName=audiodeviceusage,ownerPid=197,clientProcessName=(null),HostApplicationDisplayID=com.google.antigravity.helper,started=0,singleMessageSession=0"
)
default	15:40:28.919214-0500	CAReportingService	    CAReportingService.mm:577   1 active reporting session(s) (
    "reporterID=846108557317,serviceName=audiodeviceusage,ownerPid=197,clientProcessName=(null),HostApplicationDisplayID=com.redlemon.app,started=1,singleMessageSession=0"
)
default	15:40:29.294493-0500	RedLemon	Task <31E5172B-E9C7-4959-AA0B-0F89854CBDF1>.<389> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:29.298540-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [AA38FF6D-56F5-4E1A-90F4-7C57C6C84F3B] (reporting strategy default)> on Task <31E5172B-E9C7-4959-AA0B-0F89854CBDF1>.<389> was not selected for reporting
default	15:40:29.300256-0500	RedLemon	Task <31E5172B-E9C7-4959-AA0B-0F89854CBDF1>.<389> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:29.301321-0500	RedLemon	Task <31E5172B-E9C7-4959-AA0B-0F89854CBDF1>.<389> now using Connection 3
default	15:40:29.308922-0500	RedLemon	0x7fe7692b70e8 ID=472 Task <31E5172B-E9C7-4959-AA0B-0F89854CBDF1>.<389> sent request, body N 0
default	15:40:29.375561-0500	RedLemon	0x7fe7692b70e8 ID=472 Task <31E5172B-E9C7-4959-AA0B-0F89854CBDF1>.<389> received response, status 200 content K
default	15:40:29.376205-0500	RedLemon	Task <31E5172B-E9C7-4959-AA0B-0F89854CBDF1>.<389> response ended
default	15:40:29.376575-0500	RedLemon	Task <31E5172B-E9C7-4959-AA0B-0F89854CBDF1>.<389> done using Connection 3
default	15:40:29.378613-0500	RedLemon	Task <31E5172B-E9C7-4959-AA0B-0F89854CBDF1>.<389> summary for task success {transaction_duration_ms=79, response_status=200, connection=3, reused=1, request_start_ms=1, request_duration_ms=7, response_start_ms=75, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=false}
default	15:40:29.385719-0500	RedLemon	Task <31E5172B-E9C7-4959-AA0B-0F89854CBDF1>.<389> finished successfully
default	15:40:29.403084-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1748 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:29.403347-0500	runningboardd	Assertion 166-4995-1748 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:29.405323-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:29.405364-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:29.405599-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:29.422039-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:29.611377-0500	RedLemon	tcp_input [C40.1.1:3] flags=[FP.] seq=3303744564, ack=3987468483, win=501 state=ESTABLISHED rcv_nxt=3303744564, snd_una=3987468483
default	15:40:29.611777-0500	RedLemon	nw_protocol_tcp_log_summary [C40.1.1:3] 
	[BBA90C08-CBEE-4F3D-B8FD-579CDA67D929 <private>:56776<-><private>:443]
	Init: 1, Conn_Time: 111.447ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 0
	rtt_cache: kernel, rtt_upd: 11, rtt: 138.593ms, rtt_var: 40.562ms rtt_nc: 127.375ms, rtt_var_nc: 31.625ms base rtt: 100ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:40:29.615601-0500	RedLemon	Connection 40: read-side closed
default	15:40:29.615736-0500	RedLemon	Connection 40: read-side closed
default	15:40:29.615792-0500	RedLemon	Connection 40: read-side closed
default	15:40:29.616220-0500	RedLemon	Connection 40: cleaning up
default	15:40:29.616396-0500	RedLemon	[C40 542448C5-0FB6-421D-96F2-D80C820FECD9 Hostname#ce24cee7:443 quic-connection, url hash: 8f997cc5, definite, attribution: developer] cancel
default	15:40:29.616632-0500	RedLemon	[C40 542448C5-0FB6-421D-96F2-D80C820FECD9 Hostname#ce24cee7:443 quic-connection, url hash: 8f997cc5, definite, attribution: developer] cancelled
	[C40.1.1 6E8BA607-234C-4054-BEF0-2E534EAD1158 2607:fea8:995b:fd00:e5b1:b708:1baf:225d.56776<->IPv6#aa89da2d.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 6.860s, DNS @0.001s took 0.032s, TCP @0.036s took 0.112s, TLS 1.3 took 0.197s
	bytes in/out: 6918/1879, packets in/out: 19/25, rtt: 0.138s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:40:29.617661-0500	RedLemon	nw_flow_disconnected [C40.1.1 IPv6#aa89da2d.443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:40:29.618520-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C40] reporting state cancelled
default	15:40:29.618762-0500	RedLemon	Connection 40: done
default	15:40:29.618855-0500	RedLemon	tcp_output [C40.1.1:3] flags=[FP.] seq=3987468522, ack=3303744589, win=4096 state=LAST_ACK rcv_nxt=3303744589, snd_una=3987468483
error	15:40:29.745078-0500	RedLemon	tcp_input [C40.1.1:3] flags=[R.] seq=3303744589, ack=3987468522, win=501 state=LAST_ACK rcv_nxt=3303744589, snd_una=3987468483
error	15:40:29.746028-0500	RedLemon	tcp_input [C40.1.1:3] flags=[R] seq=3303744589, ack=0, win=0 state=CLOSED rcv_nxt=3303744589, snd_una=3987468483
default	15:40:30.410125-0500	runningboardd	Invalidating assertion 166-4995-1748 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:30.573914-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:30.573992-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:30.574064-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:31.303755-0500	RedLemon	Task <BE8D5CDC-D114-4258-BD8C-F3C6E60FE551>.<390> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:31.306587-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [EAE627F8-6ABD-4615-A8C8-E54CDB9F6DA0] (reporting strategy default)> on Task <BE8D5CDC-D114-4258-BD8C-F3C6E60FE551>.<390> was not selected for reporting
default	15:40:31.309750-0500	RedLemon	Task <BE8D5CDC-D114-4258-BD8C-F3C6E60FE551>.<390> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:31.310841-0500	RedLemon	Task <BE8D5CDC-D114-4258-BD8C-F3C6E60FE551>.<390> now using Connection 3
default	15:40:31.313031-0500	RedLemon	0x7fe769cedbc8 ID=476 Task <BE8D5CDC-D114-4258-BD8C-F3C6E60FE551>.<390> sent request, body N 0
default	15:40:31.368536-0500	RedLemon	0x7fe769cedbc8 ID=476 Task <BE8D5CDC-D114-4258-BD8C-F3C6E60FE551>.<390> received response, status 200 content K
default	15:40:31.369059-0500	RedLemon	Task <BE8D5CDC-D114-4258-BD8C-F3C6E60FE551>.<390> response ended
default	15:40:31.369401-0500	RedLemon	Task <BE8D5CDC-D114-4258-BD8C-F3C6E60FE551>.<390> done using Connection 3
default	15:40:31.369563-0500	RedLemon	Task <BE8D5CDC-D114-4258-BD8C-F3C6E60FE551>.<390> summary for task success {transaction_duration_ms=61, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=2, response_start_ms=60, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=false}
default	15:40:31.369760-0500	RedLemon	Task <BE8D5CDC-D114-4258-BD8C-F3C6E60FE551>.<390> finished successfully
default	15:40:31.370701-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1749 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:31.370865-0500	runningboardd	Assertion 166-4995-1749 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:31.371953-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:31.371989-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:31.372024-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:31.409118-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:32.374643-0500	runningboardd	Invalidating assertion 166-4995-1749 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:32.421803-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:32.421869-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:32.421915-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:33.275471-0500	RedLemon	Task <976F6DB1-E253-438E-B1C7-308D67E7C2D5>.<391> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:33.277390-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B73A1FCF-5E88-4E0B-9BFA-6D8B20453A89] (reporting strategy default)> on Task <976F6DB1-E253-438E-B1C7-308D67E7C2D5>.<391> was not selected for reporting
default	15:40:33.282299-0500	RedLemon	Task <976F6DB1-E253-438E-B1C7-308D67E7C2D5>.<391> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:33.283405-0500	RedLemon	Task <976F6DB1-E253-438E-B1C7-308D67E7C2D5>.<391> now using Connection 3
default	15:40:33.286330-0500	RedLemon	0x7fe768859828 ID=480 Task <976F6DB1-E253-438E-B1C7-308D67E7C2D5>.<391> sent request, body N 0
default	15:40:33.356380-0500	RedLemon	0x7fe768859828 ID=480 Task <976F6DB1-E253-438E-B1C7-308D67E7C2D5>.<391> received response, status 200 content K
default	15:40:33.357023-0500	RedLemon	Task <976F6DB1-E253-438E-B1C7-308D67E7C2D5>.<391> response ended
default	15:40:33.358802-0500	RedLemon	Task <976F6DB1-E253-438E-B1C7-308D67E7C2D5>.<391> done using Connection 3
default	15:40:33.360918-0500	RedLemon	Task <976F6DB1-E253-438E-B1C7-308D67E7C2D5>.<391> summary for task success {transaction_duration_ms=81, response_status=200, connection=3, reused=1, request_start_ms=3, request_duration_ms=2, response_start_ms=76, response_duration_ms=3, request_bytes=530, response_bytes=661, cache_hit=false}
default	15:40:33.363990-0500	RedLemon	Task <976F6DB1-E253-438E-B1C7-308D67E7C2D5>.<391> finished successfully
default	15:40:33.369462-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1751 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:33.369699-0500	runningboardd	Assertion 166-4995-1751 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:33.371000-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:33.371041-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:33.371079-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:33.393368-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:34.375921-0500	runningboardd	Invalidating assertion 166-4995-1751 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:34.477098-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:34.477140-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:34.477181-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:35.039736-0500	mDNSResponder	[R1230] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, Addr) START PID[4995](RedLemon)
default	15:40:35.041879-0500	mDNSResponder	[R1231] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, AAAA) START PID[4995](RedLemon)
default	15:40:35.043498-0500	mDNSResponder	[R1230] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, Addr) STOP PID[4995](RedLemon)
default	15:40:35.043669-0500	mDNSResponder	[R1231] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, AAAA) STOP PID[4995](RedLemon)
default	15:40:35.211401-0500	RedLemon	Task <BE0351B7-7809-4B08-8D7E-118EAD76C462>.<392> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:35.212042-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [054750CA-6175-4EB7-8940-D25169C39782] (reporting strategy default)> on Task <BE0351B7-7809-4B08-8D7E-118EAD76C462>.<392> was not selected for reporting
default	15:40:35.213032-0500	RedLemon	Task <BE0351B7-7809-4B08-8D7E-118EAD76C462>.<392> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:35.213360-0500	RedLemon	Task <BE0351B7-7809-4B08-8D7E-118EAD76C462>.<392> now using Connection 3
default	15:40:35.214478-0500	RedLemon	0x7fe7688d6978 ID=484 Task <BE0351B7-7809-4B08-8D7E-118EAD76C462>.<392> sent request, body N 0
default	15:40:35.274879-0500	RedLemon	0x7fe7688d6978 ID=484 Task <BE0351B7-7809-4B08-8D7E-118EAD76C462>.<392> received response, status 200 content K
default	15:40:35.275921-0500	RedLemon	Task <BE0351B7-7809-4B08-8D7E-118EAD76C462>.<392> response ended
default	15:40:35.276597-0500	RedLemon	Task <BE0351B7-7809-4B08-8D7E-118EAD76C462>.<392> done using Connection 3
default	15:40:35.276894-0500	RedLemon	Task <BE0351B7-7809-4B08-8D7E-118EAD76C462>.<392> summary for task success {transaction_duration_ms=64, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=62, response_duration_ms=2, request_bytes=530, response_bytes=662, cache_hit=false}
default	15:40:35.277286-0500	RedLemon	Task <BE0351B7-7809-4B08-8D7E-118EAD76C462>.<392> finished successfully
default	15:40:35.278188-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1752 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:35.278350-0500	runningboardd	Assertion 166-4995-1752 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:35.279159-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:35.279206-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:35.279262-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:35.315088-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:36.282471-0500	runningboardd	Invalidating assertion 166-4995-1752 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:36.331093-0500	mDNSResponder	[R1232] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, Addr) START PID[4995](RedLemon)
default	15:40:36.331545-0500	mDNSResponder	[R1233] DNSServiceQueryRecord(1D000, 0, <mask.hash: 'NYDjwrrB14Yb2Mm4r5D/Rg=='>, AAAA) START PID[4995](RedLemon)
default	15:40:36.332421-0500	mDNSResponder	[R1232] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, Addr) STOP PID[4995](RedLemon)
default	15:40:36.332500-0500	mDNSResponder	[R1233] DNSServiceQueryRecord(1D000, 0, <mask.hash: '7kcSMMrzMS3mEWzhOUdFgw=='>, AAAA) STOP PID[4995](RedLemon)
default	15:40:36.424865-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:36.424906-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:36.424947-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:37.293055-0500	RedLemon	Task <7D3A8800-DF66-4DD6-B8E8-144B743EB615>.<393> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:37.294246-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [8EF3C7AF-F089-47C0-82EE-4DB299D052EA] (reporting strategy default)> on Task <7D3A8800-DF66-4DD6-B8E8-144B743EB615>.<393> was not selected for reporting
default	15:40:37.297070-0500	RedLemon	Task <7D3A8800-DF66-4DD6-B8E8-144B743EB615>.<393> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:37.298073-0500	RedLemon	Task <7D3A8800-DF66-4DD6-B8E8-144B743EB615>.<393> now using Connection 3
default	15:40:37.301904-0500	RedLemon	0x7fe769ceb1b8 ID=488 Task <7D3A8800-DF66-4DD6-B8E8-144B743EB615>.<393> sent request, body N 0
default	15:40:37.374092-0500	RedLemon	0x7fe769ceb1b8 ID=488 Task <7D3A8800-DF66-4DD6-B8E8-144B743EB615>.<393> received response, status 200 content K
default	15:40:37.377387-0500	RedLemon	Task <7D3A8800-DF66-4DD6-B8E8-144B743EB615>.<393> response ended
default	15:40:37.378633-0500	RedLemon	Task <7D3A8800-DF66-4DD6-B8E8-144B743EB615>.<393> done using Connection 3
default	15:40:37.378897-0500	RedLemon	Task <7D3A8800-DF66-4DD6-B8E8-144B743EB615>.<393> summary for task success {transaction_duration_ms=83, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=3, response_start_ms=77, response_duration_ms=5, request_bytes=530, response_bytes=664, cache_hit=false}
default	15:40:37.379236-0500	RedLemon	Task <7D3A8800-DF66-4DD6-B8E8-144B743EB615>.<393> finished successfully
default	15:40:37.380669-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1753 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:37.381537-0500	runningboardd	Assertion 166-4995-1753 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:37.388211-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:37.388300-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:37.388360-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:37.413542-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:38.132198-0500	RedLemon	CoreAnimation: warning, deleted thread with uncommitted CATransaction; set CA_DEBUG_TRANSACTIONS=1 in environment to log backtraces, or set CA_ASSERT_MAIN_THREAD_TRANSACTIONS=1 to abort when an implicit transaction isn't created on a main thread.
default	15:40:38.393151-0500	runningboardd	Invalidating assertion 166-4995-1753 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:38.497998-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:38.498070-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:38.498306-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:39.267007-0500	RedLemon	Task <123C40F7-2B7F-45EB-A4E1-326ACA9C5D14>.<394> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:39.268903-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [84D2FB32-0947-424E-8F10-551F6E46C426] (reporting strategy default)> on Task <123C40F7-2B7F-45EB-A4E1-326ACA9C5D14>.<394> was not selected for reporting
default	15:40:39.272337-0500	RedLemon	Task <123C40F7-2B7F-45EB-A4E1-326ACA9C5D14>.<394> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:39.273273-0500	RedLemon	Task <123C40F7-2B7F-45EB-A4E1-326ACA9C5D14>.<394> now using Connection 3
default	15:40:39.274285-0500	RedLemon	0x7fe769cf85c8 ID=492 Task <123C40F7-2B7F-45EB-A4E1-326ACA9C5D14>.<394> sent request, body N 0
default	15:40:39.352297-0500	RedLemon	0x7fe769cf85c8 ID=492 Task <123C40F7-2B7F-45EB-A4E1-326ACA9C5D14>.<394> received response, status 200 content K
default	15:40:39.353503-0500	RedLemon	Task <123C40F7-2B7F-45EB-A4E1-326ACA9C5D14>.<394> response ended
default	15:40:39.353928-0500	RedLemon	Task <123C40F7-2B7F-45EB-A4E1-326ACA9C5D14>.<394> done using Connection 3
default	15:40:39.354218-0500	RedLemon	Task <123C40F7-2B7F-45EB-A4E1-326ACA9C5D14>.<394> summary for task success {transaction_duration_ms=83, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=1, response_start_ms=81, response_duration_ms=2, request_bytes=530, response_bytes=663, cache_hit=true}
default	15:40:39.354631-0500	RedLemon	Task <123C40F7-2B7F-45EB-A4E1-326ACA9C5D14>.<394> finished successfully
default	15:40:39.359299-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1754 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:39.361865-0500	runningboardd	Assertion 166-4995-1754 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:39.365145-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:39.365222-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:39.365288-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:39.391010-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:39.442856-0500	RedLemon	✅ Exit button triggered! x=301 <= 320, y=636 >= 600
default	15:40:39.461592-0500	RedLemon	✅ Exit button triggered! x=298 <= 320, y=622 >= 600
default	15:40:39.462565-0500	RedLemon	✅ Exit button triggered! x=297 <= 320, y=615 >= 600
default	15:40:40.174706-0500	RedLemon	Task <23FC19FE-CA6E-419E-85B2-296076D13B71>.<395> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:40.175066-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [092FADFC-9292-4192-B64E-E2C2F3AA9E71] (reporting strategy default)> on Task <23FC19FE-CA6E-419E-85B2-296076D13B71>.<395> was not selected for reporting
default	15:40:40.177102-0500	RedLemon	Task <23FC19FE-CA6E-419E-85B2-296076D13B71>.<395> summary for task success {transaction_duration_ms=1, response_status=200, cache_hit=true}
default	15:40:40.177225-0500	RedLemon	Task <23FC19FE-CA6E-419E-85B2-296076D13B71>.<395> finished successfully
default	15:40:40.375195-0500	runningboardd	Invalidating assertion 166-4995-1754 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:40.409260-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> resuming, timeouts(60.0, 604800.0) QOS(0x21) Voucher (null)
default	15:40:40.410902-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [B6195743-A3EB-41C9-AA5C-84BD249BD399] (reporting strategy default)> on Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> was not selected for reporting
default	15:40:40.414361-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:40.418847-0500	RedLemon	Connection 44: enabling TLS
default	15:40:40.418911-0500	RedLemon	Connection 44: starting, TC(0x0)
default	15:40:40.418988-0500	RedLemon	[C44 24688E43-B02E-4DB5-8066-065BBCB96857 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer, context: com.apple.CFNetwork.NSURLSession.{F72116E6-16CE-4335-8105-C924BC5A1DE1}{(null)}{Y}{2} (private), proc: FE0CF661-414B-378C-BF90-BB63A24225C8] start
default	15:40:40.419106-0500	RedLemon	[C44 Hostname#4638943b:443 initial path ((null))] event: path:start @0.000s
default	15:40:40.419634-0500	RedLemon	[C44 Hostname#4638943b:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.000s, uuid: 3C7030C7-A9D4-4607-A0DC-5B64DC962675
default	15:40:40.420068-0500	RedLemon	[C44 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:start_dns @0.001s
default	15:40:40.420114-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state preparing
default	15:40:40.421411-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> setting up Connection 44
default	15:40:40.422106-0500	mDNSResponder	[R1234] getaddrinfo start -- flags: 0xC000D000, ifindex: 0, protocols: 0, hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, options: 0x8 {use-failover}, client pid: 4995 (RedLemon)
default	15:40:40.426862-0500	mDNSResponder	[R1234] getaddrinfo stop -- hostname: <mask.hash: 'JEhby4uOrnoPlGZjDzEdDA=='>, client pid: 4995 (RedLemon)
default	15:40:40.427083-0500	RedLemon	nw_endpoint_resolver_update [C44 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] Adding endpoint handler for IPv4#880cfe6d:443
default	15:40:40.427268-0500	RedLemon	[C44 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: resolver:receive_dns @0.008s
default	15:40:40.427726-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 initial path ((null))] event: path:start @0.008s
default	15:40:40.430944-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 waiting path (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: path:satisfied @0.011s, uuid: 3BDE8D12-2292-41C0-8684-D45081E797F3
default	15:40:40.431288-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_nexus @0.012s
default	15:40:40.434324-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:receive_nexus @0.015s
default	15:40:40.436017-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.016s
default	15:40:40.436160-0500	RedLemon	tcp_output [C44.1:3] flags=[S] seq=714292152, ack=0, win=65535 state=SYN_SENT rcv_nxt=0, snd_una=714292152
default	15:40:40.487194-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:40.487286-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:40.487349-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:40.556108-0500	RedLemon	tcp_input [C44.1:3] flags=[S.] seq=3951433039, ack=714292153, win=31856 state=SYN_SENT rcv_nxt=0, snd_una=714292152
default	15:40:40.557898-0500	RedLemon	nw_flow_connected [C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:40.558319-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.139s
default	15:40:40.558460-0500	RedLemon	[C44 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.139s
default	15:40:40.561707-0500	RedLemon	boringssl_session_apply_protocol_options_for_transport_block_invoke(1745) [C44.1:2][0x7fe7688d1320] TLS configured [min_version(0x0301) max_version(0x0304) name(<private>) tickets(false) false_start(false) enforce_ev(false) enforce_ats(false) ech(false)]
default	15:40:40.562030-0500	RedLemon	boringssl_context_info_handler(2028) [C44.1:2][0x7fe7688d1320] Client handshake started
default	15:40:40.563462-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS client enter_early_data
default	15:40:40.564770-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS client read_server_hello
default	15:40:40.565793-0500	RedLemon	tcp_input [C34.1.1:3] flags=[F.] seq=3103055155, ack=2165034381, win=8 state=ESTABLISHED rcv_nxt=3103055155, snd_una=2165034381
default	15:40:40.565830-0500	RedLemon	nw_protocol_tcp_log_summary [C34.1.1:3] 
	[E29EC570-F1A3-4AA7-B823-91E1A6AB3902 <private>:56775<-><private>:443]
	Init: 1, Conn_Time: 13.396ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: process, rtt_upd: 9, rtt: 23.968ms, rtt_var: 15.375ms rtt_nc: 18.437ms, rtt_var_nc: 9.750ms base rtt: 9ms
	ACKs-compressed: 0, ACKs delayed: 11 delayed ACKs sent: 0
default	15:40:40.566215-0500	RedLemon	Connection 34: read-side closed
default	15:40:40.566245-0500	RedLemon	Connection 34: read-side closed
default	15:40:40.566711-0500	RedLemon	Connection 34: read-side closed
default	15:40:40.567208-0500	RedLemon	Connection 34: cleaning up
default	15:40:40.567361-0500	RedLemon	[C34 FE779C47-BBD6-489A-9BAC-68B59CB2E7C4 Hostname#80ea675c:443 quic-connection, url hash: 7ed9a4ad, definite, attribution: developer] cancel
default	15:40:40.567522-0500	RedLemon	[C34 FE779C47-BBD6-489A-9BAC-68B59CB2E7C4 Hostname#80ea675c:443 quic-connection, url hash: 7ed9a4ad, definite, attribution: developer] cancelled
	[C34.1.1 D1F6FFC4-E6D9-4BA6-8C8A-2E585BC1104A 2607:fea8:995b:fd00:e5b1:b708:1baf:225d.56775<->IPv6#0ba69465.443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 27.288s, DNS @0.005s took 0.051s, TCP @0.060s took 0.014s, TLS 1.3 took 0.037s
	bytes in/out: 526873/1154, packets in/out: 104/150, rtt: 0.023s, retransmitted bytes: 0, out-of-order bytes: 32531
default	15:40:40.568072-0500	RedLemon	nw_flow_disconnected [C34.1.1 IPv6#0ba69465.443 cancelled channel-flow ((null))] Output protocol disconnected
default	15:40:40.568253-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C34] reporting state cancelled
default	15:40:40.568428-0500	RedLemon	Connection 34: done
default	15:40:40.568489-0500	RedLemon	tcp_output [C34.1.1:3] flags=[FP.] seq=2165034420, ack=3103055156, win=6845 state=LAST_ACK rcv_nxt=3103055156, snd_una=2165034381
default	15:40:40.690329-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client read_hello_retry_request
default	15:40:40.690450-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client read_server_hello
default	15:40:40.690766-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client read_encrypted_extensions
default	15:40:40.691939-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client read_certificate_request
default	15:40:40.693380-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client read_server_certificate
default	15:40:40.693490-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client read_server_certificate_verify
default	15:40:40.694366-0500	RedLemon	boringssl_context_evaluate_trust_async(1631) [C44.1:2][0x7fe7688d1320] Performing external trust evaluation
default	15:40:40.694511-0500	RedLemon	boringssl_context_evaluate_trust_async_external(1616) [C44.1:2][0x7fe7688d1320] Asyncing for external verify block
default	15:40:40.694751-0500	RedLemon	Connection 44: asked to evaluate TLS Trust
default	15:40:40.695271-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> auth completion disp=1 cred=0x0
default	15:40:40.700172-0500	RedLemon	Connection 44: TLS Trust result 0
default	15:40:40.700217-0500	RedLemon	boringssl_context_evaluate_trust_async_external_block_invoke_3(1572) [C44.1:2][0x7fe7688d1320] Returning from external verify block with result: true
default	15:40:40.700263-0500	RedLemon	boringssl_context_certificate_verify_callback(1793) [C44.1:2][0x7fe7688d1320] Certificate verification result: OK
default	15:40:40.700551-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client read_server_finished
default	15:40:40.700767-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client send_end_of_early_data
default	15:40:40.700807-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client send_client_encrypted_extensions
default	15:40:40.700839-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client send_client_certificate
default	15:40:40.700866-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client complete_second_flight
default	15:40:40.700970-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS 1.3 client done
default	15:40:40.701109-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS client finish_client_handshake
default	15:40:40.701261-0500	RedLemon	boringssl_context_info_handler(2045) [C44.1:2][0x7fe7688d1320] Client handshake state: TLS client done
default	15:40:40.701304-0500	RedLemon	boringssl_context_info_handler(2034) [C44.1:2][0x7fe7688d1320] Client handshake done
default	15:40:40.701849-0500	RedLemon	nw_protocol_boringssl_signal_connected(724) [C44.1:2][0x7fe7688d1320] TLS connected [version(0x0304) ciphersuite(TLS_AES_128_GCM_SHA256) group(0x001d) signature_alg(0x0403) alpn(http/1.1) resumed(0) offered_ticket(0) false_started(0) ocsp_received(0) sct_received(0) connect_time(139ms) flight_time(128ms) rtt(127ms) write_stalls(0) read_stalls(7)]
default	15:40:40.702023-0500	RedLemon	nw_flow_connected [C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:40.702285-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.283s
default	15:40:40.702599-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state ready
default	15:40:40.702837-0500	RedLemon	[C44 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.283s
default	15:40:40.702960-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.283s
default	15:40:40.703018-0500	RedLemon	[C44 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:changed_viability @0.283s
default	15:40:40.703285-0500	RedLemon	Connection 44: connected successfully
default	15:40:40.703330-0500	RedLemon	Connection 44: TLS handshake complete
default	15:40:40.703557-0500	RedLemon	Connection 44: ready C(N) E(N)
default	15:40:40.703723-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> now using Connection 44
default	15:40:40.703809-0500	RedLemon	Connection 44: received viability advisory(Y)
default	15:40:40.704037-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> sent request, body N 0
default	15:40:40.825078-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> received response, status 101 content U
default	15:40:40.825305-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> response ended
default	15:40:40.825365-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> done using Connection 44
default	15:40:40.826122-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.407s
default	15:40:40.826394-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state preparing
default	15:40:40.827035-0500	RedLemon	[C44 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_secondary_connect @0.407s
default	15:40:40.827308-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.408s
default	15:40:40.827454-0500	RedLemon	[C44 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:start_connect @0.408s
default	15:40:40.827569-0500	RedLemon	nw_flow_connected [C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Transport protocol connected (tcp)
default	15:40:40.827730-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.408s
default	15:40:40.827802-0500	RedLemon	[C44 Hostname#4638943b:443 in_progress resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_transport @0.408s
default	15:40:40.827961-0500	RedLemon	nw_flow_connected [C44.1 IPv4#880cfe6d:443 in_progress channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol connected (CFNetworkConnection-2282961038)
default	15:40:40.828551-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.409s
default	15:40:40.828774-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state ready
default	15:40:40.828974-0500	RedLemon	[C44 Hostname#4638943b:443 ready resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:finish_connect @0.409s
default	15:40:41.009794-0500	RedLemon	tcp_input [C44.1:3] flags=[FP.] seq=3951436047, ack=714293207, win=249 state=ESTABLISHED rcv_nxt=3951436047, snd_una=714293207
default	15:40:41.009860-0500	RedLemon	nw_protocol_tcp_log_summary [C44.1:3] 
	[68083272-FA93-4C52-8385-2129A60BA2D2 <private>:57896<-><private>:443]
	Init: 1, Conn_Time: 120.378ms, SYNs: 1, WR_T: 0/0, RD_T: 0/0, TFO: 0/0/0, ECN: 0/0/0, TS: 1
	rtt_cache: kernel, rtt_upd: 4, rtt: 144.218ms, rtt_var: 29.187ms rtt_nc: 128.656ms, rtt_var_nc: 40.687ms base rtt: 121ms
	ACKs-compressed: 0, ACKs delayed: 0 delayed ACKs sent: 0
default	15:40:41.010726-0500	RedLemon	nw_flow_disconnected [C44.1 IPv4#880cfe6d:443 ready channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] Output protocol disconnected
default	15:40:41.011291-0500	RedLemon	Connection 44: read-side closed
default	15:40:41.011322-0500	RedLemon	Connection 44: read-side closed
default	15:40:41.011358-0500	RedLemon	Connection 44: read-side closed
default	15:40:41.011807-0500	RedLemon	[C44.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.592s, error Socket is not connected
default	15:40:41.011847-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state failed error Socket is not connected
default	15:40:41.011898-0500	RedLemon	[C44 Hostname#4638943b:443 failed resolver (satisfied (Path is satisfied), interface: en0, ipv4, ipv6, dns)] event: flow:disconnect @0.592s
default	15:40:41.011979-0500	RedLemon	tcp_output [C44.1:3] flags=[F.] seq=714293338, ack=3951436072, win=2048 state=LAST_ACK rcv_nxt=3951436072, snd_una=714293207
error	15:40:41.012108-0500	RedLemon	Connection 44: received failure notification
error	15:40:41.022016-0500	RedLemon	nw_read_request_report [C44] Receive failed with error "Socket is not connected"
error	15:40:41.022424-0500	RedLemon	nw_flow_service_reads [C44.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] No output handler
default	15:40:41.023466-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> summary for task success {transaction_duration_ms=611, response_status=101, connection=44, protocol="http/1.1", domain_lookup_duration_ms=7, connect_duration_ms=267, secure_connection_duration_ms=139, private_relay=false, request_start_ms=291, request_duration_ms=0, response_start_ms=411, response_duration_ms=1, request_bytes=359, response_bytes=330, cache_hit=false}
default	15:40:41.023612-0500	RedLemon	Task <A556B483-10EF-4237-BBA3-B806D0C33771>.<1> finished successfully
error	15:40:41.025095-0500	RedLemon	nw_flow_add_write_request [C44.1 IPv4#880cfe6d:443 failed channel-flow (satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns)] cannot accept write requests
error	15:40:41.025248-0500	RedLemon	nw_write_request_report [C44] Send failed with error "Socket is not connected"
default	15:40:41.025397-0500	RedLemon	Connection 44: cleaning up
default	15:40:41.025553-0500	RedLemon	[C44 24688E43-B02E-4DB5-8066-065BBCB96857 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancel
default	15:40:41.026238-0500	RedLemon	[C44 24688E43-B02E-4DB5-8066-065BBCB96857 Hostname#4638943b:443 tcp, url hash: 0081a64b, tls, definite, attribution: developer] cancelled
	[C44.1 3BDE8D12-2292-41C0-8684-D45081E797F3 10.0.0.113:57896<->IPv4#880cfe6d:443]
	Connected Path: satisfied (Path is satisfied), viable, interface: en0, ipv4, ipv6, dns
	Privacy Stance: Not Eligible
	Duration: 0.606s, DNS @0.001s took 0.007s, TCP @0.408s took 0.123s
	bytes in/out: 0/0, packets in/out: 0/0, rtt: 0.000s, retransmitted bytes: 0, out-of-order bytes: 0
default	15:40:41.029820-0500	RedLemon	nw_connection_report_state_with_handler_on_nw_queue [C44] reporting state cancelled error Socket is not connected
default	15:40:41.030308-0500	RedLemon	Connection 44: done
default	15:40:41.211183-0500	RedLemon	Task <0D0D062F-58CD-4FAA-91A0-8C66358CCB96>.<396> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:41.211806-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [C353A68A-4F43-4E52-8064-69B37884D29F] (reporting strategy default)> on Task <0D0D062F-58CD-4FAA-91A0-8C66358CCB96>.<396> was not selected for reporting
default	15:40:41.212563-0500	RedLemon	Task <0D0D062F-58CD-4FAA-91A0-8C66358CCB96>.<396> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:41.212956-0500	RedLemon	Task <0D0D062F-58CD-4FAA-91A0-8C66358CCB96>.<396> now using Connection 3
default	15:40:41.214807-0500	RedLemon	0x7fe7694300d8 ID=496 Task <0D0D062F-58CD-4FAA-91A0-8C66358CCB96>.<396> sent request, body N 0
error	15:40:41.214883-0500	RedLemon	tcp_input [C44.1:3] flags=[R] seq=3951436072, ack=0, win=0 state=LAST_ACK rcv_nxt=3951436072, snd_una=714293207
error	15:40:41.214931-0500	RedLemon	tcp_input [C44.1:3] flags=[R] seq=3951436072, ack=0, win=0 state=CLOSED rcv_nxt=3951436072, snd_una=714293207
error	15:40:41.214966-0500	RedLemon	tcp_input [C44.1:3] flags=[R] seq=3951436072, ack=0, win=0 state=CLOSED rcv_nxt=3951436072, snd_una=714293207
error	15:40:41.214998-0500	RedLemon	tcp_input [C44.1:3] flags=[R] seq=3951436072, ack=0, win=0 state=CLOSED rcv_nxt=3951436072, snd_una=714293207
error	15:40:41.215029-0500	RedLemon	tcp_input [C44.1:3] flags=[R] seq=3951436072, ack=0, win=0 state=CLOSED rcv_nxt=3951436072, snd_una=714293207
error	15:40:41.215059-0500	RedLemon	tcp_input [C44.1:3] flags=[R] seq=3951436072, ack=0, win=0 state=CLOSED rcv_nxt=3951436072, snd_una=714293207
default	15:40:41.287372-0500	RedLemon	0x7fe7694300d8 ID=496 Task <0D0D062F-58CD-4FAA-91A0-8C66358CCB96>.<396> received response, status 200 content K
default	15:40:41.288511-0500	RedLemon	Task <0D0D062F-58CD-4FAA-91A0-8C66358CCB96>.<396> response ended
default	15:40:41.289201-0500	RedLemon	Task <0D0D062F-58CD-4FAA-91A0-8C66358CCB96>.<396> done using Connection 3
default	15:40:41.289978-0500	RedLemon	Task <0D0D062F-58CD-4FAA-91A0-8C66358CCB96>.<396> summary for task success {transaction_duration_ms=77, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=1, response_start_ms=74, response_duration_ms=2, request_bytes=530, response_bytes=663, cache_hit=false}
default	15:40:41.290787-0500	RedLemon	Task <0D0D062F-58CD-4FAA-91A0-8C66358CCB96>.<396> finished successfully
default	15:40:41.293900-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1756 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:41.294419-0500	runningboardd	Assertion 166-4995-1756 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:41.297593-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:41.297635-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:41.297686-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:41.328761-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:42.301559-0500	runningboardd	Invalidating assertion 166-4995-1756 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:42.445137-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:42.445177-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:42.445216-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:43.226731-0500	RedLemon	Task <F18D60BC-228D-47C9-A369-33F01E808664>.<397> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:43.230129-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [7E868497-7DD2-4D07-93C2-59A5289A6417] (reporting strategy default)> on Task <F18D60BC-228D-47C9-A369-33F01E808664>.<397> was not selected for reporting
default	15:40:43.233434-0500	RedLemon	Task <F18D60BC-228D-47C9-A369-33F01E808664>.<397> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:43.234046-0500	RedLemon	Task <F18D60BC-228D-47C9-A369-33F01E808664>.<397> now using Connection 3
default	15:40:43.235411-0500	RedLemon	0x7fe76b098df8 ID=500 Task <F18D60BC-228D-47C9-A369-33F01E808664>.<397> sent request, body N 0
default	15:40:43.305942-0500	RedLemon	0x7fe76b098df8 ID=500 Task <F18D60BC-228D-47C9-A369-33F01E808664>.<397> received response, status 200 content K
default	15:40:43.306756-0500	RedLemon	Task <F18D60BC-228D-47C9-A369-33F01E808664>.<397> response ended
default	15:40:43.307238-0500	RedLemon	Task <F18D60BC-228D-47C9-A369-33F01E808664>.<397> done using Connection 3
default	15:40:43.307626-0500	RedLemon	Task <F18D60BC-228D-47C9-A369-33F01E808664>.<397> summary for task success {transaction_duration_ms=75, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=1, response_start_ms=73, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=false}
default	15:40:43.307897-0500	RedLemon	Task <F18D60BC-228D-47C9-A369-33F01E808664>.<397> finished successfully
default	15:40:43.309237-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1757 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:43.309443-0500	runningboardd	Assertion 166-4995-1757 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:43.311278-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:43.311440-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:43.311613-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:43.345161-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:44.330840-0500	runningboardd	Invalidating assertion 166-4995-1757 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:44.455032-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:44.455079-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:44.455121-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:44.577316-0500	runningboardd	Invalidating assertion 166-129-1723 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.coreservices.launchservicesd>:129]
default	15:40:44.712852-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:44.712923-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:44.713107-0500	runningboardd	[anon<RedLemon>(501):4995] Set darwin role to: UserInteractiveNonFocal
default	15:40:44.713180-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:44.857361-0500	runningboardd	Invalidating assertion 166-157-1743 (target:[anon<RedLemon>(501):4995]) from originator [daemon<com.apple.WindowServer(88)>:157]
default	15:40:44.887603-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:44.888775-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:44.889324-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:45.270519-0500	RedLemon	Task <C0260C8D-4327-4CC7-8AC5-F8CFDFCC48E8>.<398> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:45.279325-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [1D4BB72E-850E-4425-ABAE-67259EE82D2B] (reporting strategy default)> on Task <C0260C8D-4327-4CC7-8AC5-F8CFDFCC48E8>.<398> was not selected for reporting
default	15:40:45.282375-0500	RedLemon	Task <C0260C8D-4327-4CC7-8AC5-F8CFDFCC48E8>.<398> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:45.283019-0500	RedLemon	Task <C0260C8D-4327-4CC7-8AC5-F8CFDFCC48E8>.<398> now using Connection 3
default	15:40:45.290085-0500	RedLemon	0x7fe765997bb8 ID=504 Task <C0260C8D-4327-4CC7-8AC5-F8CFDFCC48E8>.<398> sent request, body N 0
default	15:40:45.352961-0500	RedLemon	0x7fe765997bb8 ID=504 Task <C0260C8D-4327-4CC7-8AC5-F8CFDFCC48E8>.<398> received response, status 200 content K
default	15:40:45.353427-0500	RedLemon	Task <C0260C8D-4327-4CC7-8AC5-F8CFDFCC48E8>.<398> response ended
default	15:40:45.353867-0500	RedLemon	Task <C0260C8D-4327-4CC7-8AC5-F8CFDFCC48E8>.<398> done using Connection 3
default	15:40:45.354223-0500	RedLemon	Task <C0260C8D-4327-4CC7-8AC5-F8CFDFCC48E8>.<398> summary for task success {transaction_duration_ms=73, response_status=200, connection=3, reused=1, request_start_ms=2, request_duration_ms=7, response_start_ms=72, response_duration_ms=1, request_bytes=530, response_bytes=663, cache_hit=true}
default	15:40:45.354573-0500	RedLemon	Task <C0260C8D-4327-4CC7-8AC5-F8CFDFCC48E8>.<398> finished successfully
default	15:40:45.365123-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1778 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:45.366249-0500	runningboardd	Assertion 166-4995-1778 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:45.379360-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:45.379488-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:45.379579-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:45.406579-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:46.518883-0500	runningboardd	Invalidating assertion 166-4995-1778 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:46.695724-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:46.695800-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:46.695872-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:47.210936-0500	RedLemon	Task <41BD5175-040D-487F-A2CF-796EAA59E569>.<399> resuming, timeouts(60.0, 604800.0) QOS(0x19) Voucher (null)
default	15:40:47.211333-0500	RedLemon	[Telemetry]: Activity <nw_activity 12:2 [F3845491-E711-4895-A09A-9353CC2B017A] (reporting strategy default)> on Task <41BD5175-040D-487F-A2CF-796EAA59E569>.<399> was not selected for reporting
default	15:40:47.212224-0500	RedLemon	Task <41BD5175-040D-487F-A2CF-796EAA59E569>.<399> {strength 0, tls 4, ct 0, sub 0, sig 1, ciphers 0, bundle 0, builtin 0}
default	15:40:47.212511-0500	RedLemon	Task <41BD5175-040D-487F-A2CF-796EAA59E569>.<399> now using Connection 3
default	15:40:47.213490-0500	RedLemon	0x7fe765ab0038 ID=508 Task <41BD5175-040D-487F-A2CF-796EAA59E569>.<399> sent request, body N 0
default	15:40:47.280517-0500	RedLemon	0x7fe765ab0038 ID=508 Task <41BD5175-040D-487F-A2CF-796EAA59E569>.<399> received response, status 200 content K
default	15:40:47.281374-0500	RedLemon	Task <41BD5175-040D-487F-A2CF-796EAA59E569>.<399> response ended
default	15:40:47.282036-0500	RedLemon	Task <41BD5175-040D-487F-A2CF-796EAA59E569>.<399> done using Connection 3
default	15:40:47.282265-0500	RedLemon	Task <41BD5175-040D-487F-A2CF-796EAA59E569>.<399> summary for task success {transaction_duration_ms=70, response_status=200, connection=3, reused=1, request_start_ms=0, request_duration_ms=0, response_start_ms=68, response_duration_ms=1, request_bytes=530, response_bytes=662, cache_hit=true}
default	15:40:47.282886-0500	RedLemon	Task <41BD5175-040D-487F-A2CF-796EAA59E569>.<399> finished successfully
default	15:40:47.284164-0500	runningboardd	Acquiring assertion targeting [anon<RedLemon>(501):4995] from originator [anon<RedLemon>(501):4995] with description <RBSAssertionDescriptor| "com.apple.CFNetwork.StorageDB" ID:166-4995-1779 target:4995 attributes:[
	<RBSDomainAttribute| domain:"com.apple.common" name:"FinishTaskUninterruptable" sourceEnvironment:"(null)">,
	<RBSAcquisitionCompletionAttribute| policy:AfterApplication>
	]>
default	15:40:47.284286-0500	runningboardd	Assertion 166-4995-1779 (target:[anon<RedLemon>(501):4995]) will be created as active as no start-time-defining assertions exist
default	15:40:47.284992-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:47.285038-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:47.285084-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
default	15:40:47.321584-0500	RedLemon	Connection 3: encountered bidirectional stream limit updated event
default	15:40:48.359064-0500	runningboardd	Invalidating assertion 166-4995-1779 (target:[anon<RedLemon>(501):4995]) from originator [anon<RedLemon>(501):4995]
default	15:40:48.526061-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring jetsam update because this process is not memory-managed
default	15:40:48.526108-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring suspend because this process is not lifecycle managed
default	15:40:48.526380-0500	runningboardd	[anon<RedLemon>(501):4995] Ignoring GPU update because this process is not GPU managed
